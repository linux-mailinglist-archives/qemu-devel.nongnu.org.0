Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD82140953
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 12:57:08 +0100 (CET)
Received: from localhost ([::1]:55988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isQFP-00089T-8o
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 06:57:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37822)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1isQE5-0007Qm-VM
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 06:55:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1isQE1-0007dv-8P
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 06:55:45 -0500
Received: from indium.canonical.com ([91.189.90.7]:55852)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1isQE0-0007bK-Ma
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 06:55:41 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1isQDy-0002kG-Vy
 for <qemu-devel@nongnu.org>; Fri, 17 Jan 2020 11:55:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EEF2F2E80C3
 for <qemu-devel@nongnu.org>; Fri, 17 Jan 2020 11:55:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jan 2020 11:50:33 -0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=alex.bennee@linaro.org; 
X-Launchpad-Bug-Tags: arm tcg testcase
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee alexlngw pmaydell
X-Launchpad-Bug-Reporter: Alex Longwall (alexlngw)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <157857629827.5165.2496570379985305724.malonedeb@gac.canonical.com>
 <20200110161626.31943-2-alex.bennee@linaro.org>
 <CAFEAcA9nNH9pu+8E_YYkiNtzePjZdrEBjK_9zJv+XJaSvcnhmA@mail.gmail.com>
Message-Id: <CAFEAcA_0hHjkhKtVsQEsN=Xow=W6vPvGJPJdzHh=O6RG1=_mAQ@mail.gmail.com>
Subject: [Bug 1859021] Re: [PATCH v1 1/2] target/arm: detect 64 bit overflow
 caused by high cval + voff
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="f1052173880d8dae43faa7c2fc45da1b42227143";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: c8af0e9ff1d323edb87310f71ba7969722a83bd8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.189.90.7
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1859021 <1859021@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 16 Jan 2020 at 18:45, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
> There's something odd going on with this code. Adding a bit of context:
>
>         uint64_t offset =3D timeridx =3D=3D GTIMER_VIRT ?
>                                       cpu->env.cp15.cntvoff_el2 : 0;
>         uint64_t count =3D gt_get_countervalue(&cpu->env);
>         /* Note that this must be unsigned 64 bit arithmetic: */
>         int istatus =3D count - offset >=3D gt->cval;
>         [...]
>         if (istatus) {
>             /* Next transition is when count rolls back over to zero */
>             nexttick =3D UINT64_MAX;
>         } else {
>             /* Next transition is when we hit cval */
>             nexttick =3D gt->cval + offset;
>         }
>
> I think this patch is correct, in that the 'nexttick' values
> are all absolute and this cval/offset combination implies
> that the next timer interrupt is going to be in a future
> so distant we can't even fit the duration in a uint64_t.
>
> But the other half of the 'if' also looks wrong: that's
> for the case of "timer has fired, how long until the
> wraparound causes the interrupt line to go low again?".
> UINT64_MAX is right for the EL1 case where offset is 0,
> but the offset might actually be set such that the wrap
> around happens fairly soon. We want to calculate the
> tick when (count - offset) hits 0, saturated to
> UINT64_MAX. It's getting late here and I couldn't figure
> out what that expression should be with 15 minutes of
> fiddling around with pen and paper diagrams. I'll have another
> go tomorrow if nobody else gets there first...

With a fresher brain:

For the if (istatus) branch we want the absolute tick
when (count - offset) wraps round to 0, saturated to UINT64_MAX.
I think this is:
    if (offset <=3D count) {
        nexttick =3D UINT64_MAX;
    } else {
        nexttick =3D offset;
    }

Should we consider this a separate bugfix to go in its own patch?

thanks
-- PMM

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1859021

Title:
  qemu-system-aarch64 (tcg):  cval + voff overflow not handled, causes
  qemu to hang

Status in QEMU:
  Confirmed

Bug description:
  The Armv8 architecture reference manual states that for any timer set
  (e.g. CNTP* and CNTV*), the condition for such timer to generate an
  interrupt (if enabled & unmasked) is:

  CVAL <=3D CNT(P/V)CT

  Although this is arguably sloppy coding, I have seen code that is
  therefore assuming it can set CVAL to a very high value (e.g.
  UINT64_MAX) and leave the interrupt enabled in CTL, and never get the
  interrupt.

  On latest master commit as the time of writing, there is an integer
  overflow in target/arm/helper.c gt_recalc_timer affecting the virtual
  timer when the interrupt is enabled in CTL:

      /* Next transition is when we hit cval */
      nexttick =3D gt->cval + offset;

  When this overflow happens, I notice that qemu is no longer responsive an=
d that I have to SIGKILL the process:
      - qemu takes nearly all the cpu time of the cores it is running on (e=
.g. 50% cpu usage if running on half the cores) and is completely unrespons=
ive
      - no guest interrupt (reported via -d int) is generated

  Here the minimal code example to reproduce the issue:

      mov     x0, #1
      msr     cntvoff_el2, x0
      mov     x0, #-1
      msr     cntv_cval_el0, x0
      mov     x0, #1
      msr     cntv_ctl_el0, x0 // interrupt generation enabled, not masked;=
 qemu will start to hang here

  Options used:
  -nographic -machine virt,virtualization=3Don,gic-version=3D2,accel=3Dtcg =
-cpu cortex-a57
  -smp 4 -m 1024 -kernel whatever.elf -d unimp,guest_errors,int -semihostin=
g-config enable,target=3Dnative
  -serial mon:stdio

  Version used: 4.2

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1859021/+subscriptions


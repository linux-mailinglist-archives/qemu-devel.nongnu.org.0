Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F1839B4A7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 10:12:40 +0200 (CEST)
Received: from localhost ([::1]:54094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp4wY-0001zH-1r
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 04:12:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lp4vi-0001K3-0u
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 04:11:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:38224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lp4vc-0008D4-9a
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 04:11:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lp4vW-0002g5-MI
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:11:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 739C72E81A6
 for <qemu-devel@nongnu.org>; Fri,  4 Jun 2021 08:11:24 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Jun 2021 07:42:42 -0000
From: =?utf-8?q?Alex_Benn=C3=A9e?= <1896298@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee mslade th-huth
X-Launchpad-Bug-Reporter: Michael Slade (mslade)
X-Launchpad-Bug-Modifier: =?utf-8?q?Alex_Benn=C3=A9e_=28ajbennee=29?=
References: <160046874518.13612.4861858859499751315.malonedeb@gac.canonical.com>
Message-Id: <87o8cm6oxe.fsf@linaro.org>
Subject: [Bug 1896298] Re: [RFC PATCH] accel/tcg: change default codegen
 buffer size for i386-softmmu
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b45bdbe3a00b6b668fa7f2069bd545c35c41f7f4"; Instance="production"
X-Launchpad-Hash: c62a77720d5be7e9fa92b6a79093dd29f781a341
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Reply-To: Bug 1896298 <1896298@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Richard Henderson <richard.henderson@linaro.org> writes:

> On 5/25/21 9:45 AM, Alex Benn=C3=A9e wrote:
>> There are two justifications for making this change. The first is that
>> i386 emulation is typically for smaller machines where having a 1gb of
>> generated code is overkill for basic emulation. The second is the
>> propensity of self-modifying code (c.f. Doom/edit) utilised on i386
>> systems can trigger a rapid growth in invalidated and re-translated
>> buffers. This is seen in bug #283. Execution is still inefficient but
>> at least the host memory isn't so aggressively used up.
>> That said it's still really just a sticking plaster for user
>> convenience.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Thomas Huth <thuth@redhat.com>
>> Cc: 1896298@bugs.launchpad.net
>> ---
>>   accel/tcg/translate-all.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
>> index 640ff6e3e7..f442165674 100644
>> --- a/accel/tcg/translate-all.c
>> +++ b/accel/tcg/translate-all.c
>> @@ -951,9 +951,13 @@ static void page_lock_pair(PageDesc **ret_p1, tb_pa=
ge_addr_t phys1,
>>    * Users running large scale system emulation may want to tweak their
>>    * runtime setup via the tb-size control on the command line.
>>    */
>> +#ifdef TARGET_I386
>> +#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (32 * MiB)
>> +#else
>>   #define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (1 * GiB)
>>   #endif
>>   #endif
>> +#endif
>>     #define DEFAULT_CODE_GEN_BUFFER_SIZE \
>>     (DEFAULT_CODE_GEN_BUFFER_SIZE_1 < MAX_CODE_GEN_BUFFER_SIZE \
>> =

>
> I'm not thrilled, as it is ultra-hacky.

I don't disagree.

> (1) I've got a re-org of this code out for review:
> https://patchew.org/QEMU/20210502231844.1977630-1-richard.henderson@linar=
o.org/

OK I'll have a look at that.

> (2) I'm keen to reorg TCG such that it gets compiled once.  There's
> currently nothing standing in the way of that except work.  But this
> would introduce a use of a target-specific define for the first time
> into tcg/.  I guess I could leave the default sizing back in
> accel/tcg/ and pass in the default.
>
> Other options?

Some random thoughts in no particular order:

 - a separately flushable translation region for code we detect as SMC
heavy

 - a front-end interpreter for SMC code

 - smarter code generation that dynamically loads values from codemem
   (usually the SMC code is just tweaking an #imm value)

None of these seem particularly amenable to a clean non-complex
implementation though. A front-end interpreter would be useful for other
things though - it could even be incomplete and handle only common code
patterns falling back to full generation for anything it can't handle.

>
>
> r~


-- =

Alex Benn=C3=A9e

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1896298

Title:
  TCG memory leak with FreeDOS 'edit'

Status in QEMU:
  Expired

Bug description:
  qemu trunk as of today leaks memory FAST when freedos' edit is
  running.

  To reproduce, download:

  https://www.ibiblio.org/pub/micro/pc-
  stuff/freedos/files/repositories/1.3/cdrom.iso

  Then run:

  $ qemu-system-i386 -cdrom cdrom.iso

  select your language then select "return to DOS", then type

  > edit

  it will consume memory at ~10MB/s

  This does NOT happen when adding -enable-kvm

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1896298/+subscriptions


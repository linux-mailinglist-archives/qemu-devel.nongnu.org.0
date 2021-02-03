Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE6D30D317
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 06:32:55 +0100 (CET)
Received: from localhost ([::1]:57214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Amc-0003io-Rb
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 00:32:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l7Akc-0002Lh-8E
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 00:30:50 -0500
Received: from indium.canonical.com ([91.189.90.7]:58050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l7AkY-0006DP-JH
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 00:30:50 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l7AkV-0003If-TN
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 05:30:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DA57C2E8042
 for <qemu-devel@nongnu.org>; Wed,  3 Feb 2021 05:30:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Feb 2021 05:20:31 -0000
From: P J P <1914353@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: cve security
X-Launchpad-Bug-Information-Type: Public Security
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: yes
X-Launchpad-Bug-Commenters: pjps
X-Launchpad-Bug-Reporter: P J P (pjps)
X-Launchpad-Bug-Modifier: P J P (pjps)
Message-Id: <161232963154.25287.15149381600371735783.malonedeb@wampee.canonical.com>
Subject: [Bug 1914353] [NEW] QEMU: aarch64: :GIC: out-of-bounds access via
 interrupt ID
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3d7abcb776ec05aa0a89112accc21bf8b41dfc24"; Instance="production"
X-Launchpad-Hash: 6c5ea37aa628b394635a097b6127b17075c6ca37
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1914353 <1914353@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

*** This bug is a security vulnerability ***

Public security bug reported:

Via [qemu-security] list

+-- On Sun, 31 Jan 2021, Philippe Mathieu-Daud=C3=A9 wrote --+
| On 1/31/21 11:34 AM, Philippe Mathieu-Daud=C3=A9 wrote:
| > Per the ARM Generic Interrupt Controller Architecture specification
| > (document "ARM IHI 0048B.b (ID072613)"), the SGIINTID field is 4 bit,
| > not 10:
| >
| >    - Table 4-21 GICD_SGIR bit assignments
| >
| >    The Interrupt ID of the SGI to forward to the specified CPU
| >    interfaces. The value of this field is the Interrupt ID, in
| >    the range 0-15, for example a value of 0b0011 specifies
| >    Interrupt ID 3.
| >
...
| > Correct the irq mask to fix an undefined behavior (which eventually
| > lead to a heap-buffer-overflow, see [Buglink]):
| >
| >    $ echo 'writel 0x8000f00 0xff4affb0' | qemu-system-aarch64 -M virt,a=
ccel=3Dqtest -qtest stdio
| >    [I 1612088147.116987] OPENED
| >  [R +0.278293] writel 0x8000f00 0xff4affb0
| >  ../hw/intc/arm_gic.c:1498:13: runtime error: index 944 out of bounds f=
or type 'uint8_t [16][8]'
| >  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../hw/intc/arm=
_gic.c:1498:13
| >
| > Cc: qemu-stable@nongnu.org
| > Fixes: 9ee6e8bb853 ("ARMv7 support.")
| > Buglink: https://bugs.launchpad.net/qemu/+bug/1913916
| > Buglink: https://bugs.launchpad.net/qemu/+bug/1913917
...

On 210202 1221, Peter Maydell wrote:
> In both cases the overrun is on the first writel to 0x8000f00,
> but the fuzzer has for some reason not reported that but instead
> blundered on until it happens to trigger some other issue that
> resulted from the memory corruption it induced with the first write.
>
...
> On the CVE:
>
> Since this can affect systems using KVM, this is a security bug for
> us. However, it only affects an uncommon configuration:
> you are only vulnerable if you are using "kernel-irqchip=3Doff"
> (the default is 'on', and turning it off is an odd thing to do).
>
> thanks
> -- PMM
>

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: cve security

** Information type changed from Private Security to Public Security

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1914353

Title:
  QEMU: aarch64: :GIC: out-of-bounds access via interrupt ID

Status in QEMU:
  New

Bug description:
  Via [qemu-security] list

  +-- On Sun, 31 Jan 2021, Philippe Mathieu-Daud=C3=A9 wrote --+
  | On 1/31/21 11:34 AM, Philippe Mathieu-Daud=C3=A9 wrote:
  | > Per the ARM Generic Interrupt Controller Architecture specification
  | > (document "ARM IHI 0048B.b (ID072613)"), the SGIINTID field is 4 bit,
  | > not 10:
  | >
  | >    - Table 4-21 GICD_SGIR bit assignments
  | >
  | >    The Interrupt ID of the SGI to forward to the specified CPU
  | >    interfaces. The value of this field is the Interrupt ID, in
  | >    the range 0-15, for example a value of 0b0011 specifies
  | >    Interrupt ID 3.
  | >
  ...
  | > Correct the irq mask to fix an undefined behavior (which eventually
  | > lead to a heap-buffer-overflow, see [Buglink]):
  | >
  | >    $ echo 'writel 0x8000f00 0xff4affb0' | qemu-system-aarch64 -M virt=
,accel=3Dqtest -qtest stdio
  | >    [I 1612088147.116987] OPENED
  | >  [R +0.278293] writel 0x8000f00 0xff4affb0
  | >  ../hw/intc/arm_gic.c:1498:13: runtime error: index 944 out of bounds=
 for type 'uint8_t [16][8]'
  | >  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../hw/intc/a=
rm_gic.c:1498:13
  | >
  | > Cc: qemu-stable@nongnu.org
  | > Fixes: 9ee6e8bb853 ("ARMv7 support.")
  | > Buglink: https://bugs.launchpad.net/qemu/+bug/1913916
  | > Buglink: https://bugs.launchpad.net/qemu/+bug/1913917
  ...

  On 210202 1221, Peter Maydell wrote:
  > In both cases the overrun is on the first writel to 0x8000f00,
  > but the fuzzer has for some reason not reported that but instead
  > blundered on until it happens to trigger some other issue that
  > resulted from the memory corruption it induced with the first write.
  >
  ...
  > On the CVE:
  >
  > Since this can affect systems using KVM, this is a security bug for
  > us. However, it only affects an uncommon configuration:
  > you are only vulnerable if you are using "kernel-irqchip=3Doff"
  > (the default is 'on', and turning it off is an odd thing to do).
  >
  > thanks
  > -- PMM
  >

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1914353/+subscriptions


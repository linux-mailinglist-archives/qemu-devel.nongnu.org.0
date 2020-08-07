Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D509B23ED25
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Aug 2020 14:12:01 +0200 (CEST)
Received: from localhost ([::1]:58026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k41E8-0004i4-VT
	for lists+qemu-devel@lfdr.de; Fri, 07 Aug 2020 08:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k41Ct-0004Ea-9J
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 08:10:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:57158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k41Cr-0005pn-B2
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 08:10:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k41Cp-0007as-8f
 for <qemu-devel@nongnu.org>; Fri, 07 Aug 2020 12:10:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3A6BD2E8081
 for <qemu-devel@nongnu.org>; Fri,  7 Aug 2020 12:10:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2020 11:59:28 -0000
From: Thomas Huth <1277433@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pmaydell sebastian-huber th-huth
X-Launchpad-Bug-Reporter: Sebastian Huber (sebastian-huber)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20140207101533.1830.3618.malonedeb@chaenomeles.canonical.com>
Message-Id: <159680156895.9379.5891625546079901508.launchpad@wampee.canonical.com>
Subject: [Bug 1277433] Re: GDB context is inconsistent after "monitor
 system_reset"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6a138c03da9cc3e2e03f6dd3bbb4a615b0be6ec2";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 0333f4da186a2395af35b57e90b0fc382f9ecb64
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/07 01:41:01
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1277433 <1277433@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Incomplete =3D> New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1277433

Title:
  GDB context is inconsistent after "monitor system_reset"

Status in QEMU:
  New

Bug description:
  After a "monitor system_reset" the GDB view to the system state
  differs from QEMUs processor state.

  Breakpoint 8, _ARMV4_Exception_interrupt () at /home/sh/rtems-4.11/c/src/=
../../cpukit/score/cpu/arm/arm_exc_interrupt.S:74
  74              mov     EXCHANGE_LR, lr
  (gdb) info registers
  r0             0x2027e8 2107368
  r1             0x204208 2114056
  r2             0x13     19
  r3             0x204238 2114104
  r4             0x0      0
  r5             0x0      0
  r6             0x0      0
  r7             0x0      0
  r8             0x0      0
  r9             0x0      0
  r10            0x0      0
  r11            0x0      0
  r12            0x0      0
  sp             0x201480 0x201480
  lr             0x110958 1116504
  pc             0x11073c 0x11073c <_ARMV4_Exception_interrupt+4>
  cpsr           0x192    402
  (gdb) monitor info registers
  R00=3D002027e8 R01=3D00204208 R02=3D00000013 R03=3D00204238
  R04=3D00000000 R05=3D00000000 R06=3D00000000 R07=3D00000000
  R08=3D00000000 R09=3D00000000 R10=3D00000000 R11=3D00000000
  R12=3D00000000 R13=3D00201480 R14=3D00110958 R15=3D0011073c
  PSR=3D00000192 ---- A irq32
  (gdb) monitor system_reset
  (gdb) info registers
  r0             0x2027e8 2107368
  r1             0x204208 2114056
  r2             0x13     19
  r3             0x204238 2114104
  r4             0x0      0
  r5             0x0      0
  r6             0x0      0
  r7             0x0      0
  r8             0x0      0
  r9             0x0      0
  r10            0x0      0
  r11            0x0      0
  r12            0x0      0
  sp             0x201480 0x201480
  lr             0x110958 1116504
  pc             0x11073c 0x11073c <_ARMV4_Exception_interrupt+4>
  cpsr           0x192    402
  (gdb) monitor info registers
  R00=3D00000000 R01=3D00000000 R02=3D00000000 R03=3D00000000
  R04=3D00000000 R05=3D00000000 R06=3D00000000 R07=3D00000000
  R08=3D00000000 R09=3D00000000 R10=3D00000000 R11=3D00000000
  R12=3D00000000 R13=3D00000000 R14=3D00000000 R15=3D00100040
  PSR=3D400001d3 -Z-- A svc32

  Why does the second "info registers" and "monitor info registers"
  differ?

  After a single instruction step they are synchronized at least on ARM
  (on SPARC this is different).

  (gdb) si
  bsp_start_vector_table_end () at /home/sh/rtems-4.11/c/src/lib/libbsp/arm=
/realview-pbx-a9/../shared/start/start.S:144
  144             msr     cpsr, r0
  (gdb) info registers
  r0             0xd3     211
  r1             0x0      0
  r2             0x0      0
  r3             0x0      0
  r4             0x0      0
  r5             0x0      0
  r6             0x0      0
  r7             0x0      0
  r8             0x0      0
  r9             0x0      0
  r10            0x0      0
  r11            0x0      0
  r12            0x0      0
  sp             0x0      0x0
  lr             0x0      0
  pc             0x100044 0x100044 <bsp_start_vector_table_end+4>
  cpsr           0x400001d3       1073742291
  (gdb) monitor info registers
  R00=3D000000d3 R01=3D00000000 R02=3D00000000 R03=3D00000000
  R04=3D00000000 R05=3D00000000 R06=3D00000000 R07=3D00000000
  R08=3D00000000 R09=3D00000000 R10=3D00000000 R11=3D00000000
  R12=3D00000000 R13=3D00000000 R14=3D00000000 R15=3D00100044
  PSR=3D400001d3 -Z-- A svc32

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1277433/+subscriptions


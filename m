Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5DB2E2859
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 18:22:56 +0100 (CET)
Received: from localhost ([::1]:36500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksUKF-00059e-GG
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 12:22:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ksUIA-00040o-VV
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 12:20:47 -0500
Received: from indium.canonical.com ([91.189.90.7]:39322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ksUI8-0007Mb-Ji
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 12:20:46 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ksUI5-0005V4-DO
 for <qemu-devel@nongnu.org>; Thu, 24 Dec 2020 17:20:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 59BF32E804A
 for <qemu-devel@nongnu.org>; Thu, 24 Dec 2020 17:20:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Dec 2020 17:02:02 -0000
From: Mauro Matteo Cascella <1909247@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: cve qemu security
X-Launchpad-Bug-Information-Type: Public Security
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: yes
X-Launchpad-Bug-Commenters: mauro-cascella
X-Launchpad-Bug-Reporter: Mauro Matteo Cascella (mauro-cascella)
X-Launchpad-Bug-Modifier: Mauro Matteo Cascella (mauro-cascella)
Message-Id: <160882932286.4370.15587232403500958955.malonedeb@wampee.canonical.com>
Subject: [Bug 1909247] [NEW] QEMU: use after free vulnerability in
 esp_do_dma() in hw/scsi/esp.c
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="34b3ffd45c9543b7f7aa5aa313925241e9e7ca3f"; Instance="production"
X-Launchpad-Hash: d5e3e84c0be1a4796725c2131b89b3391f10390c
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
Reply-To: Bug 1909247 <1909247@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

*** This bug is a security vulnerability ***

Public security bug reported:

A use-after-free vulnerability was found in the am53c974 SCSI host bus
adapter emulation of QEMU. It could occur in the esp_do_dma() function
in hw/scsi/esp.c while handling the 'Information Transfer' command
(CMD_TI). A privileged guest user may abuse this flaw to crash the QEMU
process on the host, resulting in a denial of service or potential code
execution with the privileges of the QEMU process.

This issue was reported by Cheolwoo Myung (Seoul National University).

Original report:
Using hypervisor fuzzer, hyfuzz, I found a use-after-free issue in
am53c974 emulator of QEMU enabled ASan.

It occurs while transferring information, as it does not check the
buffer to be transferred.

A malicious guest user/process could use this flaw to crash the QEMU
process resulting in DoS scenario.

To reproduce this issue, please run the QEMU with the following command
line.

# To enable ASan option, please set configuration with the following
$ ./configure --target-list=3Di386-softmmu --disable-werror --enable-saniti=
zers
$ make

# To reproduce this issue, please run the QEMU process with the following c=
ommand line
$ ./qemu-system-i386 -m 512 -drive file=3D./hyfuzz.img,index=3D0,media=3Ddi=
sk,format=3Draw \
-device am53c974,id=3Dscsi -device scsi-hd,drive=3DSysDisk \
-drive id=3DSysDisk,if=3Dnone,file=3D./disk.img

Please find attached the disk images to reproduce this issue.

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: cve qemu security

** Attachment added: "uaf-am53c974.tar.xz"
   https://bugs.launchpad.net/bugs/1909247/+attachment/5446614/+files/uaf-a=
m53c974.tar.xz

** Information type changed from Private Security to Public Security

** Bug watch added: Red Hat Bugzilla #1909996
   https://bugzilla.redhat.com/show_bug.cgi?id=3D1909996

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1909247

Title:
  QEMU: use after free vulnerability in esp_do_dma() in hw/scsi/esp.c

Status in QEMU:
  New

Bug description:
  A use-after-free vulnerability was found in the am53c974 SCSI host bus
  adapter emulation of QEMU. It could occur in the esp_do_dma() function
  in hw/scsi/esp.c while handling the 'Information Transfer' command
  (CMD_TI). A privileged guest user may abuse this flaw to crash the
  QEMU process on the host, resulting in a denial of service or
  potential code execution with the privileges of the QEMU process.

  This issue was reported by Cheolwoo Myung (Seoul National University).

  Original report:
  Using hypervisor fuzzer, hyfuzz, I found a use-after-free issue in
  am53c974 emulator of QEMU enabled ASan.

  It occurs while transferring information, as it does not check the
  buffer to be transferred.

  A malicious guest user/process could use this flaw to crash the QEMU
  process resulting in DoS scenario.

  To reproduce this issue, please run the QEMU with the following command
  line.

  # To enable ASan option, please set configuration with the following
  $ ./configure --target-list=3Di386-softmmu --disable-werror --enable-sani=
tizers
  $ make

  # To reproduce this issue, please run the QEMU process with the following=
 command line
  $ ./qemu-system-i386 -m 512 -drive file=3D./hyfuzz.img,index=3D0,media=3D=
disk,format=3Draw \
  -device am53c974,id=3Dscsi -device scsi-hd,drive=3DSysDisk \
  -drive id=3DSysDisk,if=3Dnone,file=3D./disk.img

  Please find attached the disk images to reproduce this issue.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1909247/+subscriptions


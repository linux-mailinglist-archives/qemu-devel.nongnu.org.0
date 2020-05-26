Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A836B1CC23C
	for <lists+qemu-devel@lfdr.de>; Sat,  9 May 2020 16:46:49 +0200 (CEST)
Received: from localhost ([::1]:60090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jXQkZ-00077k-TS
	for lists+qemu-devel@lfdr.de; Sat, 09 May 2020 10:46:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jXQjX-0006NQ-R8
 for qemu-devel@nongnu.org; Sat, 09 May 2020 10:45:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:46160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jXQjW-0000N0-Iv
 for qemu-devel@nongnu.org; Sat, 09 May 2020 10:45:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jXQjU-0001SR-MT
 for <qemu-devel@nongnu.org>; Sat, 09 May 2020 14:45:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6E4262E8024
 for <qemu-devel@nongnu.org>; Sat,  9 May 2020 14:45:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2020 14:39:18 -0000
From: Christian Schoenebeck <1877688@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: 9p virtfs
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: c3bacd17 schoenebeck
X-Launchpad-Bug-Reporter: A A (c3bacd17)
X-Launchpad-Bug-Modifier: Christian Schoenebeck (schoenebeck)
References: <158898272347.4759.14841085044555564691.malonedeb@chaenomeles.canonical.com>
Message-Id: <158903515811.4508.5449783758908417088.malone@soybean.canonical.com>
Subject: [Bug 1877688] Re: 9p virtfs device reports error when opening certain
 files
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fbdff7602bd10fb883bf7e2ddcc7fd5a16f60398";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: fe786dcf4c9fb0a70a606cc06489a50a043f072f
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/09 10:05:33
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1877688 <1877688@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looks like being introduced by this change:
https://patchwork.kernel.org/patch/11319993/

More specifically this one exactly:

-    if (buf_size  < size) {
+    if (buf_size  < P9_IOHDRSZ) {

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1877688

Title:
  9p virtfs device reports error when opening certain files

Status in QEMU:
  New

Bug description:
  Reading certain files on a 9p mounted FS produces this error message:

  qemu-system-x86_64: VirtFS reply type 117 needs 12 bytes, buffer has
  12, less than minimum

  After this error message is generated, further accesses to the 9p FS
  hangs whatever tries to access it. The Arch Linux guest system is
  otherwise usable. This happens with QEMU 5.0.0 and guest kernel
  version 5.6.11, hosted on an Arch Linux distro. I use the following
  command to launch QEMU:

  exec qemu-system-x86_64 -enable-kvm -display gtk -vga virtio -cpu host
  -m 4G -netdev tap,ifname=3Dvmtap0,id=3Dvn0,script=3Dno,downscript=3Dno -d=
evice
  virtio-net-pci,netdev=3Dvn0 -kernel kernel.img -drive
  file=3Dfile.img,format=3Draw,if=3Dvirtio -virtfs
  local,path=3Dmnt,mount_tag=3Dhost0,security_model=3Dpassthrough,id=3Dhost0
  -append "console=3DttyS0 root=3D/dev/vda rw"

  There's nothing relevant in the guest kernel logs as far as I'm aware
  of with loglevel set to 7.

  I tracked down the issue to readv() with a small buffer(<=3D12 bytes)
  and then a large buffer(>=3D 1024 bytes). A C program is provided to
  trigger this behavior.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1877688/+subscriptions


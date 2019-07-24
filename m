Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A0972A57
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jul 2019 10:44:19 +0200 (CEST)
Received: from localhost ([::1]:49736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqCsk-0004cO-0H
	for lists+qemu-devel@lfdr.de; Wed, 24 Jul 2019 04:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33959)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pavel.dovgaluk@gmail.com>) id 1hqCs7-0002gg-A0
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 04:43:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pavel.dovgaluk@gmail.com>) id 1hqCs5-0001p1-Uj
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 04:43:39 -0400
Received: from mail.ispras.ru ([83.149.199.45]:58848)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <pavel.dovgaluk@gmail.com>) id 1hqCs5-0001oc-Kh
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 04:43:37 -0400
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id B390E54006A;
 Wed, 24 Jul 2019 11:43:36 +0300 (MSK)
From: Pavel Dovgalyuk <pavel.dovgaluk@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 24 Jul 2019 11:43:36 +0300
Message-ID: <156395781647.510.3444198291663687522.stgit@pasha-Precision-3630-Tower>
In-Reply-To: <156395778867.510.17588721322993616668.stgit@pasha-Precision-3630-Tower>
References: <156395778867.510.17588721322993616668.stgit@pasha-Precision-3630-Tower>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 83.149.199.45
Subject: [Qemu-devel] [PATCH for-4.2 04/14] replay: update docs for
 record/replay with block devices
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, peter.maydell@linaro.org, pavel.dovgaluk@ispras.ru,
 pbonzini@redhat.com, quintela@redhat.com, ciro.santilli@gmail.com,
 jasowang@redhat.com, crosthwaite.peter@gmail.com, armbru@redhat.com,
 mreitz@redhat.com, alex.bennee@linaro.org, maria.klimushenkova@ispras.ru,
 mst@redhat.com, kraxel@redhat.com, boost.lists@gmail.com,
 thomas.dullien@googlemail.com, dovgaluk@ispras.ru, artem.k.pisarenko@gmail.com,
 dgilbert@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>

This patch updates the description of the command lines for using
record/replay with attached block devices.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
---
 docs/replay.txt |   12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/docs/replay.txt b/docs/replay.txt
index ee6aee9861..ce97c3f72f 100644
--- a/docs/replay.txt
+++ b/docs/replay.txt
@@ -27,7 +27,7 @@ Usage of the record/replay:
  * First, record the execution with the following command line:
     qemu-system-i386 \
      -icount shift=7,rr=record,rrfile=replay.bin \
-     -drive file=disk.qcow2,if=none,id=img-direct \
+     -drive file=disk.qcow2,if=none,snapshot,id=img-direct \
      -drive driver=blkreplay,if=none,image=img-direct,id=img-blkreplay \
      -device ide-hd,drive=img-blkreplay \
      -netdev user,id=net1 -device rtl8139,netdev=net1 \
@@ -35,7 +35,7 @@ Usage of the record/replay:
  * After recording, you can replay it by using another command line:
     qemu-system-i386 \
      -icount shift=7,rr=replay,rrfile=replay.bin \
-     -drive file=disk.qcow2,if=none,id=img-direct \
+     -drive file=disk.qcow2,if=none,snapshot,id=img-direct \
      -drive driver=blkreplay,if=none,image=img-direct,id=img-blkreplay \
      -device ide-hd,drive=img-blkreplay \
      -netdev user,id=net1 -device rtl8139,netdev=net1 \
@@ -223,7 +223,7 @@ Block devices record/replay module intercepts calls of
 bdrv coroutine functions at the top of block drivers stack.
 To record and replay block operations the drive must be configured
 as following:
- -drive file=disk.qcow2,if=none,id=img-direct
+ -drive file=disk.qcow2,if=none,snapshot,id=img-direct
  -drive driver=blkreplay,if=none,image=img-direct,id=img-blkreplay
  -device ide-hd,drive=img-blkreplay
 
@@ -252,6 +252,12 @@ This snapshot is created at start of recording and restored at start
 of replaying. It also can be loaded while replaying to roll back
 the execution.
 
+'snapshot' flag of the disk image must be removed to save the snapshots
+in the overlay (or original image) instead of using the temporary overlay.
+ -drive file=disk.ovl,if=none,id=img-direct
+ -drive driver=blkreplay,if=none,image=img-direct,id=img-blkreplay
+ -device ide-hd,drive=img-blkreplay
+
 Use QEMU monitor to create additional snapshots. 'savevm <name>' command
 created the snapshot and 'loadvm <name>' restores it. To prevent corruption
 of the original disk image, use overlay files linked to the original images.



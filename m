Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C27199858
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 16:22:55 +0200 (CEST)
Received: from localhost ([::1]:38864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJHn4-0003nJ-90
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 10:22:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50229)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <208f1fceffce2feaf7c900b29e326b967dce7762@lizzy.crudebyte.com>)
 id 1jJHmG-0003EV-Vm
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 10:22:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <208f1fceffce2feaf7c900b29e326b967dce7762@lizzy.crudebyte.com>)
 id 1jJHmE-0001wq-RD
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 10:22:04 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:52117)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71)
 (envelope-from <208f1fceffce2feaf7c900b29e326b967dce7762@lizzy.crudebyte.com>)
 id 1jJHmE-0001Q5-GC
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 10:22:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=kM38n4RhNzBA9bLRY0BJSg4Z1nUcKUBMBr0bGse8mAM=; b=N/JNU
 hFr30y/3UHvgzp703rtnNZRGKVFQsE9h8j7N9+2skaHuzP/farsdV0bq4nUA4O9cHbi9Uc7I5Xa4f
 KkvBJIS0kqmESV06ibb415JSfC33so+BX+BXSrijFaJrvJKpVO6WcOqfUNihW0NgNa1dg8luIbWHp
 4PEjcwGSu2+faEzhp7iYDMBvymJNVRpSAJPAeaFqbvC1P3CZiwAs8tbp7ldrDJeXDHp2axhPEaFoJ
 RKFEsIgTyDhPZqhNs07SOeHuoWWAtOh3C24jQxTNP+v2+n3pV/c7xVC0kKnNEY8sF+Ov/zY+GPGbl
 PSI/ajZNzjs4Tk2P9yoonQ2+vV11w==;
Message-Id: <208f1fceffce2feaf7c900b29e326b967dce7762.1585661532.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 31 Mar 2020 15:23:38 +0200
Subject: [PATCH] qemu-options.hx: 9p: clarify -virtfs vs. -fsdev
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.194.90.13
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The docs are ambiguous about the difference (or actually their
equality) between options '-virtfs' vs. '-fsdev'. So clarify that
'-virtfs' is actually just a convenience shortcut for its
generalized form '-fsdev' in conjunction with '-device virtio-9p-pci'.

And as we're at it, also be a bit more descriptive what 9pfs is
actually used for.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 qemu-options.hx | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 962a5ebaa6..fd3830c6cd 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1542,9 +1542,17 @@ SRST
 ``-virtfs proxy,sock_fd=sock_fd,mount_tag=mount_tag [,writeout=writeout][,readonly]``
   \
 ``-virtfs synth,mount_tag=mount_tag``
-    Define a new filesystem device and expose it to the guest using a
-    virtio-9p-device. The general form of a Virtual File system
-    pass-through options are:
+    Define a new virtual filesystem device and expose it to the guest using
+    a virtio-9p-device (a.k.a. 9pfs), which essentially means that a certain
+    directory on host is made directly accessible by guest as a pass-through
+    file system by using the 9P network protocol for communication between
+    host and guests, if desired even accessible, shared by several guests
+    simultaniously.
+
+    Note that ``-virtfs`` is actually just a convenience shortcut for its
+    generalized form ``-fsdev -device virtio-9p-pci``.
+
+    The general form of pass-through file system options are:
 
     ``local``
         Accesses to the filesystem are done by QEMU.
-- 
2.20.1



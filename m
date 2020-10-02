Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B468281329
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 14:51:23 +0200 (CEST)
Received: from localhost ([::1]:48722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOKWw-0007b5-Am
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 08:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <3d40fd3055d064497e7f2ec92b759dac824e55bb@lizzy.crudebyte.com>)
 id 1kOKVJ-0006IR-1p
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 08:49:41 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:49785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <3d40fd3055d064497e7f2ec92b759dac824e55bb@lizzy.crudebyte.com>)
 id 1kOKVH-00082r-EU
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 08:49:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=61K9IPek47Lb/jUIgvqHI9x1BIex8Psn2YIHGCS3rpk=; b=B+UZX
 RvxdX7SDrk+Z0B7EOukhDM5vOzLRCOQGgCN4yu6z3sWXDdkcRaoLkZTPIlw2H30kIhGjqZslxvFJw
 QeTiyFZT1ghA4THo4pSMwDlSuGIFv/1MEo3a/ler766bpVQCKQxZCTvXF9fXs2pUzpLtCgRD39XgZ
 iBXZcgfakUIs3xR9/qVPDrRoVs0au9ZkcVOTOfJF/vF4d2Ae6FXexxu6ObjtM3TUs0CszNcAEQKwT
 JHoK4lu3X8IaszOF+jCZR5gGBdqFBdyHiuaGSjIQieOx2IzNS72TFsUIahgo7499v+DIL/AldPdaq
 kD2BHOPGI8ZlbDUe+Kx16G5qRHRGg==;
Message-Id: <3d40fd3055d064497e7f2ec92b759dac824e55bb.1601639563.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1601639563.git.qemu_oss@crudebyte.com>
References: <cover.1601639563.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 2 Oct 2020 13:51:54 +0200
Subject: [PATCH v2 07/11] tests/9pfs: change qtest name prefix to synth
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=3d40fd3055d064497e7f2ec92b759dac824e55bb@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/02 08:18:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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

All existing 9pfs test cases are using the 'synth' fs driver so far, which
means they are not accessing real files, but a purely simulated (in RAM
only) file system.

Let's make this clear by changing the prefix of the individual qtest case
names from 'fs/' to 'synth/'. That way they'll be easily distinguishable
from upcoming new 9pfs test cases supposed to be using a different fs
driver.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/virtio-9p-test.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index de30b717b6..3281153b9c 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -897,26 +897,26 @@ static void fs_readdir_split_512(void *obj, void *data,
 
 static void register_virtio_9p_test(void)
 {
-    qos_add_test("config", "virtio-9p", pci_config, NULL);
-    qos_add_test("fs/version/basic", "virtio-9p", fs_version, NULL);
-    qos_add_test("fs/attach/basic", "virtio-9p", fs_attach, NULL);
-    qos_add_test("fs/walk/basic", "virtio-9p", fs_walk, NULL);
-    qos_add_test("fs/walk/no_slash", "virtio-9p", fs_walk_no_slash,
+    qos_add_test("synth/config", "virtio-9p", pci_config, NULL);
+    qos_add_test("synth/version/basic", "virtio-9p", fs_version, NULL);
+    qos_add_test("synth/attach/basic", "virtio-9p", fs_attach, NULL);
+    qos_add_test("synth/walk/basic", "virtio-9p", fs_walk, NULL);
+    qos_add_test("synth/walk/no_slash", "virtio-9p", fs_walk_no_slash,
                  NULL);
-    qos_add_test("fs/walk/dotdot_from_root", "virtio-9p",
+    qos_add_test("synth/walk/dotdot_from_root", "virtio-9p",
                  fs_walk_dotdot, NULL);
-    qos_add_test("fs/lopen/basic", "virtio-9p", fs_lopen, NULL);
-    qos_add_test("fs/write/basic", "virtio-9p", fs_write, NULL);
-    qos_add_test("fs/flush/success", "virtio-9p", fs_flush_success,
+    qos_add_test("synth/lopen/basic", "virtio-9p", fs_lopen, NULL);
+    qos_add_test("synth/write/basic", "virtio-9p", fs_write, NULL);
+    qos_add_test("synth/flush/success", "virtio-9p", fs_flush_success,
                  NULL);
-    qos_add_test("fs/flush/ignored", "virtio-9p", fs_flush_ignored,
+    qos_add_test("synth/flush/ignored", "virtio-9p", fs_flush_ignored,
                  NULL);
-    qos_add_test("fs/readdir/basic", "virtio-9p", fs_readdir, NULL);
-    qos_add_test("fs/readdir/split_512", "virtio-9p",
+    qos_add_test("synth/readdir/basic", "virtio-9p", fs_readdir, NULL);
+    qos_add_test("synth/readdir/split_512", "virtio-9p",
                  fs_readdir_split_512, NULL);
-    qos_add_test("fs/readdir/split_256", "virtio-9p",
+    qos_add_test("synth/readdir/split_256", "virtio-9p",
                  fs_readdir_split_256, NULL);
-    qos_add_test("fs/readdir/split_128", "virtio-9p",
+    qos_add_test("synth/readdir/split_128", "virtio-9p",
                  fs_readdir_split_128, NULL);
 }
 
-- 
2.20.1



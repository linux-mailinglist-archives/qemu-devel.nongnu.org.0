Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 655348DEE2
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Aug 2019 22:33:34 +0200 (CEST)
Received: from localhost ([::1]:35774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxzxc-0005nE-Po
	for lists+qemu-devel@lfdr.de; Wed, 14 Aug 2019 16:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33425)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1hxznt-0004aA-BH
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 16:23:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1hxzns-0004Nb-8V
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 16:23:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50722)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1hxznp-0004Lh-WC; Wed, 14 Aug 2019 16:23:26 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 508653175298;
 Wed, 14 Aug 2019 20:23:25 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 47A7D10001B8;
 Wed, 14 Aug 2019 20:23:21 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 14 Aug 2019 23:22:17 +0300
Message-Id: <20190814202219.1870-12-mlevitsk@redhat.com>
In-Reply-To: <20190814202219.1870-1-mlevitsk@redhat.com>
References: <20190814202219.1870-1-mlevitsk@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Wed, 14 Aug 2019 20:23:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 11/13] block/qcow2: implement the encryption
 key managment
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the main purpose of the patchset, to enaable
us to manage luks like header, embedded in the qcow2
image, which standard cryptosetup tools don't support.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 block/qcow2.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/block/qcow2.c b/block/qcow2.c
index 039bdc2f7e..a87e58f36a 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -5086,6 +5086,31 @@ void qcow2_signal_corruption(BlockDriverState *bs, bool fatal, int64_t offset,
     s->signaled_corruption = true;
 }
 
+
+static int qcow2_setup_encryption(BlockDriverState *bs,
+                                  enum BlkSetupEncryptionAction action,
+                                  QCryptoEncryptionSetupOptions *options,
+                                  bool force,
+                                  Error **errp)
+{
+    BDRVQcow2State *s = bs->opaque;
+
+    if (!s->crypto) {
+        error_setg(errp, "Can't manage encryption - image is not encrypted");
+        return -EINVAL;
+    }
+
+    return qcrypto_block_setup_encryption(s->crypto,
+                                          qcow2_crypto_hdr_read_func,
+                                          qcow2_crypto_hdr_write_func,
+                                          bs,
+                                          action,
+                                          options,
+                                          force,
+                                          errp);
+}
+
+
 static QemuOptsList qcow2_create_opts = {
     .name = "qcow2-create-opts",
     .head = QTAILQ_HEAD_INITIALIZER(qcow2_create_opts.head),
@@ -5232,6 +5257,8 @@ BlockDriver bdrv_qcow2 = {
     .bdrv_reopen_bitmaps_rw = qcow2_reopen_bitmaps_rw,
     .bdrv_can_store_new_dirty_bitmap = qcow2_can_store_new_dirty_bitmap,
     .bdrv_remove_persistent_dirty_bitmap = qcow2_remove_persistent_dirty_bitmap,
+
+    .bdrv_setup_encryption = qcow2_setup_encryption,
 };
 
 static void bdrv_qcow2_init(void)
-- 
2.17.2



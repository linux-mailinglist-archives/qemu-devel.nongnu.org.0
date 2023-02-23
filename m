Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BD76A0FD7
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 19:55:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVGho-000779-5s; Thu, 23 Feb 2023 13:52:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhb-00070y-C6
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhZ-0003Fd-Ix
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677178341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gyPnP6uoUuSZ+QQsWtJUfaOBuq8JS2ltvmKgcVci0/8=;
 b=cDmB36tr/UbEzi57nY7gNdTmx9la8MlSym7jfyJQsBtXmVcl+C9m13zGB6DlSRCQMDyNgc
 QmTn5pOtUL5iur/LRHZL1DoJSlYCaDvRg2frP7unN8BSWhK7SQO8tU5GJhzXLvWOLxXEH3
 mMZxGkqliy1mxw/wrCsXG9A1e4X+XEc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-GPJmaVM5O0qvMfXilh-eTA-1; Thu, 23 Feb 2023 13:52:17 -0500
X-MC-Unique: GPJmaVM5O0qvMfXilh-eTA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60AF3802D2A;
 Thu, 23 Feb 2023 18:52:17 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD2971121314;
 Thu, 23 Feb 2023 18:52:16 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 28/29] block/rbd: Add luks-any encryption opening option
Date: Thu, 23 Feb 2023 19:51:45 +0100
Message-Id: <20230223185146.306454-29-kwolf@redhat.com>
In-Reply-To: <20230223185146.306454-1-kwolf@redhat.com>
References: <20230223185146.306454-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Or Ozeri <oro@il.ibm.com>

Ceph RBD encryption API required specifying the encryption format
for loading encryption. The supported formats were LUKS (v1) and LUKS2.

Starting from Reef release, RBD also supports loading with "luks-any" format,
which works for both versions of LUKS.

This commit extends the qemu rbd driver API to enable qemu users to use
this luks-any wildcard format.

Signed-off-by: Or Ozeri <oro@il.ibm.com>
Message-Id: <20230129113120.722708-3-oro@oro.sl.cloud9.ibm.com>
Reviewed-by: Ilya Dryomov <idryomov@gmail.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/block-core.json | 16 ++++++++++++++--
 block/rbd.c          | 19 +++++++++++++++++++
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 7f331eb8ea..5f09b1d31a 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -3922,10 +3922,12 @@
 ##
 # @RbdImageEncryptionFormat:
 #
+# @luks-any: Used for opening either luks or luks2 (Since 8.0)
+#
 # Since: 6.1
 ##
 { 'enum': 'RbdImageEncryptionFormat',
-  'data': [ 'luks', 'luks2' ] }
+  'data': [ 'luks', 'luks2', 'luks-any' ] }
 
 ##
 # @RbdEncryptionOptionsLUKSBase:
@@ -3967,6 +3969,15 @@
   'base': 'RbdEncryptionOptionsLUKSBase',
   'data': { } }
 
+##
+# @RbdEncryptionOptionsLUKSAny:
+#
+# Since: 8.0
+##
+{ 'struct': 'RbdEncryptionOptionsLUKSAny',
+  'base': 'RbdEncryptionOptionsLUKSBase',
+  'data': { } }
+
 ##
 # @RbdEncryptionCreateOptionsLUKS:
 #
@@ -3994,7 +4005,8 @@
   'base': { 'format': 'RbdImageEncryptionFormat' },
   'discriminator': 'format',
   'data': { 'luks': 'RbdEncryptionOptionsLUKS',
-            'luks2': 'RbdEncryptionOptionsLUKS2' } }
+            'luks2': 'RbdEncryptionOptionsLUKS2',
+            'luks-any': 'RbdEncryptionOptionsLUKSAny'} }
 
 ##
 # @RbdEncryptionCreateOptions:
diff --git a/block/rbd.c b/block/rbd.c
index 4bd75c9bb7..744f84c222 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -469,6 +469,9 @@ static int qemu_rbd_encryption_load(rbd_image_t image,
     g_autofree char *passphrase = NULL;
     rbd_encryption_luks1_format_options_t luks_opts;
     rbd_encryption_luks2_format_options_t luks2_opts;
+#ifdef LIBRBD_SUPPORTS_ENCRYPTION_LOAD2
+    rbd_encryption_luks_format_options_t luks_any_opts;
+#endif
     rbd_encryption_format_t format;
     rbd_encryption_options_t opts;
     size_t opts_size;
@@ -502,6 +505,22 @@ static int qemu_rbd_encryption_load(rbd_image_t image,
             luks2_opts.passphrase = passphrase;
             break;
         }
+#ifdef LIBRBD_SUPPORTS_ENCRYPTION_LOAD2
+        case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS_ANY: {
+            memset(&luks_any_opts, 0, sizeof(luks_any_opts));
+            format = RBD_ENCRYPTION_FORMAT_LUKS;
+            opts = &luks_any_opts;
+            opts_size = sizeof(luks_any_opts);
+            r = qemu_rbd_convert_luks_options(
+                    qapi_RbdEncryptionOptionsLUKSAny_base(&encrypt->u.luks_any),
+                    &passphrase, &luks_any_opts.passphrase_size, errp);
+            if (r < 0) {
+                return r;
+            }
+            luks_any_opts.passphrase = passphrase;
+            break;
+        }
+#endif
         default: {
             r = -ENOTSUP;
             error_setg_errno(
-- 
2.39.2



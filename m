Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 227EE6A0FD8
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 19:55:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVGhx-00078W-4k; Thu, 23 Feb 2023 13:52:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhY-0006yy-Vi
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhW-0003ER-LA
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677178338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oUB96iEf8D3+hhXsE8FlQ2IWhxJiAJqsEBpFmNj3UWk=;
 b=bQJiLEy+t71ZGYFmjsHlywPPia5bw8eVxI3m+BLy5fjCZ9s2UvRZ4PdyxeOUGM+bNum54j
 aRtIFjQSTkJLjaFOv0VbiTmbVe7yQy9KTATdl/V95vw0oQqlK+wnrai+iiBB9vjqAIldVi
 pV/8tk7acN0LRx0OsN0Z+F2qkzcN3Os=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-UvlSCbezM1a4BjnqlEPB7A-1; Thu, 23 Feb 2023 13:52:16 -0500
X-MC-Unique: UvlSCbezM1a4BjnqlEPB7A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74738800050;
 Thu, 23 Feb 2023 18:52:16 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF3981121314;
 Thu, 23 Feb 2023 18:52:15 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 27/29] block/rbd: Remove redundant stack variable passphrase_len
Date: Thu, 23 Feb 2023 19:51:44 +0100
Message-Id: <20230223185146.306454-28-kwolf@redhat.com>
In-Reply-To: <20230223185146.306454-1-kwolf@redhat.com>
References: <20230223185146.306454-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

Signed-off-by: Or Ozeri <oro@il.ibm.com>
Message-Id: <20230129113120.722708-2-oro@oro.sl.cloud9.ibm.com>
Reviewed-by: Ilya Dryomov <idryomov@gmail.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/rbd.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index 5e102fea0d..4bd75c9bb7 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -386,7 +386,6 @@ static int qemu_rbd_encryption_format(rbd_image_t image,
 {
     int r = 0;
     g_autofree char *passphrase = NULL;
-    size_t passphrase_len;
     rbd_encryption_format_t format;
     rbd_encryption_options_t opts;
     rbd_encryption_luks1_format_options_t luks_opts;
@@ -408,12 +407,12 @@ static int qemu_rbd_encryption_format(rbd_image_t image,
             opts_size = sizeof(luks_opts);
             r = qemu_rbd_convert_luks_create_options(
                     qapi_RbdEncryptionCreateOptionsLUKS_base(&encrypt->u.luks),
-                    &luks_opts.alg, &passphrase, &passphrase_len, errp);
+                    &luks_opts.alg, &passphrase, &luks_opts.passphrase_size,
+                    errp);
             if (r < 0) {
                 return r;
             }
             luks_opts.passphrase = passphrase;
-            luks_opts.passphrase_size = passphrase_len;
             break;
         }
         case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS2: {
@@ -424,12 +423,12 @@ static int qemu_rbd_encryption_format(rbd_image_t image,
             r = qemu_rbd_convert_luks_create_options(
                     qapi_RbdEncryptionCreateOptionsLUKS2_base(
                             &encrypt->u.luks2),
-                    &luks2_opts.alg, &passphrase, &passphrase_len, errp);
+                    &luks2_opts.alg, &passphrase, &luks2_opts.passphrase_size,
+                    errp);
             if (r < 0) {
                 return r;
             }
             luks2_opts.passphrase = passphrase;
-            luks2_opts.passphrase_size = passphrase_len;
             break;
         }
         default: {
@@ -468,7 +467,6 @@ static int qemu_rbd_encryption_load(rbd_image_t image,
 {
     int r = 0;
     g_autofree char *passphrase = NULL;
-    size_t passphrase_len;
     rbd_encryption_luks1_format_options_t luks_opts;
     rbd_encryption_luks2_format_options_t luks2_opts;
     rbd_encryption_format_t format;
@@ -483,12 +481,11 @@ static int qemu_rbd_encryption_load(rbd_image_t image,
             opts_size = sizeof(luks_opts);
             r = qemu_rbd_convert_luks_options(
                     qapi_RbdEncryptionOptionsLUKS_base(&encrypt->u.luks),
-                    &passphrase, &passphrase_len, errp);
+                    &passphrase, &luks_opts.passphrase_size, errp);
             if (r < 0) {
                 return r;
             }
             luks_opts.passphrase = passphrase;
-            luks_opts.passphrase_size = passphrase_len;
             break;
         }
         case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS2: {
@@ -498,12 +495,11 @@ static int qemu_rbd_encryption_load(rbd_image_t image,
             opts_size = sizeof(luks2_opts);
             r = qemu_rbd_convert_luks_options(
                     qapi_RbdEncryptionOptionsLUKS2_base(&encrypt->u.luks2),
-                    &passphrase, &passphrase_len, errp);
+                    &passphrase, &luks2_opts.passphrase_size, errp);
             if (r < 0) {
                 return r;
             }
             luks2_opts.passphrase = passphrase;
-            luks2_opts.passphrase_size = passphrase_len;
             break;
         }
         default: {
-- 
2.39.2



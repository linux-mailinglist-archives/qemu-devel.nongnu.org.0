Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 794976A86EE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:39:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlvN-0003HM-K9; Thu, 02 Mar 2023 11:36:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlus-00027I-Fq
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:36:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXluq-0000Wr-Pt
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:36:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iohvYxnlsFkTs80QzBwxrL4Ns4Cl14mSBPw0iwzLhU0=;
 b=ODH0pRfNRKdw4/VBM7tfsEDrSD3KERIOpTy/1SopS40kLNxEetTSixIAONcGQ4GXKi+hcg
 bOUYAEZr8AAIzfY1WAlUhGnz4HLHhf1ktbgettlbmlYCk3c/D+iO0u/JKrvbfYOcKlwiAh
 t9fJnUdXuEUC3+sf9L0ywuv32H+wJZg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-xYoUimqzPUCyTT7gngvmvw-1; Thu, 02 Mar 2023 11:36:20 -0500
X-MC-Unique: xYoUimqzPUCyTT7gngvmvw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0393100F908;
 Thu,  2 Mar 2023 16:36:19 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E207E492C3E;
 Thu,  2 Mar 2023 16:36:17 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Hailiang Zhang <zhanghailiang@xfusion.com>, Fam Zheng <fam@euphon.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH 39/43] migration: Create migrate_tls_creds() function
Date: Thu,  2 Mar 2023 17:34:06 +0100
Message-Id: <20230302163410.11399-40-quintela@redhat.com>
In-Reply-To: <20230302163410.11399-1-quintela@redhat.com>
References: <20230302163410.11399-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/options.h | 1 +
 migration/options.c | 7 +++++++
 migration/tls.c     | 9 ++++-----
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/migration/options.h b/migration/options.h
index 1d63c4069c..78cb936aba 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -82,6 +82,7 @@ MultiFDCompression migrate_multifd_compression(void);
 int migrate_multifd_zlib_level(void);
 int migrate_multifd_zstd_level(void);
 uint8_t migrate_throttle_trigger_threshold(void);
+char *migrate_tls_creds(void);
 uint64_t migrate_xbzrle_cache_size(void);
 
 /* parameters setters */
diff --git a/migration/options.c b/migration/options.c
index 79187c3be0..41bb2d2959 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -583,6 +583,13 @@ uint8_t migrate_throttle_trigger_threshold(void)
     return s->parameters.throttle_trigger_threshold;
 }
 
+char *migrate_tls_creds(void)
+{
+    MigrationState *s = migrate_get_current();
+
+    return s->parameters.tls_creds;
+}
+
 uint64_t migrate_xbzrle_cache_size(void)
 {
     MigrationState *s = migrate_get_current();
diff --git a/migration/tls.c b/migration/tls.c
index acd38e0b62..0d318516de 100644
--- a/migration/tls.c
+++ b/migration/tls.c
@@ -34,20 +34,19 @@ migration_tls_get_creds(MigrationState *s,
                         Error **errp)
 {
     Object *creds;
+    char *tls_creds = migrate_tls_creds();
     QCryptoTLSCreds *ret;
 
-    creds = object_resolve_path_component(
-        object_get_objects_root(), s->parameters.tls_creds);
+    creds = object_resolve_path_component(object_get_objects_root(), tls_creds);
     if (!creds) {
-        error_setg(errp, "No TLS credentials with id '%s'",
-                   s->parameters.tls_creds);
+        error_setg(errp, "No TLS credentials with id '%s'", tls_creds);
         return NULL;
     }
     ret = (QCryptoTLSCreds *)object_dynamic_cast(
         creds, TYPE_QCRYPTO_TLS_CREDS);
     if (!ret) {
         error_setg(errp, "Object with id '%s' is not TLS credentials",
-                   s->parameters.tls_creds);
+                   tls_creds);
         return NULL;
     }
     if (!qcrypto_tls_creds_check_endpoint(ret, endpoint, errp)) {
-- 
2.39.2



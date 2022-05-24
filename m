Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1198A5329BA
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 13:52:49 +0200 (CEST)
Received: from localhost ([::1]:51794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntT5i-00078h-Ps
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 07:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ntSKy-0006Ap-Or
 for qemu-devel@nongnu.org; Tue, 24 May 2022 07:04:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ntSJt-0003aZ-NU
 for qemu-devel@nongnu.org; Tue, 24 May 2022 07:04:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653390192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NAVSYPk4vrJH8E6jm6Z5xwmYGQH1/cDJ/WTrPGvpn9I=;
 b=cpVy0cAHDgVDoU9PVQc9mLVy0pwsBFlyDWa0KZSwJNNgNoqU010q4Pq4QYoRhedhqy9tnN
 Rzwvj5psCUqg6LjnBE357vzDzIFhtb6pBAZyHriCoq36WEyGTwv1LKB9N0wB4PXmDSkpcb
 aZ2tyLk3WAaZhDRFcW72MH+yX/fJsIM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-184-z4t7eKnCNwan_mKqarHstQ-1; Tue, 24 May 2022 07:03:11 -0400
X-MC-Unique: z4t7eKnCNwan_mKqarHstQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC8823C1E321;
 Tue, 24 May 2022 11:03:10 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B2971121315;
 Tue, 24 May 2022 11:03:09 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PATCH 19/20] migration: remove the QEMUFileOps 'get_return_path'
 callback
Date: Tue, 24 May 2022 12:02:34 +0100
Message-Id: <20220524110235.145079-20-berrange@redhat.com>
In-Reply-To: <20220524110235.145079-1-berrange@redhat.com>
References: <20220524110235.145079-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This directly implements the get_return_path logic using QIOChannel APIs.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/qemu-file-channel.c | 16 ----------------
 migration/qemu-file.c         | 22 ++++++++++------------
 migration/qemu-file.h         |  6 ------
 3 files changed, 10 insertions(+), 34 deletions(-)

diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
index 2e139f7bcd..51717c1137 100644
--- a/migration/qemu-file-channel.c
+++ b/migration/qemu-file-channel.c
@@ -32,27 +32,11 @@
 #include "yank_functions.h"
 
 
-static QEMUFile *channel_get_input_return_path(void *opaque)
-{
-    QIOChannel *ioc = QIO_CHANNEL(opaque);
-
-    return qemu_fopen_channel_output(ioc);
-}
-
-static QEMUFile *channel_get_output_return_path(void *opaque)
-{
-    QIOChannel *ioc = QIO_CHANNEL(opaque);
-
-    return qemu_fopen_channel_input(ioc);
-}
-
 static const QEMUFileOps channel_input_ops = {
-    .get_return_path = channel_get_input_return_path,
 };
 
 
 static const QEMUFileOps channel_output_ops = {
-    .get_return_path = channel_get_output_return_path,
 };
 
 
diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 72a6f58af5..dfee808924 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -92,18 +92,6 @@ int qemu_file_shutdown(QEMUFile *f)
     return ret;
 }
 
-/*
- * Result: QEMUFile* for a 'return path' for comms in the opposite direction
- *         NULL if not available
- */
-QEMUFile *qemu_file_get_return_path(QEMUFile *f)
-{
-    if (!f->ops->get_return_path) {
-        return NULL;
-    }
-    return f->ops->get_return_path(f->ioc);
-}
-
 bool qemu_file_mode_is_not_valid(const char *mode)
 {
     if (mode == NULL ||
@@ -131,6 +119,16 @@ static QEMUFile *qemu_file_new_impl(QIOChannel *ioc,
     return f;
 }
 
+/*
+ * Result: QEMUFile* for a 'return path' for comms in the opposite direction
+ *         NULL if not available
+ */
+QEMUFile *qemu_file_get_return_path(QEMUFile *f)
+{
+    object_ref(f->ioc);
+    return qemu_file_new_impl(f->ioc, f->ops, !f->is_writable);
+}
+
 QEMUFile *qemu_file_new_output(QIOChannel *ioc, const QEMUFileOps *ops)
 {
     return qemu_file_new_impl(ioc, ops, true);
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index 542c637934..5370e4e5ec 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -55,13 +55,7 @@ typedef size_t (QEMURamSaveFunc)(QEMUFile *f,
                                  size_t size,
                                  uint64_t *bytes_sent);
 
-/*
- * Return a QEMUFile for comms in the opposite direction
- */
-typedef QEMUFile *(QEMURetPathFunc)(void *opaque);
-
 typedef struct QEMUFileOps {
-    QEMURetPathFunc *get_return_path;
 } QEMUFileOps;
 
 typedef struct QEMUFileHooks {
-- 
2.36.1



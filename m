Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AFE5576F9
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 11:47:08 +0200 (CEST)
Received: from localhost ([::1]:36800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4JQZ-0007QH-OF
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 05:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o4J8j-0000QQ-Oi
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 05:28:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o4J8h-0004wZ-1y
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 05:28:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655976518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vnuuJxp1JQdRXdU3c7OwH3ZR1JMW18zg+RAsQ+upqKY=;
 b=OUIFUgNwaIZWECqFM10AN3DRlz8jC1jlN8f7aUZ7LI6qAUFB7B7UR7gCXdn/AKRIqokPOq
 KW3Y29XoA5FbZs5YZJHyUsyKMzNcZ1ZxKjgOtHMuZElhrrJv5wph3orq6TuQ+wMK0wvcUb
 vt5M60z4WcdNGqWVZXICRtkZ57m1ISg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-s61bWEEwNCy2U15KvIKfHA-1; Thu, 23 Jun 2022 05:28:37 -0400
X-MC-Unique: s61bWEEwNCy2U15KvIKfHA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA5A1804190;
 Thu, 23 Jun 2022 09:28:36 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCF4140D282F;
 Thu, 23 Jun 2022 09:28:35 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, huangy81@chinatelecom.cn,
 quintela@redhat.com, leobras@redhat.com, peterx@redhat.com
Cc: jdenemar@redhat.com
Subject: [PULL 17/33] migration: introduce new constructors for QEMUFile
Date: Thu, 23 Jun 2022 10:27:54 +0100
Message-Id: <20220623092810.96234-18-dgilbert@redhat.com>
In-Reply-To: <20220623092810.96234-1-dgilbert@redhat.com>
References: <20220623092810.96234-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Daniel P. Berrangé <berrange@redhat.com>

Prepare for the elimination of QEMUFileOps by introducing a pair of new
constructors. This lets us distinguish between an input and output file
object explicitly rather than via the existance of specific callbacks.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/qemu-file-channel.c |  4 ++--
 migration/qemu-file.c         | 18 ++++++++++++++++--
 migration/qemu-file.h         |  3 ++-
 3 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
index ce8eced417..5cb8ac93c0 100644
--- a/migration/qemu-file-channel.c
+++ b/migration/qemu-file-channel.c
@@ -184,11 +184,11 @@ static const QEMUFileOps channel_output_ops = {
 QEMUFile *qemu_fopen_channel_input(QIOChannel *ioc)
 {
     object_ref(OBJECT(ioc));
-    return qemu_fopen_ops(ioc, &channel_input_ops);
+    return qemu_file_new_input(ioc, &channel_input_ops);
 }
 
 QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc)
 {
     object_ref(OBJECT(ioc));
-    return qemu_fopen_ops(ioc, &channel_output_ops);
+    return qemu_file_new_output(ioc, &channel_output_ops);
 }
diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 30e2160041..2d6ceb53af 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -38,6 +38,7 @@ struct QEMUFile {
     const QEMUFileOps *ops;
     const QEMUFileHooks *hooks;
     QIOChannel *ioc;
+    bool is_writable;
 
     /*
      * Maximum amount of data in bytes to transfer during one
@@ -111,7 +112,9 @@ bool qemu_file_mode_is_not_valid(const char *mode)
     return false;
 }
 
-QEMUFile *qemu_fopen_ops(QIOChannel *ioc, const QEMUFileOps *ops)
+static QEMUFile *qemu_file_new_impl(QIOChannel *ioc,
+                                    const QEMUFileOps *ops,
+                                    bool is_writable)
 {
     QEMUFile *f;
 
@@ -119,10 +122,21 @@ QEMUFile *qemu_fopen_ops(QIOChannel *ioc, const QEMUFileOps *ops)
 
     f->ioc = ioc;
     f->ops = ops;
+    f->is_writable = is_writable;
 
     return f;
 }
 
+QEMUFile *qemu_file_new_output(QIOChannel *ioc, const QEMUFileOps *ops)
+{
+    return qemu_file_new_impl(ioc, ops, true);
+}
+
+QEMUFile *qemu_file_new_input(QIOChannel *ioc, const QEMUFileOps *ops)
+{
+    return qemu_file_new_impl(ioc, ops, false);
+}
+
 
 void qemu_file_set_hooks(QEMUFile *f, const QEMUFileHooks *hooks)
 {
@@ -181,7 +195,7 @@ void qemu_file_set_error(QEMUFile *f, int ret)
 
 bool qemu_file_is_writable(QEMUFile *f)
 {
-    return f->ops->writev_buffer;
+    return f->is_writable;
 }
 
 static void qemu_iovec_release_ram(QEMUFile *f)
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index 3a1ecc0e34..3c93a27978 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -118,7 +118,8 @@ typedef struct QEMUFileHooks {
     QEMURamSaveFunc *save_page;
 } QEMUFileHooks;
 
-QEMUFile *qemu_fopen_ops(QIOChannel *ioc, const QEMUFileOps *ops);
+QEMUFile *qemu_file_new_input(QIOChannel *ioc, const QEMUFileOps *ops);
+QEMUFile *qemu_file_new_output(QIOChannel *ioc, const QEMUFileOps *ops);
 void qemu_file_set_hooks(QEMUFile *f, const QEMUFileHooks *hooks);
 int qemu_get_fd(QEMUFile *f);
 int qemu_fclose(QEMUFile *f);
-- 
2.36.1



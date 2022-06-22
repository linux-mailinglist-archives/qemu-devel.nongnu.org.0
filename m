Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D93C553FAD
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 02:52:31 +0200 (CEST)
Received: from localhost ([::1]:48098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3obe-000632-BF
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 20:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3oCY-0003ZY-P3
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 20:26:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3oCW-0006B8-Hn
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 20:26:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655857592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lvEhFBNMgrTBeJs6+tHpDvdLbybo6LjkAAuRPKsRYMs=;
 b=i9K38E6/aRz+oGB5SFLVkpR2Qzt574wsFL8p61MDo3X4ti/deUctyJr3Jrv9Q8RKlNGyKv
 Mj0JyJ+3dSMfuPr9bVlIBS4D240ir/1ouKQ1DkGNlg1OGC4eYtWHmyo+OBGGvqhVe+ARSf
 wKpxfdlIvaezxfGLTvLuOS/owgiJOXc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-V-apk1C4P7iqXBmuZ46ljg-1; Tue, 21 Jun 2022 20:26:26 -0400
X-MC-Unique: V-apk1C4P7iqXBmuZ46ljg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB7F52999B42;
 Wed, 22 Jun 2022 00:26:25 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32564141510D;
 Wed, 22 Jun 2022 00:26:24 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hailiang Zhang <zhanghailiang@xfusion.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PULL 17/25] migration: introduce new constructors for QEMUFile
Date: Wed, 22 Jun 2022 02:25:39 +0200
Message-Id: <20220622002547.64784-18-quintela@redhat.com>
In-Reply-To: <20220622002547.64784-1-quintela@redhat.com>
References: <20220622002547.64784-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
---
 migration/qemu-file.h         |  3 ++-
 migration/qemu-file-channel.c |  4 ++--
 migration/qemu-file.c         | 18 ++++++++++++++++--
 3 files changed, 20 insertions(+), 5 deletions(-)

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
index ce48d7a5d8..c181686e41 100644
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
-- 
2.35.3



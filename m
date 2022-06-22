Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5D0553FA4
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 02:44:18 +0200 (CEST)
Received: from localhost ([::1]:34134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3oTh-0004We-Dj
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 20:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3oCJ-000307-Vo
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 20:26:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3oCH-000681-Um
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 20:26:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655857577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CPBWZfErhAM4slp3Mz2qGpDeLQlgqtlF8ezmEOPOA/g=;
 b=CTBUJE4j8UjJen4U24JOYYN4eNQt1Kk8C9F86kdtI2cXXYpHO/GrK5JAy6EpuXFnDQFkGy
 XInuZQBEMg7Dq4whVZf3ayJeWN7TmH4ixGb/1HHnnrZxX0yOS4PTMJtAd/Sfm0SahjA5RN
 x5WsqzUFzqTbqjjUNd5L98Jlsy0hg3c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-ZHKqQtM3MMyIYtB2BMVvGA-1; Tue, 21 Jun 2022 20:26:14 -0400
X-MC-Unique: ZHKqQtM3MMyIYtB2BMVvGA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C99251C08969;
 Wed, 22 Jun 2022 00:26:13 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FC60141510D;
 Wed, 22 Jun 2022 00:26:11 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hailiang Zhang <zhanghailiang@xfusion.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PULL 11/25] migration: rename qemu_update_position to
 qemu_file_credit_transfer
Date: Wed, 22 Jun 2022 02:25:33 +0200
Message-Id: <20220622002547.64784-12-quintela@redhat.com>
In-Reply-To: <20220622002547.64784-1-quintela@redhat.com>
References: <20220622002547.64784-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

The qemu_update_position method name gives the misleading impression
that it is changing the current file offset. Most of the files are
just streams, however, so there's no concept of a file offset in the
general case.

What this method is actually used for is to report on the number of
bytes that have been transferred out of band from the main I/O methods.
This new name better reflects this purpose.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/qemu-file.h | 9 ++++++++-
 migration/qemu-file.c | 4 ++--
 migration/ram.c       | 2 +-
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index 05f6aef903..d96f5f7118 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -179,7 +179,14 @@ int qemu_put_qemu_file(QEMUFile *f_des, QEMUFile *f_src);
  */
 int qemu_peek_byte(QEMUFile *f, int offset);
 void qemu_file_skip(QEMUFile *f, int size);
-void qemu_update_position(QEMUFile *f, size_t size);
+/*
+ * qemu_file_credit_transfer:
+ *
+ * Report on a number of bytes that have been transferred
+ * out of band from the main file object I/O methods. This
+ * accounting information tracks the total migration traffic.
+ */
+void qemu_file_credit_transfer(QEMUFile *f, size_t size);
 void qemu_file_reset_rate_limit(QEMUFile *f);
 void qemu_file_update_transfer(QEMUFile *f, int64_t len);
 void qemu_file_set_rate_limit(QEMUFile *f, int64_t new_rate);
diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 664ac77067..9a7f715e17 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -319,7 +319,7 @@ size_t ram_control_save_page(QEMUFile *f, ram_addr_t block_offset,
         if (ret != RAM_SAVE_CONTROL_DELAYED &&
             ret != RAM_SAVE_CONTROL_NOT_SUPP) {
             if (bytes_sent && *bytes_sent > 0) {
-                qemu_update_position(f, *bytes_sent);
+                qemu_file_credit_transfer(f, *bytes_sent);
             } else if (ret < 0) {
                 qemu_file_set_error(f, ret);
             }
@@ -374,7 +374,7 @@ static ssize_t qemu_fill_buffer(QEMUFile *f)
     return len;
 }
 
-void qemu_update_position(QEMUFile *f, size_t size)
+void qemu_file_credit_transfer(QEMUFile *f, size_t size)
 {
     f->total_transferred += size;
 }
diff --git a/migration/ram.c b/migration/ram.c
index 89082716d6..bf321e1e72 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2301,7 +2301,7 @@ void acct_update_position(QEMUFile *f, size_t size, bool zero)
     } else {
         ram_counters.normal += pages;
         ram_transferred_add(size);
-        qemu_update_position(f, size);
+        qemu_file_credit_transfer(f, size);
     }
 }
 
-- 
2.35.3



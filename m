Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFB6557741
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 11:57:50 +0200 (CEST)
Received: from localhost ([::1]:55194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Jav-0003sp-W0
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 05:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o4J8b-0000Dj-6i
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 05:28:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o4J8Z-0004vT-HB
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 05:28:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655976510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m8UIex5y8Cqbvlnm8bpbZVn/LSkleyC/SRlNKq6rkKA=;
 b=cgdpm7Ll7po0WSY00zCZ6qY+6CMMmzkI/0HAw86PAb5VMtDmr4bJDAdUw088RunlLMB/5y
 cfeVO27zu5ZRk71SQlOI6UYVZOJzG4HEkFxKzEQqL+IhwQVJdipYP9dYvxAdSG5We884EX
 OsYwnGNJ9O6BqWr5kGMACAuzgpJxR0I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-YTBxYEySNOe_w__noHoSpg-1; Thu, 23 Jun 2022 05:28:29 -0400
X-MC-Unique: YTBxYEySNOe_w__noHoSpg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A7D4101AA45;
 Thu, 23 Jun 2022 09:28:29 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5EB9B40D282F;
 Thu, 23 Jun 2022 09:28:28 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, huangy81@chinatelecom.cn,
 quintela@redhat.com, leobras@redhat.com, peterx@redhat.com
Cc: jdenemar@redhat.com
Subject: [PULL 11/33] migration: rename qemu_update_position to
 qemu_file_credit_transfer
Date: Thu, 23 Jun 2022 10:27:48 +0100
Message-Id: <20220623092810.96234-12-dgilbert@redhat.com>
In-Reply-To: <20220623092810.96234-1-dgilbert@redhat.com>
References: <20220623092810.96234-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/qemu-file.c | 4 ++--
 migration/qemu-file.h | 9 ++++++++-
 migration/ram.c       | 2 +-
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 7ee9b5bf05..f73b010d39 100644
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
2.36.1



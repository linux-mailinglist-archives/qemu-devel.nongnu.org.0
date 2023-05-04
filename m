Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EE06F6A3E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 13:40:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puXIX-0005zf-MR; Thu, 04 May 2023 07:38:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puXIU-0005ws-0U
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:38:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puXIS-0003Jq-J2
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:38:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683200332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fBxLXCUKQ1lqm8OSyhhYYOS1mnphvtYRXxmgOCvVVTY=;
 b=dxhb5Ejp8OD1QRGZfwd4J6ck1mGF0MIKDmzc9n3SaT9NnUIr8+SqmmjaeYBNqwdIRr1ozV
 kfQXYBcQOc4i7c1JKJ5U+ndNEvnqKh6LJ1HUmA8269tHKS61oMlaPa3K4M3jZRynAoOOmw
 WDYHKW4vamEN8RkZXZRkamcUtq7vDh0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-rc3RWV_HOBKuHEXfXu_sXQ-1; Thu, 04 May 2023 07:38:50 -0400
X-MC-Unique: rc3RWV_HOBKuHEXfXu_sXQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A7BA886462;
 Thu,  4 May 2023 11:38:50 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE7292166B30;
 Thu,  4 May 2023 11:38:48 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Fam Zheng <fam@euphon.net>, Peter Xu <peterx@redhat.com>
Subject: [PATCH 4/9] qemu-file: Make rate_limit_used an uint64_t
Date: Thu,  4 May 2023 13:38:36 +0200
Message-Id: <20230504113841.23130-5-quintela@redhat.com>
In-Reply-To: <20230504113841.23130-1-quintela@redhat.com>
References: <20230504113841.23130-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Change all the functions that use it.  It was already passed as
uint64_t.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/qemu-file.c | 4 ++--
 migration/qemu-file.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index b322b363cf..5aa990b82a 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -48,7 +48,7 @@ struct QEMUFile {
      * Total amount of data in bytes queued for transfer
      * during this rate limiting time window
      */
-    int64_t rate_limit_used;
+    uint64_t rate_limit_used;
 
     /* The sum of bytes transferred on the wire */
     int64_t total_transferred;
@@ -769,7 +769,7 @@ void qemu_file_reset_rate_limit(QEMUFile *f)
     f->rate_limit_used = 0;
 }
 
-void qemu_file_acct_rate_limit(QEMUFile *f, int64_t len)
+void qemu_file_acct_rate_limit(QEMUFile *f, uint64_t len)
 {
     f->rate_limit_used += len;
 }
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index 9e158c00f6..55ef5a2ac7 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -137,7 +137,7 @@ void qemu_file_reset_rate_limit(QEMUFile *f);
  * out of band from the main file object I/O methods, and
  * need to be applied to the rate limiting calcuations
  */
-void qemu_file_acct_rate_limit(QEMUFile *f, int64_t len);
+void qemu_file_acct_rate_limit(QEMUFile *f, uint64_t len);
 void qemu_file_set_rate_limit(QEMUFile *f, uint64_t new_rate);
 uint64_t qemu_file_get_rate_limit(QEMUFile *f);
 int qemu_file_get_error_obj(QEMUFile *f, Error **errp);
-- 
2.40.0



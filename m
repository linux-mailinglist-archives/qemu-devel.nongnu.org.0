Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A89551780
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 13:36:51 +0200 (CEST)
Received: from localhost ([::1]:51074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Fi6-0007Ww-Mj
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 07:36:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3FBZ-0004B7-C9
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 07:03:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3FBX-0007ou-Ph
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 07:03:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655722991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YZLrUiVagUPeFVD5YiZAfX1mBn01HIwLe/pLvSHwT6M=;
 b=Kb3h+BB02/5lpfJD0Jea4uUjI6dPNr1cUiA6/ZZknUPKdI97gkNHJCqo7ebMwEg0dV+rjJ
 oySMyovoyk8NpuX7WNbLnrolXENzdVxCmfAvT5AlgTDGtB5MwdHC5oCb8u9kSvYcOThlpd
 pqPd3QbXl8Hcg6HvVoHEqUn0DdAPZuQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-345-afgzHJ56NdWzwqwoETE8Gg-1; Mon, 20 Jun 2022 07:02:39 -0400
X-MC-Unique: afgzHJ56NdWzwqwoETE8Gg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0895B802C17;
 Mon, 20 Jun 2022 11:02:23 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3B16C2810D;
 Mon, 20 Jun 2022 11:02:21 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Fam Zheng <fam@euphon.net>, Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: [PATCH v2 08/21] migration: rename qemu_file_update_transfer to
 qemu_file_acct_rate_limit
Date: Mon, 20 Jun 2022 12:01:52 +0100
Message-Id: <20220620110205.1357829-9-berrange@redhat.com>
In-Reply-To: <20220620110205.1357829-1-berrange@redhat.com>
References: <20220620110205.1357829-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

The qemu_file_update_transfer name doesn't give a clear guide on what
its purpose is, and how it differs from the qemu_file_credit_transfer
method. The latter is specifically for accumulating for total migration
traffic, while the former is specifically for accounting in thue rate
limit calculations. The new name give better guidance on its usage.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/multifd.c   | 4 ++--
 migration/qemu-file.c | 2 +-
 migration/qemu-file.h | 9 ++++++++-
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 9282ab6aa4..684c014c86 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -435,7 +435,7 @@ static int multifd_send_pages(QEMUFile *f)
     p->pages = pages;
     transferred = ((uint64_t) pages->num) * qemu_target_page_size()
                 + p->packet_len;
-    qemu_file_update_transfer(f, transferred);
+    qemu_file_acct_rate_limit(f, transferred);
     ram_counters.multifd_bytes += transferred;
     ram_counters.transferred += transferred;
     qemu_mutex_unlock(&p->mutex);
@@ -610,7 +610,7 @@ int multifd_send_sync_main(QEMUFile *f)
         p->packet_num = multifd_send_state->packet_num++;
         p->flags |= MULTIFD_FLAG_SYNC;
         p->pending_job++;
-        qemu_file_update_transfer(f, p->packet_len);
+        qemu_file_acct_rate_limit(f, p->packet_len);
         ram_counters.multifd_bytes += p->packet_len;
         ram_counters.transferred += p->packet_len;
         qemu_mutex_unlock(&p->mutex);
diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 9a7f715e17..6bbdb60d4d 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -704,7 +704,7 @@ void qemu_file_reset_rate_limit(QEMUFile *f)
     f->rate_limit_used = 0;
 }
 
-void qemu_file_update_transfer(QEMUFile *f, int64_t len)
+void qemu_file_acct_rate_limit(QEMUFile *f, int64_t len)
 {
     f->rate_limit_used += len;
 }
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index d96f5f7118..901f2cf697 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -188,7 +188,14 @@ void qemu_file_skip(QEMUFile *f, int size);
  */
 void qemu_file_credit_transfer(QEMUFile *f, size_t size);
 void qemu_file_reset_rate_limit(QEMUFile *f);
-void qemu_file_update_transfer(QEMUFile *f, int64_t len);
+/*
+ * qemu_file_acct_rate_limit:
+ *
+ * Report on a number of bytes the have been transferred
+ * out of band from the main file object I/O methods, and
+ * need to be applied to the rate limiting calcuations
+ */
+void qemu_file_acct_rate_limit(QEMUFile *f, int64_t len);
 void qemu_file_set_rate_limit(QEMUFile *f, int64_t new_rate);
 int64_t qemu_file_get_rate_limit(QEMUFile *f);
 int qemu_file_get_error_obj(QEMUFile *f, Error **errp);
-- 
2.36.1



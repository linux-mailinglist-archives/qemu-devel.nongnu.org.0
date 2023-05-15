Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC880702CCC
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 14:35:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXPv-00070s-Nl; Mon, 15 May 2023 08:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyXOz-0006T7-OK
 for qemu-devel@nongnu.org; Mon, 15 May 2023 08:34:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyXOt-0003MH-LF
 for qemu-devel@nongnu.org; Mon, 15 May 2023 08:34:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684154041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Q9N5+WD+9qH+TkM6MjDSCGr3Du7RKNkPvAxZvkRQFY=;
 b=H9XAh/R5TYuYyOi6YkgnhmEcNQLMfZHrShwMG14D4rr9gm9+f0NysVFS27dtBqKw35QjPh
 YXalTAl+JgFKHHy1oWQZpX00jUwCjZnAau9FI/lYSbb1ayXOIPbrJieU8G5thSuCZ+NUed
 sjA7WQl1ejl41EUd6OZdRxA70a42ReQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-w9Kw_ah_Meq60OjcrYSluQ-1; Mon, 15 May 2023 08:33:57 -0400
X-MC-Unique: w9Kw_ah_Meq60OjcrYSluQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0606B1854CA0;
 Mon, 15 May 2023 12:33:57 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B41763F5F;
 Mon, 15 May 2023 12:33:54 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 09/11] qemu-file: make qemu_file_[sg]et_rate_limit() use an
 uint64_t
Date: Mon, 15 May 2023 14:33:32 +0200
Message-Id: <20230515123334.58995-10-quintela@redhat.com>
In-Reply-To: <20230515123334.58995-1-quintela@redhat.com>
References: <20230515123334.58995-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

It is really size_t.  Everything else uses uint64_t, so move this to
uint64_t as well.  A size can't be negative anyways.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20230508130909.65420-5-quintela@redhat.com>
---
 migration/qemu-file.h | 4 ++--
 migration/qemu-file.c | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index 4ee58a87dd..13c7c78c0d 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -139,8 +139,8 @@ void qemu_file_reset_rate_limit(QEMUFile *f);
  * need to be applied to the rate limiting calcuations
  */
 void qemu_file_acct_rate_limit(QEMUFile *f, int64_t len);
-void qemu_file_set_rate_limit(QEMUFile *f, int64_t new_rate);
-int64_t qemu_file_get_rate_limit(QEMUFile *f);
+void qemu_file_set_rate_limit(QEMUFile *f, uint64_t new_rate);
+uint64_t qemu_file_get_rate_limit(QEMUFile *f);
 int qemu_file_get_error_obj(QEMUFile *f, Error **errp);
 int qemu_file_get_error_obj_any(QEMUFile *f1, QEMUFile *f2, Error **errp);
 void qemu_file_set_error_obj(QEMUFile *f, int ret, Error *err);
diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 60f6345033..94d1069c8e 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -44,7 +44,7 @@ struct QEMUFile {
      * Maximum amount of data in bytes to transfer during one
      * rate limiting time window
      */
-    int64_t rate_limit_max;
+    uint64_t rate_limit_max;
     /*
      * Total amount of data in bytes queued for transfer
      * during this rate limiting time window
@@ -738,12 +738,12 @@ int qemu_file_rate_limit(QEMUFile *f)
     return 0;
 }
 
-int64_t qemu_file_get_rate_limit(QEMUFile *f)
+uint64_t qemu_file_get_rate_limit(QEMUFile *f)
 {
     return f->rate_limit_max;
 }
 
-void qemu_file_set_rate_limit(QEMUFile *f, int64_t limit)
+void qemu_file_set_rate_limit(QEMUFile *f, uint64_t limit)
 {
     /*
      * 'limit' is per second.  But we check it each 100 miliseconds.
-- 
2.40.1



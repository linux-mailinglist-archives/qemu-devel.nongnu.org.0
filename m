Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A576FB0EA
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 15:11:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw0d6-0003gn-Js; Mon, 08 May 2023 09:10:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw0d0-0003fy-1m
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:10:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw0cu-0000zS-W4
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:10:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683551404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FD13sygxW3Jcptff0lDq6unYwnKy8R527CfsZIqXBQY=;
 b=AWoL9Y8rReRAf2mfeDg84A6khIrkTM1S6NeAwzB85z3YZMIYHpqyVE59jhEdpWPrHukR5t
 jT7fiZRp77S6UHHt3LBsyLiYu1Ui4V+/SUWYm65kY8TSMzm0Q0vcz69wg5zbeEIG9lBNA9
 Uf05NtG3DIqGwj8zhNaK0OFa4InZ6T0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-80-bh_unPGONKmaoXENtLUoUA-1; Mon, 08 May 2023 09:09:57 -0400
X-MC-Unique: bh_unPGONKmaoXENtLUoUA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E72C8280605F;
 Mon,  8 May 2023 13:09:56 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 275EA2166B40;
 Mon,  8 May 2023 13:09:53 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Leonardo Bras <leobras@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 04/21] qemu-file: make qemu_file_[sg]et_rate_limit() use an
 uint64_t
Date: Mon,  8 May 2023 15:08:52 +0200
Message-Id: <20230508130909.65420-5-quintela@redhat.com>
In-Reply-To: <20230508130909.65420-1-quintela@redhat.com>
References: <20230508130909.65420-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

It is really size_t.  Everything else uses uint64_t, so move this to
uint64_t as well.  A size can't be negative anyways.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20230504113841.23130-4-quintela@redhat.com>

---

Don't drop the check if rate_limit_max is zero.
---
 migration/qemu-file.c | 6 +++---
 migration/qemu-file.h | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 12cf7fb04e..346b683929 100644
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
@@ -741,12 +741,12 @@ int qemu_file_rate_limit(QEMUFile *f)
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
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index 4f26bf6961..04ca48cbef 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -138,8 +138,8 @@ void qemu_file_reset_rate_limit(QEMUFile *f);
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
-- 
2.40.0



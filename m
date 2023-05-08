Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A3F6FB135
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 15:17:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw0e7-0004Z6-VA; Mon, 08 May 2023 09:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw0d5-0003mS-Px
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:10:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw0cx-0000zm-Ok
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:10:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683551405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5rp022K/cF/xFfzjk00dh7oy4g2njIAS+QRouSOLaW0=;
 b=FHoibeN+YZCI1CpAjwXcDGdVBC0/8eiA2fyqSm8UxHiK31g+ocrUQ8GAoJ3jyCuhIiwjuN
 1aeO/hgNoIsaE1Wqd9oG6SJelTSgrQgUmJJ1kVyl7eAZAFdiALZxJqSOYYaD2QFoMpx9Xf
 bd45HzenQLImuss1pgGJEOYAKsqsgZA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-SYF2vH3yP3GSZ8WsZM4wRg-1; Mon, 08 May 2023 09:10:02 -0400
X-MC-Unique: SYF2vH3yP3GSZ8WsZM4wRg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26D5E181E070;
 Mon,  8 May 2023 13:10:01 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B8B32166B40;
 Mon,  8 May 2023 13:09:57 +0000 (UTC)
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
 Leonardo Bras <leobras@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 05/21] qemu-file: Make rate_limit_used an uint64_t
Date: Mon,  8 May 2023 15:08:53 +0200
Message-Id: <20230508130909.65420-6-quintela@redhat.com>
In-Reply-To: <20230508130909.65420-1-quintela@redhat.com>
References: <20230508130909.65420-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Change all the functions that use it.  It was already passed as
uint64_t.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230504113841.23130-5-quintela@redhat.com>
---
 migration/qemu-file.c | 4 ++--
 migration/qemu-file.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 346b683929..f3cb0cd94f 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -49,7 +49,7 @@ struct QEMUFile {
      * Total amount of data in bytes queued for transfer
      * during this rate limiting time window
      */
-    int64_t rate_limit_used;
+    uint64_t rate_limit_used;
 
     /* The sum of bytes transferred on the wire */
     uint64_t total_transferred;
@@ -759,7 +759,7 @@ void qemu_file_reset_rate_limit(QEMUFile *f)
     f->rate_limit_used = 0;
 }
 
-void qemu_file_acct_rate_limit(QEMUFile *f, int64_t len)
+void qemu_file_acct_rate_limit(QEMUFile *f, uint64_t len)
 {
     f->rate_limit_used += len;
 }
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index 04ca48cbef..d758e7f10b 100644
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



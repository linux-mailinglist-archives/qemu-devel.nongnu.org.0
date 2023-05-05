Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E03BE6F7A34
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 02:51:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujd1-0004Lg-1a; Thu, 04 May 2023 20:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pujcw-0004Iz-Ip
 for qemu-devel@nongnu.org; Thu, 04 May 2023 20:48:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pujcv-0001KI-2i
 for qemu-devel@nongnu.org; Thu, 04 May 2023 20:48:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683247728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X6w8sOJRe6wCelxSx0qtSHd7pwjwIwAdKWeFp1YCBlo=;
 b=hrNybDvaYFoM45ef4QOVq+TP2a4lTl7nLVz4RAc/A1OWbV8+Wy1DJh062Q4C2rpL2YadQj
 3lrSJqZx8h+u0HLy8SCDQdzBYx0sdb0XUX74qqc1/4YqnXeU0aLHxuDaYC2cwSovw2T+LW
 G8S6GWE03mCv1OAPeYhp+US1/86RHtk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-LSzXgEC4MJ6u1Hy6rLSM4g-1; Thu, 04 May 2023 20:48:45 -0400
X-MC-Unique: LSzXgEC4MJ6u1Hy6rLSM4g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5140101A531;
 Fri,  5 May 2023 00:48:44 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F5EC404B24D;
 Fri,  5 May 2023 00:48:42 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Leonardo Bras <leobras@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 14/16] qemu-file: remove shutdown member
Date: Fri,  5 May 2023 02:48:10 +0200
Message-Id: <20230505004812.31583-15-quintela@redhat.com>
In-Reply-To: <20230505004812.31583-1-quintela@redhat.com>
References: <20230505004812.31583-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

The first thing that we do after setting the shutdown value is set the
error as -EIO if there is not a previous error.

So this value is redundant.  Just remove it and use
qemu_file_get_error() in the places that it was tested.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Message-Id: <20230504113841.23130-7-quintela@redhat.com>
---
 migration/qemu-file.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index a4ea808b15..11b510aa29 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -63,8 +63,6 @@ struct QEMUFile {
 
     int last_error;
     Error *last_error_obj;
-    /* has the file has been shutdown */
-    bool shutdown;
 };
 
 /*
@@ -78,8 +76,6 @@ int qemu_file_shutdown(QEMUFile *f)
 {
     int ret = 0;
 
-    f->shutdown = true;
-
     /*
      * We must set qemufile error before the real shutdown(), otherwise
      * there can be a race window where we thought IO all went though
@@ -294,7 +290,7 @@ void qemu_fflush(QEMUFile *f)
         return;
     }
 
-    if (f->shutdown) {
+    if (qemu_file_get_error(f)) {
         return;
     }
     if (f->iovcnt > 0) {
@@ -397,7 +393,7 @@ static ssize_t coroutine_mixed_fn qemu_fill_buffer(QEMUFile *f)
     f->buf_index = 0;
     f->buf_size = pending;
 
-    if (f->shutdown) {
+    if (qemu_file_get_error(f)) {
         return 0;
     }
 
@@ -486,7 +482,7 @@ static int add_to_iovec(QEMUFile *f, const uint8_t *buf, size_t size,
     } else {
         if (f->iovcnt >= MAX_IOV_SIZE) {
             /* Should only happen if a previous fflush failed */
-            assert(f->shutdown || !qemu_file_is_writable(f));
+            assert(qemu_file_get_error(f) || !qemu_file_is_writable(f));
             return 1;
         }
         if (may_free) {
-- 
2.40.0



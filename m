Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BB46F6A39
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 13:40:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puXIa-00061J-V4; Thu, 04 May 2023 07:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puXIZ-00060q-EM
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:38:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puXIX-0003LX-Sj
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:38:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683200337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zPjdX9HrhoF9f4wyXV9lCrCfM561XXgGOBZEPAW9fS8=;
 b=O02fAGSZYbjuOOO+GnIvL91PxafUTgB8/drt9flrflDt7utMI0+/dJObQxYwXl3L6Vl2BQ
 Dp2rhDu0tpEVpAmDVpNPrC0B2+iGoKbjAX9K84V5YCe3j+GssOvAtucMg/2LE5NaCoUWIp
 +MzJQ0rWUdXUPMqzhrr+PanelTz/xu0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-ztZcLCgCPSCuHHR7kIXIgA-1; Thu, 04 May 2023 07:38:53 -0400
X-MC-Unique: ztZcLCgCPSCuHHR7kIXIgA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25731101A531;
 Thu,  4 May 2023 11:38:53 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8AE72166B30;
 Thu,  4 May 2023 11:38:51 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Fam Zheng <fam@euphon.net>, Peter Xu <peterx@redhat.com>
Subject: [PATCH 6/9] qemu-file: remove shutdown member
Date: Thu,  4 May 2023 13:38:38 +0200
Message-Id: <20230504113841.23130-7-quintela@redhat.com>
In-Reply-To: <20230504113841.23130-1-quintela@redhat.com>
References: <20230504113841.23130-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

So this value is reduntant.  Just remove it and use
qemu_file_get_error() in the places that it was tested.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/qemu-file.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 771aba7369..7b32ef45a9 100644
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
@@ -407,7 +403,7 @@ static ssize_t coroutine_mixed_fn qemu_fill_buffer(QEMUFile *f)
     f->buf_index = 0;
     f->buf_size = pending;
 
-    if (f->shutdown) {
+    if (qemu_file_get_error(f)) {
         return 0;
     }
 
@@ -496,7 +492,7 @@ static int add_to_iovec(QEMUFile *f, const uint8_t *buf, size_t size,
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



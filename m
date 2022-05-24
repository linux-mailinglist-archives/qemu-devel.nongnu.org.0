Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E92A95329A7
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 13:47:52 +0200 (CEST)
Received: from localhost ([::1]:45078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntT0x-000251-Vh
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 07:47:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ntSJZ-0005nn-B8
 for qemu-devel@nongnu.org; Tue, 24 May 2022 07:03:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ntSJP-0003Ne-CK
 for qemu-devel@nongnu.org; Tue, 24 May 2022 07:02:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653390169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=omqVQcD2wd6yHjOZp8jLK64Uo39yJDgaOhIBAv9DTFo=;
 b=K8x1UoPe5BfOHLHAawmxV9+g4zgqK5GzhbU7ugnkt7J8IV5cT9zGG7qBIrOVlzDPSXoRdc
 bY4Eq/oxW+xqJVPSO5BRv0yZSo72c3+kDVu49py6AV8BkHc+T8k/gxzTYzT1UeyHhV0M5M
 nr7FT4dk7Z3Eu2THkRxbczKvXNDmzUU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-QCR2t9h8Mc-NhBSBWFDnTA-1; Tue, 24 May 2022 07:02:46 -0400
X-MC-Unique: QCR2t9h8Mc-NhBSBWFDnTA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBD70100FBC3;
 Tue, 24 May 2022 11:02:45 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84AD21121315;
 Tue, 24 May 2022 11:02:44 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PATCH 04/20] migration: rename rate limiting fields in QEMUFile
Date: Tue, 24 May 2022 12:02:19 +0100
Message-Id: <20220524110235.145079-5-berrange@redhat.com>
In-Reply-To: <20220524110235.145079-1-berrange@redhat.com>
References: <20220524110235.145079-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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

This renames the following QEMUFile fields

 * bytes_xfer -> rate_limit_used
 * xfer_limit -> rate_limit_max

The intent is to make it clear that 'bytes_xfer' is specifically related
to rate limiting of data and applies to data queued, which need not have
been transferred on the wire yet if a flush hasn't taken place.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/qemu-file.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 1479cddad9..03f0b13a55 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -39,8 +39,16 @@ struct QEMUFile {
     const QEMUFileHooks *hooks;
     void *opaque;
 
-    int64_t bytes_xfer;
-    int64_t xfer_limit;
+    /*
+     * Maximum amount of data in bytes to transfer during one
+     * rate limiting time window
+     */
+    int64_t rate_limit_max;
+    /*
+     * Total amount of data in bytes queued for transfer
+     * during this rate limiting time window
+     */
+    int64_t rate_limit_used;
 
     int64_t pos; /* start of buffer when writing, end of buffer
                     when reading */
@@ -304,7 +312,7 @@ size_t ram_control_save_page(QEMUFile *f, ram_addr_t block_offset,
         int ret = f->hooks->save_page(f, f->opaque, block_offset,
                                       offset, size, bytes_sent);
         if (ret != RAM_SAVE_CONTROL_NOT_SUPP) {
-            f->bytes_xfer += size;
+            f->rate_limit_used += size;
         }
 
         if (ret != RAM_SAVE_CONTROL_DELAYED &&
@@ -457,7 +465,7 @@ void qemu_put_buffer_async(QEMUFile *f, const uint8_t *buf, size_t size,
         return;
     }
 
-    f->bytes_xfer += size;
+    f->rate_limit_used += size;
     add_to_iovec(f, buf, size, may_free);
 }
 
@@ -475,7 +483,7 @@ void qemu_put_buffer(QEMUFile *f, const uint8_t *buf, size_t size)
             l = size;
         }
         memcpy(f->buf + f->buf_index, buf, l);
-        f->bytes_xfer += l;
+        f->rate_limit_used += l;
         add_buf_to_iovec(f, l);
         if (qemu_file_get_error(f)) {
             break;
@@ -492,7 +500,7 @@ void qemu_put_byte(QEMUFile *f, int v)
     }
 
     f->buf[f->buf_index] = v;
-    f->bytes_xfer++;
+    f->rate_limit_used++;
     add_buf_to_iovec(f, 1);
 }
 
@@ -674,7 +682,7 @@ int qemu_file_rate_limit(QEMUFile *f)
     if (qemu_file_get_error(f)) {
         return 1;
     }
-    if (f->xfer_limit > 0 && f->bytes_xfer > f->xfer_limit) {
+    if (f->rate_limit_max > 0 && f->rate_limit_used > f->rate_limit_max) {
         return 1;
     }
     return 0;
@@ -682,22 +690,22 @@ int qemu_file_rate_limit(QEMUFile *f)
 
 int64_t qemu_file_get_rate_limit(QEMUFile *f)
 {
-    return f->xfer_limit;
+    return f->rate_limit_max;
 }
 
 void qemu_file_set_rate_limit(QEMUFile *f, int64_t limit)
 {
-    f->xfer_limit = limit;
+    f->rate_limit_max = limit;
 }
 
 void qemu_file_reset_rate_limit(QEMUFile *f)
 {
-    f->bytes_xfer = 0;
+    f->rate_limit_used = 0;
 }
 
 void qemu_file_update_transfer(QEMUFile *f, int64_t len)
 {
-    f->bytes_xfer += len;
+    f->rate_limit_used += len;
 }
 
 void qemu_put_be16(QEMUFile *f, unsigned int v)
-- 
2.36.1



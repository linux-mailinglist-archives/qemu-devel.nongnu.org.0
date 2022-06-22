Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 925C7553F9F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 02:41:14 +0200 (CEST)
Received: from localhost ([::1]:53072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3oQj-0006Wb-Kh
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 20:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3oCI-0002xs-AR
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 20:26:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3oCB-00066i-Oz
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 20:26:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655857571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=czs2z7mw1opsiuh2ICHWW14lwUYXZu/iBz7oLEWD5fw=;
 b=SwvBwBGEGv/yOQrZzoKy4dqVBKAms+iJaYxic0R47U/mqCdZ0A4acSDxrihWIuffsK6z+3
 iP8/WQgff2ZwCj0+8AtrXrMo7SeazkkNPI48UHh10odunyKVTB9HcadzhSECTp2PXlfLRM
 vf+U0vf0sjuUyev8lG0DrykVcAtNpNo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-aHrVB70sPtKWiZs8jFTa5A-1; Tue, 21 Jun 2022 20:26:08 -0400
X-MC-Unique: aHrVB70sPtKWiZs8jFTa5A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0BDB3804507;
 Wed, 22 Jun 2022 00:26:07 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0036F141510D;
 Wed, 22 Jun 2022 00:26:05 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hailiang Zhang <zhanghailiang@xfusion.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PULL 08/25] migration: rename rate limiting fields in QEMUFile
Date: Wed, 22 Jun 2022 02:25:30 +0200
Message-Id: <20220622002547.64784-9-quintela@redhat.com>
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

From: Daniel P. Berrangé <berrange@redhat.com>

This renames the following QEMUFile fields

 * bytes_xfer -> rate_limit_used
 * xfer_limit -> rate_limit_max

The intent is to make it clear that 'bytes_xfer' is specifically related
to rate limiting of data and applies to data queued, which need not have
been transferred on the wire yet if a flush hasn't taken place.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
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
2.35.3



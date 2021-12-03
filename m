Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AB5468057
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 00:26:25 +0100 (CET)
Received: from localhost ([::1]:44922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtHwe-0001IU-J0
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 18:26:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHnC-0007o9-1y
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:16:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHnA-0003A3-3P
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:16:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638573392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cXqedCwPvqpB0KfB2gP/avL3AK8S0eJ0pZYu/KEPRpY=;
 b=cY6/M6XJZOj3Or+iMnexrfHJJjc9EkPlhZy5oRe4xjQuafaLuOQhU5IUCidwYWcSj3vXuV
 y7HA/Xk4U4drOdisT8aiaqCRMLPviRP0L4dzpolJmYWQEDWPl9/rcxwLIUIAdPU4AwQplw
 OqnFbcF6tg2UwszCj1iFqBvR/UAuR8c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-chM2I_uvPOeH1YPBOXAQYg-1; Fri, 03 Dec 2021 18:16:29 -0500
X-MC-Unique: chM2I_uvPOeH1YPBOXAQYg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BF8B102C888;
 Fri,  3 Dec 2021 23:16:28 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 351B95DF2B;
 Fri,  3 Dec 2021 23:16:27 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/14] nbd/client: Accept 64-bit hole chunks
Date: Fri,  3 Dec 2021 17:15:36 -0600
Message-Id: <20211203231539.3900865-12-eblake@redhat.com>
In-Reply-To: <20211203231539.3900865-1-eblake@redhat.com>
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
 <20211203231539.3900865-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, nbd@other.debian.org, nsoffer@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Although our read requests are sized such that servers need not send
an extended hole chunk, we still have to be prepared for it to be
fully compliant if we request extended headers.  We can also tolerate
a non-compliant server sending the new chunk even when it should not.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c        | 26 ++++++++++++++++++++------
 block/trace-events |  1 +
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index da5e6ac2d9a5..c5dea864ebb6 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -518,20 +518,26 @@ static inline uint64_t payload_advance64(uint8_t **payload)

 static int nbd_parse_offset_hole_payload(BDRVNBDState *s,
                                          NBDStructuredReplyChunk *chunk,
-                                         uint8_t *payload, uint64_t orig_offset,
+                                         uint8_t *payload, bool wide,
+                                         uint64_t orig_offset,
                                          QEMUIOVector *qiov, Error **errp)
 {
     uint64_t offset;
-    uint32_t hole_size;
+    uint64_t hole_size;
+    size_t len = wide ? sizeof(hole_size) : sizeof(uint32_t);

-    if (chunk->length != sizeof(offset) + sizeof(hole_size)) {
+    if (chunk->length != sizeof(offset) + len) {
         error_setg(errp, "Protocol error: invalid payload for "
                          "NBD_REPLY_TYPE_OFFSET_HOLE");
         return -EINVAL;
     }

     offset = payload_advance64(&payload);
-    hole_size = payload_advance32(&payload);
+    if (wide) {
+        hole_size = payload_advance64(&payload);
+    } else {
+        hole_size = payload_advance32(&payload);
+    }

     if (!hole_size || offset < orig_offset || hole_size > qiov->size ||
         offset > orig_offset + qiov->size - hole_size) {
@@ -544,6 +550,7 @@ static int nbd_parse_offset_hole_payload(BDRVNBDState *s,
         trace_nbd_structured_read_compliance("hole");
     }

+    assert(hole_size <= SIZE_MAX);
     qemu_iovec_memset(qiov, offset - orig_offset, 0, hole_size);

     return 0;
@@ -1037,9 +1044,16 @@ static int nbd_co_receive_cmdread_reply(BDRVNBDState *s, uint64_t handle,
              * in qiov
              */
             break;
+        case NBD_REPLY_TYPE_OFFSET_HOLE_EXT:
+            if (!s->info.extended_headers) {
+                trace_nbd_extended_headers_compliance("hole_ext");
+            }
+            /* fallthrough */
         case NBD_REPLY_TYPE_OFFSET_HOLE:
-            ret = nbd_parse_offset_hole_payload(s, &reply.structured, payload,
-                                                offset, qiov, &local_err);
+            ret = nbd_parse_offset_hole_payload(
+                s, &reply.structured, payload,
+                chunk->type == NBD_REPLY_TYPE_OFFSET_HOLE_EXT,
+                offset, qiov, &local_err);
             if (ret < 0) {
                 nbd_channel_error(s, ret);
                 nbd_iter_channel_error(&iter, ret, &local_err);
diff --git a/block/trace-events b/block/trace-events
index 549090d453e7..ee65da204dde 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -168,6 +168,7 @@ iscsi_xcopy(void *src_lun, uint64_t src_off, void *dst_lun, uint64_t dst_off, ui
 # nbd.c
 nbd_parse_blockstatus_compliance(const char *err) "ignoring extra data from non-compliant server: %s"
 nbd_structured_read_compliance(const char *type) "server sent non-compliant unaligned read %s chunk"
+nbd_extended_headers_compliance(const char *type) "server sent non-compliant %s chunk without extended headers"
 nbd_read_reply_entry_fail(int ret, const char *err) "ret = %d, err: %s"
 nbd_co_request_fail(uint64_t from, uint32_t len, uint64_t handle, uint16_t flags, uint16_t type, const char *name, int ret, const char *err) "Request failed { .from = %" PRIu64", .len = %" PRIu32 ", .handle = %" PRIu64 ", .flags = 0x%" PRIx16 ", .type = %" PRIu16 " (%s) } ret = %d, err: %s"
 nbd_client_handshake(const char *export_name) "export '%s'"
-- 
2.33.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95744628DF9
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:09:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouieK-00039M-Ar; Mon, 14 Nov 2022 18:13:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouidr-0001X6-6a
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiGM-0002Pu-HD
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:49:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PSKFsd3WLLrsYRtlYZAlFwgEDN2comkk7iEfIBxymQM=;
 b=fMWcp1f/Xw6EwH0DWkNDimoEsX9EWAfid/gtr5jeTUdUTy9TxpelHyjfN6919SzmO4HByZ
 y/WVzFgWyUHOuymRsqyCqgVG+LILAfTJeaYySfFBm2kakkDCTiFJKA4fBIljgWC+9DXwVm
 wdML+C567BE/hQ8dI9KpIHc/Lfd9MQ4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-WJwDpn3APeGXsE-6Q8_8Dw-1; Mon, 14 Nov 2022 17:49:06 -0500
X-MC-Unique: WJwDpn3APeGXsE-6Q8_8Dw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AEB4101A528;
 Mon, 14 Nov 2022 22:49:05 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0566940E42E5;
 Mon, 14 Nov 2022 22:49:04 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, libguestfs@redhat.com, nbd@other.debian.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v2 14/15] RFC: nbd/client: Accept 64-bit hole chunks
Date: Mon, 14 Nov 2022 16:48:47 -0600
Message-Id: <20221114224848.2186298-15-eblake@redhat.com>
In-Reply-To: <20221114224848.2186298-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224848.2186298-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

As part of adding extended headers, the NBD spec debated about adding
support for reading 64-bit holes.  It was documented in a separate
upstream commit XXX[*] to make it easier to decide whether 64-bit
holes should be required of all clients supporting extended headers,
or whether it is an unneeded feature; hence, the qemu work to support
it is also pulled out into a separate commit.

Note that we can also tolerate a non-compliant server sending the new
chunk even when it should not.

Signed-off-by: Eric Blake <eblake@redhat.com>

---
[*] Fix commit id if we actually go with idea
---
 include/block/nbd.h |  8 ++++++++
 block/nbd.c         | 26 ++++++++++++++++++++------
 nbd/common.c        |  4 +++-
 3 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 2a65c606c9..18b6bad038 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -133,6 +133,13 @@ typedef struct NBDStructuredReadHole {
     uint32_t length;
 } QEMU_PACKED NBDStructuredReadHole;

+/* Complete chunk for NBD_REPLY_TYPE_OFFSET_HOLE_EXT */
+typedef struct NBDStructuredReadHoleExt {
+    /* header's length == 16 */
+    uint64_t offset;
+    uint64_t length;
+} QEMU_PACKED NBDStructuredReadHoleExt;
+
 /* Header of all NBD_REPLY_TYPE_ERROR* errors */
 typedef struct NBDStructuredError {
     /* header's length >= 6 */
@@ -309,6 +316,7 @@ enum {
 #define NBD_REPLY_TYPE_NONE              0
 #define NBD_REPLY_TYPE_OFFSET_DATA       1
 #define NBD_REPLY_TYPE_OFFSET_HOLE       2
+#define NBD_REPLY_TYPE_OFFSET_HOLE_EXT   3
 #define NBD_REPLY_TYPE_BLOCK_STATUS      5
 #define NBD_REPLY_TYPE_BLOCK_STATUS_EXT  6
 #define NBD_REPLY_TYPE_ERROR             NBD_REPLY_ERR(1)
diff --git a/block/nbd.c b/block/nbd.c
index 44ab5437ea..968d5d8a37 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -570,20 +570,26 @@ static inline uint64_t payload_advance64(uint8_t **payload)

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
@@ -596,6 +602,7 @@ static int nbd_parse_offset_hole_payload(BDRVNBDState *s,
         trace_nbd_structured_read_compliance("hole");
     }

+    assert(hole_size <= SIZE_MAX);
     qemu_iovec_memset(qiov, offset - orig_offset, 0, hole_size);

     return 0;
@@ -1094,9 +1101,16 @@ static int coroutine_fn nbd_co_receive_cmdread_reply(BDRVNBDState *s, uint64_t h
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
diff --git a/nbd/common.c b/nbd/common.c
index 137466defd..54f7d6a4fd 100644
--- a/nbd/common.c
+++ b/nbd/common.c
@@ -174,7 +174,9 @@ const char *nbd_reply_type_lookup(uint16_t type)
     case NBD_REPLY_TYPE_OFFSET_DATA:
         return "data";
     case NBD_REPLY_TYPE_OFFSET_HOLE:
-        return "hole";
+        return "hole (32-bit)";
+    case NBD_REPLY_TYPE_OFFSET_HOLE_EXT:
+        return "hole (64-bit)";
     case NBD_REPLY_TYPE_BLOCK_STATUS:
         return "block status (32-bit)";
     case NBD_REPLY_TYPE_BLOCK_STATUS_EXT:
-- 
2.38.1



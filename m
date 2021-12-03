Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB78468058
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 00:27:05 +0100 (CET)
Received: from localhost ([::1]:47486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtHxI-00036q-Av
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 18:27:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHn4-0007hZ-N2
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:16:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHmq-00036O-1W
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:16:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638573375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PWpSlReJ1kbJDpdLFnAMI+zJ0C9rJ2N+I3J8+kH5b3I=;
 b=evTzLHATqpD0VZeNtMZrifeNMRSQOFxaALFNiVP4UuA5Yqe/K0wTaV/Dov5YCDtxTwTp02
 JhDT1BHiQuA2XhJ8AmzuNiT9FwRiWLFcg8GRiRZkNTEMSkOFb0sczPdIP7/pij8ldSrBLJ
 +8bpY1RNrNsCwsaTAAMfCepCodi+a3g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-WBdZ_MZYPKaGKdz16onh4A-1; Fri, 03 Dec 2021 18:16:12 -0500
X-MC-Unique: WBdZ_MZYPKaGKdz16onh4A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C842102C887;
 Fri,  3 Dec 2021 23:16:10 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 248935D9D5;
 Fri,  3 Dec 2021 23:16:09 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/14] nbd: Add types for extended headers
Date: Fri,  3 Dec 2021 17:15:32 -0600
Message-Id: <20211203231539.3900865-8-eblake@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Add the constants and structs necessary for later patches to start
implementing the NBD_OPT_EXTENDED_HEADERS extension in both the client
and server.  This patch does not change any existing behavior, but
merely sets the stage.

This patch does not change the status quo that neither the client nor
server use a packed-struct representation for the request header.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 docs/interop/nbd.txt |  1 +
 include/block/nbd.h  | 67 +++++++++++++++++++++++++++++++++++---------
 nbd/common.c         | 10 +++++--
 3 files changed, 62 insertions(+), 16 deletions(-)

diff --git a/docs/interop/nbd.txt b/docs/interop/nbd.txt
index bdb0f2a41aca..6229ea573c04 100644
--- a/docs/interop/nbd.txt
+++ b/docs/interop/nbd.txt
@@ -68,3 +68,4 @@ NBD_CMD_BLOCK_STATUS for "qemu:dirty-bitmap:", NBD_CMD_CACHE
 * 4.2: NBD_FLAG_CAN_MULTI_CONN for shareable read-only exports,
 NBD_CMD_FLAG_FAST_ZERO
 * 5.2: NBD_CMD_BLOCK_STATUS for "qemu:allocation-depth"
+* 7.0: NBD_OPT_EXTENDED_HEADERS
diff --git a/include/block/nbd.h b/include/block/nbd.h
index 732314aaba11..5f9d86a86352 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -69,6 +69,14 @@ typedef struct NBDSimpleReply {
     uint64_t handle;
 } QEMU_PACKED NBDSimpleReply;

+typedef struct NBDSimpleReplyExt {
+    uint32_t magic;  /* NBD_SIMPLE_REPLY_EXT_MAGIC */
+    uint32_t error;
+    uint64_t handle;
+    uint64_t _pad1;  /* Must be 0 */
+    uint64_t _pad2;  /* Must be 0 */
+} QEMU_PACKED NBDSimpleReplyExt;
+
 /* Header of all structured replies */
 typedef struct NBDStructuredReplyChunk {
     uint32_t magic;  /* NBD_STRUCTURED_REPLY_MAGIC */
@@ -78,9 +86,20 @@ typedef struct NBDStructuredReplyChunk {
     uint32_t length; /* length of payload */
 } QEMU_PACKED NBDStructuredReplyChunk;

+typedef struct NBDStructuredReplyChunkExt {
+    uint32_t magic;  /* NBD_STRUCTURED_REPLY_EXT_MAGIC */
+    uint16_t flags;  /* combination of NBD_REPLY_FLAG_* */
+    uint16_t type;   /* NBD_REPLY_TYPE_* */
+    uint64_t handle; /* request handle */
+    uint64_t length; /* length of payload */
+    uint64_t _pad;   /* Must be 0 */
+} QEMU_PACKED NBDStructuredReplyChunkExt;
+
 typedef union NBDReply {
     NBDSimpleReply simple;
+    NBDSimpleReplyExt simple_ext;
     NBDStructuredReplyChunk structured;
+    NBDStructuredReplyChunkExt structured_ext;
     struct {
         /* @magic and @handle fields have the same offset and size both in
          * simple reply and structured reply chunk, so let them be accessible
@@ -106,6 +125,13 @@ typedef struct NBDStructuredReadHole {
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
@@ -113,19 +139,26 @@ typedef struct NBDStructuredError {
     uint16_t message_length;
 } QEMU_PACKED NBDStructuredError;

-/* Header of NBD_REPLY_TYPE_BLOCK_STATUS */
+/* Header of NBD_REPLY_TYPE_BLOCK_STATUS, NBD_REPLY_TYPE_BLOCK_STATUS_EXT */
 typedef struct NBDStructuredMeta {
-    /* header's length >= 12 (at least one extent) */
+    /* header's length >= 12 narrow, or >= 20 extended (at least one extent) */
     uint32_t context_id;
-    /* extents follows */
+    /* extents[] follows: NBDExtent for narrow, NBDExtentExt for extended */
 } QEMU_PACKED NBDStructuredMeta;

-/* Extent chunk for NBD_REPLY_TYPE_BLOCK_STATUS */
+/* Extent array for NBD_REPLY_TYPE_BLOCK_STATUS */
 typedef struct NBDExtent {
     uint32_t length;
     uint32_t flags; /* NBD_STATE_* */
 } QEMU_PACKED NBDExtent;

+/* Extent array for NBD_REPLY_TYPE_BLOCK_STATUS_EXT */
+typedef struct NBDExtentExt {
+    uint64_t length;
+    uint32_t flags; /* NBD_STATE_* */
+    uint32_t _pad;  /* Must be 0 */
+} QEMU_PACKED NBDExtentExt;
+
 /* Transmission (export) flags: sent from server to client during handshake,
    but describe what will happen during transmission */
 enum {
@@ -178,6 +211,7 @@ enum {
 #define NBD_OPT_STRUCTURED_REPLY  (8)
 #define NBD_OPT_LIST_META_CONTEXT (9)
 #define NBD_OPT_SET_META_CONTEXT  (10)
+#define NBD_OPT_EXTENDED_HEADERS  (11)

 /* Option reply types. */
 #define NBD_REP_ERR(value) ((UINT32_C(1) << 31) | (value))
@@ -234,12 +268,15 @@ enum {
  */
 #define NBD_MAX_STRING_SIZE 4096

-/* Transmission request structure */
+/* Two types of request structures, a given client will only use 1 */
 #define NBD_REQUEST_MAGIC           0x25609513
+#define NBD_REQUEST_EXT_MAGIC       0x21e41c71

-/* Two types of reply structures */
-#define NBD_SIMPLE_REPLY_MAGIC      0x67446698
-#define NBD_STRUCTURED_REPLY_MAGIC  0x668e33ef
+/* Four types of reply structures, a given client will only use 2 */
+#define NBD_SIMPLE_REPLY_MAGIC          0x67446698
+#define NBD_STRUCTURED_REPLY_MAGIC      0x668e33ef
+#define NBD_SIMPLE_REPLY_EXT_MAGIC      0x60d12fd6
+#define NBD_STRUCTURED_REPLY_EXT_MAGIC  0x6e8a278c

 /* Structured reply flags */
 #define NBD_REPLY_FLAG_DONE          (1 << 0) /* This reply-chunk is last */
@@ -247,12 +284,14 @@ enum {
 /* Structured reply types */
 #define NBD_REPLY_ERR(value)         ((1 << 15) | (value))

-#define NBD_REPLY_TYPE_NONE          0
-#define NBD_REPLY_TYPE_OFFSET_DATA   1
-#define NBD_REPLY_TYPE_OFFSET_HOLE   2
-#define NBD_REPLY_TYPE_BLOCK_STATUS  5
-#define NBD_REPLY_TYPE_ERROR         NBD_REPLY_ERR(1)
-#define NBD_REPLY_TYPE_ERROR_OFFSET  NBD_REPLY_ERR(2)
+#define NBD_REPLY_TYPE_NONE              0
+#define NBD_REPLY_TYPE_OFFSET_DATA       1
+#define NBD_REPLY_TYPE_OFFSET_HOLE       2
+#define NBD_REPLY_TYPE_OFFSET_HOLE_EXT   3
+#define NBD_REPLY_TYPE_BLOCK_STATUS      5
+#define NBD_REPLY_TYPE_BLOCK_STATUS_EXT  6
+#define NBD_REPLY_TYPE_ERROR             NBD_REPLY_ERR(1)
+#define NBD_REPLY_TYPE_ERROR_OFFSET      NBD_REPLY_ERR(2)

 /* Extent flags for base:allocation in NBD_REPLY_TYPE_BLOCK_STATUS */
 #define NBD_STATE_HOLE (1 << 0)
diff --git a/nbd/common.c b/nbd/common.c
index ddfe7d118371..08eaed4cb3c2 100644
--- a/nbd/common.c
+++ b/nbd/common.c
@@ -79,6 +79,8 @@ const char *nbd_opt_lookup(uint32_t opt)
         return "list meta context";
     case NBD_OPT_SET_META_CONTEXT:
         return "set meta context";
+    case NBD_OPT_EXTENDED_HEADERS:
+        return "extended headers";
     default:
         return "<unknown>";
     }
@@ -168,9 +170,13 @@ const char *nbd_reply_type_lookup(uint16_t type)
     case NBD_REPLY_TYPE_OFFSET_DATA:
         return "data";
     case NBD_REPLY_TYPE_OFFSET_HOLE:
-        return "hole";
+        return "hole (32-bit)";
+    case NBD_REPLY_TYPE_OFFSET_HOLE_EXT:
+        return "hole (64-bit)";
     case NBD_REPLY_TYPE_BLOCK_STATUS:
-        return "block status";
+        return "block status (32-bit)";
+    case NBD_REPLY_TYPE_BLOCK_STATUS_EXT:
+        return "block status (64-bit)";
     case NBD_REPLY_TYPE_ERROR:
         return "generic error";
     case NBD_REPLY_TYPE_ERROR_OFFSET:
-- 
2.33.1



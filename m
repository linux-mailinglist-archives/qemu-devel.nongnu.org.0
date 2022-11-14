Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C716F628EDE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:05:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouie2-00029X-1j; Mon, 14 Nov 2022 18:13:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouidp-0001hU-E4
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiJD-00033h-2u
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:52:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ke/C9mzfSwkCq8UrXJ5GbnBHrV042sMz47vbHjQG3zw=;
 b=fO9hMp/fnwXMVf7yYUsRanRudG1NnW1dzJAJs/aB92/5/2PFfM7QoPTe81xmL/AsM6gQES
 ++NrmDpusGqamUszwEAOvcy2/tHFFd5jZlBdL8otMcDa3smHwzg2TYtuHO0HGUGJNBYuxt
 f4niCxhl5N4C/89O6fhTRafXdHgvg7o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-KsX07whzO0-Ztc0ZUNGaqA-1; Mon, 14 Nov 2022 17:52:03 -0500
X-MC-Unique: KsX07whzO0-Ztc0ZUNGaqA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9465B87B2A4;
 Mon, 14 Nov 2022 22:52:03 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 302DE40E9786;
 Mon, 14 Nov 2022 22:52:03 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v2 03/23] protocol: Add definitions for extended headers
Date: Mon, 14 Nov 2022 16:51:38 -0600
Message-Id: <20221114225158.2186742-4-eblake@redhat.com>
In-Reply-To: <20221114225158.2186742-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114225158.2186742-1-eblake@redhat.com>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add the magic numbers and new structs necessary to implement the NBD
protocol extension of extended headers providing 64-bit lengths.  This
corresponds to upstream nbd commits XXX-XXX[*].

---
[*] FIXME update commit ids before pushing
---
 lib/nbd-protocol.h | 66 ++++++++++++++++++++++++++++++++++++----------
 1 file changed, 52 insertions(+), 14 deletions(-)

diff --git a/lib/nbd-protocol.h b/lib/nbd-protocol.h
index 4400d3ab..ac569a11 100644
--- a/lib/nbd-protocol.h
+++ b/lib/nbd-protocol.h
@@ -124,6 +124,7 @@ struct nbd_fixed_new_option_reply {
 #define NBD_OPT_STRUCTURED_REPLY   8
 #define NBD_OPT_LIST_META_CONTEXT  9
 #define NBD_OPT_SET_META_CONTEXT   10
+#define NBD_OPT_EXTENDED_HEADERS   11

 #define NBD_REP_ERR(val) (0x80000000 | (val))
 #define NBD_REP_IS_ERR(val) (!!((val) & 0x80000000))
@@ -141,6 +142,7 @@ struct nbd_fixed_new_option_reply {
 #define NBD_REP_ERR_SHUTDOWN         NBD_REP_ERR (7)
 #define NBD_REP_ERR_BLOCK_SIZE_REQD  NBD_REP_ERR (8)
 #define NBD_REP_ERR_TOO_BIG          NBD_REP_ERR (9)
+#define NBD_REP_ERR_EXT_HEADER_REQD  NBD_REP_ERR (10)

 #define NBD_INFO_EXPORT      0
 #define NBD_INFO_NAME        1
@@ -182,16 +184,26 @@ struct nbd_fixed_new_option_reply_meta_context {
   /* followed by a string */
 } NBD_ATTRIBUTE_PACKED;

-/* Request (client -> server). */
+/* Compact request (client -> server). */
 struct nbd_request {
   uint32_t magic;               /* NBD_REQUEST_MAGIC. */
-  uint16_t flags;               /* Request flags. */
-  uint16_t type;                /* Request type. */
+  uint16_t flags;               /* Request flags: NBD_CMD_FLAG_*. */
+  uint16_t type;                /* Request type: NBD_CMD_*. */
   uint64_t handle;              /* Opaque handle. */
   uint64_t offset;              /* Request offset. */
   uint32_t count;               /* Request length. */
 } NBD_ATTRIBUTE_PACKED;

+/* Extended request (client -> server). */
+struct nbd_request_ext {
+  uint32_t magic;               /* NBD_EXTENDED_REQUEST_MAGIC. */
+  uint16_t flags;               /* Request flags: NBD_CMD_FLAG_*. */
+  uint16_t type;                /* Request type: NBD_CMD_*. */
+  uint64_t handle;              /* Opaque handle. */
+  uint64_t offset;              /* Request offset. */
+  uint64_t count;               /* Request effect or payload length. */
+} NBD_ATTRIBUTE_PACKED;
+
 /* Simple reply (server -> client). */
 struct nbd_simple_reply {
   uint32_t magic;               /* NBD_SIMPLE_REPLY_MAGIC. */
@@ -208,6 +220,16 @@ struct nbd_structured_reply {
   uint32_t length;              /* Length of payload which follows. */
 } NBD_ATTRIBUTE_PACKED;

+/* Extended reply (server -> client). */
+struct nbd_extended_reply {
+  uint32_t magic;               /* NBD_EXTENDED_REPLY_MAGIC. */
+  uint16_t flags;               /* NBD_REPLY_FLAG_* */
+  uint16_t type;                /* NBD_REPLY_TYPE_* */
+  uint64_t handle;              /* Opaque handle. */
+  uint64_t offset;              /* Client's offset. */
+  uint64_t length;              /* Length of payload which follows. */
+} NBD_ATTRIBUTE_PACKED;
+
 struct nbd_structured_reply_offset_data {
   uint64_t offset;              /* offset */
   /* Followed by data. */
@@ -224,11 +246,23 @@ struct nbd_block_descriptor {
   uint32_t status_flags;        /* block type (hole etc) */
 } NBD_ATTRIBUTE_PACKED;

+/* NBD_REPLY_TYPE_BLOCK_STATUS_EXT block descriptor. */
+struct nbd_block_descriptor_ext {
+  uint64_t length;              /* length of block */
+  uint64_t status_flags;        /* block type (hole etc) */
+} NBD_ATTRIBUTE_PACKED;
+
 struct nbd_structured_reply_block_status_hdr {
   uint32_t context_id;          /* metadata context ID */
   /* followed by array of nbd_block_descriptor extents */
 } NBD_ATTRIBUTE_PACKED;

+struct nbd_structured_reply_block_status_ext_hdr {
+  uint32_t context_id;          /* metadata context ID */
+  uint32_t count;               /* 0, or length of following array */
+  /* followed by array of nbd_block_descriptor_ext extents */
+} NBD_ATTRIBUTE_PACKED;
+
 struct nbd_structured_reply_error {
   uint32_t error;               /* NBD_E* error number */
   uint16_t len;                 /* Length of human readable error. */
@@ -236,8 +270,10 @@ struct nbd_structured_reply_error {
 } NBD_ATTRIBUTE_PACKED;

 #define NBD_REQUEST_MAGIC           0x25609513
+#define NBD_EXTENDED_REQUEST_MAGIC  0x21e41c71
 #define NBD_SIMPLE_REPLY_MAGIC      0x67446698
 #define NBD_STRUCTURED_REPLY_MAGIC  0x668e33ef
+#define NBD_EXTENDED_REPLY_MAGIC    0x6e8a278c

 /* Structured reply flags. */
 #define NBD_REPLY_FLAG_DONE         (1<<0)
@@ -246,12 +282,13 @@ struct nbd_structured_reply_error {
 #define NBD_REPLY_TYPE_IS_ERR(val) (!!((val) & (1<<15)))

 /* Structured reply types. */
-#define NBD_REPLY_TYPE_NONE         0
-#define NBD_REPLY_TYPE_OFFSET_DATA  1
-#define NBD_REPLY_TYPE_OFFSET_HOLE  2
-#define NBD_REPLY_TYPE_BLOCK_STATUS 5
-#define NBD_REPLY_TYPE_ERROR        NBD_REPLY_TYPE_ERR (1)
-#define NBD_REPLY_TYPE_ERROR_OFFSET NBD_REPLY_TYPE_ERR (2)
+#define NBD_REPLY_TYPE_NONE             0
+#define NBD_REPLY_TYPE_OFFSET_DATA      1
+#define NBD_REPLY_TYPE_OFFSET_HOLE      2
+#define NBD_REPLY_TYPE_BLOCK_STATUS     5
+#define NBD_REPLY_TYPE_BLOCK_STATUS_EXT 6
+#define NBD_REPLY_TYPE_ERROR            NBD_REPLY_TYPE_ERR (1)
+#define NBD_REPLY_TYPE_ERROR_OFFSET     NBD_REPLY_TYPE_ERR (2)

 /* NBD commands. */
 #define NBD_CMD_READ              0
@@ -263,11 +300,12 @@ struct nbd_structured_reply_error {
 #define NBD_CMD_WRITE_ZEROES      6
 #define NBD_CMD_BLOCK_STATUS      7

-#define NBD_CMD_FLAG_FUA       (1<<0)
-#define NBD_CMD_FLAG_NO_HOLE   (1<<1)
-#define NBD_CMD_FLAG_DF        (1<<2)
-#define NBD_CMD_FLAG_REQ_ONE   (1<<3)
-#define NBD_CMD_FLAG_FAST_ZERO (1<<4)
+#define NBD_CMD_FLAG_FUA         (1<<0)
+#define NBD_CMD_FLAG_NO_HOLE     (1<<1)
+#define NBD_CMD_FLAG_DF          (1<<2)
+#define NBD_CMD_FLAG_REQ_ONE     (1<<3)
+#define NBD_CMD_FLAG_FAST_ZERO   (1<<4)
+#define NBD_CMD_FLAG_PAYLOAD_LEN (1<<5)

 /* NBD error codes. */
 #define NBD_SUCCESS     0
-- 
2.38.1



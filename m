Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FB04680B4
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 00:39:13 +0100 (CET)
Received: from localhost ([::1]:58434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtI91-0004fN-Q0
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 18:39:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHoY-0002Bs-WE
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:18:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mtHoX-0003JP-AX
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:18:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638573480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b7vTNTo8uTLAByN8asrFOku08wwC2MQ4RKEAFYJrPdY=;
 b=N+5DXg1TUbeFsIABJBm2MsVXdWXwWdC3ZYKf5y0J/E0ZPJUm5ZcaUGZK1piae1FjUqTF1a
 tiQ5xcrbyyb/6FJ4gYOYbzm2sARG7TpzixHHUAmWXRG7l4B0LVfQF0kGIEKsOb157UGxK0
 +BKHHyufwFRBpC7Bi/tmXIOG/iUOCeM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-109-aJFX8kpTMHShB6jNRcEIeA-1; Fri, 03 Dec 2021 18:17:57 -0500
X-MC-Unique: aJFX8kpTMHShB6jNRcEIeA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6D51190A7A4;
 Fri,  3 Dec 2021 23:17:55 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF3345DF2B;
 Fri,  3 Dec 2021 23:17:54 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Subject: [libnbd PATCH 03/13] protocol: Add definitions for extended headers
Date: Fri,  3 Dec 2021 17:17:31 -0600
Message-Id: <20211203231741.3901263-4-eblake@redhat.com>
In-Reply-To: <20211203231741.3901263-1-eblake@redhat.com>
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
 <20211203231741.3901263-1-eblake@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: nsoffer@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, nbd@other.debian.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the magic numbers and new structs necessary to implement the NBD
protocol extension of extended headers providing 64-bit lengths.
---
 lib/nbd-protocol.h | 61 ++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 51 insertions(+), 10 deletions(-)

diff --git a/lib/nbd-protocol.h b/lib/nbd-protocol.h
index e5d6404b..7247d775 100644
--- a/lib/nbd-protocol.h
+++ b/lib/nbd-protocol.h
@@ -1,5 +1,5 @@
 /* nbdkit
- * Copyright (C) 2013-2020 Red Hat Inc.
+ * Copyright (C) 2013-2021 Red Hat Inc.
  *
  * Redistribution and use in source and binary forms, with or without
  * modification, are permitted provided that the following conditions are
@@ -124,6 +124,7 @@ struct nbd_fixed_new_option_reply {
 #define NBD_OPT_STRUCTURED_REPLY   8
 #define NBD_OPT_LIST_META_CONTEXT  9
 #define NBD_OPT_SET_META_CONTEXT   10
+#define NBD_OPT_EXTENDED_HEADERS   11

 #define NBD_REP_ERR(val) (0x80000000 | (val))
 #define NBD_REP_IS_ERR(val) (!!((val) & 0x80000000))
@@ -188,6 +189,13 @@ struct nbd_block_descriptor {
   uint32_t status_flags;        /* block type (hole etc) */
 } NBD_ATTRIBUTE_PACKED;

+/* NBD_REPLY_TYPE_BLOCK_STATUS_EXT block descriptor. */
+struct nbd_block_descriptor_ext {
+  uint64_t length;              /* length of block */
+  uint32_t status_flags;        /* block type (hole etc) */
+  uint32_t pad;                 /* must be zero */
+} NBD_ATTRIBUTE_PACKED;
+
 /* Request (client -> server). */
 struct nbd_request {
   uint32_t magic;               /* NBD_REQUEST_MAGIC. */
@@ -197,6 +205,14 @@ struct nbd_request {
   uint64_t offset;              /* Request offset. */
   uint32_t count;               /* Request length. */
 } NBD_ATTRIBUTE_PACKED;
+struct nbd_request_ext {
+  uint32_t magic;               /* NBD_REQUEST_EXT_MAGIC. */
+  uint16_t flags;               /* Request flags. */
+  uint16_t type;                /* Request type. */
+  uint64_t handle;              /* Opaque handle. */
+  uint64_t offset;              /* Request offset. */
+  uint64_t count;               /* Request length. */
+} NBD_ATTRIBUTE_PACKED;

 /* Simple reply (server -> client). */
 struct nbd_simple_reply {
@@ -204,6 +220,13 @@ struct nbd_simple_reply {
   uint32_t error;               /* NBD_SUCCESS or one of NBD_E*. */
   uint64_t handle;              /* Opaque handle. */
 } NBD_ATTRIBUTE_PACKED;
+struct nbd_simple_reply_ext {
+  uint32_t magic;               /* NBD_SIMPLE_REPLY_EXT_MAGIC. */
+  uint32_t error;               /* NBD_SUCCESS or one of NBD_E*. */
+  uint64_t handle;              /* Opaque handle. */
+  uint64_t pad1;                /* Must be 0. */
+  uint64_t pad2;                /* Must be 0. */
+} NBD_ATTRIBUTE_PACKED;

 /* Structured reply (server -> client). */
 struct nbd_structured_reply {
@@ -213,6 +236,14 @@ struct nbd_structured_reply {
   uint64_t handle;              /* Opaque handle. */
   uint32_t length;              /* Length of payload which follows. */
 } NBD_ATTRIBUTE_PACKED;
+struct nbd_structured_reply_ext {
+  uint32_t magic;               /* NBD_STRUCTURED_REPLY_EXT_MAGIC. */
+  uint16_t flags;               /* NBD_REPLY_FLAG_* */
+  uint16_t type;                /* NBD_REPLY_TYPE_* */
+  uint64_t handle;              /* Opaque handle. */
+  uint64_t length;              /* Length of payload which follows. */
+  uint64_t pad;                 /* Must be 0. */
+} NBD_ATTRIBUTE_PACKED;

 struct nbd_structured_reply_offset_data {
   uint64_t offset;              /* offset */
@@ -224,15 +255,23 @@ struct nbd_structured_reply_offset_hole {
   uint32_t length;              /* Length of hole. */
 } NBD_ATTRIBUTE_PACKED;

+struct nbd_structured_reply_offset_hole_ext {
+  uint64_t offset;
+  uint64_t length;              /* Length of hole. */
+} NBD_ATTRIBUTE_PACKED;
+
 struct nbd_structured_reply_error {
   uint32_t error;               /* NBD_E* error number */
   uint16_t len;                 /* Length of human readable error. */
   /* Followed by human readable error string, and possibly more structure. */
 } NBD_ATTRIBUTE_PACKED;

-#define NBD_REQUEST_MAGIC           0x25609513
-#define NBD_SIMPLE_REPLY_MAGIC      0x67446698
-#define NBD_STRUCTURED_REPLY_MAGIC  0x668e33ef
+#define NBD_REQUEST_MAGIC               0x25609513
+#define NBD_REQUEST_EXT_MAGIC           0x21e41c71
+#define NBD_SIMPLE_REPLY_MAGIC          0x67446698
+#define NBD_SIMPLE_REPLY_EXT_MAGIC      0x60d12fd6
+#define NBD_STRUCTURED_REPLY_MAGIC      0x668e33ef
+#define NBD_STRUCTURED_REPLY_EXT_MAGIC  0x6e8a278c

 /* Structured reply flags. */
 #define NBD_REPLY_FLAG_DONE         (1<<0)
@@ -241,12 +280,14 @@ struct nbd_structured_reply_error {
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
+#define NBD_REPLY_TYPE_OFFSET_HOLE_EXT  3
+#define NBD_REPLY_TYPE_BLOCK_STATUS     5
+#define NBD_REPLY_TYPE_BLOCK_STATUS_EXT 6
+#define NBD_REPLY_TYPE_ERROR            NBD_REPLY_TYPE_ERR (1)
+#define NBD_REPLY_TYPE_ERROR_OFFSET     NBD_REPLY_TYPE_ERR (2)

 /* NBD commands. */
 #define NBD_CMD_READ              0
-- 
2.33.1



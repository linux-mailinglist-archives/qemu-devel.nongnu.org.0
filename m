Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6952930DCCD
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:33:02 +0100 (CET)
Received: from localhost ([::1]:39868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7JDJ-0005oD-CH
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:33:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7J5k-0005bs-LC
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:25:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7J5i-0000GS-CX
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:25:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612362309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+OiW+7oerYrEFGbHV1jZJ0El/d0jbV2sn8FwtAYiUdw=;
 b=CXLu0OEeSJNKEBZnrtht3V+fhHUtonVbDQMkT1Jk+Se9xUlyC3NMq4ijIjC5jNqq2O+4o3
 l0mtEc9b7a2cIlY3ebAzs09mthlIC94qcbR/VUjEsYVHaw+Sev68cwtHXAl447tzh0p4i0
 Gygn9kwRdC8Up5KTbZlwOt+5TPOYHUU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257--mC42LDRPlGfkYQyacSQHg-1; Wed, 03 Feb 2021 09:25:07 -0500
X-MC-Unique: -mC42LDRPlGfkYQyacSQHg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7FB7EC1C7;
 Wed,  3 Feb 2021 14:25:05 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4945419C59;
 Wed,  3 Feb 2021 14:25:05 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 09/20] block: use int64_t as bytes type in tracked requests
Date: Wed,  3 Feb 2021 08:24:25 -0600
Message-Id: <20210203142436.703098-10-eblake@redhat.com>
In-Reply-To: <20210203142436.703098-1-eblake@redhat.com>
References: <20210203142436.703098-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block I/O path" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are generally moving to int64_t for both offset and bytes parameters
on all io paths.

Main motivation is realization of 64-bit write_zeroes operation for
fast zeroing large disk chunks, up to the whole disk.

We chose signed type, to be consistent with off_t (which is signed) and
with possibility for signed return type (where negative value means
error).

All requests in block/io must not overflow BDRV_MAX_LENGTH, all
external users of BdrvTrackedRequest already have corresponding
assertions, so we are safe. Add some assertions still.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201211183934.169161-9-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/block/block_int.h |  4 ++--
 block/io.c                | 14 +++++++++-----
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 5bbbf9ee0af9..7f41f0990cc0 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -79,12 +79,12 @@ enum BdrvTrackedRequestType {
 typedef struct BdrvTrackedRequest {
     BlockDriverState *bs;
     int64_t offset;
-    uint64_t bytes;
+    int64_t bytes;
     enum BdrvTrackedRequestType type;

     bool serialising;
     int64_t overlap_offset;
-    uint64_t overlap_bytes;
+    int64_t overlap_bytes;

     QLIST_ENTRY(BdrvTrackedRequest) list;
     Coroutine *co; /* owner, used for deadlock detection */
diff --git a/block/io.c b/block/io.c
index b56db913da30..1c23587d18c6 100644
--- a/block/io.c
+++ b/block/io.c
@@ -717,10 +717,10 @@ static void tracked_request_end(BdrvTrackedRequest *req)
 static void tracked_request_begin(BdrvTrackedRequest *req,
                                   BlockDriverState *bs,
                                   int64_t offset,
-                                  uint64_t bytes,
+                                  int64_t bytes,
                                   enum BdrvTrackedRequestType type)
 {
-    assert(bytes <= INT64_MAX && offset <= INT64_MAX - bytes);
+    bdrv_check_request(offset, bytes, &error_abort);

     *req = (BdrvTrackedRequest){
         .bs = bs,
@@ -741,8 +741,10 @@ static void tracked_request_begin(BdrvTrackedRequest *req,
 }

 static bool tracked_request_overlaps(BdrvTrackedRequest *req,
-                                     int64_t offset, uint64_t bytes)
+                                     int64_t offset, int64_t bytes)
 {
+    bdrv_check_request(offset, bytes, &error_abort);
+
     /*        aaaa   bbbb */
     if (offset >= req->overlap_offset + req->overlap_bytes) {
         return false;
@@ -810,8 +812,10 @@ static void tracked_request_set_serialising(BdrvTrackedRequest *req,
                                             uint64_t align)
 {
     int64_t overlap_offset = req->offset & ~(align - 1);
-    uint64_t overlap_bytes = ROUND_UP(req->offset + req->bytes, align)
-                               - overlap_offset;
+    int64_t overlap_bytes =
+        ROUND_UP(req->offset + req->bytes, align) - overlap_offset;
+
+    bdrv_check_request(req->offset, req->bytes, &error_abort);

     if (!req->serialising) {
         qatomic_inc(&req->bs->serialising_in_flight);
-- 
2.30.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F197363E10
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 10:57:51 +0200 (CEST)
Received: from localhost ([::1]:33548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYPj4-0002VT-JC
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 04:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lYPhI-0000XQ-2k
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 04:56:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lYPhF-0000tm-PF
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 04:55:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618822557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DkWiMkt5sIbge2AcrwiT02/uD6ZmQ+1LR8tOvXPaAks=;
 b=cp1yxftu5XUKEy0YqLU8cISbOBLPGE7eLDSeJbG2r1x0cuHmRGCj8LNYKO8XZHr2gEY/CA
 mnV2/2JqfeVz3yKEBQlJi7Odxrl8RRGu+oQ7o5Yao4uFBgmEXQRD4OxnFC+aFg3Q/EeTuR
 puJ9lAicGkcYjyug5zE/OYpmrgxv0J0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-crUD8v1KPg2OvxqZ9KaQxQ-1; Mon, 19 Apr 2021 04:55:55 -0400
X-MC-Unique: crUD8v1KPg2OvxqZ9KaQxQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 234F883DD2B;
 Mon, 19 Apr 2021 08:55:54 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-195.ams2.redhat.com
 [10.36.114.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 987EB5D742;
 Mon, 19 Apr 2021 08:55:51 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 1/8] block: prepare write threshold code for thread safety
Date: Mon, 19 Apr 2021 10:55:34 +0200
Message-Id: <20210419085541.22310-2-eesposit@redhat.com>
In-Reply-To: <20210419085541.22310-1-eesposit@redhat.com>
References: <20210419085541.22310-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Co-developed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/write-threshold.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/block/write-threshold.c b/block/write-threshold.c
index 85b78dc2a9..63040fa4f2 100644
--- a/block/write-threshold.c
+++ b/block/write-threshold.c
@@ -37,18 +37,22 @@ static void write_threshold_disable(BlockDriverState *bs)
     }
 }
 
+static uint64_t treshold_overage(const BdrvTrackedRequest *req,
+                                uint64_t thres)
+{
+    if (thres > 0 && req->offset + req->bytes > thres) {
+        return req->offset + req->bytes - thres;
+    } else {
+        return 0;
+    }
+}
+
 uint64_t bdrv_write_threshold_exceeded(const BlockDriverState *bs,
                                        const BdrvTrackedRequest *req)
 {
-    if (bdrv_write_threshold_is_set(bs)) {
-        if (req->offset > bs->write_threshold_offset) {
-            return (req->offset - bs->write_threshold_offset) + req->bytes;
-        }
-        if ((req->offset + req->bytes) > bs->write_threshold_offset) {
-            return (req->offset + req->bytes) - bs->write_threshold_offset;
-        }
-    }
-    return 0;
+    uint64_t thres = bdrv_write_threshold_get(bs);
+
+    return treshold_overage(req, thres);
 }
 
 static int coroutine_fn before_write_notify(NotifierWithReturn *notifier,
@@ -56,14 +60,14 @@ static int coroutine_fn before_write_notify(NotifierWithReturn *notifier,
 {
     BdrvTrackedRequest *req = opaque;
     BlockDriverState *bs = req->bs;
-    uint64_t amount = 0;
+    uint64_t thres = bdrv_write_threshold_get(bs);
+    uint64_t amount = treshold_overage(req, thres);
 
-    amount = bdrv_write_threshold_exceeded(bs, req);
     if (amount > 0) {
         qapi_event_send_block_write_threshold(
             bs->node_name,
             amount,
-            bs->write_threshold_offset);
+            thres);
 
         /* autodisable to avoid flooding the monitor */
         write_threshold_disable(bs);
-- 
2.30.2



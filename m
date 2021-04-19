Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFE5363E0F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 10:57:46 +0200 (CEST)
Received: from localhost ([::1]:33074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYPiz-0002K2-Sn
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 04:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lYPhK-0000Zt-5Q
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 04:56:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lYPhI-0000vw-K5
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 04:56:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618822560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F7NwFsCFY1ZCxrd9bRPmNUOXiKGCgh0XcDto2jSEUCQ=;
 b=i7fDYh0d95vWOWQfukIOZNs7wAqgRWFDVBMLe8WVhq3gRlGRcpk7k9K17VmDELrcK1xm/7
 oQPqErrlQlvwmkd9malBUk3huj7h4ZlMQAtXXHq9l61+3brl1W9RpXkUja308yzh8G72yd
 4f7Y/LSC38fB5YTl/jHBWrpuo7E999I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-cxtm6m-yN_uXk7RBST2ShA-1; Mon, 19 Apr 2021 04:55:58 -0400
X-MC-Unique: cxtm6m-yN_uXk7RBST2ShA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F579107ACF6;
 Mon, 19 Apr 2021 08:55:57 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-195.ams2.redhat.com
 [10.36.114.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93B5C5D742;
 Mon, 19 Apr 2021 08:55:54 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 2/8] block: protect write threshold QMP commands from
 concurrent requests
Date: Mon, 19 Apr 2021 10:55:35 +0200
Message-Id: <20210419085541.22310-3-eesposit@redhat.com>
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

For simplicity, use bdrv_drained_begin/end to avoid concurrent
writes to the write threshold, or reading it while it is being set.
qmp_block_set_write_threshold is protected by the BQL.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Co-developed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/write-threshold.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/block/write-threshold.c b/block/write-threshold.c
index 63040fa4f2..77c74bdaa7 100644
--- a/block/write-threshold.c
+++ b/block/write-threshold.c
@@ -111,7 +111,6 @@ void qmp_block_set_write_threshold(const char *node_name,
                                    Error **errp)
 {
     BlockDriverState *bs;
-    AioContext *aio_context;
 
     bs = bdrv_find_node(node_name);
     if (!bs) {
@@ -119,10 +118,8 @@ void qmp_block_set_write_threshold(const char *node_name,
         return;
     }
 
-    aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
-
+    /* Avoid a concurrent write_threshold_disable.  */
+    bdrv_drained_begin(bs);
     bdrv_write_threshold_set(bs, threshold_bytes);
-
-    aio_context_release(aio_context);
+    bdrv_drained_end(bs);
 }
-- 
2.30.2



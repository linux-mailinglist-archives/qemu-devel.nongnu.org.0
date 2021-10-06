Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8E0423BF1
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 13:06:25 +0200 (CEST)
Received: from localhost ([::1]:44284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY4ki-0004lL-Vn
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 07:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mY4eN-0008O4-Gx
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:59:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mY4eL-00067y-QX
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:59:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633517989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YeewIYlqDUtRpasqAWP1LkKbfuk6/sOHHHhagHP4Nhg=;
 b=cTSRHR6ONbVcmjSGi5n46C7yFfGZG8eF9hYpgvYu2FFXGVutQEEQOC0rxbiKv9lkncF01E
 Jgcx7NfqozRZas5paGSQ0XPZvf1sLl1gVq3e67dmCqHPmb5/aA0cabEyoruKi7blUrKoQ1
 uRaVbdLK9Q5lmsZAYbziuinamRDz3Qc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-p9tn0s4jOLO-zDtDG8HTlA-1; Wed, 06 Oct 2021 06:59:45 -0400
X-MC-Unique: p9tn0s4jOLO-zDtDG8HTlA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D717D1084683;
 Wed,  6 Oct 2021 10:59:44 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC58060BE5;
 Wed,  6 Oct 2021 10:59:42 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 05/13] block: bdrv_insert_node(): doc and style
Date: Wed,  6 Oct 2021 12:59:15 +0200
Message-Id: <20211006105923.223549-6-kwolf@redhat.com>
In-Reply-To: <20211006105923.223549-1-kwolf@redhat.com>
References: <20211006105923.223549-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

 - options & flags is common pair for open-like functions, let's use it
 - add a comment that specifies use of @options

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210920115538.264372-4-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index 5d49188073..3a90407b83 100644
--- a/block.c
+++ b/block.c
@@ -5119,14 +5119,23 @@ static void bdrv_delete(BlockDriverState *bs)
     g_free(bs);
 }
 
-BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *node_options,
+
+/*
+ * Replace @bs by newly created block node.
+ *
+ * @options is a QDict of options to pass to the block drivers, or NULL for an
+ * empty set of options. The reference to the QDict belongs to the block layer
+ * after the call (even on failure), so if the caller intends to reuse the
+ * dictionary, it needs to use qobject_ref() before calling bdrv_open.
+ */
+BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *options,
                                    int flags, Error **errp)
 {
     ERRP_GUARD();
     int ret;
     BlockDriverState *new_node_bs;
 
-    new_node_bs = bdrv_open(NULL, NULL, node_options, flags, errp);
+    new_node_bs = bdrv_open(NULL, NULL, options, flags, errp);
     if (new_node_bs == NULL) {
         error_prepend(errp, "Could not create node: ");
         return NULL;
-- 
2.31.1



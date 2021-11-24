Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A3845B53C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 08:19:41 +0100 (CET)
Received: from localhost ([::1]:57614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpmZA-000727-FZ
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 02:19:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpm2F-0004cz-27
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:45:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpm2A-0004xo-O3
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:45:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637736334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RgPiOty6SQSZvv+ljvE7oqv5NRV+e9qF+8dvJGHLGik=;
 b=L9IQ1vj5JqFYYIvDN6H+skjGVt01OXiZS+k2JHkWDzOvAuuqjughQO1QtGODseG7+326xj
 ayB1B4JfVpx1Svr4HCrG541b1dci9orMmTOFzXOmpFgJnoePpStPC+oYY3uyS1JQvZvRuR
 sAHc+u7jQdnVEFbRRIkgVWlZEwF+csc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-UjSPvipnOM2jZAzNZ8n7dA-1; Wed, 24 Nov 2021 01:45:31 -0500
X-MC-Unique: UjSPvipnOM2jZAzNZ8n7dA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDDF61006AA5;
 Wed, 24 Nov 2021 06:45:29 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C678D60843;
 Wed, 24 Nov 2021 06:45:28 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 10/31] block.c: modify .attach and .detach callbacks of
 child_of_bds
Date: Wed, 24 Nov 2021 01:43:57 -0500
Message-Id: <20211124064418.3120601-11-eesposit@redhat.com>
In-Reply-To: <20211124064418.3120601-1-eesposit@redhat.com>
References: <20211124064418.3120601-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to the assertions put in the previous patch, we should
first drain and then modify the ->children list. In this way
we prevent other iothreads to read the list while it is being
updated.

In this case, moving the drain won't cause any harm, because
child is a parameter of the drain function so it will still be
included in the operation, despite not being in the list.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/block.c b/block.c
index 522a273140..5516c84ec4 100644
--- a/block.c
+++ b/block.c
@@ -1416,6 +1416,7 @@ static void bdrv_child_cb_attach(BdrvChild *child)
 {
     BlockDriverState *bs = child->opaque;
 
+    bdrv_apply_subtree_drain(child, bs);
     assert_bdrv_graph_writable(bs);
     QLIST_INSERT_HEAD(&bs->children, child, next);
 
@@ -1423,7 +1424,6 @@ static void bdrv_child_cb_attach(BdrvChild *child)
         bdrv_backing_attach(child);
     }
 
-    bdrv_apply_subtree_drain(child, bs);
 }
 
 static void bdrv_child_cb_detach(BdrvChild *child)
@@ -1434,10 +1434,9 @@ static void bdrv_child_cb_detach(BdrvChild *child)
         bdrv_backing_detach(child);
     }
 
-    bdrv_unapply_subtree_drain(child, bs);
-
     assert_bdrv_graph_writable(bs);
     QLIST_REMOVE(child, next);
+    bdrv_unapply_subtree_drain(child, bs);
 }
 
 static int bdrv_child_cb_update_filename(BdrvChild *c, BlockDriverState *base,
-- 
2.27.0



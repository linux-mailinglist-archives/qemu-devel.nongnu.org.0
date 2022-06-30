Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D55561585
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 10:57:45 +0200 (CEST)
Received: from localhost ([::1]:41112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6pzc-0003nt-Ex
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 04:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o6puY-0008Rc-HV
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 04:52:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o6puV-0003l7-LB
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 04:52:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656579147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OoQRQIDJ3nnB1/GTgK6zSXC/n1Qlyx+581mVSBmvBDc=;
 b=h9VmxhIc5CnZGntQTFGBqOjhqxo921J3+kFgBAT0t8pKWOozFyKV3KJFXhttDozyQogZAR
 +N7FwCS2at/oQduD3w2Z61/F2TQtdkAZzkDcNLo6qm1EqvnFsIMu/TUAz7DdrafSvuexdW
 K3E4kkgBr4w3uPDN8hiBC2Ag2PvlmXM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-Hi9qnESpMwmwRkJe7EAGrA-1; Thu, 30 Jun 2022 04:52:20 -0400
X-MC-Unique: Hi9qnESpMwmwRkJe7EAGrA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9834882A684;
 Thu, 30 Jun 2022 08:52:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 726F9C15D42;
 Thu, 30 Jun 2022 08:52:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3D01721E690D; Thu, 30 Jun 2022 10:52:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: raphael.norwitz@nutanix.com,
	mst@redhat.com,
	qemu-trivial@nongnu.org
Subject: [PATCH] contrib/vhost-user-blk: Clean up deallocation of
 VuVirtqElement
Date: Thu, 30 Jun 2022 10:52:19 +0200
Message-Id: <20220630085219.1305519-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We allocate VuVirtqElement with g_malloc() in
virtqueue_alloc_element(), but free it with free() in
vhost-user-blk.c.  Harmless, but use g_free() anyway.

One of the calls is guarded by a "not null" condition.  Useless,
because it cannot be null (it's dereferenced right before), and even
it it could be, free() and g_free() do the right thing.  Drop the
conditional.

Fixes: Coverity CID 1490290
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
Not even compile-tested, because I can't figure out how this thing is
supposed to be built.  Its initial commit message says "make
vhost-user-blk", but that doesn't work anymore.

 contrib/vhost-user-blk/vhost-user-blk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user-blk/vhost-user-blk.c
index 9cb78ca1d0..d6932a2645 100644
--- a/contrib/vhost-user-blk/vhost-user-blk.c
+++ b/contrib/vhost-user-blk/vhost-user-blk.c
@@ -106,10 +106,7 @@ static void vub_req_complete(VubReq *req)
                   req->size + 1);
     vu_queue_notify(vu_dev, req->vq);
 
-    if (req->elem) {
-        free(req->elem);
-    }
-
+    g_free(req->elem);
     g_free(req);
 }
 
@@ -243,7 +240,7 @@ static int vub_virtio_process_req(VubDev *vdev_blk,
     /* refer to hw/block/virtio_blk.c */
     if (elem->out_num < 1 || elem->in_num < 1) {
         fprintf(stderr, "virtio-blk request missing headers\n");
-        free(elem);
+        g_free(elem);
         return -1;
     }
 
@@ -325,7 +322,7 @@ static int vub_virtio_process_req(VubDev *vdev_blk,
     return 0;
 
 err:
-    free(elem);
+    g_free(elem);
     g_free(req);
     return -1;
 }
-- 
2.35.3



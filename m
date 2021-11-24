Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6290E45B5EA
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 08:50:57 +0100 (CET)
Received: from localhost ([::1]:33996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpn3Q-0007K4-Dv
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 02:50:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpm3b-0005hi-Ts
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:47:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpm3Z-0005Gt-7a
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:47:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637736420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5TZ4B9vgqjozeQi0aZftOEUaftScXZmdfoUaQoaeBfc=;
 b=QR2730BOT5ms2t30a4R8OGZm567QlvJh2V54Hl0uAFRkAsCML7WmOdw+DN7zNdW7inRwx4
 3xa6bQpbA+xrmaCb//uFb6KI554Yw4lyFAquQv1aV3Bjhusnj8ubBOY/kdcRbu46pbbg6h
 J8h4PUJP52nN2eP9dzYEtF3zhw+vXKk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-SOFueCHfPxuL9bg8GP2HlQ-1; Wed, 24 Nov 2021 01:46:57 -0500
X-MC-Unique: SOFueCHfPxuL9bg8GP2HlQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B69083DD20;
 Wed, 24 Nov 2021 06:46:56 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53529694BD;
 Wed, 24 Nov 2021 06:46:55 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 28/31] block.c: assert BQL lock held in
 bdrv_co_invalidate_cache
Date: Wed, 24 Nov 2021 01:44:15 -0500
Message-Id: <20211124064418.3120601-29-eesposit@redhat.com>
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

bdrv_co_invalidate_cache is special: it is an I/O function,
but uses the block layer permission API, which is GS.

Because of this, we can assert that either the function is
being called with BQL held, and thus can use the permission API,
or make sure that the permission API is not used, by ensuring that
bs (and parents) .open_flags does not contain BDRV_O_INACTIVE.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/block.c b/block.c
index a0309f827d..805974676b 100644
--- a/block.c
+++ b/block.c
@@ -6574,6 +6574,26 @@ void bdrv_init_with_whitelist(void)
     bdrv_init();
 }
 
+static bool bdrv_is_active(BlockDriverState *bs)
+{
+    BdrvChild *parent;
+
+    if (bs->open_flags & BDRV_O_INACTIVE) {
+        return false;
+    }
+
+    QLIST_FOREACH(parent, &bs->parents, next_parent) {
+        if (parent->klass->parent_is_bds) {
+            BlockDriverState *parent_bs = parent->opaque;
+            if (!bdrv_is_active(parent_bs)) {
+                return false;
+            }
+        }
+    }
+
+   return true;
+}
+
 int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
 {
     BdrvChild *child, *parent;
@@ -6585,6 +6605,12 @@ int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
         return -ENOMEDIUM;
     }
 
+    /*
+     * No need to muck with permissions if bs is active.
+     * TODO: should activation be a separate function?
+     */
+    assert(qemu_in_main_thread() || bdrv_is_active(bs));
+
     QLIST_FOREACH(child, &bs->children, next) {
         bdrv_co_invalidate_cache(child->bs, &local_err);
         if (local_err) {
-- 
2.27.0



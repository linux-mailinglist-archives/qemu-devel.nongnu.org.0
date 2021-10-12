Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E751B42A0EB
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 11:22:16 +0200 (CEST)
Received: from localhost ([::1]:60112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maDzD-0005K4-Sb
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 05:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1maDUh-0006Kf-T1
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 04:50:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1maDUf-000344-I4
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 04:50:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634028638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i3+LH3lYbRx/HA/1nDK7nNKMhHsmJRqiTug9JLnVjto=;
 b=Dzmk08hi8h8fArW4pqJocK3n7zf4y0n3KRo1DHR+PwaxxPZBYiuW9fRcUqHQnz9+ZixLjT
 EV4ZaxyEoS1PDGD22uGht/zFXG0ajnKQrW49EDH/W0HGLPJOeYGkYes433bl6RN9XxOEqz
 1piEJCqzzQG9k/JngexJIeCD/yWG+qo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-EQN22AK5O3iXQe4RzeOY5A-1; Tue, 12 Oct 2021 04:50:37 -0400
X-MC-Unique: EQN22AK5O3iXQe4RzeOY5A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E7F41006AB3;
 Tue, 12 Oct 2021 08:50:36 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71C125C232;
 Tue, 12 Oct 2021 08:50:35 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 21/25] block_int-common.h: split function pointers in
 BdrvChildClass
Date: Tue, 12 Oct 2021 04:49:02 -0400
Message-Id: <20211012084906.2060507-22-eesposit@redhat.com>
In-Reply-To: <20211012084906.2060507-1-eesposit@redhat.com>
References: <20211012084906.2060507-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/block/block_int-common.h | 51 ++++++++++++++++++++------------
 1 file changed, 32 insertions(+), 19 deletions(-)

diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 9857e775fe..ea16099c53 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -805,12 +805,16 @@ struct BdrvChildClass {
      */
     bool parent_is_bds;
 
+    /*
+     * Global state (GS) API. These functions run under the BQL lock.
+     *
+     * See include/block/block-global-state.h for more information about
+     * the GS API.
+     */
     void (*inherit_options)(BdrvChildRole role, bool parent_is_format,
                             int *child_flags, QDict *child_options,
                             int parent_flags, QDict *parent_options);
-
     void (*change_media)(BdrvChild *child, bool load);
-    void (*resize)(BdrvChild *child);
 
     /*
      * Returns a name that is supposedly more useful for human users than the
@@ -827,6 +831,32 @@ struct BdrvChildClass {
      */
     char *(*get_parent_desc)(BdrvChild *child);
 
+    void (*attach)(BdrvChild *child);
+    void (*detach)(BdrvChild *child);
+
+    /*
+     * Notifies the parent that the filename of its child has changed (e.g.
+     * because the direct child was removed from the backing chain), so that it
+     * can update its reference.
+     */
+    int (*update_filename)(BdrvChild *child, BlockDriverState *new_base,
+                           const char *filename, Error **errp);
+
+    bool (*can_set_aio_ctx)(BdrvChild *child, AioContext *ctx,
+                        GSList **ignore, Error **errp);
+    void (*set_aio_ctx)(BdrvChild *child, AioContext *ctx, GSList **ignore);
+
+    AioContext *(*get_parent_aio_context)(BdrvChild *child);
+
+    /*
+     * I/O API functions. These functions are thread-safe.
+     *
+     * See include/block/block-io.h for more information about
+     * the I/O API.
+     */
+
+    void (*resize)(BdrvChild *child);
+
     /*
      * If this pair of functions is implemented, the parent doesn't issue new
      * requests after returning from .drained_begin() until .drained_end() is
@@ -859,23 +889,6 @@ struct BdrvChildClass {
      */
     void (*activate)(BdrvChild *child, Error **errp);
     int (*inactivate)(BdrvChild *child);
-
-    void (*attach)(BdrvChild *child);
-    void (*detach)(BdrvChild *child);
-
-    /*
-     * Notifies the parent that the filename of its child has changed (e.g.
-     * because the direct child was removed from the backing chain), so that it
-     * can update its reference.
-     */
-    int (*update_filename)(BdrvChild *child, BlockDriverState *new_base,
-                           const char *filename, Error **errp);
-
-    bool (*can_set_aio_ctx)(BdrvChild *child, AioContext *ctx,
-                            GSList **ignore, Error **errp);
-    void (*set_aio_ctx)(BdrvChild *child, AioContext *ctx, GSList **ignore);
-
-    AioContext *(*get_parent_aio_context)(BdrvChild *child);
 };
 
 extern const BdrvChildClass child_of_bds;
-- 
2.27.0



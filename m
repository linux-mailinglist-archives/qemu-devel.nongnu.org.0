Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C007422C2F
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 17:17:37 +0200 (CEST)
Received: from localhost ([::1]:48488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXmCG-0001n3-Ij
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 11:17:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mXlXo-00045S-RE
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:35:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mXlXm-0005Og-G8
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:35:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633444545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nlwhWrcnpLUlX3V8AoH80tX6/zijmmqi9P7+qNrTHXA=;
 b=AGAvDd/AIDl83Lrkn/5SiZeAN4pN2r/c0MwJc7VxvIPCuJ3Svk6zO4txW1o40nCiuAoRI7
 FpwSrkwE4K/AI2u4F1A7VKum0xVqOR57lsb2Hwp/K+eOvLfeLQH05Sc0v0mgyo8yFJupCy
 Uhnq8oUSoNo6ayfO645qMgNNIE6GSoM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-queWiDcLM_qrBipa4TFIQg-1; Tue, 05 Oct 2021 10:35:44 -0400
X-MC-Unique: queWiDcLM_qrBipa4TFIQg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A8A418D6A25;
 Tue,  5 Oct 2021 14:35:43 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 683251043260;
 Tue,  5 Oct 2021 14:35:42 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 21/25] block_int-common.h: split function pointers in
 BdrvChildClass
Date: Tue,  5 Oct 2021 10:32:11 -0400
Message-Id: <20211005143215.29500-22-eesposit@redhat.com>
In-Reply-To: <20211005143215.29500-1-eesposit@redhat.com>
References: <20211005143215.29500-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
---
 include/block/block_int-common.h | 65 ++++++++++++++++++++++----------
 1 file changed, 46 insertions(+), 19 deletions(-)

diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 184cfab2d6..a6ea824b64 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -798,12 +798,31 @@ struct BdrvChildClass {
      */
     bool parent_is_bds;
 
+    /*
+     * Global state (GS) API. These functions run under the BQL lock.
+     *
+     * If a function modifies the graph, it also uses drain and/or
+     * aio_context_acquire/release to be sure it has unique access.
+     * aio_context locking is needed together with BQL because of
+     * the thread-safe I/O API that concurrently runs and accesses
+     * the graph without the BQL.
+     *
+     * It is important to note that not all of these functions are
+     * necessarily limited to running under the BQL, but they would
+     * require additional auditing and may small thread-safety changes
+     * to move them into the I/O API. Often it's not worth doing that
+     * work since the APIs are only used with the BQL held at the
+     * moment, so they have been placed in the GS API (for now).
+     *
+     * All callers that use these function pointers must
+     * use this assertion:
+     * g_assert(qemu_in_main_thread());
+     * to catch when they are accidentally called without the BQL.
+     */
     void (*inherit_options)(BdrvChildRole role, bool parent_is_format,
                             int *child_flags, QDict *child_options,
                             int parent_flags, QDict *parent_options);
-
     void (*change_media)(BdrvChild *child, bool load);
-    void (*resize)(BdrvChild *child);
 
     /*
      * Returns a name that is supposedly more useful for human users than the
@@ -820,6 +839,31 @@ struct BdrvChildClass {
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
+     * I/O API functions. These functions are thread-safe, and therefore
+     * can run in any thread as long as they have called
+     * aio_context_acquire/release().
+     */
+
+    void (*resize)(BdrvChild *child);
+
     /*
      * If this pair of functions is implemented, the parent doesn't issue new
      * requests after returning from .drained_begin() until .drained_end() is
@@ -852,23 +896,6 @@ struct BdrvChildClass {
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B0B4B290E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 16:26:21 +0100 (CET)
Received: from localhost ([::1]:40288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIXoS-0000Z2-Pb
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 10:26:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nIXIF-0004Hi-Sx
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 09:53:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nIXID-0001uK-4z
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 09:53:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644591180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JPzw9DVEC0L52Z0ySVNGMnGVuSLdQxLNklS5zQDlZvY=;
 b=OzyF21fqyrAdic/5+7ZPlP9bOtJ2HggDAdnttRxF6uvylET4BAEBwVQZSVX7DRqo1AaC52
 +GzswVj6gNYGTDIanWxyJp3jXcD+UyidJiy84AVMmdV+NrCYsremWXUUfQTWp6G8YetrGF
 Bgs6+ClqNlJ0GQQgAvq6LVneddPo/6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-WLcnlnWGPUmhBmHjp6VhlA-1; Fri, 11 Feb 2022 09:52:57 -0500
X-MC-Unique: WLcnlnWGPUmhBmHjp6VhlA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADC668519E2;
 Fri, 11 Feb 2022 14:52:55 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33AC87DE43;
 Fri, 11 Feb 2022 14:52:48 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 27/31] block_int-common.h: split function pointers in
 BdrvChildClass
Date: Fri, 11 Feb 2022 09:51:49 -0500
Message-Id: <20220211145153.2861415-28-eesposit@redhat.com>
In-Reply-To: <20220211145153.2861415-1-eesposit@redhat.com>
References: <20220211145153.2861415-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/block/block_int-common.h | 81 ++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 34 deletions(-)

diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index f05ebb0da3..5a04c778e4 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -830,19 +830,16 @@ struct BdrvChildClass {
      */
     bool parent_is_bds;
 
+    /*
+     * Global state (GS) API. These functions run under the BQL.
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
-
-    /*
-     * Returns a name that is supposedly more useful for human users than the
-     * node name for identifying the node in question (in particular, a BB
-     * name), or NULL if the parent can't provide a better name.
-     */
-    const char *(*get_name)(BdrvChild *child);
 
     /*
      * Returns a malloced string that describes the parent of the child for a
@@ -852,6 +849,47 @@ struct BdrvChildClass {
      */
     char *(*get_parent_desc)(BdrvChild *child);
 
+    /*
+     * Notifies the parent that the child has been activated/inactivated (e.g.
+     * when migration is completing) and it can start/stop requesting
+     * permissions and doing I/O on it.
+     */
+    void (*activate)(BdrvChild *child, Error **errp);
+    int (*inactivate)(BdrvChild *child);
+
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
+    /*
+     * Returns a name that is supposedly more useful for human users than the
+     * node name for identifying the node in question (in particular, a BB
+     * name), or NULL if the parent can't provide a better name.
+     */
+    const char *(*get_name)(BdrvChild *child);
+
     /*
      * If this pair of functions is implemented, the parent doesn't issue new
      * requests after returning from .drained_begin() until .drained_end() is
@@ -876,31 +914,6 @@ struct BdrvChildClass {
      * activity on the child has stopped.
      */
     bool (*drained_poll)(BdrvChild *child);
-
-    /*
-     * Notifies the parent that the child has been activated/inactivated (e.g.
-     * when migration is completing) and it can start/stop requesting
-     * permissions and doing I/O on it.
-     */
-    void (*activate)(BdrvChild *child, Error **errp);
-    int (*inactivate)(BdrvChild *child);
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
2.31.1



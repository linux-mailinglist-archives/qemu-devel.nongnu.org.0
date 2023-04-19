Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 728E96E806B
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 19:31:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppBcG-00040o-0v; Wed, 19 Apr 2023 13:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ppBcE-00040R-Ia
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 13:29:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ppBcC-0002Fh-K8
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 13:29:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681925348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TBoAHwSzsacA9uVcaYGhwuzX40gWj9dN8dhM1t9uyLM=;
 b=YmwO35jJyyVGnJYYoY6X8vO0JK5NiIJzirzwulLD23BB17P3p5E1CSswAPZFDXWJyS6b5P
 lr63nfvzr1O73ICNLMbh2ArmnseeMS8CgPBeudlIa6FAaGYUqJuvIb9GKfU3ltoSt6z0EE
 1k1SP/nuk54zihzmUW+dic4MiMCEcLA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-t53o4P_VPVaZURreVJcYqg-1; Wed, 19 Apr 2023 13:29:06 -0400
X-MC-Unique: t53o4P_VPVaZURreVJcYqg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 186651C189A4;
 Wed, 19 Apr 2023 17:29:05 +0000 (UTC)
Received: from localhost (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C83E540BC798;
 Wed, 19 Apr 2023 17:28:43 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Paul Durrant <paul@xen.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Kevin Wolf <kwolf@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Lieven <pl@kamp.de>, eesposit@redhat.com,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Xie Yongji <xieyongji@bytedance.com>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v2 10/16] block: drain from main loop thread in
 bdrv_co_yield_to_drain()
Date: Wed, 19 Apr 2023 13:28:11 -0400
Message-Id: <20230419172817.272758-11-stefanha@redhat.com>
In-Reply-To: <20230419172817.272758-1-stefanha@redhat.com>
References: <20230419172817.272758-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

For simplicity, always run BlockDevOps .drained_begin/end/poll()
callbacks in the main loop thread. This makes it easier to implement the
callbacks and avoids extra locks.

Move the function pointer declarations from the I/O Code section to the
Global State section in block-backend-common.h.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/sysemu/block-backend-common.h | 25 +++++++++++++------------
 block/io.c                            |  3 ++-
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/include/sysemu/block-backend-common.h b/include/sysemu/block-backend-common.h
index 2391679c56..780cea7305 100644
--- a/include/sysemu/block-backend-common.h
+++ b/include/sysemu/block-backend-common.h
@@ -59,6 +59,19 @@ typedef struct BlockDevOps {
      */
     bool (*is_medium_locked)(void *opaque);
 
+    /*
+     * Runs when the backend receives a drain request.
+     */
+    void (*drained_begin)(void *opaque);
+    /*
+     * Runs when the backend's last drain request ends.
+     */
+    void (*drained_end)(void *opaque);
+    /*
+     * Is the device still busy?
+     */
+    bool (*drained_poll)(void *opaque);
+
     /*
      * I/O API functions. These functions are thread-safe.
      *
@@ -76,18 +89,6 @@ typedef struct BlockDevOps {
      * Runs when the size changed (e.g. monitor command block_resize)
      */
     void (*resize_cb)(void *opaque);
-    /*
-     * Runs when the backend receives a drain request.
-     */
-    void (*drained_begin)(void *opaque);
-    /*
-     * Runs when the backend's last drain request ends.
-     */
-    void (*drained_end)(void *opaque);
-    /*
-     * Is the device still busy?
-     */
-    bool (*drained_poll)(void *opaque);
 } BlockDevOps;
 
 /*
diff --git a/block/io.c b/block/io.c
index db438c7657..6285d67546 100644
--- a/block/io.c
+++ b/block/io.c
@@ -331,7 +331,8 @@ static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
     if (ctx != co_ctx) {
         aio_context_release(ctx);
     }
-    replay_bh_schedule_oneshot_event(ctx, bdrv_co_drain_bh_cb, &data);
+    replay_bh_schedule_oneshot_event(qemu_get_aio_context(),
+                                     bdrv_co_drain_bh_cb, &data);
 
     qemu_coroutine_yield();
     /* If we are resumed from some other event (such as an aio completion or a
-- 
2.39.2



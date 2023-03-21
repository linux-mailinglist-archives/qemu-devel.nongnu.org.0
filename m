Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3D46C2C89
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 09:34:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peXRC-00079A-5g; Tue, 21 Mar 2023 04:33:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QD3Z=7N=kaod.org=clg@ozlabs.org>)
 id 1peXR9-00078J-T0
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 04:33:43 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QD3Z=7N=kaod.org=clg@ozlabs.org>)
 id 1peXR7-0005kb-2R
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 04:33:43 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PglHb33fCz4whh;
 Tue, 21 Mar 2023 19:33:31 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PglHY4Bwhz4xDw;
 Tue, 21 Mar 2023 19:33:29 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH for-8.0 1/3] async: Suppress GCC13 false positive in
 aio_bh_poll()
Date: Tue, 21 Mar 2023 09:33:20 +0100
Message-Id: <20230321083322.663561-2-clg@kaod.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230321083322.663561-1-clg@kaod.org>
References: <20230321083322.663561-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=QD3Z=7N=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Cédric Le Goater <clg@redhat.com>

GCC13 reports an error :

../util/async.c: In function ‘aio_bh_poll’:
include/qemu/queue.h:303:22: error: storing the address of local variable ‘slice’ in ‘*ctx.bh_slice_list.sqh_last’ [-Werror=dangling-pointer=]
  303 |     (head)->sqh_last = &(elm)->field.sqe_next;                          \
      |     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
../util/async.c:169:5: note: in expansion of macro ‘QSIMPLEQ_INSERT_TAIL’
  169 |     QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
      |     ^~~~~~~~~~~~~~~~~~~~
../util/async.c:161:17: note: ‘slice’ declared here
  161 |     BHListSlice slice;
      |                 ^~~~~
../util/async.c:161:17: note: ‘ctx’ declared here

But the local variable 'slice' is removed from the global context list
in following loop of the same routine. Add an intermediate helper to
silent GCC. No functional change.

Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 util/async.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/util/async.c b/util/async.c
index 21016a1ac7..45be1ed218 100644
--- a/util/async.c
+++ b/util/async.c
@@ -155,6 +155,11 @@ void aio_bh_call(QEMUBH *bh)
     bh->cb(bh->opaque);
 }
 
+static void aio_bh_slice_insert(AioContext *ctx, BHListSlice *slice)
+{
+    QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, slice, next);
+}
+
 /* Multiple occurrences of aio_bh_poll cannot be called concurrently. */
 int aio_bh_poll(AioContext *ctx)
 {
@@ -164,7 +169,13 @@ int aio_bh_poll(AioContext *ctx)
 
     /* Synchronizes with QSLIST_INSERT_HEAD_ATOMIC in aio_bh_enqueue().  */
     QSLIST_MOVE_ATOMIC(&slice.bh_list, &ctx->bh_list);
-    QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
+
+    /*
+     * GCC13 [-Werror=dangling-pointer=] complains that the local variable
+     * 'slice' is being stored in a global list in 'ctx->bh_slice_list'.
+     * Use a helper to silent the compiler
+     */
+    aio_bh_slice_insert(ctx, &slice);
 
     while ((s = QSIMPLEQ_FIRST(&ctx->bh_slice_list))) {
         QEMUBH *bh;
-- 
2.39.2



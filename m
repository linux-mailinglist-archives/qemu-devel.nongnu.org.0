Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4597553F8F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 02:31:59 +0200 (CEST)
Received: from localhost ([::1]:35870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3oHn-0003Ga-1M
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 20:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3oCG-0002wG-Eu
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 20:26:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3oCB-00066c-9t
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 20:26:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655857570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g+uMnRaLeQKuWtyD+nFNekjbp1dKQlHO4G3vZ/fbLuw=;
 b=BCOJTNnmSmIVtlzfStVG0IP8xaC7KdtRBN+/WHoVuTwwPtPFOBX/xjE8zhEgc81Vuesud6
 Y9HpJWFyv/K1GqP21gl0i0BKgh5J4cwV65z4CizicUflMFjBc4L3gtBILNVdf07gCYRyoY
 xd9xQgYsObaFUcbaI/GoS99M0eLArcA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-u_RX8FZKN1qZg1ncv0mLwA-1; Tue, 21 Jun 2022 20:26:06 -0400
X-MC-Unique: u_RX8FZKN1qZg1ncv0mLwA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A83C785A582;
 Wed, 22 Jun 2022 00:26:05 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0AA21410F3B;
 Wed, 22 Jun 2022 00:26:03 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hailiang Zhang <zhanghailiang@xfusion.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PULL 07/25] migration: remove unreachble RDMA code in save_hook impl
Date: Wed, 22 Jun 2022 02:25:29 +0200
Message-Id: <20220622002547.64784-8-quintela@redhat.com>
In-Reply-To: <20220622002547.64784-1-quintela@redhat.com>
References: <20220622002547.64784-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Daniel P. Berrangé <berrange@redhat.com>

The QEMUFile 'save_hook' callback has a 'size_t size' parameter.

The RDMA impl of this has logic that takes different actions
depending on whether the value is zero or non-zero. It has
commented out logic that would have taken further actions
if the value was negative.

The only place where the 'save_hook' callback is invoked is
the ram_control_save_page() method, which passes 'size'
through from its caller. The only caller of this method is
in turn control_save_page(). This method unconditionally
passes the 'TARGET_PAGE_SIZE' constant for the 'size' parameter.

IOW, the only scenario for 'size' that can execute in the
qemu_rdma_save_page method is 'size > 0'. The remaining code
has been unreachable since RDMA support was first introduced
9 years ago.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/rdma.c | 120 +++++++++--------------------------------------
 1 file changed, 21 insertions(+), 99 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 8504152f39..c5fa4a408a 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -1462,34 +1462,6 @@ static uint64_t qemu_rdma_make_wrid(uint64_t wr_id, uint64_t index,
     return result;
 }
 
-/*
- * Set bit for unregistration in the next iteration.
- * We cannot transmit right here, but will unpin later.
- */
-static void qemu_rdma_signal_unregister(RDMAContext *rdma, uint64_t index,
-                                        uint64_t chunk, uint64_t wr_id)
-{
-    if (rdma->unregistrations[rdma->unregister_next] != 0) {
-        error_report("rdma migration: queue is full");
-    } else {
-        RDMALocalBlock *block = &(rdma->local_ram_blocks.block[index]);
-
-        if (!test_and_set_bit(chunk, block->unregister_bitmap)) {
-            trace_qemu_rdma_signal_unregister_append(chunk,
-                                                     rdma->unregister_next);
-
-            rdma->unregistrations[rdma->unregister_next++] =
-                    qemu_rdma_make_wrid(wr_id, index, chunk);
-
-            if (rdma->unregister_next == RDMA_SIGNALED_SEND_MAX) {
-                rdma->unregister_next = 0;
-            }
-        } else {
-            trace_qemu_rdma_signal_unregister_already(chunk);
-        }
-    }
-}
-
 /*
  * Consult the connection manager to see a work request
  * (of any kind) has completed.
@@ -3237,23 +3209,7 @@ qio_channel_rdma_shutdown(QIOChannel *ioc,
  *        Offset is an offset to be added to block_offset and used
  *        to also lookup the corresponding RAMBlock.
  *
- *    @size > 0 :
- *        Initiate an transfer this size.
- *
- *    @size == 0 :
- *        A 'hint' or 'advice' that means that we wish to speculatively
- *        and asynchronously unregister this memory. In this case, there is no
- *        guarantee that the unregister will actually happen, for example,
- *        if the memory is being actively transmitted. Additionally, the memory
- *        may be re-registered at any future time if a write within the same
- *        chunk was requested again, even if you attempted to unregister it
- *        here.
- *
- *    @size < 0 : TODO, not yet supported
- *        Unregister the memory NOW. This means that the caller does not
- *        expect there to be any future RDMA transfers and we just want to clean
- *        things up. This is used in case the upper layer owns the memory and
- *        cannot wait for qemu_fclose() to occur.
+ *    @size : Number of bytes to transfer
  *
  *    @bytes_sent : User-specificed pointer to indicate how many bytes were
  *                  sent. Usually, this will not be more than a few bytes of
@@ -3282,61 +3238,27 @@ static size_t qemu_rdma_save_page(QEMUFile *f, void *opaque,
 
     qemu_fflush(f);
 
-    if (size > 0) {
-        /*
-         * Add this page to the current 'chunk'. If the chunk
-         * is full, or the page doesn't belong to the current chunk,
-         * an actual RDMA write will occur and a new chunk will be formed.
-         */
-        ret = qemu_rdma_write(f, rdma, block_offset, offset, size);
-        if (ret < 0) {
-            error_report("rdma migration: write error! %d", ret);
-            goto err;
-        }
+    /*
+     * Add this page to the current 'chunk'. If the chunk
+     * is full, or the page doesn't belong to the current chunk,
+     * an actual RDMA write will occur and a new chunk will be formed.
+     */
+    ret = qemu_rdma_write(f, rdma, block_offset, offset, size);
+    if (ret < 0) {
+        error_report("rdma migration: write error! %d", ret);
+        goto err;
+    }
 
-        /*
-         * We always return 1 bytes because the RDMA
-         * protocol is completely asynchronous. We do not yet know
-         * whether an  identified chunk is zero or not because we're
-         * waiting for other pages to potentially be merged with
-         * the current chunk. So, we have to call qemu_update_position()
-         * later on when the actual write occurs.
-         */
-        if (bytes_sent) {
-            *bytes_sent = 1;
-        }
-    } else {
-        uint64_t index, chunk;
-
-        /* TODO: Change QEMUFileOps prototype to be signed: size_t => long
-        if (size < 0) {
-            ret = qemu_rdma_drain_cq(f, rdma);
-            if (ret < 0) {
-                fprintf(stderr, "rdma: failed to synchronously drain"
-                                " completion queue before unregistration.\n");
-                goto err;
-            }
-        }
-        */
-
-        ret = qemu_rdma_search_ram_block(rdma, block_offset,
-                                         offset, size, &index, &chunk);
-
-        if (ret) {
-            error_report("ram block search failed");
-            goto err;
-        }
-
-        qemu_rdma_signal_unregister(rdma, index, chunk, 0);
-
-        /*
-         * TODO: Synchronous, guaranteed unregistration (should not occur during
-         * fast-path). Otherwise, unregisters will process on the next call to
-         * qemu_rdma_drain_cq()
-        if (size < 0) {
-            qemu_rdma_unregister_waiting(rdma);
-        }
-        */
+    /*
+     * We always return 1 bytes because the RDMA
+     * protocol is completely asynchronous. We do not yet know
+     * whether an  identified chunk is zero or not because we're
+     * waiting for other pages to potentially be merged with
+     * the current chunk. So, we have to call qemu_update_position()
+     * later on when the actual write occurs.
+     */
+    if (bytes_sent) {
+        *bytes_sent = 1;
     }
 
     /*
-- 
2.35.3



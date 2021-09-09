Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 041114048A4
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 12:40:53 +0200 (CEST)
Received: from localhost ([::1]:57190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOHUB-0007Ng-V3
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 06:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mOHNd-0003CK-87
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 06:34:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mOHNU-0002tp-Hp
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 06:34:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631183635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+zeSAaNIJ8LGsRizhhQi316gUImulpKF6JrfafoodSk=;
 b=h/lhVjhTEdmmIvUdy/2FrHYgsi3xvQcIELEPtyRFaqous4dqwyL6hyUmsNimEZOaayf+La
 0Fm3MXD8poV6rxSmDhORde9ompAxxOU99dZKsIC2nPdsMeAX2FKlZ3Xmu9D6LatHzahTtd
 zRdIVdA0JxZ6/oR+GKwIvQJz2sew8iw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-N50eOOwIMuWhtJQGwoHQUQ-1; Thu, 09 Sep 2021 06:33:53 -0400
X-MC-Unique: N50eOOwIMuWhtJQGwoHQUQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 c2-20020a7bc8420000b0290238db573ab7so672857wml.5
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 03:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+zeSAaNIJ8LGsRizhhQi316gUImulpKF6JrfafoodSk=;
 b=FvhAYWW8Tv2Ujl/iJ2J4IE9evMnOpCfWU3n4R1nR0U5TsdHtmOe0s+tpcwDfAyAlCJ
 Vmk6WOm91/fybSvqM1DsUyFAezVIfGPN20Lx3d6jXzHrcY5KudcXrtsGBLhDTJIo9a9T
 zl+FuYEWpvk/QibHlLT67aIPNrDsNlZqnVE5NL8jMV7zxlzRGJ+SYDOSZlVxegwkNSbK
 jVvIHZ3t7/KHuA0A48K7TZD5w6PTDR5MPnTY0Tg6uPn7I4VI5rqsCvdYyfo/ceIR2ayk
 oANZG+25T08gEgHR+fqdQPqH2SkWDADkBwVhZsupCOK74H0dWT6JHYYJS9zjENxHuyvu
 BjTA==
X-Gm-Message-State: AOAM531vDRiDH6YQ6Y9YXvdn1MdytLHuovvpsGeLBJrdSGhDSo1gf6oz
 8M2R9GezITPNmhuYmALIwU8qVmF6YQZpz8JkEbwhI01W3Xnh0S8WpUJpW5zBPKNH1xbbhxy0DCg
 cYtKES2WhZOmCd+RlmD4txGKx+6RVwAnoFKeUudoXNFp2cX78tpXY6qPP6uXzcadw2TU=
X-Received: by 2002:a5d:67c3:: with SMTP id n3mr2732264wrw.201.1631183631799; 
 Thu, 09 Sep 2021 03:33:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpeSjt+bPW563wgyB0xmBroPmW2z1oubkumNWhpEM9aOFvB8Rdod0qEB4tXZV4cZV0uuDtbQ==
X-Received: by 2002:a5d:67c3:: with SMTP id n3mr2732230wrw.201.1631183631493; 
 Thu, 09 Sep 2021 03:33:51 -0700 (PDT)
Received: from localhost (static-201-64-63-95.ipcom.comunitel.net.
 [95.63.64.201])
 by smtp.gmail.com with ESMTPSA id x13sm1340531wrg.62.2021.09.09.03.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 03:33:51 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/7] migration/rdma: Try to register On-Demand Paging memory
 region
Date: Thu,  9 Sep 2021 12:33:42 +0200
Message-Id: <20210909103346.1990-4-quintela@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210909103346.1990-1-quintela@redhat.com>
References: <20210909103346.1990-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Li Zhijian <lizhijian@cn.fujitsu.com>

Previously, for the fsdax mem-backend-file, it will register failed with
Operation not supported. In this case, we can try to register it with
On-Demand Paging[1] like what rpma_mr_reg() does on rpma[2].

[1]: https://community.mellanox.com/s/article/understanding-on-demand-paging--odp-x
[2]: http://pmem.io/rpma/manpages/v0.9.0/rpma_mr_reg.3

CC: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/rdma.c       | 73 ++++++++++++++++++++++++++++++------------
 migration/trace-events |  1 +
 2 files changed, 54 insertions(+), 20 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 5c2d113aa9..eb80431aae 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -1117,19 +1117,47 @@ static int qemu_rdma_alloc_qp(RDMAContext *rdma)
     return 0;
 }
 
+/* Check whether On-Demand Paging is supported by RDAM device */
+static bool rdma_support_odp(struct ibv_context *dev)
+{
+    struct ibv_device_attr_ex attr = {0};
+    int ret = ibv_query_device_ex(dev, NULL, &attr);
+    if (ret) {
+        return false;
+    }
+
+    if (attr.odp_caps.general_caps & IBV_ODP_SUPPORT) {
+        return true;
+    }
+
+    return false;
+}
+
 static int qemu_rdma_reg_whole_ram_blocks(RDMAContext *rdma)
 {
     int i;
     RDMALocalBlocks *local = &rdma->local_ram_blocks;
 
     for (i = 0; i < local->nb_blocks; i++) {
+        int access = IBV_ACCESS_LOCAL_WRITE | IBV_ACCESS_REMOTE_WRITE;
+
         local->block[i].mr =
             ibv_reg_mr(rdma->pd,
                     local->block[i].local_host_addr,
-                    local->block[i].length,
-                    IBV_ACCESS_LOCAL_WRITE |
-                    IBV_ACCESS_REMOTE_WRITE
+                    local->block[i].length, access
                     );
+
+        if (!local->block[i].mr &&
+            errno == ENOTSUP && rdma_support_odp(rdma->verbs)) {
+                access |= IBV_ACCESS_ON_DEMAND;
+                /* register ODP mr */
+                local->block[i].mr =
+                    ibv_reg_mr(rdma->pd,
+                               local->block[i].local_host_addr,
+                               local->block[i].length, access);
+                trace_qemu_rdma_register_odp_mr(local->block[i].block_name);
+        }
+
         if (!local->block[i].mr) {
             perror("Failed to register local dest ram block!");
             break;
@@ -1215,28 +1243,33 @@ static int qemu_rdma_register_and_get_keys(RDMAContext *rdma,
      */
     if (!block->pmr[chunk]) {
         uint64_t len = chunk_end - chunk_start;
+        int access = rkey ? IBV_ACCESS_LOCAL_WRITE | IBV_ACCESS_REMOTE_WRITE :
+                     0;
 
         trace_qemu_rdma_register_and_get_keys(len, chunk_start);
 
-        block->pmr[chunk] = ibv_reg_mr(rdma->pd,
-                chunk_start, len,
-                (rkey ? (IBV_ACCESS_LOCAL_WRITE |
-                        IBV_ACCESS_REMOTE_WRITE) : 0));
-
-        if (!block->pmr[chunk]) {
-            perror("Failed to register chunk!");
-            fprintf(stderr, "Chunk details: block: %d chunk index %d"
-                            " start %" PRIuPTR " end %" PRIuPTR
-                            " host %" PRIuPTR
-                            " local %" PRIuPTR " registrations: %d\n",
-                            block->index, chunk, (uintptr_t)chunk_start,
-                            (uintptr_t)chunk_end, host_addr,
-                            (uintptr_t)block->local_host_addr,
-                            rdma->total_registrations);
-            return -1;
+        block->pmr[chunk] = ibv_reg_mr(rdma->pd, chunk_start, len, access);
+        if (!block->pmr[chunk] &&
+            errno == ENOTSUP && rdma_support_odp(rdma->verbs)) {
+            access |= IBV_ACCESS_ON_DEMAND;
+            /* register ODP mr */
+            block->pmr[chunk] = ibv_reg_mr(rdma->pd, chunk_start, len, access);
+            trace_qemu_rdma_register_odp_mr(block->block_name);
         }
-        rdma->total_registrations++;
     }
+    if (!block->pmr[chunk]) {
+        perror("Failed to register chunk!");
+        fprintf(stderr, "Chunk details: block: %d chunk index %d"
+                        " start %" PRIuPTR " end %" PRIuPTR
+                        " host %" PRIuPTR
+                        " local %" PRIuPTR " registrations: %d\n",
+                        block->index, chunk, (uintptr_t)chunk_start,
+                        (uintptr_t)chunk_end, host_addr,
+                        (uintptr_t)block->local_host_addr,
+                        rdma->total_registrations);
+        return -1;
+    }
+    rdma->total_registrations++;
 
     if (lkey) {
         *lkey = block->pmr[chunk]->lkey;
diff --git a/migration/trace-events b/migration/trace-events
index a1c0f034ab..5f6aa580de 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -212,6 +212,7 @@ qemu_rdma_poll_write(const char *compstr, int64_t comp, int left, uint64_t block
 qemu_rdma_poll_other(const char *compstr, int64_t comp, int left) "other completion %s (%" PRId64 ") received left %d"
 qemu_rdma_post_send_control(const char *desc) "CONTROL: sending %s.."
 qemu_rdma_register_and_get_keys(uint64_t len, void *start) "Registering %" PRIu64 " bytes @ %p"
+qemu_rdma_register_odp_mr(const char *name) "Try to register On-Demand Paging memory region: %s"
 qemu_rdma_registration_handle_compress(int64_t length, int index, int64_t offset) "Zapping zero chunk: %" PRId64 " bytes, index %d, offset %" PRId64
 qemu_rdma_registration_handle_finished(void) ""
 qemu_rdma_registration_handle_ram_blocks(void) ""
-- 
2.31.1



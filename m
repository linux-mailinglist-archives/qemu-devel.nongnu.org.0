Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D116433266
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 11:36:38 +0200 (CEST)
Received: from localhost ([::1]:50652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mclXx-0005Ic-E0
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 05:36:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mclQz-0003zs-OG
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:29:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mclQx-0005z8-Mz
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:29:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634635763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pdpP0Zp1A+q+fYKgjolSVvB7+MurDG7TM3Ho1yQv9xE=;
 b=jNs3biwZmj0oPZSpOekvrJqZ4E0cvu09dCXairJhREcdGMgMl3F1Ehb2031C8tWi26ubdK
 0dzk/g/dQA4RvNpxIcaccfjPIc0Q8OT0XkHc+OQLi41y4+WHerTKbww14a94MB8j7fkQM7
 l3ptMZwY8jXdHDsQnAGAfjuRsz9iyog=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-Y3fN5ZR6NHOUFbtKwqcTuQ-1; Tue, 19 Oct 2021 05:29:19 -0400
X-MC-Unique: Y3fN5ZR6NHOUFbtKwqcTuQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 s25-20020a7bc399000000b0030da0f36afeso918325wmj.1
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 02:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pdpP0Zp1A+q+fYKgjolSVvB7+MurDG7TM3Ho1yQv9xE=;
 b=QD2/flYXpuk1hk+adSFizqIMV26IqMXT3fX663nYF+pbp2BROBPclpFMZ18sRd/nL4
 bWhtFB9+7JawzMg43oz6HeZANeKDtogUEAVFV42tWzu2mSwMGKdCQ9aZe5BtXoCh7YKR
 lxoYxsNI5BemFfjIvxYo/3SOsWbOUTOdO1gyqcSIC1rmCuVPOxuIiysoRe5eFt1TeYmR
 XByMhsbYED5tEYNnVGoPP3sCZqAEYS+fUdJ7K6pLdZ8YjkOpfAYSvhgOoOe4u+tUkdSJ
 3LSoyDlPbncNM6osjsG/xbtdGmxFSgOQ/PTKYC8U1aWZiY0N51iBj/tTb8JrjbE1IFg7
 vNgg==
X-Gm-Message-State: AOAM530rUydlbYqk7q3TdPGFIsCsZG4G1jxUQOMSZZKidDwAaEcwiocT
 SRwex2N8XXT3FlAz27TUKrvZa9TCgFm7WTbND4Iamw5adOPhtxb2ZxS75wphObqa+YN2aCvguc4
 IJGVkhBDNYMfJu6gVQb8r9Tk4aOStwlp1s3Z+f5TjZuzJjZ5fS6ISp0mFs+w3CvnBsOg=
X-Received: by 2002:a05:6000:1869:: with SMTP id
 d9mr41543640wri.161.1634635758236; 
 Tue, 19 Oct 2021 02:29:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPaCka0D7C1Ihf8BbB+Y34jq73qxUJvJelJCY+iz4BJTwthAOT+OHIOXB8tVRSdzkrJ2Vhrg==
X-Received: by 2002:a05:6000:1869:: with SMTP id
 d9mr41543615wri.161.1634635758010; 
 Tue, 19 Oct 2021 02:29:18 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id r4sm18320888wrz.58.2021.10.19.02.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 02:29:17 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/7] migration/rdma: Try to register On-Demand Paging memory
 region
Date: Tue, 19 Oct 2021 11:29:06 +0200
Message-Id: <20211019092907.5255-7-quintela@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211019092907.5255-1-quintela@redhat.com>
References: <20211019092907.5255-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reviewed-by: Juan Quintela <quintela@redhat.com>
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



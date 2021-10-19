Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B69433245
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 11:32:11 +0200 (CEST)
Received: from localhost ([::1]:40712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mclTe-0006sG-TW
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 05:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mclQy-0003wS-Km
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:29:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mclQw-0005u4-Rh
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:29:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634635762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=apcd1sPYUX4KQiw1ezZjVt1xKXzOXDw++gGzZ5Ff3ns=;
 b=YJ0PIJYo8RRbmo3wDBMuLqe3I+jtfsgAeUXwUuJHESn9JAc5qGeXn49495QEFDZYVueB3D
 cd3wqFd68wme/WkUY8GvwVudFNXc+JeQyLcwBtcx3JjE83lkZr7Idcx1J1Fiq/qooTJrJb
 cQC++G1rp5nYoLeUYKYXdtX++r2Z8vo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-b2ViE165N-6uuT-0fqs70g-1; Tue, 19 Oct 2021 05:29:21 -0400
X-MC-Unique: b2ViE165N-6uuT-0fqs70g-1
Received: by mail-wm1-f72.google.com with SMTP id
 n9-20020a1c7209000000b0030da7d466b8so912559wmc.5
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 02:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=apcd1sPYUX4KQiw1ezZjVt1xKXzOXDw++gGzZ5Ff3ns=;
 b=lgv7ZNKDTQMOFVK4wrf66T7DPcMRc3ilmeIKJV5pucY8jiD3iDekrv9jT9b5Hh756q
 rX4M5kbKmkFHkW2HPG70My3QtDzmusLkWCE5gzC9Z6hHpbS6T8becJO8HRZhJ2DUbzjw
 7Mip2FNBPFDGNryZXJj7IMYE7lis58qdJoOV040NW2nZEscfEDCV8QL+mFvKHtL5jWLb
 rGecFUTbpMz2CxwB1IDE+A+KiPxFsWETQCLqXs0vgz4k2XHHM+n88dNieKS8qc5BqfMg
 9/6gNynMoWocdiht/nC6e0c6wem3h7t3AJby+8xjDu6nre4S8GRUVYBWbgymgaWUJjss
 4GWg==
X-Gm-Message-State: AOAM531buYURqQ55JY7QznveskAtm+bsCM1dukJM87cQMnVgxy30DyKo
 QsB2wJSA1T8lWFVHodeqks9r1wI4fEzIQ3J6NIjl/qFWoSUqrBfggImcowSCuwWHNt7vom7Nppl
 sz/QfOsGABhKWnibe5okcrGrlsDoND6rJPz1pg8HRvBBIGPuqYkU0xHm2T7lHHOSetjg=
X-Received: by 2002:a05:600c:4108:: with SMTP id
 j8mr4869485wmi.15.1634635759579; 
 Tue, 19 Oct 2021 02:29:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfFAD/8L8nARnSLtvu9bs9wJUj+mgHzjLDeKqNnIpTANK3pwcwiJKwcxIA0E/obBGgsqkxQg==
X-Received: by 2002:a05:600c:4108:: with SMTP id
 j8mr4869451wmi.15.1634635759249; 
 Tue, 19 Oct 2021 02:29:19 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id h206sm1748558wmh.33.2021.10.19.02.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 02:29:18 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 7/7] migration/rdma: advise prefetch write for ODP region
Date: Tue, 19 Oct 2021 11:29:07 +0200
Message-Id: <20211019092907.5255-8-quintela@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
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

The responder mr registering with ODP will sent RNR NAK back to
the requester in the face of the page fault.
---------
ibv_poll_cq wc.status=13 RNR retry counter exceeded!
ibv_poll_cq wrid=WRITE RDMA!
---------
ibv_advise_mr(3) helps to make pages present before the actual IO is
conducted so that the responder does page fault as little as possible.

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 meson.build            |  6 ++++++
 migration/rdma.c       | 42 ++++++++++++++++++++++++++++++++++++++++++
 migration/trace-events |  1 +
 3 files changed, 49 insertions(+)

diff --git a/meson.build b/meson.build
index 5e7946776d..9ed9a993e2 100644
--- a/meson.build
+++ b/meson.build
@@ -1530,6 +1530,12 @@ config_host_data.set('HAVE_COPY_FILE_RANGE', cc.has_function('copy_file_range'))
 config_host_data.set('HAVE_OPENPTY', cc.has_function('openpty', dependencies: util))
 config_host_data.set('HAVE_STRCHRNUL', cc.has_function('strchrnul'))
 config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
+if rdma.found()
+  config_host_data.set('HAVE_IBV_ADVISE_MR',
+                       cc.has_function('ibv_advise_mr',
+                                       args: config_host['RDMA_LIBS'].split(),
+                                       prefix: '#include <infiniband/verbs.h>'))
+endif
 
 # has_header_symbol
 config_host_data.set('CONFIG_BYTESWAP_H',
diff --git a/migration/rdma.c b/migration/rdma.c
index eb80431aae..2a3c7889b9 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -1133,6 +1133,32 @@ static bool rdma_support_odp(struct ibv_context *dev)
     return false;
 }
 
+/*
+ * ibv_advise_mr to avoid RNR NAK error as far as possible.
+ * The responder mr registering with ODP will sent RNR NAK back to
+ * the requester in the face of the page fault.
+ */
+static void qemu_rdma_advise_prefetch_mr(struct ibv_pd *pd, uint64_t addr,
+                                         uint32_t len,  uint32_t lkey,
+                                         const char *name, bool wr)
+{
+#ifdef HAVE_IBV_ADVISE_MR
+    int ret;
+    int advice = wr ? IBV_ADVISE_MR_ADVICE_PREFETCH_WRITE :
+                 IBV_ADVISE_MR_ADVICE_PREFETCH;
+    struct ibv_sge sg_list = {.lkey = lkey, .addr = addr, .length = len};
+
+    ret = ibv_advise_mr(pd, advice,
+                        IBV_ADVISE_MR_FLAG_FLUSH, &sg_list, 1);
+    /* ignore the error */
+    if (ret) {
+        trace_qemu_rdma_advise_mr(name, len, addr, strerror(errno));
+    } else {
+        trace_qemu_rdma_advise_mr(name, len, addr, "successed");
+    }
+#endif
+}
+
 static int qemu_rdma_reg_whole_ram_blocks(RDMAContext *rdma)
 {
     int i;
@@ -1156,6 +1182,15 @@ static int qemu_rdma_reg_whole_ram_blocks(RDMAContext *rdma)
                                local->block[i].local_host_addr,
                                local->block[i].length, access);
                 trace_qemu_rdma_register_odp_mr(local->block[i].block_name);
+
+                if (local->block[i].mr) {
+                    qemu_rdma_advise_prefetch_mr(rdma->pd,
+                                    (uintptr_t)local->block[i].local_host_addr,
+                                    local->block[i].length,
+                                    local->block[i].mr->lkey,
+                                    local->block[i].block_name,
+                                    true);
+                }
         }
 
         if (!local->block[i].mr) {
@@ -1255,6 +1290,13 @@ static int qemu_rdma_register_and_get_keys(RDMAContext *rdma,
             /* register ODP mr */
             block->pmr[chunk] = ibv_reg_mr(rdma->pd, chunk_start, len, access);
             trace_qemu_rdma_register_odp_mr(block->block_name);
+
+            if (block->pmr[chunk]) {
+                qemu_rdma_advise_prefetch_mr(rdma->pd, (uintptr_t)chunk_start,
+                                            len, block->pmr[chunk]->lkey,
+                                            block->block_name, rkey);
+
+            }
         }
     }
     if (!block->pmr[chunk]) {
diff --git a/migration/trace-events b/migration/trace-events
index 5f6aa580de..a8ae163707 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -213,6 +213,7 @@ qemu_rdma_poll_other(const char *compstr, int64_t comp, int left) "other complet
 qemu_rdma_post_send_control(const char *desc) "CONTROL: sending %s.."
 qemu_rdma_register_and_get_keys(uint64_t len, void *start) "Registering %" PRIu64 " bytes @ %p"
 qemu_rdma_register_odp_mr(const char *name) "Try to register On-Demand Paging memory region: %s"
+qemu_rdma_advise_mr(const char *name, uint32_t len, uint64_t addr, const char *res) "Try to advise block %s prefetch at %" PRIu32 "@0x%" PRIx64 ": %s"
 qemu_rdma_registration_handle_compress(int64_t length, int index, int64_t offset) "Zapping zero chunk: %" PRId64 " bytes, index %d, offset %" PRId64
 qemu_rdma_registration_handle_finished(void) ""
 qemu_rdma_registration_handle_ram_blocks(void) ""
-- 
2.31.1



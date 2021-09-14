Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C5B40ACD7
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 13:54:18 +0200 (CEST)
Received: from localhost ([::1]:45400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ70y-0007sX-8p
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 07:54:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mQ6yx-0005At-OH
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 07:52:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mQ6yw-0007On-2k
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 07:52:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631620328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Htv2iSTGhHdXCFIgEcI1bqNZV3sh6s2QTPG+t/Ioz6Y=;
 b=cmRrI/UlkiNgbXbpqkFYJnev7+g+yJ51M5cqGj0yxzv7wF1QdfEXz0EKgtdRlUF2CbgOr7
 D9mN0JYWEXVYL5i+7UtHbjsvYQmt1AAFP5YsOMRFElLELIcAwJgQB/X2bv9pgASGhtcme1
 BdmfucN8y/lwcRqBYzrqbW0roBYhcNI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-qZkUmZ_INHif4g2JfyCzmw-1; Tue, 14 Sep 2021 07:52:05 -0400
X-MC-Unique: qZkUmZ_INHif4g2JfyCzmw-1
Received: by mail-wm1-f72.google.com with SMTP id
 g70-20020a1c2049000000b00303d06c20b2so1105952wmg.0
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 04:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Htv2iSTGhHdXCFIgEcI1bqNZV3sh6s2QTPG+t/Ioz6Y=;
 b=B4aXC198TsY0wXNzwvfgLwc8lZ8xlJdSTcUwRa6oO9ZhmN2aAJaoqms20JjOlxX42Q
 LsdsRDv1YRhSsjzyb1Z37gr67VB0cWeEW9ajCWa6v6N7qUTCnKj0O/PNbSmLO0Vy4z6i
 Tt1NdomdlAqHHskzUBXJHhFDUI+jxsUgAE9VviWB3/6k0nvWBV8oSxtjxZISSO4HnArz
 k+QzxJtfCTjvcKNNrsA5lD8Dig/d/aXFjZCV+gaPIXB9iFDz7jevYDBgETUp60DcWyj+
 3zPKFYHG1uPoBogrBDjyDRSnyIfqN83pqBga5fGFq2OyLC+pAZmRneA4piNLvZ/8lzxr
 eOQQ==
X-Gm-Message-State: AOAM533nXyfFDBLigLD9u2hwLhlvrKHWy7wegmtxQNEA+DnE+dTi64zt
 ip12OHpxxbuG71o37XJQSTQw+Sqi86AptK94wH1bVC3wdzIfbfiPMsDJXYUgSX2Pk1OzM0glerd
 YDwxM3DkQtuNDmU9wMEyiP4kYQrikmTNVGuHxEpr1sfsdF0FQdWJyMwKT9DFj6Tu/O6M=
X-Received: by 2002:a1c:22c3:: with SMTP id i186mr1728295wmi.145.1631620323946; 
 Tue, 14 Sep 2021 04:52:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxoCf8E4bv/QqZghLsLDLRGc7Gf3qsIelpRRGLkGzq2VPIwBayfwJyURKFF171vrf16qZ7dQ==
X-Received: by 2002:a1c:22c3:: with SMTP id i186mr1728271wmi.145.1631620323723; 
 Tue, 14 Sep 2021 04:52:03 -0700 (PDT)
Received: from localhost (static-109-144-85-188.ipcom.comunitel.net.
 [188.85.144.109])
 by smtp.gmail.com with ESMTPSA id n4sm10605747wra.37.2021.09.14.04.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 04:52:03 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] migration/rdma: advise prefetch write for ODP region
Date: Tue, 14 Sep 2021 13:51:56 +0200
Message-Id: <20210914115157.35868-5-quintela@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210914115157.35868-1-quintela@redhat.com>
References: <20210914115157.35868-1-quintela@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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

To: <quintela@redhat.com>, <dgilbert@redhat.com>
CC: <qemu-devel@nongnu.org>, Li Zhijian <lizhijian@cn.fujitsu.com>, "Marcel Apfelbaum" <marcel.apfelbaum@gmail.com>
Date: Mon, 23 Aug 2021 11:33:58 +0800 (2 weeks, 3 days, 3 hours ago)

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
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/rdma.c       | 40 ++++++++++++++++++++++++++++++++++++++++
 migration/trace-events |  1 +
 2 files changed, 41 insertions(+)

diff --git a/migration/rdma.c b/migration/rdma.c
index eb80431aae..6c2cc3f617 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -1133,6 +1133,30 @@ static bool rdma_support_odp(struct ibv_context *dev)
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
+}
+
 static int qemu_rdma_reg_whole_ram_blocks(RDMAContext *rdma)
 {
     int i;
@@ -1156,6 +1180,15 @@ static int qemu_rdma_reg_whole_ram_blocks(RDMAContext *rdma)
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
@@ -1255,6 +1288,13 @@ static int qemu_rdma_register_and_get_keys(RDMAContext *rdma,
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



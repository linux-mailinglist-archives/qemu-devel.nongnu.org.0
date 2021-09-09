Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F5B40488A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 12:36:03 +0200 (CEST)
Received: from localhost ([::1]:42136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOHPW-0005aG-Gx
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 06:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mOHNX-0002x6-PK
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 06:33:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mOHNT-0002u8-Ul
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 06:33:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631183635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Htv2iSTGhHdXCFIgEcI1bqNZV3sh6s2QTPG+t/Ioz6Y=;
 b=PDK2HSCN+e00y4IxIhspaG+xnP6Q28EG5RDXEvohjFJH577SwW6WwioJtLQSU1lwrlAXQ2
 rG0QICHECOdvxQZg0hYPk27H2LmUmE2acaI4vYF3u4LVPAKJpOdtovVSpmX+u4fjLoKaSF
 3IL8D/kL5Qgazp1DZs7vLVWSmo+ghuw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-b4XiW1FKPritojYG17PONQ-1; Thu, 09 Sep 2021 06:33:54 -0400
X-MC-Unique: b4XiW1FKPritojYG17PONQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 z18-20020a1c7e120000b02902e69f6fa2e0so589110wmc.9
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 03:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Htv2iSTGhHdXCFIgEcI1bqNZV3sh6s2QTPG+t/Ioz6Y=;
 b=yIiRdHH12fTJ0LcEJnGD19q64151IaiJVr7gukEhpcy2580NiqBXGqMGl7awxGN/F8
 IN8+KwdwiblbhaIjhDHmgmqS5rLMLdvlIUxeJcWJLV0T5KmKFpyy6E1DhHCv+GLeU1mW
 BrRgbRB/9S4+V0NE52QFMzgTSBmzrzS6ZdchcM6e0GCKHSBKgERS/eR6WcJNCCf4Unem
 JFO2lO3MBZdqo7lP/+WGStsJ9zobLaeZnbT0uwzLVAdEaf6gE35JPlvbmnahIzMkk/cn
 M8CRN3lZs4kOLLtGA1muBrut8KGZyTDjkhHtzBUIuJHaSbcSqKaRp9nEdpxFFW7iQrJL
 qzFQ==
X-Gm-Message-State: AOAM533R1txlRSZdQIrNKArOjWhAID+Ak7vJ95A7giGd0bUzuJMyBGK7
 kiLS+TdaB2v7gLl7coNapvjkggG/fPKpCxSvvpnEGOll8HsGUiGPMVaLr8pnfIWPCvZR0Jys3Ld
 R2hB9osGT8kdY7kjAjBDfCHWNVPScXyuHSmOdVBpB8cZjH731/dk2+JSyrOV2l/OkqxA=
X-Received: by 2002:adf:e387:: with SMTP id e7mr2767377wrm.199.1631183632799; 
 Thu, 09 Sep 2021 03:33:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdngaImCQZdFmf8n+sxpEcxNnVktYIFAuWLa3JX/FysblNMtZX0V9wD/vXq5D3u3Hza6X2cw==
X-Received: by 2002:adf:e387:: with SMTP id e7mr2767355wrm.199.1631183632599; 
 Thu, 09 Sep 2021 03:33:52 -0700 (PDT)
Received: from localhost (static-201-64-63-95.ipcom.comunitel.net.
 [95.63.64.201])
 by smtp.gmail.com with ESMTPSA id z17sm1464143wrh.66.2021.09.09.03.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 03:33:52 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/7] migration/rdma: advise prefetch write for ODP region
Date: Thu,  9 Sep 2021 12:33:43 +0200
Message-Id: <20210909103346.1990-5-quintela@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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



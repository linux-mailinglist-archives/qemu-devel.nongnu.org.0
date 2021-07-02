Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CA03B9E3E
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 11:29:30 +0200 (CEST)
Received: from localhost ([::1]:58976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzFUH-0004UV-3e
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 05:29:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lzFPs-00050m-6R
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 05:24:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lzFPq-0001dj-9d
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 05:24:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625217893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iiJ+z74eASISUbcozFLozDh4qxKrnkY4zanz2+HAJIE=;
 b=d2BfuhgcmcRB+qAEuankgvQrcEcZFiK/TDsioVeJzOUiSqxzOvezDbm+0ZfU1QW6QJ9nXl
 sIV6z8ixME7pblaDKmRNqH08uiy/dwBtYy8O4uP01pbhtJZUVmaHfdsjRyLiljimwLEt8F
 577I8jhv8x+8964vfSDgE0mVZeqZUGE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-UpDIznWqPFad1t16KJzjNA-1; Fri, 02 Jul 2021 05:24:52 -0400
X-MC-Unique: UpDIznWqPFad1t16KJzjNA-1
Received: by mail-wr1-f71.google.com with SMTP id
 p6-20020a5d45860000b02901258b6ae8a5so3679436wrq.15
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 02:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iiJ+z74eASISUbcozFLozDh4qxKrnkY4zanz2+HAJIE=;
 b=V/WGQHNGNxifQnNU3G4jtwFQxd1Pgf9UN69sguaHCzK9PxA3vrb4KcpPqZuHlWO9+D
 BlmvFuqdWkPQpNV76NRqWU2/rZ8TxIFAgMudgwVaLbiCUFa/HMLKrtRkzgKafiAMwM4f
 jfsUeIqneI94Th42WQusMWBDGsWeAlSXk/Ve47bFrUuVCgDSPTLuPRlXf3orQvJwgVqZ
 /IWmcViLO5mw29iFkoMRh5GzzO6sraz36TzlanXy279K5li8TcxW2Ej7Agv0Xe4/SIEb
 e6kInkixDn8xsm55aYDsKFMTvoNzha5jVP1DtKfBPUw2Dw+ywOScVZY9SCjYe8t8fvr2
 vCnA==
X-Gm-Message-State: AOAM533+b0jff4l7iF6o3o2LJAkGrwVMWU0QJvLyWlsePy/u1absCeBh
 blS87v4P8DIxXCNAvwjlsDy5phE0+9/0A0fPzdIPCk66uVOG7GrOc219Gfrun13MmAi/rZO7yGI
 IhzwZL1yBUpnVtJJrT7URIG8sJLb0De7YyVE9zA2nOpabo5XuK4rKTBvoLU7Wn6K6
X-Received: by 2002:adf:90c6:: with SMTP id i64mr836911wri.168.1625217891000; 
 Fri, 02 Jul 2021 02:24:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylDnMg/+NCOXtFrF+UPntIOpgHVD26moxKi66kfIL9dSFy4Pudojq4JuMRd4ues8mu/gt7ug==
X-Received: by 2002:adf:90c6:: with SMTP id i64mr836891wri.168.1625217890837; 
 Fri, 02 Jul 2021 02:24:50 -0700 (PDT)
Received: from x1w.Ascou-CH1 (pop.92-184-108-94.mobile.abo.orange.fr.
 [92.184.108.94])
 by smtp.gmail.com with ESMTPSA id v17sm2540092wrt.74.2021.07.02.02.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 02:24:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/6] dma: Let dma_memory_set() take MemTxAttrs argument
Date: Fri,  2 Jul 2021 11:24:35 +0200
Message-Id: <20210702092439.989969-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210702092439.989969-1-philmd@redhat.com>
References: <20210702092439.989969-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let devices specify transaction attributes when calling
dma_memory_set().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/ppc/spapr_vio.h | 3 ++-
 include/sysemu/dma.h       | 3 ++-
 hw/nvram/fw_cfg.c          | 3 ++-
 softmmu/dma-helpers.c      | 5 ++---
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
index 4c45f1579fa..c90e74a67dd 100644
--- a/include/hw/ppc/spapr_vio.h
+++ b/include/hw/ppc/spapr_vio.h
@@ -111,7 +111,8 @@ static inline int spapr_vio_dma_write(SpaprVioDevice *dev, uint64_t taddr,
 static inline int spapr_vio_dma_set(SpaprVioDevice *dev, uint64_t taddr,
                                     uint8_t c, uint32_t size)
 {
-    return (dma_memory_set(&dev->as, taddr, c, size) != 0) ?
+    return (dma_memory_set(&dev->as, taddr,
+                           c, size, MEMTXATTRS_UNSPECIFIED) != 0) ?
         H_DEST_PARM : H_SUCCESS;
 }
 
diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 296f3b57c9c..d23516f020a 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -175,9 +175,10 @@ static inline MemTxResult dma_memory_write(AddressSpace *as, dma_addr_t addr,
  * @addr: address within that address space
  * @c: constant byte to fill the memory
  * @len: the number of bytes to fill with the constant byte
+ * @attrs: memory transaction attributes
  */
 MemTxResult dma_memory_set(AddressSpace *as, dma_addr_t addr,
-                           uint8_t c, dma_addr_t len);
+                           uint8_t c, dma_addr_t len, MemTxAttrs attrs);
 
 /**
  * address_space_map: Map a physical memory region into a host virtual address.
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 9b8dcca4ead..d3c3b15a728 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -399,7 +399,8 @@ static void fw_cfg_dma_transfer(FWCfgState *s)
              * tested before.
              */
             if (read) {
-                if (dma_memory_set(s->dma_as, dma.address, 0, len)) {
+                if (dma_memory_set(s->dma_as, dma.address, 0, len,
+                                   MEMTXATTRS_UNSPECIFIED)) {
                     dma.control |= FW_CFG_DMA_CTL_ERROR;
                 }
             }
diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index 7d766a5e89a..1f07217ad4a 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -19,7 +19,7 @@
 /* #define DEBUG_IOMMU */
 
 MemTxResult dma_memory_set(AddressSpace *as, dma_addr_t addr,
-                           uint8_t c, dma_addr_t len)
+                           uint8_t c, dma_addr_t len, MemTxAttrs attrs)
 {
     dma_barrier(as, DMA_DIRECTION_FROM_DEVICE);
 
@@ -31,8 +31,7 @@ MemTxResult dma_memory_set(AddressSpace *as, dma_addr_t addr,
     memset(fillbuf, c, FILLBUF_SIZE);
     while (len > 0) {
         l = len < FILLBUF_SIZE ? len : FILLBUF_SIZE;
-        error |= address_space_write(as, addr, MEMTXATTRS_UNSPECIFIED,
-                                     fillbuf, l);
+        error |= address_space_write(as, addr, attrs, fillbuf, l);
         len -= l;
         addr += l;
     }
-- 
2.31.1



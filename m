Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0DA5693AC
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 22:54:44 +0200 (CEST)
Received: from localhost ([::1]:35308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9C2k-0004iI-OE
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 16:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLi-0000TK-3r; Wed, 06 Jul 2022 16:10:14 -0400
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31]:34401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLf-0003UU-QE; Wed, 06 Jul 2022 16:10:13 -0400
Received: by mail-vs1-xe31.google.com with SMTP id a184so7128050vsa.1;
 Wed, 06 Jul 2022 13:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TQC0nKVqL+YwppCW0gix2MjFglMBhkWLtlXaCfh9Oxg=;
 b=ndn7rORVG+EdKHIAaXrB2Ao8p4GYrRNRTVl1aDV2aSqWOfAVGLIlN1l+fDWVW9Zfxe
 u0SaCJPCZZaPpLow10VKkCYUxVm0IZu2rbV9zKkdoTazO4nE+Zx5bkiaP4MZaXJbltiK
 qf1s/KMhLEVX5uMNDjBQ7gZxccMoMJLN1T1AEG7cNHCUSao24w6G8EyOkIrGVsa2nTBx
 RNwRIRhxptV/K1cESRoY3JjrrPyNF4EzU6zDlF74G4oLPhE08jdc87Igg3KtX862q1nB
 rxovFELt16IxO5/8oHpzZur4K4E5/xa/WYAy0AgBPFOJkE/f3nV445y6mJ+/xmG5CWVV
 /Wkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TQC0nKVqL+YwppCW0gix2MjFglMBhkWLtlXaCfh9Oxg=;
 b=n0asCEA9XpTT6hrulwLE9N720C8DQsYL+avgIAn0iVRbXKgMSc1dwkZFL4+ssB8wSL
 3Lg0BPkHuZ5vN1aA6kq8rtZKLHfpaKL8s3/Ggiva6ka92/u2O+1v5Oxqhgtczi23R9zc
 A91RT1FDSL6ir8mHHdDVqq/w5TV9Tk5/9eo1zIQw29mKBcWzdD9AEX1kDUl45CsuPQqR
 u1IpFiniwQ+hZSd4L6IIg64nKuUWDNgUjcWD5u+GkQBF3Aa6HNjV07nRW7RJWL7URs/h
 QDU3VlpeUmahqY/wLunWhzWc4y3WT/n2nooBNdDDNtWNR2h5/g/5GL52Y8qJTQ1kfiQn
 GEkg==
X-Gm-Message-State: AJIora/qULd+765aq/3Ovf6mz73TIXtKkD6r919uC+ALfJ7p+ESAY7JP
 G+y7Bjia8TzNlAM31uvQnwfduTWAhAQ=
X-Google-Smtp-Source: AGRyM1sVMqFhk8avzvBDZy2f+G0IeDiFC3cTBB7zc53PXuWPI+1UbDfurgRhTFEOeXpy/Sf6QFzngg==
X-Received: by 2002:a67:c489:0:b0:354:5f35:66f9 with SMTP id
 d9-20020a67c489000000b003545f3566f9mr25266765vsk.33.1657138210357; 
 Wed, 06 Jul 2022 13:10:10 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:10:10 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: [PULL 10/34] spapr/ddw: Reset DMA when the last non-default window is
 removed
Date: Wed,  6 Jul 2022 17:09:22 -0300
Message-Id: <20220706200946.471114-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706200946.471114-1-danielhb413@gmail.com>
References: <20220706200946.471114-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Alexey Kardashevskiy <aik@ozlabs.ru>

PAPR+/LoPAPR says:
===
The platform must restore the default DMA window for the PE on a call
to the ibm,remove-pe-dma-window RTAS call when all of the following
are true:
 a. The call removes the last DMA window remaining for the PE.
 b. The DMA window being removed is not the default window

===

This resets DMA as PAPR mandates.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220622052955.1069903-1-aik@ozlabs.ru>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_iommu.c    |  3 ++-
 hw/ppc/spapr_pci.c      |  1 +
 hw/ppc/spapr_rtas_ddw.c | 15 +++++++++++++++
 include/hw/ppc/spapr.h  |  1 +
 4 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_iommu.c b/hw/ppc/spapr_iommu.c
index 81e5a1aea3..63e34d457a 100644
--- a/hw/ppc/spapr_iommu.c
+++ b/hw/ppc/spapr_iommu.c
@@ -279,7 +279,7 @@ static const VMStateDescription vmstate_spapr_tce_table_ex = {
 
 static const VMStateDescription vmstate_spapr_tce_table = {
     .name = "spapr_iommu",
-    .version_id = 2,
+    .version_id = 3,
     .minimum_version_id = 2,
     .pre_save = spapr_tce_table_pre_save,
     .post_load = spapr_tce_table_post_load,
@@ -292,6 +292,7 @@ static const VMStateDescription vmstate_spapr_tce_table = {
         VMSTATE_BOOL(bypass, SpaprTceTable),
         VMSTATE_VARRAY_UINT32_ALLOC(mig_table, SpaprTceTable, mig_nb_table, 0,
                                     vmstate_info_uint64, uint64_t),
+        VMSTATE_BOOL_V(def_win, SpaprTceTable, 3),
 
         VMSTATE_END_OF_LIST()
     },
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index b2f5fbef0c..5e95d7940f 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -2067,6 +2067,7 @@ void spapr_phb_dma_reset(SpaprPhbState *sphb)
     tcet = spapr_tce_find_by_liobn(sphb->dma_liobn[0]);
     spapr_tce_table_enable(tcet, SPAPR_TCE_PAGE_SHIFT, sphb->dma_win_addr,
                            sphb->dma_win_size >> SPAPR_TCE_PAGE_SHIFT);
+    tcet->def_win = true;
 }
 
 static void spapr_phb_reset(DeviceState *qdev)
diff --git a/hw/ppc/spapr_rtas_ddw.c b/hw/ppc/spapr_rtas_ddw.c
index 13d339c807..bb7d91b6d1 100644
--- a/hw/ppc/spapr_rtas_ddw.c
+++ b/hw/ppc/spapr_rtas_ddw.c
@@ -215,6 +215,7 @@ static void rtas_ibm_remove_pe_dma_window(PowerPCCPU *cpu,
     SpaprPhbState *sphb;
     SpaprTceTable *tcet;
     uint32_t liobn;
+    bool def_win_removed;
 
     if ((nargs != 1) || (nret != 1)) {
         goto param_error_exit;
@@ -231,9 +232,23 @@ static void rtas_ibm_remove_pe_dma_window(PowerPCCPU *cpu,
         goto param_error_exit;
     }
 
+    def_win_removed = tcet->def_win;
     spapr_tce_table_disable(tcet);
     trace_spapr_iommu_ddw_remove(liobn);
 
+    /*
+     * PAPR+/LoPAPR says:
+     * The platform must restore the default DMA window for the PE on a call
+     * to the ibm,remove-pe-dma-window RTAS call when all of the following
+     * are true:
+     * a. The call removes the last DMA window remaining for the PE.
+     * b. The DMA window being removed is not the default window
+     */
+    if (spapr_phb_get_active_win_num(sphb) == 0 && !def_win_removed) {
+        spapr_phb_dma_reset(sphb);
+        trace_spapr_iommu_ddw_reset(sphb->buid, 0);
+    }
+
     rtas_st(rets, 0, RTAS_OUT_SUCCESS);
     return;
 
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 072dda2c72..4ba2b27b8c 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -902,6 +902,7 @@ struct SpaprTceTable {
     bool bypass;
     bool need_vfio;
     bool skipping_replay;
+    bool def_win;
     int fd;
     MemoryRegion root;
     IOMMUMemoryRegion iommu;
-- 
2.36.1



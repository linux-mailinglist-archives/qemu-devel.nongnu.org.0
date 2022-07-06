Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 679895693BF
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 23:00:06 +0200 (CEST)
Received: from localhost ([::1]:43540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9C7x-0002ZX-5x
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 17:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLj-0000Ua-In; Wed, 06 Jul 2022 16:10:18 -0400
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31]:36556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLh-0003VJ-SE; Wed, 06 Jul 2022 16:10:15 -0400
Received: by mail-vs1-xe31.google.com with SMTP id u187so4889052vsb.3;
 Wed, 06 Jul 2022 13:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RACHpAwz7J4GQ96z9X4buuWbTm1EYEsrLu3jiE9tJB0=;
 b=q6Xndukv7PKOQBk4LkdQeOrXXtvw7hCCM/H6UIflP6+44JyMw9lpI6XFVmT15EQnci
 QqbptgxJim8Mg2Qr/4bx6ZU41vPShXM6PArwR7u3Yt4b+AerLUyL257yomO3eCwRri4k
 Drfv+0FtaQRN2Sf96jr6NfgGdJku3WVSDJWXI8C+uS8L02O47aPougxIjce00QVpymfO
 B/nLNjNBtLIyIGRTjb5hvg2LCWVEp0bANVvVzdxJeqbrxLynlo/iS2a33r4jkvgejVHr
 y85NgJ3vuGpbvQmGGL6sXNnBiA5JqbS7VGYc8uwZBMnfYDV9IQOdr7oSOH8bIdKxvKXP
 m8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RACHpAwz7J4GQ96z9X4buuWbTm1EYEsrLu3jiE9tJB0=;
 b=FlQzlb+y0XvWbxAmW4RyDoT7H6i94OiRnGnlOvSk0bCE+QLnshAA+I3TD+295XgDEP
 3YOOyXNaWTY/6ABwi9hbGUyJeQwBHqoUMPTWUxaC9palDcvtpqESiAs+LgFu5l3Q/0tZ
 sfDNN4/YUgrO8aYLyZrDE9jrNc1XQ61DLj/WPr3dBl8yIudpB5/svE6UkTwqAOj2L3oY
 RLJN302JHXB5ezHsNahkWa2x5ibqv2a1kGUYf2JXhUA1hlytjXwqGAfb4sWTSLFWMM42
 bzDgLNCrzwqMkbWlH1mBPOOnpwiDNgXOouEFA5YhtqD2cnbQv5fBTGovK5VI+bz1QWLa
 PGLA==
X-Gm-Message-State: AJIora/RLRoQZ6TMmsPMb3vCRUF/YNq4mqpWhBP1NQc4mRxfHIMF3vDt
 7qmOmWk6U6DkzEDDe74U/YKNbMe5peU=
X-Google-Smtp-Source: AGRyM1t8J3OkDPXCbyWGXFRKcEcQQ0whH1pYcagmZXvnRkdZCzP/XYoV9wXfODpXsUHnb61VUkkepg==
X-Received: by 2002:a67:c298:0:b0:356:fd6b:8bad with SMTP id
 k24-20020a67c298000000b00356fd6b8badmr6014324vsj.11.1657138212543; 
 Wed, 06 Jul 2022 13:10:12 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.10.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:10:12 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: [PULL 11/34] spapr/ddw: Implement 64bit query extension
Date: Wed,  6 Jul 2022 17:09:23 -0300
Message-Id: <20220706200946.471114-12-danielhb413@gmail.com>
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

PAPR 2.8 (2018) defines an extension to return 64bit value for
the largest TCE block in "ibm,query-pe-dma-window". Recent Linux kernels
support this already.

This adds the extension and supports the older format.

This advertises a bigger window for the new format as the biggest
window with 2M pages below the start of the 64bit window as it is
the maximum we will see in practice.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220623073136.1380214-1-aik@ozlabs.ru>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_pci.c      |  5 +++--
 hw/ppc/spapr_rtas_ddw.c | 19 +++++++++++++++----
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 5e95d7940f..67e9d468aa 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -2360,8 +2360,9 @@ int spapr_dt_phb(SpaprMachineState *spapr, SpaprPhbState *phb,
         cpu_to_be32(RTAS_IBM_REMOVE_PE_DMA_WINDOW)
     };
     uint32_t ddw_extensions[] = {
-        cpu_to_be32(1),
-        cpu_to_be32(RTAS_IBM_RESET_PE_DMA_WINDOW)
+        cpu_to_be32(2),
+        cpu_to_be32(RTAS_IBM_RESET_PE_DMA_WINDOW),
+        cpu_to_be32(1), /* 1: ibm,query-pe-dma-window 6 outputs, PAPR 2.8 */
     };
     SpaprTceTable *tcet;
     SpaprDrc *drc;
diff --git a/hw/ppc/spapr_rtas_ddw.c b/hw/ppc/spapr_rtas_ddw.c
index bb7d91b6d1..7ba11382bc 100644
--- a/hw/ppc/spapr_rtas_ddw.c
+++ b/hw/ppc/spapr_rtas_ddw.c
@@ -100,7 +100,7 @@ static void rtas_ibm_query_pe_dma_window(PowerPCCPU *cpu,
     uint64_t buid;
     uint32_t avail, addr, pgmask = 0;
 
-    if ((nargs != 3) || (nret != 5)) {
+    if ((nargs != 3) || ((nret != 5) && (nret != 6))) {
         goto param_error_exit;
     }
 
@@ -118,9 +118,20 @@ static void rtas_ibm_query_pe_dma_window(PowerPCCPU *cpu,
 
     rtas_st(rets, 0, RTAS_OUT_SUCCESS);
     rtas_st(rets, 1, avail);
-    rtas_st(rets, 2, 0x80000000); /* The largest window we can possibly have */
-    rtas_st(rets, 3, pgmask);
-    rtas_st(rets, 4, 0); /* DMA migration mask, not supported */
+    if (nret == 6) {
+        /*
+         * Set the Max TCE number as 1<<(58-21) = 0x20.0000.0000
+         * 1<<59 is the huge window start and 21 is 2M page shift.
+         */
+        rtas_st(rets, 2, 0x00000020);
+        rtas_st(rets, 3, 0x00000000);
+        rtas_st(rets, 4, pgmask);
+        rtas_st(rets, 5, 0); /* DMA migration mask, not supported */
+    } else {
+        rtas_st(rets, 2, 0x80000000);
+        rtas_st(rets, 3, pgmask);
+        rtas_st(rets, 4, 0); /* DMA migration mask, not supported */
+    }
 
     trace_spapr_iommu_ddw_query(buid, addr, avail, 0x80000000, pgmask);
     return;
-- 
2.36.1



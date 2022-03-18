Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC494DE01E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 18:42:49 +0100 (CET)
Received: from localhost ([::1]:51690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVGci-0004uj-Dn
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 13:42:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nVGTy-0004fj-FJ; Fri, 18 Mar 2022 13:33:47 -0400
Received: from [2607:f8b0:4864:20::229] (port=40873
 helo=mail-oi1-x229.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nVGTx-0002Bh-21; Fri, 18 Mar 2022 13:33:46 -0400
Received: by mail-oi1-x229.google.com with SMTP id o64so9480234oib.7;
 Fri, 18 Mar 2022 10:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M+8fcL1dInKUgC2JVqFgjFIbgNVK0mYXJ7UOW5IVgkc=;
 b=QMDYYOwOcXtyPs5KB1QRTnD52aiAHKPvsRY76Jmb6Rggcjxzlr0qua7g33zgE0Jprb
 ZUB+jxkIR1N7UHdG3l2JNj8Hq34jtCu2+B4zYi5RS9f0YXCDBDOtTNpRJioZzuuril3Z
 5NCBCdn9L3cDFbDl70g1AskDVo49Z8TKP3qiRSmS03y8nL8aiCqRCZQfVBMovs1DL3/z
 UxVVIFEFLbddOWqZCBzIl6IwH79H7r0WQ3+PLl8xBr84nkhCK2PARLx6U6Wgko759zzO
 uuEhCqDrgQUAT8TbPoHQHlFbuY35YYLhoaCYpHZyheFhMwX9HpbSqlmuc0YIt7JGzWzE
 G2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M+8fcL1dInKUgC2JVqFgjFIbgNVK0mYXJ7UOW5IVgkc=;
 b=klOPoXLU55f2HUD2k9KPibSo8nlfPB/FGKmCfA5EmtH9QuO6d0cggbjqUh2DZE7Zuf
 mVfOPUTpXk4X3isEmirOYVVSh9wd/bJdZAUULZpGaF1bl8bk1YYMFw56iRBZvIqniBS5
 R/TrDhuq31k88waKKV0DemvqbtTTCxFvOgnkwvAjbghAi76UswJXYciRo+TxrIQm7dPZ
 TKU7/eAr/GNkAS41XWiIwRdevNTi0jyUeh9b0KXBhKvcNoOauUYaEKZj1ToJ3zSc2LHc
 W0/9/qohhwdOM8dBsXroTYx5grGRg5DujmDj4tgiMEI2ikR+ySd+ZidF5HKob0tE6QXx
 mTew==
X-Gm-Message-State: AOAM531Ghe6JXhG5YMNr5DCRcpQYNHXlMatJU2IlsYAJmrhFMM3150fg
 FZXOLrfbw72cQP3gP6WTsT6I3pelb8M=
X-Google-Smtp-Source: ABdhPJx6MLLM6+5xrrW327g0ofogC015S1n+fEVTFiFaUouVxu03syPTiSelwKKFhs2Q4qnQrbJ8XA==
X-Received: by 2002:aca:f185:0:b0:2ef:1fa6:3dca with SMTP id
 p127-20020acaf185000000b002ef1fa63dcamr3119279oih.140.1647624823766; 
 Fri, 18 Mar 2022 10:33:43 -0700 (PDT)
Received: from rekt.ibmmodules.com ([2804:431:c7c6:daa8:d948:1d15:1451:398f])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a05683025c200b005c93d78e1f6sm4324662otu.29.2022.03.18.10.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 10:33:43 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 7/9] hw/ppc/spapr_nvdimm.c: use drc->index
Date: Fri, 18 Mar 2022 14:33:18 -0300
Message-Id: <20220318173320.320541-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318173320.320541-1-danielhb413@gmail.com>
References: <20220318173320.320541-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::229
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_nvdimm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
index c4c97da5de..5acb761220 100644
--- a/hw/ppc/spapr_nvdimm.c
+++ b/hw/ppc/spapr_nvdimm.c
@@ -145,7 +145,6 @@ static int spapr_dt_nvdimm(SpaprMachineState *spapr, void *fdt,
     int child_offset;
     char *buf;
     SpaprDrc *drc;
-    uint32_t drc_idx;
     uint32_t node = object_property_get_uint(OBJECT(nvdimm), PC_DIMM_NODE_PROP,
                                              &error_abort);
     uint64_t slot = object_property_get_uint(OBJECT(nvdimm), PC_DIMM_SLOT_PROP,
@@ -157,15 +156,13 @@ static int spapr_dt_nvdimm(SpaprMachineState *spapr, void *fdt,
     drc = spapr_drc_by_id(TYPE_SPAPR_DRC_PMEM, slot);
     g_assert(drc);
 
-    drc_idx = spapr_drc_index(drc);
-
-    buf = g_strdup_printf("ibm,pmemory@%x", drc_idx);
+    buf = g_strdup_printf("ibm,pmemory@%x", drc->index);
     child_offset = fdt_add_subnode(fdt, parent_offset, buf);
     g_free(buf);
 
     _FDT(child_offset);
 
-    _FDT((fdt_setprop_cell(fdt, child_offset, "reg", drc_idx)));
+    _FDT((fdt_setprop_cell(fdt, child_offset, "reg", drc->index)));
     _FDT((fdt_setprop_string(fdt, child_offset, "compatible", "ibm,pmemory")));
     _FDT((fdt_setprop_string(fdt, child_offset, "device_type", "ibm,pmemory")));
 
@@ -175,7 +172,8 @@ static int spapr_dt_nvdimm(SpaprMachineState *spapr, void *fdt,
     _FDT((fdt_setprop_string(fdt, child_offset, "ibm,unit-guid", buf)));
     g_free(buf);
 
-    _FDT((fdt_setprop_cell(fdt, child_offset, "ibm,my-drc-index", drc_idx)));
+    _FDT((fdt_setprop_cell(fdt, child_offset, "ibm,my-drc-index",
+                           drc->index)));
 
     _FDT((fdt_setprop_u64(fdt, child_offset, "ibm,block-size",
                           SPAPR_MINIMUM_SCM_BLOCK_SIZE)));
-- 
2.35.1



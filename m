Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3AF5E6B25
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 20:42:28 +0200 (CEST)
Received: from localhost ([::1]:48276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obR9X-0005o5-TB
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 14:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPBC-0002CP-V6
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:10 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPB8-0005S3-P4
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:01 -0400
Received: by mail-wr1-x42c.google.com with SMTP id n12so16405127wrx.9
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=ztKwOrqkfodqtKzngCt55ZxSfx72kc5wCij+ohkVkGQ=;
 b=j6osT53I1JIxRph3dpQ8pu9s0wx/bGZ50koQxPPKncKGSP8S9mzRyXy9BsGeQYxtBc
 Fogzoux2dPIQZmYDO/HEF3FNp1oG8Syjf4QlTzYAnLoVFsYWangGSedgdpHgmX4JdPuw
 9vEVB8id+gq6A1tVl7u45WpOjtOvnPoDHFKP4mvEt6VMn7MyWcsckzmxW68sskQKyi1W
 9v/NZT0XRVK9rI98paKkkjZmCz33m4UUmHanjchDctcIqXNDV9eByBOISOjTuAN878Kg
 ku4kx0L5q/vyskcCpavStXUiVn/Iqanln3gYEpAIdRkDW0hdTIwh0HyAR9nwVC7rar30
 674Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ztKwOrqkfodqtKzngCt55ZxSfx72kc5wCij+ohkVkGQ=;
 b=FMNOJ5XOK02Bi6joeFOD2mR26oHgYxz3l8vcVoOTJrsbSQkFk2A48Wggmop2b9+JWx
 K4ivdKPRHEBhkj4K+gq3zipjH60N8+/Ap9Ks9BE3MSxJPDWDuTGhbAf0JPk7T/H4WKzN
 LaKgkGhQHHb/U6ZKJbcH1ysk77h9S2d3QgfEhJWNNK9jtJ4OmnR1rg3Ufp8qapowFuW3
 Yg0xgsViwhZMyFRtQUUz1JoCxX320YUVVDYdogzFgSO+bDXscV1uq/qgQZyZw+ruE3xH
 UI0SiymJJIS4LeCBYyRAzeF1xKLpGj+skEX+nmTrk09AGsQ9ADF5W1Abg0Vexo31WwPr
 NBtQ==
X-Gm-Message-State: ACrzQf3FcZW4I7ESwxEjnosUkQPqEvV/sA7DoNLmMlGcLb50YxCF72kl
 O5pOZZnyRenfyGDhobrlMTCHNjnYM0tAKw==
X-Google-Smtp-Source: AMsMyM7qRUmtQi2gdHjwXJPOFji7BGup1rVAEnjQrtoXPOXEzARL0WS6eI3e8VjP9HXEN/xJzepozg==
X-Received: by 2002:adf:a50e:0:b0:22a:ede1:57e with SMTP id
 i14-20020adfa50e000000b0022aede1057emr2542199wrb.63.1663864556091; 
 Thu, 22 Sep 2022 09:35:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/39] hw/ppc/pnv: Avoid dynamic stack allocation
Date: Thu, 22 Sep 2022 17:35:24 +0100
Message-Id: <20220922163536.1096175-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Use autofree heap allocation instead of variable-length
array on the stack.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-id: 20220819153931.3147384-7-peter.maydell@linaro.org
---
 hw/ppc/pnv.c               | 4 ++--
 hw/ppc/spapr.c             | 8 ++++----
 hw/ppc/spapr_pci_nvlink2.c | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 354aa289d18..78e00afb9b9 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -138,7 +138,7 @@ static void pnv_dt_core(PnvChip *chip, PnvCore *pc, void *fdt)
     int smt_threads = CPU_CORE(pc)->nr_threads;
     CPUPPCState *env = &cpu->env;
     PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cs);
-    uint32_t servers_prop[smt_threads];
+    g_autofree uint32_t *servers_prop = g_new(uint32_t, smt_threads);
     int i;
     uint32_t segs[] = {cpu_to_be32(28), cpu_to_be32(40),
                        0xffffffff, 0xffffffff};
@@ -241,7 +241,7 @@ static void pnv_dt_core(PnvChip *chip, PnvCore *pc, void *fdt)
         servers_prop[i] = cpu_to_be32(pc->pir + i);
     }
     _FDT((fdt_setprop(fdt, offset, "ibm,ppc-interrupt-server#s",
-                       servers_prop, sizeof(servers_prop))));
+                       servers_prop, sizeof(*servers_prop) * smt_threads)));
 }
 
 static void pnv_dt_icp(PnvChip *chip, void *fdt, uint32_t pir,
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index cc1adc23faf..8bbaf4f8a4e 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -177,8 +177,8 @@ static int spapr_fixup_cpu_smt_dt(void *fdt, int offset, PowerPCCPU *cpu,
                                   int smt_threads)
 {
     int i, ret = 0;
-    uint32_t servers_prop[smt_threads];
-    uint32_t gservers_prop[smt_threads * 2];
+    g_autofree uint32_t *servers_prop = g_new(uint32_t, smt_threads);
+    g_autofree uint32_t *gservers_prop = g_new(uint32_t, smt_threads * 2);
     int index = spapr_get_vcpu_id(cpu);
 
     if (cpu->compat_pvr) {
@@ -196,12 +196,12 @@ static int spapr_fixup_cpu_smt_dt(void *fdt, int offset, PowerPCCPU *cpu,
         gservers_prop[i*2 + 1] = 0;
     }
     ret = fdt_setprop(fdt, offset, "ibm,ppc-interrupt-server#s",
-                      servers_prop, sizeof(servers_prop));
+                      servers_prop, sizeof(*servers_prop) * smt_threads);
     if (ret < 0) {
         return ret;
     }
     ret = fdt_setprop(fdt, offset, "ibm,ppc-interrupt-gserver#s",
-                      gservers_prop, sizeof(gservers_prop));
+                      gservers_prop, sizeof(*gservers_prop) * smt_threads * 2);
 
     return ret;
 }
diff --git a/hw/ppc/spapr_pci_nvlink2.c b/hw/ppc/spapr_pci_nvlink2.c
index 63b476c8f72..2a8a11be1d6 100644
--- a/hw/ppc/spapr_pci_nvlink2.c
+++ b/hw/ppc/spapr_pci_nvlink2.c
@@ -397,7 +397,7 @@ void spapr_phb_nvgpu_populate_pcidev_dt(PCIDevice *dev, void *fdt, int offset,
             continue;
         }
         if (dev == nvslot->gpdev) {
-            uint32_t npus[nvslot->linknum];
+            g_autofree uint32_t *npus = g_new(uint32_t, nvslot->linknum);
 
             for (j = 0; j < nvslot->linknum; ++j) {
                 PCIDevice *npdev = nvslot->links[j].npdev;
-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97651599EC8
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 17:50:06 +0200 (CEST)
Received: from localhost ([::1]:60986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP4G5-0005uI-LR
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 11:50:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oP46A-0005iX-4b
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 11:39:50 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:42590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oP464-00064f-9D
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 11:39:49 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 l33-20020a05600c1d2100b003a645240a95so301861wms.1
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 08:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=O0kTlYBRe8XrfOsBr0O7vJ0KUHjU8+ns6BkcrOf/Srs=;
 b=UGtuTV1t+QRxXJ4M+JwMNuCTwf/sLV+Mwn9bMwB4yodePOieFhw2G0WIVe6dEL5coy
 b13fdyeq65OVvEr9y9g5A/lHqGqkfP82AYbkuEI+xmu5ha/QAcboME6y1Wg3hajwsi4K
 cS9GRLmdcr5pBFlt+NY4VhKPlv6pbmo3tM435JrgBWtrh0Yd9SwGiwIDS8j1gSxIJjho
 n+decSApioxnvTFaFuMLxXAShU7Q3vHFFVY7JbW1i9zrAXuHs70iPFvDl3j50DuFOYsJ
 tinCK9H4YIlQjn0+w1Gl9Z935Fq17UhHFaoxzAcdJHx0tZG8uFt7/AoObgrG1YfZW5Gk
 qgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=O0kTlYBRe8XrfOsBr0O7vJ0KUHjU8+ns6BkcrOf/Srs=;
 b=GbWX3p03WEwhPmhSNPr6H+dLrG6/VhFPwgGgK4KgXPAYiexQjGj2v9LzebptJD3z4Y
 VO0fQmjv62YZHCSMQg5Exii88SPVgqk7/VyyXxGIhEUJjSsXabmPbxGdLNjIDRnYSmJC
 wKkkeazLAhBGR3ISbqEUpx5Z3S1VNluXHbJ885TKotTpRe0p5nF4R9T6PmY1SAiKVXq/
 6DdriM2WwobHkm4KML5/6uPIagfbsVQewvBTcDOuE/wIXAFztuj/qE6r8plb6mhe++KQ
 LswYeKVSbmyYUecviIRh5khx/VlDXzEcHNnCwjsXZ0p3hhRyYfDXrTxYFTmZQlpIokLn
 LzqQ==
X-Gm-Message-State: ACgBeo3qiSdqCOAgj0zN4gBT0PzjPBLZm/mxIcYnNKpIT2+wgFTBTqt9
 oiC0vap2Oah5LNxnGrfsTaxXCfck7OKmBQ==
X-Google-Smtp-Source: AA6agR5gH8I34ZvPokMrTUVYPCruEb6H/S8MMh2sfi3OTP9DkY+TAv9WwUeBM+BvZWyA2CjOEpuP0Q==
X-Received: by 2002:a05:600c:1898:b0:3a5:b467:c3ef with SMTP id
 x24-20020a05600c189800b003a5b467c3efmr8310912wmp.178.1660923582708; 
 Fri, 19 Aug 2022 08:39:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi13-20020a05600c3d8d00b003a54109a6a0sm5558396wmb.3.2022.08.19.08.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 08:39:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 06/11] hw/ppc/pnv: Avoid dynamic stack allocation
Date: Fri, 19 Aug 2022 16:39:26 +0100
Message-Id: <20220819153931.3147384-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220819153931.3147384-1-peter.maydell@linaro.org>
References: <20220819153931.3147384-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
---
 hw/ppc/pnv.c               | 4 ++--
 hw/ppc/spapr.c             | 8 ++++----
 hw/ppc/spapr_pci_nvlink2.c | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index d3f77c83672..dd4101e5b65 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -137,7 +137,7 @@ static void pnv_dt_core(PnvChip *chip, PnvCore *pc, void *fdt)
     int smt_threads = CPU_CORE(pc)->nr_threads;
     CPUPPCState *env = &cpu->env;
     PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cs);
-    uint32_t servers_prop[smt_threads];
+    g_autofree uint32_t *servers_prop = g_new(uint32_t, smt_threads);
     int i;
     uint32_t segs[] = {cpu_to_be32(28), cpu_to_be32(40),
                        0xffffffff, 0xffffffff};
@@ -240,7 +240,7 @@ static void pnv_dt_core(PnvChip *chip, PnvCore *pc, void *fdt)
         servers_prop[i] = cpu_to_be32(pc->pir + i);
     }
     _FDT((fdt_setprop(fdt, offset, "ibm,ppc-interrupt-server#s",
-                       servers_prop, sizeof(servers_prop))));
+                       servers_prop, sizeof(*servers_prop) * smt_threads)));
 }
 
 static void pnv_dt_icp(PnvChip *chip, void *fdt, uint32_t pir,
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index bc9ba6e6dcf..28626efd479 100644
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



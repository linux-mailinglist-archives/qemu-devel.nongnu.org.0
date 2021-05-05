Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DC9374A13
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 23:24:03 +0200 (CEST)
Received: from localhost ([::1]:46416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leOzy-00054t-C4
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 17:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOo6-0000aQ-Ef
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:11:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOo4-0004Xb-Ic
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:11:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620249103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E0+1SJDTrG58JGhveEQcslSD23e5C3pDapkhqBRrRfM=;
 b=hmfB7Xswob6HOjEp4F05xH4QOmiB40wCuFxXy+hERmGeGRiXtYC0aZEGQMB+gYZnDDi8eA
 D9qVjanRm1CZrV712J412/P1RGdXpOIk0KsQr9MJV3COfgsnvKs/3G7Qy16KpNqqkMHeoN
 L+HgqEFxEPFJ2S6LeE0kItZabi1Oup4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-TvUbM_wvMMCOv_KdhuEMvg-1; Wed, 05 May 2021 17:11:42 -0400
X-MC-Unique: TvUbM_wvMMCOv_KdhuEMvg-1
Received: by mail-wr1-f69.google.com with SMTP id
 r12-20020adfc10c0000b029010d83323601so1191014wre.22
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 14:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E0+1SJDTrG58JGhveEQcslSD23e5C3pDapkhqBRrRfM=;
 b=cci+Ja3/SDNl1xOAJND81NzDRZK7kB7EIdWzt/gFZDSKTGf57xeMWhTadNr5vWuyYe
 dGEagdOnGYnyOCvhX1aflybFuIxzQZmkJJWDgQN3u6otK0dfs1WyYPHy4+U+ZSn8fZKz
 rjeJc3chL5FZp54BVPleXHH2gVDFiFtSsHdTxm0cZNdM4AHsaYDGuPec57nycELn4P8i
 X5Lu3HZ6c0HC7zErc66gRKHWV8KgN6blCYIuFH/xAVsyDnRX4LRCG64wefVMP+jqawXG
 bQXjYFdm4yzlCwDi1IVXuPM3EvnYIBAxCz7VF5jgmVXeSr68x/Ft/NkSWiLOO8YIfkoq
 01Qw==
X-Gm-Message-State: AOAM5309SXJoq6t+9wJSaGI0vJhpJZu3VloTbpmJfY97Ce5EHBvlhhxy
 zppcVKWYOqBR3nO7I85+zPrqHna5oUON0/DwUr8c1+JAtISd5HzL8iU7+VTp5+xhUq2NgcYhHcY
 mXH60Rgc6pvro7pOc67bFjHZZdJHpxRssGMpgbwFVIHnSKewfWOkOGRij4Eeo223b
X-Received: by 2002:a5d:408f:: with SMTP id o15mr1002772wrp.89.1620249101364; 
 Wed, 05 May 2021 14:11:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8d6dca/PRy2aY+dy28loaQ7h1Hm/Fc9iyVuyvvS3A0MsftmMKF6RQ+UeQfRBqRpU5XXN8aA==
X-Received: by 2002:a5d:408f:: with SMTP id o15mr1002748wrp.89.1620249101150; 
 Wed, 05 May 2021 14:11:41 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id y5sm640359wrm.61.2021.05.05.14.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 14:11:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/23] hw/ppc/pnv: Avoid dynamic stack allocation
Date: Wed,  5 May 2021 23:10:34 +0200
Message-Id: <20210505211047.1496765-11-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210505211047.1496765-1-philmd@redhat.com>
References: <20210505211047.1496765-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use autofree heap allocation instead of variable-length
array on the stack.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/ppc/pnv.c               | 4 ++--
 hw/ppc/spapr.c             | 8 ++++----
 hw/ppc/spapr_pci_nvlink2.c | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 77af846cdfe..f6e3d37b751 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -141,7 +141,7 @@ static void pnv_dt_core(PnvChip *chip, PnvCore *pc, void *fdt)
     int smt_threads = CPU_CORE(pc)->nr_threads;
     CPUPPCState *env = &cpu->env;
     PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cs);
-    uint32_t servers_prop[smt_threads];
+    g_autofree uint32_t *servers_prop = g_new(uint32_t, smt_threads);
     int i;
     uint32_t segs[] = {cpu_to_be32(28), cpu_to_be32(40),
                        0xffffffff, 0xffffffff};
@@ -244,7 +244,7 @@ static void pnv_dt_core(PnvChip *chip, PnvCore *pc, void *fdt)
         servers_prop[i] = cpu_to_be32(pc->pir + i);
     }
     _FDT((fdt_setprop(fdt, offset, "ibm,ppc-interrupt-server#s",
-                       servers_prop, sizeof(servers_prop))));
+                       servers_prop, sizeof(*servers_prop) * smt_threads)));
 }
 
 static void pnv_dt_icp(PnvChip *chip, void *fdt, uint32_t pir,
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 529ff056dd2..31c2c0d97bf 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -176,8 +176,8 @@ static int spapr_fixup_cpu_smt_dt(void *fdt, int offset, PowerPCCPU *cpu,
                                   int smt_threads)
 {
     int i, ret = 0;
-    uint32_t servers_prop[smt_threads];
-    uint32_t gservers_prop[smt_threads * 2];
+    g_autofree uint32_t *servers_prop = g_new(uint32_t, smt_threads);
+    g_autofree uint32_t *gservers_prop = g_new(uint32_t, smt_threads * 2);
     int index = spapr_get_vcpu_id(cpu);
 
     if (cpu->compat_pvr) {
@@ -195,12 +195,12 @@ static int spapr_fixup_cpu_smt_dt(void *fdt, int offset, PowerPCCPU *cpu,
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
index 8ef9b40a18d..bb61adb114c 100644
--- a/hw/ppc/spapr_pci_nvlink2.c
+++ b/hw/ppc/spapr_pci_nvlink2.c
@@ -401,7 +401,7 @@ void spapr_phb_nvgpu_populate_pcidev_dt(PCIDevice *dev, void *fdt, int offset,
             continue;
         }
         if (dev == nvslot->gpdev) {
-            uint32_t npus[nvslot->linknum];
+            g_autofree uint32_t *npus = g_new(uint32_t, nvslot->linknum);
 
             for (j = 0; j < nvslot->linknum; ++j) {
                 PCIDevice *npdev = nvslot->links[j].npdev;
-- 
2.26.3



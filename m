Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8544C760A
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 18:58:58 +0100 (CET)
Received: from localhost ([::1]:53626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkIS-0000z6-4W
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 12:58:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOkAc-0002uc-Mu; Mon, 28 Feb 2022 12:50:50 -0500
Received: from [2607:f8b0:4864:20::230] (port=43531
 helo=mail-oi1-x230.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOkAX-0007z2-GR; Mon, 28 Feb 2022 12:50:50 -0500
Received: by mail-oi1-x230.google.com with SMTP id s5so13902860oic.10;
 Mon, 28 Feb 2022 09:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sAwShS4RASMJ0Mkxwt+AWlFFgAVeu3eOY016igiya50=;
 b=nph/pyaZctNWCPpGJ0s9atF2oIZaAxdv42VAkPE413Aq678GhMmA5sNO1HdD2sgGEB
 8O1uFOt3ZpQEYT5qwNnXtRpoWmE3Vb5KPXmRLuIVfBv0I5C/3yylpi/gpzFTXamu7rTj
 oateLTq2R+XV18dnRcx3xw9Cw2mB+Nn7GjlZbZdZgrJXYD01/9ijNf9HxD1ZE7yD7DO2
 AONhn0GDLB0JWKTMKhS7FTu0/xuc/PZXvnHWlVvTUbjJjRr2PCZxGOcNYEg3K1gzD0jg
 12hNQqjxlwoVCVmXpWVXwlcnxBB4VzvpKzx+EaL92MWoEOAG2zS1hYGjIvnwqLokt7IA
 z4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sAwShS4RASMJ0Mkxwt+AWlFFgAVeu3eOY016igiya50=;
 b=YGzoOOeko5cnI3vWdvldJANWi+0w4QXA3dPq2eHyMuLKeiQhuEndHYReBOaL5SACn9
 Dz8kTwSGbmY165Oh5PNGiOiMIPfwg5Urapf0jjtymz2yyolh3uNgUnmxL82yJaYHs6or
 cOlfDQf3tqFkdXrC+yeuIaNgKRFK0LaV0sfJu1rAQrEYIfxtAhZ5ShtQHuGZ5XGqA9JN
 aBwB7WLPrZabqcREdv7R62FDMuIyVQMukc9oYET+OWmMYEGTZFNPCnaYYe/gaDJRlF4O
 XgiZKQgqFozNNtKcK+WrqaU1Rz29CEhI3Zkm3zUnjsnEJf5D4L1xiK+A9MexIqwMqSZd
 wwmw==
X-Gm-Message-State: AOAM532NP9M+LCZCpT5VpUWCsjOfesE2GbMN47WwTHjacSOC63LCjv0t
 U4B3pRpFXXlgL67WAKns0rl2XE8CUx8=
X-Google-Smtp-Source: ABdhPJwfb0vDT2PTVoyLtVphS8xwQtP/PyV+zeri1K3bGmd0HH2kHRXrd/K1o5TX7tv5hkJ+7wGEag==
X-Received: by 2002:a54:4611:0:b0:2d7:988a:5784 with SMTP id
 p17-20020a544611000000b002d7988a5784mr2898247oip.156.1646070643208; 
 Mon, 28 Feb 2022 09:50:43 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a9d5c8c000000b005ad51592bd8sm5368481oti.49.2022.02.28.09.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 09:50:43 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/14] spapr_pci_nvlink2.c: use g_autofree in
 spapr_phb_nvgpu_ram_populate_dt()
Date: Mon, 28 Feb 2022 14:50:02 -0300
Message-Id: <20220228175004.8862-13-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228175004.8862-1-danielhb413@gmail.com>
References: <20220228175004.8862-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::230
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x230.google.com
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
 hw/ppc/spapr_pci_nvlink2.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/spapr_pci_nvlink2.c b/hw/ppc/spapr_pci_nvlink2.c
index 7fb0cf4d04..4678c79235 100644
--- a/hw/ppc/spapr_pci_nvlink2.c
+++ b/hw/ppc/spapr_pci_nvlink2.c
@@ -320,7 +320,7 @@ void spapr_phb_nvgpu_populate_dt(SpaprPhbState *sphb, void *fdt, int bus_off,
 void spapr_phb_nvgpu_ram_populate_dt(SpaprPhbState *sphb, void *fdt)
 {
     int i, j, linkidx, npuoff;
-    char *npuname;
+    g_autofree char *npuname = NULL;
 
     if (!sphb->nvgpus) {
         return;
@@ -333,11 +333,10 @@ void spapr_phb_nvgpu_ram_populate_dt(SpaprPhbState *sphb, void *fdt)
     _FDT(fdt_setprop_cell(fdt, npuoff, "#size-cells", 0));
     /* Advertise NPU as POWER9 so the guest can enable NPU2 contexts */
     _FDT((fdt_setprop_string(fdt, npuoff, "compatible", "ibm,power9-npu")));
-    g_free(npuname);
 
     for (i = 0, linkidx = 0; i < sphb->nvgpus->num; ++i) {
         for (j = 0; j < sphb->nvgpus->slots[i].linknum; ++j) {
-            char *linkname = g_strdup_printf("link@%d", linkidx);
+            g_autofree char *linkname = g_strdup_printf("link@%d", linkidx);
             int off = fdt_add_subnode(fdt, npuoff, linkname);
 
             _FDT(off);
@@ -347,7 +346,6 @@ void spapr_phb_nvgpu_ram_populate_dt(SpaprPhbState *sphb, void *fdt)
             _FDT((fdt_setprop_cell(fdt, off, "phandle",
                                    PHANDLE_NVLINK(sphb, i, j))));
             _FDT((fdt_setprop_cell(fdt, off, "ibm,npu-link-index", linkidx)));
-            g_free(linkname);
             ++linkidx;
         }
     }
@@ -360,7 +358,8 @@ void spapr_phb_nvgpu_ram_populate_dt(SpaprPhbState *sphb, void *fdt)
                                                     &error_abort);
         uint64_t size = object_property_get_uint(nv_mrobj, "size", NULL);
         uint64_t mem_reg[2] = { cpu_to_be64(nvslot->gpa), cpu_to_be64(size) };
-        char *mem_name = g_strdup_printf("memory@%"PRIx64, nvslot->gpa);
+        g_autofree char *mem_name = g_strdup_printf("memory@%"PRIx64,
+                                                    nvslot->gpa);
         int off = fdt_add_subnode(fdt, 0, mem_name);
 
         _FDT(off);
@@ -378,7 +377,6 @@ void spapr_phb_nvgpu_ram_populate_dt(SpaprPhbState *sphb, void *fdt)
                           sizeof(mem_reg))));
         _FDT((fdt_setprop_cell(fdt, off, "phandle",
                                PHANDLE_GPURAM(sphb, i))));
-        g_free(mem_name);
     }
 
 }
-- 
2.35.1



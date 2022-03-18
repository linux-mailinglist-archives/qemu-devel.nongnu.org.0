Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C94F54DE048
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 18:49:59 +0100 (CET)
Received: from localhost ([::1]:60902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVGjd-0003vt-Gh
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 13:49:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nVGTu-0004dA-AQ; Fri, 18 Mar 2022 13:33:43 -0400
Received: from [2607:f8b0:4864:20::22c] (port=37401
 helo=mail-oi1-x22c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nVGTs-0002BK-Qc; Fri, 18 Mar 2022 13:33:42 -0400
Received: by mail-oi1-x22c.google.com with SMTP id q129so7471992oif.4;
 Fri, 18 Mar 2022 10:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XCEnkdrJV8hdZcD8pw6LWVdLrXvE4UKd1LTtyFJHg7k=;
 b=AIprN1mUuFya2fEzSQXUwNX9JdnrtVI0gcjVE9WOy+v60lD7jf2Ir0lZU87n/XDZVw
 52SBVxv05rsGVLniN+ghLyd30fEFfgmPwMZR/6PhGIDxyEvr8W7uNdQYK4jKxpPp3FTC
 h8zFrJ21PT9CUqv0qBjcTYAIu4dDh3D1iLlE+VOHN2F53wTGENUPfXtV6HzH/niVE7e4
 0SpJHMKrEEjNu1HdgGUvJU+oAz/PUlOeTnSAwcafPyeFdG87i6uBaFn8hnqMqLNZ3ZY8
 ZeyscsPtS4d6y9FK/2Dbg37w6XCJn7YFyrNDePgqqwZalNaxp7tQTuw+t6BZp30P6cj3
 KG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XCEnkdrJV8hdZcD8pw6LWVdLrXvE4UKd1LTtyFJHg7k=;
 b=XYHNiyBl/pDI/LTJmDNC7X66BVXd7d1YrviYl20Lmvf8/BKpxaAwe4wYx0CzPCE8h+
 lh3FhApbUdMsKlsWaorSAvEdn+Miu/0hwpgqerBniV24TjkddiAIv+J8v2fkYp60hEED
 5dsNVtlAK/1p1ijBs1kiD5EnNk4SOo3yn3GzDVpNupDY9BdR3+ky5qzz3ECcsMMDSLMv
 ErQSUazziqYZbBZOsLTh6nvEs6hW8q8zSIU277Hvc/baxupjhPY8pw9fViSIFpervRS1
 QFdibiMPADwfyGOmHmCk3OennNNxUdajbWAe7ugRGnT3bnucwGj3bsWcbLjV+Du6hno9
 p3zA==
X-Gm-Message-State: AOAM531Sgfe7bf9Jot7//PS8m7KnR61BQf3/ZMh4Er6bfNhrG15f4w64
 7WnQDuDOKkqMiqo1V0WMckBqoo/rGLc=
X-Google-Smtp-Source: ABdhPJxdLbx6VQSwy0VF9N7kk0gmUtXrBP/PIyv0BaiwGmdKKKKi90pAF2649GCyBn/pxTbaQ9TuLw==
X-Received: by 2002:a05:6808:1a10:b0:2da:5a40:36f0 with SMTP id
 bk16-20020a0568081a1000b002da5a4036f0mr8314998oib.41.1647624819495; 
 Fri, 18 Mar 2022 10:33:39 -0700 (PDT)
Received: from rekt.ibmmodules.com ([2804:431:c7c6:daa8:d948:1d15:1451:398f])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a05683025c200b005c93d78e1f6sm4324662otu.29.2022.03.18.10.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 10:33:39 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 5/9] hw/ppc/spapr.c: use drc->index
Date: Fri, 18 Mar 2022 14:33:16 -0300
Message-Id: <20220318173320.320541-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318173320.320541-1-danielhb413@gmail.com>
References: <20220318173320.320541-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22c.google.com
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
 hw/ppc/spapr.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 953fc65fa8..6aab04787d 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -419,7 +419,7 @@ static int spapr_dt_dynamic_memory_v2(SpaprMachineState *spapr, void *fdt,
             drc = spapr_drc_by_id(TYPE_SPAPR_DRC_LMB, cur_addr / lmb_size);
             g_assert(drc);
             elem = spapr_get_drconf_cell((addr - cur_addr) / lmb_size,
-                                         cur_addr, spapr_drc_index(drc), -1, 0);
+                                         cur_addr, drc->index, -1, 0);
             QSIMPLEQ_INSERT_TAIL(&drconf_queue, elem, entry);
             nr_entries++;
         }
@@ -428,7 +428,7 @@ static int spapr_dt_dynamic_memory_v2(SpaprMachineState *spapr, void *fdt,
         drc = spapr_drc_by_id(TYPE_SPAPR_DRC_LMB, addr / lmb_size);
         g_assert(drc);
         elem = spapr_get_drconf_cell(size / lmb_size, addr,
-                                     spapr_drc_index(drc), node,
+                                     drc->index, node,
                                      (SPAPR_LMB_FLAGS_ASSIGNED |
                                       SPAPR_LMB_FLAGS_HOTREMOVABLE));
         QSIMPLEQ_INSERT_TAIL(&drconf_queue, elem, entry);
@@ -441,7 +441,7 @@ static int spapr_dt_dynamic_memory_v2(SpaprMachineState *spapr, void *fdt,
         drc = spapr_drc_by_id(TYPE_SPAPR_DRC_LMB, cur_addr / lmb_size);
         g_assert(drc);
         elem = spapr_get_drconf_cell((mem_end - cur_addr) / lmb_size,
-                                     cur_addr, spapr_drc_index(drc), -1, 0);
+                                     cur_addr, drc->index, -1, 0);
         QSIMPLEQ_INSERT_TAIL(&drconf_queue, elem, entry);
         nr_entries++;
     }
@@ -497,7 +497,7 @@ static int spapr_dt_dynamic_memory(SpaprMachineState *spapr, void *fdt,
 
             dynamic_memory[0] = cpu_to_be32(addr >> 32);
             dynamic_memory[1] = cpu_to_be32(addr & 0xffffffff);
-            dynamic_memory[2] = cpu_to_be32(spapr_drc_index(drc));
+            dynamic_memory[2] = cpu_to_be32(drc->index);
             dynamic_memory[3] = cpu_to_be32(0); /* reserved */
             dynamic_memory[4] = cpu_to_be32(spapr_pc_dimm_node(dimms, addr));
             if (memory_region_present(get_system_memory(), addr)) {
@@ -663,14 +663,12 @@ static void spapr_dt_cpu(CPUState *cs, void *fdt, int offset,
     uint32_t pft_size_prop[] = {0, cpu_to_be32(spapr->htab_shift)};
     int compat_smt = MIN(smp_threads, ppc_compat_max_vthreads(cpu));
     SpaprDrc *drc;
-    int drc_index;
     uint32_t radix_AP_encodings[PPC_PAGE_SIZES_MAX_SZ];
     int i;
 
     drc = spapr_drc_by_id(TYPE_SPAPR_DRC_CPU, index);
     if (drc) {
-        drc_index = spapr_drc_index(drc);
-        _FDT((fdt_setprop_cell(fdt, offset, "ibm,my-drc-index", drc_index)));
+        _FDT((fdt_setprop_cell(fdt, offset, "ibm,my-drc-index", drc->index)));
     }
 
     _FDT((fdt_setprop_cell(fdt, offset, "reg", index)));
@@ -3448,7 +3446,7 @@ int spapr_lmb_dt_populate(SpaprDrc *drc, SpaprMachineState *spapr,
     uint64_t addr;
     uint32_t node;
 
-    addr = spapr_drc_index(drc) * SPAPR_MEMORY_BLOCK_SIZE;
+    addr = drc->index * SPAPR_MEMORY_BLOCK_SIZE;
     node = object_property_get_uint(OBJECT(drc->dev), PC_DIMM_NODE_PROP,
                                     &error_abort);
     *fdt_start_offset = spapr_dt_memory_node(spapr, fdt, node, addr,
@@ -3491,7 +3489,7 @@ static void spapr_add_lmbs(DeviceState *dev, uint64_t addr_start, uint64_t size,
             g_assert(drc);
             spapr_hotplug_req_add_by_count_indexed(SPAPR_DR_CONNECTOR_TYPE_LMB,
                                                    nr_lmbs,
-                                                   spapr_drc_index(drc));
+                                                   drc->index);
         } else {
             spapr_hotplug_req_add_by_count(SPAPR_DR_CONNECTOR_TYPE_LMB,
                                            nr_lmbs);
@@ -3791,7 +3789,7 @@ static void spapr_memory_unplug_request(HotplugHandler *hotplug_dev,
     drc = spapr_drc_by_id(TYPE_SPAPR_DRC_LMB,
                           addr_start / SPAPR_MEMORY_BLOCK_SIZE);
     spapr_hotplug_req_remove_by_count_indexed(SPAPR_DR_CONNECTOR_TYPE_LMB,
-                                              nr_lmbs, spapr_drc_index(drc));
+                                              nr_lmbs, drc->index);
 }
 
 /* Callback to be called during DRC release. */
-- 
2.35.1



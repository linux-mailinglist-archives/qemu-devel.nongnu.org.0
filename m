Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA6C3A736B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 03:41:46 +0200 (CEST)
Received: from localhost ([::1]:34906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsy5J-0004MN-Uf
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 21:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lsxxj-0000hC-KB; Mon, 14 Jun 2021 21:33:55 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:42924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lsxxh-0002ct-Rl; Mon, 14 Jun 2021 21:33:55 -0400
Received: by mail-qt1-x836.google.com with SMTP id v6so10076425qta.9;
 Mon, 14 Jun 2021 18:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lukq+gNciQn9g7tr1zSOYGZblQeIN4FqWF9uIUuzVjs=;
 b=tG40xa5wwrU/GNfx8anTCEDyZMTqvAE3OXSGoQ5lBxYW+F6sVE4mB+MM5TaDDf5Etc
 ia09WniblRNh0N9ud5BQ2TlKvXGCWWkbvlFgPRZTZSln45ntSxu0qExY2o2WkU0JoGzY
 X+wMubqvo5kVGcHOlvjQMZ8EEddHa+gSfSuJMZkC6GJ0N9pybKJ1cYdKkaDS7JJ3cbT2
 y1QNhoUSPzVdjuNJ8xfQNfU9Lbudqy/mlmOwzNQcEsa4MHgtA+T/rROXHGk8dbUcw2P4
 4Soy0VZcam0uMDVjRDO7/Z1pHYYUzKBonBLNiMKv2iE1NbEZ8+gmrUm+tbYQFYQix8Yq
 THPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lukq+gNciQn9g7tr1zSOYGZblQeIN4FqWF9uIUuzVjs=;
 b=NiuJNQ/Ld/+AGHkyy+09U1d+EDAFKwECR9Go0TPi0E4Irf3e0JA9wBWDOzivUScf78
 UNmXssqPK/LgiCGlpC+LboNB7nGAboAXzZRUgN9mIc5ZRK6IdMKWwqz9N/8sHGaGW5A5
 6EeT/wvzPHK//HPMC6woOzYP8dEuXK84a61KbQRa9H8c8pAis7cYsqGRD0TqvODK14Uf
 zfx2wbNOBbOJm/3KZy3sWtMnyFRL9d3pfyMYxCqaoc7Pysg5yFPSo4xGrRk85CsNemq6
 5cJtlnYm6Cw7OlT/XTTeqcfzKpl9ODrBAHsHVH1H6/65NoUjC0pq2GjWQtwTuYK3pNlG
 y3Eg==
X-Gm-Message-State: AOAM532fHmDSmvfhBtulADb9c5P9PF9lUPWE41n/w3fTUF194SEqNjek
 A7nl3wQ5RYVlOHGngxsKI+S7gTq4DBqKhw==
X-Google-Smtp-Source: ABdhPJzju+Vji+Qdpml36xBaFu9bi2J9JIfdq+91htzNVZAWv0iSfsHmzRXLA9hTHWgfbEAGYPlxhQ==
X-Received: by 2002:ac8:7e81:: with SMTP id w1mr1490756qtj.130.1623720832469; 
 Mon, 14 Jun 2021 18:33:52 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7c6:4d9a:784f:a7de:c020:5f1e])
 by smtp.gmail.com with ESMTPSA id h2sm11639320qkf.106.2021.06.14.18.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 18:33:52 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 7/8] spapr_numa,
 spapar_nvdimm: write secondary NUMA domain for nvdimms
Date: Mon, 14 Jun 2021 22:33:08 -0300
Message-Id: <20210615013309.2833323-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615013309.2833323-1-danielhb413@gmail.com>
References: <20210615013309.2833323-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x836.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Shivaprasad G Bhat <sbhat@linux.ibm.com>, aneesh.kumar@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>, groug@kaod.org,
 qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using the new 'device-node' property, write it in the nvdimm DT to set a
secondary domain for the persistent memory operation mode.

Note that this is only available in FORM2 affinity. FORM1 affinity
NVDIMMs aren't affected by this change.

CC: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_numa.c         | 20 ++++++++++++++++++++
 hw/ppc/spapr_nvdimm.c       |  3 ++-
 include/hw/ppc/spapr_numa.h |  3 +++
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index b14dd543c8..0cabb6757f 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -266,6 +266,26 @@ void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *fdt,
                       sizeof(spapr->numa_assoc_array[nodeid]))));
 }
 
+void spapr_numa_write_nvdimm_assoc_dt(SpaprMachineState *spapr, void *fdt,
+                                      int offset, int nodeid,
+                                      int device_node)
+{
+    uint32_t *nvdimm_assoc_array = spapr->numa_assoc_array[nodeid];
+
+    /*
+     * 'device-node' is the secondary domain for NVDIMMs when
+     * using FORM2. The secondary domain for FORM2 in QEMU
+     * is 0x3.
+     */
+    if (spapr_ovec_test(spapr->ov5_cas, OV5_FORM2_AFFINITY)) {
+        nvdimm_assoc_array[0x3] = cpu_to_be32(device_node);
+    }
+
+    _FDT((fdt_setprop(fdt, offset, "ibm,associativity",
+                      nvdimm_assoc_array,
+                      sizeof(spapr->numa_assoc_array[nodeid]))));
+}
+
 static uint32_t *spapr_numa_get_vcpu_assoc(SpaprMachineState *spapr,
                                            PowerPCCPU *cpu)
 {
diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
index 91de1052f2..49a05736fe 100644
--- a/hw/ppc/spapr_nvdimm.c
+++ b/hw/ppc/spapr_nvdimm.c
@@ -142,7 +142,8 @@ static int spapr_dt_nvdimm(SpaprMachineState *spapr, void *fdt,
     _FDT((fdt_setprop_string(fdt, child_offset, "compatible", "ibm,pmemory")));
     _FDT((fdt_setprop_string(fdt, child_offset, "device_type", "ibm,pmemory")));
 
-    spapr_numa_write_associativity_dt(spapr, fdt, child_offset, node);
+    spapr_numa_write_nvdimm_assoc_dt(spapr, fdt, child_offset, node,
+                                     nvdimm->device_node);
 
     buf = qemu_uuid_unparse_strdup(&nvdimm->uuid);
     _FDT((fdt_setprop_string(fdt, child_offset, "ibm,unit-guid", buf)));
diff --git a/include/hw/ppc/spapr_numa.h b/include/hw/ppc/spapr_numa.h
index adaec8e163..af25741e70 100644
--- a/include/hw/ppc/spapr_numa.h
+++ b/include/hw/ppc/spapr_numa.h
@@ -26,6 +26,9 @@ void spapr_numa_associativity_init(SpaprMachineState *spapr);
 void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int rtas);
 void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *fdt,
                                        int offset, int nodeid);
+void spapr_numa_write_nvdimm_assoc_dt(SpaprMachineState *spapr, void *fdt,
+                                      int offset, int nodeid,
+                                      int device_node);
 int spapr_numa_fixup_cpu_dt(SpaprMachineState *spapr, void *fdt,
                             int offset, PowerPCCPU *cpu);
 int spapr_numa_write_assoc_lookup_arrays(SpaprMachineState *spapr, void *fdt,
-- 
2.31.1



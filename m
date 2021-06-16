Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E795D3A8E6E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:34:52 +0200 (CEST)
Received: from localhost ([::1]:46364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKSC-0002O6-0F
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ltKE6-0003qO-RT; Tue, 15 Jun 2021 21:20:20 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:45040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ltKE3-0004Mu-Bo; Tue, 15 Jun 2021 21:20:18 -0400
Received: by mail-qk1-x72b.google.com with SMTP id c18so926759qkc.11;
 Tue, 15 Jun 2021 18:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qYzg2P4ERYOO3xCYvasy/0+KMqAX65ioY5WE3TNXiZw=;
 b=bkf9UolgTt5k5449PunXE6z0TgcC+6eHvby9qKPZp1ZgQX5+Fv8m3O5EHZpCVmr8EU
 MEUvXeZIEwO+Xx/I1tU++1eCXHLJbFnFSdDLspocWtqhPnMyVoqhbNSQbLHu1+Llup9H
 WRCOeYNhAEXW3abPPPZGPftPbGoO0Le7kp79nTJ4yRAS7pBaTJWHXU/7kMLT8+2LfGTZ
 WLesw9YhfIl+HAMaxtiCxDDYAlyqYIdaKzWtkXQ0ggUhF3ZIa7uBea0maFV1NqCg1xnK
 TdvYOfI39igqVVwWF2SGeZl4Zb1sBVdgABEDNXuPuImIH9tDEHAMbY98nQ0+WdIzi4No
 45wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qYzg2P4ERYOO3xCYvasy/0+KMqAX65ioY5WE3TNXiZw=;
 b=nIeNbxIiwOCY+R2cpZr2KAmiU5X5wLmI7FNhIOW10jZElafz0EWLTzRTHQvTsrn/mY
 ZazsZXMLG6TwLDXBIs3F0TAG6qUaLiELQkEwsThjK5gAzJr4DLrOxpGho+iFPQXLjZGu
 laeW/118sbtT1z72MzzpTJftC6Lffp1ZZKZy+UuogcPvjEYolfwMWWogetjfEsI8ddOp
 HO04VMQDy/qIyXIX2rtFjT6DMfPX/1EKYVR7EbaaBPVEHvudXsL4hxHoAMdO4aQEf0Yo
 hc2WoSMICv0+49td2uoWDml6ZltMYfa3HMOzopH+9zTE8ecIcrK6SSt5gFlIlLP74I5H
 brHg==
X-Gm-Message-State: AOAM533xPIhK5aLrdTjuVr9n0uzVStzYo7/XQcj9vBvUcF+j3znij+h5
 +AlHMA3xFNwqQ6RqHEwCYNCBq99wsc8=
X-Google-Smtp-Source: ABdhPJyj8eGBx2iT8JUgXlJTWeiDoHVvUXc5QohEFrOV8lAQz+07J57rSTIxtHiz/YqAaSy0JJzaLQ==
X-Received: by 2002:a05:620a:414a:: with SMTP id
 k10mr2551446qko.37.1623806412736; 
 Tue, 15 Jun 2021 18:20:12 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7c6:4d9a:784f:a7de:c020:5f1e])
 by smtp.gmail.com with ESMTPSA id f19sm627994qkg.70.2021.06.15.18.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:20:12 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 6/7] spapr_numa,
 spapr_nvdimm: write secondary NUMA domain for nvdimms
Date: Tue, 15 Jun 2021 22:19:43 -0300
Message-Id: <20210616011944.2996399-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616011944.2996399-1-danielhb413@gmail.com>
References: <20210616011944.2996399-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72b.google.com
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
secondary domain for the persistent memory operation mode. If
'device-node' isn't set, secondary domain is equal to the primary
domain.

Note that this is only available in FORM2 affinity. FORM1 affinity
NVDIMMs aren't affected by this change.

CC: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_numa.c         | 20 ++++++++++++++++++++
 hw/ppc/spapr_nvdimm.c       |  5 +++--
 include/hw/ppc/spapr_numa.h |  3 +++
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index 8678ff4272..e7d455d304 100644
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
index 91de1052f2..7cc4e9a28f 100644
--- a/hw/ppc/spapr_nvdimm.c
+++ b/hw/ppc/spapr_nvdimm.c
@@ -92,7 +92,6 @@ bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
     return true;
 }
 
-
 void spapr_add_nvdimm(DeviceState *dev, uint64_t slot)
 {
     SpaprDrc *drc;
@@ -126,6 +125,7 @@ static int spapr_dt_nvdimm(SpaprMachineState *spapr, void *fdt,
     uint64_t lsize = nvdimm->label_size;
     uint64_t size = object_property_get_int(OBJECT(nvdimm), PC_DIMM_SIZE_PROP,
                                             NULL);
+    int device_node = nvdimm->device_node != -1 ? nvdimm->device_node : node;
 
     drc = spapr_drc_by_id(TYPE_SPAPR_DRC_PMEM, slot);
     g_assert(drc);
@@ -142,7 +142,8 @@ static int spapr_dt_nvdimm(SpaprMachineState *spapr, void *fdt,
     _FDT((fdt_setprop_string(fdt, child_offset, "compatible", "ibm,pmemory")));
     _FDT((fdt_setprop_string(fdt, child_offset, "device_type", "ibm,pmemory")));
 
-    spapr_numa_write_associativity_dt(spapr, fdt, child_offset, node);
+    spapr_numa_write_nvdimm_assoc_dt(spapr, fdt, child_offset,
+                                     node, device_node);
 
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



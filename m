Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F7F5A8BF3
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 05:35:14 +0200 (CEST)
Received: from localhost ([::1]:49966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTaz4-0007Tt-1S
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 23:35:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1oTarq-0008SR-Oi
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 23:27:46 -0400
Received: from mga12.intel.com ([192.55.52.136]:17689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1oTaro-0007uc-P9
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 23:27:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662002864; x=1693538864;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r41jw6gV8lsn24Xi4TOsG+w1pimVjPvASJ5XpcesKzE=;
 b=MSeswOrAyo09D+HOtBq8RhaC8leqTD923Xy7vCHGJate/bRRUcThIT74
 y+STO4c5klSH+WTQhqfWYfa+k4kfjlifgR5kZPUqp7bOEwW6njklVz70+
 XUfgI0ruFNlhw7C5Q0r/1v2PNCQIHCzTlDgjmGPWp0KDVVr/uXhpaM10f
 taGI2UzqtWx/YtxX30C/l6Iozl0GCvP5CmbUiM70R+1zAnPGjWQqqQQG1
 CFpZbt8z3Atn86MEPzdpJZCq9GWXmXxMh1H9n+gxBE2eLuzK1NKGd+sne
 aL+d5T8QEtd5wSIs/Cyrqcs8Z3BUEVL6tIgAc61Utoa5wdrtQe01DwxsH w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="275354028"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="275354028"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 20:27:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="642142714"
Received: from sqa-gate.sh.intel.com (HELO robert-clx2.tsp.org)
 ([10.239.48.212])
 by orsmga008.jf.intel.com with ESMTP; 31 Aug 2022 20:27:36 -0700
From: Robert Hoo <robert.hu@linux.intel.com>
To: imammedo@redhat.com, mst@redhat.com, xiaoguangrong.eric@gmail.com,
 ani@anisinha.ca, dan.j.williams@intel.com, jingqi.liu@intel.com
Cc: qemu-devel@nongnu.org, robert.hu@intel.com,
 Robert Hoo <robert.hu@linux.intel.com>
Subject: [PATCH v3 4/5] acpi/nvdimm: Implement ACPI NVDIMM Label Methods
Date: Thu,  1 Sep 2022 11:27:20 +0800
Message-Id: <20220901032721.1392482-5-robert.hu@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220901032721.1392482-1-robert.hu@linux.intel.com>
References: <20220901032721.1392482-1-robert.hu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=robert.hu@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001,
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

Recent ACPI spec [1] has defined NVDIMM Label Methods _LS{I,R,W}, which
deprecates corresponding _DSM Functions defined by PMEM _DSM Interface spec
[2].

Since the semantics of the new Label Methods are same as old _DSM
methods, the implementations here simply wrapper old ones.

ASL form diff can be found in next patch of updating golden master
binaries.

[1] ACPI Spec v6.4, 6.5.10 NVDIMM Label Methods
https://uefi.org/sites/default/files/resources/ACPI_Spec_6_4_Jan22.pdf
[2] Intel PMEM _DSM Interface Spec v2.0, 3.10 Deprecated Functions
https://pmem.io/documents/IntelOptanePMem_DSM_Interface-V2.0.pdf

Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>
---
 hw/acpi/nvdimm.c | 91 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index afff911c1e..516acfe53b 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -1243,6 +1243,7 @@ static void nvdimm_build_fit(Aml *dev)
 static void nvdimm_build_nvdimm_devices(Aml *root_dev, uint32_t ram_slots)
 {
     uint32_t slot;
+    Aml *method, *pkg, *field, *com_call;
 
     for (slot = 0; slot < ram_slots; slot++) {
         uint32_t handle = nvdimm_slot_to_handle(slot);
@@ -1260,6 +1261,96 @@ static void nvdimm_build_nvdimm_devices(Aml *root_dev, uint32_t ram_slots)
          */
         aml_append(nvdimm_dev, aml_name_decl("_ADR", aml_int(handle)));
 
+        /*
+         * ACPI v6.4: Section 6.5.10 NVDIMM Label Methods
+         */
+        /* _LSI */
+        method = aml_method("_LSI", 0, AML_SERIALIZED);
+        com_call = aml_call5(NVDIMM_COMMON_DSM,
+                            aml_touuid(NVDIMM_DEVICE_DSM_UUID),
+                            aml_int(1), aml_int(4), aml_int(0),
+                            aml_int(handle));
+        aml_append(method, aml_store(com_call, aml_local(0)));
+
+        aml_append(method, aml_create_dword_field(aml_local(0),
+                                                  aml_int(0), "STTS"));
+        aml_append(method, aml_create_dword_field(aml_local(0), aml_int(4),
+                                                  "SLSA"));
+        aml_append(method, aml_create_dword_field(aml_local(0), aml_int(8),
+                                                  "MAXT"));
+
+        pkg = aml_package(3);
+        aml_append(pkg, aml_name("STTS"));
+        aml_append(pkg, aml_name("SLSA"));
+        aml_append(pkg, aml_name("MAXT"));
+        aml_append(method, aml_name_decl("RET", pkg));
+        aml_append(method, aml_return(aml_name("RET")));
+
+        aml_append(nvdimm_dev, method);
+
+        /* _LSR */
+        method = aml_method("_LSR", 2, AML_SERIALIZED);
+        aml_append(method, aml_name_decl("INPT", aml_buffer(8, NULL)));
+
+        aml_append(method, aml_create_dword_field(aml_name("INPT"),
+                                                  aml_int(0), "OFST"));
+        aml_append(method, aml_create_dword_field(aml_name("INPT"),
+                                                  aml_int(4), "LEN"));
+        aml_append(method, aml_store(aml_arg(0), aml_name("OFST")));
+        aml_append(method, aml_store(aml_arg(1), aml_name("LEN")));
+
+        pkg = aml_package(1);
+        aml_append(pkg, aml_name("INPT"));
+        aml_append(method, aml_name_decl("PKG1", pkg));
+
+        com_call = aml_call5(NVDIMM_COMMON_DSM,
+                            aml_touuid(NVDIMM_DEVICE_DSM_UUID),
+                            aml_int(1), aml_int(5), aml_name("PKG1"),
+                            aml_int(handle));
+        aml_append(method, aml_store(com_call, aml_local(3)));
+        field = aml_create_dword_field(aml_local(3), aml_int(0), "STTS");
+        aml_append(method, field);
+        field = aml_create_field(aml_local(3), aml_int(32),
+                                 aml_shiftleft(aml_name("LEN"), aml_int(3)),
+                                 "LDAT");
+        aml_append(method, field);
+        aml_append(method, aml_name_decl("LSA", aml_buffer(0, NULL)));
+        aml_append(method, aml_to_buffer(aml_name("LDAT"), aml_name("LSA")));
+        pkg = aml_package(2);
+        aml_append(pkg, aml_name("STTS"));
+        aml_append(pkg, aml_name("LSA"));
+        aml_append(method, aml_name_decl("RET", pkg));
+        aml_append(method, aml_return(aml_name("RET")));
+        aml_append(nvdimm_dev, method);
+
+        /* _LSW */
+        method = aml_method("_LSW", 3, AML_SERIALIZED);
+        aml_append(method, aml_store(aml_arg(2), aml_local(2)));
+        aml_append(method, aml_name_decl("INPT", aml_buffer(8, NULL)));
+        field = aml_create_dword_field(aml_name("INPT"),
+                                                  aml_int(0), "OFST");
+        aml_append(method, field);
+        field = aml_create_dword_field(aml_name("INPT"),
+                                                  aml_int(4), "TLEN");
+        aml_append(method, field);
+        aml_append(method, aml_store(aml_arg(0), aml_name("OFST")));
+        aml_append(method, aml_store(aml_arg(1), aml_name("TLEN")));
+
+        aml_append(method, aml_concatenate(aml_name("INPT"), aml_local(2),
+                                            aml_name("INPT")));
+        pkg = aml_package(1);
+        aml_append(pkg, aml_name("INPT"));
+        aml_append(method, aml_name_decl("PKG1", pkg));
+        com_call = aml_call5(NVDIMM_COMMON_DSM,
+                            aml_touuid(NVDIMM_DEVICE_DSM_UUID),
+                            aml_int(1), aml_int(6), aml_name("PKG1"),
+                            aml_int(handle));
+        aml_append(method, aml_store(com_call, aml_local(3)));
+        field = aml_create_dword_field(aml_local(3), aml_int(0), "STTS");
+        aml_append(method, field);
+        aml_append(method, aml_return(aml_to_integer(aml_name("STTS"))));
+        aml_append(nvdimm_dev, method);
+
         nvdimm_build_device_dsm(nvdimm_dev, handle);
         aml_append(root_dev, nvdimm_dev);
     }
-- 
2.31.1



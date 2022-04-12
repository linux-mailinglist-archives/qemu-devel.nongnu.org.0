Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1047A4FD1C2
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 09:05:56 +0200 (CEST)
Received: from localhost ([::1]:45772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neAb4-0008Jx-Pw
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 03:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1neATb-0004Zz-2e
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 02:58:11 -0400
Received: from mga09.intel.com ([134.134.136.24]:30153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1neATY-0002m8-Qc
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 02:58:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649746688; x=1681282688;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8/e94FcBQF9otndYpBpyz9MzZeS+devzYTBTh7He9us=;
 b=mrL7NdIE/EsvBaGEjsUXAMDHqGm1CdjbKyPQsxmzctzzdsRh8+TX4fit
 NozviHt6ENfMv3dzDwkpSBLFz4FtcFRHiIIgU16EBM60HIUxyBD356k2p
 Exul4Pwx+ojcg/zbPYejsqTMIoaIsC512t6FOVFVIxw4ga9BZ0YWYFSFx
 5FgoHv2HY3JqqCNPWfl+pZxVGJsLXeeAHSq4hVabwNXKUI1B4wiVVzO9L
 eq8AB7QXMvYQOY4ZYkR0qIOsN3dCuzQJt4BQt40nALnEpY04mpgufAidT
 KWReTZKmyAecLS1f40bRZse2siZFzLC8elvwVr750UW+/AtbQR/2PtSwP g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="261731605"
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="261731605"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 23:58:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="660365039"
Received: from sqa-gate.sh.intel.com (HELO robert-clx2.tsp.org)
 ([10.239.48.212])
 by orsmga004.jf.intel.com with ESMTP; 11 Apr 2022 23:58:05 -0700
From: Robert Hoo <robert.hu@linux.intel.com>
To: xiaoguangrong.eric@gmail.com, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, qemu-devel@nongnu.org
Subject: [PATCH 1/2] acpi/nvdimm: Create _LS{I,R,W} method for NVDIMM device
Date: Tue, 12 Apr 2022 14:57:52 +0800
Message-Id: <20220412065753.3216538-2-robert.hu@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220412065753.3216538-1-robert.hu@linux.intel.com>
References: <20220412065753.3216538-1-robert.hu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=robert.hu@linux.intel.com; helo=mga09.intel.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: jingqi.liu@intel.com, dan.j.williams@intel.com,
 Robert Hoo <robert.hu@linux.intel.com>, robert.hu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since ACPI 6.2, previous NVDIMM/_DSM funcions "Get Namespace Label Data
Size (function index 4)", "Get Namespace Label Data (function index 5)",
"Set Namespace Label Data (function index 6)" has been deprecated by ACPI
standard method _LSI, _LSR, _LSW respectively. Functions semantics are
almost identical, so my implementation is to reuse existing _DSMs, just
create _LS{I,R,W} interfaces and constructs parameters and call _DSMs.

Only child NVDIMM devices has these methods, rather Root device.

By this patch, new NVDIMM sub device in ACPI namespace will be like this:

Device (NV00)
{
	Name (_ADR, One)  // _ADR: Address
        Method (_LSI, 0, NotSerialized)  // _LSI: Label Storage Information
        {
             Return (NCAL (ToUUID ("4309ac30-0d11-11e4-9191-0800200c9a66"), 0x02, 0x04, Zero, One))
        }

        Method (_LSR, 2, Serialized)  // _LSR: Label Storage Read
        {
        	CreateDWordField (BUFF, Zero, DWD0)
                CreateDWordField (BUFF, 0x04, DWD1)
                Name (PKG1, Package (0x01)
                {
                    BUFF
                })
                DWD0 = Arg0
                DWD1 = Arg1
                Return (NCAL (ToUUID ("4309ac30-0d11-11e4-9191-0800200c9a66"), 0x02, 0x05, PKG1, One))
        }

        Method (_LSW, 3, Serialized)  // _LSW: Label Storage Write
        {
                CreateDWordField (BUFF, Zero, DWD0)
                CreateDWordField (BUFF, 0x04, DWD1)
                CreateField (BUFF, 0x40, 0x7FA0, FILD)
                Name (PKG1, Package (0x01)
                {
                    BUFF
                })
                DWD0 = Arg0
                DWD1 = Arg1
                FILD = Arg2
                Return (NCAL (ToUUID ("4309ac30-0d11-11e4-9191-0800200c9a66"), 0x02, 0x06, PKG1, One))
         }

         Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
         {
                Return (NCAL (Arg0, Arg1, Arg2, Arg3, One))
         }
}

Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
Reviewed-by: Jingqi Liu<jingqi.liu@intel.com>
---
 hw/acpi/nvdimm.c | 56 ++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 52 insertions(+), 4 deletions(-)

diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index 0d43da19ea..7cc419401b 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -848,10 +848,10 @@ nvdimm_dsm_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
 
     nvdimm_debug("Revision 0x%x Handler 0x%x Function 0x%x.\n", in->revision,
                  in->handle, in->function);
-
-    if (in->revision != 0x1 /* Currently we only support DSM Spec Rev1. */) {
-        nvdimm_debug("Revision 0x%x is not supported, expect 0x%x.\n",
-                     in->revision, 0x1);
+    /* Currently we only support DSM Spec Rev1 and Rev2. */
+    if (in->revision != 0x1 && in->revision != 0x2) {
+        nvdimm_debug("Revision 0x%x is not supported, expect 0x1 or 0x2.\n",
+                     in->revision);
         nvdimm_dsm_no_payload(NVDIMM_DSM_RET_STATUS_UNSUPPORT, dsm_mem_addr);
         goto exit;
     }
@@ -1247,6 +1247,11 @@ static void nvdimm_build_fit(Aml *dev)
 static void nvdimm_build_nvdimm_devices(Aml *root_dev, uint32_t ram_slots)
 {
     uint32_t slot;
+    Aml *method, *pkg, *buff;
+
+    /* Build common shared buffer for params pass in/out */
+    buff = aml_buffer(4096, NULL);
+    aml_append(root_dev, aml_name_decl("BUFF", buff));
 
     for (slot = 0; slot < ram_slots; slot++) {
         uint32_t handle = nvdimm_slot_to_handle(slot);
@@ -1264,6 +1269,49 @@ static void nvdimm_build_nvdimm_devices(Aml *root_dev, uint32_t ram_slots)
          */
         aml_append(nvdimm_dev, aml_name_decl("_ADR", aml_int(handle)));
 
+        /* Build _LSI, _LSR, _LSW */
+        method = aml_method("_LSI", 0, AML_NOTSERIALIZED);
+        aml_append(method, aml_return(aml_call5(NVDIMM_COMMON_DSM,
+                            aml_touuid("4309AC30-0D11-11E4-9191-0800200C9A66"),
+                            aml_int(2), aml_int(4), aml_int(0),
+                            aml_int(handle))));
+        aml_append(nvdimm_dev, method);
+
+        method = aml_method("_LSR", 2, AML_SERIALIZED);
+        aml_append(method,
+            aml_create_dword_field(aml_name("BUFF"), aml_int(0), "DWD0"));
+        aml_append(method,
+            aml_create_dword_field(aml_name("BUFF"), aml_int(4), "DWD1"));
+        pkg = aml_package(1);
+        aml_append(pkg, aml_name("BUFF"));
+        aml_append(method, aml_name_decl("PKG1", pkg));
+        aml_append(method, aml_store(aml_arg(0), aml_name("DWD0")));
+        aml_append(method, aml_store(aml_arg(1), aml_name("DWD1")));
+        aml_append(method, aml_return(aml_call5(NVDIMM_COMMON_DSM,
+                            aml_touuid("4309AC30-0D11-11E4-9191-0800200C9A66"),
+                            aml_int(2), aml_int(5), aml_name("PKG1"),
+                            aml_int(handle))));
+        aml_append(nvdimm_dev, method);
+
+        method = aml_method("_LSW", 3, AML_SERIALIZED);
+        aml_append(method,
+            aml_create_dword_field(aml_name("BUFF"), aml_int(0), "DWD0"));
+        aml_append(method,
+            aml_create_dword_field(aml_name("BUFF"), aml_int(4), "DWD1"));
+        aml_append(method,
+            aml_create_field(aml_name("BUFF"), aml_int(64), aml_int(32672), "FILD"));
+        pkg = aml_package(1);
+        aml_append(pkg, aml_name("BUFF"));
+        aml_append(method, aml_name_decl("PKG1", pkg));
+        aml_append(method, aml_store(aml_arg(0), aml_name("DWD0")));
+        aml_append(method, aml_store(aml_arg(1), aml_name("DWD1")));
+        aml_append(method, aml_store(aml_arg(2), aml_name("FILD")));
+        aml_append(method, aml_return(aml_call5(NVDIMM_COMMON_DSM,
+                            aml_touuid("4309AC30-0D11-11E4-9191-0800200C9A66"),
+                            aml_int(2), aml_int(6), aml_name("PKG1"),
+                            aml_int(handle))));
+        aml_append(nvdimm_dev, method);
+
         nvdimm_build_device_dsm(nvdimm_dev, handle);
         aml_append(root_dev, nvdimm_dev);
     }
-- 
2.31.1



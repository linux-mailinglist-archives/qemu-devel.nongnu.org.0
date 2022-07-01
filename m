Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5B35637B0
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 18:22:19 +0200 (CEST)
Received: from localhost ([::1]:35620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7JPO-0008Oc-OM
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 12:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o7JEl-0000jh-Uv
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 12:11:19 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:60258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o7JEj-0002ph-Tt
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 12:11:19 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 261G2upr002374;
 Fri, 1 Jul 2022 16:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=V5IBKjj/BgWoWCYG9hxiuVLSiFR1zl8HACZUbFc6czw=;
 b=qcH+/i9+/+EZrnRZuT5QJtSgmJBSWW7SBjMRtl8er3M3Mq9Z9RECc81dj/s8bHXD75G4
 qNKeVv7vjTl1OsgAhDfyVJYp02qdI4SbWYvoLw9JuX+BblXWxmy3NYpIkX7wHU1oadni
 v5d2QDYstTALAbHvtY0nJWG7WWkAxCgU6KNOFTzbo3c970hWde/Y+aDKIy1cXRx2IqRV
 LjaBL00diJfLm/zY5y9oy61bnvAGCqAqlGovHpy72A4PfcikiGqHeS+ZMImhi7xiCvRx
 MlQyg335R1w3NPTF23JcONSJrmz4qK7jn9RZxRQCmnZrxXM6lXqPUF0u1cCWfNQeRIBT Gw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gwrscq9h3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Jul 2022 16:11:02 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 261G5h8b016107; Fri, 1 Jul 2022 16:11:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gwrt4sw4u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Jul 2022 16:11:01 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 261GAftM029065;
 Fri, 1 Jul 2022 16:11:01 GMT
Received: from paddy.uk.oracle.com (dhcp-10-175-184-247.vpn.oracle.com
 [10.175.184.247])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gwrt4svtm-6; Fri, 01 Jul 2022 16:11:00 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v6 05/10] i386/pc: factor out cxl range end to helper
Date: Fri,  1 Jul 2022 17:10:09 +0100
Message-Id: <20220701161014.3850-6-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220701161014.3850-1-joao.m.martins@oracle.com>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
X-Proofpoint-ORIG-GUID: h3ARozB3j0mA_GvZJbjcJ23LX_K0QCqb
X-Proofpoint-GUID: h3ARozB3j0mA_GvZJbjcJ23LX_K0QCqb
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Move calculation of CXL memory region end to separate helper in
preparation to allow pc_pci_hole64_start() to be called before
any mrs are initialized.

Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/i386/pc.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 6c7c49ca5a32..0abbf81841a9 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -825,6 +825,25 @@ static hwaddr pc_above_4g_end(PCMachineState *pcms)
     return x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
 }
 
+static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
+{
+    uint64_t start = 0;
+
+    if (pcms->cxl_devices_state.host_mr.addr) {
+        start = pcms->cxl_devices_state.host_mr.addr +
+            memory_region_size(&pcms->cxl_devices_state.host_mr);
+        if (pcms->cxl_devices_state.fixed_windows) {
+            GList *it;
+            for (it = pcms->cxl_devices_state.fixed_windows; it; it = it->next) {
+                CXLFixedWindow *fw = it->data;
+                start = fw->mr.addr + memory_region_size(&fw->mr);
+            }
+        }
+    }
+
+    return start;
+}
+
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
@@ -1022,16 +1041,8 @@ uint64_t pc_pci_hole64_start(void)
     MachineState *ms = MACHINE(pcms);
     uint64_t hole64_start = 0;
 
-    if (pcms->cxl_devices_state.host_mr.addr) {
-        hole64_start = pcms->cxl_devices_state.host_mr.addr +
-            memory_region_size(&pcms->cxl_devices_state.host_mr);
-        if (pcms->cxl_devices_state.fixed_windows) {
-            GList *it;
-            for (it = pcms->cxl_devices_state.fixed_windows; it; it = it->next) {
-                CXLFixedWindow *fw = it->data;
-                hole64_start = fw->mr.addr + memory_region_size(&fw->mr);
-            }
-        }
+    if (pcms->cxl_devices_state.is_enabled) {
+        hole64_start = pc_get_cxl_range_end(pcms);
     } else if (pcmc->has_reserved_memory && ms->device_memory->base) {
         hole64_start = ms->device_memory->base;
         if (!pcmc->broken_reserved_end) {
-- 
2.17.2



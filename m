Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 779B93732FA
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 02:13:12 +0200 (CEST)
Received: from localhost ([::1]:37526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le5A7-0001C7-0g
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 20:13:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1le58k-0000KG-7v; Tue, 04 May 2021 20:11:46 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:13094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1le58i-0002vL-Hn; Tue, 04 May 2021 20:11:46 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14502VeU012473; Tue, 4 May 2021 20:11:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=kHKFG/dXmbgaKEtkMCCZqGNtGLecZ8sV1PV21tPX1WU=;
 b=gfat9X8n4dZfIDrGYvf2lUNVIofPIkwWis9ulrWbX1QbNdUdcaZutgjJbLkYtqd02QIj
 TpEMeVkEk00JYkvk4PAnZ2lxOpIjwyN+ydjjof24UzXFM3XMc7sclsG+mkTMcABMBZA7
 SjDM0ceJclfH93+O/K1KM5n221x+NOCP4vEATXaCP/FCIhwAWVeSQGdd2yg/oj55JA28
 iQ6spvRNm5wyaepb0Vlm0ljngw6WIQqJCgnatHgZNU5W9daKg8FhsWjrXpJnoWn/nqXE
 ji/keAX8d9ib6lz+VZAzcGSv1OZsWRnmlMrjez3QhYsJXxfo03bbi7IRWr8q4O5i4Jqz +Q== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38bgfc05nr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 20:11:38 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1450BbX6025151;
 Wed, 5 May 2021 00:11:37 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04wdc.us.ibm.com with ESMTP id 38bedtrnq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 00:11:37 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1450BaAx25952538
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 May 2021 00:11:36 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F732C6063;
 Wed,  5 May 2021 00:11:36 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9EDC8C6059;
 Wed,  5 May 2021 00:11:35 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.49.100])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  5 May 2021 00:11:35 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/ppc/spapr.c: Extract MMU mode error reporting into a
 function
Date: Tue,  4 May 2021 21:11:29 -0300
Message-Id: <20210505001130.3999968-2-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210505001130.3999968-1-farosas@linux.ibm.com>
References: <20210505001130.3999968-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Wf_JlwyopADeHVP5b3vRt8YtVz4Y8Gvj
X-Proofpoint-ORIG-GUID: Wf_JlwyopADeHVP5b3vRt8YtVz4Y8Gvj
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-04_15:2021-05-04,
 2021-05-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105040166
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A following patch will make use of it.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 hw/ppc/spapr.c         | 16 ++++++++++++++++
 hw/ppc/spapr_hcall.c   | 14 ++------------
 include/hw/ppc/spapr.h |  1 +
 3 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 529ff056dd..4fd226b15b 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1558,6 +1558,22 @@ void spapr_setup_hpt(SpaprMachineState *spapr)
     }
 }
 
+void spapr_check_mmu_mode(bool guest_radix)
+{
+    if (guest_radix) {
+        if (kvm_enabled() && !kvmppc_has_cap_mmu_radix()) {
+            error_report("Guest requested unavailable MMU mode (radix).");
+            exit(EXIT_FAILURE);
+        }
+    } else {
+        if (kvm_enabled() && kvmppc_has_cap_mmu_radix()
+            && !kvmppc_has_cap_mmu_hash_v3()) {
+            error_report("Guest requested unavailable MMU mode (hash).");
+            exit(EXIT_FAILURE);
+        }
+    }
+}
+
 static void spapr_machine_reset(MachineState *machine)
 {
     SpaprMachineState *spapr = SPAPR_MACHINE(machine);
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 7b5cd3553c..32b7100125 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1755,18 +1755,8 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
     spapr_ovec_intersect(spapr->ov5_cas, spapr->ov5, ov5_guest);
     spapr_ovec_cleanup(ov5_guest);
 
-    if (guest_radix) {
-        if (kvm_enabled() && !kvmppc_has_cap_mmu_radix()) {
-            error_report("Guest requested unavailable MMU mode (radix).");
-            exit(EXIT_FAILURE);
-        }
-    } else {
-        if (kvm_enabled() && kvmppc_has_cap_mmu_radix()
-            && !kvmppc_has_cap_mmu_hash_v3()) {
-            error_report("Guest requested unavailable MMU mode (hash).");
-            exit(EXIT_FAILURE);
-        }
-    }
+    spapr_check_mmu_mode(guest_radix);
+
     spapr->cas_pre_isa3_guest = !spapr_ovec_test(ov1_guest, OV1_PPC_3_00);
     spapr_ovec_cleanup(ov1_guest);
 
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index bf7cab7a2c..52b68b2d92 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -820,6 +820,7 @@ void spapr_dt_events(SpaprMachineState *sm, void *fdt);
 void close_htab_fd(SpaprMachineState *spapr);
 void spapr_setup_hpt(SpaprMachineState *spapr);
 void spapr_free_hpt(SpaprMachineState *spapr);
+void spapr_check_mmu_mode(bool guest_radix);
 SpaprTceTable *spapr_tce_new_table(DeviceState *owner, uint32_t liobn);
 void spapr_tce_table_enable(SpaprTceTable *tcet,
                             uint32_t page_shift, uint64_t bus_offset,
-- 
2.29.2



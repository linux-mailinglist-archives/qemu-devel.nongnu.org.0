Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D36062FBC7
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 18:39:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow5Im-00041N-Dd; Fri, 18 Nov 2022 12:37:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1ow5Ik-000414-Gn; Fri, 18 Nov 2022 12:37:18 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1ow5Ii-0001po-BJ; Fri, 18 Nov 2022 12:37:18 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AIHUR9j006610; Fri, 18 Nov 2022 17:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2022-7-12;
 bh=YrfFUlDUWcuew2ijWlrvXF09njEppQ/hXZffT94Y59E=;
 b=NFO5YLbkoJHSYW7k7gqdF1AwgauwzUcv65nHgK5x+Qh2IzqQcKXf/N9lva4qv2aVvihE
 hta96LrSnu4A0UrgM8DYz1vpuITb7m3iPKoAw5VTTyCdxrRv5SX8OpswcKNRoiLya+4b
 nm2cgAT4T+0cncYush5p03Os8PhiN0v0Pbc69aAICXFNb2UMRY0h+Aa67aGpku3g8e9e
 ZY+MErxngzsw4teiN8KB3lckvr71A1DukUBI5InHycpSF0dcMc34w7ielSNLscv4k0kL
 EXucUzXXA004rJZ61apg72C80uBGEZYgds3X6qjahfwz0/dXdJOK2bfDQdCszOPUexWg 1Q== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kx96994n4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Nov 2022 17:37:10 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2AIGxNCC023190; Fri, 18 Nov 2022 17:37:10 GMT
Received: from mihai.localdomain (ban25x6uut25.us.oracle.com [10.153.73.25])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3kt1xaucq3-1; Fri, 18 Nov 2022 17:37:10 +0000
From: Mihai Carabas <mihai.carabas@oracle.com>
To: qemu-arm@nongnu.org, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org
Subject: [PATCH] target/arm: build smbios 19 table
Date: Fri, 18 Nov 2022 18:30:29 +0200
Message-Id: <1668789029-5432-1-git-send-email-mihai.carabas@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_06,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211180103
X-Proofpoint-GUID: qLGqXmY8hO5fmVvpTRW7O6JKtti-H0DG
X-Proofpoint-ORIG-GUID: qLGqXmY8hO5fmVvpTRW7O6JKtti-H0DG
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=mihai.carabas@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Use the base_memmap to build the SMBIOS 19 table which provides the address
mapping for a Physical Memory Array (from spec [1] chapter 7.20).

This was present on i386 from commit c97294ec1b9e36887e119589d456557d72ab37b5
("SMBIOS: Build aggregate smbios tables and entry point").

[1] https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.5.0.pdf

Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
---
 hw/arm/virt.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index cda9defe8f09..855b6982f363 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1607,9 +1607,11 @@ static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
 static void virt_build_smbios(VirtMachineState *vms)
 {
     MachineClass *mc = MACHINE_GET_CLASS(vms);
+    MachineState *ms = MACHINE(vms);
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     uint8_t *smbios_tables, *smbios_anchor;
     size_t smbios_tables_len, smbios_anchor_len;
+    struct smbios_phys_mem_area mem_array;
     const char *product = "QEMU Virtual Machine";
 
     if (kvm_enabled()) {
@@ -1620,7 +1622,11 @@ static void virt_build_smbios(VirtMachineState *vms)
                         vmc->smbios_old_sys_ver ? "1.0" : mc->name, false,
                         true, SMBIOS_ENTRY_POINT_TYPE_64);
 
-    smbios_get_tables(MACHINE(vms), NULL, 0,
+    /* build the array of physical mem area from base_memmap */
+    mem_array.address = vms->memmap[VIRT_MEM].base;
+    mem_array.length = ms->ram_size;
+
+    smbios_get_tables(ms, &mem_array, 1,
                       &smbios_tables, &smbios_tables_len,
                       &smbios_anchor, &smbios_anchor_len,
                       &error_fatal);
-- 
1.8.3.1



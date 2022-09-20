Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8083B5BEF10
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:20:50 +0200 (CEST)
Received: from localhost ([::1]:38908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oakfh-0002OW-Mf
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1oag1o-0004kL-Gm; Tue, 20 Sep 2022 12:23:25 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:43558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1oag1m-0000Le-3Y; Tue, 20 Sep 2022 12:23:19 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28KGJB1C028574;
 Tue, 20 Sep 2022 16:23:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : reply-to :
 mime-version : content-transfer-encoding; s=corp-2022-7-12;
 bh=yt9CMl/7J8ldFIktUc92eWuVYdzToZFecJEcs4JXWRU=;
 b=EOP6T7C19pYoBIOxy1mHtaucd9hFUZPsQ1L2j3joeSY6LIDN0h6DRwZ6dj8kP/ABOq3Z
 zsD7vJKc69H+HM5gGNK4DVvULM3Tttn6ClH6107QGFk7gmmHxHQizv0LsvNQ8v4FqXst
 kPX81SvnmFwOFx/CdzSXJzihjpf+OHOFP23uega9r7Fey5Xyoskxl/lRZAKgSBVEBRYn
 N5MYI/OpyLORnSyeaZRPu4H+0jw5958X3kZW4TJkiFsAN3NFF+OdxUeKhdsWSycIahwQ
 wdTuEPvMW3Tq6tAXmhYUKGMDlRmTtgUfdsERvEjecyHv2+UvgbTJguDp6kPPnoUBrOY2 2w== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jn68rfg9t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Sep 2022 16:23:12 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 28KFgIx5027899; Tue, 20 Sep 2022 16:23:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jp3cng80j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Sep 2022 16:23:11 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28KGMqUx016251;
 Tue, 20 Sep 2022 16:23:10 GMT
Received: from mlluis-mac.uk.oracle.com (dhcp-10-175-195-182.vpn.oracle.com
 [10.175.195.182])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3jp3cng7mf-3; Tue, 20 Sep 2022 16:23:10 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 shannon.zhaosl@gmail.com, peter.maydell@linaro.org,
 Miguel Luis <miguel.luis@oracle.com>
Subject: [PATCH 2/3] acpi: arm/virt: build_gtdt: fix invalid 64-bit physical
 addresses
Date: Tue, 20 Sep 2022 16:21:36 +0000
Message-Id: <20220920162137.75239-3-miguel.luis@oracle.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220920162137.75239-1-miguel.luis@oracle.com>
References: <20220920162137.75239-1-miguel.luis@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-20_06,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=844
 spamscore=0 adultscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209200097
X-Proofpoint-GUID: LRDOa_EdeChg5UI9K9Ysc56S8e4_xK8G
X-Proofpoint-ORIG-GUID: LRDOa_EdeChg5UI9K9Ysc56S8e4_xK8G
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=miguel.luis@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Reply-To: miguel.luis@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the ACPI 6.5 specification, on the GTDT Table Structure, the Counter Control
Block Address and Counter Read Block Address fields of the GTDT table should be
set to 0xFFFFFFFFFFFFFFFF if not provided, rather than 0x0.

Fixes: 41041e57085 ("acpi: arm/virt: build_gtdt: use acpi_table_begin()/acpi_table_end() instead of build_header()")

Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
---
 hw/arm/virt-acpi-build.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 9b3aee01bf..13c6e3e468 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -592,8 +592,7 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     acpi_table_begin(&table, table_data);
 
     /* CntControlBase Physical Address */
-    /* FIXME: invalid value, should be 0xFFFFFFFFFFFFFFFF if not impl. ? */
-    build_append_int_noprefix(table_data, 0, 8);
+    build_append_int_noprefix(table_data, 0xFFFFFFFFFFFFFFFF, 8);
     build_append_int_noprefix(table_data, 0, 4); /* Reserved */
     /*
      * FIXME: clarify comment:
@@ -618,7 +617,7 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     /* Non-Secure EL2 timer Flags */
     build_append_int_noprefix(table_data, irqflags, 4);
     /* CntReadBase Physical address */
-    build_append_int_noprefix(table_data, 0, 8);
+    build_append_int_noprefix(table_data, 0xFFFFFFFFFFFFFFFF, 8);
     /* Platform Timer Count */
     build_append_int_noprefix(table_data, 0, 4);
     /* Platform Timer Offset */
-- 
2.36.0



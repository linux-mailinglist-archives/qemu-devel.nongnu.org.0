Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848675F9F5D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 15:28:58 +0200 (CEST)
Received: from localhost ([::1]:60426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohsq1-0005TN-49
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 09:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1ohsko-0005hL-Lk; Mon, 10 Oct 2022 09:23:34 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:34106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1ohskk-0003To-Na; Mon, 10 Oct 2022 09:23:32 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29AC0VDf029778;
 Mon, 10 Oct 2022 13:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : reply-to : mime-version :
 content-transfer-encoding; s=corp-2022-7-12;
 bh=lrdteXD0GlNp/UCruHJlFtZpY6asEO1L0gvnwY64d88=;
 b=ktHWpR8T45NRuTyUmZl2nwzegy4qRii85jvmD6A4kezeWBkbSOwbUg04vlHihclXR5kj
 3dvwLUUULcnqSzOeklwiwNTI9uIdxZcmMZIjAgwgDxMQXt9FsGsv5RkP4o65uLQzvc0W
 Bh+n0OETMvC6wntOHL+qlKHj6Q182yJL+ZjoV3DNEXdVNSjvwUI/W8glYFoSTzskps2Q
 Vkaes95xjej/Ij2aSpfMesqs5UF1yeUMqJeazYwp9rfCjHFBCRX4IPkfTpCuxOCuu0T5
 3odLdMU57/XtY+20XsWLPdkP3rBPEuve+1MS51sYLsDWJ3flbUs1Sn/3eGmkwIM3orbk 4g== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k30tt3gm8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Oct 2022 13:23:25 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29AATDG3022039; Mon, 10 Oct 2022 13:23:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3k2yn347xx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Oct 2022 13:23:24 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29ADNNh0019450;
 Mon, 10 Oct 2022 13:23:23 GMT
Received: from mlluis-mac.uk.oracle.com (dhcp-10-175-204-94.vpn.oracle.com
 [10.175.204.94])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3k2yn347wn-1; Mon, 10 Oct 2022 13:23:23 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 shannon.zhaosl@gmail.com, peter.maydell@linaro.org, miguel.luis@oracle.com
Subject: [RFC PATCH v2 0/4] ACPI MADT and FADT update according to the ACPI
 6.0 spec
Date: Mon, 10 Oct 2022 13:22:56 +0000
Message-Id: <20221010132300.96935-1-miguel.luis@oracle.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-10_08,2022-10-10_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 phishscore=0 mlxscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210100080
X-Proofpoint-GUID: azJC2kF7LVsMbkY2ZTxu5IqbDJDEy393
X-Proofpoint-ORIG-GUID: azJC2kF7LVsMbkY2ZTxu5IqbDJDEy393
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=miguel.luis@oracle.com; helo=mx0b-00069f02.pphosted.com
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

The MADT table structure has been updated in commit 37f33084ed2e                 
("acpi: arm/virt: madt: use build_append_int_noprefix() API to compose MADT table")
to include the 5.2.12.18 GIC ITS Structure and so table's revision also needs to 
be updated. MADT and the FADT tables from the same spec need to be in sync and in
this case also the FADT needs to be updated.                                     
                                                                                 
Revision 6.0 of the ACPI FADT table introduces the field "Hypervisor Vendor      
Identity" which is missing and must be included. Patch 2/4 includes a
suggestion for the value of this field.

Ref: https://uefi.org/sites/default/files/resources/ACPI_6_0_Errata_A.PDF        

Changelog:

v2:
    patch 2/4:
    fix expression that checks for the revision number (Ani Sinha)
    use "QEMU" as the Hypervisor Vendor ID [1] (Ani Sinha)

    patch 3/4:
    add Reviewed-by tag from Ani Sinha <ani@anisinha.ca>
    

v1: https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg00910.html

Open to discussion, your comments, thoughts and suggestions are very welcome.    
Thanks in advance.                                                               
Miguel

[1]: https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg00989.html

Miguel Luis (4):
  tests/acpi: virt: allow acpi MADT and FADT changes
  acpi: fadt: support revision 6.0 of the ACPI specification
  acpi: arm/virt: madt: bump to revision 4 accordingly to ACPI 6.0
    Errata A
  tests/acpi: virt: update ACPI MADT and FADT binaries

 hw/acpi/aml-build.c               |  13 ++++++++++---
 hw/arm/virt-acpi-build.c          |  26 ++++++++++++--------------
 tests/data/acpi/virt/APIC         | Bin 168 -> 172 bytes
 tests/data/acpi/virt/APIC.memhp   | Bin 168 -> 172 bytes
 tests/data/acpi/virt/APIC.numamem | Bin 168 -> 172 bytes
 tests/data/acpi/virt/FACP         | Bin 268 -> 276 bytes
 tests/data/acpi/virt/FACP.memhp   | Bin 268 -> 276 bytes
 tests/data/acpi/virt/FACP.numamem | Bin 268 -> 276 bytes
 8 files changed, 22 insertions(+), 17 deletions(-)

-- 
2.37.3



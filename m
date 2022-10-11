Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BB75FBA5D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 20:30:22 +0200 (CEST)
Received: from localhost ([::1]:33308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiK1F-0005SL-Gv
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 14:30:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1oiJpL-0006bF-3A; Tue, 11 Oct 2022 14:18:03 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:58940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1oiJpH-0003T8-IJ; Tue, 11 Oct 2022 14:18:02 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29BHT318031966;
 Tue, 11 Oct 2022 18:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : reply-to : mime-version :
 content-transfer-encoding; s=corp-2022-7-12;
 bh=h1lHEVGH6QW5BMm3SjV8kJC42p/ljTn4J9+kKBxdvHs=;
 b=wq1gZMG13MqT2KEWDblsKOHelhC0bQmfTQ3sz9grV9bxAewmTu4lOXxJL1cTWuoJDtxT
 vhn7VSAUxz14kLczr3MI+tHTKjbusvQdUzACwPogth5EDSkimJsjBbDfxEsQHDVomdCk
 3cR2LUkQJg+PGfICAa1wZycj50EjjSZ+f+lskDg7k0XTNFIAQ1fKlqnZfdTwi/ZujKD1
 2lXvqC5vFFp5+Y/J7+HQynlgb17ecBdUZKFhHVkOE/MM3JZ+Zroq9fjRlwrHoDjNNLS5
 OXcaT3XW8GSXgzbfmCKJ+EWB5YZdX0bI5f0eO9grGiWdVaQJoosmChYs87A5B2wqtGNu iQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k30tt7m44-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Oct 2022 18:17:51 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29BH4Wue027700; Tue, 11 Oct 2022 18:17:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3k2ynaf4g6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Oct 2022 18:17:51 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29BIEwgm034553;
 Tue, 11 Oct 2022 18:17:50 GMT
Received: from mlluis-mac.uk.oracle.com (dhcp-10-175-196-28.vpn.oracle.com
 [10.175.196.28])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3k2ynaf4fc-1; Tue, 11 Oct 2022 18:17:50 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 shannon.zhaosl@gmail.com, peter.maydell@linaro.org, miguel.luis@oracle.com
Subject: [PATCH 0/4] ACPI MADT and FADT update according to the ACPI 6.0 spec
Date: Tue, 11 Oct 2022 18:17:26 +0000
Message-Id: <20221011181730.10885-1-miguel.luis@oracle.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-11_08,2022-10-11_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=929
 suspectscore=0
 adultscore=0 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210110106
X-Proofpoint-GUID: oIjbLqaL0W8i5tHptSdVH0dJrJ3j0e8W
X-Proofpoint-ORIG-GUID: oIjbLqaL0W8i5tHptSdVH0dJrJ3j0e8W
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
Identity" which is missing and must be included.

Ref: https://uefi.org/sites/default/files/resources/ACPI_6_0_Errata_A.PDF

This patch series originates from a previous RFC [1] discussion. Reviewed-by
tags were kept on patches 2/4 and 3/4.

[1]: https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg01326.html

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



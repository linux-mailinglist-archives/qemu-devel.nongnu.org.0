Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 792265F6D02
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 19:31:47 +0200 (CEST)
Received: from localhost ([::1]:57480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogUio-0001ln-Av
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 13:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1ogTXA-0007OR-JX; Thu, 06 Oct 2022 12:15:40 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:49094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1ogTX8-0006n2-GG; Thu, 06 Oct 2022 12:15:40 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 296FhkfE009472;
 Thu, 6 Oct 2022 16:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : reply-to : mime-version :
 content-transfer-encoding; s=corp-2022-7-12;
 bh=9H81aPdgl1UExUuG98zsEQrT8Z5iFKbGoxiLFepC7Wk=;
 b=MYI0xbzSjQpWFK+QJNJmYGc498CSCyWfNvhqO+BLj5z1ZVdzBgmJ2omFZiBJUmegXdcG
 a/7DDgBFaeERq8cFC3YgVI4iId91ju7TUsak4HTFAajekCxVUwnrfZ9eCvBTNy9Qy6Fy
 A5YrOxVfZfpFEvsQ4eAon0ShzmooxTGbzOjibCChMJLK0TvVhAPW+PSCq0OeZRR4ndlE
 ve23cubwYN2w0xFcSiXFNobUEDlvkPmqKik434T0x0sKBiSd1lqWR9HGCRPhrSWswTwJ
 L6N5UtOORMU3m4ergifjA0ety8rG8H9YH+VKk3dBvVrGcMHBNpYc7bo6TmouN5ZYPF6x DA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k15up4405-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Oct 2022 16:15:23 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 296FAfJf028246; Thu, 6 Oct 2022 16:15:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3jxc06eq3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Oct 2022 16:15:22 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 296GFLrf001092;
 Thu, 6 Oct 2022 16:15:21 GMT
Received: from mlluis-mac.uk.oracle.com (dhcp-10-175-170-234.vpn.oracle.com
 [10.175.170.234])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3jxc06eq1e-1; Thu, 06 Oct 2022 16:15:21 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 shannon.zhaosl@gmail.com, peter.maydell@linaro.org, miguel.luis@oracle.com
Subject: [RFC PATCH 0/4] ACPI MADT and FADT update according to the ACPI 6.0
 spec
Date: Thu,  6 Oct 2022 16:14:46 +0000
Message-Id: <20221006161450.69912-1-miguel.luis@oracle.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_04,2022-10-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210060094
X-Proofpoint-GUID: 5kvbw4DjOIRNqxtgox_KKM61-7XBVnxb
X-Proofpoint-ORIG-GUID: 5kvbw4DjOIRNqxtgox_KKM61-7XBVnxb
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
Identity" which is missing and must be included. Patch 2/4 includes a suggestion
for the value of this field by using the current acceleration name. This would
provide values like 'KVM' for example when KVM is used.

Ref: https://uefi.org/sites/default/files/resources/ACPI_6_0_Errata_A.PDF

Open to discussion, your comments, thoughts and suggestions are very welcome.

Thanks in advance.
Miguel

Miguel Luis (4):
  tests/acpi: virt: allow acpi MADT and FADT changes
  acpi: fadt: support revision 6.0 of the ACPI specification
  acpi: arm/virt: madt: bump to revision 4 accordingly to ACPI 6.0
    Errata A
  Step 6 & 7 of the bios-tables-test.c documented procedure.

 hw/acpi/aml-build.c               |  14 +++++++++++---
 hw/arm/virt-acpi-build.c          |  26 ++++++++++++--------------
 tests/data/acpi/virt/APIC         | Bin 168 -> 172 bytes
 tests/data/acpi/virt/APIC.memhp   | Bin 168 -> 172 bytes
 tests/data/acpi/virt/APIC.numamem | Bin 168 -> 172 bytes
 tests/data/acpi/virt/FACP         | Bin 268 -> 276 bytes
 tests/data/acpi/virt/FACP.memhp   | Bin 268 -> 276 bytes
 tests/data/acpi/virt/FACP.numamem | Bin 268 -> 276 bytes
 8 files changed, 23 insertions(+), 17 deletions(-)

-- 
2.37.3



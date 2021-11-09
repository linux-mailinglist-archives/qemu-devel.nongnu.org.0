Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C4C44AF25
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 15:04:49 +0100 (CET)
Received: from localhost ([::1]:59652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkRjz-0005JG-Tp
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 09:04:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mkRhJ-0002uI-1q
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 09:02:04 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45010
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mkRhF-00057y-RL
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 09:02:00 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A9DZAVl017387; 
 Tue, 9 Nov 2021 14:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=4j6N5BrE1xU/kT8ktvYh5Qujag+pfI915VtmSkMxboc=;
 b=LA+Uv0tK90dfFTMLvTOvx9AmZNr1cFN0nJUii/CVACejmedHfvHarMmkwS+v7pBCwwIQ
 FMyP5fqxg5WlogGcB1LutzRCiTLRD7klbxGE7qOR93Wk1OASMf6hfpxaHQsrs9co3PyO
 kAi6T8wN9TDkUBU1fh5Z5ns3/j01P3HRFjekCBFkXCIK2lqU0hG9wo4/m2sUxk03crGh
 GuUwwRigOCW5dU2Hw2M9RXwDpz0DL/aH63LLXiHTum2sTp762y15JYd9ZXo8y6QbWKe8
 uMpFg8LxzBJ3pmcfB5wNT5sWOErulq3Ga2ZVTkrqGnN79FXuZMNwsg+IFIijzimupbiU TA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c7qj0cc8t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 14:01:55 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A9CJWuo024434;
 Tue, 9 Nov 2021 14:01:55 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c7qj0cc86-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 14:01:55 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A9DqmMZ008202;
 Tue, 9 Nov 2021 14:01:54 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03dal.us.ibm.com with ESMTP id 3c5hbaysfg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 14:01:54 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A9E1sXa46006598
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Nov 2021 14:01:54 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D955628073;
 Tue,  9 Nov 2021 14:01:53 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8DD928077;
 Tue,  9 Nov 2021 14:01:53 +0000 (GMT)
Received: from sbct-2.pok.ibm.com (unknown [9.47.158.152])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  9 Nov 2021 14:01:53 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] tests: acpi: Add updated TPM related tables
Date: Tue,  9 Nov 2021 09:01:52 -0500
Message-Id: <20211109140152.3310657-4-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211109140152.3310657-1-stefanb@linux.ibm.com>
References: <20211109140152.3310657-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7TmqqOg6ReskNH3myXK7BYKf9bIuUedf
X-Proofpoint-ORIG-GUID: whiIuOWmYRxqDqPAv-AE5Df-Aj3BIqxp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-09_03,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 malwarescore=0
 adultscore=0 impostorscore=0 mlxscore=0 clxscore=1015 spamscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111090085
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, marcandre.lureau@redhat.com,
 Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The updated TPM related tables have the following additions:

   Device (TPM)
   {
       Name (_HID, "MSFT0101" /* TPM 2.0 Security Device */)  // _HID: Hardware ID
+      Name (_STR, "TPM 2.0 Device")  // _STR: Description String
+      Name (_UID, One)  // _UID: Unique ID
       Name (_STA, 0x0F)  // _STA: Status
       Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 tests/data/acpi/q35/DSDT.tis.tpm12          | Bin 0 -> 8900 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2           | Bin 0 -> 8921 bytes
 tests/data/acpi/q35/TCPA.tis.tpm12          | Bin 0 -> 50 bytes
 tests/data/acpi/q35/TPM2.tis.tpm2           | Bin 0 -> 76 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |  11 -----------
 5 files changed, 11 deletions(-)

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm12 b/tests/data/acpi/q35/DSDT.tis.tpm12
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..dc1c990496a8fb0fc268081a54c5af363bcd833f 100644
GIT binary patch
literal 8900
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
F`#<HBYk2?w

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm2 b/tests/data/acpi/q35/DSDT.tis.tpm2
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..1314a5d3dad1b7b9aff782e649058873c492acb0 100644
GIT binary patch
literal 8921
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
YedqfyBbvsj5$(-l5+y&No7rdo2O|D&c>n+a

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/TCPA.tis.tpm12 b/tests/data/acpi/q35/TCPA.tis.tpm12
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..a56961b413e7715b3d60f9836d1c8f2f4c7347cb 100644
GIT binary patch
literal 50
qcmWG>4sbMLU|?V}a`Jcf2v%^42yj*a0!E-1hz+7a07U<12eAOxRtEt9

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/TPM2.tis.tpm2 b/tests/data/acpi/q35/TPM2.tis.tpm2
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..fe0f05987be40f1c1742ae189df7821adc522fc0 100644
GIT binary patch
literal 76
wcmWFu@HO&bU|?Vob@F%i2v%^42yj*a0!E-1hz+8V0UI(0%m%6W&kkY&0CHRh0RR91

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 9743422eee..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,12 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/APIC.tis.tpm2",
-"tests/data/acpi/q35/DSDT.tis.tpm12",
-"tests/data/acpi/q35/DSDT.tis.tpm2",
-"tests/data/acpi/q35/FACP.tis.tpm2",
-"tests/data/acpi/q35/FACS.tis.tpm2",
-"tests/data/acpi/q35/HPET.tis.tpm2",
-"tests/data/acpi/q35/MCFG.tis.tpm2",
-"tests/data/acpi/q35/TCPA.tis.dsl",
-"tests/data/acpi/q35/TCPA.tis.tpm12",
-"tests/data/acpi/q35/TPM2.tis.tpm2",
-"tests/data/acpi/q35/WAET.tis.tpm2",
-- 
2.31.1



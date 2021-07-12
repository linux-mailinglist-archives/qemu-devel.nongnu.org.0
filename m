Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C091C3C5EFA
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:19:52 +0200 (CEST)
Received: from localhost ([::1]:57506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2xip-00070S-Qt
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1m2xaD-000851-T9
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:10:57 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:21770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1m2xaB-0004PB-JG
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:10:57 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CF3MLZ033364
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 11:10:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=d1VNtTRCn2eDY0m1mSeTP6//wndlGqR13cNZtY9W9wQ=;
 b=WsziPl9RAjwRDhmIbK4W/gRJn70TawxsMZb3Y1AVlZVsPYB+gBhbKHJbHS6Nmj/Nvb8A
 +lmLfh6xC8nUbmZU+OSPeNZTOLKrZBG7Wk8CchIs2c7mCheWwEP5bRA8TVHvji7SjmMi
 HGY/tzSXh5g83GSh7ZJSIm6cxPc0UJBZ1u50QlzPLxbrLTQOrVIgeihs1NbOv1qlvdIv
 rEphJnzMM2daWPMOHm8Nvz+QWZxMR5hJPgQ/7MzvaufiE9KN8g0Zv6c/JF/9Vgl79H+5
 ZRiathc2bUUW5qIKJbCfhSeOao/JEty9EKrxVbNIBLFk9IV9Y8JXCqkiBYn8JyjpuYEN ig== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrucn7w0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 11:10:54 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16CF3eas034407
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 11:10:54 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrucn7vs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 11:10:54 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16CF90dZ013598;
 Mon, 12 Jul 2021 15:10:53 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01dal.us.ibm.com with ESMTP id 39q36atwqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 15:10:53 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16CF9spr29950324
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 15:09:55 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C666778068;
 Mon, 12 Jul 2021 15:09:54 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 605C87805F;
 Mon, 12 Jul 2021 15:09:54 +0000 (GMT)
Received: from sbct-3.pok.ibm.com?044watson.ibm.com (unknown [9.47.158.153])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 12 Jul 2021 15:09:54 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Subject: [PATCH v3 5/9] tests: acpi: tpm2: Add the renamed ACPI files and drop
 old ones
Date: Mon, 12 Jul 2021 11:09:45 -0400
Message-Id: <20210712150949.165725-6-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210712150949.165725-1-stefanb@linux.vnet.ibm.com>
References: <20210712150949.165725-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: L_7--5y4DOlEH9XWBY9hwXp8X1Src9ZE
X-Proofpoint-ORIG-GUID: Mrlzi8ogDWXmDicWfxhrfhoxqPWG-QG6
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-12_09:2021-07-12,
 2021-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=998 impostorscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107120118
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=stefanb@linux.vnet.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, philmd@redhat.com,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/data/acpi/q35/DSDT.tis                | Bin 8465 -> 0 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2           | Bin 0 -> 8465 bytes
 tests/data/acpi/q35/TPM2.tis                | Bin 76 -> 0 bytes
 tests/data/acpi/q35/TPM2.tis.tpm2           | Bin 0 -> 76 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   2 --
 5 files changed, 2 deletions(-)
 delete mode 100644 tests/data/acpi/q35/DSDT.tis
 delete mode 100644 tests/data/acpi/q35/TPM2.tis

diff --git a/tests/data/acpi/q35/DSDT.tis b/tests/data/acpi/q35/DSDT.tis
deleted file mode 100644
index 15a26a14e4be5280c0f1cc09f66428311100b7ab..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 8465
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
Mh>{=D$sDl%17maSY5)KL

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm2 b/tests/data/acpi/q35/DSDT.tis.tpm2
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..15a26a14e4be5280c0f1cc09f66428311100b7ab 100644
GIT binary patch
literal 8465
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
Mh>{=D$sDl%17maSY5)KL

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/TPM2.tis b/tests/data/acpi/q35/TPM2.tis
deleted file mode 100644
index fe0f05987be40f1c1742ae189df7821adc522fc0..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 76
wcmWFu@HO&bU|?Vob@F%i2v%^42yj*a0!E-1hz+8V0UI(0%m%6W&kkY&0CHRh0RR91

diff --git a/tests/data/acpi/q35/TPM2.tis.tpm2 b/tests/data/acpi/q35/TPM2.tis.tpm2
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..fe0f05987be40f1c1742ae189df7821adc522fc0 100644
GIT binary patch
literal 76
wcmWFu@HO&bU|?Vob@F%i2v%^42yj*a0!E-1hz+8V0UI(0%m%6W&kkY&0CHRh0RR91

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index b301b8fa06..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,3 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT.tis.tpm2",
-"tests/data/acpi/q35/TPM2.tis.tpm2",
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E57803DE200
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 23:55:16 +0200 (CEST)
Received: from localhost ([::1]:59024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAftz-0004rN-QH
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 17:55:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mAfrk-00021z-UZ
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 17:52:56 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:13316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mAfrf-0000g2-RJ
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 17:52:56 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 172LY3M5168977
 for <qemu-devel@nongnu.org>; Mon, 2 Aug 2021 17:52:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=HoEDlvu6512z1b5RLkb4CCBDZszek8MVwxCtktdFtNM=;
 b=NBGcbj709oEqhHfLD4NusYZTb8Saad5R7Nt81HE0jeoJHPMf82iOYwEiXUkIoR+T6sU0
 gF3cqfEXAuIRgQBlzetL0CgrXCnlwE7p1kaw3x2qzFuRIKxq7hu8KNM8qDYTpMycG6jl
 ciOGRUZVxcSbiURRO4JIQmORcTeT3YaAQ6slZQSGv8VMZc67baqW2C0dNHs2RiULlj/v
 OI+MPDo/TbdUKZaJzRm8KryY5kTtY/VEqUGWhkN/tEREP9q5twGY0EMo3p38cEm+L0Mz
 VX4fEQDM4DuxZ4B+qozgg9SdkeiFTSjjmnVNb/Har+zxU4OzyKvD+p0dPa0OPMKTOibC Pg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a6f14b3e7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 17:52:49 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 172Le0Y7188599
 for <qemu-devel@nongnu.org>; Mon, 2 Aug 2021 17:52:49 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a6f14b3e0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Aug 2021 17:52:49 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 172LhKq6006361;
 Mon, 2 Aug 2021 21:52:48 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03dal.us.ibm.com with ESMTP id 3a4x5ch886-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Aug 2021 21:52:48 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 172Lql6740763776
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Aug 2021 21:52:47 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8CCBFB2064;
 Mon,  2 Aug 2021 21:52:47 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7FF93B206C;
 Mon,  2 Aug 2021 21:52:47 +0000 (GMT)
Received: from sbct-3.pok.ibm.com?044watson.ibm.com (unknown [9.47.158.153])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  2 Aug 2021 21:52:47 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Subject: [PATCH-for-6.2 v6 03/10] tests: acpi: Prepare for renaming of TPM2
 related ACPI files
Date: Mon,  2 Aug 2021 17:52:39 -0400
Message-Id: <20210802215246.1433175-4-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210802215246.1433175-1-stefanb@linux.ibm.com>
References: <20210802215246.1433175-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LeiDgr7oa_8Nys2vaBt57ZLUo86T0fld
X-Proofpoint-GUID: vDdmhuCRUXsUQxwfba6e4x0BKGb0e-4i
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-02_07:2021-08-02,
 2021-08-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108020137
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: imammedo@redhat.com, Stefan Berger <stefanb@linux.ibm.com>,
 philmd@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/data/acpi/q35/DSDT.tis.tpm2           | 0
 tests/data/acpi/q35/TPM2.tis.tpm2           | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
 3 files changed, 2 insertions(+)
 create mode 100644 tests/data/acpi/q35/DSDT.tis.tpm2
 create mode 100644 tests/data/acpi/q35/TPM2.tis.tpm2

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm2 b/tests/data/acpi/q35/DSDT.tis.tpm2
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/TPM2.tis.tpm2 b/tests/data/acpi/q35/TPM2.tis.tpm2
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..b301b8fa06 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,3 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT.tis.tpm2",
+"tests/data/acpi/q35/TPM2.tis.tpm2",
-- 
2.31.1



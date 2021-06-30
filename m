Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4193B86A9
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 17:59:28 +0200 (CEST)
Received: from localhost ([::1]:60572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyccZ-00079m-Tf
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 11:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1lycHV-0005Uj-AB
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:37:41 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1lycHL-0008CV-CK
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:37:41 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15UFYEZw028743
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:37:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=yzRj0o8ojPFYgy8S6y2/BugwSstc3mgDZe0xkfx6el4=;
 b=ptMiXxm37ugy3pX5V8M4VcNTKiA3twI2CLAdSZe+8WZcZXQpsfiVXcLWOebXIIKERGfQ
 fGB6BaHfrpD4okV+XAlm2VOtfVaBuU9JD+AIGypTlOo8uWeYkFNQrt5BzW66ShnNTrgW
 a3VNiR8JyvxsEHkXVLT4w8UPElh0gzdD9HItOX4BxrHRhh3N1rOcKP6r193k+eFjSjFC
 sqNQu926+UfCTx/lDddePgGe8qlIYXK04uklS3jMP/zZqM3ptJ4KnXErmuUkefs/S1ci
 alpr1qmznYzmnm8c/vcuQ29q583xxnp2vgDCDGPZkG4iBCIn+hTtvTJCzIg54nqrEIxM Yg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39gtfst7vf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:37:28 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15UFYD64028689
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:37:27 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39gtfst7uy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 11:37:27 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15UFX0Ke029932;
 Wed, 30 Jun 2021 15:37:26 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03dal.us.ibm.com with ESMTP id 39duvdrkjw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 15:37:25 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15UFbPIw39322046
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 15:37:25 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F80DAE019;
 Wed, 30 Jun 2021 15:37:25 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 018C7AE052;
 Wed, 30 Jun 2021 15:37:25 +0000 (GMT)
Received: from sbct-3.pok.ibm.com?044watson.ibm.com (unknown [9.47.158.153])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 30 Jun 2021 15:37:24 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Subject: [PATCH 3/7] tests: Add suffix tpm2 or tpm12 to ACPI table files
Date: Wed, 30 Jun 2021 11:37:19 -0400
Message-Id: <20210630153723.672473-4-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210630153723.672473-1-stefanb@linux.vnet.ibm.com>
References: <20210630153723.672473-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KlqxwH-IVIs4iM6uZbc3NiugE8RSLcfH
X-Proofpoint-GUID: uIZg43rDvPCci_vZ6ASaCLkqceEBlmxR
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-30_06:2021-06-29,
 2021-06-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106300092
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
Cc: Stefan Berger <stefanb@linux.ibm.com>, philmd@redhat.com,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 tests/data/acpi/q35/{DSDT.tis => DSDT.tis.tpm2} | Bin
 tests/data/acpi/q35/{TPM2.tis => TPM2.tis.tpm2} | Bin
 tests/qtest/bios-tables-test.c                  |   3 ++-
 3 files changed, 2 insertions(+), 1 deletion(-)
 rename tests/data/acpi/q35/{DSDT.tis => DSDT.tis.tpm2} (100%)
 rename tests/data/acpi/q35/{TPM2.tis => TPM2.tis.tpm2} (100%)

diff --git a/tests/data/acpi/q35/DSDT.tis b/tests/data/acpi/q35/DSDT.tis.tpm2
similarity index 100%
rename from tests/data/acpi/q35/DSDT.tis
rename to tests/data/acpi/q35/DSDT.tis.tpm2
diff --git a/tests/data/acpi/q35/TPM2.tis b/tests/data/acpi/q35/TPM2.tis.tpm2
similarity index 100%
rename from tests/data/acpi/q35/TPM2.tis
rename to tests/data/acpi/q35/TPM2.tis.tpm2
diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 93c9d306b5..4ccbe56158 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1101,7 +1101,8 @@ static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
     TPMTestState test;
     test_data data;
     GThread *thread;
-    char *args, *variant = g_strdup_printf(".%s", tpm_if);
+    const char *suffix = tpm_version == TPM_VERSION_2_0 ? "tpm2" : "tpm12";
+    char *args, *variant = g_strdup_printf(".%s.%s", tpm_if, suffix);
 
     tpm_tis_base_addr = base;
 
-- 
2.31.1



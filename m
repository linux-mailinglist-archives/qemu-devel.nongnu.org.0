Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FF53C1971
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 20:55:02 +0200 (CEST)
Received: from localhost ([::1]:45886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ZAr-00041p-O9
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 14:55:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1m1Yv2-0007Pw-6k
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:38:40 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1m1Yup-0003be-RK
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:38:39 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 168IX0jj104931
 for <qemu-devel@nongnu.org>; Thu, 8 Jul 2021 14:38:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=5KCAiRJdPqo/dehmREkHHtzzkEvUbXyxCqaXbrwSVeA=;
 b=TqQuNwBlcNGSuQiIiSqOthKwcKWNL4veXIvwWMHEezMmI7etpoil0nvnHcoMipZgpDVn
 euWvFsr4b0W1uEWKoHkGwYm9bxhoFbruKpsQJ8c2k6fxKo9/hHWU9NGn4sa2nSmWFuNS
 P21qg3yl7n3Fbhg222Yt1tSRR8nAJxCdxF/R6bbvBbq//SwVSHw47iSV6IKFi3HgEEzm
 lNfBTR3cxCxiwJpjQYC3TVrSgxCVpWvxvCKxV7jhCTv3f1k+vkJeJngY1gPwotn0tQB6
 p6QA0s/O1O6FqjAiH7nJOCWA3Gb76Xg3dr1NmBCovcXeVoZzTscRI6Gwqr47YXmeDTlr vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39p58jas1k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 14:38:25 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 168IZ1CX118822
 for <qemu-devel@nongnu.org>; Thu, 8 Jul 2021 14:38:25 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39p58jas18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 14:38:25 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 168IaTKP022987;
 Thu, 8 Jul 2021 18:38:24 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 39jfhe1uaw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 18:38:24 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 168IcLuu14287256
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Jul 2021 18:38:22 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB2AB6E054;
 Thu,  8 Jul 2021 18:38:21 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F2406E05F;
 Thu,  8 Jul 2021 18:38:21 +0000 (GMT)
Received: from sbct-3.pok.ibm.com?044watson.ibm.com (unknown [9.47.158.153])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  8 Jul 2021 18:38:21 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Subject: [PATCH v2 0/9] tests: Add test cases for TPM 1.2 ACPI tables
Date: Thu,  8 Jul 2021 14:38:05 -0400
Message-Id: <20210708183814.925960-1-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dLfbLlYvyUGgKILIf_w-sWN2aaaMPdR6
X-Proofpoint-GUID: Wretg5sQZk9X93QGeWQDTtxIAlhCXXi5
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-08_10:2021-07-08,
 2021-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107080095
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=stefanb@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: philmd@redhat.com, Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series of patches adds test case for TPM 1.2 ACPI tables.

  Stefan

v2:
  - Proper handling of renaming of files holding expected ACPI data

Stefan Berger (9):
  tests: Rename TestState to TPMTestState
  tests: Add tpm_version field to TPMTestState and fill it
  tests: acpi: Prepare for renaming of TPM2 related ACPI files
  tests: Add suffix 'tpm2' or 'tpm12' to ACPI table files
  tests: acpi: tpm2: Add the renamed ACPI files and drop old ones
  tests: tpm: Create TPM 1.2 response in TPM emulator
  tests: acpi: prepare for new TPM 1.2 related tables
  tests: acpi: Add test cases for TPM 1.2 with TCPA table
  tests: acpi: tpm1.2: Add expected TPM 1.2 ACPI blobs

 tests/data/acpi/q35/DSDT.tis.tpm12            | Bin 0 -> 8465 bytes
 .../data/acpi/q35/{DSDT.tis => DSDT.tis.tpm2} | Bin
 tests/data/acpi/q35/TCPA.tis.tpm12            | Bin 0 -> 50 bytes
 .../data/acpi/q35/{TPM2.tis => TPM2.tis.tpm2} | Bin
 tests/qtest/bios-tables-test.c                |  20 ++++++++++-----
 tests/qtest/tpm-crb-test.c                    |   5 ++--
 tests/qtest/tpm-emu.c                         |  24 +++++++++++++-----
 tests/qtest/tpm-emu.h                         |  11 +++++---
 tests/qtest/tpm-tis-device-test.c             |   3 ++-
 tests/qtest/tpm-tis-test.c                    |   3 ++-
 tests/qtest/tpm-tis-util.c                    |   2 +-
 11 files changed, 48 insertions(+), 20 deletions(-)
 create mode 100644 tests/data/acpi/q35/DSDT.tis.tpm12
 rename tests/data/acpi/q35/{DSDT.tis => DSDT.tis.tpm2} (100%)
 create mode 100644 tests/data/acpi/q35/TCPA.tis.tpm12
 rename tests/data/acpi/q35/{TPM2.tis => TPM2.tis.tpm2} (100%)

-- 
2.31.1



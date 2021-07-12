Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 460DA3C5EDE
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:12:12 +0200 (CEST)
Received: from localhost ([::1]:38052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2xbP-0000zG-C5
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1m2xZF-0006Sf-T2
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:09:57 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:29284
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1m2xZD-0003c3-Qq
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:09:57 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CF3SVd078229
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 11:09:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=IK2CjrdoylnRqyudxj1xt2dibQCB2d/3fOZsrnTCYkA=;
 b=eWGJI1QZq6unK3ZFSoDd9LvNa34gCZA62Zt6zAPWnQC1CalrxR9Hlicu5VIXATIELKSH
 bJZrj1yNDMNahM3TO4ylmksC4oqfQsr68QwiScw2IYlNZqTFHmHMDz3FP1nn5BpGYoIX
 SQo56rQ1kMZeGcYRmqhSWvRgzh5akyFYrIhL28KTVKFiKlgKQGVMZu2jHu/w+YLJqrME
 uI1zb3X10r75IuNlHoEuqwgiUFU0+Slvnx9OhRbXDXeLjCgnXVoIYv/rLaCmE9U2OaL1
 BLM+uzCQwkpteY4P3h7RTawZoi6gKZJ4ZLp3iScYbMEa2epywFgjkpJ5Vn7pK4otviyD Vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39qs654p5m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 11:09:54 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16CF3fbA079405
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 11:09:54 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39qs654p55-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 11:09:54 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16CF7fjc018303;
 Mon, 12 Jul 2021 15:09:53 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 39rkgt2u6n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 15:09:53 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16CF9qFi9634272
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 15:09:52 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21DCD7805E;
 Mon, 12 Jul 2021 15:09:52 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C74617806A;
 Mon, 12 Jul 2021 15:09:51 +0000 (GMT)
Received: from sbct-3.pok.ibm.com?044watson.ibm.com (unknown [9.47.158.153])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 12 Jul 2021 15:09:51 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Subject: [PATCH v3 0/9] tests: Add test cases for TPM 1.2 ACPI tables
Date: Mon, 12 Jul 2021 11:09:40 -0400
Message-Id: <20210712150949.165725-1-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tl0lA-F6hS9Vu5Jm2nnX-qOSm4QJplho
X-Proofpoint-GUID: FqtfulRRY56f11Wk75YzURqODTHvj5jz
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-12_09:2021-07-12,
 2021-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107120118
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=stefanb@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Cc: philmd@redhat.com, Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series of patches adds test case for TPM 1.2 ACPI tables.

  Stefan

v3:
  - Define enum TPMVersion for when CONFIG_TPM is not defined
    affected patches 2 and 6

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
 tests/qtest/tpm-emu.h                         |  18 ++++++++++---
 tests/qtest/tpm-tis-device-test.c             |   3 ++-
 tests/qtest/tpm-tis-test.c                    |   3 ++-
 tests/qtest/tpm-tis-util.c                    |   2 +-
 11 files changed, 55 insertions(+), 20 deletions(-)
 create mode 100644 tests/data/acpi/q35/DSDT.tis.tpm12
 rename tests/data/acpi/q35/{DSDT.tis => DSDT.tis.tpm2} (100%)
 create mode 100644 tests/data/acpi/q35/TCPA.tis.tpm12
 rename tests/data/acpi/q35/{TPM2.tis => TPM2.tis.tpm2} (100%)

-- 
2.31.1



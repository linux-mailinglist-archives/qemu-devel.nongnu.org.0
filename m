Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D07C53C651E
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 22:49:50 +0200 (CEST)
Received: from localhost ([::1]:40372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m32s9-0006xT-Sx
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 16:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1m32qD-0004iD-Bq
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 16:47:49 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1m32qB-0007AQ-Gd
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 16:47:49 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CKXExT036499
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 16:47:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=qGM+nW0ds6Uh3zQ5+esFxOc6iC4k4wjaX3KrqKXICgA=;
 b=gazaS50hw195fB2ujRhvvOorxnFpzRFNBAakFSwtTzhCv3DZec2wcM4+Q5XrSGnyx+9l
 8Y6LPrUCI3Sug+IcIxYv1gX7Iw76Z8sfk0gMHN0Pw6AMC6672Vi1Py9qd/LB5SOkZ3rm
 e9NhBSvCes56Cxk9DEudIhq7eQ/jLikNW/tYnm0iqO4nNZhiYFriNJlt4NLcVJtB1aP1
 NTZF3V9nCOOqxkd7dHYepeyrxup07giYViirESq4grPj4ORubeVbwGKwQ/qZnkghnxak
 9APsVQC478q/XD0Xcmn1Ow8dAEjtXFpw9CbzbiThSkCTuBz+KUBFC4v9l6kSxTfPP326 ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qs496433-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 16:47:45 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16CKXEwx036522
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 16:47:45 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qs49642r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 16:47:45 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16CKhUGk031641;
 Mon, 12 Jul 2021 20:47:44 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 39q36aqs8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 20:47:44 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16CKlh2l34472292
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 20:47:43 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8DD68BE061;
 Mon, 12 Jul 2021 20:47:43 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F1A8BE056;
 Mon, 12 Jul 2021 20:47:43 +0000 (GMT)
Received: from sbct-3.pok.ibm.com?044watson.ibm.com (unknown [9.47.158.153])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 12 Jul 2021 20:47:43 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Subject: [PATCH v4 00/10] tests: Add test cases for TPM 1.2 ACPI tables
Date: Mon, 12 Jul 2021 16:47:26 -0400
Message-Id: <20210712204736.365349-1-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pIYbdu8uM7HoYzKzslREPhpIPX2-k574
X-Proofpoint-ORIG-GUID: cm1VYzg5zFIRyW0X1pYwynaCf0OGvd2o
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-12_11:2021-07-12,
 2021-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 mlxlogscore=874 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107120142
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
Cc: philmd@redhat.com, Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series of patches adds test case for TPM 1.2 ACPI tables.

  Stefan

v4:
  - Added patch 10 that checks for availability of a TPM device model
    using QMP and if not available skips the ACPI table test

v3:
  - Define enum TPMVersion for when CONFIG_TPM is not defined
    affected patches 2 and 6

v2:
  - Proper handling of renaming of files holding expected ACPI data


Stefan Berger (10):
  tests: Rename TestState to TPMTestState
  tests: Add tpm_version field to TPMTestState and fill it
  tests: acpi: Prepare for renaming of TPM2 related ACPI files
  tests: Add suffix 'tpm2' or 'tpm12' to ACPI table files
  tests: acpi: tpm2: Add the renamed ACPI files and drop old ones
  tests: tpm: Create TPM 1.2 response in TPM emulator
  tests: acpi: prepare for new TPM 1.2 related tables
  tests: acpi: Add test cases for TPM 1.2 with TCPA table
  tests: acpi: tpm1.2: Add expected TPM 1.2 ACPI blobs
  tests: Use QMP to check whether a TPM device model is available

 tests/data/acpi/q35/DSDT.tis.tpm12            | Bin 0 -> 8465 bytes
 .../data/acpi/q35/{DSDT.tis => DSDT.tis.tpm2} | Bin
 tests/data/acpi/q35/TCPA.tis.tpm12            | Bin 0 -> 50 bytes
 .../data/acpi/q35/{TPM2.tis => TPM2.tis.tpm2} | Bin
 tests/qtest/bios-tables-test.c                |  30 ++++++---
 tests/qtest/tpm-crb-test.c                    |   5 +-
 tests/qtest/tpm-emu.c                         |  61 ++++++++++++++++--
 tests/qtest/tpm-emu.h                         |  20 +++++-
 tests/qtest/tpm-tis-device-test.c             |   3 +-
 tests/qtest/tpm-tis-test.c                    |   3 +-
 tests/qtest/tpm-tis-util.c                    |   2 +-
 11 files changed, 100 insertions(+), 24 deletions(-)
 create mode 100644 tests/data/acpi/q35/DSDT.tis.tpm12
 rename tests/data/acpi/q35/{DSDT.tis => DSDT.tis.tpm2} (100%)
 create mode 100644 tests/data/acpi/q35/TCPA.tis.tpm12
 rename tests/data/acpi/q35/{TPM2.tis => TPM2.tis.tpm2} (100%)

-- 
2.31.1



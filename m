Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E233DE204
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 23:58:02 +0200 (CEST)
Received: from localhost ([::1]:39174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAfwf-00028a-T2
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 17:58:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mAfrj-00021D-7m
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 17:52:55 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mAfrf-0000g1-RJ
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 17:52:55 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 172LWwS0054295
 for <qemu-devel@nongnu.org>; Mon, 2 Aug 2021 17:52:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=wmYKOTrDqRkjT3R37nOX+kRzJYRyBY+L2lzTHQP99Ks=;
 b=XFXOtBVVBb5f4nUa2OS8Kdhxhr5u9mFefHrhlYnUT7ikRO6UVwhwWk2yip4vgOxyrvDQ
 1nei/g28WVoEe41sjx1RmReydv9iDcO+PLnABcDZBU0yB484ZdJfzfO/69OWWj7YUxz/
 nN5kWzZj78ZIZoNvh2FdpXeMmFkWxluZD026VeQbjtmlk9gLSqx8XX7bo0nj5qlNdQIj
 /NqibpnLi82wGzxQgeBKIT9ebmrLslC8w8JKu/hOEWz7xmdoXGdOI4RgNGTY2olYKEVd
 nqTlN6X/fm6krxoqiWZcr66a4H9+/qoyGhz+O9GoNse5ygZNN/BUBLjof5SzIKn1y8OW RQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a6ffjhuem-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 17:52:49 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 172LXcNc056282
 for <qemu-devel@nongnu.org>; Mon, 2 Aug 2021 17:52:49 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a6ffjhued-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Aug 2021 17:52:49 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 172LhKkl006335;
 Mon, 2 Aug 2021 21:52:48 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03dal.us.ibm.com with ESMTP id 3a4x5ch881-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Aug 2021 21:52:48 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 172Lqld941615660
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Aug 2021 21:52:47 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55AB4B2064;
 Mon,  2 Aug 2021 21:52:47 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3DDBEB205F;
 Mon,  2 Aug 2021 21:52:47 +0000 (GMT)
Received: from sbct-3.pok.ibm.com?044watson.ibm.com (unknown [9.47.158.153])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  2 Aug 2021 21:52:47 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Subject: [PATCH-for-6.2 v6 00/10] tests: Add test cases for TPM 1.2 ACPI tables
Date: Mon,  2 Aug 2021 17:52:36 -0400
Message-Id: <20210802215246.1433175-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pEpMzOvBddnh4S31d30T8oFiGpBo1Beb
X-Proofpoint-GUID: c5NQE49xsCxIRaRQg8_m-0qondHBg7yy
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-02_07:2021-08-02,
 2021-08-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 mlxlogscore=964 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108020137
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This series of patches adds test cases for TPM 1.2 ACPI tables.

  Stefan

v6:
  - Rebased on latest master
  - Fixed function called in 8/10

v5:
  - Moved patch 10 to '8' and fixed some style and deref issues.
    Passed build: 
https://travis-ci.com/github/stefanberger/qemu-tpm/builds/232646111

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
  tests: Use QMP to check whether a TPM device model is available
  tests: acpi: Add test cases for TPM 1.2 with TCPA table
  tests: acpi: tpm1.2: Add expected TPM 1.2 ACPI blobs

 tests/data/acpi/q35/DSDT.tis.tpm12            | Bin 0 -> 8894 bytes
 .../data/acpi/q35/{DSDT.tis => DSDT.tis.tpm2} | Bin
 tests/data/acpi/q35/TCPA.tis.tpm12            | Bin 0 -> 50 bytes
 .../data/acpi/q35/{TPM2.tis => TPM2.tis.tpm2} | Bin
 tests/qtest/bios-tables-test.c                |  26 +++++---
 tests/qtest/tpm-crb-test.c                    |   5 +-
 tests/qtest/tpm-emu.c                         |  62 ++++++++++++++++--
 tests/qtest/tpm-emu.h                         |  20 +++++-
 tests/qtest/tpm-tis-device-test.c             |   3 +-
 tests/qtest/tpm-tis-test.c                    |   3 +-
 tests/qtest/tpm-tis-util.c                    |   2 +-
 11 files changed, 97 insertions(+), 24 deletions(-)
 create mode 100644 tests/data/acpi/q35/DSDT.tis.tpm12
 rename tests/data/acpi/q35/{DSDT.tis => DSDT.tis.tpm2} (100%)
 create mode 100644 tests/data/acpi/q35/TCPA.tis.tpm12
 rename tests/data/acpi/q35/{TPM2.tis => TPM2.tis.tpm2} (100%)

-- 
2.31.1



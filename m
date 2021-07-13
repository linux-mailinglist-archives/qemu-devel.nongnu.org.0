Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8C63C77DA
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 22:21:35 +0200 (CEST)
Received: from localhost ([::1]:45034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3OuM-000774-OE
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 16:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1m3Op0-0001ag-5L
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 16:16:03 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1m3Oor-0004w2-FG
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 16:16:01 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16DK3q0K028432
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 16:15:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=6grlrIsh9dq1UQnjZVPol8hRitfpkZlGaaQRETRVUj4=;
 b=AUP1dldcQOdu57P17yYHUS//NZIEMR2HCGZyLV1fpfPjVa6tCKGy/mWk19drMV8TlQTu
 buw67bI6qf1MbumP1D0swAu+JAMzgnuxTolOkb3eCKVBQo2Mhtoh6R2ar0nvUjc9GD2X
 TXO9gBhBeyrQM8iNe7mXf+nKYy5JyH4OX84h52D2olaZoec9NmEU7Q96wj4rjf0pbREk
 6o7Zgezx9kUh5Ug+VVKnXJ9vC2qkl/6do3cMD+LSpl4xteRWsY/UoeJFFQD6jWTB5LGk
 APCLbiaYkxxagPl7nr4Qylz/uuK6bVPNKB5vhvvhE5JbWEGR8NBQruC5IDHHPRK/pOtc Aw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrf8jsvf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 16:15:50 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16DK4nrU037665
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 16:15:50 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrf8jsv4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 16:15:50 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16DKCMoe028207;
 Tue, 13 Jul 2021 20:15:49 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 39qt3bgg56-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 20:15:49 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16DKFmRW37880102
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jul 2021 20:15:48 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4053D78069;
 Tue, 13 Jul 2021 20:15:48 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF4D87805F;
 Tue, 13 Jul 2021 20:15:47 +0000 (GMT)
Received: from sbct-3.pok.ibm.com?044watson.ibm.com (unknown [9.47.158.153])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 13 Jul 2021 20:15:47 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Subject: [PATCH v5 00/10] tests: Add test cases for TPM 1.2 ACPI tables
Date: Tue, 13 Jul 2021 16:15:35 -0400
Message-Id: <20210713201545.903754-1-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QfRbCyyvR6RSVgYVXRqETUWyAB3Ovpna
X-Proofpoint-GUID: 6zxuTaBxhSmaDzanfW3xizRcpnMJaArc
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-13_12:2021-07-13,
 2021-07-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 adultscore=0 mlxlogscore=983 phishscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107130124
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=stefanb@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

v5:
  - Moved patch 10 to '8' and fixed some style and deref issues.
    Passed build: https://travis-ci.com/github/stefanberger/qemu-tpm/builds/232646111

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

 tests/data/acpi/q35/DSDT.tis.tpm12            | Bin 0 -> 8465 bytes
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



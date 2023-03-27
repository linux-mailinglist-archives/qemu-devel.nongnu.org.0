Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 414A96C990A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 02:38:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgarZ-0001rB-0p; Sun, 26 Mar 2023 20:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pgarW-0001qc-Sh
 for qemu-devel@nongnu.org; Sun, 26 Mar 2023 20:37:26 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pgarV-0007IY-8w
 for qemu-devel@nongnu.org; Sun, 26 Mar 2023 20:37:26 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32QLmIhu022218; Mon, 27 Mar 2023 00:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=pKUDtPSvsMLr8/GyJUyjS9CoaJ/Frl0w7POrrDZ4OAA=;
 b=lwAanyA0Vj5DXAIZbpgCV2cY1cwjsZ3Nd8O5VYISE3S0IxQLzkod9qidihu9C7Ptlzkr
 y6giCiIPtdY/hOSYP44u3o/ApKMBqLfrzLpfEgNsb+n3+guUjeU/nYovhZtTCXymWsyw
 pVCP/agHxpg2U/Q2AeSNwzvPmMR1BS9jopEs/GGsZSnXuqrzv7WHRQFi+IJ3FQHa9xOs
 jpffIi56H3IpitFC+RadTTvGJQwiwUc7U/A+bIXPr9dTIDrfPvvyAe8f5jplBPDTmlvd
 VeK/W9a4NVc4dPgvYljI/yNRwjeAB55VrFyu8az3zGvpXsfCaLOO0/+jF3odIPFmqH3Z Kw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pjb4299dd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 00:37:12 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32R0akYf016666;
 Mon, 27 Mar 2023 00:37:11 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pjb4299d8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 00:37:11 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32QNVMbK028584;
 Mon, 27 Mar 2023 00:37:10 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3phrk7ark4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 00:37:10 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32R0b8Dn30540448
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Mar 2023 00:37:09 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DAA3358059;
 Mon, 27 Mar 2023 00:37:08 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2519E58053;
 Mon, 27 Mar 2023 00:37:08 +0000 (GMT)
Received: from sbct-2.pok.ibm.com (unknown [9.47.158.152])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 27 Mar 2023 00:37:08 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, clg@kaod.org, ninad@linux.ibm.com,
 joel@jms.id.au, andrew@aj.id.au, Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH 0/2] qtests: tpm: Add test cases for TPM TIS I2C device
 emulation
Date: Sun, 26 Mar 2023 20:37:01 -0400
Message-Id: <20230327003703.3539303-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CKA_lNtwXWJQTW5Y4N9GFJ8T4RKuzWmH
X-Proofpoint-GUID: EpAlwctjq3oz1a84JSti1Pj9wQIK0fc3
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=864 spamscore=0 clxscore=1015 bulkscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2303270002
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Refactor existing test code and move tpm_util_tis_transmit() into
tpm-tis-utils.c to avoid having to declare tpm_tis_base_addr in test
cases that have nothing to do with TIS and shouldn't need to provide
this variable.

Add test cases exercising much of the TPM TIS I2C device emulation
assuming that the device is connected to the Aspeed I2C controller.
Tests are passing on little and big endian hosts.

This series of patches builds on the following series of patches
providing the TPM TIS I2C device emulation:
https://lists.nongnu.org/archive/html/qemu-devel/2023-03/msg06253.html

Regards,
    Stefan


Stefan Berger (2):
  qtest: Move tpm_util_tis_transmit() into tpm-tis-utils.c and rename it
  qtest: Add a test case for TPM TIS I2C connected to Aspeed I2C
    controller

 tests/qtest/meson.build                 |   3 +
 tests/qtest/qtest_aspeed.c              | 117 +++++
 tests/qtest/qtest_aspeed.h              |  27 +
 tests/qtest/tpm-crb-swtpm-test.c        |   3 -
 tests/qtest/tpm-crb-test.c              |   3 -
 tests/qtest/tpm-tis-device-swtpm-test.c |   5 +-
 tests/qtest/tpm-tis-i2c-test.c          | 628 ++++++++++++++++++++++++
 tests/qtest/tpm-tis-swtpm-test.c        |   5 +-
 tests/qtest/tpm-tis-util.c              |  47 +-
 tests/qtest/tpm-tis-util.h              |   4 +
 tests/qtest/tpm-util.c                  |  45 --
 tests/qtest/tpm-util.h                  |   3 -
 12 files changed, 831 insertions(+), 59 deletions(-)
 create mode 100644 tests/qtest/qtest_aspeed.c
 create mode 100644 tests/qtest/qtest_aspeed.h
 create mode 100644 tests/qtest/tpm-tis-i2c-test.c

-- 
2.39.2



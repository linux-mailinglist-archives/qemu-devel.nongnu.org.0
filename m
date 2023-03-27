Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2DA6CAFE9
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 22:25:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgtOc-0007J8-03; Mon, 27 Mar 2023 16:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pgtOZ-00078s-6e
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 16:24:47 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pgtOX-0005qO-BS
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 16:24:46 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32RJlaBw007024; Mon, 27 Mar 2023 20:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=8hYmdNSRFpLPM/pDTlwO+yViFjmRRVZ0IAy75lPnPRE=;
 b=OaLRqVS0nfGm66uRo7+ATM+vhT0LZt6vEybSw91uqTe9ctMa0jIevxasMTHboQzA2Aw4
 FvWLLurWKDHbzRQRZ1nOfdPvbtFwq4SP9PMY4dOFxFnXfSzoHf8BcEi9DgTTxSz2laCT
 9v0xWN8uXSVhpj6R+JTnR4u9EIoPzBlfLrxXuG4UAH/5ZhKGfkvT0Q5qsZS5/UXOQqtE
 U8iOzoXpdR0/U93xIDgTeHLv8AuLxwF0nlBOK8T/37P8yEUZevi83rAPwJqmvCaLiwH1
 MpOANum/bVAX7G/YDjjrXS32O25OXe+jU2TJF1fCPHFZuvlCHAdigJ94ADdsAEf7YpyH vQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pkhm50rvm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 20:24:31 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32RJxUPL022166;
 Mon, 27 Mar 2023 20:24:31 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pkhm50rve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 20:24:31 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32RHSTVq002608;
 Mon, 27 Mar 2023 20:24:30 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
 by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3phrk7514d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 20:24:30 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32RKOSB423921114
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Mar 2023 20:24:29 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD18758065;
 Mon, 27 Mar 2023 20:24:28 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19A975804B;
 Mon, 27 Mar 2023 20:24:28 +0000 (GMT)
Received: from sbct-2.pok.ibm.com (unknown [9.47.158.152])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 27 Mar 2023 20:24:27 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, clg@kaod.org, ninad@linux.ibm.com,
 joel@jms.id.au, andrew@aj.id.au, Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH 0/3] qtests: tpm: Add test cases for TPM TIS I2C device
 emulation
Date: Mon, 27 Mar 2023 16:24:13 -0400
Message-Id: <20230327202416.3617162-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NJ9gab9gPvhcR1cg3Do-CFDZkMPACUyr
X-Proofpoint-ORIG-GUID: -jPN23QfytzefUWNdEizbL4KhuC8TubP
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303270163
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

This series adds test cases exercising much of the TPM TIS I2C device model
assuming that the device is connected to the Aspeed I2C controller. Tests
are passing on little and big endian hosts.

This series of patches builds on the following series of patches
providing the TPM TIS I2C device emulation (v10):
https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg06449.html

Note the additional comment here with a fix:
https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg06464.html

Regards,
    Stefan

v2:
  - Split off Aspeed I2C controller library functions
  - Tweaking on test cases

Stefan Berger (3):
  qtest: Add functions for accessing devices on Aspeed I2C controller
  qtest: Move tpm_util_tis_transmit() into tpm-tis-utils.c and rename it
  qtest: Add a test case for TPM TIS I2C connected to Aspeed I2C
    controller

 include/hw/i2c/aspeed_i2c.h             |   7 +
 tests/qtest/meson.build                 |   3 +
 tests/qtest/qtest_aspeed.c              | 109 ++++
 tests/qtest/qtest_aspeed.h              |  34 ++
 tests/qtest/tpm-crb-swtpm-test.c        |   3 -
 tests/qtest/tpm-crb-test.c              |   3 -
 tests/qtest/tpm-tis-device-swtpm-test.c |   5 +-
 tests/qtest/tpm-tis-i2c-test.c          | 637 ++++++++++++++++++++++++
 tests/qtest/tpm-tis-swtpm-test.c        |   5 +-
 tests/qtest/tpm-tis-util.c              |  47 +-
 tests/qtest/tpm-tis-util.h              |   4 +
 tests/qtest/tpm-util.c                  |  45 --
 tests/qtest/tpm-util.h                  |   3 -
 13 files changed, 846 insertions(+), 59 deletions(-)
 create mode 100644 tests/qtest/qtest_aspeed.c
 create mode 100644 tests/qtest/qtest_aspeed.h
 create mode 100644 tests/qtest/tpm-tis-i2c-test.c

-- 
2.39.2



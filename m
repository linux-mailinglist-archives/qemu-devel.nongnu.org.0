Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A78636E949E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 14:38:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppTUB-0007nM-0t; Thu, 20 Apr 2023 08:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1ppTTF-0007Wd-Oz
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:33:07 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1ppTTC-0003ht-Ek
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:33:05 -0400
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33KCNIVp028463; Thu, 20 Apr 2023 12:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=ETd2xNTrovP6Lyt0BGTNiBupPgESfEIR3XRmYy9gVzw=;
 b=SEpdX8hr4m7bIfHU8jTpnTPEvagGfiIzvjpF/Uc0GNJ02KC/faceRcd8OOaKnUasuZ2l
 wUxOMcj3pObZ+w9Jq1NFV0r9xs5eUsHMtSnyQCgUOJ+ztmKmtlgyHFHvNh4xQKKXTYM3
 uGLiqlyk6bXwZaUlJbRuxGNKFBh79QCRmKoptkSgzVbub8U+5oPu6fxlt6tgqWjmblKa
 0OzDMUe/RNWBKhQAqhDLFERqy+f7n+V7OoAWjwgiES9uR83IKs5g47iSDoeIxZQAd4JQ
 PCH+opu3TZCDfNSUPq6kpLb4S4NQQ1W5DehJm29uleQoVvvgYe2Ov/6kET1+IChOPWBZ jw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q35bvgc83-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 12:32:56 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33KACxcr003740;
 Thu, 20 Apr 2023 12:32:56 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3pykj8b49j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 12:32:56 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33KCWssc6423156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Apr 2023 12:32:54 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 362BD5805B;
 Thu, 20 Apr 2023 12:32:54 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD4385805C;
 Thu, 20 Apr 2023 12:32:53 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 20 Apr 2023 12:32:53 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Stefan Berger <stefanb@linux.ibm.com>
Subject: [PULL 0/7] Merge tpm 2023/04/20 v1
Date: Thu, 20 Apr 2023 08:32:40 -0400
Message-Id: <20230420123247.226312-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _oBy9i03C6ALxWW9FA4-TtqZLWIKibIZ
X-Proofpoint-ORIG-GUID: _oBy9i03C6ALxWW9FA4-TtqZLWIKibIZ
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_08,2023-04-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 adultscore=0 mlxlogscore=634 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 mlxscore=0 spamscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304200097
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hello!

  This series provides TPM I2C device model support along with test cases.

Regards,
   Stefan

The following changes since commit 2d82c32b2ceaca3dc3da5e36e10976f34bfcb598:

  Open 8.1 development tree (2023-04-20 10:05:25 +0100)

are available in the Git repository at:

  https://github.com/stefanberger/qemu-tpm.git tags/pull-tpm-2023-04-20-1

for you to fetch changes up to 9d81aa3c0fe7480d722517f69e1bcb4aeaaf859c:

  qtest: Add a test case for TPM TIS I2C connected to Aspeed I2C controller (2023-04-20 08:17:15 -0400)


Joel Stanley (1):
  tests/avocado/aspeed: Add TPM TIS I2C test

Ninad Palsule (3):
  docs: Add support for TPM devices over I2C bus
  tpm: Extend common APIs to support TPM TIS I2C
  tpm: Add support for TPM device over I2C bus

Stefan Berger (3):
  qtest: Add functions for accessing devices on Aspeed I2C controller
  qtest: Move tpm_util_tis_transmit() into tpm-tis-utils.c and rename it
  qtest: Add a test case for TPM TIS I2C connected to Aspeed I2C
    controller

 docs/specs/tpm.rst                      |  21 +
 hw/arm/Kconfig                          |   1 +
 hw/tpm/Kconfig                          |   7 +
 hw/tpm/meson.build                      |   1 +
 hw/tpm/tpm_tis.h                        |   3 +
 hw/tpm/tpm_tis_common.c                 |  36 +-
 hw/tpm/tpm_tis_i2c.c                    | 571 ++++++++++++++++++++
 hw/tpm/trace-events                     |   6 +
 include/hw/acpi/tpm.h                   |  41 ++
 include/hw/i2c/aspeed_i2c.h             |   7 +
 include/sysemu/tpm.h                    |   3 +
 tests/avocado/machine_aspeed.py         |  42 +-
 tests/qtest/meson.build                 |   3 +
 tests/qtest/qtest_aspeed.c              | 117 +++++
 tests/qtest/qtest_aspeed.h              |  41 ++
 tests/qtest/tpm-crb-swtpm-test.c        |   3 -
 tests/qtest/tpm-crb-test.c              |   3 -
 tests/qtest/tpm-tis-device-swtpm-test.c |   5 +-
 tests/qtest/tpm-tis-i2c-test.c          | 663 ++++++++++++++++++++++++
 tests/qtest/tpm-tis-swtpm-test.c        |   5 +-
 tests/qtest/tpm-tis-util.c              |  47 +-
 tests/qtest/tpm-tis-util.h              |   4 +
 tests/qtest/tpm-util.c                  |  45 --
 tests/qtest/tpm-util.h                  |   3 -
 24 files changed, 1609 insertions(+), 69 deletions(-)
 create mode 100644 hw/tpm/tpm_tis_i2c.c
 create mode 100644 tests/qtest/qtest_aspeed.c
 create mode 100644 tests/qtest/qtest_aspeed.h
 create mode 100644 tests/qtest/tpm-tis-i2c-test.c

-- 
2.39.1



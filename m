Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 013A66CC916
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 19:21:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phCzp-0006HZ-AI; Tue, 28 Mar 2023 13:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1phCzb-0006GP-8w
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:20:19 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1phCzZ-0006Pg-Jy
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:20:19 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32SGiAf1000647; Tue, 28 Mar 2023 17:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=6dZXVwnzSmELGqYEBWbrR6Kj/ruAXUGgYHW0gwLFbbg=;
 b=LSBElvJ6kEoninKSfw4GJ8qYwBZfZ5HxTGKXE3oYAkjlBHDMySYN4pC0DHTmsMXVpF2z
 5OcJQtaYvqK4DNH57byLhc1BvSM2Tj8UTjqxe8oI+CU7QmPiyo+MqF0HgHct/dTBUMfa
 JB0Hl5pI4TC0KkVVE5Z9BWWIAO11bKUBzrIJh83tkgmKvlPpAURNTHr+rKcXmO4A72nq
 i3l6dD0cY9BugKsd401gbmIyxHChkIJEr7sHl3y16TJC55i8Aw7xkcWyrFY7fiaSgpeV
 /baR2g4hQZYoQtg9TXe62K/d4lAgDCF5ANJfXH4PsmJLz2lXdQMdLNchlhIWY2HwGYAz fg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pm4110xh5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 17:20:03 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32SGvSDU028945;
 Tue, 28 Mar 2023 17:20:03 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pm4110xgs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 17:20:03 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32SGVxGh029133;
 Tue, 28 Mar 2023 17:20:02 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
 by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3phrk76bhd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 17:20:02 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com
 [10.39.53.231])
 by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32SHK0KK38076782
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Mar 2023 17:20:01 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C7AA58052;
 Tue, 28 Mar 2023 17:20:00 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE0415805E;
 Tue, 28 Mar 2023 17:19:59 +0000 (GMT)
Received: from sbct-2.pok.ibm.com (unknown [9.47.158.152])
 by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 28 Mar 2023 17:19:59 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, thuth@redhat.com, clg@kaod.org,
 ninad@linux.ibm.com, joel@jms.id.au, andrew@aj.id.au,
 Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH v4 0/3] qtests: tpm: Add test cases for TPM TIS I2C device
 emulation
Date: Tue, 28 Mar 2023 13:19:55 -0400
Message-Id: <20230328171958.3677734-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PEdBxpI3i_WeF7nHeE8dJbr-4SAAgSyh
X-Proofpoint-GUID: WrMFfhkUGl6LGoPXqa0EqACos9jrhOJv
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303280133
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

v4:
  - 1/3: Use qtest_writel() and qtest_readl()

v3:
  - 1/3: Renaming of inline function and added comment
  - 3/3: Made variables static

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
 tests/qtest/qtest_aspeed.c              | 117 +++++
 tests/qtest/qtest_aspeed.h              |  41 ++
 tests/qtest/tpm-crb-swtpm-test.c        |   3 -
 tests/qtest/tpm-crb-test.c              |   3 -
 tests/qtest/tpm-tis-device-swtpm-test.c |   5 +-
 tests/qtest/tpm-tis-i2c-test.c          | 637 ++++++++++++++++++++++++
 tests/qtest/tpm-tis-swtpm-test.c        |   5 +-
 tests/qtest/tpm-tis-util.c              |  47 +-
 tests/qtest/tpm-tis-util.h              |   4 +
 tests/qtest/tpm-util.c                  |  45 --
 tests/qtest/tpm-util.h                  |   3 -
 13 files changed, 861 insertions(+), 59 deletions(-)
 create mode 100644 tests/qtest/qtest_aspeed.c
 create mode 100644 tests/qtest/qtest_aspeed.h
 create mode 100644 tests/qtest/tpm-tis-i2c-test.c

-- 
2.39.2



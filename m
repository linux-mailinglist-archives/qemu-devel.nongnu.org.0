Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B006D26B7
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 19:32:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piIbP-0006Wg-9w; Fri, 31 Mar 2023 13:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1piIbF-0006TW-MQ
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 13:31:41 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1piIbD-0001yC-T0
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 13:31:41 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32VH6duG011571; Fri, 31 Mar 2023 17:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=B2dbYfD4ktniD0UjO6p4SD/EJodWpswMJxgIHxgr3oI=;
 b=f+0CMkMCum6in+Vc3FN+Svx5qezyhyrbjKkg0YAiXfawOQuu2vY5obmP/gRKzs5cSqKK
 RwloMDKZEuezftZLJOJhH882YbwGdu9drfYpqHBrngP5lkZyRDcvjSeqZWTkGBa1+KTr
 RVa9MrQiS3a8IVePPzfkmkGDL/Bdextk2e90FRj1EDf3EeeFs4b8zI9n9eiG/l3H9YwQ
 1LTZWnLXyNB4Q2vHEUvEZpLUkj76kJe0lwd3pIxD+PBrmY681bpjKY7CWxJ9oCYr3ROz
 K/tJfaYdW0mcMaOOZnWUN0AQqvhW9kZ4TrEplYHr9aJSSE0LeBSx8n+jCaS426S73p5t gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pnvq9uh9e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 17:31:31 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32VHLIJN004632;
 Fri, 31 Mar 2023 17:31:31 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pnvq9uh07-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 17:31:31 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32VH9JMN020158;
 Fri, 31 Mar 2023 17:30:58 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([9.208.130.100])
 by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3phrk7jed6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 17:30:58 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com
 [10.39.53.233])
 by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32VHUu1u9831134
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Mar 2023 17:30:56 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7798658066;
 Fri, 31 Mar 2023 17:30:56 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B22CB58054;
 Fri, 31 Mar 2023 17:30:55 +0000 (GMT)
Received: from sbct-2.pok.ibm.com (unknown [9.47.158.152])
 by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 31 Mar 2023 17:30:55 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, thuth@redhat.com, clg@kaod.org,
 ninad@linux.ibm.com, joel@jms.id.au, andrew@aj.id.au,
 Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH v5 0/3] qtests: tpm: Add test cases for TPM TIS I2C device
 emulation
Date: Fri, 31 Mar 2023 13:30:48 -0400
Message-Id: <20230331173051.3857801-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ONW6QATekTnpln_YMVH7cVPiwq97a9t8
X-Proofpoint-ORIG-GUID: nSV0E5r6Cv38DgjpCnbU0C58RfG65azw
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_07,2023-03-31_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 bulkscore=0 mlxlogscore=914 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303310140
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
providing the TPM TIS I2C device emulation (v12):
https://lists.nongnu.org/archive/html/qemu-devel/2023-03/msg07258.html


Regards,
    Stefan

v5:
  - 3/3: Added more test cases; read from REG_STS + 1 and + 3; try to
         select an invalid locality

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
 tests/qtest/tpm-tis-i2c-test.c          | 663 ++++++++++++++++++++++++
 tests/qtest/tpm-tis-swtpm-test.c        |   5 +-
 tests/qtest/tpm-tis-util.c              |  47 +-
 tests/qtest/tpm-tis-util.h              |   4 +
 tests/qtest/tpm-util.c                  |  45 --
 tests/qtest/tpm-util.h                  |   3 -
 13 files changed, 887 insertions(+), 59 deletions(-)
 create mode 100644 tests/qtest/qtest_aspeed.c
 create mode 100644 tests/qtest/qtest_aspeed.h
 create mode 100644 tests/qtest/tpm-tis-i2c-test.c

-- 
2.39.2



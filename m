Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4866C9222
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Mar 2023 04:39:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgGHS-0001FH-Tt; Sat, 25 Mar 2023 22:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1pgGHO-0001Ep-HD
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 22:38:46 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1pgGHM-0002HD-NX
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 22:38:46 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32PNQRpw012578; Sun, 26 Mar 2023 02:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=tcF0RaAHnm1ROZN6eT8CGFqsiqW6O1oxdmhy7UtZBM8=;
 b=o3lTfepIfwKRoYqygkRHIPLroSFvvSI0qFfglnkKSQomudTMKTjHV7elTr4KsECKASIw
 E6ZuvIiyiu82xLdElvZwEU/GU/na7U9Rk3FOczE0dJ5Q1XSY704+N+N+68oTD9RTA0ls
 cqpusn/bZiAK/kS1jh0KZg3jwtulC39IJDBPcQJxVieWiSqySWixo7jXSq+VIhiqx+1p
 DhbeYJhBg7l+LyU29h4Dt8Rr3cyqLmBfmnE57RMzEwuOQrM7PBJCnPI5T0GHQceRJdoY
 3nrwaALRVFMxqZu8P5Ymzz8eA0RU4+8e535Rm23eSFKH5T7qMpCD8lQaAAe7DgD46jJ7 Sg== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pjamkjbgg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Mar 2023 02:38:30 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32Q1ihQq032017;
 Sun, 26 Mar 2023 02:38:29 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
 by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3phrk6vkk4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Mar 2023 02:38:29 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32Q2cSD75898970
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 26 Mar 2023 02:38:28 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9316B58059;
 Sun, 26 Mar 2023 02:38:28 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D28058058;
 Sun, 26 Mar 2023 02:38:28 +0000 (GMT)
Received: from gfwa601.aus.stglabs.ibm.com (unknown [9.3.62.226])
 by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Sun, 26 Mar 2023 02:38:28 +0000 (GMT)
Received: by gfwa601.aus.stglabs.ibm.com (Postfix, from userid 155676)
 id CFC0E2E5674; Sat, 25 Mar 2023 21:38:27 -0500 (CDT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Ninad Palsule <ninad@linux.ibm.com>, joel@jms.id.au, andrew@aj.id.au,
 stefanb@linux.ibm.com, clg@kaod.org
Subject: [PATCH v6 0/3] Add support for TPM devices over I2C bus
Date: Sat, 25 Mar 2023 21:38:23 -0500
Message-Id: <20230326023826.3864919-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zEA6KepP5x4BRvJHEussV7AdqQDvx5Hw
X-Proofpoint-GUID: zEA6KepP5x4BRvJHEussV7AdqQDvx5Hw
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=930 impostorscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2303260016
Received-SPF: pass client-ip=148.163.158.5; envelope-from=ninad@us.ibm.com;
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


Hello,

I have incorporated review comments from Stefan. Please review.

This drop adds support for the TPM devices attached to the I2C bus. It
only supports the TPM2 protocol. You need to run it with the external
TPM emulator like swtpm. I have tested it with swtpm.

I have refered to the work done by zhdaniel@meta.com but at the core
level out implementation is different.
https://github.com/theopolis/qemu/commit/2e2e57cde9e419c36af8071bb85392ad1ed70966

Based-on: $MESSAGE_ID

Ninad Palsule (3):
  docs: Add support for TPM devices over I2C bus
  tpm: Extend common APIs to support TPM TIS I2C
  tpm: Add support for TPM device over I2C bus

 docs/specs/tpm.rst      |  32 +++
 hw/arm/Kconfig          |   1 +
 hw/tpm/Kconfig          |   7 +
 hw/tpm/meson.build      |   1 +
 hw/tpm/tpm_tis.h        |   3 +
 hw/tpm/tpm_tis_common.c |  28 +++
 hw/tpm/tpm_tis_i2c.c    | 533 ++++++++++++++++++++++++++++++++++++++++
 hw/tpm/trace-events     |   6 +
 include/hw/acpi/tpm.h   |  28 +++
 include/sysemu/tpm.h    |   3 +
 10 files changed, 642 insertions(+)
 create mode 100644 hw/tpm/tpm_tis_i2c.c

-- 
2.37.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECCA6C9893
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 00:46:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgZ6a-0005m2-EP; Sun, 26 Mar 2023 18:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1pgZ6X-0005lI-T5
 for qemu-devel@nongnu.org; Sun, 26 Mar 2023 18:44:49 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1pgZ6V-0001jt-9L
 for qemu-devel@nongnu.org; Sun, 26 Mar 2023 18:44:49 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32QM2ZCr022245; Sun, 26 Mar 2023 22:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=SFdYLenWOqzXS1Rijk6XieyFojdiYdfnmYrJUdvkH68=;
 b=JUpRNuRBda+iLfB2A5CKAJV349n47B0u4TxFEILD9N5vUiuqTx5NG7UoxWDYb/fOAYAd
 tInhmrWReMEui1xH8mW75YZK6EBqPI3kydzjZBbyscIvXSZA2AM0pTXTii1TqfqnpKct
 45nr24viyBXHFwUkyAGhdFW8dT1NXBbF16/s92TmhhPhRLbkbUKcwnFNU8R0NifXqE9v
 PnpqpHdwJgksOTUDhUAkfWAAJOd0mCLBwPvsLn0dqMXUtBb3kDGy209Rwd981YTmgXiI
 pCZmiMtomsEPYUfydaO2cvksO3XX5Y8UWXU/jx9KkwK9jPV8fxZYvqETcRp0FAWtfTo9 cA== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pjb427u5y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Mar 2023 22:44:31 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32QK0961019640;
 Sun, 26 Mar 2023 22:44:30 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3phrk7a9mn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Mar 2023 22:44:30 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32QMiTE538797856
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 26 Mar 2023 22:44:29 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1199358058;
 Sun, 26 Mar 2023 22:44:29 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EEDFD5805B;
 Sun, 26 Mar 2023 22:44:28 +0000 (GMT)
Received: from gfwa601.aus.stglabs.ibm.com (unknown [9.3.62.226])
 by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Sun, 26 Mar 2023 22:44:28 +0000 (GMT)
Received: by gfwa601.aus.stglabs.ibm.com (Postfix, from userid 155676)
 id 568DC2E5674; Sun, 26 Mar 2023 17:44:28 -0500 (CDT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Ninad Palsule <ninad@linux.ibm.com>, joel@jms.id.au, andrew@aj.id.au,
 stefanb@linux.ibm.com, clg@kaod.org
Subject: [PATCH v7 0/3] Add support for TPM devices over I2C bus
Date: Sun, 26 Mar 2023 17:44:23 -0500
Message-Id: <20230326224426.3918167-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WPQ9Ehnmh0WIxBWt70aA6IuzLQMMRztL
X-Proofpoint-GUID: WPQ9Ehnmh0WIxBWt70aA6IuzLQMMRztL
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=929 spamscore=0 clxscore=1015 bulkscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2303260178
Received-SPF: pass client-ip=148.163.158.5; envelope-from=ninad@us.ibm.com;
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
 hw/tpm/tpm_tis_common.c |  36 ++-
 hw/tpm/tpm_tis_i2c.c    | 540 ++++++++++++++++++++++++++++++++++++++++
 hw/tpm/trace-events     |   6 +
 include/hw/acpi/tpm.h   |  31 +++
 include/sysemu/tpm.h    |   3 +
 10 files changed, 652 insertions(+), 8 deletions(-)
 create mode 100644 hw/tpm/tpm_tis_i2c.c

-- 
2.37.2



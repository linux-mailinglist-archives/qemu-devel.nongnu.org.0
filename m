Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF406E2C4F
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Apr 2023 00:10:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnRao-0001Nd-UK; Fri, 14 Apr 2023 18:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1pnRae-0001NF-MZ
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 18:08:21 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1pnRaW-0004Z3-3c
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 18:08:17 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33ELr5U1023636; Fri, 14 Apr 2023 22:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=bcsPJn/4y/ZZrZbcpo++t0/qb0U95sB63I2mqNjK9rY=;
 b=XFxIWpYnD3jcNV1vGYFyCKHs42NLVm8DBuADMg6IDciOn8/bNLLm6zDoHfj56x32uYL+
 xAvQpN71opxFRcJMMReb7G3oq5bQPL07QPF2LC1Kn6JSY/LOyK4NnfKjVScju1Z8LUGy
 OfwBgVIvJ/1QoYl/mb++dnRt1dA/qhOLSNXUuQEOnYdI84Sev2agss5bynkdY+Arggo9
 YdfCnuFBfKMjU1TvfwD8PQfuHu2CAQRyp/UqsHUwFo02JnmA//Gjs+eLrxxOqpLB/7qn
 CSjn4u81C7aCLkxaO/3H0Y2nkvZ4y9w/zveQHLXzpvHvj07PXHNRZCbQemGE1KhwkMVL Pg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pyf4tggb2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Apr 2023 22:08:02 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33EKF5LZ029751;
 Fri, 14 Apr 2023 22:08:02 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3pu0fr3db5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Apr 2023 22:08:01 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com
 [10.241.53.101])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33EM7wP316646752
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Apr 2023 22:07:58 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 372C558051;
 Fri, 14 Apr 2023 22:07:58 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2897A58060;
 Fri, 14 Apr 2023 22:07:58 +0000 (GMT)
Received: from gfwa601.aus.stglabs.ibm.com (unknown [9.3.62.226])
 by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Fri, 14 Apr 2023 22:07:58 +0000 (GMT)
Received: by gfwa601.aus.stglabs.ibm.com (Postfix, from userid 155676)
 id DCDE22E5675; Fri, 14 Apr 2023 17:07:56 -0500 (CDT)
From: Ninad Palsule <ninadpalsule@us.ibm.com>
To: qemu-devel@nongnu.org
Cc: Ninad Palsule <ninadpalsule@us.ibm.com>, joel@jms.id.au, andrew@aj.id.au, 
 stefanb@linux.ibm.com, clg@kaod.org, ninad@linux.ibm.com
Subject: [PATCH v13 0/3] Add support for TPM devices over I2C bus
Date: Fri, 14 Apr 2023 17:07:51 -0500
Message-Id: <20230414220754.1191476-1-ninadpalsule@us.ibm.com>
X-Mailer: git-send-email 2.37.2
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 14sQEhSLgadOlb2Av3qxiRO4-ClsFUWw
X-Proofpoint-ORIG-GUID: 14sQEhSLgadOlb2Av3qxiRO4-ClsFUWw
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-14_14,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 suspectscore=0 mlxlogscore=743 clxscore=1015
 lowpriorityscore=0 spamscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304140194
Received-SPF: pass client-ip=148.163.158.5; envelope-from=ninad@us.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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


Hello,
Incorporated review comments from Corey Minyard. Please review.

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

 docs/specs/tpm.rst      |  21 ++
 hw/arm/Kconfig          |   1 +
 hw/tpm/Kconfig          |   7 +
 hw/tpm/meson.build      |   1 +
 hw/tpm/tpm_tis.h        |   3 +
 hw/tpm/tpm_tis_common.c |  36 ++-
 hw/tpm/tpm_tis_i2c.c    | 571 ++++++++++++++++++++++++++++++++++++++++
 hw/tpm/trace-events     |   6 +
 include/hw/acpi/tpm.h   |  41 +++
 include/sysemu/tpm.h    |   3 +
 10 files changed, 682 insertions(+), 8 deletions(-)
 create mode 100644 hw/tpm/tpm_tis_i2c.c

-- 
2.37.2



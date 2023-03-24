Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 096866C7CEB
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 11:57:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfXj6-0003Km-4S; Thu, 23 Mar 2023 23:04:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1pfXj2-0003Ke-VS
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 23:04:20 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1pfXib-00027y-K3
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 23:04:20 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32O1S9k0005383; Fri, 24 Mar 2023 03:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=9d+ikbnTEUiDsRxVJhrzwGhFUxe/6DqsKOIMYe2umLg=;
 b=KRxBeD7Z5vuK6jj2vg/tV9xZ5kZ5CRgPqA33/UJmYG2AUmhjWI1KZ599INA0PIdts8Sh
 ik/7ztfG+GQL7iFAXqY9sBjjbPK3QORREo9qjsp7d8QG0MhG1kn7lc2xLWYsyGPg65So
 FS/F4fmmWK2cegnXS5TAm/Ei/mW59s9JtL5Y9VkX6dqJfvbZujJJ3kszeubWYdML/m1+
 cHiHzmuxOZ99vO+t55ULZ4u/jdQDGS9zMpp4b+oNY1Hi7YM5UCk43WuEQwZ4gG/dMuT7
 PNaKF5w5Ap88KZOC320FVY9pwjHheA860QWvtulkerx5MADngZIKlzmFthZWVmSW0ASq 5g== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pgxs25y2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Mar 2023 03:03:20 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32O1JabV002618;
 Fri, 24 Mar 2023 03:03:19 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
 by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3pgydjhcrd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Mar 2023 03:03:19 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com
 [10.39.53.230])
 by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32O33Hso18350698
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Mar 2023 03:03:17 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BE9F58BC2;
 Fri, 24 Mar 2023 03:03:03 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1EAAA58BCC;
 Fri, 24 Mar 2023 03:03:03 +0000 (GMT)
Received: from gfwa601.aus.stglabs.ibm.com (unknown [9.3.62.226])
 by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Fri, 24 Mar 2023 03:03:03 +0000 (GMT)
Received: by gfwa601.aus.stglabs.ibm.com (Postfix, from userid 155676)
 id 855DE2E5674; Thu, 23 Mar 2023 22:02:53 -0500 (CDT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Ninad Palsule <ninad@linux.ibm.com>, joel@jms.id.au, andrew@aj.id.au,
 stefanb@linux.ibm.com, clg@kaod.org
Subject: [PATCH v3 0/3] Add support for TPM devices over I2C bus
Date: Thu, 23 Mar 2023 22:02:48 -0500
Message-Id: <20230324030251.2589040-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7EmoIRDNm1-KedS7yuPBYzipELGeVVve
X-Proofpoint-ORIG-GUID: 7EmoIRDNm1-KedS7yuPBYzipELGeVVve
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-23_15,2023-03-23_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 mlxscore=0 mlxlogscore=860
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303240025
Received-SPF: pass client-ip=148.163.156.1; envelope-from=ninad@us.ibm.com;
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

Hello,

I have incorporated review comments from Stefan and Cedric. Please
review.

This drop adds support for the TPM devices attached to the I2C bus. It
only supports the TPM2 protocol. You need to run it with the external
TPM emulator like swtpm. I have tested it with swtpm.

I have refered to the work done by zhdaniel@meta.com but at the core
level out implementation is different.
https://github.com/theopolis/qemu/commit/2e2e57cde9e419c36af8071bb85392ad1ed70966

Based-on: $MESSAGE_ID

Ninad Palsule (3):
  docs: Add support for TPM devices over I2C bus
  TPM TIS: Add support for TPM devices over I2C bus
  New I2C: Add support for TPM devices over I2C bus

 docs/specs/tpm.rst      |  20 +-
 hw/arm/Kconfig          |   1 +
 hw/tpm/Kconfig          |   7 +
 hw/tpm/meson.build      |   1 +
 hw/tpm/tpm_tis.h        |   3 +
 hw/tpm/tpm_tis_common.c |  32 +++
 hw/tpm/tpm_tis_i2c.c    | 513 ++++++++++++++++++++++++++++++++++++++++
 include/hw/acpi/tpm.h   |  28 +++
 include/sysemu/tpm.h    |   3 +
 9 files changed, 607 insertions(+), 1 deletion(-)
 create mode 100644 hw/tpm/tpm_tis_i2c.c

-- 
2.37.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0417B6D2506
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 18:14:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piHNn-0001Fo-NR; Fri, 31 Mar 2023 12:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1piHNl-0001FZ-6a
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 12:13:41 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1piHNj-0001ly-6c
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 12:13:40 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32VG6WDH015509; Fri, 31 Mar 2023 16:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=oalYcJ4Elne8uNbznwGYRq2QFiocCzdt5Oj07cbkols=;
 b=KWVGlYu13Ik6b6D/mRPkgsX2W20LMMwUkal76o/j8gwORt7joSwXdn6G1Du21/NaKzGv
 F1TOmn5Emu0r0sGDglJEILZxnhl/B+Idiaj5XxrZ/k7d//s4rtgOUbvI2OwK6RmMsC1m
 LBP8tvFHjZdZr331qSU1Z5b6RVcPtgreBajq4tORTfDhpo/H3WubijDcCoSw+6lQqjAm
 HypYBEhf+lY3YFqcG4vrqQk+9p05nGGZicV3XENvngyNo9QHq2qjdWRM5EAGlSW/Uy2Z
 F0/5qXZcWgf1Re8SIE3jXp/l//ngLC6z6cOVs59wSAVT9Fx4ICyAkPH0cxJby1kYoBXZ Vw== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pnvq9st44-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 16:13:26 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32VF2C2i029126;
 Fri, 31 Mar 2023 16:13:25 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
 by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3phrk7tn7n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 16:13:25 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32VGDMRk36635204
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Mar 2023 16:13:22 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 562A45805C;
 Fri, 31 Mar 2023 16:13:22 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 400355805F;
 Fri, 31 Mar 2023 16:13:22 +0000 (GMT)
Received: from gfwa601.aus.stglabs.ibm.com (unknown [9.3.62.226])
 by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Fri, 31 Mar 2023 16:13:22 +0000 (GMT)
Received: by gfwa601.aus.stglabs.ibm.com (Postfix, from userid 155676)
 id AC7812E5674; Fri, 31 Mar 2023 11:13:21 -0500 (CDT)
From: Ninad Palsule <ninadpalsule@us.ibm.com>
To: qemu-devel@nongnu.org
Cc: Ninad Palsule <ninadpalsule@us.ibm.com>, joel@jms.id.au, andrew@aj.id.au, 
 stefanb@linux.ibm.com, clg@kaod.org, ninad@linux.ibm.com
Subject: [PATCH v12 0/3] Add support for TPM devices over I2C bus
Date: Fri, 31 Mar 2023 11:13:16 -0500
Message-Id: <20230331161319.2250334-1-ninadpalsule@us.ibm.com>
X-Mailer: git-send-email 2.37.2
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HyR_dndC-OsETE3Vi67E15YYhuwwv8XN
X-Proofpoint-ORIG-GUID: HyR_dndC-OsETE3Vi67E15YYhuwwv8XN
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_07,2023-03-31_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 bulkscore=0 mlxlogscore=786 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303310127
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
Incorporated review comments from Stefan. Please review.

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
 hw/tpm/tpm_tis_i2c.c    | 562 ++++++++++++++++++++++++++++++++++++++++
 hw/tpm/trace-events     |   6 +
 include/hw/acpi/tpm.h   |  41 +++
 include/sysemu/tpm.h    |   3 +
 10 files changed, 673 insertions(+), 8 deletions(-)
 create mode 100644 hw/tpm/tpm_tis_i2c.c

-- 
2.37.2



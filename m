Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B2F6C8AF0
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 05:40:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfvfi-0007wc-Ny; Sat, 25 Mar 2023 00:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1pfvfg-0007wN-M7
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 00:38:28 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1pfvfe-0002r8-U0
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 00:38:28 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32P35894029207; Sat, 25 Mar 2023 04:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=UTcLZuzyIQOxUC7tZ/EgEMm7CsiNmZhSKRCBxh3aLLs=;
 b=LJiaD4yZ19fsFWQtgCKRLee6W5MNTJiZsFi2n2IdVrLczj+zT+9vdAkowIe/VB0t9BL6
 f1aZ8XJcD8eDm7+KytW4Y5PIOGN7kkm+0InAG005FTkGiyIZeFzsf9tEUEotRiBWXOHM
 md2gmRrp5CZ6saeuFAvjxFAdfUA1hAd2EkrACWvxzBGMbADR8YnOeabyM1lqgQYk1c5s
 1/YtPHJjzBAnyhAFjOBe4DCO45zkP8Kpsn3//XadA0lkgEH2qV4uhtSZmg1QY8Oe78+y
 WQW5pNfLU+2BDeQ1XC1i1d75Rv6+XFtLjJ1zX1uqDYT+tKI4PoGOpKxBfqJAeIDOFPCB 7g== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3phrr7h661-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 25 Mar 2023 04:37:55 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32P2sJd9032017;
 Sat, 25 Mar 2023 04:37:54 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
 by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3phrk6rbhr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 25 Mar 2023 04:37:54 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32P4br5530409470
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 25 Mar 2023 04:37:53 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4535058059;
 Sat, 25 Mar 2023 04:37:53 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F80A58053;
 Sat, 25 Mar 2023 04:37:53 +0000 (GMT)
Received: from gfwa601.aus.stglabs.ibm.com (unknown [9.3.62.226])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Sat, 25 Mar 2023 04:37:53 +0000 (GMT)
Received: by gfwa601.aus.stglabs.ibm.com (Postfix, from userid 155676)
 id 965EC2E5674; Fri, 24 Mar 2023 23:37:52 -0500 (CDT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Ninad Palsule <ninad@linux.ibm.com>, joel@jms.id.au, andrew@aj.id.au,
 stefanb@linux.ibm.com, clg@kaod.org
Subject: [PATCH v4 0/3] Add support for TPM devices over I2C bus
Date: Fri, 24 Mar 2023 23:37:48 -0500
Message-Id: <20230325043751.3559591-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3ExgiHJCfarZBObR_pZA8nDgSgtQhgVp
X-Proofpoint-ORIG-GUID: 3ExgiHJCfarZBObR_pZA8nDgSgtQhgVp
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 mlxlogscore=933 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303250036
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
  tpm: Extend common APIs to support TPM TIS I2C
  tpm: Add support for TPM device over I2C bus

 docs/specs/tpm.rst      |  32 +++
 hw/arm/Kconfig          |   1 +
 hw/tpm/Kconfig          |   7 +
 hw/tpm/meson.build      |   1 +
 hw/tpm/tpm_tis.h        |   3 +
 hw/tpm/tpm_tis_common.c |  28 +++
 hw/tpm/tpm_tis_i2c.c    | 492 ++++++++++++++++++++++++++++++++++++++++
 hw/tpm/trace-events     |   6 +
 include/hw/acpi/tpm.h   |  28 +++
 include/sysemu/tpm.h    |   3 +
 10 files changed, 601 insertions(+)
 create mode 100644 hw/tpm/tpm_tis_i2c.c

-- 
2.37.2



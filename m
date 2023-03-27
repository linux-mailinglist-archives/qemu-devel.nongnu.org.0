Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F046CAA52
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 18:17:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgpWT-0006XW-Ka; Mon, 27 Mar 2023 12:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1pgpWQ-0006XH-Bb
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 12:16:38 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1pgpWO-0007Yq-Bq
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 12:16:38 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32RFE2wm020297; Mon, 27 Mar 2023 16:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=ZV4ag9TOkslcXPhYw12c9Trsw67I4adPhgXBj0UwhNg=;
 b=CoTKRF237D3giTKeO2aHgbPzIAY+Nqr+1lkD+VeVEYfs8ixULyV7Y1XcLVbVMol0t3XY
 N5sB2HJ2S9idjyl83o6gd7WPHugJrh4HE7HcrntzR4QGZbUwwu4dF2jChG6R8uF/8+tm
 xG6GKrMfeb2mrCkstqGWN5i97FdekOnDlUw60fpsaCqMAjwb49XgDy9A2P95JLr/ovtN
 Cedk9Pv9rjJ8sxVRVbK0wMKoRJhpARsX5xHOiOw6oujp5lYoLP1qUZyZ/K7EieAtbxFI
 mv/WA2ixVTTd5PISJwDXA5yQPXVN8EXx6gySdH3RGf1Qr3y92a1Afazfz4u2B7Z/9rQU jQ== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pkdkqskgu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 16:16:26 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32RDbc5L002590;
 Mon, 27 Mar 2023 16:16:26 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
 by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3phrk742ux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 16:16:26 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com
 [10.241.53.104])
 by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32RGGOca51446242
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Mar 2023 16:16:24 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7154C5805D;
 Mon, 27 Mar 2023 16:16:24 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62DE358052;
 Mon, 27 Mar 2023 16:16:24 +0000 (GMT)
Received: from gfwa601.aus.stglabs.ibm.com (unknown [9.3.62.226])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Mon, 27 Mar 2023 16:16:24 +0000 (GMT)
Received: by gfwa601.aus.stglabs.ibm.com (Postfix, from userid 155676)
 id 9A5DE2E5674; Mon, 27 Mar 2023 11:16:23 -0500 (CDT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Ninad Palsule <ninad@linux.ibm.com>, joel@jms.id.au, andrew@aj.id.au,
 stefanb@linux.ibm.com, clg@kaod.org
Subject: [PATCH v8 0/3] Add support for TPM devices over I2C bus
Date: Mon, 27 Mar 2023 11:16:19 -0500
Message-Id: <20230327161622.3979396-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: j0aVg4meYAqMl3TnAOZ4nCt7zrmtFZqb
X-Proofpoint-ORIG-GUID: j0aVg4meYAqMl3TnAOZ4nCt7zrmtFZqb
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0
 mlxlogscore=929 mlxscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303270129
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

I have incorporated review comments from Joel & Stefan. Please review.

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
 hw/tpm/tpm_tis_i2c.c    | 525 ++++++++++++++++++++++++++++++++++++++++
 hw/tpm/trace-events     |   6 +
 include/hw/acpi/tpm.h   |  37 +++
 include/sysemu/tpm.h    |   3 +
 10 files changed, 632 insertions(+), 8 deletions(-)
 create mode 100644 hw/tpm/tpm_tis_i2c.c

-- 
2.37.2



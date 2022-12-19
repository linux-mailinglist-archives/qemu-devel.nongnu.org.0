Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D35F6650C84
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 14:15:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7FyK-0004fS-5W; Mon, 19 Dec 2022 08:14:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p7Fy5-0004b9-Pz
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 08:14:11 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p7Fy3-0001C9-Sz
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 08:14:09 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJDCBtt026098
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 13:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=AmV0Oq3Z/3oKt6petpy/EgdGAWLKzXmzvcWmpzTCNUA=;
 b=eHTfqcqvw4bP/avJ2Eerfvab/2hkAOd5n9P/T7FyeCZWJhdRk+P/FWZtDp/tZ6+BcwQv
 gQyhN3dH6seAAoDYSxN6yRpgQ695Ho1hLGXh6vg/OnfnhHGm/7yo/p7Cd+8CZKWEOy8V
 g5Q3KBl/NUjCPGiQmY3ALYoZ0nOgU7OIg62ObvA/izmP6ZrpYvA/39i333VuDgKZ5i6L
 pQLJuuR8f3qr3alxowJsB2lDa+dvN0Jmb7NU+9kNianGYTKKMHIthBQOrYjd6y+64kWm
 09LBmG3n2BpWmIRXVpPBmKlpgXw3AworeakH8BeYT0hRFYMSWiFcySOtNmN2V0AhAHFc kg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mjrmk818w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 13:14:05 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BJDCXhN027127
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 13:14:05 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mjrmk818g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 13:14:05 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BJCN1Gq022061;
 Mon, 19 Dec 2022 13:14:04 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
 by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3mh6yxdgpw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 13:14:04 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com
 [10.241.53.104])
 by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BJDE3G85702312
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Dec 2022 13:14:03 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 620435805D;
 Mon, 19 Dec 2022 13:14:03 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A38EE58065;
 Mon, 19 Dec 2022 13:14:02 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.33.74])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 19 Dec 2022 13:14:02 +0000 (GMT)
From: James Bottomley <jejb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Stefan Berger <stefanb@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v3 0/2] tpm: add mssim backend
Date: Mon, 19 Dec 2022 08:13:42 -0500
Message-Id: <20221219131344.18909-1-jejb@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Mgs8b1l0Wh3hYiv-iXZbPPeKy5gEzfIt
X-Proofpoint-ORIG-GUID: pGy1OptRBZ8kAlAeRtlaNeovkvWZtaXV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-19_01,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=677 mlxscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212190115
Received-SPF: pass client-ip=148.163.156.1; envelope-from=jejb@linux.ibm.com;
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

From: James Bottomley <James.Bottomley@HansenPartnership.com>

The requested feedback was to convert the tpmdev handler to being json
based, which requires rethreading all the backends.  The good news is
this reduced quite a bit of code (especially as I converted it to
error_fatal handling as well, which removes the return status
threading).  The bad news is I can't test any of the conversions.
swtpm still isn't building on opensuse and, apparently, passthrough
doesn't like my native TPM because it doesn't allow cancellation.

v3 pulls out more unneeded code in the visitor conversion, makes
migration work on external state preservation of the simulator and
adds documentation

James

---

James Bottomley (2):
  tpm: convert tpmdev options processing to new visitor format
  tpm: add backend for mssim

 MAINTAINERS                    |   6 +
 backends/tpm/Kconfig           |   5 +
 backends/tpm/meson.build       |   1 +
 backends/tpm/tpm_emulator.c    |  35 ++---
 backends/tpm/tpm_mssim.c       | 264 +++++++++++++++++++++++++++++++++
 backends/tpm/tpm_mssim.h       |  43 ++++++
 backends/tpm/tpm_passthrough.c |  37 ++---
 docs/specs/tpm.rst             |  35 +++++
 include/sysemu/tpm.h           |   4 +-
 include/sysemu/tpm_backend.h   |   2 +-
 monitor/hmp-cmds.c             |  11 +-
 qapi/tpm.json                  |  37 ++---
 softmmu/tpm.c                  |  90 +++++------
 softmmu/vl.c                   |  19 +--
 14 files changed, 449 insertions(+), 140 deletions(-)
 create mode 100644 backends/tpm/tpm_mssim.c
 create mode 100644 backends/tpm/tpm_mssim.h

-- 
2.35.3



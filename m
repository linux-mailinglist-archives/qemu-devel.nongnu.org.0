Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CFB65EBB4
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 14:01:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDPrM-0001BT-T8; Thu, 05 Jan 2023 08:00:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pDPrI-00019L-Rp
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 08:00:36 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pDPrG-0005qm-Rv
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 08:00:36 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 305Cp90N032492
 for <qemu-devel@nongnu.org>; Thu, 5 Jan 2023 13:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=2OC9iRE4gQHlZo5EFpW5eg8z1yIcaq7gufNqmhmGfI4=;
 b=ho1CAytrMPhu5hJRMGqCZvqbJdvmHt/QkheNgdkrt9mR8O7zUyeHGnwPhN0cgxMC2Q0+
 z68drUXvxuURPE+0r3nxw6JSDQI95M8OCjljA26F4Qp+4i42yiEM6aByKKqUHsfQ+ZVx
 xJYGwXTegICHghw7ZE+aqolSa97HW10TApB7JQZj+ZuNvZz/20ly6xeYFk5a7KnV1fYR
 FsaMQgZObqG+vYuOcUVEu3ML3z4vgTqz4u23mGE1M9Gm8kAW1T44en2GS8+b2BD5sm0y
 rL2MNKIgO7EkVdnx6OtU0Mvlm2V0EFrluObBs4aFtKXoCcanAKn5N0IKlrLyMQ3R0nGu ng== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mwxwwg5rq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 13:00:32 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 305CsFht003792
 for <qemu-devel@nongnu.org>; Thu, 5 Jan 2023 13:00:31 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mwxwwg5r5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 13:00:31 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 305A0tF2010216;
 Thu, 5 Jan 2023 13:00:30 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
 by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3mtcq7nuaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 13:00:30 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com
 [10.39.53.233])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 305D0Tof000716
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Jan 2023 13:00:29 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F2A658056;
 Thu,  5 Jan 2023 13:00:29 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C4B95803F;
 Thu,  5 Jan 2023 13:00:28 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.211.64.53])
 by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  5 Jan 2023 13:00:28 +0000 (GMT)
From: James Bottomley <jejb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH v5 0/2] tpm: add mssim backend
Date: Thu,  5 Jan 2023 08:00:18 -0500
Message-Id: <20230105130020.17755-1-jejb@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AdzF5L_u-Er90T1uZye3nSbrKsddpZNa
X-Proofpoint-ORIG-GUID: jZz-rtSKym_A4ulQG1g8gLwsrONnAYRo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_04,2023-01-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=446 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301050099
Received-SPF: pass client-ip=148.163.158.5; envelope-from=jejb@linux.ibm.com;
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

v4 puts back the wrapper options (but doesn't add any for mssim since
it post dates the necessity)

v5 rebases to the latest master branch and adjusts for removed use_FOO ptrs

James

---

James Bottomley (2):
  tpm: convert tpmdev options processing to new visitor format
  tpm: add backend for mssim

 MAINTAINERS                    |   6 +
 backends/tpm/Kconfig           |   5 +
 backends/tpm/meson.build       |   1 +
 backends/tpm/tpm_emulator.c    |  24 ++-
 backends/tpm/tpm_mssim.c       | 263 +++++++++++++++++++++++++++++++++
 backends/tpm/tpm_mssim.h       |  43 ++++++
 backends/tpm/tpm_passthrough.c |  25 +---
 docs/specs/tpm.rst             |  35 +++++
 include/sysemu/tpm.h           |   4 +-
 include/sysemu/tpm_backend.h   |   2 +-
 monitor/hmp-cmds.c             |   7 +
 qapi/tpm.json                  |  45 +++++-
 softmmu/tpm.c                  |  90 +++++------
 softmmu/vl.c                   |  19 +--
 14 files changed, 459 insertions(+), 110 deletions(-)
 create mode 100644 backends/tpm/tpm_mssim.c
 create mode 100644 backends/tpm/tpm_mssim.h

-- 
2.35.3



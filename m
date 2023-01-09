Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52923662AF2
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 17:16:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEuoQ-0005OG-R3; Mon, 09 Jan 2023 11:15:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pEuoO-0005Nn-AO
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 11:15:48 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pEuoL-0003he-SW
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 11:15:47 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 309FSZ4B032309
 for <qemu-devel@nongnu.org>; Mon, 9 Jan 2023 16:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=e86b36vwW73CrPNFGCddsfFoxQ2QQw+HyO2DSPlWdxU=;
 b=HKR4JVt+2ebh6KDVWABT4v2ZVcdSiNXKgFLOWQ4DUl+7ZQRVKTxXxD0QHbv5nWck5IVO
 KRZ4cjGv6ViEUMFgLS1ghSvZyBFmTm13dILo6ZzjJ5/Kcn+tJiMfjZ34MIw0xzorqW+G
 Hken//3x9HAtLr/co/f+iMY2Qdo9MfYe/Qsg8Fsb7fWX96Jsnv8NuQXts8ct+RcnVi2X
 A5nj9S+o0/1bHhQtbVVVuTRSquF5Ue9dt7hrMAo7dSd3vDVwKVg+jeYq9P1ZS9Hdfdrl
 iflmq399RLrXgZ62P4EOg9K4c92D3/di22gCh26/Lhbp8uULyfvmJ8NUYarKzS2sNy4R 1A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjdmjhaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 16:15:41 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 309EVTsq022750
 for <qemu-devel@nongnu.org>; Mon, 9 Jan 2023 16:15:41 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjdmjhad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 16:15:41 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 309E59IG007029;
 Mon, 9 Jan 2023 16:15:40 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3my0c7fpfb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 16:15:40 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com
 [10.241.53.100])
 by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 309GFdC123200144
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Jan 2023 16:15:39 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D01958061;
 Mon,  9 Jan 2023 16:15:39 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6523558059;
 Mon,  9 Jan 2023 16:15:38 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.48.220])
 by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  9 Jan 2023 16:15:38 +0000 (GMT)
From: James Bottomley <jejb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH v6 0/2] tpm: add mssim backend
Date: Mon,  9 Jan 2023 11:15:30 -0500
Message-Id: <20230109161532.6892-1-jejb@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _7b2hsQ-xJK7KNoRNCZLsdI7QgbKHKkt
X-Proofpoint-ORIG-GUID: oy2GahgfSGs7_H_D94_Dk320MX_IrGRh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_09,2023-01-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=420 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301090116
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

v5 updates help to exit zero; does some checkpatch tidying

James

---

James Bottomley (2):
  tpm: convert tpmdev options processing to new visitor format
  tpm: add backend for mssim

 MAINTAINERS                    |   6 +
 backends/tpm/Kconfig           |   5 +
 backends/tpm/meson.build       |   1 +
 backends/tpm/tpm_emulator.c    |  24 +--
 backends/tpm/tpm_mssim.c       | 290 +++++++++++++++++++++++++++++++++
 backends/tpm/tpm_mssim.h       |  44 +++++
 backends/tpm/tpm_passthrough.c |  22 +--
 docs/specs/tpm.rst             |  35 ++++
 include/sysemu/tpm.h           |   4 +-
 include/sysemu/tpm_backend.h   |   2 +-
 monitor/hmp-cmds.c             |   9 +
 qapi/tpm.json                  |  45 ++++-
 softmmu/tpm.c                  |  90 ++++------
 softmmu/vl.c                   |  19 +--
 14 files changed, 488 insertions(+), 108 deletions(-)
 create mode 100644 backends/tpm/tpm_mssim.c
 create mode 100644 backends/tpm/tpm_mssim.h

-- 
2.35.3



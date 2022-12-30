Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7364A6599AF
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 16:25:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBHFM-0000tg-5r; Fri, 30 Dec 2022 10:24:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pBHFJ-0000rT-Bv
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 10:24:33 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pBHFH-00069f-Dp
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 10:24:33 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BUEV1Kj010056
 for <qemu-devel@nongnu.org>; Fri, 30 Dec 2022 15:24:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=ZXymceSCAbKaeOY5M48jNv0cMxGMKPgWDwQkt02PeGg=;
 b=THoVBFxhX+MQGVY4520U4or5i8XLeGAN4i2re32mesQW4z2Lf7Um5ykmnTmxVopSQ7+E
 Rle2sAkE/6m+QrCjuotKivgvXa6Gie7vxi3DbWKuqHIQ6Af0I//aHEskzZ1F0Xy/JR53
 XpgcAwGwD9svawE4K4C5SkQe6GdZvH4TntVsZKnCHEIakm2c5dS3FuU6ZuFnCKcFm0m7
 lDkWWjKYLwPwl6G0LCzh2dJ40eU54zHlOwCKM61uOzhVLqTnzbBpdyT3p+R/m6nshffh
 uOmDVC2DJYKLET1ZKnPpkUFEMWjp/WgEFL291z8hBmlhv4CsUfbaca2thsnE8hs90S82 KA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mt1tq11dw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 30 Dec 2022 15:24:29 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BUFN0sb040721
 for <qemu-devel@nongnu.org>; Fri, 30 Dec 2022 15:24:28 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mt1tq11dj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Dec 2022 15:24:28 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BUDp4xm013713;
 Fri, 30 Dec 2022 15:24:28 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3mns28jpky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Dec 2022 15:24:28 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com
 [10.241.53.101])
 by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BUFORUB4719354
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Dec 2022 15:24:27 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E997A5805C;
 Fri, 30 Dec 2022 15:24:26 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40BC65805A;
 Fri, 30 Dec 2022 15:24:26 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.211.136.248])
 by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 30 Dec 2022 15:24:26 +0000 (GMT)
From: James Bottomley <jejb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH v4 0/2] tpm: add mssim backend
Date: Fri, 30 Dec 2022 10:24:13 -0500
Message-Id: <20221230152415.27375-1-jejb@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ii4JJ1N7xJPJCxQy_zyNX9xa1gENwAhL
X-Proofpoint-GUID: zDSy_NUA61yo7LtzKKLZxtOFq6vr9chf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-30_09,2022-12-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 phishscore=0 mlxlogscore=561 impostorscore=0 spamscore=0
 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212300132
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

James

---

James Bottomley (2):
  tpm: convert tpmdev options processing to new visitor format
  tpm: add backend for mssim

 MAINTAINERS                    |   6 +
 backends/tpm/Kconfig           |   5 +
 backends/tpm/meson.build       |   1 +
 backends/tpm/tpm_emulator.c    |  24 ++-
 backends/tpm/tpm_mssim.c       | 265 +++++++++++++++++++++++++++++++++
 backends/tpm/tpm_mssim.h       |  43 ++++++
 backends/tpm/tpm_passthrough.c |  27 +---
 docs/specs/tpm.rst             |  35 +++++
 include/sysemu/tpm.h           |   4 +-
 include/sysemu/tpm_backend.h   |   2 +-
 monitor/hmp-cmds.c             |   7 +
 qapi/tpm.json                  |  45 +++++-
 softmmu/tpm.c                  |  90 +++++------
 softmmu/vl.c                   |  19 +--
 14 files changed, 461 insertions(+), 112 deletions(-)
 create mode 100644 backends/tpm/tpm_mssim.c
 create mode 100644 backends/tpm/tpm_mssim.h

-- 
2.35.3



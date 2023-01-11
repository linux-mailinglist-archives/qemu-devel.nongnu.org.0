Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E31EA665137
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 02:48:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFQD3-0001VR-3f; Tue, 10 Jan 2023 20:47:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pFQD1-0001V3-8m
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 20:47:19 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pFQCy-00037P-RW
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 20:47:18 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30B1XuMP033203; Wed, 11 Jan 2023 01:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=7B2M9vAF0yK+EXD+V5NirLRszmQsQl4Bk1Z0ex2rewk=;
 b=P3pHYVWhXZjrYRhJFf+v9p8BSd0s+gX6sZBJvDQoZT5EQUP1WwXL0wGhsPEUqg5J+7GB
 +JMuyIi1KYokZQZJ7Y0Cs70n57Iz/vwrtES+WA8WvrWHB/mykx+urfuaNRGMdlAlxU1k
 CmWdti4m5XVINUWtDO7NFf/2kKr1x69JYW/sDNanVFWWT75l1orTisGlrxTru1d1KiHD
 M6A8kuLnIYEhdcE2h5h6svmJy22DH86PGqJJomk8em+7AiOnTNL0H9AoUbUweWa0booQ
 rXDsNoYV+NqfDltfAlb7vChLF5pE47pmm1t36CXVxsQM7WyPLh65JQDPBMj/OpDiCx+f RQ== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n1kjb87kh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 01:47:13 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30B1crCc001496;
 Wed, 11 Jan 2023 01:47:12 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3n1kmrr08j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 01:47:11 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30B1l7AX46465484
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Jan 2023 01:47:07 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E6D620043;
 Wed, 11 Jan 2023 01:47:07 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3FC0420040;
 Wed, 11 Jan 2023 01:47:07 +0000 (GMT)
Received: from heavy.lan (unknown [9.179.23.250])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 11 Jan 2023 01:47:07 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org, 
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 0/3] tcg: add perfmap and jitdump
Date: Wed, 11 Jan 2023 02:47:02 +0100
Message-Id: <20230111014705.2275040-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GfJMkj7JcRs1UFN2jDrrg7VzxOr0V1f4
X-Proofpoint-ORIG-GUID: GfJMkj7JcRs1UFN2jDrrg7VzxOr0V1f4
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_10,2023-01-10_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 phishscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 mlxscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301110005
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
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

v2:
https://lists.gnu.org/archive/html/qemu-devel/2022-11/msg02385.html
https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg01026.html

v2 -> v3:
* Enable only for CONFIG_LINUX (Alex).
* Use qemu_get_thread_id() instead of gettid() (Alex).
* Fix CI (Alex).
  https://gitlab.com/iii-i/qemu/-/pipelines/743684604
* Drop unnecessary #includes (Alex).
* Drop the constification change (Alex/Richard).
* Split debuginfo support into a separate patch.
* Fix partial perfmap/jitdump files when terminating due to a signal.
* Fix debuginfo strings being accessed outside of debuginfo lock.
* Fix address resolution with TARGET_TB_PCREL.
* Add DEBUGINFOD_URLS= to the doc; without it perf inject is
  unacceptably slow.
* Note: it's better to test this with the latest perf
  (6.2.rc3.g7dd4b804e080 worked fine for me). There has been at least
  one breakage in the JIT area recently (fixed by 6d518ac7be62).

v1:
https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg01824.html
https://lists.nongnu.org/archive/html/qemu-devel/2022-11/msg01073.html

v1 -> v2:
* Use QEMU_LOCK_GUARD (Alex).
* Handle TARGET_TB_PCREL (Alex).
* Support ELF -kernels, add a note about this (Alex). Tested with
  qemu-system-x86_64 and Linux kernel - it's not fast, but it works.
* Minor const correctness and style improvements.

Ilya Leoshkevich (3):
  linux-user: Clean up when exiting due to a signal
  accel/tcg: Add debuginfo support
  tcg: add perfmap and jitdump

 accel/tcg/debuginfo.c     |  96 ++++++++++
 accel/tcg/debuginfo.h     |  77 ++++++++
 accel/tcg/meson.build     |   2 +
 accel/tcg/perf.c          | 366 ++++++++++++++++++++++++++++++++++++++
 accel/tcg/perf.h          |  49 +++++
 accel/tcg/translate-all.c |   8 +
 docs/devel/tcg.rst        |  23 +++
 hw/core/loader.c          |   5 +
 linux-user/elfload.c      |   3 +
 linux-user/exit.c         |   2 +
 linux-user/main.c         |  15 ++
 linux-user/meson.build    |   1 +
 linux-user/signal.c       |   8 +-
 meson.build               |   8 +
 qemu-options.hx           |  20 +++
 softmmu/vl.c              |  11 ++
 tcg/tcg.c                 |   2 +
 17 files changed, 693 insertions(+), 3 deletions(-)
 create mode 100644 accel/tcg/debuginfo.c
 create mode 100644 accel/tcg/debuginfo.h
 create mode 100644 accel/tcg/perf.c
 create mode 100644 accel/tcg/perf.h

-- 
2.39.0



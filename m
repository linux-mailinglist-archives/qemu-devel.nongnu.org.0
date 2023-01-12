Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 671836679A1
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 16:41:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFzOH-0006wo-VX; Thu, 12 Jan 2023 10:21:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pFzNX-0006Yq-18
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 10:20:37 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pFzNS-0002Kq-FP
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 10:20:28 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30CFJPbP009906; Thu, 12 Jan 2023 15:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=1nrvd37HjWybq5UWTppwMhz7eVfw8ZVTkA/nIlGP9qM=;
 b=bws9jzLSP5GPBfkCVvoN+H987AR05Ph/0pB+N3IYrGtgWHmPPy/DMxfjeGraoeK8oJiF
 RFTqODMSWPIJ4oeQfmJSYt+L684l99bMy/RVOpiecAR3NiEKypXtqSdC77UkT6LQBfwD
 0hSlPGISU8AdkuRB+bZjSewAc1tccTBncQ1l+P7CrY07528byL3/ICcwhzRgCJ1eONsM
 IrpaThkiB0Yve76Ieul2Xg3JJtei0Ni28EGs3jIP4Gv9x9kSlX2m/N+RevD1VwEvUVmh
 5nMfpY6EUFDb06ZqfUSmnw6YsWxHpqLtvjfXV8N1pWied9z+zWtyB4q3guL3tZRKr+1N xA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n2mrer0yt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 15:20:22 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30CBv60P018505;
 Thu, 12 Jan 2023 15:20:20 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3n1km69xfp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 15:20:20 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30CFKGeH46072076
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Jan 2023 15:20:16 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EE882004D;
 Thu, 12 Jan 2023 15:20:16 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1F4E2004B;
 Thu, 12 Jan 2023 15:20:15 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.69.153])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 12 Jan 2023 15:20:15 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org, 
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 0/3] tcg: add perfmap and jitdump
Date: Thu, 12 Jan 2023 16:20:10 +0100
Message-Id: <20230112152013.125680-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5s2PS0hNHUZ7PqYfydDcirwpcsjr1bR5
X-Proofpoint-ORIG-GUID: 5s2PS0hNHUZ7PqYfydDcirwpcsjr1bR5
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_08,2023-01-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301120109
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
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

v3:
https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02072.html

v3 -> v4:
* s/unsigned long long/uint64_t/g (Richard).
* Fix address resolution with TARGET_TB_PCREL again.
  * Open question: do we need something like get_pc_from_opc()?
    See FIXME in patch 3.

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
 accel/tcg/perf.c          | 375 ++++++++++++++++++++++++++++++++++++++
 accel/tcg/perf.h          |  49 +++++
 accel/tcg/translate-all.c |   7 +
 docs/devel/tcg.rst        |  23 +++
 hw/core/loader.c          |   5 +
 linux-user/elfload.c      |   3 +
 linux-user/exit.c         |   2 +
 linux-user/main.c         |  15 ++
 linux-user/meson.build    |   1 +
 linux-user/signal.c       |   8 +-
 meson.build               |   8 +
 qemu-options.hx           |  20 ++
 softmmu/vl.c              |  11 ++
 tcg/tcg.c                 |   2 +
 17 files changed, 701 insertions(+), 3 deletions(-)
 create mode 100644 accel/tcg/debuginfo.c
 create mode 100644 accel/tcg/debuginfo.h
 create mode 100644 accel/tcg/perf.c
 create mode 100644 accel/tcg/perf.h

-- 
2.39.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33354597285
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 17:07:49 +0200 (CEST)
Received: from localhost ([::1]:34640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOKe4-0003w4-C8
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 11:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oOKbt-0007q7-DP; Wed, 17 Aug 2022 11:05:33 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:29994
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oOKbq-00023Q-S8; Wed, 17 Aug 2022 11:05:33 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27HEpgdL014356;
 Wed, 17 Aug 2022 15:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=1unT6p25G5UN0aShMgbQkXt8sKXsD9/zcF2bu7aquFQ=;
 b=kJnsEA49Z+1OzFQnMHH1lQQLacVmRhFTeMp06pzMln9QFoE+uLkZroKssaPFmblvGJ+2
 SsB0aJAjQOv8GoPHV0xxw8tqJI8ZkzZOHKzspze6ZnbBp/rf4CX0DP6VrHUK6ydojBMR
 vjlfV490SXRZK5FboHkw10XYRUs6/eCj6JqE5FlCaSgImRAlvgmHzCh1nEc6viIaET4r
 ryvfmw0GX4WtMQbz2b38X/jM6+9gLVUQvlmuvp5pIxidRqScIYRaPu174fjBaohHlt5l
 xwecONMhw9nGXu+rDOvBoXHxtVKMchBn565lLBmm2Dl46S/QQn5k7W/o7doFFOs0JTaS lA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3j12f58m5h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Aug 2022 15:05:15 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27HErMiQ028922;
 Wed, 17 Aug 2022 15:05:14 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3j12f58m0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Aug 2022 15:05:14 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27HEabNn028204;
 Wed, 17 Aug 2022 15:05:11 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 3hx3k93g5u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Aug 2022 15:05:11 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27HF58Pq32768446
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Aug 2022 15:05:08 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01A9011C052;
 Wed, 17 Aug 2022 15:05:08 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5913B11C04A;
 Wed, 17 Aug 2022 15:05:07 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.21.185])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 17 Aug 2022 15:05:07 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v5 0/4] linux-user: Fix siginfo_t contents when jumping to
 non-readable pages
Date: Wed, 17 Aug 2022 17:05:02 +0200
Message-Id: <20220817150506.592862-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.37.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lNKMIHbQ-w7iETmxfZ6dAWd3OCXIoLhL
X-Proofpoint-GUID: XO2Q-Aa_l3XMHPDvJzJlX1WJXTyCBqEA
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-17_09,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=916
 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208170058
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I noticed that when we get a SEGV due to jumping to non-readable
memory, sometimes si_addr and program counter in siginfo_t are slightly
off. I tracked this down to the assumption that translators stop before
the end of a page, while in reality they may stop right after it.

Patch 1 fixes an invalidation issue, which may prevent SEGV from
happening altogether.
Patches 2-3 fix the main issue on x86_64 and s390x. Many other
architectures have fixed-size instructions and are not affected.
Patch 4 adds tests.

Note: this series depends on [1].

Best regards,
Ilya

v1: https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg00822.html
v1 -> v2: Fix individual translators instead of translator_loop
          (Peter).

v2: https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01079.html
v2 -> v3: Peek at the next instruction on s390x (Richard).
          Undo more on i386 (Richard).
          Check PAGE_EXEC, not PAGE_READ (Peter, Richard).

v3: https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01306.html
v3 -> v4: Improve the commit message in patch 1 to better reflect what
          exactly is being fixed there.
          Factor out the is_same_page() patch (Richard).
          Do not touch the common code in the i386 fix (Richard).

v4: https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01747.html
v4 -> v5: Drop patch 2.
          Use a different fix for the invalidation issue based on
          discussion with Richard [2].

[1] https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg02472.html
[2] https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg02556.html

Ilya Leoshkevich (4):
  linux-user: Clear tb_jmp_cache on mprotect()
  target/s390x: Make translator stop before the end of a page
  target/i386: Make translator stop before the end of a page
  tests/tcg: Test siginfo_t contents when jumping to non-readable pages

 linux-user/mmap.c                |  14 +++
 target/i386/tcg/translate.c      |  25 +++++-
 target/s390x/tcg/translate.c     |  15 +++-
 tests/tcg/multiarch/noexec.h     | 114 ++++++++++++++++++++++++
 tests/tcg/s390x/Makefile.target  |   1 +
 tests/tcg/s390x/noexec.c         | 145 +++++++++++++++++++++++++++++++
 tests/tcg/x86_64/Makefile.target |   3 +-
 tests/tcg/x86_64/noexec.c        | 116 +++++++++++++++++++++++++
 8 files changed, 427 insertions(+), 6 deletions(-)
 create mode 100644 tests/tcg/multiarch/noexec.h
 create mode 100644 tests/tcg/s390x/noexec.c
 create mode 100644 tests/tcg/x86_64/noexec.c

-- 
2.37.1



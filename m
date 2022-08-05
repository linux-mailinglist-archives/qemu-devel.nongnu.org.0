Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D58958AFF8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 20:39:10 +0200 (CEST)
Received: from localhost ([::1]:46132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK2E1-0006oK-KN
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 14:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oK29h-0002qc-R5; Fri, 05 Aug 2022 14:34:42 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:13284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oK29f-0000ny-Uz; Fri, 05 Aug 2022 14:34:41 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 275HnHGY006882;
 Fri, 5 Aug 2022 18:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=Ei9DeNlPRnxSNWoFvtseGTYiAnOhq/E8lq25M5pQ+i8=;
 b=eTKJPfxxKjs0KD7hkaTxpydQ7q9Vj17I+z9FICeuodvs9cZfkLnVL2BwMq5KnK26rR4O
 Zdi8YhmjVMitY1wLZnTacTmRMVwhFH2P3qoaQodEWbWBSSPyO8N6CoHcCY1xmQttz8qP
 YIRjHsiu6KP/DuwIFm1C774IIEm4rzBzZJ79E0F+8AIg4UzP3sI37AkOCUKV4MuHT3U+
 doqYec+zVllaYWjHnn48mFP7OnX83V4JToACFdf/9QCjrxbwZo3utKlxOb8HPr3BIJkb
 GmkK5RPEkR5o7pUPsjk+jx2uS9wCu3HhDSxsY7aYZIYnhxtL4XENDtWVJfyIby9K42S4 vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hs7xp97qu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 18:34:30 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 275IOWxP012726;
 Fri, 5 Aug 2022 18:34:29 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hs7xp97pc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 18:34:29 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 275I6e9p031452;
 Fri, 5 Aug 2022 18:34:27 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3hmv98yqp1-200
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 18:34:26 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 275G9Gsx14614792
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Aug 2022 16:09:16 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CCD16A405F;
 Fri,  5 Aug 2022 16:09:16 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37E62A4054;
 Fri,  5 Aug 2022 16:09:16 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.89.138])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  5 Aug 2022 16:09:16 +0000 (GMT)
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
Subject: [PATCH v2 0/4] linux-user: Fix siginfo_t contents when jumping to
 non-readable pages
Date: Fri,  5 Aug 2022 18:09:10 +0200
Message-Id: <20220805160914.1106091-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mjqmlf_rckor_9O5AcmuDvtSHhQTGJqN
X-Proofpoint-GUID: Aut8ZhkYZlKJU1RMCgMFrXbz7OAAHO5G
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-05_09,2022-08-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 adultscore=0 spamscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2208050086
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
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

Patch 1 fixes a minor invalidation issue, which may prevent SEGV from
happening altogether.
Patches 2-3 fix the main issue on x86_64 and s390x. Many other
architectures have fixed-size instructions and are not affected.
Patch 4 adds tests.

Best regards,
Ilya

v1: https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg00822.html
v1 -> v2: Fix individual translators instead of translator_loop
          (Peter).

Ilya Leoshkevich (4):
  accel/tcg: Invalidate translations when clearing PAGE_READ
  target/s390x: Make translator stop before the end of a page
  target/i386: Make translator stop before the end of a page
  tests/tcg: Test siginfo_t contents when jumping to non-readable pages

 accel/tcg/translate-all.c        |  17 ++--
 include/exec/translator.h        |  10 +++
 target/i386/tcg/translate.c      |  42 ++++++++-
 target/s390x/tcg/translate.c     |  35 ++++----
 tests/tcg/multiarch/noexec.h     | 114 ++++++++++++++++++++++++
 tests/tcg/s390x/Makefile.target  |   1 +
 tests/tcg/s390x/noexec.c         | 145 +++++++++++++++++++++++++++++++
 tests/tcg/x86_64/Makefile.target |   3 +-
 tests/tcg/x86_64/noexec.c        | 116 +++++++++++++++++++++++++
 9 files changed, 461 insertions(+), 22 deletions(-)
 create mode 100644 tests/tcg/multiarch/noexec.h
 create mode 100644 tests/tcg/s390x/noexec.c
 create mode 100644 tests/tcg/x86_64/noexec.c

-- 
2.35.3



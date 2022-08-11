Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9733558FA55
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 11:59:17 +0200 (CEST)
Received: from localhost ([::1]:51804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM4yC-0006Ui-N7
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 05:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oM4uz-0002BE-Up; Thu, 11 Aug 2022 05:55:58 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:35754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oM4uw-0002fn-G5; Thu, 11 Aug 2022 05:55:57 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27B8n43f004436;
 Thu, 11 Aug 2022 09:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=X/Bf5iYMz2ZQ/1y1KRbMI54HNwYtQfBZucxgPxj7Z/8=;
 b=hcTkpY5kAyP0v2LxRghWEl9w1vtF69kDpIXa37sNJ1j6MkpuCb/wHNiig1kyVFKKpanJ
 jBJ3MY56zOtUMPBS9MVHQ6LnL2LBV2B+bpxZ+MFkPhQTjBjNFIz9i+DDULkLladrjUI+
 eM3/ZNQ9pD9s9Yg1AXtskWnhmM9Q431AnjXSw5hZ39RZOImgtI6D1U8+w4vd51H1WYCj
 3HdnrSAUhliEVTqINzQs3U25T/+K0NyXY/zsgSGxDvFXatgxLTPANNSWpSk6k08KL+R4
 d9Ca9I/yd86GedS5osulOT8e4GR7cOiHdvJNbm57cyJc2sl4p0JmDW6mmXW5hK0h+2ip kA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hvxkf1tk8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 09:55:42 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27B9tFm7013860;
 Thu, 11 Aug 2022 09:55:41 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hvxkf1tjg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 09:55:41 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27B9oNbw031911;
 Thu, 11 Aug 2022 09:55:39 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 3huww0sm4m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 09:55:38 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27B9tZuM30933438
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 09:55:35 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8FEF3A404D;
 Thu, 11 Aug 2022 09:55:35 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAF18A4040;
 Thu, 11 Aug 2022 09:55:34 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.43.253])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 11 Aug 2022 09:55:34 +0000 (GMT)
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
Subject: [PATCH v4 0/5] linux-user: Fix siginfo_t contents when jumping to
 non-readable pages
Date: Thu, 11 Aug 2022 11:55:29 +0200
Message-Id: <20220811095534.241224-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.37.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HN_4MpuBkwDxLQy-QVrSPKyMiVvbHStu
X-Proofpoint-ORIG-GUID: cIeJing09WA6I_FmMHt3netgDeg-fnCa
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-10_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 bulkscore=0 mlxlogscore=996 spamscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208110027
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
Patch 2 introduces a helper function.
Patches 3-4 fix the main issue on x86_64 and s390x. Many other
architectures have fixed-size instructions and are not affected.
Patch 5 adds tests.

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

Ilya Leoshkevich (5):
  accel/tcg: Invalidate translations when clearing PAGE_EXEC
  accel/tcg: Introduce is_same_page()
  target/s390x: Make translator stop before the end of a page
  target/i386: Make translator stop before the end of a page
  tests/tcg: Test siginfo_t contents when jumping to non-readable pages

 accel/tcg/translate-all.c        |  17 ++--
 include/exec/translator.h        |  10 +++
 target/i386/tcg/translate.c      |  25 +++++-
 target/s390x/tcg/translate.c     |  15 +++-
 tests/tcg/multiarch/noexec.h     | 114 ++++++++++++++++++++++++
 tests/tcg/s390x/Makefile.target  |   1 +
 tests/tcg/s390x/noexec.c         | 145 +++++++++++++++++++++++++++++++
 tests/tcg/x86_64/Makefile.target |   3 +-
 tests/tcg/x86_64/noexec.c        | 116 +++++++++++++++++++++++++
 9 files changed, 435 insertions(+), 11 deletions(-)
 create mode 100644 tests/tcg/multiarch/noexec.h
 create mode 100644 tests/tcg/s390x/noexec.c
 create mode 100644 tests/tcg/x86_64/noexec.c

-- 
2.37.1



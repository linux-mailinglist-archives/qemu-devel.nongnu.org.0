Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF97C6BD6F3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 18:23:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcrJA-0002X2-Mk; Thu, 16 Mar 2023 13:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcrIx-0002Tw-91; Thu, 16 Mar 2023 13:22:19 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcrIu-0001yQ-DP; Thu, 16 Mar 2023 13:22:19 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32GFacdt021837; Thu, 16 Mar 2023 17:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=qWHOov6Qh+ZmaV2tvyujuCtlp6jBIFX/TFXJfGr6bxc=;
 b=X2S4BYScd2YilYQm1Lcvyp00gvejqFBNCGhe9RXhOHdSnR136oChoAA36yL6mWx2ZvSc
 ZatNR77yW05sjqNkbBFMOl0bzCris1Wkmwn3AskpmA7IlwcAD1z/KONEt7DnSQQQzD9L
 yiHPwrwSilYA8IdChEDgp9iu5b3U5fGmzUs6d3R87F8X0JawVhsplIPLWW+IRsfHxPBB
 loRZD09dZ8sASIov0oB4kCbD/sVqXAbGoIX9GX/DYBQaRzZOQCI4LwrYXG3RKjnqQ2zw
 wOYkUSzSeFWbiuyMbCzSNEuZNcS9F0hIwXLzD1TkvCBlpBDnHNMasaNlMmbXrXfRWAGG fA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pc58xvqs0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 17:22:12 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32GFeIxR005529;
 Thu, 16 Mar 2023 17:22:12 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pc58xvqr5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 17:22:11 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32GF5lKa015009;
 Thu, 16 Mar 2023 17:22:09 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3pbsf3h1ym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 17:22:09 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32GHM7w321955160
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Mar 2023 17:22:07 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E0C020043;
 Thu, 16 Mar 2023 17:22:07 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1A4120040;
 Thu, 16 Mar 2023 17:22:06 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.2.157])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 16 Mar 2023 17:22:06 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 0/2] target/s390x: Fix R[NOX]SBG with T=1
Date: Thu, 16 Mar 2023 18:22:03 +0100
Message-Id: <20230316172205.281369-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rD3JVutOkaL6Bc34ISvVJcMmcu7pbZrl
X-Proofpoint-GUID: Z3I0RFjVySAK6Ba3hNeIH2ANyoCgCMDC
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_10,2023-03-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 mlxlogscore=788 adultscore=0 spamscore=0 lowpriorityscore=0
 mlxscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160133
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

v2: https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg04699.html
v2 -> v3: Assert that o->out != NULL, mention the commit that exposed
          the problem (Philippe).

v1: https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg04493.html
v1 -> v2: Work around a clang issue (Thomas).
          Add cc=0 test, use more human-friendly constants.

Hi,

This series fixes ROTATE THEN <do something with> SELECTED BITS when
test-results control is on. The problem is the incorrect translation,
which confuses the register allocator.

Patch 1 is the fix, patch 2 adds a test.

Best regards,
Ilya

Ilya Leoshkevich (2):
  target/s390x: Fix R[NOX]SBG with T=1
  tests/tcg/s390x: Add rxsbg.c

 target/s390x/tcg/translate.c    |  4 +++
 tests/tcg/s390x/Makefile.target |  3 +++
 tests/tcg/s390x/rxsbg.c         | 46 +++++++++++++++++++++++++++++++++
 3 files changed, 53 insertions(+)
 create mode 100644 tests/tcg/s390x/rxsbg.c

-- 
2.39.2



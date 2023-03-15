Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B22EC6BA4FE
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 03:05:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcGV8-0003hi-88; Tue, 14 Mar 2023 22:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcGV5-0003h0-30; Tue, 14 Mar 2023 22:04:23 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcGV2-0000wj-MV; Tue, 14 Mar 2023 22:04:22 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32F0gi4I030370; Wed, 15 Mar 2023 02:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=TM7OhFMvCYDN6tOTQGNrGprqhK9ATXx6dkHub1z8nXQ=;
 b=tp8jX693LYXWM5COtNMkZM+y+9wGTiSMv0hb2YeIHukX+rodrVqDYbHCeKaQ3EnsXrv8
 GKs+5inpX6QLc9V1KnGbm0w1T3mVcBOJv/kH7aeFQKzxhWqCG84cpRxC7EtFzmAExpqf
 vLPwyIzXNJaEUTCRRca80Sxtk08nBpbvKBqCRFbnQFIdzyJ2SvLIkod+qom8clZlOlCh
 2+3+8Jh1Y5xk2KXalPzLX/5t9lxt3BmL0lS1VnbycYiYPnbfp28FzTJ0rGg9e9wi30CS
 V9n5fR8HVp1VngcXEd9c/Yy0kK/OleDEldH8zzNYLnb1s+Z3wh0zI9HVhG5/Vidp3Bkl 4g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pb3q1shnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 02:04:16 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32F1x3cf009755;
 Wed, 15 Mar 2023 02:04:16 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pb3q1shmw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 02:04:16 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32EN5SRe021175;
 Wed, 15 Mar 2023 02:04:13 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3pb29sr4r0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 02:04:13 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32F24B3923724354
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Mar 2023 02:04:11 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6397520049;
 Wed, 15 Mar 2023 02:04:11 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECED420040;
 Wed, 15 Mar 2023 02:04:10 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.45.154])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 15 Mar 2023 02:04:10 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 0/3] target/s390x: Implement Early Exception Recognition
Date: Wed, 15 Mar 2023 03:04:05 +0100
Message-Id: <20230315020408.384766-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ji9ectcoXts0qbEyyisFM7zxzdIl4vTo
X-Proofpoint-GUID: Yir9zHb6yLmDC3oEPnBDvSuJk24OhG_9
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_16,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 mlxlogscore=319 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2302240000 definitions=main-2303150017
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

v1: https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg04372.html
v1 -> v2: Fix SSM and STOSM (Nina).
          Fix LPSW (Nina).
          Check bits 12 and 24 (Nina).
          Improve the commit message (Nina).
          Improve naming (David).

Hi,

Currently loading bad PSW flags does not lead to an exception, which is
not correct. This series fixes this by implementing what PoP calls
"Early Exception Recognition". Since it applies to both loading PSW with
LPSW/LPSWE and to interrupt handling, s390_cpu_set_psw() looks like the
right place for it to be in. SSM and STOSM need special handling, which
is implemented inline.

Patch 1 fixes the LPSW instruction (which is related), patch 2 
implements Early Exception Recognition, patch 3 adds a number of tests.

Best regards,
Ilya

Ilya Leoshkevich (3):
  target/s390x: Fix LPSW
  target/s390x: Implement Early Exception Recognition
  tests/tcg/s390x: Add PSW modification tests

 target/s390x/cpu.c                      | 26 +++++++++++++++
 target/s390x/cpu.h                      |  1 +
 target/s390x/tcg/excp_helper.c          |  3 +-
 target/s390x/tcg/translate.c            | 38 ++++++++++++++++------
 tests/tcg/s390x/Makefile.softmmu-target |  5 +++
 tests/tcg/s390x/exrl-ssm-early.S        | 43 +++++++++++++++++++++++++
 tests/tcg/s390x/lpsw.S                  | 36 +++++++++++++++++++++
 tests/tcg/s390x/lpswe-early.S           | 38 ++++++++++++++++++++++
 tests/tcg/s390x/ssm-early.S             | 41 +++++++++++++++++++++++
 tests/tcg/s390x/stosm-early.S           | 41 +++++++++++++++++++++++
 10 files changed, 261 insertions(+), 11 deletions(-)
 create mode 100644 tests/tcg/s390x/exrl-ssm-early.S
 create mode 100644 tests/tcg/s390x/lpsw.S
 create mode 100644 tests/tcg/s390x/lpswe-early.S
 create mode 100644 tests/tcg/s390x/ssm-early.S
 create mode 100644 tests/tcg/s390x/stosm-early.S

-- 
2.39.2



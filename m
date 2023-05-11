Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 237A66FF0AB
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 13:47:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px4lG-0005cw-RK; Thu, 11 May 2023 07:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1px4lE-0005bs-Jd; Thu, 11 May 2023 07:47:04 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1px4lC-0006wr-9a; Thu, 11 May 2023 07:47:04 -0400
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34BBeMYZ014578; Thu, 11 May 2023 11:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=xqVW+Q5VFHYGt0F83jMeuuQdHj9rFh9fUMy1lVfvQek=;
 b=drcr8ZXz/eNl4KKA3gwSrnckudCvjUvUhotvD+v7xU/PzcYIE1uH5elus+Ro6rDEDnTp
 q06ULon9Jpytb2AgA3wMXQH+qzK587VgwGluMEQZ2ZppfLMjleVwzElifbVbNN/0ZVx6
 TeTxIsWUegniH8mbloBKwif2oOdnLvLEQDmpZeann/VCgS8O/7ggzxXzkhp8JjttVtLj
 OrAeGsoTp3XvxeW5BvwpdLGW4xqmhFOxMbAnYelVLdM6dvVuXuAOKcipcsrjh02vvn3P
 gdmWRrWIxtRVDfflMDri7+qqR04rfHoSvS+8CgV0y305eHv+00Vyg3Io5PGL1w/86C93 TA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qgxjbah7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 May 2023 11:46:58 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34BBkwAD016151;
 Thu, 11 May 2023 11:46:58 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qgxjbah6w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 May 2023 11:46:58 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34B9bioX006811;
 Thu, 11 May 2023 11:46:56 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3qf7e0sc3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 May 2023 11:46:56 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 34BBksIb38535530
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 May 2023 11:46:54 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E867220043;
 Thu, 11 May 2023 11:46:53 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D52920040;
 Thu, 11 May 2023 11:46:53 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.14.79])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 11 May 2023 11:46:53 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "David Hildenbrand" <david@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 "Peter Maydell" <peter.maydell@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v5 0/2] tests/tcg/s390x: Enable the multiarch system tests
Date: Thu, 11 May 2023 13:46:49 +0200
Message-Id: <20230511114651.439872-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VpXbyWEW7aYRU55fQaBcsEKa3g8L_CyB
X-Proofpoint-GUID: vGoscJe6KJokPx4M6CrW2LDIENB5O8cz
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-11_08,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=952
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305110099
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

v4: https://lists.gnu.org/archive/html/qemu-devel/2023-05/msg01406.html
v4 -> v5: Use pre-decrement on BE to have nicer values in memory (Alex).
          Fix the comment saying that only LE is supported (Alex).

v3: https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg04756.html
v3 -> v4: Trivial rebase on top of Alex's series.

v2: https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg04154.html
v2 -> v3: The idea with sharing the QEMU headers with the tests seems
          to be controversial. Just rework the test to work without
          the explicit byte swaps.

v1: https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg03746.html
v1 -> v2: Use cpu_to_le16() and friends (Thomas).

Hi,

I noticed that Alex added "undefine MULTIARCH_TESTS" to
tests/tcg/s390x/Makefile.softmmu-target in the plugin patch, and
thought that it may better to just enable them, which this series
does.

Patch 1 fixes an endianness issue in the memory test.

Patch 2 enables the multiarch system test. The main difficulty is
outputting characters via SCLP, which is sidestepped by reusing the
pc-bios/s390-ccw implementation.

Best regards,
Ilya

Ilya Leoshkevich (2):
  tests/tcg/multiarch: Make the system memory test work on big-endian
  tests/tcg/s390x: Enable the multiarch system tests

 tests/tcg/multiarch/system/memory.c     | 67 ++++++++++++++++---------
 tests/tcg/s390x/Makefile.softmmu-target | 40 +++++++++------
 tests/tcg/s390x/console.c               | 12 +++++
 tests/tcg/s390x/head64.S                | 31 ++++++++++++
 4 files changed, 112 insertions(+), 38 deletions(-)
 create mode 100644 tests/tcg/s390x/console.c
 create mode 100644 tests/tcg/s390x/head64.S

-- 
2.40.1



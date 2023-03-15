Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609646BC1EA
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 00:58:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcazR-0005k5-Jf; Wed, 15 Mar 2023 19:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcazP-0005je-Ja; Wed, 15 Mar 2023 19:57:03 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcazL-0007E0-JF; Wed, 15 Mar 2023 19:57:03 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32FMYJbo003679; Wed, 15 Mar 2023 23:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=grvbObaYJJwYizvVEPtCUewRCWL3pYTm74ggLAT0HXY=;
 b=k96ykff/M5uOBWKdvSb+vwcT4bDGUjoqTohOISs4Ma/2NSRfyhbEEOxmgZEj6VPOSZnz
 kpBGVcltulwWoyQBjM+iTETkg/fXeQ/cp4+deWRjdDLaAj6TufqOAFN0MiyQ2qCCco4Y
 RhQLp5TNZdatB+esV2Sg+nwu9+V5BmD7RWht1dLCq/u/lhfOWWOlBYULzXEQ99y+7soS
 IDKrCunmEO1Pt9I5YL4fqeF6dCUGYV4f16AepxefeNc4wl0Rc1fBC5XYwqg7Dpa/4LoS
 Ovi0VZh6CPRMReG77+5T2Reqzts4JchN02Z9BT0eN9Yzoeg7Ifeo0gNkdQpRwAuO16Y8 Dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pbpx91cca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 23:56:51 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32FNgH3A005829;
 Wed, 15 Mar 2023 23:56:51 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pbpx91cc0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 23:56:51 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32FKLOPO028724;
 Wed, 15 Mar 2023 23:56:48 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3pbmyjg577-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 23:56:48 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32FNukJF42533194
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Mar 2023 23:56:46 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32AC12004E;
 Wed, 15 Mar 2023 23:56:46 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 82BF520040;
 Wed, 15 Mar 2023 23:56:45 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.19.28])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 15 Mar 2023 23:56:45 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 0/2] target/s390x: Fix R[NOX]SBG with T=1
Date: Thu, 16 Mar 2023 00:56:40 +0100
Message-Id: <20230315235642.118002-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: c0BESWrdJ8mIC0ak17nAHYl5Xyy-y7J4
X-Proofpoint-ORIG-GUID: fDQdnpNzks8pQr5bogJTQ8QhJsBqYL-K
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_12,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=828 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 impostorscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303150192
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

 target/s390x/tcg/translate.c    |  3 +++
 tests/tcg/s390x/Makefile.target |  3 +++
 tests/tcg/s390x/rxsbg.c         | 46 +++++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+)
 create mode 100644 tests/tcg/s390x/rxsbg.c

-- 
2.39.2



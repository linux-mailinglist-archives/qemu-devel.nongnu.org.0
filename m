Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7729F6EB684
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 02:59:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pq1a4-0006rs-QM; Fri, 21 Apr 2023 20:58:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pq1a2-0006qf-LD; Fri, 21 Apr 2023 20:58:22 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pq1a0-0003Sb-Tx; Fri, 21 Apr 2023 20:58:22 -0400
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33M0VbnR031413; Sat, 22 Apr 2023 00:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=7Rr7xZt4qM4bPB3lPDNP9GYzFoTTMd5ivo4EV7fx3eY=;
 b=LOOzWfj6gB4lqHIE7mkuWQEf7ezPhGv3yl4uLWJkl8eGJ9ltJuTWp2AwCemj1Jx+yxWL
 VEMRV7t0UQ4TDrpRYE3kpdVSVe2DWDtSDuJzJkYs1Wk1167L43dJBSwE8UIA526oiH9C
 5t7oqalBle0tOGkBFKfqD0eXeq0Nmh9S4OpDTorAhwr6vW4W2miX9F+76a812kuJ5blr
 XmUrRDwMN04cHEEz7uPrR1B/ifvYdhNSeSDi0qKv4Kg1gi6ReoLeyt1GMT7uj4sj2aCP
 VGZDmMipBBHDFv6AfkLlmRYTbFdd/tdPrsIw4Qf3YkcQJI4xrXC3sxsyq84aqh//bsp4 xg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q403m1eqj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 22 Apr 2023 00:58:16 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33M0j5LR009111;
 Sat, 22 Apr 2023 00:58:15 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q403m1eq5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 22 Apr 2023 00:58:15 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33LHUnbl030204;
 Sat, 22 Apr 2023 00:58:13 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3pykj6caru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 22 Apr 2023 00:58:13 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33M0wBa046006716
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 22 Apr 2023 00:58:11 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C8642004B;
 Sat, 22 Apr 2023 00:58:11 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8C6E20043;
 Sat, 22 Apr 2023 00:58:10 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.0.177])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Sat, 22 Apr 2023 00:58:10 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 0/2] tests/tcg/s390x: Enable the multiarch system tests
Date: Sat, 22 Apr 2023 02:58:06 +0200
Message-Id: <20230422005808.1773015-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Dnu1-PLtqvecL4BZd-Ry-3hHpgTy77hK
X-Proofpoint-GUID: sj8sJGuSrUr7CrBsySuhFjNJXuXarA0C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-21_08,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=812 adultscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304220003
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

 tests/tcg/multiarch/system/memory.c     | 24 ++++++++++++++++
 tests/tcg/s390x/Makefile.softmmu-target | 37 +++++++++++++++++--------
 tests/tcg/s390x/console.c               | 12 ++++++++
 tests/tcg/s390x/head64.S                | 31 +++++++++++++++++++++
 4 files changed, 93 insertions(+), 11 deletions(-)
 create mode 100644 tests/tcg/s390x/console.c
 create mode 100644 tests/tcg/s390x/head64.S

-- 
2.39.2



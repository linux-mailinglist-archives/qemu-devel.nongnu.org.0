Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC506EEA69
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 00:50:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prRTA-0002ZF-4t; Tue, 25 Apr 2023 18:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1prRT8-0002Yd-2I; Tue, 25 Apr 2023 18:49:06 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1prRT5-00044t-55; Tue, 25 Apr 2023 18:49:05 -0400
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33PMmGxw015365; Tue, 25 Apr 2023 22:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=ikdObU1W/f3tELWucIwoyARPILisH6Q/HvVVzN+6tH8=;
 b=MYvmFr8r1JFFM8eIpl2EWAD46eoPpwZ4fd/mrLhcTbc+dG4p9OeaZTeoI/KOLKQ1zkst
 dCBL5WzhFZDH22oEdGB5GERFxM7gD4wdDgEapL7rqmwhXc6Ul5oHirYbLGgIG2pgsiii
 6z8Ww9st+LZWtnNRsHBOL7N3dPZozjITzqS3BKLQERIIIn1Smt/Al/KH28oQ9SQ7Jakq
 ZHtjmuFRUi8tZcolDr0+vBhO4wiU7zUhOcU5qj5jliTS8ZgWuhBh0mawCjNL5T/PgDrO
 bNiB8wu88YdHw3mDyWWxwAucyUF8ZbD7r6X4VEE88F96Iwr3IPcApQok30besLD12DT4 Mg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q6pr3t58t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Apr 2023 22:48:57 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33PMmKR0015595;
 Tue, 25 Apr 2023 22:48:57 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q6pr3t584-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Apr 2023 22:48:57 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33PMUduV002594;
 Tue, 25 Apr 2023 22:48:55 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3q47771npc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Apr 2023 22:48:55 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33PMmrxT21234292
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Apr 2023 22:48:53 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E978420043;
 Tue, 25 Apr 2023 22:48:52 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7230120040;
 Tue, 25 Apr 2023 22:48:52 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.10.36])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 25 Apr 2023 22:48:52 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 0/2] tests/tcg/s390x: Enable the multiarch system tests
Date: Wed, 26 Apr 2023 00:48:48 +0200
Message-Id: <20230425224850.2116064-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GcYTbQtacsKiVDGsZPghDcayTDZIN867
X-Proofpoint-ORIG-GUID: hxxq8luSDf2s0c6BQeWGARXYna6LdUM-
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_08,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 mlxlogscore=873 bulkscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304250201
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

 tests/tcg/multiarch/system/memory.c     | 64 ++++++++++++++++---------
 tests/tcg/s390x/Makefile.softmmu-target | 40 +++++++++++-----
 tests/tcg/s390x/console.c               | 12 +++++
 tests/tcg/s390x/head64.S                | 31 ++++++++++++
 4 files changed, 113 insertions(+), 34 deletions(-)
 create mode 100644 tests/tcg/s390x/console.c
 create mode 100644 tests/tcg/s390x/head64.S

-- 
2.39.2



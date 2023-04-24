Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BB66ECB84
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 13:46:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pque2-0003GR-Ml; Mon, 24 Apr 2023 07:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pqudo-0003FZ-Gb; Mon, 24 Apr 2023 07:45:58 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pqudh-0002G4-9G; Mon, 24 Apr 2023 07:45:51 -0400
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33OBbehu004303; Mon, 24 Apr 2023 11:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=q41wBqPeMBBy1bM5QZ4d96a0kiVLOoH+xdG5XFb7AzI=;
 b=Z0hPuzBL2smGaf9IDjEaY+kKdh+Kb2Pv1tXYVLZnViK3+wYU3mOVcsjBy5YLcug0UdSj
 WFgFXPLhhQNftkoa93UMZPtCwOSzmN0IbUowEIoSnj/LO6N1FA6CC/GAxE/rF5B+MFxW
 dn4MXp8XlSxqxPorOs1IMoV83EiKpeNYJIRa4jegeoX/7om+gVB/sVW8Uewqo8kkxwT3
 +9mrsiq7Dej6PxhpFQINgX9cwtGSAw9c+HpB1JmhhDEICS0BzM5puj+ENqaLps5p2Hr7
 i3nctptOQ5RTAznvVGC2E0qxZH791w3K0aUC32e+I0iFbffnBSYm1VQpWknZW8FY3ukW MA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q46m5v4b6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 11:45:44 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33OBbtqu006339;
 Mon, 24 Apr 2023 11:45:43 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q46m5v49j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 11:45:43 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33O3qXmt006195;
 Mon, 24 Apr 2023 11:45:40 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3q46ug130w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 11:45:40 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33OBjcVW20382248
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Apr 2023 11:45:38 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 617C72004B;
 Mon, 24 Apr 2023 11:45:38 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D48FE20043;
 Mon, 24 Apr 2023 11:45:37 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.51.2])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 24 Apr 2023 11:45:37 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 0/3] tests/tcg/s390x: Enable the multiarch system tests
Date: Mon, 24 Apr 2023 13:45:30 +0200
Message-Id: <20230424114533.1937153-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FOlu3wkXgGlNOv30pMFVEH6kpgsBbUMY
X-Proofpoint-GUID: UPC_iPpBPA1IL5vlnS3eW-wi9Ciy9MnH
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_07,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=740
 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0 clxscore=1011
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304240104
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

v1: https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg03746.html
v1 -> v2: Use cpu_to_le16() and friends (Thomas).

Hi,

I noticed that Alex added "undefine MULTIARCH_TESTS" to
tests/tcg/s390x/Makefile.softmmu-target in the plugin patch, and
thought that it may better to just enable them, which this series
does.

Patch 1 makes the QEMU headers available to the tests.

Patch 2 fixes an endianness issue in the memory test.

Patch 3 enables the multiarch system test. The main difficulty is
outputting characters via SCLP, which is sidestepped by reusing the
pc-bios/s390-ccw implementation.

Best regards,
Ilya

Ilya Leoshkevich (3):
  tests/tcg: Make the QEMU headers available to the tests
  tests/tcg/multiarch: Make the system memory test work on big-endian
  tests/tcg/s390x: Enable the multiarch system tests

 tests/include/qemu/testdep.h            | 14 +++++++++
 tests/tcg/Makefile.target               |  4 +--
 tests/tcg/aarch64/sve-ioctls.c          |  1 +
 tests/tcg/aarch64/sysregs.c             |  1 +
 tests/tcg/multiarch/system/memory.c     | 26 ++++++++--------
 tests/tcg/s390x/Makefile.softmmu-target | 40 +++++++++++++++++--------
 tests/tcg/s390x/console.c               | 12 ++++++++
 tests/tcg/s390x/head64.S                | 31 +++++++++++++++++++
 8 files changed, 102 insertions(+), 27 deletions(-)
 create mode 100644 tests/include/qemu/testdep.h
 create mode 100644 tests/tcg/s390x/console.c
 create mode 100644 tests/tcg/s390x/head64.S

-- 
2.39.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5146F8016
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 11:36:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1purr9-0002TP-Ai; Fri, 05 May 2023 05:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1purr7-0002Si-LO; Fri, 05 May 2023 05:36:01 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1purr5-0002pb-PQ; Fri, 05 May 2023 05:36:01 -0400
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34598Bwo019615; Fri, 5 May 2023 09:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=Ni2U8JoYoi8H0K+ZsD0ZPx+2cPRoxsHORIKzKk8axnk=;
 b=RC1DA6O7vGZmjPo8koLZuI633by8m9toOqLwjYORbyK01l6RWoApZQISCFtphGQc9r3f
 V6924iAeCn70pCEst2Y0/ZWmZJdfvJ2v6PLCXaPTlf7bm8Dy+OEqCO1T8uM+9GWQkPGX
 osw3esmAlbOp0odWFfNQC18e9r+c+FobxvLH8092OzgeQUNTQG+WM9V3dI0AdZ0WD4qY
 J0rlBl/EdDMbNEFhyy/QyyBhN7KDKXFIIRI11b8FSAfARuJ/tFVDg36AscgzkkN9aNsP
 7tOQCvA6xKwwczvWrjyYwykxU2scZEvzNo92zgQyBXgCH5hsb8L3xawx17M7vweIqF+8 sg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qcwtx2eme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 May 2023 09:35:56 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3459TFCC014231;
 Fri, 5 May 2023 09:35:36 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qcwtx2dak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 May 2023 09:35:35 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3451btdW002470;
 Fri, 5 May 2023 09:31:52 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3q8tv6ubuv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 May 2023 09:31:52 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3459Vo0c63635940
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 May 2023 09:31:50 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01CDB20043;
 Fri,  5 May 2023 09:31:50 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 374C720040;
 Fri,  5 May 2023 09:31:49 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.69.208])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri,  5 May 2023 09:31:49 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "David Hildenbrand" <david@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 "Peter Maydell" <peter.maydell@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 0/2] tests/tcg/s390x: Enable the multiarch system tests
Date: Fri,  5 May 2023 11:31:45 +0200
Message-Id: <20230505093147.869913-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rI3eYGyD3R4MKssRClZbkQw6nCmlxB4G
X-Proofpoint-GUID: _zZn8WKYTEI874zg6Vs6uWC6uI5jFkir
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_16,2023-05-04_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=923 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305050078
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

 tests/tcg/multiarch/system/memory.c     | 64 ++++++++++++++++---------
 tests/tcg/s390x/Makefile.softmmu-target | 40 ++++++++++------
 tests/tcg/s390x/console.c               | 12 +++++
 tests/tcg/s390x/head64.S                | 31 ++++++++++++
 4 files changed, 111 insertions(+), 36 deletions(-)
 create mode 100644 tests/tcg/s390x/console.c
 create mode 100644 tests/tcg/s390x/head64.S

-- 
2.40.1



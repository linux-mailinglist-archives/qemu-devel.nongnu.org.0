Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 882B56FE507
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 22:28:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwqP8-0000HG-T9; Wed, 10 May 2023 16:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pwqP6-0000Gz-BV
 for qemu-devel@nongnu.org; Wed, 10 May 2023 16:27:16 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pwqP4-0000zS-FT
 for qemu-devel@nongnu.org; Wed, 10 May 2023 16:27:16 -0400
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34AKCn0E027054; Wed, 10 May 2023 20:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=bfJMUlj/bJO9NygEXC6DdHAaxIb7f2gsO8a52Xv3r68=;
 b=KFdjyBVZmNPYhS+rn9The0RGLjD+u+RCpsU6zu4DUdRt6Uq1rG1p+C2FJnbIsD1F0aV0
 mKKZru/fgofelxZFVoo2aC6Df9MqPZhoh7AZqywLeiWaRGpbZplkwsgwVFgOhJZSunjr
 skykUcAeZ7rqGSfx8FfON1T02ORLgzFD0y4urgqLLAKwutVHcSkHFK/kcNaQchTmBbbr
 Qp9GL26C7xljfgK/9tkGbO6nNGqCxrTROKnkxT3Tb8J0lOYv4YbfETAridANQcdHZU49
 aTnJAzHSRdN+41UEUyXPABJiUzil0AWNPxq6kJfFaVwSHUrtuYiDPS6MwGKTxwLYRc9p Lw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qgaa2rfy9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 20:27:09 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34AKOhQ3002022;
 Wed, 10 May 2023 20:27:09 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qgaa2rfx1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 20:27:09 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34AJcVXl021688;
 Wed, 10 May 2023 20:27:06 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3qf7d1s1h0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 20:27:06 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 34AKR3ma9568904
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 May 2023 20:27:03 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F1AE20043;
 Wed, 10 May 2023 20:27:03 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88AEC20040;
 Wed, 10 May 2023 20:27:02 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.51.237])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 10 May 2023 20:27:02 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Cc: "Dominik 'Disconnect3d' Czarnota" <dominik.b.czarnota@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Andreas Arnez <arnez@linux.ibm.com>, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH RESEND 0/6] gdbstub: Add support for info proc mappings
Date: Wed, 10 May 2023 22:26:48 +0200
Message-Id: <20230510202654.225689-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VOv-KFOzFhJ2NJGDjmZlAOGTDpH-VQWC
X-Proofpoint-ORIG-GUID: LxjqKCvFHW3z4k8GOeHa2LQqA6ZBm0oX
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305100163
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

[Apologies to people in To: and Cc:, who will get this the second time -
I forgot to Cc: the mailing list initially.]

Hi,

this series partially implements the Host I/O feature of the GDB Remote
Serial Protocol in order to make generate-core-file work with qemu-user.
It borrows heavily from the abandoned patch by Dominik [1], hence 4/6
carries the respective Co-developed-by: tag. I hope that's okay. I also
peeked at gdbserver/hostio.cc quite a few times.

The changes compared to Dominik's patch are:

- Implement readlink.
- Move the main functionality to user-target.c.
- Allocate buffers on heap.
- Add a test.
- Update gdb.rst.
- Split refactorings to the existing code into separate patches.
- Rename do_openat() to do_guest_openat().
- Do not retry pread(), since GDB is capable of doing it itself.
- Add an extra sanity check to gdb_handle_query_xfer_exec_file().
- Replace citations of the spec by a single link.

Best regards,
Ilya

[1] https://lore.kernel.org/all/20220221030910.3203063-1-dominik.b.czarnota@gmail.com/

Ilya Leoshkevich (6):
  linux-user: Expose do_guest_openat() and do_guest_readlink()
  gdbstub: Expose gdb_get_process() and gdb_get_first_cpu_in_process()
  gdbstub: Report the actual qemu-user pid
  gdbstub: Add support for info proc mappings
  docs: Document security implications of debugging
  tests/tcg: Add a test for info proc mappings

 docs/system/gdb.rst                           |  15 ++
 gdbstub/gdbstub.c                             |  86 ++++++++---
 gdbstub/internals.h                           |   7 +
 gdbstub/user-target.c                         | 139 ++++++++++++++++++
 linux-user/qemu.h                             |   3 +
 linux-user/syscall.c                          |  54 ++++---
 tests/tcg/aarch64/Makefile.target             |   3 +-
 tests/tcg/multiarch/Makefile.target           |   7 +
 .../multiarch/gdbstub/test-proc-mappings.py   |  55 +++++++
 tests/tcg/s390x/Makefile.target               |   2 +-
 10 files changed, 332 insertions(+), 39 deletions(-)
 create mode 100644 tests/tcg/multiarch/gdbstub/test-proc-mappings.py

-- 
2.40.1



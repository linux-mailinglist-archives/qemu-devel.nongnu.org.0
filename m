Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1680E6965F2
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 15:09:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRvzW-0002p5-37; Tue, 14 Feb 2023 09:09:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pRvzM-0002ol-Qi
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 09:08:57 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pRvzL-0002WP-0l
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 09:08:56 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31ECnheo003844; Tue, 14 Feb 2023 14:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=6aiGttKLKfHwcFaZXAm45befIDyloI5qgmsdxUbaycw=;
 b=FKJnfTrfnxkeAwglX5w7KywdWkb4Y0r7wusAWHl+WsIZIQW4MgqwM1Gjn0ZsEt5fQvIa
 ba0yP0KnuuZGCgK1GJLsU631pb1AeySbCdYZGk6vdDjoKurCa46eEA+c07D+Tw5nnUrP
 vIc2gUpJXiaOLFNzvWx9I1PiGTxIQ6MNxrSkojIn30lyvZm+t2j/76qjdxDImWNzUZuh
 qUWMw9MqtAbx7KNy1051HoxP4GsaFuFURHmdpgRTC2FDUo929HW8f3CHVyNbX5JEnLBf
 Ugf5HKG1J866mePRKOM0OGTWegZPlXJtrgCDbH78TfXk+eI9JpTSBC7JKNySgyRVnOvi SA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nran02mqe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Feb 2023 14:08:42 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31ECq5lI013004;
 Tue, 14 Feb 2023 14:08:41 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nran02mnm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Feb 2023 14:08:41 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31E5YPO4030092;
 Tue, 14 Feb 2023 14:08:39 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3np29fm44n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Feb 2023 14:08:39 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31EE8ZGO34799950
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Feb 2023 14:08:35 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E8EC20040;
 Tue, 14 Feb 2023 14:08:35 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F00752004F;
 Tue, 14 Feb 2023 14:08:34 +0000 (GMT)
Received: from heavy.boa-de.ibmmobiledemo.com (unknown [9.171.76.115])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 14 Feb 2023 14:08:34 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 0/4] Fix deadlock when dying because of a signal
Date: Tue, 14 Feb 2023 15:08:25 +0100
Message-Id: <20230214140829.45392-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: aM3HHkr0XdOmhCaixRrTxak-7gkGV1Fh
X-Proofpoint-GUID: x0eCripAI10ouofsl9dvep9PQ99Wua7e
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_07,2023-02-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302140120
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

Based-on: <20230202005204.2055899-1-richard.henderson@linaro.org>
("[PATCH 00/14] linux-user/sparc: Handle missing traps")

v3: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg03534.html
v3 -> v4: Add printfs to the test in order to make the uncaught signals
          less scary:

          $ build/x86_64-linux-user/qemu-x86_64 build/tests/tcg/x86_64-linux-user/linux-fork-trap
          about to trigger fault...
          qemu: uncaught target signal 4 (Illegal instruction) - core dumped
          faulting thread exited cleanly

v2: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg03299.html
v2 -> v3: Use exclusive_context_count = 1 instead of
          exclusive_context_count++ in the non-recursive case.

v1: https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg07251.html
v1 -> v2: Drop the sparc patch (superseded by Richard's series).
          Add the end_exclusive() fix.

Hi,

wasmtime testsuite found a deadlock in qemu_plugin_user_exit().
I tracked it down to one of my earlier patches, which introduced
cleanup in dump_core_and_abort().

Patches 1 and 2 fix the issue, patch 3 fixes __builtin_trap()
handling in microblaze, which is needed for patch 4, that adds a test.

Best regards,
Ilya

Ilya Leoshkevich (4):
  linux-user: Always exit from exclusive state in fork_end()
  cpus: Make {start,end}_exclusive() recursive
  linux-user/microblaze: Handle privileged exception
  tests/tcg/linux-test: Add linux-fork-trap test

 cpus-common.c                               | 12 ++++-
 include/hw/core/cpu.h                       |  4 +-
 linux-user/main.c                           | 10 ++--
 linux-user/microblaze/cpu_loop.c            | 10 +++-
 linux-user/syscall.c                        |  1 +
 tests/tcg/multiarch/linux/linux-fork-trap.c | 51 +++++++++++++++++++++
 6 files changed, 78 insertions(+), 10 deletions(-)
 create mode 100644 tests/tcg/multiarch/linux/linux-fork-trap.c

-- 
2.39.1



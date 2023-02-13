Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2ED695275
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 21:59:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRfu7-0000Mb-Gp; Mon, 13 Feb 2023 15:58:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pRfu2-0000Lb-V4
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 15:58:23 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pRfu0-0007O9-7Z
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 15:58:21 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31DKqdwo004596; Mon, 13 Feb 2023 20:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=v07s3n7P1YZXezfZkfZu0OWAwMToZW3yLXMrKWGO5vA=;
 b=Ts4x+rGSKx01rdOnffxL6ZO9UHF2E4f772lWspZERyC/PiZdEgQtMRJ2mso0hVFzB1vv
 Q2KzERoaBihT5IjiM6Qjx0N8CnZJZNg05NkgBkm1UZ+VKIt9ZwI+QzSAaPpQ5a7MkK4W
 RfHIn7aE2gIccJUdQvk0UTB8JVLziKjRTgbfp4WNQEOfrMk8ZUI+bDaT3ycXVvTJ0JIW
 AT35h/mZFuze1lP0NuZAWr2qlsYWbopLX+lCGh5qlS+C6fwMoy3fJWWbjUV9ML7ZnIHH
 vvGUDbHS/YTH7TieL0NXiIISWJKE8qdiwjX2jmu/MNLyveRlBvhK5aJJN59zddug+GLU QA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nqvmn04gk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 20:58:11 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31DKs3xO013145;
 Mon, 13 Feb 2023 20:58:10 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nqvmn04fe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 20:58:10 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31D9KOap022275;
 Mon, 13 Feb 2023 20:58:08 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3np29faava-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 20:58:08 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31DKw4PQ46924090
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 20:58:04 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6FDD620043;
 Mon, 13 Feb 2023 20:58:04 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A18B120040;
 Mon, 13 Feb 2023 20:58:03 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.33.28])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 13 Feb 2023 20:58:03 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 1/4] linux-user: Always exit from exclusive state in
 fork_end()
Date: Mon, 13 Feb 2023 21:57:56 +0100
Message-Id: <20230213205759.649537-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213205759.649537-1-iii@linux.ibm.com>
References: <20230213205759.649537-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -CHbvfR-CYIpqpWlcutifR3RnYVYA9DZ
X-Proofpoint-ORIG-GUID: VTowTZp5cFVboVxM0bGLKTS9HOkC6VBX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_12,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 adultscore=0 mlxlogscore=958 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302130180
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

fork()ed processes currently start with
current_cpu->in_exclusive_context set, which is, strictly speaking, not
correct, but does not cause problems (even assertion failures).

With one of the next patches, the code begins to rely on this value, so
fix it by always calling end_exclusive() in fork_end().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 linux-user/main.c    | 10 ++++++----
 linux-user/syscall.c |  1 +
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 4290651c3cf..4ff30ff9806 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -161,13 +161,15 @@ void fork_end(int child)
         }
         qemu_init_cpu_list();
         gdbserver_fork(thread_cpu);
-        /* qemu_init_cpu_list() takes care of reinitializing the
-         * exclusive state, so we don't need to end_exclusive() here.
-         */
     } else {
         cpu_list_unlock();
-        end_exclusive();
     }
+    /*
+     * qemu_init_cpu_list() reinitialized the child exclusive state, but we
+     * also need to keep current_cpu consistent, so call end_exclusive() for
+     * both child and parent.
+     */
+    end_exclusive();
 }
 
 __thread CPUState *thread_cpu;
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 1e868e9b0e2..a6c426d73cf 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6752,6 +6752,7 @@ static int do_fork(CPUArchState *env, unsigned int flags, abi_ulong newsp,
             cpu_clone_regs_parent(env, flags);
             fork_end(0);
         }
+        g_assert(!cpu_in_exclusive_context(cpu));
     }
     return ret;
 }
-- 
2.39.1



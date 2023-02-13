Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED961694662
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 13:54:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRYKS-0004vq-Mv; Mon, 13 Feb 2023 07:53:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pRYKP-0004vY-T2
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 07:53:05 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pRYKN-0008WF-3t
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 07:53:05 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31DCov61003705; Mon, 13 Feb 2023 12:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Okil2ASw0WqvnfUFFcFGVYXCdy6V97lGocTbBRlV0Q4=;
 b=j+XRkbr6gAxMQfNDGM6t8LSqFHJ77yVZv4jjuYLMaYmSmV+EwZjLbSBYih+dT5gZb7QA
 YKMXbZ44KySMS3jD+P0kLmeHlktofUERZp4LXkEwPQPlgQPUPsfhxsllG0gc+Ha4RI9b
 S+NOr1YeH8BX094a9EWgC+BKnariq2vT5o6jozqp8zw85Nkc7xU76nEhMdIZ1Qh2ym4b
 yGZ0Xn2mgclyrpawHnBFg0qkd/Wu/uQZOZdnfdmlAj1aK8wTi2XWPyQJe+kjafU+mkZC
 FXeb5an9RAh2wvUqOBoA96/47TZ6cIc8EgGwtrXddHdE4M1yCOum7lLaTJDG+TeVHvUj iQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nqnjfg153-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 12:52:52 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31DCpIUN004624;
 Mon, 13 Feb 2023 12:52:51 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nqnjfg14h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 12:52:51 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31DBqoPi029819;
 Mon, 13 Feb 2023 12:52:49 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3np29fjp30-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 12:52:49 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31DCqk4i33882592
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 12:52:46 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 594EB2004F;
 Mon, 13 Feb 2023 12:52:46 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3A1220043;
 Mon, 13 Feb 2023 12:52:45 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.19.58])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 13 Feb 2023 12:52:45 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 1/4] linux-user: Always exit from exclusive state in
 fork_end()
Date: Mon, 13 Feb 2023 13:52:34 +0100
Message-Id: <20230213125238.331881-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213125238.331881-1-iii@linux.ibm.com>
References: <20230213125238.331881-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: S3By0lA6ruFOnCtOXvjS9CfLPT2yLcWM
X-Proofpoint-GUID: WEB0nZf9pNPVuAnalMDI5IrQrZuAa6hJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_08,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=949 impostorscore=0 bulkscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302130112
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

fork()ed processes currently start with
current_cpu->in_exclusive_context set, which is, strictly speaking, not
correct, but does not cause problems (even assertion failures).

With one of the next patches, the code begins to rely on this value, so
fix it by always calling end_exclusive() in fork_end().

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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C49695277
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 21:59:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRfu6-0000MN-Tt; Mon, 13 Feb 2023 15:58:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pRfu1-0000K4-7Y
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 15:58:21 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pRftz-0007O7-Kg
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 15:58:20 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31DKPBvF007330; Mon, 13 Feb 2023 20:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=FacbHSaEM0yu8kHKUtK6kVxwFDY5DZx4QnqOhtHPuLQ=;
 b=QJ1++R+k6UaV6Olvjx8SvRYWxNSpbhk0vqZIps0a3iWziy5KYPfWDcPg23GOx6RnpVv6
 UMo8vrQm+OIJD9/8PUVNleFTOMxuwMGcXg16pO7ABy0V80hF21Ccgbng7qnO4wYfh58L
 M600y3d87skUSKcK+GqLeT+VSwTn86tZiz0nqrcDzIsCrGC0Eky3O5tFbMkxrftdgKXq
 UX0I5GOFycjaltu+XyYXuyoyjMaW/jenNc7INVU5eW+g14U4/dN/HgQSzoueBpKBbSzM
 +jXF8n27GvluVmGdxdMvSvVZ3n0QoCK22sVe/LI9bjD0uq6t5FeADMSRY0y/5ZF4Q8ah YA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nqv7drnc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 20:58:14 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31DKpCDO031051;
 Mon, 13 Feb 2023 20:58:13 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nqv7drnbj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 20:58:13 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31DCumE1031193;
 Mon, 13 Feb 2023 20:58:11 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3np29fk5df-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 20:58:11 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31DKw7XU42402050
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 20:58:07 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6BB6820043;
 Mon, 13 Feb 2023 20:58:07 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A17D020040;
 Mon, 13 Feb 2023 20:58:06 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.33.28])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 13 Feb 2023 20:58:06 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 3/4] linux-user/microblaze: Handle privileged exception
Date: Mon, 13 Feb 2023 21:57:58 +0100
Message-Id: <20230213205759.649537-4-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213205759.649537-1-iii@linux.ibm.com>
References: <20230213205759.649537-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RUOlHZAWat0ZiukhrssdjfPWsYgAI3fJ
X-Proofpoint-GUID: ZZDgeR8RfJ_1mCpgtvUNB8wuzvapIumk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_12,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302130180
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

Follow what kernel's full_exception() is doing.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/microblaze/cpu_loop.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
index 5ccf9e942ea..212e62d0a62 100644
--- a/linux-user/microblaze/cpu_loop.c
+++ b/linux-user/microblaze/cpu_loop.c
@@ -25,8 +25,8 @@
 
 void cpu_loop(CPUMBState *env)
 {
+    int trapnr, ret, si_code, sig;
     CPUState *cs = env_cpu(env);
-    int trapnr, ret, si_code;
 
     while (1) {
         cpu_exec_start(cs);
@@ -76,6 +76,7 @@ void cpu_loop(CPUMBState *env)
             env->iflags &= ~(IMM_FLAG | D_FLAG);
             switch (env->esr & 31) {
             case ESR_EC_DIVZERO:
+                sig = TARGET_SIGFPE;
                 si_code = TARGET_FPE_INTDIV;
                 break;
             case ESR_EC_FPU:
@@ -84,6 +85,7 @@ void cpu_loop(CPUMBState *env)
                  * if there's no recognized bit set.  Possibly this
                  * implies that si_code is 0, but follow the structure.
                  */
+                sig = TARGET_SIGFPE;
                 si_code = env->fsr;
                 if (si_code & FSR_IO) {
                     si_code = TARGET_FPE_FLTINV;
@@ -97,13 +99,17 @@ void cpu_loop(CPUMBState *env)
                     si_code = TARGET_FPE_FLTRES;
                 }
                 break;
+            case ESR_EC_PRIVINSN:
+                sig = SIGILL;
+                si_code = ILL_PRVOPC;
+                break;
             default:
                 fprintf(stderr, "Unhandled hw-exception: 0x%x\n",
                         env->esr & ESR_EC_MASK);
                 cpu_dump_state(cs, stderr, 0);
                 exit(EXIT_FAILURE);
             }
-            force_sig_fault(TARGET_SIGFPE, si_code, env->pc);
+            force_sig_fault(sig, si_code, env->pc);
             break;
 
         case EXCP_DEBUG:
-- 
2.39.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AF3685C62
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 01:47:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN1Gh-0006OU-61; Tue, 31 Jan 2023 19:46:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pN1Ge-0006MZ-6Q
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 19:46:28 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pN1Gb-0004Jc-5Y
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 19:46:27 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3110EjeF018504; Wed, 1 Feb 2023 00:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=mMRQaC3kK+XIczQaWtm8aSJsy1D7GyS5ob78buNrJVU=;
 b=UbvyofDP1NXXJSvfe93eTFhR0WsOgkmhAAQQexRP9YGFz0ukS6mFxcJ6HSLVxk2tjnKv
 XTRJmrHnF1B2eYtaxLabUHgSH+PtubqXdlV2zADMCF9FQExmxhOa22oBXNn3JXAN9M62
 ILxay1c8SN5SqZ/yZK/YZS9ANsrAsCRCRMaYId8JT6TN7PtSgyfRi2ZVrzNMKxgWVUC0
 bUw1qriveRsfJAVWzmJc5vwvSlapVLQENbbg2OOuhGEr9k1pSneYnT12n52kjSrGas9g
 o0ftO0QJbcWAiyNCyD1pCnivR11tA8zrqzt8nV/Uj9tWdvj/Vlf5mxAYEux1j+vP5p+8 9Q== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfag0cda6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 00:46:22 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30VDArlQ013356;
 Wed, 1 Feb 2023 00:46:20 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3ncvtyc3xn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 00:46:20 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3110kH7k48300320
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Feb 2023 00:46:17 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02AB520043;
 Wed,  1 Feb 2023 00:46:17 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D60D20040;
 Wed,  1 Feb 2023 00:46:16 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.18.228])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed,  1 Feb 2023 00:46:16 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org, 
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 2/4] linux-user/microblaze: Handle privileged exception
Date: Wed,  1 Feb 2023 01:46:07 +0100
Message-Id: <20230201004609.3005029-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201004609.3005029-1-iii@linux.ibm.com>
References: <20230201004609.3005029-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EN5Je7g7tjvmBNdWJmnHZlgXTWzVCqny
X-Proofpoint-ORIG-GUID: EN5Je7g7tjvmBNdWJmnHZlgXTWzVCqny
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_08,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302010003
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



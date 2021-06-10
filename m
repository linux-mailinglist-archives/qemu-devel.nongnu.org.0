Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 487193A3618
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 23:39:20 +0200 (CEST)
Received: from localhost ([::1]:54776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrSOU-0003aB-UC
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 17:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1lrPtA-0005Co-D4; Thu, 10 Jun 2021 14:58:48 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1lrPt3-0007RU-GV; Thu, 10 Jun 2021 14:58:48 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15AIwFxv177510; Thu, 10 Jun 2021 14:58:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=C7tNgAmI8LDbQ3uGoQj3M8wfCxKfgskdV0uLdwKU/tU=;
 b=S/08cvk8QSOpUR3Je/dtpSMEKsZa62gqu/omLDmoWs54A6a0TRG8VzoEK2zONl3koULu
 KOAdw5HJDPE48EQre1xPHehY0QmErsmGesG3iKjs13OY+gCd63128bTfRDVzgApQFlSi
 6vzu4f8ygkfsrdjYTObXyrcrGFyuo6m/FJlN7cuaOoNqPXtemxKfpOjbxEmeQSz17mqh
 Pm8S9uQlwnI2hNv2VykOKhQ+PWuIktOlju+0iBcui0WKjDhBe6ajVDdCHLMAuOua6B/q
 +aDunTpXWpR3+KPUawJvCcx5co0PfcHijKdU32zseA75OiysIB8YH7VCflunmW/OWI0G ug== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 393rg1004r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 14:58:39 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15AIvmtk010348;
 Thu, 10 Jun 2021 18:58:39 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 393cckxbyp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 18:58:38 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15AIwagn6357476
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Jun 2021 18:58:36 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFF08BE04F;
 Thu, 10 Jun 2021 18:58:36 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FD1CBE054;
 Thu, 10 Jun 2021 18:58:36 +0000 (GMT)
Received: from LAPTOP-K4LLPL5U.localdomain (unknown [9.65.250.107])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 10 Jun 2021 18:58:35 +0000 (GMT)
From: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 1/1] linux-user/s390x: save/restore condition code state
 during signal handling
Date: Thu, 10 Jun 2021 14:58:23 -0400
Message-Id: <20210610185823.14817-2-jonathan.albrecht@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610185823.14817-1-jonathan.albrecht@linux.vnet.ibm.com>
References: <20210610185823.14817-1-jonathan.albrecht@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qDiQYGDbfAyl96EUvm4lV2ghzfbMFiDE
X-Proofpoint-ORIG-GUID: qDiQYGDbfAyl96EUvm4lV2ghzfbMFiDE
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-10_11:2021-06-10,
 2021-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 mlxlogscore=970 mlxscore=0 malwarescore=0 adultscore=0 suspectscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106100118
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=jonathan.albrecht@linux.vnet.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 10 Jun 2021 17:37:58 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: ruixin.bao@ibm.com, qemu-s390x@nongnu.org,
 Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>, jonathan.albrecht@ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When handling a signal, the signal handler may have clobbered the
condition code set by the interrupted thread.

Signed-off-by: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>
Buglink: https://bugs.launchpad.net/qemu/+bug/1886793
Buglink: https://bugs.launchpad.net/qemu/+bug/1893040
---
 linux-user/s390x/signal.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index ef136dae33..03cacb2829 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -65,6 +65,10 @@ typedef struct {
     uint8_t callee_used_stack[__SIGNAL_FRAMESIZE];
     target_sigcontext sc;
     target_sigregs sregs;
+    uint32_t scc_op;
+    uint64_t scc_src;
+    uint64_t scc_dst;
+    uint64_t scc_vr;
     int signo;
     target_sigregs_ext sregs_ext;
     uint16_t retcode;
@@ -86,6 +90,10 @@ typedef struct {
     uint8_t callee_used_stack[__SIGNAL_FRAMESIZE];
     uint16_t retcode;
     struct target_siginfo info;
+    uint32_t scc_op;
+    uint64_t scc_src;
+    uint64_t scc_dst;
+    uint64_t scc_vr;
     struct target_ucontext uc;
 } rt_sigframe;
 
@@ -224,6 +232,12 @@ void setup_frame(int sig, struct target_sigaction *ka,
     env->regs[5] = 0; /* FIXME: regs->int_parm_long */
     env->regs[6] = 0; /* FIXME: current->thread.last_break */
 
+    /* Some programs could clobber the condition code, so save it here */
+    __put_user(env->cc_op, &frame->scc_op);
+    __put_user(env->cc_src, &frame->scc_src);
+    __put_user(env->cc_dst, &frame->scc_dst);
+    __put_user(env->cc_vr, &frame->scc_vr);
+
     unlock_user_struct(frame, frame_addr, 1);
 }
 
@@ -273,6 +287,12 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     save_sigregs_ext(env, &frame->uc.tuc_mcontext_ext);
     tswap_sigset(&frame->uc.tuc_sigmask, set);
 
+    /* Some programs could clobber the condition code, so save it here */
+    __put_user(env->cc_op, &frame->scc_op);
+    __put_user(env->cc_src, &frame->scc_src);
+    __put_user(env->cc_dst, &frame->scc_dst);
+    __put_user(env->cc_vr, &frame->scc_vr);
+
     /* Set up registers for signal handler */
     env->regs[14] = restorer;
     env->regs[15] = frame_addr;
@@ -285,6 +305,10 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     env->regs[3] = frame_addr + offsetof(typeof(*frame), info);
     env->regs[4] = frame_addr + offsetof(typeof(*frame), uc);
     env->regs[5] = 0; /* FIXME: current->thread.last_break */
+
+    /* QUESTION: Was there a missing unlock user struct here? */
+    unlock_user_struct(frame, frame_addr, 1);
+    return;
 }
 
 static void restore_sigregs(CPUS390XState *env, target_sigregs *sc)
@@ -350,6 +374,12 @@ long do_sigreturn(CPUS390XState *env)
     restore_sigregs(env, &frame->sregs);
     restore_sigregs_ext(env, &frame->sregs_ext);
 
+    /* restore the condition code */
+    __get_user(env->cc_op, &frame->scc_op);
+    __get_user(env->cc_src, &frame->scc_src);
+    __get_user(env->cc_dst, &frame->scc_dst);
+    __get_user(env->cc_vr, &frame->scc_vr);
+
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
 }
@@ -372,6 +402,11 @@ long do_rt_sigreturn(CPUS390XState *env)
     restore_sigregs(env, &frame->uc.tuc_mcontext);
     restore_sigregs_ext(env, &frame->uc.tuc_mcontext_ext);
 
+    /* restore the condition code */
+    __get_user(env->cc_op, &frame->scc_op);
+    __get_user(env->cc_src, &frame->scc_src);
+    __get_user(env->cc_dst, &frame->scc_dst);
+    __get_user(env->cc_vr, &frame->scc_vr);
     target_restore_altstack(&frame->uc.tuc_stack, env);
 
     unlock_user_struct(frame, frame_addr, 0);
-- 
2.31.1



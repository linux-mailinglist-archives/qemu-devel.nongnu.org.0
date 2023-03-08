Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D19BD6B0947
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 14:34:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZtth-0004O3-Ig; Wed, 08 Mar 2023 08:32:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtrD-0001qf-MU
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:35 -0500
Received: from mout.kundenserver.de ([217.72.192.73])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtr3-00068b-3Z
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:21 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MhCq4-1qDvdj0aX4-00eJsa; Wed, 08
 Mar 2023 14:29:13 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 22/28] linux-user/sparc: Handle priviledged opcode trap
Date: Wed,  8 Mar 2023 14:28:51 +0100
Message-Id: <20230308132857.161793-23-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308132857.161793-1-laurent@vivier.eu>
References: <20230308132857.161793-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HRboGvqcF/pPfHWKzQAuCVU74wxe8LF0NMlPsEzCTP4q6CbS+Kg
 n19UtNTOfUdH69t44Fvarv2PR056e5829nVhyFZiVJXSlMkzd7dkEQbq+IXtBBxnHVIFccG
 N744Ke6wo3PYuBT6C4MpQcbJK5Ztr915dd9h+m6H54+HwBEqnNrDnfYb7Fj/iwcCXnlmtBx
 hm0l/s8zUkkNpKnr9dzIQ==
UI-OutboundReport: notjunk:1;M01:P0:ylWKgJsOWKw=;aZh68si6M7wBPTfjZULHKEyNtNr
 soToCcdmEC/sNUQZiuIC6r+VrwJK+OWTKdGg+/JDG5XzuDEXMlkItSRzQ6R3s8DVTPcaGgEAN
 jrNAkquz99ZFV0LcgMehSrTyXqzNCGBaLXb4lQQ6lvnZtj9+IRslvehl7Y4d+/d9SIvPxLJqg
 8If9yxzTumSTRZR0NszsCw8DKss66zNrbcLS5zJiNY/WASdhmFnOUNTL4wyuNjLIE5e+fas1j
 JOhXIwR0LjuefERV0ueTaD+LTIrETyvmKeqZbB9zqInce8E1dAsl9ibTS41AfjWi9YySbNy5G
 Cp9CYx+BXVA6CAgmzR0i96nkmElRnb3w8apYWEeJJoVNMRkuIhRi5DhnqcY2fHVnsGJ9/3m5A
 VODjTQNWjOOrVBR4Zt2hhfMcQiDGvSW1ooUy7/Et6MozD30NX7JmUujkKde5Wfp3Zqahw1ysu
 ZzVQKIyPcbaoqtEZmbBS5gqtH946L9U2TJwx/wAoEBnwP6ATutkZHVb0w/E3a8z6+5HpNow72
 18SJ+GkqCRl05XZmjDaKEkMDci5VEe9SKGmJvqOLEjG+CjNMrUQkCq+cHJO5QAc02qanhFBoK
 Tdt+FAFOp6X3/NQTWHxooYHGo9PafLKWK97RnaB9C06o6AcnSl3G5wiILkGbXI6z9Cd/y/W6t
 bc/rNM/WxTPSG58yqHcDyICFGen7X1M9GrzOGwWBlg==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

For the most part priviledged opcodes are ifdefed out of the
user-only sparc translator, which will then incorrectly produce
illegal opcode traps.  But there are some code paths that
properly raise TT_PRIV_INSN, so we must handle it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230216054516.1267305-11-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/cpu_loop.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index a3edb353f6fd..61b6e81459be 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -303,6 +303,9 @@ void cpu_loop (CPUSPARCState *env)
         case TT_ILL_INSN:
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->pc);
             break;
+        case TT_PRIV_INSN:
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->pc);
+            break;
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
             break;
-- 
2.39.2



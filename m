Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C15786B53E0
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:10:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakvp-0008GV-BH; Fri, 10 Mar 2023 17:09:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvm-0008EY-Df
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:42 -0500
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvk-00033C-Rp
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:42 -0500
Received: from quad ([82.64.211.94]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mr8zO-1qNY8q3bTq-00oHwe; Fri, 10
 Mar 2023 23:09:39 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 20/28] linux-user/sparc: Handle division by zero traps
Date: Fri, 10 Mar 2023 23:09:19 +0100
Message-Id: <20230310220927.326606-21-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310220927.326606-1-laurent@vivier.eu>
References: <20230310220927.326606-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:o2groeTZ8+ZVcXX/xdZJp5rwLZURwetlvvjb05fhozql/0czbYv
 5h1hK0x9wncC5Z9xcQysK8IUCvSITmoq1Qe4Yseduvc5k0DdJZizm5wB8selnKc0DLgaqVh
 81+W5GkcIp/HKW+P6Qyl3LydKaSlleOHnKVCknKkWpJOl1cWe777hjs0FqDY3XUxyfJhK4O
 lAtJhjUJRU7Kk0Tqvt0Pg==
UI-OutboundReport: notjunk:1;M01:P0:ah29MGxD33I=;a6SswT9F2eocKXfWVFmZIJLsrTc
 m7GlqVp73QhJ6IvZ+IKc3nvYEc0dx1DbNlmjMpwYNwDjLAMf59bcN70NL7V0AXQ9JMSmFWI+7
 6ZoLnfH7kZtiKpl3J/3AXjemxND/EMwJuB0+/n7gMI+aTQCxy6p8//TCedMyOyl7w872lakRK
 WUuUiSJoZPbQCBonVAheRuRyfFmhF4eIPTwCsIvPBL/Jn6+LL0pEJK/XEZ+GT2O+xUfl/Degv
 ThLfEyy/f0X5siv4hD3ztUnF2KUfXjIX+rvQt/nFPddbwWgDntVeegLILytCA9E6mOHskCdic
 LEN2PTucJZ/kUfW6bDse7+ya85Crhfm+t8yE0JhAJfXeeGr7VmMZZLa4TuUxcKoyWsQNRFIZU
 lZEW62TnK/dpSKnx5Q2JVY86N3o3XU+trY9lxDQ5+DRxV/DsacReqX1JKBwDTbz198AjCyj8T
 8ts/9Hbm8nBf5aOrUgLwX9vNcHxo+m70IP61552POXwiWPgwkLtceDYhjvSmva3UEUvwUbcIy
 fLnkTkJvYhEkclGByDj6nL7YfYn1PHfj2ydPBe0s9tkfILalz6EZMbw4TVfKqg0/8gnqy/J0S
 ZlcgZP5uve3AJTYE5a2pYm1jm+DNNPNs/w24Ngn6ERTaLyPdwgWazTKP/bMx3uhBMY//b/vcM
 qNg/a0DmY8oco4Biqi8tnS3CDNYE62Us9ZpIaAxN1A==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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

In addition to the hw trap vector, there is a software trap
assigned for older sparc without hw division instructions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230216054516.1267305-9-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/cpu_loop.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index c14eaea16370..e04c84286769 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -211,6 +211,11 @@ void cpu_loop (CPUSPARCState *env)
             force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
             break;
 
+        case TT_TRAP + 0x02: /* div0 */
+        case TT_DIV_ZERO:
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV, env->pc);
+            break;
+
         case TT_TRAP + 0x03: /* flush windows */
             flush_windows(env);
             /* next instruction */
-- 
2.39.2



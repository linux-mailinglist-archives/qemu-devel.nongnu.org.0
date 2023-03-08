Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AC46B0951
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 14:35:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZttQ-0004JW-U4; Wed, 08 Mar 2023 08:31:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtr1-0001k3-Vc
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:18 -0500
Received: from mout.kundenserver.de ([212.227.17.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtqx-00066O-Aq
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:12 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MN4ux-1pswAi0qMX-00J6mH; Wed, 08
 Mar 2023 14:29:09 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 16/28] linux-user/sparc: Use TT_TRAP for flush windows
Date: Wed,  8 Mar 2023 14:28:45 +0100
Message-Id: <20230308132857.161793-17-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308132857.161793-1-laurent@vivier.eu>
References: <20230308132857.161793-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qYeN/98GA+NYxRnwkmNYGUOlzKULnF6Rw0/ovNou3wr0X+3AO4h
 vlTKXRr3kKH80mPHPOHvkCpRkdwJcp6VcJKsP6RGtLbQI5zQgyTHsZg00/rksEeGbA2vUgf
 IAz1clgW2rGYZHfxljnPOBLQYQMJPEUZdweya6IIv77ag0fzErcp2ErddNcWG0KEcrJNqCe
 pc+EgkAGBMuVf8QFsv2FQ==
UI-OutboundReport: notjunk:1;M01:P0:QjSPUjZxwFg=;hz/Ue82yjk/W9kIx5u83czCGIYs
 zN6DB8ZUr0Ps7IG1XkJHa1iwT5PhUI2UhHVMSvFduqtT+JsX2SZuS6VNISQDI6jge4stHNKih
 BvuKrd0ac4BRy+EZMVkx457FnCvmvzCRwtxYyExHaCuugK49FvJISo53uAUbgmGWD8+ibULS1
 njhktL/V44/UQsxoyaMYqz8tFcF+cln598ZrZq6sl3Hc1aoUSDVsWKPEkKz9vBIQcVn8MO93j
 q5ubLOYJA3cxQz0UlNH5OzorPXvZVc3N1cis64rmVgJ+9M8vj5hXTxlcUdcGhVaS99iOf5K1g
 Wq7itVDgfMuyL495rnNg+tbNp66sRpcagFIqw/XZfDmoekFl0gv+sObSN4Ec5Ax+rpCgJVvf+
 k2lwWenitTAFDIDeJz4vO8xJixcFSyot5aUBQ9p9IvTPHaimDg9rBVn61mfsz54qkTBswbg7r
 SjELpCLAJ0lf2q0Lwq8KnR21V8+oUyYBX5A/kuusgLcJrK463PLDdCDzjPRcxU61lTn93fUPc
 4TNyLhSTO1ovZ3wv+GLgpUD322fSCxUfOaXalnZMHqCh1rYjbmeRVqNzl+PYP9vWuTaCJou54
 hsyV5Nf5ymywt+AZd2PXZyBF09sM6BC3sr4P3k5YEmIbVHO93+yKIRUH/hEHSvg0ckxeyPc9h
 XkrVomcMmCAZlTi4oel+ra1ecG/EwEIILpLj1agVeg==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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

The v9 and pre-v9 code can be unified with this macro.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230216054516.1267305-5-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/cpu_loop.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 051a292ce520..e1d08ff2045c 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -196,15 +196,14 @@ void cpu_loop (CPUSPARCState *env)
             env->pc = env->npc;
             env->npc = env->npc + 4;
             break;
-        case 0x83: /* flush windows */
-#ifdef TARGET_ABI32
-        case 0x103:
-#endif
+
+        case TT_TRAP + 0x03: /* flush windows */
             flush_windows(env);
             /* next instruction */
             env->pc = env->npc;
             env->npc = env->npc + 4;
             break;
+
 #ifndef TARGET_SPARC64
         case TT_WIN_OVF: /* window overflow */
             save_window(env);
-- 
2.39.2



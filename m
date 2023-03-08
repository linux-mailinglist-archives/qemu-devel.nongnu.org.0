Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D80C6B0950
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 14:35:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZts7-0002K6-NQ; Wed, 08 Mar 2023 08:30:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtr6-0001lE-Mw
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:23 -0500
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtr3-00068u-1c
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:20 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MkYsS-1qHETk08li-00m0zo; Wed, 08
 Mar 2023 14:29:14 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 24/28] linux-user/sparc: Handle coprocessor disabled trap
Date: Wed,  8 Mar 2023 14:28:53 +0100
Message-Id: <20230308132857.161793-25-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308132857.161793-1-laurent@vivier.eu>
References: <20230308132857.161793-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QjSEjlT2k3w0y9I6CZCQZy/QUbx6GQ5cyO+X8+G6+wmviEjBq+U
 52XkN6F3W5eQze2vPB5f9N0CrrUHRveaiyhb1Sz5ZgEFf0BEerHiLkDAGiZFSWoWsDjd4yS
 ehaRvtXui0IMXj+/YbrIv+B4HmrHx3jBu/5tQSUbkYTswDvWIGTTFMPitHPKXys+xRE5yPN
 AepqqMztB/9OxewhxF4rA==
UI-OutboundReport: notjunk:1;M01:P0:E5NAmAY5gBc=;V8Z3gfQXhWoSKY3pm3goizdME4c
 4jCUdl2GnNIRpcD9yfvf4xyEsFgreezBGTpdpBXYPJfhASNcP2ll8/kOhTlYT64CDWa0W3pny
 wlir32dPbOj0N3LHDMKthD64ctrDVkAfjxLUmNTyCEDYzZzUjTaa7nu6CG3ve/nJhsucbF+E5
 B6lhSYJtR9lL0gKbJkxDWOF4YWeV+AfU2CH2YJ+xytUYkn2U51y7/Igfngg3EKcwBBaIgO+vh
 oHlcaVGfjTngYY3VsuQ+TCyjpje+airZUK6w/4rTMd4ix5MuDTiIhcCj1BuWnMu2ItCUgdD+g
 If+JYMDrPMoKz3LMvoO5XtFQezRCbFFpRtQTRVldkAMZTV4hYpkTaVqKKqdjoMeVqkKTtGEp1
 7x85Qce6mzmJztCHwR6wMHCtvbBncDYdVZ2ohOA4lKnR8baKdjkrxsZfMOo8J5gZBL5/HT8gJ
 IXCBpfrQlN/1oS9jZnpBOUM1JfNdzpQ+4mEh0xGkflodTdOjpzUXNDWQD92t/UPKH5Y1DIDJC
 DtorbEBkLPaXUWkJFR3lnFSGlBBMAHpM0beMlxiOExO6Ch8TsRr0YbN4Vlex3M7lQrACaaXac
 NRXjcweiJmpEwZ4iMVYrPhWMT01lYvIAqHE/YuaY+I6MsE4A3+Syg6tdfl8PaRqAUJnGsUVpc
 ljoJ9g51PvnJXziyBFsBX4a8UUx8No1K/COqwwMX6g==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
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

Since qemu does not implement a sparc coprocessor, all such
instructions raise this trap.  Because of that, we never raise
the coprocessor exception trap, which would be vector 0x28.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230216054516.1267305-13-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/cpu_loop.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 43f19fbd9141..bf7e10216fe1 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -311,6 +311,10 @@ void cpu_loop (CPUSPARCState *env)
             /* Note do_privact defers to do_privop. */
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->pc);
             break;
+#else
+        case TT_NCP_INSN:
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_COPROC, env->pc);
+            break;
 #endif
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
-- 
2.39.2



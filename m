Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CC94206F9
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:03:46 +0200 (CEST)
Received: from localhost ([::1]:44564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXIwr-0003vb-Ki
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeP-0004Ia-VY
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:43 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:46667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeL-0004rI-Pu
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:41 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MIyiY-1mD1wZ2Sew-00KOT4; Mon, 04
 Oct 2021 09:44:33 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 18/26] linux-user/ppc: Simplify encode_trampoline
Date: Mon,  4 Oct 2021 09:44:13 +0200
Message-Id: <20211004074421.3141222-19-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004074421.3141222-1-laurent@vivier.eu>
References: <20211004074421.3141222-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:deIQL4aMLtFiJv9LRvDOHzDeVuluamEtc++PCU1i7nnpBLCSOwi
 2CDVXC/K7ISYCacJElVCoSmUuPqRK0Bit4/Hj3gABM87kqx6BSC1IML2X7ue9H3AZRU4oac
 m0egFsd1TZXW0lQPH1qcZToXyX1EkvgUPf0u098uxKlUZy6YBDUwnGnZQjZrJNgfbCbP0iU
 SxqOFwYtSG1VTaCD0xG/Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Pmn51ffgwOA=:bsE8F6YdstWAJZg57eG8zw
 yLXqSLbYJsfAmtejfBAYW5c7wNyLrdv0X6+lm+GDZKIx4VA0/3oKl+7RGGxBIShJ0bLkoTee7
 Y0Y7zTv1TAC1l/5tGssnCFWr/LFyHkUZySrgxDTkJZpImZ2s0ZOM7wuQS/LbsT3qabgdi7pCr
 OBBVy22pXNbEAZDODHhqw+qLiD5+StZAzombd45u9hOn3cCmrTJTLh+uq59JMlvBAAy2EeAzT
 US+9o+d5Y8luiNmh6+mIx1Dub7YPxIuff1LddlivhLrv5tgoLFX9onB44G84FK8W5Ftdmv4kQ
 ewj57vy5nyF0m3kfrnVMbxBAJnTctDlaXxm4xP7c09aocOmwbyGJsEVQaWKo7wb/D7DhjMuKV
 S7gOx3dxkJyymdZBC2HPge0YS7McFKhdWxvpYd+/yvyuZTIz4FiaFduzt46EQctOOKf8rJh5I
 IUGQmUD5Mo5jqhfZa3BGUeUk3rVp15YI3dzPZ1DtjZYpQH6e8pLkcjwGInyD3iZgDMQGY75AY
 YDi1XcY1PvBZU0HoDb85hmPdbTJ0gaFOxgyzOkVbKdGEYTpfGXATvPapmojsAQnRdDHn0inoh
 1KrQnW1dHPuZL/FmTk8UirBJQ+Jnku6nL36F4vKeRs+sk1IAWKUYpzvY9l4pnCdlPDoOgEQaS
 xAzDFIUjJhJbOBgHDBvGxTxMfRsMUY2LJPN6VzrBPXNNV9LX883N8dBCX5t1pZ8XZqFFWQhx8
 h+Qj9Da15oh1FegDJBcTAxhfm8SqaQXMlY+BxA==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The sigret parameter is never 0, and even if it was the encoding
of the LI instruction would still work.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210929130553.121567-19-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/ppc/signal.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index e4d0dfa3bf75..77f37b9f0131 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -309,10 +309,8 @@ static void save_user_regs(CPUPPCState *env, struct target_mcontext *frame)
 static void encode_trampoline(int sigret, uint32_t *tramp)
 {
     /* Set up the sigreturn trampoline: li r0,sigret; sc.  */
-    if (sigret) {
-        __put_user(0x38000000 | sigret, &tramp[0]);
-        __put_user(0x44000002, &tramp[1]);
-    }
+    __put_user(0x38000000 | sigret, &tramp[0]);
+    __put_user(0x44000002, &tramp[1]);
 }
 
 static void restore_user_regs(CPUPPCState *env,
-- 
2.31.1



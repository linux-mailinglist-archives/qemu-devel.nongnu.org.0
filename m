Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 962D34E6048
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 09:25:02 +0100 (CET)
Received: from localhost ([::1]:60966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXImD-0000LT-LB
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 04:25:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nXIhn-0005xg-SP
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:20:28 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:39315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nXIhl-0003Ps-Qv
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:20:27 -0400
Received: from quad ([82.142.12.150]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MyK1E-1oGcGZ3Ji0-00yjHa; Thu, 24
 Mar 2022 09:20:23 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 08/10] linux-user/arm: Implement __kernel_memory_barrier
Date: Thu, 24 Mar 2022 09:20:14 +0100
Message-Id: <20220324082016.3463521-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220324082016.3463521-1-laurent@vivier.eu>
References: <20220324082016.3463521-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Z/NlUyply1+7e9wKf2c6YVxP2JU/sJwneqMS8vQBL2bQbEIfwk6
 pgUQ8zs5Hs5gdCuZT3iPrwKRuxHd5JIxHvZtkU7mOVrdO2K+xA02QA/AC2Ku2doUEWj4o8S
 rQijBXVyNebwx7Y7gxMVMGxnH1ritZipLKvPZhnd3VGK7QTZt0n1QHkyCbEDFElyxZNemuG
 WGW4T1Tj87OZNIb99BUoA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:d4ljv/EYbSw=:W04w696d/mx9U0qugvLbPC
 BhAhjaIeIC1LcKaRAgC7t+PJh0WRbAKLzibTB5UAaUD1ckGRg5EUAM9vW6JzGIGKwqa9lO404
 YEh/2FZFei7BC7jWN9RGMfTgD5AZHGgyI155QzzEFg844/xp+Gg89r79eDIc8DTT9RMFwi3vM
 gHdKZR3oHbYA+7fMGHeKzQrVgfh8xAEg9RTeL7qWD022WnEOayWuzFDu/lGQSdsGDU71Hz7xh
 o8UmjFjDiZYnvtO8YFx2jMVxk0zfv9p6hl7UMLCzd7IMtlmzVuUDVrtD2DsaCZpCt7a4M3aCK
 eKvl+SWmhLr+5s9EamzNNyjlYrPLb7s6mHyx6XZJhgdLiwcQyL/Vka+oakHIb6tN4/BGG1NxW
 t073OkpcvAQWGuz30nvSrNxWT70BtuXDZFuJDNOFDguWrKbcbbq+14pmtjr+gTs7q4P55zO9O
 5WEBdgGJYYGFthr3rytPU4Ckoe75JnAsHtUUa1MwadRmd6sPf2iRpdMDy/x68bl095VEdCOKb
 TQqrdxgzWRS1ImkGj17dprCOfRqgOJfCEUgkpr99HIAdDC+hM1Fhy1T3GKleRmiyIwfw2pSc7
 5GzPRsCYh2vGa8WKEpWAf6qF86FU0NdFxE0Sh5rOLxvUpfjS3qG8tcjBcGZuy6+kvJtvttFGa
 xrCJ7sdrmvpiWR7ShRELhsgKx/bf6IWBasEICeuZdGyEclDtJS4iu0yjcC+92t72+Nsw=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

This fallback syscall was stubbed out.
It would only matter for emulating pre-armv6.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220323005839.94327-2-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/arm/cpu_loop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 032e1ffddfbd..a0e43b261c7b 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -158,7 +158,7 @@ do_kernel_trap(CPUARMState *env)
 
     switch (env->regs[15]) {
     case 0xffff0fa0: /* __kernel_memory_barrier */
-        /* ??? No-op. Will need to do better for SMP.  */
+        smp_mb();
         break;
     case 0xffff0fc0: /* __kernel_cmpxchg */
          /* XXX: This only works between threads, not between processes.
-- 
2.35.1



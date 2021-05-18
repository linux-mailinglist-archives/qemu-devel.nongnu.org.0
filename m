Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD819387142
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 07:33:15 +0200 (CEST)
Received: from localhost ([::1]:43480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisLy-0001CV-P7
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 01:33:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKQ-0006dx-EG
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:38 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:46965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKO-0006qC-QV
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:38 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M5xDJ-1lodsz1hQh-007TiU; Tue, 18
 May 2021 07:31:34 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 04/59] linux-user/arm: Do not emulate fpa11 in thumb mode
Date: Tue, 18 May 2021 07:30:36 +0200
Message-Id: <20210518053131.87212-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/UzUKa42WJDV8CABAfIcmjoBrnLxVJyvB4NSCtycYEbpsVwVhqM
 Zc0MWUdsk51xpHsIlaeC3a2VaPcZuQVk9mG7nO1ka06Yp1Ydn2PnELWz1Dje1XIzJa9ANCz
 RG+PxdGHfqp5+0q0JlEqcaysMI/S1cfnnOj1gehx2AM9chJvS90fWQ+JtqouvWQ2viOXpAQ
 MwstO16PUwDt57Lyj73FA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Rk2P157s19Y=:U5BSHc2T/biMOQpEdAf0pa
 K6MbBJqdzyloxyrl6prLXSHW5nR8KHHt6r0E4BuxGXaz10JfVFvoQLlnbngluxzb8iqd0mv5O
 zcGRhmWXuqRl/oo5wAuMSY2b1AqwmNmbQriqQn3Vngt0VK4wqfnwOzXBF5SGvCWem8D+Wudqr
 75mdcjqP1phsFms/KZ95kh3TU1hCAuVwzZrTtKu6vbB+eOQTfmEThqXXka/wn8kTDWOxqwTNi
 xUr0elv4oDaF6Uxr9fuqyOJ+fpZsOHt3Bu8IrsEHwj3afMojwIXNmesyLhrS9Vz3a6EFiSvz0
 CMlQVdKn2CDoyAxKCcBOVGWHkXFcw7dMTMOl9xbyFaLOODspGmiT6rcgvAI+j6WSx3kc/dxdP
 fnfsoUU5SKwjO8G+y3SL3mCqsptw4KerieQuPHRJatssaXnDvodiGuxF9T24/MTX4hL7j0l7R
 MHB2nhcEtSscmybbt2FZaL6xYLKff9SxStIQ6Kcq+Xs4E+hczQcoIu4Pe9jOLcxGHCD9XXIMt
 dXrJ4jW/eefwedW90G5SnQ=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

These antiquated instructions are arm-mode only.

Buglink: https://bugs.launchpad.net/bugs/1925512
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210423165413.338259-3-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/arm/cpu_loop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 106909c7d880..e2a1496b9fe7 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -347,7 +347,7 @@ void cpu_loop(CPUARMState *env)
                     goto excp_debug;
                 }
 
-                if (emulate_arm_fpa11(env, opcode)) {
+                if (!env->thumb && emulate_arm_fpa11(env, opcode)) {
                     break;
                 }
 
-- 
2.31.1



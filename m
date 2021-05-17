Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B59FB383C21
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:21:51 +0200 (CEST)
Received: from localhost ([::1]:36684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lihsD-0006M9-F5
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:21:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlN-0005w9-GP
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:45 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:35047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihl9-0004Kg-Ei
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:45 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Macf4-1lB1dW00V8-00cCQP; Mon, 17
 May 2021 20:14:28 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 04/59] linux-user/arm: Do not emulate fpa11 in thumb mode
Date: Mon, 17 May 2021 20:13:29 +0200
Message-Id: <20210517181424.8093-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:d96SM/HLBvhtLhPbYHHN+LETS6rwnq2tQ60xxhuBCndKIvxL2nA
 ySOo64RqgZrpjPtQywLgZXWJCSSUuP+mwf/dfisD4Qaw7PYMcVgw6HT54Sm4bN/jkeWRRbJ
 dJ776HDHuwErUnwTNH+Fo7dfSTMP9o8TwKK3dnR33pugIPv9Pgy6g2AK6KCOt5I3mCRZqTW
 uAamgr3Nra/eMQ+LvcTQg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MaP+6qbNF+0=:cKBPXUikNh8K7boY4BahJU
 A5eYWA1ouL/6NxQAborjI2E15aVz0v3Aj4TRZEt/KMnCk62nsdq6kRLNvInuxAAmeoqMZRbIO
 8GBVzP3csrkaoF+C7T726DQQ34qDBcD/4T0BMU4EOQo4w1eQxi7/YIfngV7AAizEi+1GQuf0Z
 GPLad2q6GIscqhq7wdMJH1qBZvV07/IQ7Suwahs/OD5k4pZfE3Be7G1J8TAWo5eaKDzKt71QY
 DUGX9DTUXKRYZPI+4qb4rulM5BSq428VECF0rYN/mDpyHMdmVPpLstuTLzxOjZT586ft6NlKM
 ZdcaKYrJ9PN7LFIC1LCVHaQvBuifVW2fdqP5P4qcx16asZ78Gs4Jxpc3CbH4sf1Rs2s+61T43
 2mTRe19coBhj9hCpwmIN7YHSwj8nd2IQOonFct9296xSOavmWS04ORNZUi2Kw8yMgLLfnR/uF
 G2rGTDbsv8r5Mo0f+QfAspPkfF/gzu/QU9SvHv+BXW8ypunImDW+DNoraZ2GphrYk/b9711Cq
 5XPs3Z6+Ysc/wYt2IPAhiw=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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



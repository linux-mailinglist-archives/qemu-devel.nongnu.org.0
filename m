Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B777D410E7E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 04:48:22 +0200 (CEST)
Received: from localhost ([::1]:44312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS9Lx-00086n-O5
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 22:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS9It-0005D0-5d
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 22:45:12 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:36706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS9Ir-0008Co-63
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 22:45:10 -0400
Received: by mail-pf1-x429.google.com with SMTP id m26so14907822pff.3
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 19:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6vZb5MWAv/fM2L9STadGzJOqVrgkaOYinJFwq93jV/c=;
 b=lKIx7rDq/+M2DK6H7v1tQhDLkae1ND9EkyyKSubRMo6LZt6CGZxLX7aeMKwb5tzFHd
 VQhI9SRUHKGzPvVbM9kvkEbA9IJlXGEP51SCWX0c4HeVvAi1Ymy1RVGNRaPBuEbp1Wnf
 1KzsmTB86ibaUJkimv3hekUTe/6qiS9lvd9H7RClVV/J51c9wF6Ce6bzkDyHXZyjLLgb
 2dGbqNhtEscguz4BjS66wGGL/IBP4bdDuaBNtCf/3K//69yWMtNCc3wm/AIEh2BUErW/
 TVxFzG2vfI4QtVn5ag4Si6F8cQ+RIB8Ko1/iimKmlpHmZOpvJ09eixnb6pAMnhrBDtpo
 U4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6vZb5MWAv/fM2L9STadGzJOqVrgkaOYinJFwq93jV/c=;
 b=gMknAYHtSv/Y6Nt/rL3zmByZw7B/ZT3eG7brGa2lGAmPKwOLrLHM6R2fw42B6atmAc
 jTu9/PLOy0gm+f7XYSapPfZP3c3/UHhZiezhiPQF039xQFjLKbfLLdwqN/cE+CO5U7Po
 jmui83prOLqbMHBqY7R238GcGmN0xrBbZlN4rYfEo5iveFkRDqfgHweRJ4f/JQnTgBUa
 1hQ3pmXxDXKaO0LbpWmFeLq3evkwPop36vA6kba8Kq2lc9lPHXczyxkVy1oL+RUNqUZq
 vOBfpMilJEbRn8cSCaKgKUDcdzRTNP4t7/NVDPzl32AyjnNy0PzzCeCgtW5KLYfqDhun
 qqRA==
X-Gm-Message-State: AOAM532Y/AidxMKpPj//Z2WMs1Yuu1esFt+BXSmw58FMoBxiPgiqsiGw
 KCTmCf8RqvFGM94ERMEU+r/LEMLv6CniIg==
X-Google-Smtp-Source: ABdhPJyEmzo+FxNJsvxXEz97ejh/kna04BAcK6kd2itv9o6Cz36SyGT1jletFPl2+36B5ttUAeD/HQ==
X-Received: by 2002:a63:f5b:: with SMTP id 27mr12402253pgp.302.1632105907798; 
 Sun, 19 Sep 2021 19:45:07 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id fh3sm16164767pjb.8.2021.09.19.19.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 19:45:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/6] linux-user/arm: Report SIGBUS and SIGSEGV correctly
Date: Sun, 19 Sep 2021 19:45:00 -0700
Message-Id: <20210920024504.625965-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920024504.625965-1-richard.henderson@linaro.org>
References: <20210920024504.625965-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pull the fault information from where we placed it, in
arm_cpu_tlb_fill and arm_cpu_do_unaligned_access.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/cpu_loop.c | 39 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index d4b4f0c71f..1377a80620 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -24,6 +24,7 @@
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 #include "semihosting/common-semi.h"
+#include "target/arm/syndrome.h"
 
 #define get_user_code_u32(x, gaddr, env)                \
     ({ abi_long __r = get_user_u32((x), (gaddr));       \
@@ -279,8 +280,8 @@ static bool emulate_arm_fpa11(CPUARMState *env, uint32_t opcode)
 void cpu_loop(CPUARMState *env)
 {
     CPUState *cs = env_cpu(env);
-    int trapnr;
-    unsigned int n, insn;
+    int trapnr, si_signo, si_code;
+    unsigned int n, insn, ec, fsc;
     abi_ulong ret;
 
     for(;;) {
@@ -422,9 +423,37 @@ void cpu_loop(CPUARMState *env)
             break;
         case EXCP_PREFETCH_ABORT:
         case EXCP_DATA_ABORT:
-            /* XXX: check env->error_code */
-            force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR,
-                            env->exception.vaddress);
+            /*
+             * For user-only we don't set TTBCR_EAE, so we always get
+             * short-form FSC, which then tells us to look at the FSR.
+             */
+            ec = syn_get_ec(env->exception.syndrome);
+            assert(ec == EC_DATAABORT || ec == EC_INSNABORT);
+            fsc = extract32(env->exception.syndrome, 0, 6);
+            assert(fsc == 0x3f);
+            switch (env->exception.fsr & 0x1f) {
+            case 0x1: /* Alignment */
+                si_signo = TARGET_SIGBUS;
+                si_code = TARGET_BUS_ADRALN;
+                break;
+            case 0x3: /* Access flag fault, level 1 */
+            case 0x6: /* Access flag fault, level 2 */
+            case 0x9: /* Domain fault, level 1 */
+            case 0xb: /* Domain fault, level 2 */
+            case 0xd: /* Permission fault, level 1 */
+            case 0xf: /* Permission fault, level 2 */
+                si_signo = TARGET_SIGSEGV;
+                si_code = TARGET_SEGV_ACCERR;
+                break;
+            case 0x5: /* Translation fault, level 1 */
+            case 0x7: /* Translation fault, level 2 */
+                si_signo = TARGET_SIGSEGV;
+                si_code = TARGET_SEGV_MAPERR;
+                break;
+            default:
+                g_assert_not_reached();
+            }
+            force_sig_fault(si_signo, si_code, env->exception.vaddress);
             break;
         case EXCP_DEBUG:
         case EXCP_BKPT:
-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 171B759C7BD
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 21:01:50 +0200 (CEST)
Received: from localhost ([::1]:49034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQCgF-0001Cg-OW
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 15:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ9k6-0001w4-Py
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:53:35 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:33584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ9k4-0005Ko-QF
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:53:34 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 m3-20020a05600c3b0300b003a5e0557150so6023742wms.0
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=tWxgdi7/uu1+ANLOaFNvQeb6l6xGI+BRWt05JvH2Mdw=;
 b=PPPM7Iwh7rk51D6kdOrW8D5NUAM0wdD8gGrR67J2qEpI4w3QshvOLP2tdiF61WXQXq
 mGqADn8bawypoSzxY6SjZGPt/OGcB8oUvemfdL3MxujGA1kbCz/cKJqNW3cTFpyOR2zl
 5ltE+06aahY4veklRg6KBxm5J/HTEHia4PEAY/JgqON17/OiSD21lwN7tTX1lXwmO55x
 fI2ahaENOCZSTbA69mDtjc64HwJ7cInzCvrYVMc/WgCObNHqnzmily+NB41szw+5d0P5
 V2tCpG06J5GPbHhMXhV1X3ZR9+90EWWYTYpHlC3KwjEzWFCnkI36wmbD+YKhkbFMoPZa
 4qdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=tWxgdi7/uu1+ANLOaFNvQeb6l6xGI+BRWt05JvH2Mdw=;
 b=wyZP4fT/uSmReM1oJJ2L4f0FKTk5jkqvELQy/NpJvZUQyiGIlX/eHAcBXbS4AmYL8V
 gALspZlff38nQKcXfgFNyAYVTLx+TWUnfpX+QSFAaZ4UutzMvhf4bbst/ti/TRF96c0C
 D0Fa8reUPnC5PDTG5JVckXzvbH1dbeSaXTEPfDoyPzrNlPiEKMoJMrslGfGBGaiFqM5r
 WYpWB16fRDVcEW0MqpBKZAj4s/zm6cUIxBwyMgVsbO4S559JkuAKi3v7n0vML5UbKKAb
 8SXbtt2zc9GSB5tswBQxCcaHed++2NJ+vhJYebm3mLrNjjgdN+EF1C3UY7iHx/I3v2ko
 1bxQ==
X-Gm-Message-State: ACgBeo3yMO2FbBAt2/Vt5JxBm21fWqBVLn8Yf1SyUDZe9BHzHGB5o1vl
 cMyH+SX4DetkSaR3Ud5iEQ1opbyT+bWcgw==
X-Google-Smtp-Source: AA6agR6TjnePzHyEDDBx0lt4HgWmB7GrxwbakccuWJ4UlH160VcgIUAYTuqvOwd1HxVthcSTlldupA==
X-Received: by 2002:a05:600c:1990:b0:3a6:2a00:3ddb with SMTP id
 t16-20020a05600c199000b003a62a003ddbmr11806956wmq.72.1661177562935; 
 Mon, 22 Aug 2022 07:12:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh16-20020a05600c3d1000b003a3561d4f3fsm15184908wmb.43.2022.08.22.07.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 07:12:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Furquan Shaikh <furquan@rivosinc.com>
Subject: [PATCH v2 7/7] target/riscv: Honour -semihosting-config userspace=on
 and enable=on
Date: Mon, 22 Aug 2022 15:12:30 +0100
Message-Id: <20220822141230.3658237-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822141230.3658237-1-peter.maydell@linaro.org>
References: <20220822141230.3658237-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The riscv target incorrectly enabled semihosting always, whether the
user asked for it or not.  Call semihosting_enabled() passing the
correct value to the is_userspace argument, which fixes this and also
handles the userspace=on argument.  Because we do this at translate
time, we no longer need to check the privilege level in
riscv_cpu_do_interrupt().

Note that this is a behaviour change: we used to default to
semihosting being enabled, and now the user must pass
"-semihosting-config enable=on" if they want it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/riscv/cpu_helper.c                      | 9 +++------
 target/riscv/translate.c                       | 1 +
 target/riscv/insn_trans/trans_privileged.c.inc | 3 ++-
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 59b3680b1b2..2b84febf275 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1342,12 +1342,9 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     target_ulong mtval2 = 0;
 
     if  (cause == RISCV_EXCP_SEMIHOST) {
-        if (env->priv >= PRV_S) {
-            do_common_semihosting(cs);
-            env->pc += 4;
-            return;
-        }
-        cause = RISCV_EXCP_BREAKPOINT;
+        do_common_semihosting(cs);
+        env->pc += 4;
+        return;
     }
 
     if (!async) {
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 63b04e8a948..f9e6258ec5d 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -28,6 +28,7 @@
 
 #include "exec/translator.h"
 #include "exec/log.h"
+#include "semihosting/semihost.h"
 
 #include "instmap.h"
 #include "internals.h"
diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
index 46f96ad74d4..3281408a874 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -52,7 +52,8 @@ static bool trans_ebreak(DisasContext *ctx, arg_ebreak *a)
      * that no exception will be raised when fetching them.
      */
 
-    if ((pre_addr & TARGET_PAGE_MASK) == (post_addr & TARGET_PAGE_MASK)) {
+    if (semihosting_enabled(ctx->mem_idx < PRV_S) &&
+        (pre_addr & TARGET_PAGE_MASK) == (post_addr & TARGET_PAGE_MASK)) {
         pre    = opcode_at(&ctx->base, pre_addr);
         ebreak = opcode_at(&ctx->base, ebreak_addr);
         post   = opcode_at(&ctx->base, post_addr);
-- 
2.25.1



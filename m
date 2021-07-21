Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 955173D0940
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 08:54:47 +0200 (CEST)
Received: from localhost ([::1]:45458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m667y-0007by-LF
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 02:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vx-0005DL-7V
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:23 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:45921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vu-0005fd-AS
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:21 -0400
Received: by mail-pl1-x62b.google.com with SMTP id p17so468279plf.12
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 23:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=e1o+LTNCDTCEYnibXAgW5W5UXTzPq2g9X5wgbhLcsnA=;
 b=psWLD83XfCnv/48oXiTpKcnHLDdKbNCntNwLw1FYVCdo5BQixW0Rn+8pnBnQVeWb74
 0FxoMniLPZMUIYdLEkFxOH+07bBdlm3TxbeHwXfNzMMOjqYQk4jDhloyrFPtfOA3FiGt
 K7vnSPsIYLHO4VokhzvUMb6XBGd40Tyjp1nuNOUNiYFE/N4R1n0dFlCgzs6s6i4aSV+L
 HQGnZV/wm80yUlE5b14plMwMYFfTG4tiXp5h5vTzl6jxafk/Xv24Fw0G3Q7Ih+1jYsc6
 zvSURAPg86u9WaCgVjm3D8QIgYAMykkvKfIqNGT2SWCXkXLw1psuDkVUSYIlTJrU5x+L
 p2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e1o+LTNCDTCEYnibXAgW5W5UXTzPq2g9X5wgbhLcsnA=;
 b=E6h9JIdWPQdqapCDdJAVPx9DP5JyCJAX32CPZgkUcMYMAYj4cdTvf+8vnBWXtOaLal
 XjrUtI4XU0aHiTB8F85o2me1rIqFtbGKLE8tao5O1UtUQqJQKjGb0GXqRDecz7LUFtuS
 UmTN8YhwWWCHrBGCo0y3E9IwbPC+28iOzAT8cdzFIRDNXbz0HUyJBe/K8yz7MCMf3R7H
 VgfVjHGDgWCxnpMnhDGK/0yTY496GJbv5x4TAufhEimYh+oU8QHuWdMnyqdZTgHu90fX
 eNgeoP057gDs5/RWlh7mFxADlIlTDnL0C53SzdXsAjFZoOh6niGCKUA5nBMqQb077e4+
 yx2g==
X-Gm-Message-State: AOAM533awoT0Yb7O+rrbC+UdJ/AIquo9fYUYT8DVFKGpcO74OTEVh8CI
 /jUuAl/f7mSbXZnkVqXynBTdK+uOchwssQ==
X-Google-Smtp-Source: ABdhPJyeW/mP0mzIPV5xci8UpiQc3TTM0p5W4rJLK6DYJRK+gQhca85oZMZWDH83zkfe3E2zG4MVaQ==
X-Received: by 2002:a17:902:8347:b029:12b:95e3:3181 with SMTP id
 z7-20020a1709028347b029012b95e33181mr7453613pln.23.1626849737096; 
 Tue, 20 Jul 2021 23:42:17 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id q17sm21146132pjd.42.2021.07.20.23.42.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 23:42:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 19/23] target/rx: Drop checks for singlestep_enabled
Date: Tue, 20 Jul 2021 20:41:51 -1000
Message-Id: <20210721064155.645508-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721064155.645508-1-richard.henderson@linaro.org>
References: <20210721064155.645508-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GDB single-stepping is now handled generically.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/helper.h    |  1 -
 target/rx/op_helper.c |  8 --------
 target/rx/translate.c | 12 ++----------
 3 files changed, 2 insertions(+), 19 deletions(-)

diff --git a/target/rx/helper.h b/target/rx/helper.h
index f0b7ebbbf7..ebb4739474 100644
--- a/target/rx/helper.h
+++ b/target/rx/helper.h
@@ -2,7 +2,6 @@ DEF_HELPER_1(raise_illegal_instruction, noreturn, env)
 DEF_HELPER_1(raise_access_fault, noreturn, env)
 DEF_HELPER_1(raise_privilege_violation, noreturn, env)
 DEF_HELPER_1(wait, noreturn, env)
-DEF_HELPER_1(debug, noreturn, env)
 DEF_HELPER_2(rxint, noreturn, env, i32)
 DEF_HELPER_1(rxbrk, noreturn, env)
 DEF_HELPER_FLAGS_3(fadd, TCG_CALL_NO_WG, f32, env, f32, f32)
diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
index 4d315b4449..11f952d340 100644
--- a/target/rx/op_helper.c
+++ b/target/rx/op_helper.c
@@ -451,14 +451,6 @@ void QEMU_NORETURN helper_wait(CPURXState *env)
     raise_exception(env, EXCP_HLT, 0);
 }
 
-void QEMU_NORETURN helper_debug(CPURXState *env)
-{
-    CPUState *cs = env_cpu(env);
-
-    cs->exception_index = EXCP_DEBUG;
-    cpu_loop_exit(cs);
-}
-
 void QEMU_NORETURN helper_rxint(CPURXState *env, uint32_t vec)
 {
     raise_exception(env, 0x100 + vec, 0);
diff --git a/target/rx/translate.c b/target/rx/translate.c
index a3cf720455..5db8f79a82 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -150,11 +150,7 @@ static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
         tcg_gen_exit_tb(dc->base.tb, n);
     } else {
         tcg_gen_movi_i32(cpu_pc, dest);
-        if (dc->base.singlestep_enabled) {
-            gen_helper_debug(cpu_env);
-        } else {
-            tcg_gen_lookup_and_goto_ptr();
-        }
+        tcg_gen_lookup_and_goto_ptr();
     }
     dc->base.is_jmp = DISAS_NORETURN;
 }
@@ -2331,11 +2327,7 @@ static void rx_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         gen_goto_tb(ctx, 0, dcbase->pc_next);
         break;
     case DISAS_JUMP:
-        if (ctx->base.singlestep_enabled) {
-            gen_helper_debug(cpu_env);
-        } else {
-            tcg_gen_lookup_and_goto_ptr();
-        }
+        tcg_gen_lookup_and_goto_ptr();
         break;
     case DISAS_UPDATE:
         tcg_gen_movi_i32(cpu_pc, ctx->base.pc_next);
-- 
2.25.1



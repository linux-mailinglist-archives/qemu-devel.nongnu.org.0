Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D400E6A280D
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:03:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqQG-0001k8-S2; Sat, 25 Feb 2023 04:00:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPz-00013O-3t
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:36 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPv-00058u-2F
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:33 -0500
Received: by mail-pg1-x531.google.com with SMTP id q189so899515pga.9
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DKCOLyI/wsJHJKYRWjsEmHI6WWtv0JONwA4WRgdn8Pc=;
 b=jBeBhtobS2gdLgParHHPb0BeEM3/ReBj82tHYI78KaGSmdf5nfAfmjQEVXUZjM5nKM
 tMlyA1pUOcdJb8rLC5nyUbLtDw9sXuu+pICXuUbHX9CK+547LC1S4xd/PzZfWw6unf1L
 YJ3xI3kFPrX+/blnJZ0yqRW1fcadqil6x3BhPuIC+x/iQbPNu7k/puCG3QnIqS5PkEUT
 NKkAUGapRj2guaEpwhiMYvSlWIuT4Ooc1zhdZ35eDw7APrW1lYOb9ebjb6M2dHx5KTze
 C4XcQhpnAkqOq+NoMNVyU7Q8pufcW2RHxWY0LYglK+bIDxMCpHir083jNobBpOAx1ARn
 nghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DKCOLyI/wsJHJKYRWjsEmHI6WWtv0JONwA4WRgdn8Pc=;
 b=YFzZqM+mHnUOwaExwKKjK9dpXMu6p8tX0lS4iQZVt3aSHgCC+UG5fPkXa1icapwvrR
 pxUzYdVR9aeN4vS/gbpxvgtu+OaYaUr4Trg+zFKY4Z0dVhX/0VqRVEg9jWrnrOGE/rqc
 zLLt5B2YgOriOCkqFQDIOG9veFocEOUY1fUpgZC8AAEfHXtD6Nae++6tSB2zaUMRV8xW
 KfFIcGsV1n1pyDKlgAi9qiGKLHzdPE9E/EmLnmYB2ovQsdGw3viNj+CieMGaOAG1q1Zx
 RV8ynvq8P39e1qcsqSsFywigv0p4FipoRtYS4sogLDjM6qoW1Q5H6ZsTsQ9Ew0HMTIPo
 ddaA==
X-Gm-Message-State: AO0yUKWaxxkjvlO7Zq9NeIkIwgPUwbT9xRd3okjgVvSO/xiYArcvDwJQ
 YeU5erW89usNgL0URn87KDxfSdFGiCTgm5UkUCk=
X-Google-Smtp-Source: AK7set/OxqGgvml9+tNumd0wkyLtVBkZsT96xn8vnIp0Q0LstUnPElxRkn1UBDhJbmU+p92pWBM2mQ==
X-Received: by 2002:a62:17cd:0:b0:5a9:cbc3:ca70 with SMTP id
 196-20020a6217cd000000b005a9cbc3ca70mr14411178pfx.24.1677315629016; 
 Sat, 25 Feb 2023 01:00:29 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a639251000000b00502ecb91940sm715546pgn.55.2023.02.25.01.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:00:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 27/30] target/xtensa: Don't use tcg_temp_local_new_*
Date: Fri, 24 Feb 2023 22:59:42 -1000
Message-Id: <20230225085945.1798188-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225085945.1798188-1-richard.henderson@linaro.org>
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Since tcg_temp_new_* is now identical, use those.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 8d7bf566de..4af0650deb 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -307,7 +307,7 @@ static void gen_right_shift_sar(DisasContext *dc, TCGv_i32 sa)
 static void gen_left_shift_sar(DisasContext *dc, TCGv_i32 sa)
 {
     if (!dc->sar_m32_allocated) {
-        dc->sar_m32 = tcg_temp_local_new_i32();
+        dc->sar_m32 = tcg_temp_new_i32();
         dc->sar_m32_allocated = true;
     }
     tcg_gen_andi_i32(dc->sar_m32, sa, 0x1f);
@@ -1074,10 +1074,10 @@ static void disas_xtensa_insn(CPUXtensaState *env, DisasContext *dc)
             if (i == 0 || arg_copy[i].resource != resource) {
                 resource = arg_copy[i].resource;
                 if (arg_copy[i].arg->num_bits <= 32) {
-                    temp = tcg_temp_local_new_i32();
+                    temp = tcg_temp_new_i32();
                     tcg_gen_mov_i32(temp, arg_copy[i].arg->in);
                 } else if (arg_copy[i].arg->num_bits <= 64) {
-                    temp = tcg_temp_local_new_i64();
+                    temp = tcg_temp_new_i64();
                     tcg_gen_mov_i64(temp, arg_copy[i].arg->in);
                 } else {
                     g_assert_not_reached();
@@ -1187,7 +1187,7 @@ static void xtensa_tr_tb_start(DisasContextBase *dcbase, CPUState *cpu)
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
     if (dc->icount) {
-        dc->next_icount = tcg_temp_local_new_i32();
+        dc->next_icount = tcg_temp_new_i32();
     }
 }
 
@@ -2273,8 +2273,8 @@ static void gen_check_atomctl(DisasContext *dc, TCGv_i32 addr)
 static void translate_s32c1i(DisasContext *dc, const OpcodeArg arg[],
                              const uint32_t par[])
 {
-    TCGv_i32 tmp = tcg_temp_local_new_i32();
-    TCGv_i32 addr = tcg_temp_local_new_i32();
+    TCGv_i32 tmp = tcg_temp_new_i32();
+    TCGv_i32 addr = tcg_temp_new_i32();
     MemOp mop;
 
     tcg_gen_mov_i32(tmp, arg[0].in);
@@ -2303,8 +2303,8 @@ static void translate_s32ex(DisasContext *dc, const OpcodeArg arg[],
                             const uint32_t par[])
 {
     TCGv_i32 prev = tcg_temp_new_i32();
-    TCGv_i32 addr = tcg_temp_local_new_i32();
-    TCGv_i32 res = tcg_temp_local_new_i32();
+    TCGv_i32 addr = tcg_temp_new_i32();
+    TCGv_i32 res = tcg_temp_new_i32();
     TCGLabel *label = gen_new_label();
     MemOp mop;
 
-- 
2.34.1



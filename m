Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9F050BEFF
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:47:25 +0200 (CEST)
Received: from localhost ([::1]:50508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhxNL-0002Kt-NV
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwaj-00008b-CW
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:09 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:35727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwah-00080D-Rr
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:09 -0400
Received: by mail-io1-xd32.google.com with SMTP id q22so9241708iod.2
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PLNGcYz2iEfQ9Yx39pQmGnFw0rJ+PViSHW2oP88vmqI=;
 b=s2r8JQcgeDp/IqOSNl4xGVvwsya1vXYDJbK7A9jEgQXL/OOfQDGOGOfSFVTMT7FYTS
 vtvy/7ToNgX8mTplrV1PYnOcx5KGgiqjLiXU/3yPw87sa6DAR1VianAJXQaVGpc+SfpT
 ir8ogWfNFvSa7Db08AYWrBWjf7QMvtVbqBTnkBY1o8ylLqYn3F5+qKV2kcVFQ1ueqJME
 /K2Oyw7ho7F1KdlPDQhAYTpbwUV+ze0Bd7LFRxUlnzd8g4a+IN48j1XYncyi9g09cvwE
 tU+0lplpHG0SYK1Uc1yUkSTzgHtrLWVEQv93ysb2mIdKluLEhxB9v83X4O+U60RhtvwH
 6bEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PLNGcYz2iEfQ9Yx39pQmGnFw0rJ+PViSHW2oP88vmqI=;
 b=7cpeysWRqcJmNCXw5VfimLXBXW8WlN6IPR71nCo9h1/7VV+rSTzTwsTjVk20aQzReK
 gPMfuIprviSG6MEvYiaXwcWPUUMGyKOrKmRrNiYmtsziilzKNN9nckCVR3nEorAUNHRQ
 fHlYcgNgnzeeGr58Cg5ONPiEEteGhic7Iv80VhU7g/BUQ/Ky4cAzngrfA9RW/S+3qJYC
 Oozty0kL8CxgpfqvT4oc/zSJJDY0lrm2+Mlsr0iYnQJbe31mCuukqb0zWCBZPl4n8jcI
 xjku1TWt8SPH6Z2uPwUHzJpuc0IO0VEvEWzanmwdKhhsNEnTCelgBRQQJ2NAup9qGdve
 uf6w==
X-Gm-Message-State: AOAM532Shl84y5GqTPNHJ6ZfEAHxAow5QV7wZMBdNLeOQMc2ac35Na65
 fJahbQHGm0pNnk1kYzSNLyo2LX8VxVGG3Gue
X-Google-Smtp-Source: ABdhPJyOUH9MVDWXE0MIWidAndpKI9MgQlZdizzvT1RBsJAgOqaYXzP86p8BOk92rWrBzUOYo71Zjg==
X-Received: by 2002:a05:6602:2d06:b0:655:3324:4cc8 with SMTP id
 c6-20020a0566022d0600b0065533244cc8mr2547364iow.74.1650646626838; 
 Fri, 22 Apr 2022 09:57:06 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a6b8b17000000b00649a2634725sm816380iod.17.2022.04.22.09.57.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:57:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 48/68] target/nios2: Split out helpers for gen_rr_shift
Date: Fri, 22 Apr 2022 09:52:18 -0700
Message-Id: <20220422165238.1971496-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do as little work as possible within the macro.
Split out helper functions and pass in arguments instead.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 5979427c8e..f2dcaa3fbb 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -690,23 +690,28 @@ gen_rr_mul_high(mulxss, muls2)
 gen_rr_mul_high(mulxuu, mulu2)
 gen_rr_mul_high(mulxsu, mulsu2)
 
-#define gen_r_shift_s(fname, insn)                                         \
-static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)       \
-{                                                                          \
-    R_TYPE(instr, (code));                                                 \
-    if (likely(instr.c != R_ZERO)) {                                       \
-        TCGv t0 = tcg_temp_new();                                          \
-        tcg_gen_andi_tl(t0, load_gpr((dc), instr.b), 31);                  \
-        tcg_gen_##insn(cpu_R[instr.c], load_gpr((dc), instr.a), t0);       \
-        tcg_temp_free(t0);                                                 \
-    }                                                                      \
+static void do_rr_shift(DisasContext *dc, uint32_t insn, GenFn3 *fn)
+{
+    R_TYPE(instr, insn);
+
+    if (likely(instr.c != R_ZERO)) {
+        TCGv sh = tcg_temp_new();
+
+        tcg_gen_andi_tl(sh, load_gpr(dc, instr.b), 31);
+        fn(cpu_R[instr.c], load_gpr(dc, instr.a), sh);
+        tcg_temp_free(sh);
+    }
 }
 
-gen_r_shift_s(sra, sar_tl)
-gen_r_shift_s(srl, shr_tl)
-gen_r_shift_s(sll, shl_tl)
-gen_r_shift_s(rol, rotl_tl)
-gen_r_shift_s(ror, rotr_tl)
+#define gen_rr_shift(fname, insn)                                           \
+    static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)    \
+    { do_rr_shift(dc, code, tcg_gen_##insn##_tl); }
+
+gen_rr_shift(sra, sar)
+gen_rr_shift(srl, shr)
+gen_rr_shift(sll, shl)
+gen_rr_shift(rol, rotl)
+gen_rr_shift(ror, rotr)
 
 static void divs(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-- 
2.34.1



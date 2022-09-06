Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4E35AE585
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 12:40:36 +0200 (CEST)
Received: from localhost ([::1]:37890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVW0R-0000g4-Hy
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 06:40:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVSq-0004Bn-Ow
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:05:52 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVSf-000333-6z
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:05:52 -0400
Received: by mail-wr1-x42d.google.com with SMTP id bj14so1372310wrb.12
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=qdoo/EFfZ9+xL61qXYRJd5BN7nP+QxbxeeGNggpMDL4=;
 b=t8xUqjBGgFiGNQVZj1/oJMcXTWhsbcc+ZpdZsiQI9coKXNvPHSsdC3HSvyzickOQ9I
 M9tnCeReqBlPmdVjpVkiFguK2JOUbjOLiK9Z+9yZxIBjaRJEPNvuocLKB+J8j+89ryzi
 ggPA8AHtnUSo/sywatTo3FOpp2MROC6u0/gVBwktQjTPRbhJHikRfS8w5apcoKs0zTdO
 ERD4eRFgecqOx4noaKWtdPyCAlIqGc0jleNzn9go8CAU75hUuSVDQQwOL3+hgkgZJj85
 KtH1eTJ/75UxS51AYI88Gq/Y5UVJyhyzXDBY/Q9w1l3R5opXC0BMhsS5cyBDQu4Uo4Zm
 HfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=qdoo/EFfZ9+xL61qXYRJd5BN7nP+QxbxeeGNggpMDL4=;
 b=gjyBdXxudb8G3kaKVCQqBe2/NVkypYUiejWMMtQzqOtfv/55N6jGH258yoz/XHlPEz
 EfkG5G8Mr3QvHpLxn3YjJYQedbheWRVOLUIG8fBkSYA7tPL/UNKrMqFRKx3PGEO18UzJ
 5r+op5aFOLEZ0zVmJAsbrEcDDQqWpd4A+cJ81D9gaJb8gXMdk5LrHsWfzqk73TuGiM8d
 Ige5HXep6JfCEEQbfhLzUB6l1bZygPPEFYN4T7PmMmlQqQiFe151qX4FY2tCdRnM3+Jt
 dx7Cx4305rOc+eouldW9fKcJBmt45egCKJkSclmF/nDSSq9W6iTvqrbcCr7xuxZ44jND
 JA6w==
X-Gm-Message-State: ACgBeo0uGyW3cK0f5DFfjFe04xaK87Sly2/9Vj4vnqNKQYYL+//E2Qi6
 CJJ/UEZ15XkIGlni4EwarERzdz3g1V3PTC+3
X-Google-Smtp-Source: AA6agR4HmzKdeUU+8oLeJZIJL2jz+hPiRDvBnMH2sB3rUPYAkAtGIcDsoFou4IP5oPunU8IrveROnw==
X-Received: by 2002:a5d:6b8a:0:b0:228:d6f5:f83a with SMTP id
 n10-20020a5d6b8a000000b00228d6f5f83amr1697451wrx.381.1662458731680; 
 Tue, 06 Sep 2022 03:05:31 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a5d6dcf000000b00225307f43fbsm12271081wrz.44.2022.09.06.03.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:05:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 1/9] target/arm: Introduce curr_insn_len
Date: Tue,  6 Sep 2022 11:05:20 +0100
Message-Id: <20220906100528.343244-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906100528.343244-1-richard.henderson@linaro.org>
References: <20220906100528.343244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

A simple helper to retrieve the length of the current insn.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h     | 5 +++++
 target/arm/translate-vfp.c | 2 +-
 target/arm/translate.c     | 5 ++---
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index af5d4a7086..90bf7c57fc 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -226,6 +226,11 @@ static inline void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
     s->insn_start = NULL;
 }
 
+static inline int curr_insn_len(DisasContext *s)
+{
+    return s->base.pc_next - s->pc_curr;
+}
+
 /* is_jmp field values */
 #define DISAS_JUMP      DISAS_TARGET_0 /* only pc was modified dynamically */
 /* CPU state was modified dynamically; exit to main loop for interrupts. */
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index bd5ae27d09..94cc1e4b77 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -242,7 +242,7 @@ static bool vfp_access_check_a(DisasContext *s, bool ignore_vfp_enabled)
     if (s->sme_trap_nonstreaming) {
         gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
                            syn_smetrap(SME_ET_Streaming,
-                                       s->base.pc_next - s->pc_curr == 2));
+                                       curr_insn_len(s) == 2));
         return false;
     }
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9474e4b44b..638a051281 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6660,7 +6660,7 @@ static ISSInfo make_issinfo(DisasContext *s, int rd, bool p, bool w)
     /* ISS not valid if writeback */
     if (p && !w) {
         ret = rd;
-        if (s->base.pc_next - s->pc_curr == 2) {
+        if (curr_insn_len(s) == 2) {
             ret |= ISSIs16Bit;
         }
     } else {
@@ -9825,8 +9825,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             /* nothing more to generate */
             break;
         case DISAS_WFI:
-            gen_helper_wfi(cpu_env,
-                           tcg_constant_i32(dc->base.pc_next - dc->pc_curr));
+            gen_helper_wfi(cpu_env, tcg_constant_i32(curr_insn_len(dc)));
             /*
              * The helper doesn't necessarily throw an exception, but we
              * must go back to the main loop to check for interrupts anyway.
-- 
2.34.1



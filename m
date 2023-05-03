Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 985D26F520F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:43:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6tb-0004pc-Uz; Wed, 03 May 2023 03:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tS-0004PU-UD
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:19 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tP-0005ec-Kp
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:17 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f4000ec71dso211135e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098834; x=1685690834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vy5nR7m9duq9DZVmj1wz55/l+1SOQkxvTQSRU9OgRBU=;
 b=zJ9jJyykDjgsHkACespTfibXLZqS5brz9FSYdOa+YyeefcV/swI/1fsP7yiLtbGrAi
 mzyQ1MEd3iGb7TNZzSJLEw5QOGsycRHpAeoIV/BH9RSa2227uEyQXpBEVuYkzKywuEzp
 kR4/+rAD+s6jos/YrEJILdPGrpSVEO+Uf+X9xxE7LMy+yfBZAXfqN7IgJUmF8fYeGhr9
 esd2m1dMl+poW975+d6McPiN9y4TI37oNo3Otjk9pqQvwDlpsG4a0ht5KD7tUt11Btdg
 E/KRRdMuDBbYUPR8kclh3hJXFxOlq92VQyOEZOa+9L5QZ7PyzVgZBQBLGe4jEjqNdlJC
 bJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098834; x=1685690834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vy5nR7m9duq9DZVmj1wz55/l+1SOQkxvTQSRU9OgRBU=;
 b=bqUGxjMUuxpuywqHmNPTM4Rlq+TM51KmSkLdvg2fh5KO9boCVltM8gcmtYHbmeCqzv
 X27BFL3lELN0WbudOuZg+P5IgzEXdDZPdIwTv/PM5V+2BDiZwCA2v3a/eEQUxtLuL7H0
 qQaboOpXYIV3FaNadVwL5ymS9GrwGiooq0WfHeqJJLFtr2Y7RaOEZHH8nWGDLpnBB/p9
 7KysGIAINj8mVK1RcNipb9oNICXxugqurZGtap0vQ67U97CocXUrQt+ArhQnArfoixC2
 I0EleB7zsjo8he/wqj5gLm3JYYeWxTYTxM936iX+vWN8AANSDKMt5WKJgwJPjv6mhTyk
 M5mg==
X-Gm-Message-State: AC+VfDwqhJwfJQTGWi54QUjffK3nuJ44hDlDN5dK0ehEYZpLCKhgZCC5
 OOxLF74H/7KxVf35NHXdAcVZpg9Nwcbd05NZLBZ0Vw==
X-Google-Smtp-Source: ACHHUZ6bpJuOUPzbnZp2FRpA1/hMVqoOk2/Ur0Z51pz9zLWlrTGFlgWdpcqdrUO+FTBB1T0J+1bLDQ==
X-Received: by 2002:a1c:f607:0:b0:3f1:8173:fc1a with SMTP id
 w7-20020a1cf607000000b003f18173fc1amr13805973wmc.28.1683098833947; 
 Wed, 03 May 2023 00:27:13 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 55/84] tcg: Add guest_mo to TCGContext
Date: Wed,  3 May 2023 08:23:02 +0100
Message-Id: <20230503072331.1747057-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This replaces of TCG_GUEST_DEFAULT_MO in tcg-op-ldst.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h         | 1 +
 accel/tcg/translate-all.c | 5 +++++
 tcg/tcg-op-ldst.c         | 4 +---
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 97f13d937d..24e8cd65ef 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -521,6 +521,7 @@ struct TCGContext {
     uint8_t tlb_dyn_max_bits;
 #endif
     uint8_t insn_start_words;
+    TCGBar guest_mo;
 
     TCGRegSet reserved_regs;
     intptr_t current_frame_offset;
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 03ebe58099..181f276b18 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -367,6 +367,11 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
         (int)offsetof(ArchCPU, neg.tlb.f) - (int)offsetof(ArchCPU, env);
 #endif
     tcg_ctx->insn_start_words = TARGET_INSN_START_WORDS;
+#ifdef TCG_GUEST_DEFAULT_MO
+    tcg_ctx->guest_mo = TCG_GUEST_DEFAULT_MO;
+#else
+    tcg_ctx->guest_mo = TCG_MO_ALL;
+#endif
 
  tb_overflow:
 
diff --git a/tcg/tcg-op-ldst.c b/tcg/tcg-op-ldst.c
index 71cc559f67..9eef859c97 100644
--- a/tcg/tcg-op-ldst.c
+++ b/tcg/tcg-op-ldst.c
@@ -104,9 +104,7 @@ static void gen_ldst_i64(TCGOpcode opc, TCGv_i64 v, TCGTemp *addr, MemOpIdx oi)
 
 static void tcg_gen_req_mo(TCGBar type)
 {
-#ifdef TCG_GUEST_DEFAULT_MO
-    type &= TCG_GUEST_DEFAULT_MO;
-#endif
+    type &= tcg_ctx->guest_mo;
     type &= ~TCG_TARGET_DEFAULT_MO;
     if (type) {
         tcg_gen_mb(type | TCG_BAR_SC);
-- 
2.34.1



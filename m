Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9086E6F514A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:25:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6qt-0003gK-PE; Wed, 03 May 2023 03:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qF-0002FB-Lj
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:59 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qD-0001kv-Pa
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:59 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3063891d61aso1532895f8f.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098636; x=1685690636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mVJ1+JPstlmXuvYZFWqC4Qj9tyNFo1dtvta3G+aDiM0=;
 b=DjfBWOg/ljI5g57wu522gD8SlMA/M7usNs3GxLCE6QXgOHDNGULHBroeNkNulk0eUm
 udHffWO1vbyPHrz3nu1DYiSQ8yHDLW24f7u9CCXMLN7oDY98l5Ms213MF9hkdZBsqvwX
 23kToZlsKWh80bR+Kxf56tGMFpmwBWfaWLTp5glAA4xUXUIUGyENRaNO4RrDL7Kx7NxV
 /zW686q/tlSrHelQiK9RP60xnlxZDxCdxz3FFSq6ydD6EHqGLoQ7WchZp78zS7FAYwSO
 Ec/bpY9+awxjhvnC8N6OB9oBcs+Q56YIhw1/qxOvLbWdcOuxXrwXWBFUyPEbyrLiDNFt
 8X8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098636; x=1685690636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mVJ1+JPstlmXuvYZFWqC4Qj9tyNFo1dtvta3G+aDiM0=;
 b=F+XDpwDRTWJ8vYKRDksq7+HucwxNYUGBdvZrAD5pnYzW65+7zdVzrnEUELbt6RlWG6
 Fwn93Igne1mpmXRH3ajBVfogEBp2SR/ap+uF7qSAMv7c4eskroOdyjQVltP5pKRDcSr9
 OJ9VPl1Jpyt/THpcAapSnZ2yHPDYXjvUzbf1Ua/0k88atCit1lR9UjU3I1waM66o52Z3
 bJELiwZHLJntLM67cO3TL5Bpe822aCaHO7ZGTWwavFrnaHs4CKPOwAwbQFoCF3ugAWUg
 lRGUTEc9k5Vn2AGFsVbc+nP5Uy6T++QAS9schdHDbWzP5yDbwY6QOuAUhhLefx4Gv2HI
 ekbQ==
X-Gm-Message-State: AC+VfDzVpveNCpkOIVEpRFGw7VXIhvDyUzbw5NU7Ccj8xYjTd1w0lA/V
 ScixFgsud3bQh6jjFBNZh+Z6DyFJzNks1AnkZcTB2Q==
X-Google-Smtp-Source: ACHHUZ4JztlAR9ts6M6Iyn4tHEXadUB+QbEb/d6oEaWoufmBH+QY4CPwFIaYUgQeCa3QSNgh0VJi6A==
X-Received: by 2002:adf:ec04:0:b0:2f6:ca0d:ec1c with SMTP id
 x4-20020adfec04000000b002f6ca0dec1cmr15643957wrn.10.1683098636517; 
 Wed, 03 May 2023 00:23:56 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9586745wrx.25.2023.05.03.00.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:23:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 30/84] tcg: Move TCG_TYPE_TL from tcg.h to tcg-op.h
Date: Wed,  3 May 2023 08:22:37 +0100
Message-Id: <20230503072331.1747057-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
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

Removes the only use of TARGET_LONG_BITS from tcg.h, which is to be
target independent.  Move the symbol to a define in tcg-op.h, which
will continue to be target dependent.  Rather than complicate matters
for the use in tb_gen_code(), expand the definition there.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h      | 8 ++++++++
 include/tcg/tcg.h         | 7 -------
 accel/tcg/translate-all.c | 2 +-
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 35c5700183..844c666374 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -722,6 +722,14 @@ static inline void tcg_gen_concat32_i64(TCGv_i64 ret, TCGv_i64 lo, TCGv_i64 hi)
 #error must include QEMU headers
 #endif
 
+#if TARGET_LONG_BITS == 32
+# define TCG_TYPE_TL  TCG_TYPE_I32
+#elif TARGET_LONG_BITS == 64
+# define TCG_TYPE_TL  TCG_TYPE_I64
+#else
+# error
+#endif
+
 #if TARGET_INSN_START_WORDS == 1
 static inline void tcg_gen_insn_start(target_ulong pc)
 {
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 026b2dd362..4e55efe0cf 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -299,13 +299,6 @@ typedef enum TCGType {
 #else
     TCG_TYPE_PTR = TCG_TYPE_I64,
 #endif
-
-    /* An alias for the size of the target "long", aka register.  */
-#if TARGET_LONG_BITS == 64
-    TCG_TYPE_TL = TCG_TYPE_I64,
-#else
-    TCG_TYPE_TL = TCG_TYPE_I32,
-#endif
 } TCGType;
 
 /**
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 99a9d0e34f..ac27487106 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -356,7 +356,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     tb_set_page_addr0(tb, phys_pc);
     tb_set_page_addr1(tb, -1);
     tcg_ctx->gen_tb = tb;
-    tcg_ctx->addr_type = TCG_TYPE_TL;
+    tcg_ctx->addr_type = TARGET_LONG_BITS == 32 ? TCG_TYPE_I32 : TCG_TYPE_I64;
 
  tb_overflow:
 
-- 
2.34.1



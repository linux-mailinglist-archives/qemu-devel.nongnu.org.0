Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7414F36605D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 21:42:02 +0200 (CEST)
Received: from localhost ([::1]:54318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYwG1-0006y6-IU
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 15:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYw9R-0002TG-1o
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 15:35:13 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYw9P-00022g-HH
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 15:35:12 -0400
Received: by mail-wr1-x42e.google.com with SMTP id s7so38809011wru.6
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 12:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X+55Q796uaAhfzBrSTXh6Pi3XW8Ee7SvRz64BnVsSu0=;
 b=tzuie9k1b6yi+8tNHC1UvX08zRwWeuS+LztPkT1Ep+Ks6wPz6sm+DX8Xcfs4sTxziq
 LAl3wnWg3YNQFjyzyh1oAeNyCVYkBqcT15SplvPqZU0do9fb0n0lSyMAdDNi+xIqqFmH
 susiYQo4hifjpQRWryIZIbLTRk5E6TyU+bcVWYWfteq3dhYXawk/7Pdjj5k6KryqMFf2
 UovJ09hf8tyI5dR5ncHt58y9rG/ASyeRLG3QLyk//9OWckPOuYAjCMN8uxNZN4ybzFZY
 +DtHa5a+clR5Rs7yh0MX+hSH3Xz9TmC7bpFW8DeNMYLYiBTJKb7XZoH5RmViP4kneM3R
 bo7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=X+55Q796uaAhfzBrSTXh6Pi3XW8Ee7SvRz64BnVsSu0=;
 b=IANyNO4hJyyCKLpT/SGf26lWdf5tQx0oiJMLm2gYUUIcP51NAYuPSspWma+kjNjtzp
 hUaKhPisQcKXhqRFPVUCBfGjySRykzPZgNXVTia64STsCxreL/m3mBX10roFf7wuL+nv
 X0gk1C3vHoGFiZg+zYXFvpw4gTcJQxcch+elVmNeqdZjlMeygbNHbSFT8y0BFmhtE7Aq
 a4vt1lPnAgq51JtNQ07Ooffw5j6tBMhWADuTQt8AI89sQpa8ev8v4W9jU/xsf4dnXq0e
 bzfBAiR7cKuXRFEwWjbjzH4XmwhXKG97Glh3H4QGd+yQtskjql5TEnOgG56Uvh2OlZo0
 i2dg==
X-Gm-Message-State: AOAM531zhm5fjM4Olqsnt0fgiXTESoQ99GU8s0znO9imCVkf4l9zlF2p
 JNJ2kCBtlp8gGvtPVLotcm7PtBsdy5g0Ww==
X-Google-Smtp-Source: ABdhPJyAJuJ54yi8kLKwYfom9mAeb8bKlk/RIxBakQXzH09YKm1VZn3kWfPq5l+MfS17DqMdvOoTOg==
X-Received: by 2002:adf:fec5:: with SMTP id q5mr22728629wrs.168.1618947310054; 
 Tue, 20 Apr 2021 12:35:10 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id e33sm4023247wmp.43.2021.04.20.12.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 12:35:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] target/mips: Make check_cp0_enabled() return a boolean
Date: Tue, 20 Apr 2021 21:34:51 +0200
Message-Id: <20210420193453.1913810-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210420193453.1913810-1-f4bug@amsat.org>
References: <20210420193453.1913810-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To avoid callers to emit dead code if check_cp0_enabled()
raise an exception, let it return a boolean value, whether
CP0 is enabled or not.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.h | 7 ++++++-
 target/mips/translate.c | 4 +++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index 2b3c7a69ec6..61442590340 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -120,7 +120,12 @@ void gen_reserved_instruction(DisasContext *ctx);
 
 void check_insn(DisasContext *ctx, uint64_t flags);
 void check_mips_64(DisasContext *ctx);
-void check_cp0_enabled(DisasContext *ctx);
+/**
+ * check_cp0_enabled:
+ * Return %true if CP0 is enabled, otherwise return %false
+ * and emit a 'coprocessor unusable' exception.
+ */
+bool check_cp0_enabled(DisasContext *ctx);
 void check_cp1_enabled(DisasContext *ctx);
 void check_cp1_64bitmode(DisasContext *ctx);
 void check_cp1_registers(DisasContext *ctx, int regs);
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 03fb67f6f22..be5382b41f2 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -1572,11 +1572,13 @@ void gen_move_high32(TCGv ret, TCGv_i64 arg)
 #endif
 }
 
-void check_cp0_enabled(DisasContext *ctx)
+bool check_cp0_enabled(DisasContext *ctx)
 {
     if (unlikely(!(ctx->hflags & MIPS_HFLAG_CP0))) {
         generate_exception_end(ctx, EXCP_CpU);
+        return false;
     }
+    return true;
 }
 
 void check_cp1_enabled(DisasContext *ctx)
-- 
2.26.3



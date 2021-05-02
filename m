Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CA3370DFE
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:35:20 +0200 (CEST)
Received: from localhost ([::1]:60316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldF3v-0006QE-V3
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldElS-0005TL-Nw
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:16:14 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldElR-0007Pe-1a
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:16:14 -0400
Received: by mail-wr1-x42e.google.com with SMTP id x5so3066633wrv.13
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6i1WU64wR8pkFjcHjE2+dlBuW0U+Z2Gby3NQK6F4B3o=;
 b=pgtl+R/YycldNgLVkoGUllDsvpg1cCILyYRyQe/VAZWHlptNA/eDHBQCi68FpcJXtH
 pNu9cd8jhXJDN4iNMLuIU3wo/htNLjN8EFVIc7ts8PH7tclQswHTMyFx+LlrNQ4VFVA/
 czxCRJaupuMa75ftmWuPDkDrlvb/kd0w+fXttqjVKXsrEec0BxGG/hJGx8vnuIuLu7Oy
 5a+dDwVv6gHHyJDWICf4xHJr1X9+ydEyYmxnCzydhhukUS0BCLb3Sty4Cnm+PjiGjgl/
 5Azms1zlZ7bWKI2/o8JA7hiSVFjEOoyjbbj7r7r0DdElFsGCwmxu00ytBs2ygelKE2lT
 fo8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6i1WU64wR8pkFjcHjE2+dlBuW0U+Z2Gby3NQK6F4B3o=;
 b=dy55BP1xz4JsQMefq9dWXU3wrXDpaR7Aq2vATmRiVM8sBiGCR1Gx7ynxvtETIG7RQk
 unxvxH11F7OBr/DfstxhjWsE8aYGGCFggxohjUlzmvc88Atl5rWc21sKBywTIueb5eOE
 4WkagZ1VaVDvF3E6YJsZy5rtmTd3qORjnVDVsgTOMXa4FTnXv/F37maoNSAO5l560weG
 V+r21l9X180zDd10/v7B5GDxg8PkuflLxxWXKcfgUWr9gres8yq3U4Y8DFdOdIM5r3tO
 jClg1Ye0CAycldAeLoLSvzG/BgH3N33m4gpZlOzqeyMsPYcFqdVf6e+QTT2rIsN7wPE7
 UYwA==
X-Gm-Message-State: AOAM532h+F5Gs0PMPNVTVzlo9R25PLYcudB9MUyNAnZgm8mmdfZumVx+
 p0D1nCA1SZZCM5yIt/KEvgGOdmr3lRNaigw+
X-Google-Smtp-Source: ABdhPJzWwkz+hd7uEh9zbZCablUH3Dun8zcmdKBJNW9dPx+3kmpAaZBsqd8Kpjx7OCeASK34jDckLw==
X-Received: by 2002:adf:a119:: with SMTP id o25mr20234031wro.61.1619972171607; 
 Sun, 02 May 2021 09:16:11 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id z15sm9176134wrv.39.2021.05.02.09.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:16:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/36] target/mips: Make check_cp0_enabled() return a boolean
Date: Sun,  2 May 2021 18:15:08 +0200
Message-Id: <20210502161538.534038-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502161538.534038-1-f4bug@amsat.org>
References: <20210502161538.534038-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To avoid callers to emit dead code if check_cp0_enabled()
raise an exception, let it return a boolean value, whether
CP0 is enabled or not.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210420193453.1913810-4-f4bug@amsat.org>
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
index 3230b2bca3b..0e90d8cace6 100644
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



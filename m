Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4E549FCF0
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 16:36:11 +0100 (CET)
Received: from localhost ([::1]:35504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDTII-0004bi-0e
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 10:36:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nDSgF-0008Uv-Ie
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 09:56:51 -0500
Received: from [2a00:1450:4864:20::232] (port=43614
 helo=mail-lj1-x232.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nDSgD-0000ue-MU
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 09:56:51 -0500
Received: by mail-lj1-x232.google.com with SMTP id t7so9342652ljc.10
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 06:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jMff3WyL6G5ADN/bn/4LcGtk2j7BR2F++L1Rqnq6S0I=;
 b=VBOXNRT+U2Nx3FWeZZkWcqtYvm8XA/5EXMV1E1toTyue0mKqfgqFqX255VYW3/ThJi
 Eh5XJXcbIy9Oohni/jJELypzcM2YjmtKpX7HY+EBPGsNxCnhhGwGN7ESFghKFRBOk/0A
 HzRz+CaST3sYlzAk8i8oDVRPngnjignNCnO362PYLunmNXZwW4WjABPv4Dkdg6M/AWd2
 XlnROEK55CdX2E0Bk9J+pAThkW/2n/Th2qchGPp6S9+Jc4rJ7Q9wfjd46e4wDjsE5LgG
 316BszUB9hvjSjA5Zpb13yiK3ZtbpX0hOtYlQdAszqJtX4IVg0FJaeeo7qKOe67Ew6gg
 k0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jMff3WyL6G5ADN/bn/4LcGtk2j7BR2F++L1Rqnq6S0I=;
 b=yMb0k4GYaD0DYWmt8Eg4cjoen89yx17Pu2JMdTJNW5fmpbBFNWcXcxQLLvmcQLe6cZ
 tQL3E7bg40uZvBeWJ6e1XZzBekgVjzaCH1O82A891fE7ZnjLP/dSDralBvkwz2/bfqvs
 UxbP8vbRDevzdzmeeXkmrX9s9G/QCmGMvmskE+gKL5CTRkFVTlt/niGqXglpvEjYJ9jx
 clx+hh+dMUuJ+YMdB+Y5qOHwLalcC5SdsuURJBY28RtfLO7MmtFOLKDaTXquqVPCdNGS
 2KAnfvgtb+7ifDsAb7Pten2eurTw+LaP/NNyiH8SDagB8IT5HXdSKupyLUfWEY67cBwU
 RDFA==
X-Gm-Message-State: AOAM532fpOCogUj3XvNKtO27GkeNktq6XBb673TqNAQUdEw0eGtw3cWZ
 tyoDwZsTfXj7J8j3+0P5TPkiTKgmtKYEji+n
X-Google-Smtp-Source: ABdhPJy6G34UXTM4vEXwg28nOIi7SuoYCsGwSZ9JijgxehqJat8kjUoUNLa8k21I676OG4DWKoXjTA==
X-Received: by 2002:a2e:b0ca:: with SMTP id g10mr6100091ljl.216.1643381807849; 
 Fri, 28 Jan 2022 06:56:47 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id b20sm1031234lfb.51.2022.01.28.06.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 06:56:47 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/7] target/riscv: riscv_tr_init_disas_context: copy
 pointer-to-cfg into cfg_ptr
Date: Fri, 28 Jan 2022 15:56:37 +0100
Message-Id: <20220128145642.1305416-3-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128145642.1305416-1-philipp.tomsich@vrull.eu>
References: <20220128145642.1305416-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::232
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x232.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Greg Favor <gfavor@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As the number of extensions is growing, copying them individiually
into the DisasContext will scale less and less... instead we populate
a pointer to the RISCVCPUConfig structure in the DisasContext.

This adds an extra indirection when checking for the availability of
an extension (compared to copying the fields into DisasContext).
While not a performance problem today, we can always (shallow) copy
the entire structure into the DisasContext (instead of putting a
pointer to it) if this is ever deemed necessary.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>

---

Changes in v3:
- (new patch) copy pointer to element cfg into DisasContext

 target/riscv/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f0bbe80875..22d09af2df 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -76,6 +76,7 @@ typedef struct DisasContext {
     int frm;
     RISCVMXL ol;
     bool virt_enabled;
+    const struct RISCVCPUConfig *cfg_ptr;
     bool ext_ifencei;
     bool ext_zfh;
     bool ext_zfhmin;
@@ -908,6 +909,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 #endif
     ctx->misa_ext = env->misa_ext;
     ctx->frm = -1;  /* unknown rounding mode */
+    ctx->cfg_ptr = &(cpu->cfg);
     ctx->ext_ifencei = cpu->cfg.ext_ifencei;
     ctx->ext_zfh = cpu->cfg.ext_zfh;
     ctx->ext_zfhmin = cpu->cfg.ext_zfhmin;
-- 
2.33.1



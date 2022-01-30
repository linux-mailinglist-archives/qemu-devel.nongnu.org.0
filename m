Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF354A3C09
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 01:02:17 +0100 (CET)
Received: from localhost ([::1]:52046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEK99-0008Hl-NO
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 19:02:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nEK5D-0005ap-0Y
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 18:58:12 -0500
Received: from [2a00:1450:4864:20::134] (port=37742
 helo=mail-lf1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nEK58-0006uX-Ck
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 18:58:09 -0500
Received: by mail-lf1-x134.google.com with SMTP id n8so23361173lfq.4
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 15:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Df4pM7W6JOXXmKbUY3pDG5ljOXIdG4Y0v5QZ/nEgvsA=;
 b=iE+w/8Re2BlpAskVIUOxd3DuNjCeH5rfh5jx8a/WODeNcuEbAyLzSiC2pg8UWlNj4h
 v+zkJw7TLa3zbBnAeFMrYk6jSZekHIdoT9uv83NPfwnJc+FujhytT3fbdgwEzhvzgAxL
 E4ESpq6XbSuxKd3OUkevztghwvMiT3y4EuRCc89so8edFxdvKVcDxFZ6zUxHOMTjeHLY
 iLDIsujCE8oprc/Fjvo0NEiJ7mg/0/kNXaNOXtulZB3bY1IGfGuGYdTUdkHKWZhwoOr7
 9avOQ7HQaS3mvJDrZ++BUmwQZbM7r8iLiBln8/l891mGYFs+7Mo0ZN74zB8Q6PYDBg0u
 D95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Df4pM7W6JOXXmKbUY3pDG5ljOXIdG4Y0v5QZ/nEgvsA=;
 b=A9xD/Jl6RLfOHw7CEClps74L/vQt5lwjy87LDMJoe3OD141zVneA/RazhHixzVKrGO
 fAOOWL+buSWHqkgfvbYQI1BEKNDcZyrWWCQl9bIbgeqO80nnkSt5UoxYrZ5H2oMgf+Rf
 ixDdjbLGH2dmO2NtO+36DRM1RFjFRxtgaDDkqUCvMfeVrEv9LrkTS9uWnCLFde7Awg1i
 du0JvN9sHiMPLMNglPjWHh5Dm0AnDV71PzeKjWiAVA+egHHPfVU6HrcT1ybR121GpDeO
 Box42mfWtZqZ5c4/6MEmEB6UwNeQUy94cs2XL2R9/NyPjM6peCSTFmFwY0dWr1R9EeIv
 Mxkg==
X-Gm-Message-State: AOAM530BudGA0j/HCa2sPMAtNIBWtaqzhFW5AVvExPsj7yFtSwUkh0er
 +7+DQAmz1o2f6skt9m6kgj15XUmRRZMoQTVX
X-Google-Smtp-Source: ABdhPJwjT5T+c7wZRng+Od1jkoO5IV1VXXTHSwzJfknNbdLL+AgAxfSRxUm7CZx6snImmEuGqv2c1A==
X-Received: by 2002:a05:6512:308f:: with SMTP id
 z15mr12722151lfd.192.1643587084580; 
 Sun, 30 Jan 2022 15:58:04 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id 8sm2132159lfq.200.2022.01.30.15.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:58:04 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/7] target/riscv: riscv_tr_init_disas_context: copy
 pointer-to-cfg into cfg_ptr
Date: Mon, 31 Jan 2022 00:57:54 +0100
Message-Id: <20220130235759.1378871-3-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220130235759.1378871-1-philipp.tomsich@vrull.eu>
References: <20220130235759.1378871-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::134
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x134.google.com
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
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Greg Favor <gfavor@ventanamicro.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
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

(no changes since v3)

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



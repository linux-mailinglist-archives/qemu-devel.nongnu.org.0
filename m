Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE69463142
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 11:41:00 +0100 (CET)
Received: from localhost ([::1]:53374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms0ZH-00012W-Hm
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 05:40:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ms0WO-0006mm-Bg
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 05:38:00 -0500
Received: from [2a00:1450:4864:20::32a] (port=39626
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ms0WM-0000PE-L6
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 05:38:00 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso19125791wmr.4
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 02:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/v1m4qA4Gd41n8sF4rBW1hEMHXgoFCZFYmlKAxz/UNs=;
 b=Tab4pbilmwYerSq6cvH5M/W+1i9sgXxgXfNhfO7QeV3J+ZBQ7Uac5tjdOKBr4sfg3N
 DXBC2v1sPGXQHiI7bk3o9J8gVGpyw+bn9nq2GnEoSMWyRXnrGjzzypj5AS2PLh9ALsnn
 eHU67YLLoeXSQf+UqXcB9zvMraRQbMMb866eLLaBXmsAjASDcX5R8nejdNgeQ8d1LoSC
 crUeeMruXVqWYRwEQVovGCrAvS+iwdf5eu4U0qpk7HVpZScLEXTBoHY1CrSfrMtRFUkL
 ZTXsDlK8LyOd88mno5HVkKxZwYacUN9w9f/yph98IGvCYqlvFKQc9TnBIq85K3qaqXIz
 R5dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/v1m4qA4Gd41n8sF4rBW1hEMHXgoFCZFYmlKAxz/UNs=;
 b=RhwenKatN2s9iefxlgzS72m6TGAkYDaoyUQAZF6ogSmNrk6plkHgUJtH2NZWfOGjxA
 QcOIHdnDGZ1UgKR/I1lgtRWVYDTOeIMmeG9JYH8YAniWFZDd4+kuf8pk3/iHmdD2WDmh
 ppP4za/RdAF/hg8fzEx2oWlvpfZejQNK3f7hP2f1BxEWm74QuOr5pA+obRijKwIHdUhr
 UjN179Qa8iq5TSQnh+6jrrmyoKjSIVsRc8uCzvLuZPa6GfTfMtZla+1VssWguP7BHIxy
 GdJAPFIOXJQYwFj3weyI26B6XEdQcTgt79i1F1tgbe0SeIH/vcqvQnWIC/9IoVcUexhg
 vK+Q==
X-Gm-Message-State: AOAM531wjB3TrLyw1EgfDPzgNZ2tW65Oo3yAX2pfsE3X6/HzmeISkOyo
 Hgm69kJsKK7OCzbpTNWo7s+3il7db1PE+8lFlSE=
X-Google-Smtp-Source: ABdhPJwgLM/bQjGVBSWaXpesrnQogrFFwppPHcjB6InKVubqEqBie16p028h/kaxDFZP24zOSL8GrA==
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr3964317wmh.104.1638268677160; 
 Tue, 30 Nov 2021 02:37:57 -0800 (PST)
Received: from cloudburst.home (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id m21sm16311280wrb.2.2021.11.30.02.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 02:37:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] target/m68k: Implement FTRAPcc
Date: Tue, 30 Nov 2021 11:37:52 +0100
Message-Id: <20211130103752.72099-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130103752.72099-1-richard.henderson@linaro.org>
References: <20211130103752.72099-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index cf29f35d91..3c04f9d1a9 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -5547,6 +5547,43 @@ DISAS_INSN(fscc)
     tcg_temp_free(tmp);
 }
 
+DISAS_INSN(ftrapcc)
+{
+    DisasCompare c;
+    TCGLabel *over;
+    uint16_t ext;
+    int cond;
+
+    ext = read_im16(env, s);
+    cond = ext & 0x3f;
+
+    /* Consume and discard the immediate operand. */
+    switch (extract32(insn, 0, 3)) {
+    case 2: /* ftrapcc.w */
+        (void)read_im16(env, s);
+        break;
+    case 3: /* ftrapcc.l */
+        (void)read_im32(env, s);
+        break;
+    case 4: /* ftrapcc (no operand) */
+        break;
+    default:
+        /* Illegal insn */
+        disas_undef(env, s, insn);
+        return;
+    }
+
+    /* Jump over if !cond. */
+    gen_fcc_cond(&c, s, cond);
+    update_cc_op(s);
+    over = gen_new_label();
+    tcg_gen_brcond_i32(tcg_invert_cond(c.tcond), c.v1, c.v2, over);
+    free_cond(&c);
+
+    gen_exception(s, s->base.pc_next, EXCP_TRAPCC);
+    gen_set_label(over);
+}
+
 #if defined(CONFIG_SOFTMMU)
 DISAS_INSN(frestore)
 {
@@ -6170,6 +6207,7 @@ void register_m68k_insns (CPUM68KState *env)
     INSN(fbcc,      f280, ffc0, CF_FPU);
     INSN(fpu,       f200, ffc0, FPU);
     INSN(fscc,      f240, ffc0, FPU);
+    INSN(ftrapcc,   f278, ff80, FPU);
     INSN(fbcc,      f280, ff80, FPU);
 #if defined(CONFIG_SOFTMMU)
     INSN(frestore,  f340, ffc0, CF_FPU);
-- 
2.25.1



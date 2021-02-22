Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE3E322269
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 23:54:27 +0100 (CET)
Received: from localhost ([::1]:52498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEK5y-0007hy-Q5
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 17:54:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEJrq-0001ZS-F3
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 17:39:50 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:44057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEJro-0005ei-Vr
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 17:39:50 -0500
Received: by mail-ej1-x62d.google.com with SMTP id w1so31654019ejf.11
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 14:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w42rjh8kWYW1iTxLcpjhEOnKOinsG7BggxSZMmsgS4w=;
 b=W6tgJkm0RJAwRYVBa5VhrxiAmPm0L1zm9PtXkWazVXhAWT9tF5CN9CtkW5LWJKaVbQ
 DHfCLBDBhRYjsWbYeQZRyL19uQzFf9gnVvsHrNuqB6x9P7yRhzzcd4yAp04Vzpw+cGhF
 uKwowmCwnAJYEqNW3MTFzKKFUMS5fofA4N2R0RhmOouxC97VGlzFB+ggb1mNdt+oJAuw
 Fn9Sl+gJ3ZWVbzyWFVEoSq8xt9+/zW8zw+UBcKcHAvj57QZCek48+yAjZvC3UV1WHH5P
 cKpwPrLUJUQypq8a9gexGH8uPtjw5aiOzyZ1nHktPl+Qx3vbuX96abfaRH79bRCCrGyx
 GPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=w42rjh8kWYW1iTxLcpjhEOnKOinsG7BggxSZMmsgS4w=;
 b=txNy5gC7vPjCsJXtU+4qtu6ARirq7m1THnq5CQ5z0xxsiubi8d2Gg39s4rMvatBohG
 5TrKjQ5FnLnTcaAUz5PIdoI1ZsE7U3hgJGRaUjh5IP0O7yaIwuQ95+ROWBqQto9IhnWW
 eJsaVEZ0Nru6lFvfc9lfvNKCciwW8qEgAz9VQsF0S/AI8SPh2pjysKnjqhE5BOAtayUX
 2Bjkho0jsy/XgacyUXOUyn521HJO6Y8zD0uwRn9bdLiQE2gSDGkiLw07/9CElBbJDI5r
 YNCtX/6sNrEPvJdnNVYkF8iC+j7GkA8dNn/gNZgGgyMDGAUMEKbeR0IWpSFGJ3DFRiDd
 jWXQ==
X-Gm-Message-State: AOAM532RieONcKhnh+iBRIvOFAsYfKo4015kc7yQB72unNM+5CVWRdx7
 EIVEvjEDleiNd/1OHS+KgF1F6uwn3d8=
X-Google-Smtp-Source: ABdhPJyTM+qFfnNHDD5/UgxzdPUcmBbxwo7hqSNmiaTcUYoo0F3VzS83rFuwImcIVOdywxA4+S+kfA==
X-Received: by 2002:a17:907:104e:: with SMTP id
 oy14mr22571144ejb.218.1614033587407; 
 Mon, 22 Feb 2021 14:39:47 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i18sm12889735edt.68.2021.02.22.14.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 14:39:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/10] target/mips: Make mxu_translate_init() /
 decode_ase_mxu() proto public
Date: Mon, 22 Feb 2021 23:38:59 +0100
Message-Id: <20210222223901.2792336-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210222223901.2792336-1-f4bug@amsat.org>
References: <20210222223901.2792336-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62d.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be able to move these functions out of the big translate.c,
make their prototype public.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.h | 6 ++++++
 target/mips/translate.c | 9 +++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index 468e29d7578..1801e7f819e 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -178,6 +178,12 @@ extern TCGv bcond;
 /* MSA */
 void msa_translate_init(void);
 
+/* MXU */
+#if !defined(TARGET_MIPS64)
+void mxu_translate_init(void);
+bool decode_ase_mxu(DisasContext *ctx, uint32_t insn);
+#endif /* !TARGET_MIPS64 */
+
 /* decodetree generated */
 bool decode_isa_rel6(DisasContext *ctx, uint32_t insn);
 bool decode_ase_msa(DisasContext *ctx, uint32_t insn);
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 52a7005e18f..609798a0bee 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -2046,7 +2046,7 @@ static const char * const mxuregnames[] = {
     "XR9",  "XR10", "XR11", "XR12", "XR13", "XR14", "XR15", "MXU_CR",
 };
 
-static void mxu_translate_init(void)
+void mxu_translate_init(void)
 {
     for (unsigned i = 0; i < NUMBER_OF_MXU_REGISTERS - 1; i++) {
         mxu_gpr[i] = tcg_global_mem_new(cpu_env,
@@ -2058,6 +2058,11 @@ static void mxu_translate_init(void)
                                 offsetof(CPUMIPSState, active_tc.mxu_cr),
                                 mxuregnames[NUMBER_OF_MXU_REGISTERS - 1]);
 }
+#else /* !defined(TARGET_MIPS64) */
+void mxu_translate_init(void)
+{
+    g_assert_not_reached();
+}
 #endif /* defined(TARGET_MIPS64) */
 
 /* General purpose registers moves. */
@@ -25789,7 +25794,7 @@ static void decode_opc_mxu__pool19(DisasContext *ctx)
     }
 }
 
-static bool decode_ase_mxu(DisasContext *ctx, uint32_t insn)
+bool decode_ase_mxu(DisasContext *ctx, uint32_t insn)
 {
     uint32_t opcode = extract32(insn, 0, 6);
 
-- 
2.26.2



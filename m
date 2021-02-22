Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 598CC322249
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 23:42:44 +0100 (CET)
Received: from localhost ([::1]:50642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEJub-0003OB-SU
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 17:42:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEJrv-0001j0-Q3
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 17:39:55 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:39477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEJru-0005hN-AR
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 17:39:55 -0500
Received: by mail-ed1-x52e.google.com with SMTP id h10so23910831edl.6
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 14:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GffC1GuMfIrowgrdDz3KRuGciqckVQz9nSpe3QdruD0=;
 b=giAGhhYxLS/S/BpECU8533DwHz8MPGcYE6NU7K+6MCcRoqlzxt3WfpFxwmcuKknT6U
 lfuCbOzmhy91G9OQQjJzy/xOKuFYU0SqOVf+MgFa2C9knrIdr+W6G7Hirqmze+R8RMuB
 JexjdZj/cwQ0l7YFq/PWvcK1QG+Xi2VFqYiGfAraxY5geQV1EYqxyKsMWTwxXjpivoek
 6h7ih6y0OT5q8pxQW7oNNPhBuld7D14MqCmmhDcXVdaFfN1VpRY4rImdJDupKJgARNVd
 I2nSdaWFnQjIO0ISoxaYWXdCsSO2sBNYMihvctPKZ20G8nbBoPy2XuC5YL3xPs+1tSaT
 3yrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GffC1GuMfIrowgrdDz3KRuGciqckVQz9nSpe3QdruD0=;
 b=gR2jkIc+zDI0J3USQgKjure0JgyA5eRsQXnkzEhoBKH5qIWEX190dD1gV6pm6v9QYu
 2kpMQNNs1vu7OBYrocMklUDguToDZV2y0aIhaEdato1GCSNXyC6p9KQ3T/FtuwuV2INP
 KlP+davj+dO9SUsHQDTIvugLZ3g1WDjxZIKaholD5co37hgBzmkf+BoQbI0RxdBvGQN9
 4qCPkXFsIe2/I9wgrMtcQ0O0TjC1GMNcS1yXbIFIT07g37bCuiWq41uKhlLP09QSjjqC
 lbRzlMGsI5COEx66TuuCqZxo8OL8VY7TCI51xBz7l4fKguD5afH+876HVpk3Je0Se6dG
 MTig==
X-Gm-Message-State: AOAM531Q3MTIGYqHMUObrgTgcnWbOKxLqEl9x7N8H6iZsXWXPcQnQesw
 J2tpNLmRsyGcF+5kp0i3PVcvQ+silRY=
X-Google-Smtp-Source: ABdhPJzVj8H+v7H5/dNrA0TnQIQyLe27LA4rb6k6i45bRutp0KFE+tm0Drllbw10vNBqHiC2BW/1bA==
X-Received: by 2002:a05:6402:151:: with SMTP id
 s17mr23862685edu.107.1614033592813; 
 Mon, 22 Feb 2021 14:39:52 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i17sm12293170ejo.25.2021.02.22.14.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 14:39:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/10] target/mips: Simplify 64-bit ifdef'ry of MXU code
Date: Mon, 22 Feb 2021 23:39:00 +0100
Message-Id: <20210222223901.2792336-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210222223901.2792336-1-f4bug@amsat.org>
References: <20210222223901.2792336-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52e.google.com
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

Check for 'TARGET_LONG_BITS == 32' and simplify 64-bit ifdef'ry.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.h |  2 --
 target/mips/translate.c | 18 ++++++++++--------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index 1801e7f819e..a807b3d2566 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -179,10 +179,8 @@ extern TCGv bcond;
 void msa_translate_init(void);
 
 /* MXU */
-#if !defined(TARGET_MIPS64)
 void mxu_translate_init(void);
 bool decode_ase_mxu(DisasContext *ctx, uint32_t insn);
-#endif /* !TARGET_MIPS64 */
 
 /* decodetree generated */
 bool decode_isa_rel6(DisasContext *ctx, uint32_t insn);
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 609798a0bee..68b5dee4bab 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -25850,6 +25850,15 @@ bool decode_ase_mxu(DisasContext *ctx, uint32_t insn)
     return true;
 }
 
+#else /* !defined(TARGET_MIPS64) */
+
+bool decode_ase_mxu(DisasContext *ctx, uint32_t insn)
+{
+    return false;
+}
+
+#endif /* defined(TARGET_MIPS64) */
+
 /*
  * Main MXU decoding function
  */
@@ -25871,9 +25880,6 @@ static void decode_opc_mxu(DisasContext *ctx, uint32_t insn)
     decode_ase_mxu(ctx, insn);
 }
 
-#endif /* !defined(TARGET_MIPS64) */
-
-
 static void decode_opc_special2_legacy(CPUMIPSState *env, DisasContext *ctx)
 {
     int rs, rt, rd;
@@ -27017,12 +27023,10 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
             break;
         }
 #endif
-#if !defined(TARGET_MIPS64)
-        if (ctx->insn_flags & ASE_MXU) {
+        if ((TARGET_LONG_BITS == 32) && (ctx->insn_flags & ASE_MXU)) {
             decode_opc_mxu(ctx, ctx->opcode);
             break;
         }
-#endif
         decode_opc_special2_legacy(env, ctx);
         break;
     case OPC_SPECIAL3:
@@ -28081,9 +28085,7 @@ void mips_tcg_init(void)
     cpu_llval = tcg_global_mem_new(cpu_env, offsetof(CPUMIPSState, llval),
                                    "llval");
 
-#if !defined(TARGET_MIPS64)
     mxu_translate_init();
-#endif /* !TARGET_MIPS64 */
 }
 
 void restore_state_to_opc(CPUMIPSState *env, TranslationBlock *tb,
-- 
2.26.2



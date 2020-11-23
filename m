Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D35402C1746
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 22:10:36 +0100 (CET)
Received: from localhost ([::1]:59716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khJ6Z-0008Pn-Rx
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 16:10:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIjL-0002QU-RE
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:46:36 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:55924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIjI-0001mr-SN
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:46:35 -0500
Received: by mail-wm1-x332.google.com with SMTP id x22so602134wmc.5
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 12:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U7NTzUqpG+USX3MdIDzS5276z0nx/Isk7EgCIUUfDCc=;
 b=so/llHmZNxnEbbPTXJQue3XieQ29fczo7/R8hV9nuVMU64aLwO/kU6wCynGDJ0nyFY
 E2pAv3tz5icMXxDuvDLFBfuekua9tz/cfJG/yFL+psC0ihc4ltdqbmu1ACQJDFVzPx6v
 ONGhW3nud08eyRFYyN55tjibIH2DJ6h+j2U30SXg4kjcpg0/byZ3AmvT3PnYh3mzlsUl
 mSNRfE1FKxlMvSYcE+WhdGyE2QgMZLbEhmkHFJIUHe/I7Bod0Ja/OInzME9JhVqEdS5G
 wVPHOb4e0G1lIJBHiaedaQOht1OK/1Go5+oHB4OVQDUUDwPRCY6ZFV9RqCQxllUyLAvn
 cPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=U7NTzUqpG+USX3MdIDzS5276z0nx/Isk7EgCIUUfDCc=;
 b=pGLGre40s8s3akuCGaT72Qenzv5jP87NLNUFxNJ53KPnm2jRaFps9dj3nyydGWsewo
 dNSE705C3t+NOUJRIEtGlQDDtYgc2pCCb0VE2lHtMHLP8c+vvQypkcw4yWDzP19Y6PIx
 2bI9/ivsJ+4iCJQw2No0CkQHzE444v7NWK8ros2fcNwtLeKJDkIB+pK1HdbdKOqgzB4N
 Oq3rN94oslg07yAqMIAZKHsMB2noShGrjprJC1CAStLJZlGhXSiYGKvNA0AxcEBH/TXl
 FkH6F0Sl+lcEvn5GrnjXiddRh4A1CLYKfoGoYgYlkF/HRGxwI6ZOBAIBBCv8i0nDxObZ
 cbCQ==
X-Gm-Message-State: AOAM533EMjcqbp360FhImilDEb8SydcXnY/LKGxRWB2XiKxkkw3qTgSV
 fIfZtNF66M8lEWOwOVqOmalMzysKdzg=
X-Google-Smtp-Source: ABdhPJwpDRXIedEQH8k+it6rMY2k1t7clw3UyGqrlwxx9LM0RIA5ruVkHSYXU7IndVVUEzrY97jr1w==
X-Received: by 2002:a1c:9695:: with SMTP id y143mr740023wmd.70.1606164390087; 
 Mon, 23 Nov 2020 12:46:30 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id z17sm854447wmf.15.2020.11.23.12.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 12:46:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/28] target/mips: Extract Loongson SIMD translation
 routines
Date: Mon, 23 Nov 2020 21:44:40 +0100
Message-Id: <20201123204448.3260804-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201123204448.3260804-1-f4bug@amsat.org>
References: <20201123204448.3260804-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

LoongSIMD (formerly LoongMMI in Loongson 2E/F) is the
128-bit SIMD extension from the LoongISA.

Extract ~500 lines of translation routines to
'vendor-loong-simd_translate.c.inc'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201120210844.2625602-19-f4bug@amsat.org>
---
 target/mips/translate.c                       | 483 +----------------
 target/mips/vendor-loong-simd_translate.c.inc | 492 ++++++++++++++++++
 2 files changed, 493 insertions(+), 482 deletions(-)
 create mode 100644 target/mips/vendor-loong-simd_translate.c.inc

diff --git a/target/mips/translate.c b/target/mips/translate.c
index ca2e79d955a..745bf9a9dd9 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -639,103 +639,6 @@ enum {
     OPC_BC2NEZ  = (0x0D << 21) | OPC_CP2,
 };
 
-#define MASK_LMMI(op)    (MASK_OP_MAJOR(op) | (op & (0x1F << 21)) | (op & 0x1F))
-
-enum {
-    OPC_PADDSH      = (24 << 21) | (0x00) | OPC_CP2,
-    OPC_PADDUSH     = (25 << 21) | (0x00) | OPC_CP2,
-    OPC_PADDH       = (26 << 21) | (0x00) | OPC_CP2,
-    OPC_PADDW       = (27 << 21) | (0x00) | OPC_CP2,
-    OPC_PADDSB      = (28 << 21) | (0x00) | OPC_CP2,
-    OPC_PADDUSB     = (29 << 21) | (0x00) | OPC_CP2,
-    OPC_PADDB       = (30 << 21) | (0x00) | OPC_CP2,
-    OPC_PADDD       = (31 << 21) | (0x00) | OPC_CP2,
-
-    OPC_PSUBSH      = (24 << 21) | (0x01) | OPC_CP2,
-    OPC_PSUBUSH     = (25 << 21) | (0x01) | OPC_CP2,
-    OPC_PSUBH       = (26 << 21) | (0x01) | OPC_CP2,
-    OPC_PSUBW       = (27 << 21) | (0x01) | OPC_CP2,
-    OPC_PSUBSB      = (28 << 21) | (0x01) | OPC_CP2,
-    OPC_PSUBUSB     = (29 << 21) | (0x01) | OPC_CP2,
-    OPC_PSUBB       = (30 << 21) | (0x01) | OPC_CP2,
-    OPC_PSUBD       = (31 << 21) | (0x01) | OPC_CP2,
-
-    OPC_PSHUFH      = (24 << 21) | (0x02) | OPC_CP2,
-    OPC_PACKSSWH    = (25 << 21) | (0x02) | OPC_CP2,
-    OPC_PACKSSHB    = (26 << 21) | (0x02) | OPC_CP2,
-    OPC_PACKUSHB    = (27 << 21) | (0x02) | OPC_CP2,
-    OPC_XOR_CP2     = (28 << 21) | (0x02) | OPC_CP2,
-    OPC_NOR_CP2     = (29 << 21) | (0x02) | OPC_CP2,
-    OPC_AND_CP2     = (30 << 21) | (0x02) | OPC_CP2,
-    OPC_PANDN       = (31 << 21) | (0x02) | OPC_CP2,
-
-    OPC_PUNPCKLHW   = (24 << 21) | (0x03) | OPC_CP2,
-    OPC_PUNPCKHHW   = (25 << 21) | (0x03) | OPC_CP2,
-    OPC_PUNPCKLBH   = (26 << 21) | (0x03) | OPC_CP2,
-    OPC_PUNPCKHBH   = (27 << 21) | (0x03) | OPC_CP2,
-    OPC_PINSRH_0    = (28 << 21) | (0x03) | OPC_CP2,
-    OPC_PINSRH_1    = (29 << 21) | (0x03) | OPC_CP2,
-    OPC_PINSRH_2    = (30 << 21) | (0x03) | OPC_CP2,
-    OPC_PINSRH_3    = (31 << 21) | (0x03) | OPC_CP2,
-
-    OPC_PAVGH       = (24 << 21) | (0x08) | OPC_CP2,
-    OPC_PAVGB       = (25 << 21) | (0x08) | OPC_CP2,
-    OPC_PMAXSH      = (26 << 21) | (0x08) | OPC_CP2,
-    OPC_PMINSH      = (27 << 21) | (0x08) | OPC_CP2,
-    OPC_PMAXUB      = (28 << 21) | (0x08) | OPC_CP2,
-    OPC_PMINUB      = (29 << 21) | (0x08) | OPC_CP2,
-
-    OPC_PCMPEQW     = (24 << 21) | (0x09) | OPC_CP2,
-    OPC_PCMPGTW     = (25 << 21) | (0x09) | OPC_CP2,
-    OPC_PCMPEQH     = (26 << 21) | (0x09) | OPC_CP2,
-    OPC_PCMPGTH     = (27 << 21) | (0x09) | OPC_CP2,
-    OPC_PCMPEQB     = (28 << 21) | (0x09) | OPC_CP2,
-    OPC_PCMPGTB     = (29 << 21) | (0x09) | OPC_CP2,
-
-    OPC_PSLLW       = (24 << 21) | (0x0A) | OPC_CP2,
-    OPC_PSLLH       = (25 << 21) | (0x0A) | OPC_CP2,
-    OPC_PMULLH      = (26 << 21) | (0x0A) | OPC_CP2,
-    OPC_PMULHH      = (27 << 21) | (0x0A) | OPC_CP2,
-    OPC_PMULUW      = (28 << 21) | (0x0A) | OPC_CP2,
-    OPC_PMULHUH     = (29 << 21) | (0x0A) | OPC_CP2,
-
-    OPC_PSRLW       = (24 << 21) | (0x0B) | OPC_CP2,
-    OPC_PSRLH       = (25 << 21) | (0x0B) | OPC_CP2,
-    OPC_PSRAW       = (26 << 21) | (0x0B) | OPC_CP2,
-    OPC_PSRAH       = (27 << 21) | (0x0B) | OPC_CP2,
-    OPC_PUNPCKLWD   = (28 << 21) | (0x0B) | OPC_CP2,
-    OPC_PUNPCKHWD   = (29 << 21) | (0x0B) | OPC_CP2,
-
-    OPC_ADDU_CP2    = (24 << 21) | (0x0C) | OPC_CP2,
-    OPC_OR_CP2      = (25 << 21) | (0x0C) | OPC_CP2,
-    OPC_ADD_CP2     = (26 << 21) | (0x0C) | OPC_CP2,
-    OPC_DADD_CP2    = (27 << 21) | (0x0C) | OPC_CP2,
-    OPC_SEQU_CP2    = (28 << 21) | (0x0C) | OPC_CP2,
-    OPC_SEQ_CP2     = (29 << 21) | (0x0C) | OPC_CP2,
-
-    OPC_SUBU_CP2    = (24 << 21) | (0x0D) | OPC_CP2,
-    OPC_PASUBUB     = (25 << 21) | (0x0D) | OPC_CP2,
-    OPC_SUB_CP2     = (26 << 21) | (0x0D) | OPC_CP2,
-    OPC_DSUB_CP2    = (27 << 21) | (0x0D) | OPC_CP2,
-    OPC_SLTU_CP2    = (28 << 21) | (0x0D) | OPC_CP2,
-    OPC_SLT_CP2     = (29 << 21) | (0x0D) | OPC_CP2,
-
-    OPC_SLL_CP2     = (24 << 21) | (0x0E) | OPC_CP2,
-    OPC_DSLL_CP2    = (25 << 21) | (0x0E) | OPC_CP2,
-    OPC_PEXTRH      = (26 << 21) | (0x0E) | OPC_CP2,
-    OPC_PMADDHW     = (27 << 21) | (0x0E) | OPC_CP2,
-    OPC_SLEU_CP2    = (28 << 21) | (0x0E) | OPC_CP2,
-    OPC_SLE_CP2     = (29 << 21) | (0x0E) | OPC_CP2,
-
-    OPC_SRL_CP2     = (24 << 21) | (0x0F) | OPC_CP2,
-    OPC_DSRL_CP2    = (25 << 21) | (0x0F) | OPC_CP2,
-    OPC_SRA_CP2     = (26 << 21) | (0x0F) | OPC_CP2,
-    OPC_DSRA_CP2    = (27 << 21) | (0x0F) | OPC_CP2,
-    OPC_BIADD       = (28 << 21) | (0x0F) | OPC_CP2,
-    OPC_PMOVMSKB    = (29 << 21) | (0x0F) | OPC_CP2,
-};
-
-
 #define MASK_CP3(op)                (MASK_OP_MAJOR(op) | (op & 0x3F))
 
 enum {
@@ -4768,391 +4671,6 @@ static void gen_loongson_integer(DisasContext *ctx, uint32_t opc,
     tcg_temp_free(t1);
 }
 
-/* Loongson multimedia instructions */
-static void gen_loongson_multimedia(DisasContext *ctx, int rd, int rs, int rt)
-{
-    uint32_t opc, shift_max;
-    TCGv_i64 t0, t1;
-    TCGCond cond;
-
-    opc = MASK_LMMI(ctx->opcode);
-    switch (opc) {
-    case OPC_ADD_CP2:
-    case OPC_SUB_CP2:
-    case OPC_DADD_CP2:
-    case OPC_DSUB_CP2:
-        t0 = tcg_temp_local_new_i64();
-        t1 = tcg_temp_local_new_i64();
-        break;
-    default:
-        t0 = tcg_temp_new_i64();
-        t1 = tcg_temp_new_i64();
-        break;
-    }
-
-    check_cp1_enabled(ctx);
-    gen_load_fpr64(ctx, t0, rs);
-    gen_load_fpr64(ctx, t1, rt);
-
-    switch (opc) {
-    case OPC_PADDSH:
-        gen_helper_paddsh(t0, t0, t1);
-        break;
-    case OPC_PADDUSH:
-        gen_helper_paddush(t0, t0, t1);
-        break;
-    case OPC_PADDH:
-        gen_helper_paddh(t0, t0, t1);
-        break;
-    case OPC_PADDW:
-        gen_helper_paddw(t0, t0, t1);
-        break;
-    case OPC_PADDSB:
-        gen_helper_paddsb(t0, t0, t1);
-        break;
-    case OPC_PADDUSB:
-        gen_helper_paddusb(t0, t0, t1);
-        break;
-    case OPC_PADDB:
-        gen_helper_paddb(t0, t0, t1);
-        break;
-
-    case OPC_PSUBSH:
-        gen_helper_psubsh(t0, t0, t1);
-        break;
-    case OPC_PSUBUSH:
-        gen_helper_psubush(t0, t0, t1);
-        break;
-    case OPC_PSUBH:
-        gen_helper_psubh(t0, t0, t1);
-        break;
-    case OPC_PSUBW:
-        gen_helper_psubw(t0, t0, t1);
-        break;
-    case OPC_PSUBSB:
-        gen_helper_psubsb(t0, t0, t1);
-        break;
-    case OPC_PSUBUSB:
-        gen_helper_psubusb(t0, t0, t1);
-        break;
-    case OPC_PSUBB:
-        gen_helper_psubb(t0, t0, t1);
-        break;
-
-    case OPC_PSHUFH:
-        gen_helper_pshufh(t0, t0, t1);
-        break;
-    case OPC_PACKSSWH:
-        gen_helper_packsswh(t0, t0, t1);
-        break;
-    case OPC_PACKSSHB:
-        gen_helper_packsshb(t0, t0, t1);
-        break;
-    case OPC_PACKUSHB:
-        gen_helper_packushb(t0, t0, t1);
-        break;
-
-    case OPC_PUNPCKLHW:
-        gen_helper_punpcklhw(t0, t0, t1);
-        break;
-    case OPC_PUNPCKHHW:
-        gen_helper_punpckhhw(t0, t0, t1);
-        break;
-    case OPC_PUNPCKLBH:
-        gen_helper_punpcklbh(t0, t0, t1);
-        break;
-    case OPC_PUNPCKHBH:
-        gen_helper_punpckhbh(t0, t0, t1);
-        break;
-    case OPC_PUNPCKLWD:
-        gen_helper_punpcklwd(t0, t0, t1);
-        break;
-    case OPC_PUNPCKHWD:
-        gen_helper_punpckhwd(t0, t0, t1);
-        break;
-
-    case OPC_PAVGH:
-        gen_helper_pavgh(t0, t0, t1);
-        break;
-    case OPC_PAVGB:
-        gen_helper_pavgb(t0, t0, t1);
-        break;
-    case OPC_PMAXSH:
-        gen_helper_pmaxsh(t0, t0, t1);
-        break;
-    case OPC_PMINSH:
-        gen_helper_pminsh(t0, t0, t1);
-        break;
-    case OPC_PMAXUB:
-        gen_helper_pmaxub(t0, t0, t1);
-        break;
-    case OPC_PMINUB:
-        gen_helper_pminub(t0, t0, t1);
-        break;
-
-    case OPC_PCMPEQW:
-        gen_helper_pcmpeqw(t0, t0, t1);
-        break;
-    case OPC_PCMPGTW:
-        gen_helper_pcmpgtw(t0, t0, t1);
-        break;
-    case OPC_PCMPEQH:
-        gen_helper_pcmpeqh(t0, t0, t1);
-        break;
-    case OPC_PCMPGTH:
-        gen_helper_pcmpgth(t0, t0, t1);
-        break;
-    case OPC_PCMPEQB:
-        gen_helper_pcmpeqb(t0, t0, t1);
-        break;
-    case OPC_PCMPGTB:
-        gen_helper_pcmpgtb(t0, t0, t1);
-        break;
-
-    case OPC_PSLLW:
-        gen_helper_psllw(t0, t0, t1);
-        break;
-    case OPC_PSLLH:
-        gen_helper_psllh(t0, t0, t1);
-        break;
-    case OPC_PSRLW:
-        gen_helper_psrlw(t0, t0, t1);
-        break;
-    case OPC_PSRLH:
-        gen_helper_psrlh(t0, t0, t1);
-        break;
-    case OPC_PSRAW:
-        gen_helper_psraw(t0, t0, t1);
-        break;
-    case OPC_PSRAH:
-        gen_helper_psrah(t0, t0, t1);
-        break;
-
-    case OPC_PMULLH:
-        gen_helper_pmullh(t0, t0, t1);
-        break;
-    case OPC_PMULHH:
-        gen_helper_pmulhh(t0, t0, t1);
-        break;
-    case OPC_PMULHUH:
-        gen_helper_pmulhuh(t0, t0, t1);
-        break;
-    case OPC_PMADDHW:
-        gen_helper_pmaddhw(t0, t0, t1);
-        break;
-
-    case OPC_PASUBUB:
-        gen_helper_pasubub(t0, t0, t1);
-        break;
-    case OPC_BIADD:
-        gen_helper_biadd(t0, t0);
-        break;
-    case OPC_PMOVMSKB:
-        gen_helper_pmovmskb(t0, t0);
-        break;
-
-    case OPC_PADDD:
-        tcg_gen_add_i64(t0, t0, t1);
-        break;
-    case OPC_PSUBD:
-        tcg_gen_sub_i64(t0, t0, t1);
-        break;
-    case OPC_XOR_CP2:
-        tcg_gen_xor_i64(t0, t0, t1);
-        break;
-    case OPC_NOR_CP2:
-        tcg_gen_nor_i64(t0, t0, t1);
-        break;
-    case OPC_AND_CP2:
-        tcg_gen_and_i64(t0, t0, t1);
-        break;
-    case OPC_OR_CP2:
-        tcg_gen_or_i64(t0, t0, t1);
-        break;
-
-    case OPC_PANDN:
-        tcg_gen_andc_i64(t0, t1, t0);
-        break;
-
-    case OPC_PINSRH_0:
-        tcg_gen_deposit_i64(t0, t0, t1, 0, 16);
-        break;
-    case OPC_PINSRH_1:
-        tcg_gen_deposit_i64(t0, t0, t1, 16, 16);
-        break;
-    case OPC_PINSRH_2:
-        tcg_gen_deposit_i64(t0, t0, t1, 32, 16);
-        break;
-    case OPC_PINSRH_3:
-        tcg_gen_deposit_i64(t0, t0, t1, 48, 16);
-        break;
-
-    case OPC_PEXTRH:
-        tcg_gen_andi_i64(t1, t1, 3);
-        tcg_gen_shli_i64(t1, t1, 4);
-        tcg_gen_shr_i64(t0, t0, t1);
-        tcg_gen_ext16u_i64(t0, t0);
-        break;
-
-    case OPC_ADDU_CP2:
-        tcg_gen_add_i64(t0, t0, t1);
-        tcg_gen_ext32s_i64(t0, t0);
-        break;
-    case OPC_SUBU_CP2:
-        tcg_gen_sub_i64(t0, t0, t1);
-        tcg_gen_ext32s_i64(t0, t0);
-        break;
-
-    case OPC_SLL_CP2:
-        shift_max = 32;
-        goto do_shift;
-    case OPC_SRL_CP2:
-        shift_max = 32;
-        goto do_shift;
-    case OPC_SRA_CP2:
-        shift_max = 32;
-        goto do_shift;
-    case OPC_DSLL_CP2:
-        shift_max = 64;
-        goto do_shift;
-    case OPC_DSRL_CP2:
-        shift_max = 64;
-        goto do_shift;
-    case OPC_DSRA_CP2:
-        shift_max = 64;
-        goto do_shift;
-    do_shift:
-        /* Make sure shift count isn't TCG undefined behaviour.  */
-        tcg_gen_andi_i64(t1, t1, shift_max - 1);
-
-        switch (opc) {
-        case OPC_SLL_CP2:
-        case OPC_DSLL_CP2:
-            tcg_gen_shl_i64(t0, t0, t1);
-            break;
-        case OPC_SRA_CP2:
-        case OPC_DSRA_CP2:
-            /*
-             * Since SRA is UndefinedResult without sign-extended inputs,
-             * we can treat SRA and DSRA the same.
-             */
-            tcg_gen_sar_i64(t0, t0, t1);
-            break;
-        case OPC_SRL_CP2:
-            /* We want to shift in zeros for SRL; zero-extend first.  */
-            tcg_gen_ext32u_i64(t0, t0);
-            /* FALLTHRU */
-        case OPC_DSRL_CP2:
-            tcg_gen_shr_i64(t0, t0, t1);
-            break;
-        }
-
-        if (shift_max == 32) {
-            tcg_gen_ext32s_i64(t0, t0);
-        }
-
-        /* Shifts larger than MAX produce zero.  */
-        tcg_gen_setcondi_i64(TCG_COND_LTU, t1, t1, shift_max);
-        tcg_gen_neg_i64(t1, t1);
-        tcg_gen_and_i64(t0, t0, t1);
-        break;
-
-    case OPC_ADD_CP2:
-    case OPC_DADD_CP2:
-        {
-            TCGv_i64 t2 = tcg_temp_new_i64();
-            TCGLabel *lab = gen_new_label();
-
-            tcg_gen_mov_i64(t2, t0);
-            tcg_gen_add_i64(t0, t1, t2);
-            if (opc == OPC_ADD_CP2) {
-                tcg_gen_ext32s_i64(t0, t0);
-            }
-            tcg_gen_xor_i64(t1, t1, t2);
-            tcg_gen_xor_i64(t2, t2, t0);
-            tcg_gen_andc_i64(t1, t2, t1);
-            tcg_temp_free_i64(t2);
-            tcg_gen_brcondi_i64(TCG_COND_GE, t1, 0, lab);
-            generate_exception(ctx, EXCP_OVERFLOW);
-            gen_set_label(lab);
-            break;
-        }
-
-    case OPC_SUB_CP2:
-    case OPC_DSUB_CP2:
-        {
-            TCGv_i64 t2 = tcg_temp_new_i64();
-            TCGLabel *lab = gen_new_label();
-
-            tcg_gen_mov_i64(t2, t0);
-            tcg_gen_sub_i64(t0, t1, t2);
-            if (opc == OPC_SUB_CP2) {
-                tcg_gen_ext32s_i64(t0, t0);
-            }
-            tcg_gen_xor_i64(t1, t1, t2);
-            tcg_gen_xor_i64(t2, t2, t0);
-            tcg_gen_and_i64(t1, t1, t2);
-            tcg_temp_free_i64(t2);
-            tcg_gen_brcondi_i64(TCG_COND_GE, t1, 0, lab);
-            generate_exception(ctx, EXCP_OVERFLOW);
-            gen_set_label(lab);
-            break;
-        }
-
-    case OPC_PMULUW:
-        tcg_gen_ext32u_i64(t0, t0);
-        tcg_gen_ext32u_i64(t1, t1);
-        tcg_gen_mul_i64(t0, t0, t1);
-        break;
-
-    case OPC_SEQU_CP2:
-    case OPC_SEQ_CP2:
-        cond = TCG_COND_EQ;
-        goto do_cc_cond;
-        break;
-    case OPC_SLTU_CP2:
-        cond = TCG_COND_LTU;
-        goto do_cc_cond;
-        break;
-    case OPC_SLT_CP2:
-        cond = TCG_COND_LT;
-        goto do_cc_cond;
-        break;
-    case OPC_SLEU_CP2:
-        cond = TCG_COND_LEU;
-        goto do_cc_cond;
-        break;
-    case OPC_SLE_CP2:
-        cond = TCG_COND_LE;
-    do_cc_cond:
-        {
-            int cc = (ctx->opcode >> 8) & 0x7;
-            TCGv_i64 t64 = tcg_temp_new_i64();
-            TCGv_i32 t32 = tcg_temp_new_i32();
-
-            tcg_gen_setcond_i64(cond, t64, t0, t1);
-            tcg_gen_extrl_i64_i32(t32, t64);
-            tcg_gen_deposit_i32(fpu_fcr31, fpu_fcr31, t32,
-                                get_fp_bit(cc), 1);
-
-            tcg_temp_free_i32(t32);
-            tcg_temp_free_i64(t64);
-        }
-        goto no_rd;
-        break;
-    default:
-        MIPS_INVAL("loongson_cp2");
-        generate_exception_end(ctx, EXCP_RI);
-        return;
-    }
-
-    gen_store_fpr64(ctx, t0, rd);
-
-no_rd:
-    tcg_temp_free_i64(t0);
-    tcg_temp_free_i64(t1);
-}
-
 static void gen_loongson_lswc2(DisasContext *ctx, int rt,
                                int rs, int rd)
 {
@@ -12939,6 +12457,7 @@ out:
 #include "mod-dsp_translate.c.inc"
 
 #include "vendor-vr54xx_translate.c.inc"
+#include "vendor-loong-simd_translate.c.inc"
 
 static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
 {
diff --git a/target/mips/vendor-loong-simd_translate.c.inc b/target/mips/vendor-loong-simd_translate.c.inc
new file mode 100644
index 00000000000..85b1de6c28a
--- /dev/null
+++ b/target/mips/vendor-loong-simd_translate.c.inc
@@ -0,0 +1,492 @@
+/*
+ *  Loongson SIMD translation routines.
+ *
+ *  Copyright (c) 2004-2005 Jocelyn Mayer
+ *  Copyright (c) 2006 Marius Groeger (FPU operations)
+ *  Copyright (c) 2006 Thiemo Seufer (MIPS32R2 support)
+ *  Copyright (c) 2009 CodeSourcery (MIPS16 and microMIPS support)
+ *  Copyright (c) 2011 Richard Henderson <rth@twiddle.net>
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+#define MASK_LMMI(op)    (MASK_OP_MAJOR(op) | (op & (0x1F << 21)) | (op & 0x1F))
+
+/* Loongson multimedia instructions */
+enum {
+    OPC_PADDSH      = (24 << 21) | (0x00) | OPC_CP2,
+    OPC_PADDUSH     = (25 << 21) | (0x00) | OPC_CP2,
+    OPC_PADDH       = (26 << 21) | (0x00) | OPC_CP2,
+    OPC_PADDW       = (27 << 21) | (0x00) | OPC_CP2,
+    OPC_PADDSB      = (28 << 21) | (0x00) | OPC_CP2,
+    OPC_PADDUSB     = (29 << 21) | (0x00) | OPC_CP2,
+    OPC_PADDB       = (30 << 21) | (0x00) | OPC_CP2,
+    OPC_PADDD       = (31 << 21) | (0x00) | OPC_CP2,
+
+    OPC_PSUBSH      = (24 << 21) | (0x01) | OPC_CP2,
+    OPC_PSUBUSH     = (25 << 21) | (0x01) | OPC_CP2,
+    OPC_PSUBH       = (26 << 21) | (0x01) | OPC_CP2,
+    OPC_PSUBW       = (27 << 21) | (0x01) | OPC_CP2,
+    OPC_PSUBSB      = (28 << 21) | (0x01) | OPC_CP2,
+    OPC_PSUBUSB     = (29 << 21) | (0x01) | OPC_CP2,
+    OPC_PSUBB       = (30 << 21) | (0x01) | OPC_CP2,
+    OPC_PSUBD       = (31 << 21) | (0x01) | OPC_CP2,
+
+    OPC_PSHUFH      = (24 << 21) | (0x02) | OPC_CP2,
+    OPC_PACKSSWH    = (25 << 21) | (0x02) | OPC_CP2,
+    OPC_PACKSSHB    = (26 << 21) | (0x02) | OPC_CP2,
+    OPC_PACKUSHB    = (27 << 21) | (0x02) | OPC_CP2,
+    OPC_XOR_CP2     = (28 << 21) | (0x02) | OPC_CP2,
+    OPC_NOR_CP2     = (29 << 21) | (0x02) | OPC_CP2,
+    OPC_AND_CP2     = (30 << 21) | (0x02) | OPC_CP2,
+    OPC_PANDN       = (31 << 21) | (0x02) | OPC_CP2,
+
+    OPC_PUNPCKLHW   = (24 << 21) | (0x03) | OPC_CP2,
+    OPC_PUNPCKHHW   = (25 << 21) | (0x03) | OPC_CP2,
+    OPC_PUNPCKLBH   = (26 << 21) | (0x03) | OPC_CP2,
+    OPC_PUNPCKHBH   = (27 << 21) | (0x03) | OPC_CP2,
+    OPC_PINSRH_0    = (28 << 21) | (0x03) | OPC_CP2,
+    OPC_PINSRH_1    = (29 << 21) | (0x03) | OPC_CP2,
+    OPC_PINSRH_2    = (30 << 21) | (0x03) | OPC_CP2,
+    OPC_PINSRH_3    = (31 << 21) | (0x03) | OPC_CP2,
+
+    OPC_PAVGH       = (24 << 21) | (0x08) | OPC_CP2,
+    OPC_PAVGB       = (25 << 21) | (0x08) | OPC_CP2,
+    OPC_PMAXSH      = (26 << 21) | (0x08) | OPC_CP2,
+    OPC_PMINSH      = (27 << 21) | (0x08) | OPC_CP2,
+    OPC_PMAXUB      = (28 << 21) | (0x08) | OPC_CP2,
+    OPC_PMINUB      = (29 << 21) | (0x08) | OPC_CP2,
+
+    OPC_PCMPEQW     = (24 << 21) | (0x09) | OPC_CP2,
+    OPC_PCMPGTW     = (25 << 21) | (0x09) | OPC_CP2,
+    OPC_PCMPEQH     = (26 << 21) | (0x09) | OPC_CP2,
+    OPC_PCMPGTH     = (27 << 21) | (0x09) | OPC_CP2,
+    OPC_PCMPEQB     = (28 << 21) | (0x09) | OPC_CP2,
+    OPC_PCMPGTB     = (29 << 21) | (0x09) | OPC_CP2,
+
+    OPC_PSLLW       = (24 << 21) | (0x0A) | OPC_CP2,
+    OPC_PSLLH       = (25 << 21) | (0x0A) | OPC_CP2,
+    OPC_PMULLH      = (26 << 21) | (0x0A) | OPC_CP2,
+    OPC_PMULHH      = (27 << 21) | (0x0A) | OPC_CP2,
+    OPC_PMULUW      = (28 << 21) | (0x0A) | OPC_CP2,
+    OPC_PMULHUH     = (29 << 21) | (0x0A) | OPC_CP2,
+
+    OPC_PSRLW       = (24 << 21) | (0x0B) | OPC_CP2,
+    OPC_PSRLH       = (25 << 21) | (0x0B) | OPC_CP2,
+    OPC_PSRAW       = (26 << 21) | (0x0B) | OPC_CP2,
+    OPC_PSRAH       = (27 << 21) | (0x0B) | OPC_CP2,
+    OPC_PUNPCKLWD   = (28 << 21) | (0x0B) | OPC_CP2,
+    OPC_PUNPCKHWD   = (29 << 21) | (0x0B) | OPC_CP2,
+
+    OPC_ADDU_CP2    = (24 << 21) | (0x0C) | OPC_CP2,
+    OPC_OR_CP2      = (25 << 21) | (0x0C) | OPC_CP2,
+    OPC_ADD_CP2     = (26 << 21) | (0x0C) | OPC_CP2,
+    OPC_DADD_CP2    = (27 << 21) | (0x0C) | OPC_CP2,
+    OPC_SEQU_CP2    = (28 << 21) | (0x0C) | OPC_CP2,
+    OPC_SEQ_CP2     = (29 << 21) | (0x0C) | OPC_CP2,
+
+    OPC_SUBU_CP2    = (24 << 21) | (0x0D) | OPC_CP2,
+    OPC_PASUBUB     = (25 << 21) | (0x0D) | OPC_CP2,
+    OPC_SUB_CP2     = (26 << 21) | (0x0D) | OPC_CP2,
+    OPC_DSUB_CP2    = (27 << 21) | (0x0D) | OPC_CP2,
+    OPC_SLTU_CP2    = (28 << 21) | (0x0D) | OPC_CP2,
+    OPC_SLT_CP2     = (29 << 21) | (0x0D) | OPC_CP2,
+
+    OPC_SLL_CP2     = (24 << 21) | (0x0E) | OPC_CP2,
+    OPC_DSLL_CP2    = (25 << 21) | (0x0E) | OPC_CP2,
+    OPC_PEXTRH      = (26 << 21) | (0x0E) | OPC_CP2,
+    OPC_PMADDHW     = (27 << 21) | (0x0E) | OPC_CP2,
+    OPC_SLEU_CP2    = (28 << 21) | (0x0E) | OPC_CP2,
+    OPC_SLE_CP2     = (29 << 21) | (0x0E) | OPC_CP2,
+
+    OPC_SRL_CP2     = (24 << 21) | (0x0F) | OPC_CP2,
+    OPC_DSRL_CP2    = (25 << 21) | (0x0F) | OPC_CP2,
+    OPC_SRA_CP2     = (26 << 21) | (0x0F) | OPC_CP2,
+    OPC_DSRA_CP2    = (27 << 21) | (0x0F) | OPC_CP2,
+    OPC_BIADD       = (28 << 21) | (0x0F) | OPC_CP2,
+    OPC_PMOVMSKB    = (29 << 21) | (0x0F) | OPC_CP2,
+};
+
+static void gen_loongson_multimedia(DisasContext *ctx, int rd, int rs, int rt)
+{
+    uint32_t opc, shift_max;
+    TCGv_i64 t0, t1;
+    TCGCond cond;
+
+    opc = MASK_LMMI(ctx->opcode);
+    switch (opc) {
+    case OPC_ADD_CP2:
+    case OPC_SUB_CP2:
+    case OPC_DADD_CP2:
+    case OPC_DSUB_CP2:
+        t0 = tcg_temp_local_new_i64();
+        t1 = tcg_temp_local_new_i64();
+        break;
+    default:
+        t0 = tcg_temp_new_i64();
+        t1 = tcg_temp_new_i64();
+        break;
+    }
+
+    check_cp1_enabled(ctx);
+    gen_load_fpr64(ctx, t0, rs);
+    gen_load_fpr64(ctx, t1, rt);
+
+    switch (opc) {
+    case OPC_PADDSH:
+        gen_helper_paddsh(t0, t0, t1);
+        break;
+    case OPC_PADDUSH:
+        gen_helper_paddush(t0, t0, t1);
+        break;
+    case OPC_PADDH:
+        gen_helper_paddh(t0, t0, t1);
+        break;
+    case OPC_PADDW:
+        gen_helper_paddw(t0, t0, t1);
+        break;
+    case OPC_PADDSB:
+        gen_helper_paddsb(t0, t0, t1);
+        break;
+    case OPC_PADDUSB:
+        gen_helper_paddusb(t0, t0, t1);
+        break;
+    case OPC_PADDB:
+        gen_helper_paddb(t0, t0, t1);
+        break;
+
+    case OPC_PSUBSH:
+        gen_helper_psubsh(t0, t0, t1);
+        break;
+    case OPC_PSUBUSH:
+        gen_helper_psubush(t0, t0, t1);
+        break;
+    case OPC_PSUBH:
+        gen_helper_psubh(t0, t0, t1);
+        break;
+    case OPC_PSUBW:
+        gen_helper_psubw(t0, t0, t1);
+        break;
+    case OPC_PSUBSB:
+        gen_helper_psubsb(t0, t0, t1);
+        break;
+    case OPC_PSUBUSB:
+        gen_helper_psubusb(t0, t0, t1);
+        break;
+    case OPC_PSUBB:
+        gen_helper_psubb(t0, t0, t1);
+        break;
+
+    case OPC_PSHUFH:
+        gen_helper_pshufh(t0, t0, t1);
+        break;
+    case OPC_PACKSSWH:
+        gen_helper_packsswh(t0, t0, t1);
+        break;
+    case OPC_PACKSSHB:
+        gen_helper_packsshb(t0, t0, t1);
+        break;
+    case OPC_PACKUSHB:
+        gen_helper_packushb(t0, t0, t1);
+        break;
+
+    case OPC_PUNPCKLHW:
+        gen_helper_punpcklhw(t0, t0, t1);
+        break;
+    case OPC_PUNPCKHHW:
+        gen_helper_punpckhhw(t0, t0, t1);
+        break;
+    case OPC_PUNPCKLBH:
+        gen_helper_punpcklbh(t0, t0, t1);
+        break;
+    case OPC_PUNPCKHBH:
+        gen_helper_punpckhbh(t0, t0, t1);
+        break;
+    case OPC_PUNPCKLWD:
+        gen_helper_punpcklwd(t0, t0, t1);
+        break;
+    case OPC_PUNPCKHWD:
+        gen_helper_punpckhwd(t0, t0, t1);
+        break;
+
+    case OPC_PAVGH:
+        gen_helper_pavgh(t0, t0, t1);
+        break;
+    case OPC_PAVGB:
+        gen_helper_pavgb(t0, t0, t1);
+        break;
+    case OPC_PMAXSH:
+        gen_helper_pmaxsh(t0, t0, t1);
+        break;
+    case OPC_PMINSH:
+        gen_helper_pminsh(t0, t0, t1);
+        break;
+    case OPC_PMAXUB:
+        gen_helper_pmaxub(t0, t0, t1);
+        break;
+    case OPC_PMINUB:
+        gen_helper_pminub(t0, t0, t1);
+        break;
+
+    case OPC_PCMPEQW:
+        gen_helper_pcmpeqw(t0, t0, t1);
+        break;
+    case OPC_PCMPGTW:
+        gen_helper_pcmpgtw(t0, t0, t1);
+        break;
+    case OPC_PCMPEQH:
+        gen_helper_pcmpeqh(t0, t0, t1);
+        break;
+    case OPC_PCMPGTH:
+        gen_helper_pcmpgth(t0, t0, t1);
+        break;
+    case OPC_PCMPEQB:
+        gen_helper_pcmpeqb(t0, t0, t1);
+        break;
+    case OPC_PCMPGTB:
+        gen_helper_pcmpgtb(t0, t0, t1);
+        break;
+
+    case OPC_PSLLW:
+        gen_helper_psllw(t0, t0, t1);
+        break;
+    case OPC_PSLLH:
+        gen_helper_psllh(t0, t0, t1);
+        break;
+    case OPC_PSRLW:
+        gen_helper_psrlw(t0, t0, t1);
+        break;
+    case OPC_PSRLH:
+        gen_helper_psrlh(t0, t0, t1);
+        break;
+    case OPC_PSRAW:
+        gen_helper_psraw(t0, t0, t1);
+        break;
+    case OPC_PSRAH:
+        gen_helper_psrah(t0, t0, t1);
+        break;
+
+    case OPC_PMULLH:
+        gen_helper_pmullh(t0, t0, t1);
+        break;
+    case OPC_PMULHH:
+        gen_helper_pmulhh(t0, t0, t1);
+        break;
+    case OPC_PMULHUH:
+        gen_helper_pmulhuh(t0, t0, t1);
+        break;
+    case OPC_PMADDHW:
+        gen_helper_pmaddhw(t0, t0, t1);
+        break;
+
+    case OPC_PASUBUB:
+        gen_helper_pasubub(t0, t0, t1);
+        break;
+    case OPC_BIADD:
+        gen_helper_biadd(t0, t0);
+        break;
+    case OPC_PMOVMSKB:
+        gen_helper_pmovmskb(t0, t0);
+        break;
+
+    case OPC_PADDD:
+        tcg_gen_add_i64(t0, t0, t1);
+        break;
+    case OPC_PSUBD:
+        tcg_gen_sub_i64(t0, t0, t1);
+        break;
+    case OPC_XOR_CP2:
+        tcg_gen_xor_i64(t0, t0, t1);
+        break;
+    case OPC_NOR_CP2:
+        tcg_gen_nor_i64(t0, t0, t1);
+        break;
+    case OPC_AND_CP2:
+        tcg_gen_and_i64(t0, t0, t1);
+        break;
+    case OPC_OR_CP2:
+        tcg_gen_or_i64(t0, t0, t1);
+        break;
+
+    case OPC_PANDN:
+        tcg_gen_andc_i64(t0, t1, t0);
+        break;
+
+    case OPC_PINSRH_0:
+        tcg_gen_deposit_i64(t0, t0, t1, 0, 16);
+        break;
+    case OPC_PINSRH_1:
+        tcg_gen_deposit_i64(t0, t0, t1, 16, 16);
+        break;
+    case OPC_PINSRH_2:
+        tcg_gen_deposit_i64(t0, t0, t1, 32, 16);
+        break;
+    case OPC_PINSRH_3:
+        tcg_gen_deposit_i64(t0, t0, t1, 48, 16);
+        break;
+
+    case OPC_PEXTRH:
+        tcg_gen_andi_i64(t1, t1, 3);
+        tcg_gen_shli_i64(t1, t1, 4);
+        tcg_gen_shr_i64(t0, t0, t1);
+        tcg_gen_ext16u_i64(t0, t0);
+        break;
+
+    case OPC_ADDU_CP2:
+        tcg_gen_add_i64(t0, t0, t1);
+        tcg_gen_ext32s_i64(t0, t0);
+        break;
+    case OPC_SUBU_CP2:
+        tcg_gen_sub_i64(t0, t0, t1);
+        tcg_gen_ext32s_i64(t0, t0);
+        break;
+
+    case OPC_SLL_CP2:
+        shift_max = 32;
+        goto do_shift;
+    case OPC_SRL_CP2:
+        shift_max = 32;
+        goto do_shift;
+    case OPC_SRA_CP2:
+        shift_max = 32;
+        goto do_shift;
+    case OPC_DSLL_CP2:
+        shift_max = 64;
+        goto do_shift;
+    case OPC_DSRL_CP2:
+        shift_max = 64;
+        goto do_shift;
+    case OPC_DSRA_CP2:
+        shift_max = 64;
+        goto do_shift;
+    do_shift:
+        /* Make sure shift count isn't TCG undefined behaviour.  */
+        tcg_gen_andi_i64(t1, t1, shift_max - 1);
+
+        switch (opc) {
+        case OPC_SLL_CP2:
+        case OPC_DSLL_CP2:
+            tcg_gen_shl_i64(t0, t0, t1);
+            break;
+        case OPC_SRA_CP2:
+        case OPC_DSRA_CP2:
+            /*
+             * Since SRA is UndefinedResult without sign-extended inputs,
+             * we can treat SRA and DSRA the same.
+             */
+            tcg_gen_sar_i64(t0, t0, t1);
+            break;
+        case OPC_SRL_CP2:
+            /* We want to shift in zeros for SRL; zero-extend first.  */
+            tcg_gen_ext32u_i64(t0, t0);
+            /* FALLTHRU */
+        case OPC_DSRL_CP2:
+            tcg_gen_shr_i64(t0, t0, t1);
+            break;
+        }
+
+        if (shift_max == 32) {
+            tcg_gen_ext32s_i64(t0, t0);
+        }
+
+        /* Shifts larger than MAX produce zero.  */
+        tcg_gen_setcondi_i64(TCG_COND_LTU, t1, t1, shift_max);
+        tcg_gen_neg_i64(t1, t1);
+        tcg_gen_and_i64(t0, t0, t1);
+        break;
+
+    case OPC_ADD_CP2:
+    case OPC_DADD_CP2:
+        {
+            TCGv_i64 t2 = tcg_temp_new_i64();
+            TCGLabel *lab = gen_new_label();
+
+            tcg_gen_mov_i64(t2, t0);
+            tcg_gen_add_i64(t0, t1, t2);
+            if (opc == OPC_ADD_CP2) {
+                tcg_gen_ext32s_i64(t0, t0);
+            }
+            tcg_gen_xor_i64(t1, t1, t2);
+            tcg_gen_xor_i64(t2, t2, t0);
+            tcg_gen_andc_i64(t1, t2, t1);
+            tcg_temp_free_i64(t2);
+            tcg_gen_brcondi_i64(TCG_COND_GE, t1, 0, lab);
+            generate_exception(ctx, EXCP_OVERFLOW);
+            gen_set_label(lab);
+            break;
+        }
+
+    case OPC_SUB_CP2:
+    case OPC_DSUB_CP2:
+        {
+            TCGv_i64 t2 = tcg_temp_new_i64();
+            TCGLabel *lab = gen_new_label();
+
+            tcg_gen_mov_i64(t2, t0);
+            tcg_gen_sub_i64(t0, t1, t2);
+            if (opc == OPC_SUB_CP2) {
+                tcg_gen_ext32s_i64(t0, t0);
+            }
+            tcg_gen_xor_i64(t1, t1, t2);
+            tcg_gen_xor_i64(t2, t2, t0);
+            tcg_gen_and_i64(t1, t1, t2);
+            tcg_temp_free_i64(t2);
+            tcg_gen_brcondi_i64(TCG_COND_GE, t1, 0, lab);
+            generate_exception(ctx, EXCP_OVERFLOW);
+            gen_set_label(lab);
+            break;
+        }
+
+    case OPC_PMULUW:
+        tcg_gen_ext32u_i64(t0, t0);
+        tcg_gen_ext32u_i64(t1, t1);
+        tcg_gen_mul_i64(t0, t0, t1);
+        break;
+
+    case OPC_SEQU_CP2:
+    case OPC_SEQ_CP2:
+        cond = TCG_COND_EQ;
+        goto do_cc_cond;
+        break;
+    case OPC_SLTU_CP2:
+        cond = TCG_COND_LTU;
+        goto do_cc_cond;
+        break;
+    case OPC_SLT_CP2:
+        cond = TCG_COND_LT;
+        goto do_cc_cond;
+        break;
+    case OPC_SLEU_CP2:
+        cond = TCG_COND_LEU;
+        goto do_cc_cond;
+        break;
+    case OPC_SLE_CP2:
+        cond = TCG_COND_LE;
+    do_cc_cond:
+        {
+            int cc = (ctx->opcode >> 8) & 0x7;
+            TCGv_i64 t64 = tcg_temp_new_i64();
+            TCGv_i32 t32 = tcg_temp_new_i32();
+
+            tcg_gen_setcond_i64(cond, t64, t0, t1);
+            tcg_gen_extrl_i64_i32(t32, t64);
+            tcg_gen_deposit_i32(fpu_fcr31, fpu_fcr31, t32,
+                                get_fp_bit(cc), 1);
+
+            tcg_temp_free_i32(t32);
+            tcg_temp_free_i64(t64);
+        }
+        goto no_rd;
+        break;
+    default:
+        MIPS_INVAL("loongson_cp2");
+        generate_exception_end(ctx, EXCP_RI);
+        return;
+    }
+
+    gen_store_fpr64(ctx, t0, rd);
+
+no_rd:
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+}
-- 
2.26.2



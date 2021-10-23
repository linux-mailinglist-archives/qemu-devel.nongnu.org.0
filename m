Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE3143859E
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 23:54:56 +0200 (CEST)
Received: from localhost ([::1]:59900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meOyd-0004bn-Uv
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 17:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOsr-0004cx-BR
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:48:57 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOsp-0005O7-HG
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:48:57 -0400
Received: by mail-wr1-x42e.google.com with SMTP id e4so4823846wrc.7
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Ns3yPDdWxoYZoBcHHwK2IFet9te9Ef1ptNKNtMRrnA=;
 b=pyAhcYePKJKQjPSLDJIFyQ0KgQaWc9OBwb/eCJXHvS0YsgkFZqI+2aO/Iwndg7vBFr
 dYrShSfe7XJz4L+QG12lTJLm+gjE+GbM6YvYD+zmccoNxhZnkzJBOC7aNVPBKiXC3mdN
 cMgH6f7mywB7DGtd2uTRoEJKXM0BcyBw6sm/w4eFcVfhcAP2vsHuqZVHWDcSrGzthiwq
 p+9jI24omnOprv1kRvGYAjiBrWy7iQrJ/miTemcTu9NciWCvsaxxBxzHISej/hvgVlqz
 YiFXskOPBiLsYn1yNadi4e3qhTvICgrIp9L2BhJNM8N3VRSZd2TlASMLrKFf9VS+TQ3J
 XvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+Ns3yPDdWxoYZoBcHHwK2IFet9te9Ef1ptNKNtMRrnA=;
 b=sU4q5MiKr3Uy2fTQNqjA6aj9pW97JbNE9VBrwznPasu7qu/1V1KV/VeOz7975ZbbFS
 Zd39kRF6olMM8gZSsgeYkPoBZw1Z8O1rFrZfBbaJEmOCn97yp42m1OV7pcmv8xEtyzLy
 kaPdde01POg6k7CvGS84+WlfXAS4Bt/UY5QEe6OkrpqyLwPI1hjonwgE0FSPNXTFx/K9
 dIRPZ4msIwqujMw0raH42UXhRLaQ+MEhkwUIzPYS21OYKUV3ek5iwKUtPD4W/6+jf+Uu
 gT5uBSCLIhqcdMK1O13PInhTbiIlGXUUaJSDCYqzWDWc7TqGP1WCFjWmS0JgQ9a5grkL
 lAGw==
X-Gm-Message-State: AOAM532tm9vHKL7oHELEHI91B6d9MNpFSiBdoBjs9kMN7/FJJ1ccO+Iz
 aJoWWpRhPmjRVq3fITCYwGid7rh2Ahg=
X-Google-Smtp-Source: ABdhPJy9M3aMf80j+V7BZAYIqnpnV/0Uz3HnqA3UZAlT3wzE2v9YdZkWbAW+D9HjDCCJRuKyjBSHJg==
X-Received: by 2002:adf:c78d:: with SMTP id l13mr10114222wrg.134.1635025733991; 
 Sat, 23 Oct 2021 14:48:53 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 k10sm14650554wmr.32.2021.10.23.14.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 14:48:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/33] target/mips: Extract df_extract() helper
Date: Sat, 23 Oct 2021 23:47:40 +0200
Message-Id: <20211023214803.522078-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023214803.522078-1-f4bug@amsat.org>
References: <20211023214803.522078-1-f4bug@amsat.org>
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luis Pires <luis.pires@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the common code which parses data formats to an helper.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa_translate.c | 68 +++++++++++++++++++--------------
 1 file changed, 39 insertions(+), 29 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 3b0dfcca69d..7c1bbfaec61 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -272,6 +272,40 @@ static const char msaregnames[][6] = {
     "w30.d0", "w30.d1", "w31.d0", "w31.d1",
 };
 
+/* Encoding of Operation Field */
+static const struct dfe {
+    enum CPUMIPSMSADataFormat df;
+    int start;
+    int length;
+    uint32_t value;
+} df_elm[] = {
+    /* Table 3.26 ELM Instruction Format */
+    {DF_BYTE,   4, 2, 0b00},
+    {DF_HALF,   3, 3, 0b100},
+    {DF_WORD,   2, 4, 0b1100},
+    {DF_DOUBLE, 1, 5, 0b11100}
+}, df_bit[] = {
+    /* Table 3.28 BIT Instruction Format */
+    {DF_BYTE,   3, 4, 0b1110},
+    {DF_HALF,   4, 3, 0b110},
+    {DF_WORD,   5, 2, 0b10},
+    {DF_DOUBLE, 6, 1, 0b0}
+};
+
+/* Extract Operation Field (used by ELM & BIT instructions) */
+static bool df_extract(const struct dfe *s, int value,
+                       enum CPUMIPSMSADataFormat *df, uint32_t *x)
+{
+    for (unsigned i = 0; i < 4; i++) {
+        if (extract32(value, s->start, s->length) == s->value) {
+            *x = extract32(value, 0, s->start);
+            *df = s->df;
+            return true;
+        }
+    }
+    return false;
+}
+
 static TCGv_i64 msa_wr_d[64];
 
 void msa_translate_init(void)
@@ -562,7 +596,6 @@ static void gen_msa_bit(DisasContext *ctx)
 {
 #define MASK_MSA_BIT(op)    (MASK_MSA_MINOR(op) | (op & (0x7 << 23)))
     uint8_t dfm = (ctx->opcode >> 16) & 0x7f;
-    uint32_t df = 0, m = 0;
     uint8_t ws = (ctx->opcode >> 11) & 0x1f;
     uint8_t wd = (ctx->opcode >> 6) & 0x1f;
 
@@ -570,20 +603,9 @@ static void gen_msa_bit(DisasContext *ctx)
     TCGv_i32 tm;
     TCGv_i32 twd;
     TCGv_i32 tws;
+    uint32_t df, m;
 
-    if ((dfm & 0x40) == 0x00) {
-        m = dfm & 0x3f;
-        df = DF_DOUBLE;
-    } else if ((dfm & 0x60) == 0x40) {
-        m = dfm & 0x1f;
-        df = DF_WORD;
-    } else if ((dfm & 0x70) == 0x60) {
-        m = dfm & 0x0f;
-        df = DF_HALF;
-    } else if ((dfm & 0x78) == 0x70) {
-        m = dfm & 0x7;
-        df = DF_BYTE;
-    } else {
+    if (!df_extract(df_bit, dfm, &df, &m)) {
         gen_reserved_instruction(ctx);
         return;
     }
@@ -1768,25 +1790,13 @@ static void gen_msa_elm_df(DisasContext *ctx, uint32_t df, uint32_t n)
 static void gen_msa_elm(DisasContext *ctx)
 {
     uint8_t dfn = (ctx->opcode >> 16) & 0x3f;
-    uint32_t df = 0, n = 0;
+    uint32_t df, n;
 
-    if ((dfn & 0x30) == 0x00) {
-        n = dfn & 0x0f;
-        df = DF_BYTE;
-    } else if ((dfn & 0x38) == 0x20) {
-        n = dfn & 0x07;
-        df = DF_HALF;
-    } else if ((dfn & 0x3c) == 0x30) {
-        n = dfn & 0x03;
-        df = DF_WORD;
-    } else if ((dfn & 0x3e) == 0x38) {
-        n = dfn & 0x01;
-        df = DF_DOUBLE;
-    } else if (dfn == 0x3E) {
+    if (dfn == 0x3E) {
         /* CTCMSA, CFCMSA, MOVE.V */
         gen_msa_elm_3e(ctx);
         return;
-    } else {
+    } else if (!df_extract(df_elm, dfn, &df, &n)) {
         gen_reserved_instruction(ctx);
         return;
     }
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 193D4339387
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 17:38:10 +0100 (CET)
Received: from localhost ([::1]:50966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKkng-0001po-UX
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 11:38:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKkao-000612-WF
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 11:24:51 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKkam-00056q-VK
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 11:24:50 -0500
Received: by mail-wr1-x431.google.com with SMTP id 7so5141841wrz.0
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 08:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MFJpIurynqRyhm6WKyjjaiH7G1UzD6b8NLnAxQpA8KU=;
 b=vFbABkIwCdoK19IPc/6UZIPdJakyJst5vRSLQCfdlDjSyX0Sw+efqZK+TlSkDNHO5r
 ZXFx8UxoAixlU7gVsOrt/R+mcvFxn2gZPQ8NZkqkK62ZuA37sfcDf1T5b61B7K/HSmr+
 +5tGgW1LLesfl5c6ESVrlyCUskNjGIZzom/YDaDEnNZIhqmbV/ckicXn5Zv4xkTZZqBe
 Cqtrr52eT45Qp4tyYMf7mUb3RHEpZy6q/cPsahBcQ/zB3wyrxaASj313ps9WqN/xYGNt
 tKe4efJoITMzBVi+2/50BiJKLfq7shwLT6eMM5tgLnVBBiXgbSbwP5wts59xipcUU+FJ
 8Afg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MFJpIurynqRyhm6WKyjjaiH7G1UzD6b8NLnAxQpA8KU=;
 b=meHDEaiAoNe+pJa+rBU5RkrknfmAm2W1m9aWmW1A0QIy6QxasT8P8WqlEAqWK7zuYN
 4WG1sbUOHbSgil2pvz8N7WCngDO+Hl0JsiqLOOz5RaprYM6owNxzEc6T5q43pHIC6o+w
 UEN33koEhg2PevmlBPsCcPsuZFI16GUROUzLU7ILQ2iZorfd3xHZ+0pI6P6JYNgjZc5I
 TPRAnvTzldT50u+YXhw4bEiI+v7/hfCv4dowIDszoOoWGYNS0188mVUqKSQvB5WHQQst
 rENp2MJIUQOwQEO+NvSGmmAnQarGuhIt7sZ5NQXflo02vRKs8fHwC4KNJUKzjYSYVsQ8
 38Vw==
X-Gm-Message-State: AOAM530e7e6fJEQpyO7zQ/LXyl7EWKwSgLHJojU1AoejLJrBH7l3wmtu
 9wOCuxOJpkJrbWyuvCPV97z6zfQ1XLI=
X-Google-Smtp-Source: ABdhPJxJlwsre6e/xO37BMerFwaJ76nFWEMAvLNhrq5mWYEVqaVCpN4rH27bTHOoS4BLjiFxvdkdew==
X-Received: by 2002:a5d:49ca:: with SMTP id t10mr6723713wrs.76.1615566287171; 
 Fri, 12 Mar 2021 08:24:47 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id h20sm2647242wmm.19.2021.03.12.08.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 08:24:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/5] target/mips/tx79: Introduce SQ opcode (Store Quadword)
Date: Fri, 12 Mar 2021 17:24:31 +0100
Message-Id: <20210312162434.1869129-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210312162434.1869129-1-f4bug@amsat.org>
References: <20210312162434.1869129-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Fredrik Noring <noring@nocrew.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the SQ opcode (Store Quadword).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210214175912.732946-27-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tx79.decode      |  1 +
 target/mips/tx79_translate.c | 27 +++++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/target/mips/tx79.decode b/target/mips/tx79.decode
index f1f17470a00..0756b13149e 100644
--- a/target/mips/tx79.decode
+++ b/target/mips/tx79.decode
@@ -45,3 +45,4 @@ PCPYH           011100 00000 ..... ..... 11011 101001   @rt_rd
 # SPECIAL
 
 LQ              011110 ..... ..... ................     @ldst
+SQ              011111 ..... ..... ................     @ldst
diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
index b5a9eb3de76..d840dfdb9cc 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -212,6 +212,33 @@ static bool trans_LQ(DisasContext *ctx, arg_itype *a)
     return true;
 }
 
+static bool trans_SQ(DisasContext *ctx, arg_itype *a)
+{
+    TCGv_i64 t0 = tcg_temp_new_i64();
+    TCGv addr = tcg_temp_new();
+
+    gen_base_offset_addr(ctx, addr, a->base, a->offset);
+    /*
+     * Clear least-significant four bits of the effective
+     * address, effectively creating an aligned address.
+     */
+    tcg_gen_andi_tl(addr, addr, ~0xf);
+
+    /* Lower half */
+    gen_load_gpr(t0, a->rt);
+    tcg_gen_qemu_st_i64(t0, addr, ctx->mem_idx, MO_TEQ);
+
+    /* Upper half */
+    tcg_gen_addi_i64(addr, addr, 8);
+    gen_load_gpr_hi(t0, a->rt);
+    tcg_gen_qemu_st_i64(t0, addr, ctx->mem_idx, MO_TEQ);
+
+    tcg_temp_free(addr);
+    tcg_temp_free(t0);
+
+    return true;
+}
+
 /*
  *     Multiply and Divide (19 instructions)
  *     -------------------------------------
-- 
2.26.2



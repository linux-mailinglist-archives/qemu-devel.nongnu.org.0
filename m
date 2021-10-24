Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C5A438AA0
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 18:24:45 +0200 (CEST)
Received: from localhost ([::1]:37190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1megIe-0001D2-Kq
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 12:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1megB6-0006Zk-AY; Sun, 24 Oct 2021 12:16:56 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1megAu-0008G0-IA; Sun, 24 Oct 2021 12:16:56 -0400
Received: by mail-wr1-x433.google.com with SMTP id d13so5584616wrf.11;
 Sun, 24 Oct 2021 09:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+eCufxrSs/JG/dcQv3XIP+vKdVUBYPST3YpjCTe8HCs=;
 b=epGvdkQeWhmvp0rdLyNV1/H5Iwe7YgjE/OBdHIdA+L1cWsSYUhDLDbh1886G+TDf4a
 0nioy9xlwZD6hnk+7iqodm49DC25+lFfXpioEWhd9pdn/NWIqQ3gWiwA8ScUJ/pmpz9c
 LGxiyKcvOLbEh3WCUsktPox9bwKVuA/c+pVaFLFyDEmMV40iEH+EOVXo9BtJuZnUnVwW
 1jzLdIXkGQfT3HqveeV6j/1eh3PFQZ7HGi3NPVDD1Iehjgglyiqy7p898uGZYn5jQyIQ
 q/YQuEQuhAjm1j6OfU/v3hCA0R0q0Z+UY/xU1QWdBrIkL/SCeVHVhb84DynumjtVKOAt
 /C1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+eCufxrSs/JG/dcQv3XIP+vKdVUBYPST3YpjCTe8HCs=;
 b=IVOtrM/iFlUr9jYTN46Fv4lvS9IBBJviloxjMKmS6Et2waBulksvSd8GZSsn+tPIWj
 cE2hc3fUQTJ1i09FZOkbsBuZibCE3KidMEssI96xtDewgGmjiH7c7H70kAS6YEdcd2ny
 XrRLCR6dVJ/3cnYJwtYLskjn+gImbfOpQH7Br5g51txR3Yq9xsInZ/G1izxZP5eipiEi
 dv2dkxzJNSJtNkE7UxW0F44cHGQXDEb7rcjGaaqEosh0A7E+hWJKXhAelnIeZdNZnNHv
 VPucJtMkrmC+hBvqUWevlpBlOhqijz5Ty9ITj6DQY5NGzgSPNfBTKgkR14Z6y3kyLK0u
 Gn+Q==
X-Gm-Message-State: AOAM533MPM+wPYhRsHgL1oGzB/BwgXVD8LoqXcXjWyxvJzXhWmRN0eif
 n5jHKIKjl6fc3/8njGAyzq54U8vyE3E=
X-Google-Smtp-Source: ABdhPJw7BuPEkbeYOFICkoPQqsO98cxpBRMN5M/gpOPDOwFPxHFZMko2Apof4OlJ42mrRGR4gWdJUQ==
X-Received: by 2002:adf:80cd:: with SMTP id 71mr16052364wrl.429.1635092201670; 
 Sun, 24 Oct 2021 09:16:41 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 f7sm12480929wmg.14.2021.10.24.09.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 09:16:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] target/ppc: Use tcg_constant_i32() in gen_ld/st()
Date: Sun, 24 Oct 2021 18:16:19 +0200
Message-Id: <20211024161619.325903-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211024161619.325903-1-f4bug@amsat.org>
References: <20211024161619.325903-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid using a TCG temporary by moving the MemOp index
to the constant pool.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/ppc/translate.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 507f6699f47..9a4ae61a39d 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -3347,15 +3347,14 @@ static void gen_lq(DisasContext *ctx)
 
     if (tb_cflags(ctx->base.tb) & CF_PARALLEL) {
         if (HAVE_ATOMIC128) {
-            TCGv_i32 oi = tcg_temp_new_i32();
+            TCGv_i32 oi;
             if (ctx->le_mode) {
-                tcg_gen_movi_i32(oi, make_memop_idx(MO_LEQ, ctx->mem_idx));
+                oi = tcg_constant_i32(make_memop_idx(MO_LEQ, ctx->mem_idx));
                 gen_helper_lq_le_parallel(lo, cpu_env, EA, oi);
             } else {
-                tcg_gen_movi_i32(oi, make_memop_idx(MO_BEQ, ctx->mem_idx));
+                oi = tcg_constant_i32(make_memop_idx(MO_BEQ, ctx->mem_idx));
                 gen_helper_lq_be_parallel(lo, cpu_env, EA, oi);
             }
-            tcg_temp_free_i32(oi);
             tcg_gen_ld_i64(hi, cpu_env, offsetof(CPUPPCState, retxh));
         } else {
             /* Restart with exclusive lock.  */
@@ -3458,17 +3457,16 @@ static void gen_std(DisasContext *ctx)
 
         if (tb_cflags(ctx->base.tb) & CF_PARALLEL) {
             if (HAVE_ATOMIC128) {
-                TCGv_i32 oi = tcg_temp_new_i32();
+                TCGv_i32 oi;
                 if (ctx->le_mode) {
-                    tcg_gen_movi_i32(oi, make_memop_idx(MO_LE | MO_128,
-                                                        ctx->mem_idx));
+                    oi = tcg_constant_i32(make_memop_idx(MO_LE | MO_128,
+                                                         ctx->mem_idx));
                     gen_helper_stq_le_parallel(cpu_env, EA, lo, hi, oi);
                 } else {
-                    tcg_gen_movi_i32(oi, make_memop_idx(MO_BE | MO_128,
-                                                        ctx->mem_idx));
+                    oi = tcg_constant_i32(make_memop_idx(MO_BE | MO_128,
+                                                         ctx->mem_idx));
                     gen_helper_stq_be_parallel(cpu_env, EA, lo, hi, oi);
                 }
-                tcg_temp_free_i32(oi);
             } else {
                 /* Restart with exclusive lock.  */
                 gen_helper_exit_atomic(cpu_env);
@@ -4065,17 +4063,16 @@ static void gen_lqarx(DisasContext *ctx)
 
     if (tb_cflags(ctx->base.tb) & CF_PARALLEL) {
         if (HAVE_ATOMIC128) {
-            TCGv_i32 oi = tcg_temp_new_i32();
+            TCGv_i32 oi;
             if (ctx->le_mode) {
-                tcg_gen_movi_i32(oi, make_memop_idx(MO_LE | MO_128 | MO_ALIGN,
-                                                    ctx->mem_idx));
+                oi = tcg_constant_i32(make_memop_idx(MO_LE | MO_128 | MO_ALIGN,
+                                                     ctx->mem_idx));
                 gen_helper_lq_le_parallel(lo, cpu_env, EA, oi);
             } else {
-                tcg_gen_movi_i32(oi, make_memop_idx(MO_BE | MO_128 | MO_ALIGN,
-                                                    ctx->mem_idx));
+                oi = tcg_constant_i32(make_memop_idx(MO_BE | MO_128 | MO_ALIGN,
+                                                     ctx->mem_idx));
                 gen_helper_lq_be_parallel(lo, cpu_env, EA, oi);
             }
-            tcg_temp_free_i32(oi);
             tcg_gen_ld_i64(hi, cpu_env, offsetof(CPUPPCState, retxh));
         } else {
             /* Restart with exclusive lock.  */
-- 
2.31.1



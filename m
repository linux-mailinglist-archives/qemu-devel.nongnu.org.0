Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1CA3C3F6B
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 23:11:41 +0200 (CEST)
Received: from localhost ([::1]:33134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2gjk-0006WK-35
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 17:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gZT-0006yO-RF
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:01:03 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gZR-0000ml-3i
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:01:03 -0400
Received: by mail-wr1-x42e.google.com with SMTP id t5so8223911wrw.12
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 14:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gWVh4UrhDUncjcNNoap6OjkeUWx2lHe7S0zeQI7wmW0=;
 b=oO/WPOAFavjsDoEjsunZuN9GDc8dbmHXc2hlBXMa5RA3JC7RXULhC53yjZIAEFIBwz
 UMqmDSDDGt20HFKUX6aEnerzVgckXe7xhEWJpswkaMIStSpNjQiCNtBdcdmSLHdNOl9q
 gJSEL8lZz4RY6aLEZjocv6WeFToq9CJV1xodh3clSY4PBEg+LEaHN9XIluFPPt3fvqMm
 iplnZ4gGJrElLbKGwALGI14epPJkTwbYjI9GWwRWZRovqXM6qm5WgGATThUX+SkwjOlo
 Ovc4C79tzzlgqeNsKZpcK7WUvRH74b8ZAhYze1/0H19fbLyicV7Xh2yoeTIXxj566KYU
 vy9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gWVh4UrhDUncjcNNoap6OjkeUWx2lHe7S0zeQI7wmW0=;
 b=nKarrDcoHGUKF7uv9DFJNWR7th/tOjWyaWtWiWwsycTzt6jrf2MYlZplVHI6JCb6NA
 DzL/8f6qtsxJHoSEvT1oAF8WuvnuMuGnKnSeQ/iE4mSs+NwutXs2YJ11X9gDa71TCOxj
 FmLb3BtZsahkq2xha8I+H56MjwosHjFKJ25sRDq9x4gBWcg8vR1QAUQ0fB5N7wuGQHcR
 Ki3CrfYhnHKoG3DFcgVObXUoPg6FAXXZSWSUIysl+h/JnkdeduZd78WbDxiXkfnG9L7v
 8AaRk1pXwnvoqmyRe+AKf6yQJjqFXEfJFHDa4T7wkR4PnOJIukqBlzqTVkNJy0FK0q2t
 H1XQ==
X-Gm-Message-State: AOAM532IfN1BQRTXWJLiGgSGIIynCKBmM8fNs6sBG7JAncBVFoVckqV1
 xc7ytnov8GiHHFDm7JGFfm2peSkXR5Fv3jNb
X-Google-Smtp-Source: ABdhPJwui/r0W8c0Qt87PZu6wzfRcZR3MPf1GL9OAlRxxLKcYvIaWSwmMxsIqeliE2PzkYzkYHTOWA==
X-Received: by 2002:adf:f50e:: with SMTP id q14mr30943349wro.183.1626037259667; 
 Sun, 11 Jul 2021 14:00:59 -0700 (PDT)
Received: from localhost.localdomain
 (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr. [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id l22sm3697500wmp.41.2021.07.11.14.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 14:00:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/19] target/mips/tx79: Introduce PCEQ* opcodes (Parallel
 Compare for Equal)
Date: Sun, 11 Jul 2021 23:00:04 +0200
Message-Id: <20210711210016.2710100-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711210016.2710100-1-f4bug@amsat.org>
References: <20210711210016.2710100-1-f4bug@amsat.org>
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fredrik Noring <noring@nocrew.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the 'Parallel Compare for Equal' opcodes:

 - PCEQB (Parallel Compare for Equal Byte)
 - PCEQH (Parallel Compare for Equal Halfword)
 - PCEQW (Parallel Compare for Equal Word)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210309145653.743937-14-f4bug@amsat.org>
---
 target/mips/tcg/tx79.decode      |  3 ++
 target/mips/tcg/tx79_translate.c | 66 ++++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/target/mips/tcg/tx79.decode b/target/mips/tcg/tx79.decode
index 98f21d33e3f..cfe721755ca 100644
--- a/target/mips/tcg/tx79.decode
+++ b/target/mips/tcg/tx79.decode
@@ -40,6 +40,9 @@ PEXTLB          011100 ..... ..... ..... 11010 001000   @rs_rt_rd
 
 # MMI1
 
+PCEQW           011100 ..... ..... ..... 00010 101000   @rs_rt_rd
+PCEQH           011100 ..... ..... ..... 00110 101000   @rs_rt_rd
+PCEQB           011100 ..... ..... ..... 01010 101000   @rs_rt_rd
 PEXTUW          011100 ..... ..... ..... 10010 101000   @rs_rt_rd
 
 # MMI2
diff --git a/target/mips/tcg/tx79_translate.c b/target/mips/tcg/tx79_translate.c
index c4656a4c21d..8dd510c2719 100644
--- a/target/mips/tcg/tx79_translate.c
+++ b/target/mips/tcg/tx79_translate.c
@@ -237,6 +237,72 @@ static bool trans_PNOR(DisasContext *ctx, arg_rtype *a)
  * PCEQW   rd, rs, rt        Parallel Compare for Equal Word
  */
 
+static bool trans_parallel_compare(DisasContext *ctx, arg_rtype *a,
+                                   TCGCond cond, unsigned wlen)
+{
+    TCGv_i64 c0, c1, ax, bx, t0, t1, t2;
+
+    if (a->rd == 0) {
+        /* nop */
+        return true;
+    }
+
+    c0 = tcg_const_tl(0);
+    c1 = tcg_const_tl(0xffffffff);
+    ax = tcg_temp_new_i64();
+    bx = tcg_temp_new_i64();
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
+
+    /* Lower half */
+    gen_load_gpr(ax, a->rs);
+    gen_load_gpr(bx, a->rt);
+    for (int i = 0; i < (64 / wlen); i++) {
+        tcg_gen_sextract_i64(t0, ax, wlen * i, wlen);
+        tcg_gen_sextract_i64(t1, bx, wlen * i, wlen);
+        tcg_gen_movcond_i64(cond, t2, t1, t0, c1, c0);
+        tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rd], t2, wlen * i, wlen);
+    }
+    /* Upper half */
+    gen_load_gpr_hi(ax, a->rs);
+    gen_load_gpr_hi(bx, a->rt);
+    for (int i = 0; i < (64 / wlen); i++) {
+        tcg_gen_sextract_i64(t0, ax, wlen * i, wlen);
+        tcg_gen_sextract_i64(t1, bx, wlen * i, wlen);
+        tcg_gen_movcond_i64(cond, t2, t1, t0, c1, c0);
+        tcg_gen_deposit_i64(cpu_gpr_hi[a->rd], cpu_gpr_hi[a->rd], t2, wlen * i, wlen);
+    }
+
+    tcg_temp_free(t2);
+    tcg_temp_free(t1);
+    tcg_temp_free(t0);
+    tcg_temp_free(bx);
+    tcg_temp_free(ax);
+    tcg_temp_free(c1);
+    tcg_temp_free(c0);
+
+    return true;
+}
+
+/* Parallel Compare for Equal Byte */
+static bool trans_PCEQB(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_compare(ctx, a, TCG_COND_EQ, 8);
+}
+
+/* Parallel Compare for Equal Halfword */
+static bool trans_PCEQH(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_compare(ctx, a, TCG_COND_EQ, 16);
+}
+
+/* Parallel Compare for Equal Word */
+static bool trans_PCEQW(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_compare(ctx, a, TCG_COND_EQ, 32);
+}
+
 /*
  *     LZC (1 instruction)
  *     -------------------
-- 
2.31.1



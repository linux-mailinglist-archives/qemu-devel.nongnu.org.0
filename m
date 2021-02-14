Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D56B31B1F6
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:24:49 +0100 (CET)
Received: from localhost ([::1]:38322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBM4e-0008Mn-Be
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:24:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLi4-0008NJ-5A
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:01:28 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:35233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLi2-0004b7-Kh
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:01:27 -0500
Received: by mail-wm1-x32f.google.com with SMTP id n10so5843859wmq.0
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OHI9+2iJLTvRrWFTQN2s8ImAvRqlxsnv2mLO+JxxUWA=;
 b=H5Br+EJ7FHHEJL5ifZ7ef5dlAsBMr9Zl4Ry0J2stKzhQWhcNHmAtbkaLPbfkdTRcrM
 sS4ALuIaY7ggtNjvoVuz5OcEPy8rpiBwy1wZGQh9IypFMQucmL8kEl4itAa0j6zG91cJ
 +EAScVVN7eC/iKdUw5rQNr4c6R9FwbdElBwKh2aHHxoy9qkwsmpJul/lf2WjmMKJvWZZ
 xw73Mdol7USRfYfCfEOmRofW56ZtveWqu02+Rj0XwcPziXPFQzw4nzbQ3N/1LRGAt0Tq
 9+GDLgSQzakgyIZ2wykCkz9KSzbAR7iRyL382/vECig55I0i0U6bOjSu4aZ2hHnEbBL5
 aEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OHI9+2iJLTvRrWFTQN2s8ImAvRqlxsnv2mLO+JxxUWA=;
 b=FQm8TmEL7cku/1E+svrn4VkrqtIuEqy2+AIuTtSdNB2y6Refb80ZwYIj0SaEIa/sil
 UXL9RjBHt5YUoshXKpz+3f7t6FjKNkEfpDgtv4iu+MTf/4+rff0MgL++kKZ/NJDgXtkp
 QZkXb8HSX0gRwsv25jHlG8BNFwVEK84qgCtYSGpGUFoi4bGT4m+mtY+sPfVq5odpZI3H
 1N43ObKYOhKDCYO6IzQUSpClJpHleOM/bUPBJMMDeQfkanKNIqKvEr/L3jOsNkC5UoyN
 cnLju881CWZ6+fubpD7ktPa/lXpEnu7HAoXZtPKao4LIDLRwpkKqksfsc1+PaOTSIe7t
 z4Zw==
X-Gm-Message-State: AOAM5300ff0RF/bqq/cfhGzIxiGuy3zIDTo8znEOZt8IMS0xJ5GQDBje
 M1N9YhsLEN4xuC7cH2HXQlVNfw+8M+M=
X-Google-Smtp-Source: ABdhPJxvSDW8F1/5k9Lq5SpQr/y819cLaiv48VAcuLz01Vc73xr28V2TYBrKs3h0J4/gRzV+RdT8RQ==
X-Received: by 2002:a1c:f203:: with SMTP id s3mr11048487wmc.152.1613325685147; 
 Sun, 14 Feb 2021 10:01:25 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d15sm16117354wru.80.2021.02.14.10.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 10:01:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 26/42] target/mips/tx79: Introduce SQ opcode (Store
 Quadword)
Date: Sun, 14 Feb 2021 18:58:56 +0100
Message-Id: <20210214175912.732946-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the SQ opcode (Store Quadword).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tx79.decode      |  1 +
 target/mips/tx79_translate.c | 27 +++++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/target/mips/tx79.decode b/target/mips/tx79.decode
index b5396f48c2d..f1cb7ebfa3c 100644
--- a/target/mips/tx79.decode
+++ b/target/mips/tx79.decode
@@ -73,3 +73,4 @@ PCPYH           011100 00000 ..... ..... 11011 101001   @rt_rd
 # SPECIAL
 
 LQ              011110 ..... ..... ................     @ldst
+SQ              011111 ..... ..... ................     @ldst
diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
index 293efd7bd06..386bae7808b 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -411,6 +411,33 @@ static bool trans_LQ(DisasContext *ctx, arg_itype *a)
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
+    /* Lower halve */
+    gen_load_gpr(t0, a->rt);
+    tcg_gen_qemu_st_i64(t0, addr, ctx->mem_idx, MO_TEQ);
+
+    /* Upper halve */
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



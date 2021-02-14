Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4084131B1D7
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:14:10 +0100 (CET)
Received: from localhost ([::1]:41618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBLuK-0005Un-S0
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:14:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLhJ-0007fP-TP
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:00:44 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:37188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLhG-0004VK-0K
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:00:41 -0500
Received: by mail-wm1-x330.google.com with SMTP id m1so5840336wml.2
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7E2jJiu6LIhE2Ap/QoeyVnqYU2wBaOLlH1WxXmievrY=;
 b=TvAxD6cvjNPwhfwRH/JvPIU+9lLd2hWTFQgN15UKRMijoPvU6kDh54YYE6KCDdk+B1
 L2sk6DZnPVo+9GTbpx/XDhGQ1Lg4aVKAcdjLfUtVPr0PhP48/ek9jwD9pt+y4KjjDR3u
 l1hlmujK28cCqu3aZzqF6bATDZdzdf0nVulawAr+LfdAbvA4RXWW26fFhgDTo7KpZSiP
 7Xc7ymuQxq4WsQkttj+jz8sVY7V9fz4K2dultCI5wpaYi8KKh3c3qZkz60iEuHHaigiR
 4O6I2UXqkdwvqh8yC3pDmQeGG4QJx8LiUO6WUw9F5jsb2fZFkaOQFFKVNOAEqJQ8EqBS
 fEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7E2jJiu6LIhE2Ap/QoeyVnqYU2wBaOLlH1WxXmievrY=;
 b=oyj6EIsO4hI4RJfdxZVhtvJfRGDhedkDKPv3L0vQCKtGYXoV2pHRfbYqdAfJ0Hoe0G
 Dh4ZsuzeOOYjH3h4eVPo3CMeTkVT9c/XgwJ6QSNgbx5h6LQGD0PXi1IovEc/F9GFe1n+
 AmI7EzZIdUUnkftKOx3SL6/feDdOWFkpWFUYOzxaVg6zONu/CNxbSvELiFC26Omr0kBf
 mLE29rsGLMSwR2JScKVW+/RI6+uWUvbz42KwHHY/v5RrE/r8fpyaDWM+Xaoe0T5FmDFk
 mXPju2GcdqpkwJCSA0qDTIYsnzGiNN3+eXCGs7l9GbVRu68Vr2o2cSoP9criuZct/TB0
 umSA==
X-Gm-Message-State: AOAM531kwmqEmpbcvvGLv17ei2mgLsQu+zdLWRlCfERaWg9tKmJebX8v
 egd0rjWwa4wxhpVvqFIrEQEo6XEblBY=
X-Google-Smtp-Source: ABdhPJx9jOV5B0JicBnmBcr658AEI18ZGOIttCkT6W6q+voWKUHLESVRR1MjR9esitoDq52hO0lonA==
X-Received: by 2002:a1c:4d03:: with SMTP id o3mr11371598wmh.136.1613325634726; 
 Sun, 14 Feb 2021 10:00:34 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t9sm15791314wrw.76.2021.02.14.10.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 10:00:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 16/42] target/mips/tx79: Introduce PSUB* opcodes (Parallel
 Subtract)
Date: Sun, 14 Feb 2021 18:58:46 +0100
Message-Id: <20210214175912.732946-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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

Introduce the 'Parallel Subtract' opcodes:

 - PSUBB (Parallel Subtract Byte)
 - PSUBH (Parallel Subtract Halfword)
 - PSUBW (Parallel Subtract Word)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tx79.decode      |  6 ++++
 target/mips/tx79_translate.c | 61 ++++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/target/mips/tx79.decode b/target/mips/tx79.decode
index 26c80b9bce5..d1c07c7d901 100644
--- a/target/mips/tx79.decode
+++ b/target/mips/tx79.decode
@@ -29,6 +29,12 @@ MTHI1           011100 .....  0000000000 00000 010001   @rs
 MFLO1           011100 0000000000  ..... 00000 010010   @rd
 MTLO1           011100 .....  0000000000 00000 010011   @rs
 
+# MMI0
+
+PSUBW           011100 ..... ..... ..... 00001 001000   @rs_rt_rd
+PSUBH           011100 ..... ..... ..... 00101 001000   @rs_rt_rd
+PSUBB           011100 ..... ..... ..... 01001 001000   @rs_rt_rd
+
 # MMI2
 
 PCPYLD          011100 ..... ..... ..... 01110 001001   @rs_rt_rd
diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
index 28d07baaa73..23146f6bfac 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -115,6 +115,67 @@ static bool trans_MTLO1(DisasContext *ctx, arg_rtype *a)
  * PSUBUW  rd, rs, rt        Parallel Subtract with Unsigned saturation Word
  */
 
+static bool trans_parallel_substract(DisasContext *ctx, arg_rtype *a, unsigned wlen)
+{
+    TCGv_i64 ax, bx, t0, t1, t2;
+
+    if (a->rd == 0) {
+        /* nop */
+        return true;
+    }
+
+    ax = tcg_temp_new_i64();
+    bx = tcg_temp_new_i64();
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
+
+    /* Lower halve */
+    gen_load_gpr(ax, a->rs);
+    gen_load_gpr(bx, a->rt);
+    for (int i = 0; i < (64 / wlen); i++) {
+        tcg_gen_sextract_i64(t0, ax, wlen * i, wlen);
+        tcg_gen_sextract_i64(t1, bx, wlen * i, wlen);
+        tcg_gen_sub_i64(t2, t0, t1);
+        tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rd], t2, wlen * i, wlen);
+    }
+    /* Upper halve */
+    gen_load_gpr_hi(ax, a->rs);
+    gen_load_gpr_hi(bx, a->rt);
+    for (int i = 0; i < (64 / wlen); i++) {
+        tcg_gen_sextract_i64(t0, ax, wlen * i, wlen);
+        tcg_gen_sextract_i64(t1, bx, wlen * i, wlen);
+        tcg_gen_sub_i64(t2, t0, t1);
+        tcg_gen_deposit_i64(cpu_gpr_hi[a->rd], cpu_gpr_hi[a->rd], t2, wlen * i, wlen);
+    }
+
+    tcg_temp_free(t2);
+    tcg_temp_free(t1);
+    tcg_temp_free(t0);
+    tcg_temp_free(bx);
+    tcg_temp_free(ax);
+
+    return true;
+}
+
+/* Parallel Subtract Byte */
+static bool trans_PSUBB(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_substract(ctx, a, 8);
+}
+
+/* Parallel Subtract Halfword */
+static bool trans_PSUBH(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_substract(ctx, a, 16);
+}
+
+/* Parallel Subtract Word */
+static bool trans_PSUBW(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_substract(ctx, a, 32);
+}
+
 /*
  *     Min/Max (4 instructions)
  *     ------------------------
-- 
2.26.2



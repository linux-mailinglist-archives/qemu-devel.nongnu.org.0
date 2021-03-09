Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E99332AC9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:42:50 +0100 (CET)
Received: from localhost ([::1]:47758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJeVV-00076L-1i
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:42:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdom-0005qI-Ji
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:58:40 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:37274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdol-0002w9-7c
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:58:40 -0500
Received: by mail-ej1-x62e.google.com with SMTP id bm21so28470353ejb.4
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m3MGQ4XY31DtBdEMuK50sZWhtVgAINu160V8orKG4pU=;
 b=TK+IENevz+zxJtxdjoQS7IXqCulWMzT2NZsU4xe4JWmkNMLq0X7wCiXK+UYtfbJHb5
 IFJfeVKIyUHm7FE6WazpI0exRVui3zsqZGFAq/RXW8NObDuHsUCpyTPlz6Q1PS4N7E+Y
 1JOdzJPL/dSn3tNTFqDjlR51YipF2A8bDjtBbbzI/mjMCMoC4tkhjatEddn5gVRg4tq7
 bhJmABelKslubFRC1BnjKrZucM+7K2LBR6XuWoMWeVjGOHxsqaGK9TR+XMS0zHFmEGR5
 mgxdmqmCaGEPVvbI1ntdp1B2kmgCllt33iYk9Xp1k1K+StqJBEzMo4txu5SXbNCfiRZI
 2r8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=m3MGQ4XY31DtBdEMuK50sZWhtVgAINu160V8orKG4pU=;
 b=JNaDtsj1A1SbwQPzex/3CRLGHDHKLJoZNPncelA23vQtM6PqvgOVhABudl3yoCeXYC
 /ZHiPXkY3UBtLXx1OM/T4whVn7s2V9tljMv69hKpEZiJFKTUXeXygSLoVJB7V6SVA3Rd
 mi1JJr+9+0b4Y8ovTmynGgCmvaDQoa76rfCqRq49/9YyftZ2YY8ycwjGF5gVeL9DA4s9
 dwoa2MSSIQfm0ItsFCHzmALgBHFAq/kttUoly/NCnJL2TW0L8m+kz5EBEN08w+o+vhK5
 8jxSNznuAKkgCEM4ZsCIOKBHD9SNfmD20g2b/hBk7donZeD4CGTCOPSpybqnUpFGQ5Yt
 RwRA==
X-Gm-Message-State: AOAM533bImkY8SnyAJbvTQ4ZPS7z+4aJ1HO4VWwzihtYTr+GF+05rNKQ
 FRq0gOhp0/3Pova/8b/6oLdSe8aIMz0=
X-Google-Smtp-Source: ABdhPJxtw+AEWb6Yvr+qasg6ACNzJa7BqW29lMCNY1tyFmnnr8650kD985sR2nzEEJy6UmqOpG6lKw==
X-Received: by 2002:a17:906:a413:: with SMTP id
 l19mr4226314ejz.421.1615301917640; 
 Tue, 09 Mar 2021 06:58:37 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id p9sm4867165edu.79.2021.03.09.06.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:58:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 20/22] target/mips/tx79: Introduce SQ opcode (Store
 Quadword)
Date: Tue,  9 Mar 2021 15:56:51 +0100
Message-Id: <20210309145653.743937-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309145653.743937-1-f4bug@amsat.org>
References: <20210309145653.743937-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62e.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fredrik Noring <noring@nocrew.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
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
index b5396f48c2d..f1cb7ebfa3c 100644
--- a/target/mips/tx79.decode
+++ b/target/mips/tx79.decode
@@ -73,3 +73,4 @@ PCPYH           011100 00000 ..... ..... 11011 101001   @rt_rd
 # SPECIAL
 
 LQ              011110 ..... ..... ................     @ldst
+SQ              011111 ..... ..... ................     @ldst
diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
index bfa0faab44f..e32c6218852 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -369,6 +369,33 @@ static bool trans_LQ(DisasContext *ctx, arg_itype *a)
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



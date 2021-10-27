Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DB443D0F2
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 20:42:47 +0200 (CEST)
Received: from localhost ([::1]:59648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfnss-000671-Jr
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 14:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnMu-0006F2-Mq
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:09:45 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:53990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnMr-0004rM-9M
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:09:44 -0400
Received: by mail-wm1-x32c.google.com with SMTP id 192so1865778wme.3
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qjpKL26xEX2wus4BrB9hPdKCF0pBgl5q4uFapoXPmT4=;
 b=hRPT91B4WHhCN+zATmRW1DER+ovs7zLkwNYMbg++UsFslqY/8a/zIIrPv/iZ4HGfzd
 bKd+ePmmbTdGpJnWVzuBFisT9dLTg9YWJNqlFdhoLJC4A2s5GYgR6HwWgze3DfmXHpYu
 Qqcw92Xl1/vdN2d8ITXrZiyq479s8ELaQK6g490RW+oZjmM2TtzT5X6avplm86zrB16F
 7nWTHsir3XxlKDdRgIaONZaA49cWK04dyg9wW3vBqgY8viQvyaGOSXNYTd1uMGiCf8aV
 zopQzmtqXQ+T1kydU0TJmX3Sjvg2PR9AU0E3DcA/iPKD9c2+zqMBHa2iUmTOPYAfkFKH
 rSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qjpKL26xEX2wus4BrB9hPdKCF0pBgl5q4uFapoXPmT4=;
 b=ttmkwjR+HdZ2SVckETmdiM96D1y635YAei5OgavwUnD9DV24iPSNDXzBIg1Mq6est/
 guLyVy50uO5/mwOgm5YULvKCxtGUspkSnYbrqsoLW7SNYLaFKZ7C/J3kh8pO68N7brOa
 VqqHvubd3i6F5JgIPYNpKP3dLQbCYpYmRhXG/Q2nmQHAJghioghbsXy+bKJ8rcLHG5gs
 uTS0mZGdY7vnCinwffM3hd3myKmQJgM26GwhwU5AZLusDfDOUdFkNzTnWF7gJl2FdZHK
 cuzoUrsZinEU043vx5B5Kfef8BKyJMJzKR1cxlBdUQ7O49HXM8wfy5njY6fbzu84KT6v
 UReQ==
X-Gm-Message-State: AOAM532Fzc3khwxqEwh4sYGYieeHphXWfiWO4tluig4esZ2tHeHMrBe0
 NIgJ/YYzHVXHQ7AVJAP/VgdQGuIl4z0=
X-Google-Smtp-Source: ABdhPJxXN1vc0VIEWgUMcWL5Ftv7um1Q0YOJtZ9Q/2gc6Pt8u987f535Y6DoOd+aoqc1fVGyVm/8aw==
X-Received: by 2002:a7b:cb82:: with SMTP id m2mr7218489wmi.11.1635358178897;
 Wed, 27 Oct 2021 11:09:38 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id f1sm600161wrc.74.2021.10.27.11.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:09:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 27/32] target/mips: Convert MSA MOVE.V opcode to decodetree
Date: Wed, 27 Oct 2021 20:07:25 +0200
Message-Id: <20211027180730.1551932-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027180730.1551932-1-f4bug@amsat.org>
References: <20211027180730.1551932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the MOVE.V opcode (Vector Move) to decodetree.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  7 ++++++-
 target/mips/tcg/msa_translate.c | 19 ++++++++++++++-----
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 7c309526444..cfa5fa5d688 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -21,6 +21,7 @@
 &msa_ldst           df  wd ws    sa
 &msa_bit            df  wd ws       m
 &msa_elm_df         df  wd ws       n
+&msa_elm                wd ws
 
 %dfn_df             16:6 !function=msa_elm_df
 %dfn_n              16:6 !function=msa_elm_n
@@ -32,6 +33,7 @@
 @bz_v               ...... ... ..    wt:5 sa:16             &msa_bz df=3
 @bz                 ...... ...  df:2 wt:5 sa:16             &msa_bz
 @elm_df             ...... .... ......    ws:5 wd:5 ......  &msa_elm_df df=%dfn_df n=%dfn_n
+@elm                ...... ..........     ws:5 wd:5 ......  &msa_elm
 @vec                ...... .....     wt:5 ws:5 wd:5 ......  &msa_r df=0
 @2r                 ...... ........  df:2 ws:5 wd:5 ......  &msa_r wt=0
 @2rf                ...... ......... df:1 ws:5 wd:5 ......  &msa_r wt=0
@@ -165,7 +167,10 @@ BNZ                 010001 111 .. ..... ................    @bz
 
   SLDI              011110 0000 ...... ..... .....  011001  @elm_df
   SPLATI            011110 0001 ...... ..... .....  011001  @elm_df
-  COPY_S            011110 0010 ...... ..... .....  011001  @elm_df
+  {
+    MOVE_V          011110 0010111110  ..... .....  011001  @elm
+    COPY_S          011110 0010 ...... ..... .....  011001  @elm_df
+  }
   COPY_U            011110 0011 ...... ..... .....  011001  @elm_df
   INSERT            011110 0100 ...... ..... .....  011001  @elm_df
   INSVE             011110 0101 ...... ..... .....  011001  @elm_df
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 2ed637f16da..0655b61801b 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -36,7 +36,6 @@ enum {
     /* ELM instructions df(bits 21..16) = _b, _h, _w, _d */
     OPC_CTCMSA      = (0x0 << 22) | (0x3E << 16) | OPC_MSA_ELM,
     OPC_CFCMSA      = (0x1 << 22) | (0x3E << 16) | OPC_MSA_ELM,
-    OPC_MOVE_V      = (0x2 << 22) | (0x3E << 16) | OPC_MSA_ELM,
 };
 
 static const char msaregnames[][6] = {
@@ -510,6 +509,19 @@ TRANS_DF_iii_b(HADD_U,  trans_msa_3r,    gen_helper_msa_hadd_u);
 TRANS_DF_iii_b(HSUB_S,  trans_msa_3r,    gen_helper_msa_hsub_s);
 TRANS_DF_iii_b(HSUB_U,  trans_msa_3r,    gen_helper_msa_hsub_u);
 
+static bool trans_MOVE_V(DisasContext *ctx, arg_msa_elm *a)
+{
+    if (!check_msa_enabled(ctx)) {
+        return true;
+    }
+
+    gen_helper_msa_move_v(cpu_env,
+                          tcg_constant_i32(a->wd),
+                          tcg_constant_i32(a->ws));
+
+    return true;
+}
+
 static void gen_msa_elm_3e(DisasContext *ctx)
 {
 #define MASK_MSA_ELM_DF3E(op)   (MASK_MSA_MINOR(op) | (op & (0x3FF << 16)))
@@ -528,9 +540,6 @@ static void gen_msa_elm_3e(DisasContext *ctx)
         gen_helper_msa_cfcmsa(telm, cpu_env, tsr);
         gen_store_gpr(telm, dest);
         break;
-    case OPC_MOVE_V:
-        gen_helper_msa_move_v(cpu_env, tdt, tsr);
-        break;
     default:
         MIPS_INVAL("MSA instruction");
         gen_reserved_instruction(ctx);
@@ -627,7 +636,7 @@ static void gen_msa_elm(DisasContext *ctx)
     uint8_t dfn = (ctx->opcode >> 16) & 0x3f;
 
     if (dfn == 0x3E) {
-        /* CTCMSA, CFCMSA, MOVE.V */
+        /* CTCMSA, CFCMSA */
         gen_msa_elm_3e(ctx);
         return;
     } else {
-- 
2.31.1



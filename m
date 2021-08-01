Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA7E3DCE23
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 01:44:52 +0200 (CEST)
Received: from localhost ([::1]:53202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAL8V-0004jQ-O3
	for lists+qemu-devel@lfdr.de; Sun, 01 Aug 2021 19:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAL61-0002aR-BB
 for qemu-devel@nongnu.org; Sun, 01 Aug 2021 19:42:17 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAL5z-0003nt-NO
 for qemu-devel@nongnu.org; Sun, 01 Aug 2021 19:42:16 -0400
Received: by mail-wr1-x433.google.com with SMTP id l18so19290300wrv.5
 for <qemu-devel@nongnu.org>; Sun, 01 Aug 2021 16:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Ht5ISZ2OXCCd1H3XZUszoZrx9DeFBjuRyEDw8rJrxw=;
 b=jykHNSz8UFH0PNEe19lGaiItMn/DT/Bdiyp3H7TorlSFFghnJ3Es3EqeYloZcKx4e/
 jOJ7UJ6i/hUYckC/v7RiSQPcFNNZC6zGTIBbjgS3vkQU2jp1xeMSswPo6PRU5QZ9/+5q
 Xlzw0uJ5Z52mBUlWviPdKDoOLerV0nRAhT6koe0ApLBDKre+yrDBtgpYhYl4uiydVvHq
 ux6kjLHJRo42tzylPvPORwa4a6205Dhs3Xv2GDohXF8udztCW28/XWHlhKIHv1epN6dy
 ODxtDNpAebXb7v6tYwUEme8CLKNLcah3ogmarWw1EL+aBhIYLumhE4dSXCxRlg95UkXm
 dVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2Ht5ISZ2OXCCd1H3XZUszoZrx9DeFBjuRyEDw8rJrxw=;
 b=bXvc/CRnlhINuJActzZMl/Rsct4SEtCkrfHkvMw7JMI8/c7pUAwiSmGrZiWhgKvYmy
 ohv7aOEC4LWAX/lCZoHGeXyOWZ9DmrdD8+F5ALeiCbWKWqCJNqtZjm0U2nBbAqZfTQdH
 fvdJaynheRoBXfrAtinZ8pk+DZA773PqfGmp8K63ueXW+01yLEiQd27AjN5S/aP9r1De
 SxYbTeVIxhr9J4DKuFiYFUqqU2WVuRKRZDXPTE/OdC1XCQnKZ6OZ824g1euENYJ6CRdW
 npKwqJr1lyrI3pAtcmRZoBuKpg35FqdniCbiYULEaNj2nQmWY6f3HR8h1kxVlMbJF5sW
 SjPg==
X-Gm-Message-State: AOAM533fuRJ5DjMNI0XwWE3OXAHyExbKuAswj4hK8cwva+rc1VuEmwZl
 47Aduy+bS4rgaqm+1SG3ZYMnEYSqs2LJRw==
X-Google-Smtp-Source: ABdhPJwYRzFXh64lBOmR9+Ni1v7rRcBcO5TD9OinftcFpCV+xmy1noOipyf54AnphZVFpS7mWVUPgg==
X-Received: by 2002:a5d:5650:: with SMTP id j16mr14388125wrw.46.1627861333590; 
 Sun, 01 Aug 2021 16:42:13 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 q14sm9231252wrs.8.2021.08.01.16.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 16:42:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 2/4] target/mips: Decode vendor extensions before MIPS
 ISAs
Date: Mon,  2 Aug 2021 01:42:00 +0200
Message-Id: <20210801234202.3167676-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210801234202.3167676-1-f4bug@amsat.org>
References: <20210801234202.3167676-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit ffc672aa977 ("target/mips/tx79: Move MFHI1 / MFLO1
opcodes to decodetree") we misplaced the decoder call. Move
it to the correct place.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 05efd25e29d..9572cc56947 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -16093,6 +16093,11 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
 
     /* Transition to the auto-generated decoder.  */
 
+    /* Vendor extensions */
+    if (cpu_supports_isa(env, INSN_R5900) && decode_ext_txx9(ctx, ctx->opcode)) {
+        return;
+    }
+
     /* ISA extensions */
     if (ase_msa_available(env) && decode_ase_msa(ctx, ctx->opcode)) {
         return;
@@ -16102,9 +16107,6 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
     if (cpu_supports_isa(env, ISA_MIPS_R6) && decode_isa_rel6(ctx, ctx->opcode)) {
         return;
     }
-    if (cpu_supports_isa(env, INSN_R5900) && decode_ext_txx9(ctx, ctx->opcode)) {
-        return;
-    }
 
     if (decode_opc_legacy(env, ctx)) {
         return;
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E4343EA0C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 23:12:36 +0200 (CEST)
Received: from localhost ([::1]:45658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgChO-0001KO-J7
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 17:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCeE-0006tS-8q
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:09:18 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:55895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCeC-0004jW-KH
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:09:17 -0400
Received: by mail-wm1-x330.google.com with SMTP id v127so6981581wme.5
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 14:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pl0xX5wrUhlZHC1m7dpsYd8PbP9HF1UxFnUMHFOexoc=;
 b=aKth0C4TCtInfH9GUOkmhezP7MH3gt05PU65iEl49ESx/1CZp077yn6oenjfEnCeZJ
 pKsS/USVsS8dvdR59TvU67LRn3tW/k+Wh/FuqBRxWdpYieuSoddG5cSzEgciTQ7w+3pU
 UPK6t0Jgkej3kRR6Om43+rnbM8BWP9NmbfMhySPi0DTIHXIuQqv3EK6rVuxw8uHRlGwY
 SPLmIe+Y0NPlB18m1l2hSFvxqFyHbE2xxcWM/WiwrCSV+YVWsDiKzra963fzGGrHPhVb
 GLn2MQB4TGr2MloN/TOgL7WHz7IvY6dQksrNEGBwNHNCXIkwSJIUjb4cOj41S7Mo1aFT
 naRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Pl0xX5wrUhlZHC1m7dpsYd8PbP9HF1UxFnUMHFOexoc=;
 b=qATFp64MbSU2RKhZeC+rzz+umeP+WSljxFGYHiM2uST+JViD7Qw/zIm4+Mhu+24Kw1
 drQ4QrESBauSmBQ8Y2YIxpws7LQ+kujss6aBXL7vubti2oEzxOfbJ9NMyBKmfL2JLQkg
 rGpghJuoXis+2F+j9G2L42GrkxkPYrmgqmJldRccwu7QxokxccUbMK4ltPBa5wqLPqyx
 JByNtuXDKWPlnIGqhcNPpcUXhgG+xbrPsWHFySjzlmmrpYWgXRcgs0Q2io2tFICJA0C3
 gohEDKLOe/A527zfso4VTDbo5vsjMS6yvUEeUygwiGreItIfXDgoq+Q9YWM6NlzG+90Y
 op0Q==
X-Gm-Message-State: AOAM532l44KgPcoopchVBrAn9zFbVPdZUhDnb/BiYQ264JVMJ0jyJdkY
 gMquuc7RbDLexnRtHHmpS+nLZuuJTlQ=
X-Google-Smtp-Source: ABdhPJyAFMdV5jhby2kP2ChDeR16ht5inDnTvBZf82vH3tBGjpVrLnrbDoVlJ/KU42DZr8Rrg0zvQw==
X-Received: by 2002:a7b:cf0f:: with SMTP id l15mr3256910wmg.92.1635455355009; 
 Thu, 28 Oct 2021 14:09:15 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id p12sm4339207wrr.67.2021.10.28.14.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:09:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/32] target/mips: Use enum definitions from
 CPUMIPSMSADataFormat enum
Date: Thu, 28 Oct 2021 23:08:17 +0200
Message-Id: <20211028210843.2120802-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028210843.2120802-1-f4bug@amsat.org>
References: <20211028210843.2120802-1-f4bug@amsat.org>
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace magic DataFormat value by the corresponding
enum from CPUMIPSMSADataFormat.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa_translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 242d6ccf669..e4bf42530fc 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -1789,10 +1789,10 @@ static void gen_msa_3rf(DisasContext *ctx)
     case OPC_MULR_Q_df:
     case OPC_MADDR_Q_df:
     case OPC_MSUBR_Q_df:
-        tdf = tcg_constant_i32(df + 1);
+        tdf = tcg_constant_i32(DF_HALF + df);
         break;
     default:
-        tdf = tcg_constant_i32(df + 2);
+        tdf = tcg_constant_i32(DF_WORD + df);
         break;
     }
 
@@ -2021,7 +2021,7 @@ static void gen_msa_2rf(DisasContext *ctx)
     TCGv_i32 twd = tcg_const_i32(wd);
     TCGv_i32 tws = tcg_const_i32(ws);
     /* adjust df value for floating-point instruction */
-    TCGv_i32 tdf = tcg_constant_i32(df + 2);
+    TCGv_i32 tdf = tcg_constant_i32(DF_WORD + df);
 
     switch (MASK_MSA_2RF(ctx->opcode)) {
     case OPC_FCLASS_df:
-- 
2.31.1



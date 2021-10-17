Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B11430CD9
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 01:10:59 +0200 (CEST)
Received: from localhost ([::1]:33348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcFIw-0002hi-GX
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 19:10:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF2I-0004fq-Of
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:53:46 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF21-0000IY-5T
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:53:46 -0400
Received: by mail-wr1-x42f.google.com with SMTP id r7so37873798wrc.10
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 15:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=azrawipGm8tqQsryYd1KLjXl2gKWLCaASF3igLFnDCc=;
 b=jVe1PZEkPEVz46EilisjDWClUcjuJyJmyVKh9/tsGjdGwgfLV55wv/Ti9TqUmuDGJ9
 bhR6FLUi6DcGcvjAm8hIidDPyI4t/YLembK7fGV5AqstpmRcsQ9/ur5ElLXjeJpNHM73
 TFYuuNdsxtCHeUQFNBy57a6d41UnbzJMzAcvGdbaqMZNk0H7UtEGUNNDvoQ64zk7gvNL
 H6pN73zHMzyvcSg1heHj0hDsdmYRYla+d7YqiP3wcK5t9k7Ok+o+C8TNiXqpjFk2+whx
 bLPYeRtUdPWX5hd5ASRxr1yNaV56Vfta9BrKHqtxSIoKUOjdlpOoXZg+dZo94IT9F3gh
 5nkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=azrawipGm8tqQsryYd1KLjXl2gKWLCaASF3igLFnDCc=;
 b=Nd4bQmLfVedvMMW4JUe8cff307Ossq6mrqvgArp5q/L0G+ajb5TLmQltbqmtqNj8/P
 TXp5W/WCsoNM6V7SxRBi6BPyL7nWfA6kx9D89g+wI97YUQC8LnjvbF/xLtG0JuKiN/lP
 pJJEOiEX0uCTYkNURUGUBnKTzFdl3mrvnC8PUnrxhd3nPAHdRaoz8wJc0pLV62u4JIDc
 W8krx3c1HeI/fMAA7eXj65INt013bYXm/C1cyZWqCol+Sy3xZSMH8dCbyeUE/Pb0O6Dp
 Gq0hdS0jW8uX4NmYP9c0DaWh5VICDa5O3Qq80q8XfSo6W5ZAgRhtOLxqpcZ4jqKuMVTw
 llYw==
X-Gm-Message-State: AOAM531NwWdIJIuiK7rw5tZCRDTfvwEH+TNsNAzxl36TifGZx4Cb3v1F
 GClz9TODxqXZMMS6q68+7EtWyzCx9FA=
X-Google-Smtp-Source: ABdhPJyV/kp2pK2eMIhUKfekBTDsIYuV0bzhxYJeWXY5GQbnQ1EQea/IHTI/BiwE/x3t7mmnPOIduQ==
X-Received: by 2002:a5d:6c65:: with SMTP id r5mr30596549wrz.26.1634511207561; 
 Sun, 17 Oct 2021 15:53:27 -0700 (PDT)
Received: from x1w.. (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id i203sm13414931wma.48.2021.10.17.15.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 15:53:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/17] target/mips: Use tcg_constant_i32() in gen_msa_2r()
Date: Mon, 18 Oct 2021 00:52:36 +0200
Message-Id: <20211017225245.2618892-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211017225245.2618892-1-f4bug@amsat.org>
References: <20211017225245.2618892-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid using a TCG temporary by moving Data Format to the constant pool.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211003175743.3738710-5-f4bug@amsat.org>
---
 target/mips/tcg/msa_translate.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 5e8f80f2f23..bbe9146513a 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -1946,7 +1946,6 @@ static void gen_msa_2r(DisasContext *ctx)
     uint8_t df = (ctx->opcode >> 16) & 0x3;
     TCGv_i32 twd = tcg_const_i32(wd);
     TCGv_i32 tws = tcg_const_i32(ws);
-    TCGv_i32 tdf = tcg_const_i32(df);
 
     switch (MASK_MSA_2R(ctx->opcode)) {
     case OPC_FILL_df:
@@ -1957,7 +1956,8 @@ static void gen_msa_2r(DisasContext *ctx)
             break;
         }
 #endif
-        gen_helper_msa_fill_df(cpu_env, tdf, twd, tws); /* trs */
+        gen_helper_msa_fill_df(cpu_env, tcg_constant_i32(df),
+                               twd, tws); /* trs */
         break;
     case OPC_NLOC_df:
         switch (df) {
@@ -2015,7 +2015,6 @@ static void gen_msa_2r(DisasContext *ctx)
 
     tcg_temp_free_i32(twd);
     tcg_temp_free_i32(tws);
-    tcg_temp_free_i32(tdf);
 }
 
 static void gen_msa_2rf(DisasContext *ctx)
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6815F420207
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 16:21:43 +0200 (CEST)
Received: from localhost ([::1]:42022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX2N4-0006aS-Gc
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 10:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX2Is-00024Z-DZ; Sun, 03 Oct 2021 10:17:22 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:51744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX2Ir-0004E3-0C; Sun, 03 Oct 2021 10:17:22 -0400
Received: by mail-wm1-x332.google.com with SMTP id p21so1493904wmq.1;
 Sun, 03 Oct 2021 07:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TJk08MUEmq673dFPHh6OX1+k+QJfzBaOq3ycNKzF384=;
 b=iFwXu2gcBqwzEW5kDYAsG3hMXMaKzx4mU3snwOd1CdRFjMRQjdJiMxd1qVpFrmN3c4
 bcMFFAV5PoyxPMHZxyQgi3cxb5W1QdFbHwLhX85fY0FZsDogCOtcrKRlJfgZ3XmPWRTw
 NCVaOZfm67X8G3UPpyc5TaHY7Yk39bk0Vt/cjVBoYpXEOfVqOfqGZQB0kB4QX0+3mLNh
 O0LowWN91rJ0ACTT1yNfj+pU+G73kH/YPxMWDlCfPk8do7mE+ogPyUVTmS7vsHvk8nLG
 cfQr/v/518+UWqzf1RrdF7+8lqW40mMN+mbi+19H+uds5pl9Sx5vATyM7gLcArtSG4Xq
 e65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TJk08MUEmq673dFPHh6OX1+k+QJfzBaOq3ycNKzF384=;
 b=3c95kxur98uPnMXbDcFRkFowjz3G1ocpYlpjkOnjK6i38n2eZYDRhHnmk1nHxmNhk3
 uIO/vKcddRwI9+C5sOq9Vn26vtIm9NHT5rzHmbonOWEN7eJ7WHZmTGKJafqgAK3U7Dua
 dQuluXEKI3yNyqChj5N+eJOlqZC4F9HR5Aem41lsLei5s9/OefWPQ//WYEWzr+xuE8jQ
 pobm3msMwVhiyWb798iMGYWpHyXhnt8iqjgQIqyL+/eOLPCllFNw18yCEOAQaQgzfnoX
 4Ua0sILH1+W5C6VhDz62mhCDR6nKFXUiC7N9dlYBk6zupV7IUvDvs//VfI1RkeqSOJmD
 T2lA==
X-Gm-Message-State: AOAM532sY0Iz3wWTEORMok5a7CzLLxoRD75CzyrHb+mmEIx4CyaPUdW8
 oLQOpgKeTU8VsTqSz3pn2QXdoF6NHo8=
X-Google-Smtp-Source: ABdhPJxGueB97PN6cddgFEg/CjiE+oyavG+l03YHP2QAW3ndwyI1nL8TLCmLQA4uvczl8/y2U0PyKg==
X-Received: by 2002:a1c:58:: with SMTP id 85mr7971222wma.29.1633270639048;
 Sun, 03 Oct 2021 07:17:19 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 x15sm2516494wrl.74.2021.10.03.07.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 07:17:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/ppc: Use tcg_constant_i32() in gen_setb()
Date: Sun,  3 Oct 2021 16:17:10 +0200
Message-Id: <20211003141711.3673181-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003141711.3673181-1-f4bug@amsat.org>
References: <20211003141711.3673181-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid using TCG temporaries for the -1 and 8 constant values.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/ppc/translate.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index b985e9e55bc..193d8e89152 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -5074,19 +5074,15 @@ static void gen_mtspr(DisasContext *ctx)
 static void gen_setb(DisasContext *ctx)
 {
     TCGv_i32 t0 = tcg_temp_new_i32();
-    TCGv_i32 t8 = tcg_temp_new_i32();
-    TCGv_i32 tm1 = tcg_temp_new_i32();
+    TCGv_i32 t8 = tcg_constant_i32(8);
+    TCGv_i32 tm1 = tcg_constant_i32(-1);
     int crf = crfS(ctx->opcode);
 
     tcg_gen_setcondi_i32(TCG_COND_GEU, t0, cpu_crf[crf], 4);
-    tcg_gen_movi_i32(t8, 8);
-    tcg_gen_movi_i32(tm1, -1);
     tcg_gen_movcond_i32(TCG_COND_GEU, t0, cpu_crf[crf], t8, tm1, t0);
     tcg_gen_ext_i32_tl(cpu_gpr[rD(ctx->opcode)], t0);
 
     tcg_temp_free_i32(t0);
-    tcg_temp_free_i32(t8);
-    tcg_temp_free_i32(tm1);
 }
 #endif
 
-- 
2.31.1



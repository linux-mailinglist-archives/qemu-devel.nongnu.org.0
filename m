Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 311A5420203
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 16:19:51 +0200 (CEST)
Received: from localhost ([::1]:38306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX2LG-0003qn-8I
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 10:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX2J0-0002Cp-Fl; Sun, 03 Oct 2021 10:17:30 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX2Ix-0004Hv-5S; Sun, 03 Oct 2021 10:17:29 -0400
Received: by mail-wr1-x42d.google.com with SMTP id s21so25232773wra.7;
 Sun, 03 Oct 2021 07:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+qKGw4q6/hJhz4VZmO0Noz/zkq42BzizY+4WFw06qiA=;
 b=Y33+THpA6JrmfQ5eu+QZQRJY2p/ixm2lu/bd+/54YkcBgFaULbvAhPlircLY+J8N2R
 Orfzo3tzizt8kiHECHCnnGKH73rd4T14lqRIzls31uptG09lDP4qlnrz0CfVjXNWchfp
 p3Jxxx2mFaXDboZqe5X3onQWiwkPIFY/2Xbt7QJKlC3hPF6QWr8Dz246cYfdhc5bw7Cx
 VO7BK4xHNl/uB/1w0i9mBMZ1sAa2fzMRCXDy+Py9TJYNyH4WoFKpqOo63gHN7qAfZiKU
 VG8T7a7wxmuxfyJbTLoyvtsXn/c0ShaVrYHl/8NKY+hHzcuzbHDPY8LHmIwvyF/tpYP3
 0m6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+qKGw4q6/hJhz4VZmO0Noz/zkq42BzizY+4WFw06qiA=;
 b=yOe1N/EkBJY/XKXPExeKhU1WIpLlzfay29hPid+koOaNJWs75uUKkXY7AHOCuzPJn9
 J8McPfnWzlfqZTXb7d3NvfdEOaLWMgfQnhD8XvJNAkobjlGBCsuxqntf586gk+Q8+BpC
 XTmQxyxl9WyOjCKvnQSdrtmtddHbn0lDaIIYRiMZEAah/iXs8FYUUVFgzEcesI3JIBsB
 FhGpKty2DU+zLJoCp1T+0r/HWbFANzB1dP6DgxGAOrb+JmO87Tsy0wIeoOvUOY9zB0V5
 AvM2GYDKFoD5yKaZVGCQcpcPAhagbvwnxmiDqvDdzhLEcfZClqioLmLSQnnTiF4jdxwJ
 tOpw==
X-Gm-Message-State: AOAM533+pB6y2kADkQr1k9TnDSU1q0NS8VBIfUVa4hbsbUcHUi2vBzNf
 r+LFvi7imued4elgisQdnqPoujBw4/Y=
X-Google-Smtp-Source: ABdhPJyp7ENxVy4qWySDHl52JIz00BrBybLiuT2UcJ+h/F0ID8tryke3WJIf6MzQN55muBrx30zaKQ==
X-Received: by 2002:adf:a4ca:: with SMTP id h10mr8921011wrb.28.1633270643809; 
 Sun, 03 Oct 2021 07:17:23 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 l124sm13829201wml.8.2021.10.03.07.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 07:17:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/ppc: Use tcg_constant_i64() in gen_brh()
Date: Sun,  3 Oct 2021 16:17:11 +0200
Message-Id: <20211003141711.3673181-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003141711.3673181-1-f4bug@amsat.org>
References: <20211003141711.3673181-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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

The mask of the Byte-Reverse Halfword opcode is a read-only
constant. We can avoid using a TCG temporary by moving the
mask to the constant pool.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/ppc/translate.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 193d8e89152..30a60d60973 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7575,18 +7575,16 @@ static void gen_brw(DisasContext *ctx)
 /* brh */
 static void gen_brh(DisasContext *ctx)
 {
-    TCGv_i64 t0 = tcg_temp_new_i64();
+    TCGv_i64 mask = tcg_constant_i64(0x00ff00ff00ff00ffull);
     TCGv_i64 t1 = tcg_temp_new_i64();
     TCGv_i64 t2 = tcg_temp_new_i64();
 
-    tcg_gen_movi_i64(t0, 0x00ff00ff00ff00ffull);
     tcg_gen_shri_i64(t1, cpu_gpr[rS(ctx->opcode)], 8);
-    tcg_gen_and_i64(t2, t1, t0);
-    tcg_gen_and_i64(t1, cpu_gpr[rS(ctx->opcode)], t0);
+    tcg_gen_and_i64(t2, t1, mask);
+    tcg_gen_and_i64(t1, cpu_gpr[rS(ctx->opcode)], mask);
     tcg_gen_shli_i64(t1, t1, 8);
     tcg_gen_or_i64(cpu_gpr[rA(ctx->opcode)], t1, t2);
 
-    tcg_temp_free_i64(t0);
     tcg_temp_free_i64(t1);
     tcg_temp_free_i64(t2);
 }
-- 
2.31.1



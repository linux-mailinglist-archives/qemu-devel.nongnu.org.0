Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 268C233A0E3
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 21:06:36 +0100 (CET)
Received: from localhost ([::1]:53580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLAWx-0002uD-8G
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 15:06:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAHM-0000JF-SR
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:50:28 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:50787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAHH-0007aS-W6
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:50:25 -0500
Received: by mail-wm1-x336.google.com with SMTP id g25so5746697wmh.0
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jGTyoIUamQpmoS/rb5oXqjzJpXDppEWRvvKl92rVqa8=;
 b=bmuPiSL6ERHe13e7YKodCC47ViEfsNVy4Niq/Xf9feadn+75jZ+guC5Au91U5Jv/ln
 iz45Es3Ba18ep6cMCbzqWyazQEuEmHgxxCfdJf8nUKO4Dj3JvAyeNOJZCefOa/6Skzgf
 UMww2MrGAd8qBeeM5tf5P/ntOpAPP+dXI4YcpdYilBkts64UQsGUIqOlCRhCUKEQUhb5
 UoVuKpM/Jzj1o+sx4AdaHoKeFCELOEAncQ4IxoEa4wob1nnpn6WudaK4WBfNHSP5oHWJ
 nlPdkLbXJsvVRGRIuOamQn69n1Wvr6AjulPM8lOksITZoPAW5AuVtIzOzu7ixmDlEG/r
 z+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jGTyoIUamQpmoS/rb5oXqjzJpXDppEWRvvKl92rVqa8=;
 b=j1/oz2oW30LHWmDEkNySS+DXivc3qcwmUIVFMRqARQ1HLxPe1KBDcJyVFHoF4+rcNU
 cugT7PoRiSaHod0NT75rbyYcdYHq6e+BIjxldIoTWE6KaBClMZZW4BxupfjPSYKrTl49
 4I/XBETZaxaAzY4RoornJCLc07HSFCrvmePMD0yGi/89aCFCIuItfxzsT27Nl7uMBi2v
 z0iLoJfjdCqw+OwbWgGBqAHqvQSSKaPi8QWSULcxTmtXRcvinPYw5n0CUaUDI5UvlKyl
 L2iIOct2hdgHoeloB3EowHzCrkiK6YvVL77h/IPLNHHnLseZClluY3OGWiXhEMj8PslV
 I0nw==
X-Gm-Message-State: AOAM530cWzaTk5AqaFUvv67HGl0/hQgyLzmyk5OX8Eyfs/2i+T70iLNt
 BUYemSTdt1/baErCuLUoIDifvTibj1kfHg==
X-Google-Smtp-Source: ABdhPJwGP06v8LtQAIv5AeCBC+Fur6puTa7VZrjoej6h+64RTlSSX3K8sXTFewNrZeZwtSRA7gSoRA==
X-Received: by 2002:a05:600c:4a06:: with SMTP id
 c6mr18922022wmp.35.1615665022380; 
 Sat, 13 Mar 2021 11:50:22 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id v2sm30603135wmj.1.2021.03.13.11.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 11:50:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/27] target/mips/translate: Make gen_rdhwr() public
Date: Sat, 13 Mar 2021 20:48:24 +0100
Message-Id: <20210313194829.2193621-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313194829.2193621-1-f4bug@amsat.org>
References: <20210313194829.2193621-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will use gen_rdhwr() outside of translate.c, make it public.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210214175912.732946-28-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.h | 2 ++
 target/mips/translate.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index e4f2f26de89..2b3c7a69ec6 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -148,6 +148,8 @@ void gen_op_addr_add(DisasContext *ctx, TCGv ret, TCGv arg0, TCGv arg1);
 bool gen_lsa(DisasContext *ctx, int rd, int rt, int rs, int sa);
 bool gen_dlsa(DisasContext *ctx, int rd, int rt, int rs, int sa);
 
+void gen_rdhwr(DisasContext *ctx, int rt, int rd, int sel);
+
 extern TCGv cpu_gpr[32], cpu_PC;
 #if defined(TARGET_MIPS64)
 extern TCGv_i64 cpu_gpr_hi[32];
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 256e2956c4b..d4316c15d11 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -12349,7 +12349,7 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
     }
 }
 
-static void gen_rdhwr(DisasContext *ctx, int rt, int rd, int sel)
+void gen_rdhwr(DisasContext *ctx, int rt, int rd, int sel)
 {
     TCGv t0;
 
-- 
2.26.2



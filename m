Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 935AB47347F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 19:58:23 +0100 (CET)
Received: from localhost ([::1]:37380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwqWk-0006QJ-Mw
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 13:58:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwqUo-0004G3-7e
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 13:56:22 -0500
Received: from [2a00:1450:4864:20::42d] (port=46728
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwqUk-0001xa-VT
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 13:56:21 -0500
Received: by mail-wr1-x42d.google.com with SMTP id u1so28617844wru.13
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 10:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qjjw6SMTzOtIMG8knarIZfVDh1j7Z6jLvyP1PkdoHD4=;
 b=KVAuJh9x09CIfCIE5oV4VKiStZA6c3+32p1SRfRBTnuV/JGW+u3M0fDPVX5zYkHQ76
 lhDKbtGJSz8ZjfL6uPmSDZd9vhSLqvIaBtcSPceyI3sBgrw25j8pJF/LSEwHqs+8iCIY
 ytYT8k5SswmqciN8CcrHGs6b4ouPYkhuy+T0C2GpS7llIGCB+LMvW6FTUVmYMtLr3O3g
 nroOXcOudEySSpU0+s+fkABu5Gkj5tXmste2Gfwwu13FKY2uCAJgMJfTkGTqLRfm+oNl
 D5e7TnlYqIDc8XzzkfpNEOwkcRhYTOov//HSLIWlZfR0r6JASZ9jK7F0d/tDph4O4TE1
 rBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qjjw6SMTzOtIMG8knarIZfVDh1j7Z6jLvyP1PkdoHD4=;
 b=vJhmSwgX1ZakU9kOt/h1EV44HsRimGz0Tw1MU+osoQNfy/jhiSdQ9syfgfcAiepHFn
 Qwh9jaz73f3nRYCbKP7Ty1oo+hPFHojWro184pdASueWGdMnM4Z7Ds7y4rlaQydktGqL
 ZqaaB784Dcf6GTgruyR63RIKCrymhnmHwpShHMPKiLzIQ1b49tJ+XyN89p0PECGubSGs
 HVDkfY7eK33h6aWZMm4g3ewmg4USAz3H2nAsaFM/MaNa+gmpn4tBbmHk8ugP4ECx5BbU
 SLx69gx8aqTXKfwXtiEJ9543nwTL7WPEFTGGoP4RHHDNMktxHms2FIHIS1sO58Z7LiFC
 Q0dA==
X-Gm-Message-State: AOAM531yjvXhOSEcr8fSFEmVgcfG1+qrbrhhnAmmWJ6Mx/xP2jHIgs81
 8JCXeY4JNFyGemYnqEa8HgCOzn5oZ7I=
X-Google-Smtp-Source: ABdhPJySAEkL6WwK43uIr2w1gfGyqXCszCUbjbOVQ7Bg9cAyRsr+AN2Xx0RzzqfULlLo9VBP+pFsCQ==
X-Received: by 2002:a5d:6a46:: with SMTP id t6mr346491wrw.141.1639421777350;
 Mon, 13 Dec 2021 10:56:17 -0800 (PST)
Received: from x1w.redhat.com (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id e3sm11850472wrp.8.2021.12.13.10.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 10:56:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] target/hppa: Minor code movement
Date: Mon, 13 Dec 2021 19:56:09 +0100
Message-Id: <20211213185610.1987974-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211213185610.1987974-1-f4bug@amsat.org>
References: <20211213185610.1987974-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Sven Schnelle <svens@stackframe.org>, Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the 'a->r1 == 0' if ladder earlier, simply
to ease reviewing the next commit change.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/hppa/translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 3b9744deb44..261e4c75c7c 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -3204,14 +3204,14 @@ static bool trans_shrpw_imm(DisasContext *ctx, arg_shrpw_imm *a)
 
     dest = dest_gpr(ctx, a->t);
     t2 = load_gpr(ctx, a->r2);
-    if (a->r1 == a->r2) {
+    if (a->r1 == 0) {
+        tcg_gen_extract_reg(dest, t2, sa, 32 - sa);
+    } else if (a->r1 == a->r2) {
         TCGv_i32 t32 = tcg_temp_new_i32();
         tcg_gen_trunc_reg_i32(t32, t2);
         tcg_gen_rotri_i32(t32, t32, sa);
         tcg_gen_extu_i32_reg(dest, t32);
         tcg_temp_free_i32(t32);
-    } else if (a->r1 == 0) {
-        tcg_gen_extract_reg(dest, t2, sa, 32 - sa);
     } else {
         TCGv_reg t0 = tcg_temp_new();
         tcg_gen_extract_reg(t0, t2, sa, 32 - sa);
-- 
2.33.1



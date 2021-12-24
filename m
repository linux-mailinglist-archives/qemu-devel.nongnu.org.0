Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B92DE47EA6A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 02:55:58 +0100 (CET)
Received: from localhost ([::1]:38088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0ZoL-00004z-JD
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 20:55:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0ZlE-0006mq-AW
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 20:52:44 -0500
Received: from [2607:f8b0:4864:20::1029] (port=36832
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0ZlC-0004jj-Nc
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 20:52:43 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 n15-20020a17090a160f00b001a75089daa3so10232763pja.1
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 17:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rc9pbzpCz8/CeYgIBVap1gdlPVh7C7Z+lzcXjHJfuI0=;
 b=pw9zhMh94UAF1aXUBDuHSexv8B7tYWRLaPu+5eFuq2Ez/N4Ke2vgYec3yR5fggRnh9
 OiUbaKnNt7bD5p9/KjOB72QCZUaDBhAccGaWs/GjekNU7H+NI33BAvpESjt2aHK6fRQo
 9yhzGqQROsSwJ1OIqGYU51HC8dv19Mz2y/Ypm46RfY+pJGJoZgEJn6wRjrlUcXAZKFjC
 T5DbnyVxbCmDAdbsIxm30Wmybc2BWgIZjUjodcysliuj71iKH0TnuJRaUDDeuYQGQaeP
 aKCA3QQeyUm3D+zFONWISj+lyFZ4z0D3MtLHV6aTn2L35S/lYkN65zAFK3kR3K0uCv29
 tl7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rc9pbzpCz8/CeYgIBVap1gdlPVh7C7Z+lzcXjHJfuI0=;
 b=0Z/M57t4mG1MzH9EnQRERxPaY4hFfDtnwYsUypGm2pYWTHW/fMMB8fukLEJbKRjaAx
 U1vJkxkRoeITPKOV+7r1Y8InaO9cq1/EE84tBjYn9qXkDYAErVlbBdkAzFcy6+kH21/D
 n4hqmvSrTMeLat7WOBt5BVJrFcG+uOykDwrFT1fDkBRNifxfWzfninV8yXD3U31B4sKD
 XAQBlpZYx2o6gv1bAE9cJuxmKY2/YW/69pf4oQNSL2TiH5+lhRx8k1338/d+KUdlo1qc
 2o7cJxXXqZwRtmWstD1cjoJWOYT1PqpcO4wl4g5Kye2vg9bp+L8AEczc7XrrhKXen6pA
 jdwQ==
X-Gm-Message-State: AOAM532waR7noHN6W5N8NhV3b5qYwNSAvH+2FmXmCHZbdvwjlVShYuN8
 G3B84a+p2v+UGBTx+PKmvcYXbGosP3pj3Q==
X-Google-Smtp-Source: ABdhPJyiTu5No+QJwgKl+36mkGNbMKHW8AhTVkyrl60HTWyHUFOvlckho5VqRPwji80/cl+wHclLSQ==
X-Received: by 2002:a17:90a:ab0f:: with SMTP id
 m15mr5462048pjq.91.1640310761342; 
 Thu, 23 Dec 2021 17:52:41 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id v6sm5769723pgj.82.2021.12.23.17.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 17:52:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] target/hppa: Fix deposit assert from trans_shrpw_imm
Date: Thu, 23 Dec 2021 17:51:59 -0800
Message-Id: <20211224015159.2155441-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211224015159.2155441-1-richard.henderson@linaro.org>
References: <20211224015159.2155441-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-stable@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Because sa may be 0,

    tcg_gen_deposit_reg(dest, t0, cpu_gr[a->r1], 32 - sa, sa);

may attempt a zero-width deposit at bit 32, which will assert
for TARGET_REGISTER_BITS == 32.

Use the newer extract2 when possible, which itself includes the
rotri special case; otherwise mirror the code from trans_shrpw_sar,
using concat and shri.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/635
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/translate.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 3b9744deb4..952027a28e 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -140,6 +140,7 @@
 #define tcg_gen_deposit_z_reg tcg_gen_deposit_z_i64
 #define tcg_gen_extract_reg  tcg_gen_extract_i64
 #define tcg_gen_sextract_reg tcg_gen_sextract_i64
+#define tcg_gen_extract2_reg tcg_gen_extract2_i64
 #define tcg_const_reg        tcg_const_i64
 #define tcg_const_local_reg  tcg_const_local_i64
 #define tcg_constant_reg     tcg_constant_i64
@@ -234,6 +235,7 @@
 #define tcg_gen_deposit_z_reg tcg_gen_deposit_z_i32
 #define tcg_gen_extract_reg  tcg_gen_extract_i32
 #define tcg_gen_sextract_reg tcg_gen_sextract_i32
+#define tcg_gen_extract2_reg tcg_gen_extract2_i32
 #define tcg_const_reg        tcg_const_i32
 #define tcg_const_local_reg  tcg_const_local_i32
 #define tcg_constant_reg     tcg_constant_i32
@@ -3204,19 +3206,22 @@ static bool trans_shrpw_imm(DisasContext *ctx, arg_shrpw_imm *a)
 
     dest = dest_gpr(ctx, a->t);
     t2 = load_gpr(ctx, a->r2);
-    if (a->r1 == a->r2) {
+    if (a->r1 == 0) {
+        tcg_gen_extract_reg(dest, t2, sa, 32 - sa);
+    } else if (TARGET_REGISTER_BITS == 32) {
+        tcg_gen_extract2_reg(dest, t2, cpu_gr[a->r1], sa);
+    } else if (a->r1 == a->r2) {
         TCGv_i32 t32 = tcg_temp_new_i32();
         tcg_gen_trunc_reg_i32(t32, t2);
         tcg_gen_rotri_i32(t32, t32, sa);
         tcg_gen_extu_i32_reg(dest, t32);
         tcg_temp_free_i32(t32);
-    } else if (a->r1 == 0) {
-        tcg_gen_extract_reg(dest, t2, sa, 32 - sa);
     } else {
-        TCGv_reg t0 = tcg_temp_new();
-        tcg_gen_extract_reg(t0, t2, sa, 32 - sa);
-        tcg_gen_deposit_reg(dest, t0, cpu_gr[a->r1], 32 - sa, sa);
-        tcg_temp_free(t0);
+        TCGv_i64 t64 = tcg_temp_new_i64();
+        tcg_gen_concat_reg_i64(t64, t2, cpu_gr[a->r1]);
+        tcg_gen_shri_i64(t64, t64, sa);
+        tcg_gen_trunc_i64_reg(dest, t64);
+        tcg_temp_free_i64(t64);
     }
     save_gpr(ctx, a->t, dest);
 
-- 
2.25.1



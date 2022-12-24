Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14127655BD9
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 00:59:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9EOw-0002Qw-Ib; Sat, 24 Dec 2022 18:58:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOf-0002NP-Qz
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:46 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOe-0006Gr-26
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:45 -0500
Received: by mail-pl1-x62f.google.com with SMTP id 19so1058145plo.12
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 15:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kWUlisroi1Ap5EswxjI+i9O+kMNxYO+3kWUIW10W2to=;
 b=ZFn9REsLeDmdOxsY+pgtCmb2TdoWk7ZrYIakl5r9adzBKtnegedZK/Ibd5VAo+ZMYL
 Zz6mixJxw/zpqJPvA4nnIM5S9a9sxvSUIfxsRd0W8MHKzd8QK2NoM6IKszFLB3yx+ddR
 dErxACwGeaorC0RD4Qharlw1qbPrxHTlpETTXjGH5OFMbzG/l6pg3EpyGc79zYIVjdjN
 tkqXuIhzAw2iA1xzpo2pUow9rC/YoXyvbyk09U5TCXYRYwtxcmMwIK8Yqip6zr5srzPI
 sckg5gYdH03wLovHfwm1fBvQyosnOoITB4HnD+codAFKHDlgApw5yb+vDK/MNZI26gKT
 D8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kWUlisroi1Ap5EswxjI+i9O+kMNxYO+3kWUIW10W2to=;
 b=i7FwH5qrb/nfzinELp/3U9key64CCZMzPMsLhP+dKtTQDS5Q1SsMPKyEHHZfk121JZ
 oGXK6dsiupQ+OKWI2mIDXrzeSSURJBJDYKT/17qE+ogyOgW8C065o3yWnLeToVvyNZiq
 8Q7fqVAqDooXXU4V6dQWyIew2BfQn5do/C30idQlj4BZdS4ikXpWdu7QR4k+WhXR6Bo0
 HiElFjdzi5HxgpIuFYHVgzOW2sY+rcP9VtrJ54W3UvQOVMpPG1muWQBF3n59ul9fkvIs
 R84c1odRRay+711ENJ5pznDcYFV+V5pyP/DENEDbBdSHUEZdKlPOTk2C/THXaVi/2z7S
 qzGQ==
X-Gm-Message-State: AFqh2krVd9RlnskgOMMQAMr3JqpNqs2/yxPKUHcaIswVUS1X16q0e5d3
 ztZamCsAnuHttOmIg2Z3rrn1fM7mi0vIC54Z
X-Google-Smtp-Source: AMrXdXsrN/OBAJ4LaEZXiEuEK3WKNcheH4s+STt6pJ1xwDNjICXCKttBy6gfrY0EsWwsdz0h6Lng9w==
X-Received: by 2002:a17:902:ee41:b0:191:2181:d6e0 with SMTP id
 1-20020a170902ee4100b001912181d6e0mr14917396plo.8.1671926262589; 
 Sat, 24 Dec 2022 15:57:42 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 cp12-20020a170902e78c00b00187022627d7sm4599716plb.36.2022.12.24.15.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 15:57:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, philmd@linaro.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v5 21/43] target/sparc: Avoid TCGV_{LOW,HIGH}
Date: Sat, 24 Dec 2022 15:56:58 -0800
Message-Id: <20221224235720.842093-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224235720.842093-1-richard.henderson@linaro.org>
References: <20221224235720.842093-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Use the official extend/extract functions instead of routines
that will shortly be internal to tcg.

Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/translate.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 34858eb95f..150aeecd14 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -163,13 +163,6 @@ static inline void gen_update_fprs_dirty(DisasContext *dc, int rd)
 /* floating point registers moves */
 static TCGv_i32 gen_load_fpr_F(DisasContext *dc, unsigned int src)
 {
-#if TCG_TARGET_REG_BITS == 32
-    if (src & 1) {
-        return TCGV_LOW(cpu_fpr[src / 2]);
-    } else {
-        return TCGV_HIGH(cpu_fpr[src / 2]);
-    }
-#else
     TCGv_i32 ret = get_temp_i32(dc);
     if (src & 1) {
         tcg_gen_extrl_i64_i32(ret, cpu_fpr[src / 2]);
@@ -177,22 +170,16 @@ static TCGv_i32 gen_load_fpr_F(DisasContext *dc, unsigned int src)
         tcg_gen_extrh_i64_i32(ret, cpu_fpr[src / 2]);
     }
     return ret;
-#endif
 }
 
 static void gen_store_fpr_F(DisasContext *dc, unsigned int dst, TCGv_i32 v)
 {
-#if TCG_TARGET_REG_BITS == 32
-    if (dst & 1) {
-        tcg_gen_mov_i32(TCGV_LOW(cpu_fpr[dst / 2]), v);
-    } else {
-        tcg_gen_mov_i32(TCGV_HIGH(cpu_fpr[dst / 2]), v);
-    }
-#else
-    TCGv_i64 t = (TCGv_i64)v;
+    TCGv_i64 t = tcg_temp_new_i64();
+
+    tcg_gen_extu_i32_i64(t, v);
     tcg_gen_deposit_i64(cpu_fpr[dst / 2], cpu_fpr[dst / 2], t,
                         (dst & 1 ? 0 : 32), 32);
-#endif
+    tcg_temp_free_i64(t);
     gen_update_fprs_dirty(dc, dst);
 }
 
-- 
2.34.1



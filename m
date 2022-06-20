Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F785523D5
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 20:27:27 +0200 (CEST)
Received: from localhost ([::1]:47034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3M7S-0007vq-7F
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 14:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LaH-0006NL-BG
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:53:10 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:54943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LaB-0001Wf-3d
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:53:07 -0400
Received: by mail-pj1-x1032.google.com with SMTP id cv13so8158012pjb.4
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DVA+HWK843xLMqB7esE5JHN46OyQAAXOs3TeUqe1TX8=;
 b=u8I08ZmQHiN0abr2TODL9N9U0pf6Q2oWYJbMWtYzItBNAJu/qhEEKjsE9+kyJe0hqz
 y/0yfbSjzK86pcuXlV7O/dkC18oy6+vpfDYcQpzPeB706jwytkhjb3SY13PmGwAFlNob
 TNAdWK8zEZRUM+DHC5o9GEP4WSTlHXGF6vfgxoBT6r1+B0talnvYe7/EVaf1d/VgllHg
 BxiqXb1nTc/7tPnlG55ov1krcncxMsKr9JHcIe/Cv0zfJIE779yHVriiDBIuZdOSMyyc
 r4I7sABvRzFdeP0tbsSTXhuJXtqxDDitkBHLSnHdFfPxhNUDTqCKL4sItV5h0FI7jJim
 V1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DVA+HWK843xLMqB7esE5JHN46OyQAAXOs3TeUqe1TX8=;
 b=hE9ohdaDqmIaqdJwRKsbXvPdI2CPEp/N0X9YpmFEDmJImPyh20c0pU/TT5saOnbaED
 wh70MXG/5phx1lIW9zynCiC4sO9lSNrWyPchkMLWf8i7b723QBF2Xwp/gZJnHl9GpQcq
 trzk+6PGuwdfCpEIuwQ2IknAx0PXVTMrNiY0/65ySvu/7RGaaYeqCS5UUM0ZxZ+R0Vg1
 wjDnwcSEHyjv9jaiDFlGYQRmc5NPEI+t7K69ZqT9d8+f+6wYuGmPtRxPLpjjPkvBwmvu
 +yV/2+RWV3LvtnLixPTzjfvIGCLLymHCxe4i+tZIEeaaBkGUYV9yCjkB3wC48pxtoUgU
 ZbZw==
X-Gm-Message-State: AJIora98JuxCA02KMqcsdd0mGuZf5t/xrCcN9zr+WLxY5t+M9WrELBkv
 Uqt0A5HbkjBDjoE4aefM2gnVOpU0DLK2Xw==
X-Google-Smtp-Source: AGRyM1vDWjoMeIZ+ydUDM4yRJ4j5rPKhtMp2SSWaHgM/Ynkzj4n6LhAM+WNcrAWiTILC4ZRpcuG39Q==
X-Received: by 2002:a17:902:d502:b0:16a:2cb3:74eb with SMTP id
 b2-20020a170902d50200b0016a2cb374ebmr3859406plg.160.1655747581040; 
 Mon, 20 Jun 2022 10:53:01 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:53:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 28/51] target/arm: Implement SME LDR, STR
Date: Mon, 20 Jun 2022 10:52:12 -0700
Message-Id: <20220620175235.60881-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can reuse the SVE functions for LDR and STR, passing in the
base of the ZA vector and a zero offset.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme.decode      |  7 +++++++
 target/arm/translate-sme.c | 23 +++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index 900e3f2a07..f1ebd857a5 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -46,3 +46,10 @@ LDST1           1110000 0 esz:2 st:1 rm:5 v:1 .. pg:3 rn:5 0 za_imm:4  \
                 &ldst rs=%mova_rs
 LDST1           1110000 111     st:1 rm:5 v:1 .. pg:3 rn:5 0 za_imm:4  \
                 &ldst esz=4 rs=%mova_rs
+
+&ldstr          rv rn imm
+@ldstr          ....... ... . ...... .. ... rn:5 . imm:4 \
+                &ldstr rv=%mova_rs
+
+LDR             1110000 100 0 000000 .. 000 ..... 0 ....        @ldstr
+STR             1110000 100 1 000000 .. 000 ..... 0 ....        @ldstr
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index 978af74d1d..c3e544d69c 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -220,3 +220,26 @@ static bool trans_LDST1(DisasContext *s, arg_LDST1 *a)
     tcg_temp_free_i64(addr);
     return true;
 }
+
+typedef void GenLdStR(DisasContext *, TCGv_ptr, int, int, int, int);
+
+static bool do_ldst_r(DisasContext *s, arg_ldstr *a, GenLdStR *fn)
+{
+    int imm = a->imm;
+    TCGv_ptr base;
+
+    if (!sme_za_enabled_check(s)) {
+        return true;
+    }
+
+    /* ZA[n] equates to ZA0H.B[n]. */
+    base = get_tile_rowcol(s, MO_8, a->rv, imm, false);
+
+    fn(s, base, 0, s->svl, a->rn, imm * s->svl);
+
+    tcg_temp_free_ptr(base);
+    return true;
+}
+
+TRANS_FEAT(LDR, aa64_sme, do_ldst_r, a, gen_sve_ldr)
+TRANS_FEAT(STR, aa64_sme, do_ldst_r, a, gen_sve_str)
-- 
2.34.1



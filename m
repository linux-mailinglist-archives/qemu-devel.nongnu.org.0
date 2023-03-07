Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8A86AEE16
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:09:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbe9-0003lQ-0b; Tue, 07 Mar 2023 13:02:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbe3-00036F-SN
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:39 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbe2-00018A-1Z
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:39 -0500
Received: by mail-pg1-x535.google.com with SMTP id s17so8125585pgv.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678212156;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q3eB/kKfZL9pcS67BwAlUIjdCl9WdcWSOaNoguAhnXA=;
 b=iTzSyLl0fPo1V0RlGGJTWdNSgueLohfTo7REzBveqykpCJp0WhXUJwC+cr9Mxis6ac
 lc4dVdLHPmqgxhrnWqpKoVdp2U9IjguG9HA+ojSOG6xOpNXbib/s6xf/I12xXJtoynjq
 xXVplqCt+T5p7ODC54gXLtsfijI9a88FUtiChkgbu/KlAwfpgU6z61CgbX69NXLiOW2Z
 6IpmEBmISagabIMzFvcsyt0cNUr/OTFqlGsHmseLf+XljGLF4Ovk6xTW0DSXv0GaKbLk
 9IHTEaYayEotMHSPLp5JVM/Rze+1ugjrlB+9h1xxPQfTu2x5HGJpOHqPNsJmYTohQxS8
 t7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678212156;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q3eB/kKfZL9pcS67BwAlUIjdCl9WdcWSOaNoguAhnXA=;
 b=rdVSzX3H1Qi/yV3cnlwGOyesuDzXFjhS5LMa5ghNjutvRgPGLg15JQf7bJ37yMYW6E
 ec1InJIimA6d0BF4cnXuuhmpzjmgPIXrQKTcT8qghNpt40mJ5Cxgsc/Kjh6gg4at9ebQ
 tPHxnffJ9vOQ+HYM/DAh8h9q3vuZm1kaBSQdnN0wCQMjTsB6GgYA0DrFHDh3dmhg3SMC
 JIWvIgb1CqeKB0gzVdqvxX0H8f/nTwfRDJePrBmMN2xa3f9pxEwlK4Y8BT/FmFOUbzrD
 F3pUW1LZAzVqcId66pvbOzdCP10/blPb0ktKc4OpG+tAlf5V4cSuibUQVKqyulOWaJSw
 rL0g==
X-Gm-Message-State: AO0yUKW3YQL3enXxAuuH3wLUIWP2SBheizUCiNrKNpao1YcMNtOFJBjY
 fsrKriIINa9aBlpYCr5BUHbaEH8j8neiUyyOvFs=
X-Google-Smtp-Source: AK7set/KhlGbGOCznkrQwKLyon5FbshONcvCkRt7Y1TuYo/L94P9Mx9CqZxH2hLX5J8QCvPL9kWMuQ==
X-Received: by 2002:a62:1b4c:0:b0:5a8:bdae:caa7 with SMTP id
 b73-20020a621b4c000000b005a8bdaecaa7mr12191498pfb.14.1678212156415; 
 Tue, 07 Mar 2023 10:02:36 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a63e544000000b00502fd70b0bdsm8080441pgj.52.2023.03.07.10.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:02:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 58/67] target/s390x: Avoid tcg_const_i64
Date: Tue,  7 Mar 2023 09:58:39 -0800
Message-Id: <20230307175848.2508955-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

All uses are strictly read-only.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 7969051ce9..32d61fc40d 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -4857,13 +4857,13 @@ static DisasJumpType op_xi(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_zero(DisasContext *s, DisasOps *o)
 {
-    o->out = tcg_const_i64(0);
+    o->out = tcg_constant_i64(0);
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_zero2(DisasContext *s, DisasOps *o)
 {
-    o->out = tcg_const_i64(0);
+    o->out = tcg_constant_i64(0);
     o->out2 = o->out;
     return DISAS_NEXT;
 }
@@ -5762,7 +5762,7 @@ static void in2_sh(DisasContext *s, DisasOps *o)
     int d2 = get_field(s, d2);
 
     if (b2 == 0) {
-        o->in2 = tcg_const_i64(d2 & 0x3f);
+        o->in2 = tcg_constant_i64(d2 & 0x3f);
     } else {
         o->in2 = get_address(s, 0, b2, d2);
         tcg_gen_andi_i64(o->in2, o->in2, 0x3f);
@@ -5868,46 +5868,46 @@ static void in2_mri2_64(DisasContext *s, DisasOps *o)
 
 static void in2_i2(DisasContext *s, DisasOps *o)
 {
-    o->in2 = tcg_const_i64(get_field(s, i2));
+    o->in2 = tcg_constant_i64(get_field(s, i2));
 }
 #define SPEC_in2_i2 0
 
 static void in2_i2_8u(DisasContext *s, DisasOps *o)
 {
-    o->in2 = tcg_const_i64((uint8_t)get_field(s, i2));
+    o->in2 = tcg_constant_i64((uint8_t)get_field(s, i2));
 }
 #define SPEC_in2_i2_8u 0
 
 static void in2_i2_16u(DisasContext *s, DisasOps *o)
 {
-    o->in2 = tcg_const_i64((uint16_t)get_field(s, i2));
+    o->in2 = tcg_constant_i64((uint16_t)get_field(s, i2));
 }
 #define SPEC_in2_i2_16u 0
 
 static void in2_i2_32u(DisasContext *s, DisasOps *o)
 {
-    o->in2 = tcg_const_i64((uint32_t)get_field(s, i2));
+    o->in2 = tcg_constant_i64((uint32_t)get_field(s, i2));
 }
 #define SPEC_in2_i2_32u 0
 
 static void in2_i2_16u_shl(DisasContext *s, DisasOps *o)
 {
     uint64_t i2 = (uint16_t)get_field(s, i2);
-    o->in2 = tcg_const_i64(i2 << s->insn->data);
+    o->in2 = tcg_constant_i64(i2 << s->insn->data);
 }
 #define SPEC_in2_i2_16u_shl 0
 
 static void in2_i2_32u_shl(DisasContext *s, DisasOps *o)
 {
     uint64_t i2 = (uint32_t)get_field(s, i2);
-    o->in2 = tcg_const_i64(i2 << s->insn->data);
+    o->in2 = tcg_constant_i64(i2 << s->insn->data);
 }
 #define SPEC_in2_i2_32u_shl 0
 
 #ifndef CONFIG_USER_ONLY
 static void in2_insn(DisasContext *s, DisasOps *o)
 {
-    o->in2 = tcg_const_i64(s->fields.raw_insn);
+    o->in2 = tcg_constant_i64(s->fields.raw_insn);
 }
 #define SPEC_in2_insn 0
 #endif
-- 
2.34.1



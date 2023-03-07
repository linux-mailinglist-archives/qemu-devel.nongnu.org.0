Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7706AEE22
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:09:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbe2-0002i9-Sj; Tue, 07 Mar 2023 13:02:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbe0-0002a9-Kk
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:36 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbdy-00017M-RC
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:36 -0500
Received: by mail-pl1-x633.google.com with SMTP id h8so14991364plf.10
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678212153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1YHQGX/lZqTZc1F+qrfJD0NpxECIkjQPgh9T1q66oi4=;
 b=BRLp+m5IZMLGRnqzH5chWyTeGhQ4RVwVh/IIcU45qenITUyvMJGGzU2oc9mcAp9Ow3
 DhqZXmQPI1+ldYxSteR2SMWovOZ+GP83O8iJyWMcU2IpSH806tO+SSTbOKjJ2otbKfLh
 V46CewZ6s9jFY2rhas0EvB0p66Wz774qanZPNp9PkPr4ZbkxGnoe0MvHKwjmnilAhcIC
 BW8aqBae+EwB73amH8SayTb0X0kYKqQugxXssRyLWog4J3hLHobrA+aRMYVmuQNnBHkC
 7QvEUEveG3cWt9e8WYj5IhCkmWc6pFHyZueje+GqvdjItXuUHlYyskG/DEqFyUJRct77
 g20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678212153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1YHQGX/lZqTZc1F+qrfJD0NpxECIkjQPgh9T1q66oi4=;
 b=iv2qu4UO/JLzIUaWoweQVIYCV8I1F2/ppbZAJo3zzWBAd9XXqhHw/L1T3s+U10718w
 pOJDE3HhIkD524MmDcxxBmYAK/bXuVSbz/mWpteeuPbmwbCEmEidNXtj9q58HB/87JR5
 ZXHu/ZH/t8T6LbahbWV/kAAYsv3ivTe5dPHHXDpvcIuA6gg9T8/KoE79ev6NQ6BcPyeG
 m4AVGV6qMiPXN+JN/x6dCv7utz2ApUd+JNdNPiZZeujpphWwyU8ZiGXoSOevoHS3WoJO
 0Flm+17odrnwLZU6pv8D9vriRNCNPoE/erB7y/OSJP5LPoXMSMP/1FjBEaGMHB8amvS3
 FQIQ==
X-Gm-Message-State: AO0yUKVAI4ZekFUNYA3nFm+R0FzBae9EZ1wL1J7l00UFLsfxSUoPFcuw
 f4JorOhUmnWo7qiUm9iOjQ2uDQl5qozPNhUuG8E=
X-Google-Smtp-Source: AK7set9xplKMlg4ABzmXsCiG6NpcTHzNbBFfTk4YJVQdTDACg89ExPRlC7+582WZeOQuSujd/8ZTaA==
X-Received: by 2002:a05:6a20:ba94:b0:c6:c030:81aa with SMTP id
 fb20-20020a056a20ba9400b000c6c03081aamr13909292pzb.59.1678212153616; 
 Tue, 07 Mar 2023 10:02:33 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a63e544000000b00502fd70b0bdsm8080441pgj.52.2023.03.07.10.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:02:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 55/67] target/rx: Use cpu_psw_z as temp in flags computation
Date: Tue,  7 Mar 2023 09:58:36 -0800
Message-Id: <20230307175848.2508955-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

Since PSW_Z = PSW_S, we can move that assignment to the end
and use PSW_Z as a temporary while computing PSW_O.
Use tcg_constant_i32 instead of tcg_const_i32.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/translate.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/target/rx/translate.c b/target/rx/translate.c
index 998e6e0b7e..c47aa26893 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -967,14 +967,13 @@ static bool trans_NEG_rr(DisasContext *ctx, arg_NEG_rr *a)
 /* ret = arg1 + arg2 + psw_c */
 static void rx_adc(TCGv ret, TCGv arg1, TCGv arg2)
 {
-    TCGv z;
-    z = tcg_const_i32(0);
+    TCGv z = tcg_constant_i32(0);
     tcg_gen_add2_i32(cpu_psw_s, cpu_psw_c, arg1, z, cpu_psw_c, z);
     tcg_gen_add2_i32(cpu_psw_s, cpu_psw_c, cpu_psw_s, cpu_psw_c, arg2, z);
-    tcg_gen_mov_i32(cpu_psw_z, cpu_psw_s);
     tcg_gen_xor_i32(cpu_psw_o, cpu_psw_s, arg1);
-    tcg_gen_xor_i32(z, arg1, arg2);
-    tcg_gen_andc_i32(cpu_psw_o, cpu_psw_o, z);
+    tcg_gen_xor_i32(cpu_psw_z, arg1, arg2);
+    tcg_gen_andc_i32(cpu_psw_o, cpu_psw_o, cpu_psw_z);
+    tcg_gen_mov_i32(cpu_psw_z, cpu_psw_s);
     tcg_gen_mov_i32(ret, cpu_psw_s);
 }
 
@@ -1006,13 +1005,12 @@ static bool trans_ADC_mr(DisasContext *ctx, arg_ADC_mr *a)
 /* ret = arg1 + arg2 */
 static void rx_add(TCGv ret, TCGv arg1, TCGv arg2)
 {
-    TCGv z;
-    z = tcg_const_i32(0);
+    TCGv z = tcg_constant_i32(0);
     tcg_gen_add2_i32(cpu_psw_s, cpu_psw_c, arg1, z, arg2, z);
-    tcg_gen_mov_i32(cpu_psw_z, cpu_psw_s);
     tcg_gen_xor_i32(cpu_psw_o, cpu_psw_s, arg1);
-    tcg_gen_xor_i32(z, arg1, arg2);
-    tcg_gen_andc_i32(cpu_psw_o, cpu_psw_o, z);
+    tcg_gen_xor_i32(cpu_psw_z, arg1, arg2);
+    tcg_gen_andc_i32(cpu_psw_o, cpu_psw_o, cpu_psw_z);
+    tcg_gen_mov_i32(cpu_psw_z, cpu_psw_s);
     tcg_gen_mov_i32(ret, cpu_psw_s);
 }
 
@@ -1042,23 +1040,23 @@ static bool trans_ADD_rrr(DisasContext *ctx, arg_ADD_rrr *a)
 /* ret = arg1 - arg2 */
 static void rx_sub(TCGv ret, TCGv arg1, TCGv arg2)
 {
-    TCGv temp;
     tcg_gen_sub_i32(cpu_psw_s, arg1, arg2);
-    tcg_gen_mov_i32(cpu_psw_z, cpu_psw_s);
     tcg_gen_setcond_i32(TCG_COND_GEU, cpu_psw_c, arg1, arg2);
     tcg_gen_xor_i32(cpu_psw_o, cpu_psw_s, arg1);
-    temp = tcg_temp_new_i32();
-    tcg_gen_xor_i32(temp, arg1, arg2);
-    tcg_gen_and_i32(cpu_psw_o, cpu_psw_o, temp);
+    tcg_gen_xor_i32(cpu_psw_z, arg1, arg2);
+    tcg_gen_and_i32(cpu_psw_o, cpu_psw_o, cpu_psw_z);
+    tcg_gen_mov_i32(cpu_psw_z, cpu_psw_s);
     /* CMP not required return */
     if (ret) {
         tcg_gen_mov_i32(ret, cpu_psw_s);
     }
 }
+
 static void rx_cmp(TCGv dummy, TCGv arg1, TCGv arg2)
 {
     rx_sub(NULL, arg1, arg2);
 }
+
 /* ret = arg1 - arg2 - !psw_c */
 /* -> ret = arg1 + ~arg2 + psw_c */
 static void rx_sbb(TCGv ret, TCGv arg1, TCGv arg2)
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 107A36593C1
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:17:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2rK-00036a-KG; Thu, 29 Dec 2022 19:02:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rF-00034b-6x
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:45 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rD-0002ih-IB
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:44 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 h7-20020a17090aa88700b00225f3e4c992so11733466pjq.1
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kWUlisroi1Ap5EswxjI+i9O+kMNxYO+3kWUIW10W2to=;
 b=MyljtFO70CWLYUz475+SyA76dVgSH3RCDgOBr11yB5OgnW2gqvtsOVzYmDG7QELfvf
 P0EbOq1QGIFIVcyZBeRQZkTSRQDJudHjKiIZ1ZokEie6ewiB84v/TwJDqz03ZJOwgLSS
 e2DZ+zCB09LXRWecTzhBFyd2pUmZP+vLkK5vRHmgfglvO/+M/U1uUkDygulKAETUj5fe
 FoccjPojIgnhDFIDC/PaeSO17s25Wjug1d72HPLnxzvpa0RftDbQsk18Jm1RAE+kugKt
 7WlD28NKJwE+ySh820DuX+OEgPLvsQBNPpICy/Abc20uz1+ofOtRxVP6K/Xp6DjzduRi
 u9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kWUlisroi1Ap5EswxjI+i9O+kMNxYO+3kWUIW10W2to=;
 b=28FnQGwciWD6zXoYq97v92HPQoHjKjFCKuwcI/Z0MSyZ4iSyLc/UdOVutStjl9yzn6
 1Q33ytmnN0L2+9P24D1vdAvn1DuhCxxygL4HaopnyJSzCvtoEjSjvTAerfQjIy/DRti4
 QF41wCfgtD+p8RMs5v5tSigyo4Y8MDwtT1vJzgPWYEYVOgCaZYQgm6368cz6d8N593+H
 YEAr295DQOoGHEDnq5k1xpB3DNBas8FNbwwIG2LLmWJqzYpzvjTRGmN1y9R8BMxiteQq
 GgnJxY+Q9vt0rg6Pxo/xGnq9PnapkYMjIFq9XMbS0yjIXqBrrS2c4FLW8YI6qVpAhxNI
 onjA==
X-Gm-Message-State: AFqh2kpskcjInfSe3UenA5BSoCHRTwO1NIlAM1UrL0jn+3KLuIhtaVb4
 hX/IqFi0xTsZ+3zbXfPIiNKVRTOoDTBTp5aV
X-Google-Smtp-Source: AMrXdXv3KysQqbl36XDOCoF2RCXrHFreCUxunh9g8t6s53y47fJAjVvuAHgWy7IB2yJzUy2KVTs8jw==
X-Received: by 2002:a17:902:7247:b0:192:8f2c:dd23 with SMTP id
 c7-20020a170902724700b001928f2cdd23mr9866112pll.13.1672358562342; 
 Thu, 29 Dec 2022 16:02:42 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903028e00b00192849e1d0asm7343953plr.116.2022.12.29.16.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:02:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 21/47] target/sparc: Avoid TCGV_{LOW,HIGH}
Date: Thu, 29 Dec 2022 16:01:55 -0800
Message-Id: <20221230000221.2764875-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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



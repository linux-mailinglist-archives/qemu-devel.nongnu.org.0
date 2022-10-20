Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 913EC6062E8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:24:54 +0200 (CEST)
Received: from localhost ([::1]:34830 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWTb-00032q-Db
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:24:52 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWOH-0007Lu-K2
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU7L-0004Wc-9Q
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:53:43 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:33310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU7J-0000zf-LS
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:53:43 -0400
Received: by mail-pl1-x62e.google.com with SMTP id 10so20130614pli.0
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ffAk/uKFmYMud8oNMjB2hkT94GX/9Rmm5gafjNWj2X0=;
 b=XcTUuWoRjKZiYqX8IUPix4HtsvJwNUmEVRyyzFOv6IyA5c3G0NoZORhswqa0AO5THe
 iVuh83AZCPODKIcwsi7GPm/+ForunJ8YSnCNnromosLM5RcNimXDc0XtKwkUuEJd6/Yl
 KOe4w1bV4dWeJ1Q+SY95DxhnTanLVvA7BhgnW1DwPwV8SYfG1EvDl5k6EA44fgrctCrN
 oYwKKjSOw5hPuvrPEnzw2DdGeUiVw43BcsiBA2bvCmaMUE/66vLslJLJHLzJTcNRYayR
 8RlyTIv9BvVM1dAtkDUIB+pOSTIyG0CzB+yqVby/Mtt9BHiNR+j5lF/G3555nOdRRtN7
 m2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ffAk/uKFmYMud8oNMjB2hkT94GX/9Rmm5gafjNWj2X0=;
 b=JGWSv4rslkvsjEXOMVUVwj/EfwbC9RggoAXAm36vHQ/brKdO0rt8131eexItrx5NA5
 t1aciJ9zEDgX7nP42k9/k0/KqqA++fMi2zVRsIY2eyDKO5Za8V42m2vaofq1MkBiCtVY
 QD3tUwaDfoHxrhJgGqGODtZPkKKtVuHqrX9dTXhXTe5JejqkY18Zqp+ieMeCJMO0TrMN
 LD776zkmnL49xrwi6UlaeFZbkdR9AvsX39dZ9FSSBnw7XH8rzkaReb8LwCF2uEkHY+0Y
 Ccf83cMY/AJimWZLmCGZpkNw2HMoZtxqjsKifs0K9jXubsYRDHQujIfOCcm7ZdV1HAdz
 viVA==
X-Gm-Message-State: ACrzQf1tzxhYydsxdf+A1xAzWt18sFKH5N4MucvczGfr+s52FGSOxwvK
 RlKbUblSNVldIW5QDfgIJ1X/EyhS1unt4trY
X-Google-Smtp-Source: AMsMyM6xfGEzJ3rxrCxIpwEBE6/6JhOBr8W0nRk4xKzXQJFgho+HtYtKBV3h5ab1GBiQR2waBKRhxw==
X-Received: by 2002:a17:902:e88b:b0:17f:93a4:e31b with SMTP id
 w11-20020a170902e88b00b0017f93a4e31bmr13817380plg.51.1666266820185; 
 Thu, 20 Oct 2022 04:53:40 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 w206-20020a627bd7000000b0056109e15638sm13065464pfc.54.2022.10.20.04.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:53:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH 08/31] target/sparc: Avoid TCGV_{LOW,HIGH}
Date: Thu, 20 Oct 2022 21:52:19 +1000
Message-Id: <20221020115242.2301066-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115242.2301066-1-richard.henderson@linaro.org>
References: <20221020115242.2301066-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the official extend/extract functions instead of routines
that will shortly be internal to tcg.

Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/translate.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 2cbbe2396a..7e9631f004 100644
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



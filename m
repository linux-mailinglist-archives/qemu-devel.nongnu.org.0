Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E686AF0F2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:37:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZc9b-0003b1-AZ; Tue, 07 Mar 2023 13:35:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9Y-0003Ye-EW
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:12 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9W-0007im-5k
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:12 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 x20-20020a17090a8a9400b00233ba727724so1846595pjn.1
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678214109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nzq0HMNTYxPoQdwBr6U6yuEWrZYUhbLnx8E8aaEFjeI=;
 b=OIZ6o67M8R0QJvDEdoPtF6358XD0ACF3Si1BSCrgJ4aqA+CEgB7PrtraRvxcGuK0kI
 hgAo+3G/fr3K8LM14kDsQ3k7ijWRmEeso5g5/Q8yj0tON+K8OCEq+OfHNvf/GsA/yzBb
 LbN0VeVAwlFHSVBKhTxAo6F297Q2bXTGE5pSYl2oPXwNfX9OXaqRpX5NcB+YDjRnqaOw
 x5o5hTf8TJgKNhcYEzOTTeG/l3/nmL5v2dV1nOd8ZgS1W91AxyGzWrqdV+iVvrMWD6Oz
 4LuCny9uI4Mt+YvEzyNGaroJmGxYwuZIzzQfsl0aVKqDmgR/TfiqJO/ApRin5rXoWxSy
 ahOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678214109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nzq0HMNTYxPoQdwBr6U6yuEWrZYUhbLnx8E8aaEFjeI=;
 b=69VLfi/Vgu8dfE/GUhN9duAjhalFZ5ddzf2GwlBdIgwfEGQTYIqIwo/0ixQZxFIDQN
 TuTEjmtc8z0RkPp4ISWEeHjby94N6ErKUpDLMZRYiHQhMeLt8qBgcISWPrijhRdeNG8j
 QCRPRosHUFbm8Qr+xN9Vo0uGM1ncMu+GyMpo5Jj/vDTTHU10aI/rOpWKN4/fbx4j3FIJ
 hJa7YlGiQZkZ8Mf7hHzCyfdOXQBCTj2TKDc2DW8QhMjwdBJF8L8yMFnVmqoxb4WSXAlv
 n29N7O4DC/ItcaJgbVRyBplu0I20JiOHm1bPpBq18rwdFLzzOXOi0OvxHjN8OBaB+QRN
 GBgA==
X-Gm-Message-State: AO0yUKUr1VluH6j/Bxf+NEya7h8ksDYTgWpeh1Jqjx2lFHRATd3rmP13
 Y8iJP1NKCk+lm35Yzyc7/2L98n+XUwhVdxaEjJg=
X-Google-Smtp-Source: AK7set8kJjdV6Nz1SAd1Ut6shUcD3kIK5Mn0W+mDO44ryDwm/gZZ+hCn3/S+VFFLn0DWc57k7g/gJg==
X-Received: by 2002:a17:90b:3a8d:b0:235:53e5:8597 with SMTP id
 om13-20020a17090b3a8d00b0023553e58597mr15825205pjb.34.1678214108892; 
 Tue, 07 Mar 2023 10:35:08 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a17090a1b0100b0022c0a05229fsm7757940pjq.41.2023.03.07.10.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:35:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 06/25] target/arm: Improve trans_BFCI
Date: Tue,  7 Mar 2023 10:34:44 -0800
Message-Id: <20230307183503.2512684-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307183503.2512684-1-richard.henderson@linaro.org>
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

Reorg temporary usage so that we can use tcg_constant_i32.
tcg_gen_deposit_i32 already has a width == 32 special case,
so remove the check here.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: qemu-arm@nongnu.org
---
 target/arm/tcg/translate.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index b70b628000..4451aea09c 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -7261,8 +7261,8 @@ static bool trans_UBFX(DisasContext *s, arg_UBFX *a)
 
 static bool trans_BFCI(DisasContext *s, arg_BFCI *a)
 {
-    TCGv_i32 tmp;
     int msb = a->msb, lsb = a->lsb;
+    TCGv_i32 t_in, t_rd;
     int width;
 
     if (!ENABLE_ARCH_6T2) {
@@ -7277,16 +7277,13 @@ static bool trans_BFCI(DisasContext *s, arg_BFCI *a)
     width = msb + 1 - lsb;
     if (a->rn == 15) {
         /* BFC */
-        tmp = tcg_const_i32(0);
+        t_in = tcg_constant_i32(0);
     } else {
         /* BFI */
-        tmp = load_reg(s, a->rn);
+        t_in = load_reg(s, a->rn);
     }
-    if (width != 32) {
-        TCGv_i32 tmp2 = load_reg(s, a->rd);
-        tcg_gen_deposit_i32(tmp, tmp2, tmp, lsb, width);
-    }
-    store_reg(s, a->rd, tmp);
+    t_rd = load_reg(s, a->rd);
+    tcg_gen_deposit_i32(t_rd, t_rd, t_in, lsb, width);
     return true;
 }
 
-- 
2.34.1



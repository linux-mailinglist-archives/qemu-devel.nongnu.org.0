Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A675104C9
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 19:00:29 +0200 (CEST)
Received: from localhost ([::1]:48298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOY8-00077C-5Q
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 13:00:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5t-00035V-46
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:21 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:41660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5o-0003ti-1C
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:16 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 z5-20020a17090a468500b001d2bc2743c4so3041483pjf.0
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fMavBc3LF21tCnxOFcQlctg5X2JRkGnD8DmWT3QUZyQ=;
 b=zLjTevTuMnYWbGWfGVz/nBpNq5yFNxWZVgnbOD1hlyp0pKY3BtAYRAH2A5AHt2Luj3
 84yKibNnMFf4RCcUhPVeNjm04Ci4BJrHy4m7l056L4v82oX5YYHQgyDGknYYw82LPsEa
 Xxru9DKTuPB6/RuBiLjZDkQcI4pELyL1IUAIB+11o5EOIdIkQzigrv7nAKolQfW9+KcY
 MaBrNYUvB3l8qpBvD2au8dK1+KJv4xU2rEDTiq9IsV37OMh7CWYjZHErG9zmf8Qx96Hr
 UGHspLuWV0x5ic6OSbSLk+fJPt7TNTGbSRn8NZ4eVFyY2KDbcNfePwnljtpKHCZwDG4Y
 KpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fMavBc3LF21tCnxOFcQlctg5X2JRkGnD8DmWT3QUZyQ=;
 b=WguwTXmQpRVF8EfGhMTULsjrqSIMhEw2wqO/3pNNPrVPVyrhTc6T8pYWcEru3lv1XL
 As8XFAGSU3a0QnNBUJlZsmpT8j7j7j3siT1QSoFFLq60biZcJ0pFJRZujZh/Rkmj4E5S
 +9a+Zyit+JYFbE8ORGLjfWyHRU5cgNjiJf5isUZ9fRimszCCY3NvVrOO+Q9h5goggrzc
 Zy/fxUwOIFE9oKNo+SwoFo/Ll69M1GtBHi5T9JIj8PZbfxytG01SEtUaIvRkKfXbNziO
 YjGusbbhq0vlrMZ3qQuBd60wYQPjtjlga2IiZwuz28sVIimgpimBIqfdjAZ/BWta79c2
 T6aQ==
X-Gm-Message-State: AOAM531Itl87o0Q2ug3JJgGkdFrfbUxaBPXmyEZiJDJggyFNbJHSnbuL
 X5xeJD4KiFg4nGV/tLfC8Ojte+uT/C47Zg==
X-Google-Smtp-Source: ABdhPJxVHuA8TYv2NbWZAHnvv2lswx3rGJ4XZN4WoaFjvM0QOq3FlSkgh+qDnlTSqHAonDGhVStofw==
X-Received: by 2002:a17:90b:33c6:b0:1d7:b80e:7877 with SMTP id
 lk6-20020a17090b33c600b001d7b80e7877mr26982055pjb.121.1650990670728; 
 Tue, 26 Apr 2022 09:31:10 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 28/47] target/arm: Use tcg_constant for op_s_{rri,rxi}_rot
Date: Tue, 26 Apr 2022 09:30:24 -0700
Message-Id: <20220426163043.100432-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 8476f259fc..223fd5fdfe 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5495,18 +5495,16 @@ static bool op_s_rri_rot(DisasContext *s, arg_s_rri_rot *a,
                          void (*gen)(TCGv_i32, TCGv_i32, TCGv_i32),
                          int logic_cc, StoreRegKind kind)
 {
-    TCGv_i32 tmp1, tmp2;
+    TCGv_i32 tmp1;
     uint32_t imm;
 
     imm = ror32(a->imm, a->rot);
     if (logic_cc && a->rot) {
         tcg_gen_movi_i32(cpu_CF, imm >> 31);
     }
-    tmp2 = tcg_const_i32(imm);
     tmp1 = load_reg(s, a->rn);
 
-    gen(tmp1, tmp1, tmp2);
-    tcg_temp_free_i32(tmp2);
+    gen(tmp1, tmp1, tcg_constant_i32(imm));
 
     if (logic_cc) {
         gen_logic_CC(tmp1);
@@ -5525,9 +5523,10 @@ static bool op_s_rxi_rot(DisasContext *s, arg_s_rri_rot *a,
     if (logic_cc && a->rot) {
         tcg_gen_movi_i32(cpu_CF, imm >> 31);
     }
-    tmp = tcg_const_i32(imm);
 
-    gen(tmp, tmp);
+    tmp = tcg_temp_new_i32();
+    gen(tmp, tcg_constant_i32(imm));
+
     if (logic_cc) {
         gen_logic_CC(tmp);
     }
-- 
2.34.1



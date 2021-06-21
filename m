Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 855AA3AF038
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 18:45:16 +0200 (CEST)
Received: from localhost ([::1]:53274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvN2x-0004dL-35
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 12:45:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMn7-00077K-IC
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:28:55 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:33627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMn2-0007Yg-E1
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:28:50 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 t11-20020a1cc30b0000b02901cec841b6a0so234366wmf.0
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=H2dqvpvqeoHR+Ei9UkZJDsiR+NA6X+9m78OAtxLB/MI=;
 b=ri4YTbk8diwHg64RKblOzkVyrb2BQXdOWdw5HhmBOGMMgT51w+PiEzFhxg89nZ/EHY
 dOGGFko0GSjQEXOFAvPeW21fQgAQFGXv6qi3i4UCE1goU45RrbxShG75VJsH++vL3i7q
 EDqJxaxCLVihVQg0av1/33mazzhxsRG+kHID6uaCbibyngM8j3BlPwUW/QZGTaSG0W9I
 SMoFO+wNd29fcNquOwCiNN1HRrz1RYoEe7J09//1B1XfWp4T2D2xFMgalEGD+QKg627A
 l12uoM2u21mdV8auvGcLTuU6E12Rz18YHJbM8pjSm8Z4e02hF11N0dpSwzfP7GQyatvu
 RyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H2dqvpvqeoHR+Ei9UkZJDsiR+NA6X+9m78OAtxLB/MI=;
 b=D9lQjrt8agwAHZmWU6vK/9rB3oY7m525D0DL5pPdxqRqH3nGDNIHWpqdUs7F87DdjR
 o2YkZU18gO6QD7tvkjOAdpeHQKYT+E8QDcos2FFIpjeuUGV0aR+ky6S0kvwk+9I6CmLe
 emyYOkWA/IJjrTNbvhkXR5T8SV0kQbtJDbCSWZm3Khcfr52DtzudBXbP9Nm2nCljNM+7
 sZi6xMXkI4Gd1VRhcCr206Itb2hF5jV4o0zhOl6pPXhuQQugIvb0phJV+4IkPVQYOpfS
 jP4QNS+Yb3aADa2zv/3o8eZd4Xit8SVlAvydK6a1ZVkUskfP1ft8uTdhOHTdq6U/iynb
 iQtQ==
X-Gm-Message-State: AOAM532CGDM9y2njpElM9ec4DIhZdQyLkYaWfpbYKcXf/N70xaDkogkG
 lzgJ4wgTyn93NUQ0zwrqakoWcx3bukY90ESl
X-Google-Smtp-Source: ABdhPJwJIMbWr18cRg8ZA7pjO2A3iRIYDXsWrYFyvqs0Nd/FK3amLUHpa+1NfPH0OLBTOQpSmEIWUA==
X-Received: by 2002:a1c:4c5:: with SMTP id 188mr14929920wme.1.1624292927085;
 Mon, 21 Jun 2021 09:28:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.28.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:28:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/57] target/arm: Implement MVE VCLS
Date: Mon, 21 Jun 2021 17:27:51 +0100
Message-Id: <20210621162833.32535-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Implement the MVE VCLS insn.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210617121628.20116-5-peter.maydell@linaro.org
---
 target/arm/helper-mve.h    | 4 ++++
 target/arm/mve.decode      | 1 +
 target/arm/mve_helper.c    | 7 +++++++
 target/arm/translate-mve.c | 1 +
 4 files changed, 13 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index c5c1315b161..bdd6675ea14 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -33,6 +33,10 @@ DEF_HELPER_FLAGS_3(mve_vstrb_h, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vstrb_w, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vstrh_w, TCG_CALL_NO_WG, void, env, ptr, i32)
 
+DEF_HELPER_FLAGS_3(mve_vclsb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vclsh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vclsw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
 DEF_HELPER_FLAGS_3(mve_vclzb, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vclzh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vclzw, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 24999bf703e..adceef91597 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -68,4 +68,5 @@ VLDR_VSTR        1110110 1 a:1 . w:1 . .... ... 111110 .......   @vldr_vstr \
 
 # Vector miscellaneous
 
+VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
 VCLZ             1111 1111 1 . 11 .. 00 ... 0 0100 11 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index f2fae523e24..ba01ea3bcd0 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -257,6 +257,13 @@ static void mergemask_sq(int64_t *d, int64_t r, uint16_t mask)
         mve_advance_vpt(env);                                           \
     }
 
+#define DO_CLS_B(N)   (clrsb32(N) - 24)
+#define DO_CLS_H(N)   (clrsb32(N) - 16)
+
+DO_1OP(vclsb, 1, int8_t, DO_CLS_B)
+DO_1OP(vclsh, 2, int16_t, DO_CLS_H)
+DO_1OP(vclsw, 4, int32_t, clrsb32)
+
 #define DO_CLZ_B(N)   (clz32(N) - 24)
 #define DO_CLZ_H(N)   (clz32(N) - 16)
 
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 9eb6a68c976..4e5d032242b 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -198,3 +198,4 @@ static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
     }
 
 DO_1OP(VCLZ, vclz)
+DO_1OP(VCLS, vcls)
-- 
2.20.1



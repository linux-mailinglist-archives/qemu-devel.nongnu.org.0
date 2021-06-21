Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F341B3AF135
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 19:01:44 +0200 (CEST)
Received: from localhost ([::1]:43282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvNIt-0002o4-UZ
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 13:01:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnQ-0007SC-NG
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:12 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:46643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnK-0007el-Va
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:12 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 v20-20020a05600c2154b02901dcefb16af0so396261wml.5
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HEeL4q9qD9Ck06kULZl6OktJLffeX96nlbK1ptY/wmI=;
 b=RcAUC/c5Y92N1jzF/c0jhEheCPJPdr3OSFwEUjjmtRIRH0FvbOWnRstnf4oV3N1ppq
 u2VfDCHmBseCDn19TZ2jDbci6EU50qaKNOeTKdFIdrg0Bsw30fdGp/PyKu1i0GHnny/A
 7BuGIVfZEQ9q095ImLAmlnH0JH5cGQt5ee1OmCEJ5VrGJWwQ/ZcVzLMPTz4kzv768Oxj
 QyjdaDWY2YMj12+3wN6HCTwnwbJB6AAe0QuVwl2YSYyvT9CjAcpTdjxeM6h50arFJ9+P
 NBn3VmS/NvWGmvv6UiMX7HHF1eKQrAWvfYHThqC1N58NRjY4JDvUz432/ktUr4PW+F0o
 d7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HEeL4q9qD9Ck06kULZl6OktJLffeX96nlbK1ptY/wmI=;
 b=HYttDmjcViN1xAF+EE1sbXRas8L4PGZ9PFuC9FttptstZ/bdKrql+iOhhhlvrI470p
 fGoNjuTth9Fl2BR0bEeVlQUvi+uZ9o8bjnpcBUJFjQHqQk2ahcJN2XrHUXCHrKgDHSWm
 DTDrmZDH1EU3ieZNYMBg5VHJE2MxrBVn2ibQ/nPi6BZxYSXb6trYNCvqEsqXlXAazcoA
 84DAWidE91wdxfI879vqW3aGGKEy0BSV0UJ9drtb0zvmzJIHBFAn4mcbRm6UU5u1xNuc
 gTvjJ5qnsNL4MEqdAQuHFAYlsQBqarBkmOfyr8obY+mmKgKNfKsWDfrBckCxm54+csOz
 UwcA==
X-Gm-Message-State: AOAM532qlo5fUgWGQr/zlzNdXShJ+sBO124ZEahpNe+45cVl+Z0JPaq6
 5V0iqYXGomR8VUkdYFGWl4nxjWf3dAKovd9D
X-Google-Smtp-Source: ABdhPJx2Nw/fSAIL28ssL9WK/9bla2WMZcHs6loimhjlxvWYcMis31tl+VxPTMehqQ66ewr1mdJNHQ==
X-Received: by 2002:a05:600c:3791:: with SMTP id
 o17mr14711553wmr.187.1624292945424; 
 Mon, 21 Jun 2021 09:29:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.29.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:29:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/57] target/arm: Implement MVE VMLSLDAV
Date: Mon, 21 Jun 2021 17:28:07 +0100
Message-Id: <20210621162833.32535-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

Implement the MVE insn VMLSLDAV, which multiplies source elements,
alternately adding and subtracting them, and accumulates into a
64-bit result in a pair of general purpose registers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210617121628.20116-21-peter.maydell@linaro.org
---
 target/arm/helper-mve.h    |  5 +++++
 target/arm/mve.decode      |  2 ++
 target/arm/mve_helper.c    |  5 +++++
 target/arm/translate-mve.c | 11 +++++++++++
 4 files changed, 23 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 0138e28278a..7356385d60c 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -152,3 +152,8 @@ DEF_HELPER_FLAGS_4(mve_vmlaldavxsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 
 DEF_HELPER_FLAGS_4(mve_vmlaldavuh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavuw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+
+DEF_HELPER_FLAGS_4(mve_vmlsldavsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+DEF_HELPER_FLAGS_4(mve_vmlsldavsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+DEF_HELPER_FLAGS_4(mve_vmlsldavxsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+DEF_HELPER_FLAGS_4(mve_vmlsldavxsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index bde54d05bb9..1be2d6b270f 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -145,3 +145,5 @@ VDUP             1110 1110 1 0 10 ... 0 .... 1011 . 0 0 1 0000 @vdup size=2
                  qn=%qn rdahi=%rdahi rdalo=%rdalo size=%size_16 &vmlaldav
 VMLALDAV_S       1110 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 0 @vmlaldav
 VMLALDAV_U       1111 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 0 @vmlaldav
+
+VMLSLDAV         1110 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 1 @vmlaldav
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 4d586c4d26f..b496e1f4d3c 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -522,3 +522,8 @@ DO_LDAV(vmlaldavxsw, 4, int32_t, true, +=, +=)
 
 DO_LDAV(vmlaldavuh, 2, uint16_t, false, +=, +=)
 DO_LDAV(vmlaldavuw, 4, uint32_t, false, +=, +=)
+
+DO_LDAV(vmlsldavsh, 2, int16_t, false, +=, -=)
+DO_LDAV(vmlsldavxsh, 2, int16_t, true, +=, -=)
+DO_LDAV(vmlsldavsw, 4, int32_t, false, +=, -=)
+DO_LDAV(vmlsldavxsw, 4, int32_t, true, +=, -=)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index f8ceeac5a4f..77b461c2186 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -461,3 +461,14 @@ static bool trans_VMLALDAV_U(DisasContext *s, arg_vmlaldav *a)
     };
     return do_long_dual_acc(s, a, fns[a->size][a->x]);
 }
+
+static bool trans_VMLSLDAV(DisasContext *s, arg_vmlaldav *a)
+{
+    static MVEGenDualAccOpFn * const fns[4][2] = {
+        { NULL, NULL },
+        { gen_helper_mve_vmlsldavsh, gen_helper_mve_vmlsldavxsh },
+        { gen_helper_mve_vmlsldavsw, gen_helper_mve_vmlsldavxsw },
+        { NULL, NULL },
+    };
+    return do_long_dual_acc(s, a, fns[a->size][a->x]);
+}
-- 
2.20.1



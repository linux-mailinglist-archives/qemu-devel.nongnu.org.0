Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8FB5B88CF
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 15:04:26 +0200 (CEST)
Received: from localhost ([::1]:45506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYS41-0007Pr-Fa
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 09:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwY-0000QV-RO
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:38 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:37655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwQ-0008WC-3r
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:38 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 c2-20020a1c3502000000b003b2973dafb7so15319143wma.2
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 04:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=qOPgZQfrYCWtQ8zu7EPZvXBeloIFRKQ7km3wKGm16Wg=;
 b=hiWRiw8l/5B06BWVhbksE0YXKLWhimXpe739azEsmST16Hx1h2qMhaVhrVpPvGQuVh
 G89n+nR8SI6vKM2ZXTzYDt9CzPzN3803uQTrZ0hIjbFJSBobF7JQyGLs7AgCq4MaawGV
 6WlTLrZl20TjEHTJAAupL0JF1GxCbdOa1krcpjOQdoqfYz3Oc8Uslaetr4w6z40h9/8g
 PzvA0RYt3woljsip3jseGMZJ+WUHemFpJl+8BCOV5OYyH8I8hlboWEU/O74+ghM6wvh8
 0R43b7RzByma3KWSSmk11OCgiKL1dNRoMwZYI4h03V880dpQIND6SAqHgflrsfw023dw
 bZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=qOPgZQfrYCWtQ8zu7EPZvXBeloIFRKQ7km3wKGm16Wg=;
 b=v1FSf0puXU1BNL15gY6kHnowWfRbMObKmUziAICmc00VU8cUjCHX2rjTvjuBUYUNlW
 t7PyMmBQshnkfQ/qzYpHsLunekw+F2S5WWrDHlV4A6TPJxY0A4t8JK4VCiYemRe4TQyy
 KemJFKxEUZNXPOUYMU8RHWlCKVdsSDyNfOfFKf2KuxcF00E2f0PHWo0HHYYNkzvKmTUB
 0aL5jDGuG2ExbEJGIjjs0MB7hDaXvwxNgmFEabCRhQBUv/cwxIdUo/ruZ0qC4b5Huk4b
 A2nlORpzMoRezhXAg0bJtvkQe/cecv2u6KCqfvcL66ibRREFX2T845V8LgGqM6YddsKk
 l9Jw==
X-Gm-Message-State: ACgBeo0KJ9brd7WPpYhJC55NNJCaoAPSozZUDgpugz7u8AdHKX/QiMCC
 FOLDeke0MIFLKwiBvt9t1cEbwBJLhOGsRRGD
X-Google-Smtp-Source: AA6agR7FsrGs6aqgkYms7xw/9zSenA26Rrw/SnJ1Qp+y9o0/Xtxbm+8R8phNgiiSKZsHchZTaqfhgw==
X-Received: by 2002:a05:600c:4fc4:b0:3a5:c9ed:ca2 with SMTP id
 o4-20020a05600c4fc400b003a5c9ed0ca2mr2869254wmq.73.1663156346690; 
 Wed, 14 Sep 2022 04:52:26 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm13712970wru.49.2022.09.14.04.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:52:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 08/20] target/arm: Add missing space in comment
Date: Wed, 14 Sep 2022 12:52:05 +0100
Message-Id: <20220914115217.117532-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914115217.117532-1-richard.henderson@linaro.org>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
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

From: Peter Maydell <peter.maydell@linaro.org>

Fix a missing space before a comment terminator.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220819110052.2942289-7-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu_tcg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index f63f8cdd95..b714c61d94 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -64,7 +64,7 @@ void aa32_max_features(ARMCPU *cpu)
     t = FIELD_DP32(t, ID_MMFR4, HPDS, 1);         /* FEAT_AA32HPD */
     t = FIELD_DP32(t, ID_MMFR4, AC2, 1);          /* ACTLR2, HACTLR2 */
     t = FIELD_DP32(t, ID_MMFR4, CNP, 1);          /* FEAT_TTCNP */
-    t = FIELD_DP32(t, ID_MMFR4, XNX, 1);          /* FEAT_XNX*/
+    t = FIELD_DP32(t, ID_MMFR4, XNX, 1);          /* FEAT_XNX */
     cpu->isar.id_mmfr4 = t;
 
     t = cpu->isar.id_mmfr5;
-- 
2.34.1



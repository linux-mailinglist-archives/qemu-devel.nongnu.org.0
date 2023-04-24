Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9156E6ED193
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 17:40:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqyHo-0007A0-UL; Mon, 24 Apr 2023 11:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqyHl-00078P-HC
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:39:25 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqyHf-0001UJ-ND
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:39:25 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-2f625d52275so4433715f8f.3
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 08:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682350752; x=1684942752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jPHvum9pg5ew6ondz5ZuZU1I3DpYSbO9f6BzlFBLlvg=;
 b=Nz70+VJD5dFtTdK0a8YWflKK3pfEpYdEuIAOuyYVfaJhBuzU9jQ/2uBizKHKj++wxF
 FrznW2eQh/ms2Ft0A5267n8y6jc4f8Gr/e9KpYwUkcodyGFLp1s4l8XgFZSzmuDsbE0e
 2NODMsIYYixPyQF2OB/YwkL6qJUcP+Mj7RwSA2C78RMMjDQO10yA+f/I5mYbC0ccPfR9
 ZHMR/Bb9TDbcjNWzaR3bT2C3k4+ffMRw66NGn0xPSHNcWfIr1rawmWfZy+7X+XK5MsuA
 ZZJXhzcpZEBFHGOhVZpKYbgZxjOQlo4LWNFHYNOQ+M1pTKbqg7i1OYp7ZKrnc7Obo6IG
 U0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682350752; x=1684942752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jPHvum9pg5ew6ondz5ZuZU1I3DpYSbO9f6BzlFBLlvg=;
 b=HR5X6e5sftt3v9NoBOuz314AVxsmW5AZNns+4DkgIk6r8gpphB/gr8epKpB4d3JBp0
 SMWl6nqZU2ZiiEOEev+jyhVoVl5QV3hx5Irs4kPosGml7m1APzInnSfTwMVdezTiZLew
 dumsjxSjMxSykyqnCSWuu8SA2wUTuZm9dBba1edeLGh/WZMDf+50JS/hTslx8bQqMaRQ
 u3qL/4Mv0eYQXF+zG+doli6CzaWx0dAqIjXZbjEZUE04qiNOs1ns/mDac1xVTbjEnR4W
 EI6A7U+Z6/d0UddOwY5sT+Q0Nqp5S76nr5CUE07EYJaus/KfvO1idC32/dPO0pUJTXTH
 wXmg==
X-Gm-Message-State: AAQBX9eY3Z68SvZNduh1ApYlu7fkRDzkTNy2hGrmLaTmjznSfExojuEk
 GQXoKMjFbRA6KDnOxW1pjtpcNynCkhZi4elBECk=
X-Google-Smtp-Source: AKy350aaxSkIpkuntVCLROGY+h5fogIHShxeP3YHarNJtuwtNZ5kVvYb3W4Sz3FCj9gZQH/odpfXFA==
X-Received: by 2002:a5d:5485:0:b0:303:7457:d7aa with SMTP id
 h5-20020a5d5485000000b003037457d7aamr7147032wrv.15.1682350752053; 
 Mon, 24 Apr 2023 08:39:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f3-20020adfdb43000000b002efb2d861dasm11041241wrj.77.2023.04.24.08.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 08:39:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH 2/2] target/arm: Add compile time asserts to
 load/store_cpu_field macros
Date: Mon, 24 Apr 2023 16:39:09 +0100
Message-Id: <20230424153909.1419369-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424153909.1419369-1-peter.maydell@linaro.org>
References: <20230424153909.1419369-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add some compile-time asserts to the load_cpu_field() and store_cpu_field()
macros that the struct field being accessed is the expected size. This
lets us catch cases where we incorrectly tried to do a 32-bit load
from a 64-bit struct field.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a32.h | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index 067044292a4..c2bc3ab8567 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -59,7 +59,12 @@ static inline TCGv_i32 load_cpu_offset(int offset)
     return tmp;
 }
 
-#define load_cpu_field(name) load_cpu_offset(offsetof(CPUARMState, name))
+/* Load from a 32-bit field to a TCGv_i32 */
+#define load_cpu_field(name)                                             \
+    ({                                                                   \
+        QEMU_BUILD_BUG_ON(sizeof(typeof_field(CPUARMState, name)) != 4); \
+        load_cpu_offset(offsetof(CPUARMState, name));                    \
+    })
 
 /* Load from the low half of a 64-bit field to a TCGv_i32 */
 #define load_cpu_field_low32(name)                                       \
@@ -70,9 +75,13 @@ static inline TCGv_i32 load_cpu_offset(int offset)
 
 void store_cpu_offset(TCGv_i32 var, int offset, int size);
 
-#define store_cpu_field(var, name)                              \
-    store_cpu_offset(var, offsetof(CPUARMState, name),          \
-                     sizeof_field(CPUARMState, name))
+#define store_cpu_field(val, name)                                      \
+    ({                                                                  \
+        QEMU_BUILD_BUG_ON(sizeof(typeof_field(CPUARMState, name)) != 4  \
+                          && sizeof(typeof_field(CPUARMState, name)) != 1); \
+        store_cpu_offset(val, offsetof(CPUARMState, name),              \
+                         sizeof_field(CPUARMState, name));              \
+    })
 
 #define store_cpu_field_constant(val, name) \
     store_cpu_field(tcg_constant_i32(val), name)
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD0A2AD544
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:32:04 +0100 (CET)
Received: from localhost ([::1]:57718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRsZ-0000gB-Nf
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:32:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRgb-0002Kb-P1
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:41 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRgZ-0006sj-Ut
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:41 -0500
Received: by mail-wr1-x42f.google.com with SMTP id b8so12248014wrn.0
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 03:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=o4qInkNkA3gktTk2L3eDgJIykpCUz4uuBCN2VHCIZso=;
 b=FLgtQ794dj+Ake+JFjeCJewQuv3l4lDdggv2/seOVGwOINrpfsSZ1Ys5ln7ThzllpW
 W1CnpTJxq0XnmZqAw2mPcN0fIg4wQUS4ydIOPxI8Mw09M+Ki+pTQBOf5dY7AkEvZdRWs
 n4Q0Gqn41YzlZp+K8DSxO4EMVsVfivUcN7odpd3/OERKTP3O2F1maHPMzpnTnqfLMyPf
 Ma8FLIlSrkfI35d7ExCHj3S2gRk++Zn9yPGqFWN5Pr07GZ5AFqioCbRt6KI1le2KjXNg
 giQNJ7+y+h88I/Ru52UNz0x0WQeZ6XdOQEj74+Hjhs9nFOqHOOhhe1pSKzYOr9R9vNYb
 unEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o4qInkNkA3gktTk2L3eDgJIykpCUz4uuBCN2VHCIZso=;
 b=AVVONuRH/PoN+ZRvOWmcdrd2xk4MbAdm3ixU9KHX83q6qGnVP1/sdYva5Fs2+qewY7
 Ey6oHD9E1Yz1wrTcITTkAik8HL2HkIc5+7pmUgeN7MR3FYbLEqFgswNvQjvlZaFQ1N8t
 F8XwFKV0TeWwdCs4qulNJSmR0ngujBMEk905m8pzu2gZ+JLHt3ZzKuk4UecMbJpT70D/
 1rpvXKIiUcHev9NQXlcGMYlDTg1Qn+Efptlz17feAQwR2M2CHkxC936IMnLsJzUA8FAr
 PmVbRvpXTIT8Z+rsfyV5INoI3phdbS/ZdkO3d17DsjTSEo48Hbm1a45ws17Xjgm8U5Kl
 2Xlg==
X-Gm-Message-State: AOAM532fsWqI88L1kYnYy/kWn01NGk/G+2a2o6iUpiesAov8NDfxvBxT
 jTTS65c7fRC5i4ClsIl8GwDAcqYJSwsNsw==
X-Google-Smtp-Source: ABdhPJwJEyiwk1+/5/NwU/NAH/ee3+VG/UcqkBdC7T4M8f21lrD8wwGX3lx4QkOV8pha6IMWmUVpVA==
X-Received: by 2002:adf:9544:: with SMTP id 62mr23003075wrs.223.1605007178401; 
 Tue, 10 Nov 2020 03:19:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 109sm16909498wra.29.2020.11.10.03.19.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 03:19:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/16] target/arm/translate-neon.c: Handle VTBL UNDEF case
 before VFP access check
Date: Tue, 10 Nov 2020 11:19:17 +0000
Message-Id: <20201110111917.29539-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110111917.29539-1-peter.maydell@linaro.org>
References: <20201110111917.29539-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

Checks for UNDEF cases should go before the "is VFP enabled?" access
check, except in special cases. Move a stray UNDEF check in the VTBL
trans function up above the access check.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201109145324.2859-1-peter.maydell@linaro.org
---
 target/arm/translate-neon.c.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index 0ae95cb8df8..2403825d15f 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -2874,10 +2874,6 @@ static bool trans_VTBL(DisasContext *s, arg_VTBL *a)
         return false;
     }
 
-    if (!vfp_access_check(s)) {
-        return true;
-    }
-
     if ((a->vn + a->len + 1) > 32) {
         /*
          * This is UNPREDICTABLE; we choose to UNDEF to avoid the
@@ -2886,6 +2882,10 @@ static bool trans_VTBL(DisasContext *s, arg_VTBL *a)
         return false;
     }
 
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
     desc = tcg_const_i32((a->vn << 2) | a->len);
     def = tcg_temp_new_i64();
     if (a->op) {
-- 
2.20.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3945970307F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:48:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZIx-0001wU-54; Mon, 15 May 2023 10:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHS-0006y8-U7
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:36 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZGT-0004uP-3r
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:33:39 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1aaf91ae451so120243185ad.1
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161206; x=1686753206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nP6uwN475NI4kEPgZuacjyw/HnU7r6xvn2JKlD8Wx/Y=;
 b=eR6hW5d2c5jgJx0SalWGMezSFCdPzutuO6EzIUQlbOJLobzQ5YkxfmoobEaOXTXtci
 i36RiMD8PMHD4eqBDK0KTi/3nMGCJOXxsmoLVNnL759l2WY/jFLPbWzXojJa8S0otzWR
 tnU2B3jv1kmA+yrbbBWOi9ngiY+P4z0E/H6Cmz6Serl4LYjBZNeyOw0QIyf9jS+bUKM5
 y7juefpleZmc/K3ruLul8K49999Rwfbz8bBm+8GCfQtEsiDMjhINNvnQBA0zn1XIlSbA
 K/lk91bXgYvv2SSX9Np+v5kr/bt2/Vzox5wO4nUZVCeR6jf9cpcoAjin2UeAnLSafcIB
 WiEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161206; x=1686753206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nP6uwN475NI4kEPgZuacjyw/HnU7r6xvn2JKlD8Wx/Y=;
 b=RPai/wBVEGMOeF9hqIm0koVo/PjlSsAvfHA827bemg0yifzazjcCncpsi9OzF9+SBi
 0KCulgS0YU92r+98U6BAz+QT4bdV1MmtMt9LfrJuSbBhcQg4ktOaDIgAvaCGP2w+EOqD
 NdPK5cAoArbaZDtfauVNZ7dpTCXCn2T4gb9dcwndezRiQcEn9cGSHSbkWhshi1wF+6Zb
 lf1WdZonTXkBmSHJ7aReVN//8J10LLbiQJ7ujsnwMSKZBHKwlHGLguS4cr+ylXS/BNog
 /2KhVkuOlZyLy0Vme9lKkWN+qjPBUteElHIFBeCJOgHsVSKfqsJefuHNSxhWTWRAR2FG
 LjbQ==
X-Gm-Message-State: AC+VfDxENNgGLhEHzdXuXcDfqSOSQpfHw6iqBnwBqDfUmMGnTgRV2jZO
 FyO3/MbFXR/iWN0ZwCU2I5hDWW5uyFIeNnnxKEs=
X-Google-Smtp-Source: ACHHUZ6TDk8NRsZbLBAaJaSc0gtXoZmL178ciK3Inbyd7HXVFLOssGX4RYtaefFfXEN3kBHn6JlXfg==
X-Received: by 2002:a17:902:db10:b0:1ac:5c90:23e with SMTP id
 m16-20020a170902db1000b001ac5c90023emr40924197plx.7.1684161206122; 
 Mon, 15 May 2023 07:33:26 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 13/54] tcg/aarch64: Detect have_lse, have_lse2 for darwin
Date: Mon, 15 May 2023 07:32:32 -0700
Message-Id: <20230515143313.734053-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

These features are present for Apple M1.

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index fc551a3d10..c64606af5b 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -16,6 +16,9 @@
 #ifdef __linux__
 #include <asm/hwcap.h>
 #endif
+#ifdef CONFIG_DARWIN
+#include <sys/sysctl.h>
+#endif
 
 /* We're going to re-use TCGType in setting of the SF bit, which controls
    the size of the operation performed.  If we know the values match, it
@@ -2903,6 +2906,27 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     }
 }
 
+#ifdef CONFIG_DARWIN
+static bool sysctl_for_bool(const char *name)
+{
+    int val = 0;
+    size_t len = sizeof(val);
+
+    if (sysctlbyname(name, &val, &len, NULL, 0) == 0) {
+        return val != 0;
+    }
+
+    /*
+     * We might in the future ask for properties not present in older kernels,
+     * but we're only asking about static properties, all of which should be
+     * 'int'.  So we shouln't see ENOMEM (val too small), or any of the other
+     * more exotic errors.
+     */
+    assert(errno == ENOENT);
+    return false;
+}
+#endif
+
 static void tcg_target_init(TCGContext *s)
 {
 #ifdef __linux__
@@ -2910,6 +2934,10 @@ static void tcg_target_init(TCGContext *s)
     have_lse = hwcap & HWCAP_ATOMICS;
     have_lse2 = hwcap & HWCAP_USCAT;
 #endif
+#ifdef CONFIG_DARWIN
+    have_lse = sysctl_for_bool("hw.optional.arm.FEAT_LSE");
+    have_lse2 = sysctl_for_bool("hw.optional.arm.FEAT_LSE2");
+#endif
 
     tcg_target_available_regs[TCG_TYPE_I32] = 0xffffffffu;
     tcg_target_available_regs[TCG_TYPE_I64] = 0xffffffffu;
-- 
2.34.1



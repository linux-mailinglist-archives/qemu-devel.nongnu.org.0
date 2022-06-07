Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B8F5415C1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 22:41:36 +0200 (CEST)
Received: from localhost ([::1]:34206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyg19-0006A4-Ro
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 16:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftC-0007Sv-NG
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:22 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:39876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyft6-0007Er-Sv
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:22 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 q12-20020a17090a304c00b001e2d4fb0eb4so21871585pjl.4
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3ImGeL35V1VptULMhKWxD6rBwxNJOjwQ4O8lIdXg7Ns=;
 b=hHsUQU11WBe7700oxpE76yF0K/G5HxsqeHGCcIv/qwNA4vrOltJYMAdqTJaNFnxUpB
 utbkimkUsAkmRarwyNcEME+3jK/J4p3+4dx4kXXiKOIXYUgOggTGLmiIHL8ou4qLH4yo
 I+2uXi1r7YDNsZo8UguXcxWwIxTXHg9ZMlK9TrWh1xGH1MxCtxfejHyhd0ZW20g3u9J7
 Ts0fyo4cNhSVLWSrq7GxaKI7W3uwS2RS+ECyeOEs5QdFPD+Q1FZjVwjUv895obkRf8M8
 iYQDrY7X6C+MPaHIg7FLotSjKKN8jC00b7ygVJiyjHyoW/QofzmSJcuLIrDnukUpOYIB
 m7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3ImGeL35V1VptULMhKWxD6rBwxNJOjwQ4O8lIdXg7Ns=;
 b=HIXlXR4gREGbocAbc2vinc4IwDLdsRiqFZNdsfzPeDlqXgvyXHWuLER+AtHloMAMUz
 PhnX1alqNCyxaifUACinkmkhMb8JfSEKNe5SldDpNCIIqnskM2rAghkUA2cAXkVuq0rC
 9YuN0IRbfOGKVl1Y6lllTz82bgvK4em2YY7peZ+b35slOo0g83JYPeBrsSPL6UjvB+vQ
 pUyDycRFq6cgq5UOnS4Uh3pjz2QmCECDnrjMtKwZDPL6q82QX90m5ZXOJOLJEG+ihO3b
 b0GR2/7GDzLqIvg/0B0/7kTBVxhPd7NMGsPmoHqZaKE+fGfYlLPThUTtXt23wNmkBEit
 VkAA==
X-Gm-Message-State: AOAM532kZUZ7+xWJ5Shc5V/k3f/VnTPA9GHAGk+i1+4Fu25gogHdbcqm
 ASc/+b3ChAUDL9kygNh3HOQ6/V2jp+8Sog==
X-Google-Smtp-Source: ABdhPJxqE0xUJ6udg8jpCx2ncX1eAmr0rJ/7RUNnquYKdPEXM2VHaRBfYzjtb5Ui+3Bp28qUufg2TA==
X-Received: by 2002:a17:902:b7c3:b0:167:7ca8:7f24 with SMTP id
 v3-20020a170902b7c300b001677ca87f24mr12468733plz.51.1654633995537; 
 Tue, 07 Jun 2022 13:33:15 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 09/71] target/arm: Do not use aarch64_sve_zcr_get_valid_len
 in reset
Date: Tue,  7 Jun 2022 13:32:04 -0700
Message-Id: <20220607203306.657998-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We don't need to constrain the value set in zcr_el[1],
because it will be done by sve_zcr_len_for_el.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d2bd74c2ed..0621944167 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -208,8 +208,7 @@ static void arm_cpu_reset(DeviceState *dev)
                                          CPACR_EL1, ZEN, 3);
         /* with reasonable vector length */
         if (cpu_isar_feature(aa64_sve, cpu)) {
-            env->vfp.zcr_el[1] =
-                aarch64_sve_zcr_get_valid_len(cpu, cpu->sve_default_vq - 1);
+            env->vfp.zcr_el[1] = cpu->sve_default_vq - 1;
         }
         /*
          * Enable 48-bit address space (TODO: take reserved_va into account).
-- 
2.34.1



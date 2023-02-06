Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD5D68C98F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 23:37:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPA5N-0001qA-5X; Mon, 06 Feb 2023 17:35:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA52-0001ip-VV
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 17:35:28 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA4z-0004R2-EN
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 17:35:19 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 f47-20020a05600c492f00b003dc584a7b7eso11901937wmp.3
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 14:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PqS8f1SsLczkqeP2a5G3rABOyp0fVyhf7LwTVRK5JbM=;
 b=VcQPq29oDvlBhGLhvTpTQy6lsGEwc5fzIWcgFrIwcL7y40SCRV3nzJgeKMA9/eQBWJ
 2DpTKvrqN6NPihFphi6F7VXDSBrKr9FEAwURq8EOD2m/bP0suDzfdwj8SyDQvnvckRfx
 a17SdDEX1QJhQ1tUWB8B+CeO2kA7nDeP5d/1+hV3XBaaBlCBTjDIAPMBWwl/nrKb8dRo
 4M01yK3ZvgZO6H+dJwk9YMUcbDI3nUDHxPqwSkIQTWvZ+YRf98WtgglsFZfPCAvIiGZM
 RHZENNbKa13TCEvS9rEIQLHVl8eq4vkW0h4/0leM8wzU80CyYFD/N2QhX7qhO0GuPsdj
 0SVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PqS8f1SsLczkqeP2a5G3rABOyp0fVyhf7LwTVRK5JbM=;
 b=sUwLxRkprYr7DRBQ5CxdQ/hRTrS13ssn+OFH9F/G0rh4rg5SI37u1LniEv3iI5RrEO
 loZB5am1zUgh7aC0XpWhv86KiomBmo7I4tQ2Kbq+7hcfwFDcV6CgFv6nbd1ntFlREVgD
 gXXqAWnUiDHZtovlo0fHu7F6EB4KWbTpVypFj8G1EsBUDhbK6/Yj4pjldDYxxdhQpaLf
 xsk8ASr2nRiGRie0irjpc8Zo/zO1Qfs94wut4w/lP/RVb3oQ60oFc0AngFZ30eHCaG/h
 +kuKMwbgu4ifMwxkAk+FbFYL8WbeTGGaTOo9zIHCNyrIted8HWMcGOrK/6Evg03vwUD7
 4Fyg==
X-Gm-Message-State: AO0yUKUeOWwKVN+z2z/cuBHYU9rX+Z1q8StexbKIT36sElBI9irXklR/
 tfo1xBlGVep73d/k8OLUNQ5yJ3A4mgisiz5a
X-Google-Smtp-Source: AK7set/5JRahYyR1iIlSyfYcKhiaJLQdxzfTf9CQ3QVR+cb2+tSER8iBR0n9A4xmi/Nu29NJ1/jMQQ==
X-Received: by 2002:a05:600c:4d21:b0:3dc:3398:cf87 with SMTP id
 u33-20020a05600c4d2100b003dc3398cf87mr1149674wmp.11.1675722915674; 
 Mon, 06 Feb 2023 14:35:15 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a05600c4fce00b003dc1a525f22sm12732030wmq.25.2023.02.06.14.35.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 14:35:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 02/11] target/arm: Simplify arm_v7m_mmu_idx_for_secstate()
 for user emulation
Date: Mon,  6 Feb 2023 23:34:53 +0100
Message-Id: <20230206223502.25122-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230206223502.25122-1-philmd@linaro.org>
References: <20230206223502.25122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/m_helper.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index e7e746ea18..76239c9abe 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -150,7 +150,12 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
     return 0;
 }
 
-#else
+ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
+{
+    return ARMMMUIdx_MUser;
+}
+
+#else /* !CONFIG_USER_ONLY */
 
 /*
  * What kind of stack write are we doing? This affects how exceptions
@@ -2854,8 +2859,6 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
     return tt_resp;
 }
 
-#endif /* !CONFIG_USER_ONLY */
-
 ARMMMUIdx arm_v7m_mmu_idx_all(CPUARMState *env,
                               bool secstate, bool priv, bool negpri)
 {
@@ -2892,3 +2895,5 @@ ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
 
     return arm_v7m_mmu_idx_for_secstate_and_priv(env, secstate, priv);
 }
+
+#endif /* !CONFIG_USER_ONLY */
-- 
2.38.1



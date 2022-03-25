Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3161E4E7A85
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 20:56:05 +0100 (CET)
Received: from localhost ([::1]:47726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXq2W-0004sn-9d
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 15:56:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nXpza-0001uC-DC
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:53:03 -0400
Received: from [2001:4860:4864:20::29] (port=43468
 helo=mail-oa1-x29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nXpzX-0008O7-Mv
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:53:00 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-de2cb87f6aso9098566fac.10
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 12:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=26hq51RiROI5XzJelEXkN2uWQhOSPbaaTZ3h8qaX6EQ=;
 b=L5xudmR0FjiOaJa4wSjP1tapPrafWWRJ2Y/zLdRsOXhmGPcVVwM3e6WIET4ruMNHZa
 YmICMkImo2tEY1ljbyndyuvr4DmmxZ++CRsS2hHklm9yKO1J0exPDwt2jSGEoTld2VT+
 cCtDyPsceKdROUX5BVSL98PJVvC6dPuHbUHw63XWQmAIJms7MhgLAse5FU/5kpT6FXDd
 bmVOXSrZSRRkKRyvhpyVfZ3PGh1d2rsoLpitGaRTS4xHLaBLx2vbssqQHs5A9oF52SAE
 TdYfQF24VngwVHhLDs1g/Oa03eTdn4q0eLrE7iJMcbMo7B2hhsgfLkGh9VRtYvn9bSPx
 7WKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=26hq51RiROI5XzJelEXkN2uWQhOSPbaaTZ3h8qaX6EQ=;
 b=z4uvNITgXCUlTKvJ7iwdfdF9nGSJV+iAExKKwcaUzIA9XFaYH4obSU8aMogecOUqTS
 dQx+KjhpIdwELMc/9P8JXoJXqdqlytNh+87LeelT8Veom40OfgCQz+HwexH74mcY7ubG
 riw/OWpYWGhaFdCgWJmCAHEmTjrtbZLGShoAMdLgBUCZAY0nwC5Blh46r0dRha1rfKTu
 +bHpphSj+iVfgLu9HYI26o4fixlbPe1AikWBnAsLT8fdptcmlj91KTtfTSSvpInDrAaQ
 w4DTqCVodA6dh0BYD59vHkRJn+twT0UmzskNYvfS2fd+mtylJ50jO7Mw+SJf/fco5Gs4
 svIA==
X-Gm-Message-State: AOAM533iYdQ4K6LJn79XiZqgC1VUzLPO4238BTjzNUVSYYeX40b45ZbI
 exObyup2kJiuxqGgJp40FhI63/vlGEQUmuYrHv4=
X-Google-Smtp-Source: ABdhPJwDq4nE93h9YSKlt2c/5xOcj2Glry4tEWpMMHf2lLaassXUjGoW91/PHilWsXQnsIPn7YGO2w==
X-Received: by 2002:a05:6870:5a7:b0:d9:b303:38b with SMTP id
 m39-20020a05687005a700b000d9b303038bmr9805589oap.1.1648237977749; 
 Fri, 25 Mar 2022 12:52:57 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 ep36-20020a056870a9a400b000de98fe4869sm2153730oab.35.2022.03.25.12.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 12:52:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/8] linux-user/nios2: Adjust error return
Date: Fri, 25 Mar 2022 13:52:46 -0600
Message-Id: <20220325195250.386071-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220325195250.386071-1-richard.henderson@linaro.org>
References: <20220325195250.386071-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::29
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x29.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow the kernel assembly, which considers all negative
return values to be errors.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/cpu_loop.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index a285781fc5..969460df58 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -55,9 +55,14 @@ void cpu_loop(CPUNios2State *env)
                                  env->regs[7], env->regs[8], env->regs[9],
                                  0, 0);
 
+                /*
+                 * See the code after translate_rc_and_ret: all negative
+                 * values are errors (aided by userspace restricted to 2G),
+                 * errno is returned positive in r2, and error indication
+                 * is a boolean in r7.
+                 */
                 env->regs[2] = abs(ret);
-                /* Return value is 0..4096 */
-                env->regs[7] = ret > 0xfffff000u;
+                env->regs[7] = ret < 0;
                 break;
 
             case 1:
-- 
2.25.1



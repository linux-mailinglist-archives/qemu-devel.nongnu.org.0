Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BD64E8117
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 14:33:39 +0100 (CET)
Received: from localhost ([::1]:46368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY6Xx-0007RQ-TO
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 09:33:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6QT-0006s4-Fv
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:25:53 -0400
Received: from [2001:4860:4864:20::2d] (port=43740
 helo=mail-oa1-x2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6QR-0005LI-Vz
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:25:53 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-de2cb87f6aso10701951fac.10
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=26hq51RiROI5XzJelEXkN2uWQhOSPbaaTZ3h8qaX6EQ=;
 b=tmp1KyD2RxKn8kkjT/Pq/xtKXGmQuRbrstjmfzhPbR2m3ehHWVK7Qihw7UoLYgIQQ+
 CburleEMw7mmkyscoqqSU0cKSn+RU3jkueJfIAOrZKujoC9jCwVm7OchO2XbTW6fyyxj
 QvrzjkpNHfbZY6EqnOtmwYC5YB95uEJWhpJLkJzgFtSbgFPLv/MG7fG+g/to7gbq01LH
 06NTba4kr17+0Ve9jbAfdB7qwqI2bW1u+4Dn89/gSxtA1htaPaaarEgb02PMCEE+mIIe
 Laa+lyxksZrKBGO/hkQOSapZ9y1nCWRFMtpAQhKplqoPZXtoeMN1mm7w8yHOkZrormCZ
 TYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=26hq51RiROI5XzJelEXkN2uWQhOSPbaaTZ3h8qaX6EQ=;
 b=otsr+34VDebvEJUQTa45lKhyL46aQl9Je8duDGLetopfgtnyMJ2VTe8hrM44/O/c99
 sqZl3tc9FRmQgOgiQmzEhCx3GWJgKJk5kdn3NXHcnkyhwofkzyM//XFDSfd3MPlJP90a
 s079p00GMUowTQu0Mk2v5RTGzT0ejMU7bmCLfmiMiw4gasZzwevfyIOIvpB5tlC+9CJc
 2QtJ3uHlBLs8zyFM725/ViTI1oYH+ovYVXXadnYG+0ykNRzWZS8o9knyAS2WCzJ4UIgJ
 VXhDAYKSvw3HWNUQUSCYVEbkBZC9tZnpOrAKph73JesoZyUgPZz0yo/jHbmMGyCjBrQg
 zQAQ==
X-Gm-Message-State: AOAM533N+ePPnXapf4wErRdNG16kE5MXgNe4R/yzZJd0oW9Faq7yxwxr
 gpkQujEY+KS9k4nAC5HxI8jrn/MQLiraYc2a
X-Google-Smtp-Source: ABdhPJxemYPCpugvFQmdrRJh9qiImeQJjwy1JMCMNLoYPSEDZ8np2dBx/wjG6YasVVlc3hkQhy0HYw==
X-Received: by 2002:a05:6870:3394:b0:dd:cfdd:34c9 with SMTP id
 w20-20020a056870339400b000ddcfdd34c9mr11506299oae.31.1648301147081; 
 Sat, 26 Mar 2022 06:25:47 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:25:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/8] linux-user/nios2: Adjust error return
Date: Sat, 26 Mar 2022 07:24:54 -0600
Message-Id: <20220326132534.543738-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2d
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2d.google.com
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
Cc: alex.bennee@linaro.org
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



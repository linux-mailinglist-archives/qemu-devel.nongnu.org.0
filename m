Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2517A36A839
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Apr 2021 18:06:38 +0200 (CEST)
Received: from localhost ([::1]:35728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lahHJ-0007cj-6R
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 12:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lah8x-0007tY-Vw
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 11:58:00 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:54824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lah8u-0003CD-6L
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 11:57:59 -0400
Received: by mail-pj1-x1031.google.com with SMTP id t13so1533769pji.4
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 08:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=u30xwcxCy80ZK6dyM8pP2MsdoEwOxGc5lWNn0kKyZ7Y=;
 b=m9CQoiLD4uDA4FJghKpyCBIm7sBX73p8hx43Wu56hgU2Joz607/5W8YwUC6uP2tYTU
 cnMKTGjZjdvWctkFta1b6e39DzqFwhyQxcBSVjNtUPWPx7dVh0+o7Yhr2JZcgEYez5+L
 ICcSYCT8fy/EukgcdqzcYbIRPT6ij8ukbmL6NV40qvbt2eJmrmvDRL7E9besB3FBjXzp
 tSZEUl+9hsZTDF8xZAdP3eKPgagcobGzW2f0rgZYJSvTKcaSuVRGgtEUuIozT6VbEsRD
 FPY8Hjc5M3bC/q72B3UU4Gw17atKS36Ef+ipfXrtJ8mlSg9P/zZ2MCI0msec6uosE6iZ
 lMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u30xwcxCy80ZK6dyM8pP2MsdoEwOxGc5lWNn0kKyZ7Y=;
 b=o/uTzf/VnCDzOQk1cOGBJZEv+7PlYAniexlB5nBmnHXwL12gTkIc0PNZGpj3oyWoRK
 JDXqIjlkooXz4ZfKNlWYFuzluD9lITzrR+LCGAf+iF4wv/t0gL5Yeak5EoOJT4A1rt0h
 uKvry2uKgVTiKa4sXmEfCT9h6lSe7tnnP0A4BRgCegZubwhoF4p7wKJT1+JOz4c9wyZ7
 0w3cfjghmwLGOTlNJFsvgQ9F7drgdWi3sDRROo+mexQEPWpGxthG26aPylqgWY+V/o4Y
 VRaDIAOsg54Zs0WYbE719WkRwi5DoFYE8Hz/vrPBEfGso9TZ1VVqcsFLmJIh5ktph0ud
 Awhg==
X-Gm-Message-State: AOAM532CMn5b8uWRppXl6EvnpUa3Svqo8ZEQHGm8uFcZvRxBVkIUx1I6
 nJtWLn2+t1fcp4kg9a5fCtymRGrEXnAH8g==
X-Google-Smtp-Source: ABdhPJxpAMrSxhYSZMm9qKE+c5jfdCYVf8Bjdbb0bvj4m6Npb2aN0pc72XH0Hw/i3PZptjReH/iubw==
X-Received: by 2002:a17:90a:a389:: with SMTP id
 x9mr17135362pjp.232.1619366274954; 
 Sun, 25 Apr 2021 08:57:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id u21sm8594717pfm.89.2021.04.25.08.57.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 08:57:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/8] linux-user/sparc64: Include TARGET_STACK_BIAS in
 get_sp_from_cpustate
Date: Sun, 25 Apr 2021 08:57:48 -0700
Message-Id: <20210425155749.896330-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210425155749.896330-1-richard.henderson@linaro.org>
References: <20210425155749.896330-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

Generic code cares about the logical stack pointer, not the
physical one that has a bias applied for sparc64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/target_cpu.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/sparc/target_cpu.h b/linux-user/sparc/target_cpu.h
index 37f6a1d62b..1f4bed50f4 100644
--- a/linux-user/sparc/target_cpu.h
+++ b/linux-user/sparc/target_cpu.h
@@ -46,6 +46,7 @@ static inline void cpu_clone_regs_child(CPUSPARCState *env, target_ulong newsp,
 #endif
         /* ??? The kernel appears to copy one stack frame to the new stack. */
         /* ??? The kernel force aligns the new stack. */
+        /* Userspace provides a biased stack pointer value. */
         env->regwptr[WREG_SP] = newsp;
     }
 
@@ -83,7 +84,7 @@ static inline void cpu_set_tls(CPUSPARCState *env, target_ulong newtls)
 
 static inline abi_ulong get_sp_from_cpustate(CPUSPARCState *state)
 {
-    return state->regwptr[WREG_SP];
+    return state->regwptr[WREG_SP] + TARGET_STACK_BIAS;
 }
 
 #endif
-- 
2.25.1



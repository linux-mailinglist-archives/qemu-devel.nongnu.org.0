Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDF244791C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 05:07:28 +0100 (CET)
Received: from localhost ([::1]:51796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjvwN-0004NZ-Mm
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 23:07:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvhu-0006ZR-8a
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:30 -0500
Received: from [2607:f8b0:4864:20::12b] (port=40560
 helo=mail-il1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvhr-0002sG-8g
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:29 -0500
Received: by mail-il1-x12b.google.com with SMTP id k1so15534654ilo.7
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 19:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IOY3t4AaHZe80iw8hQcSliA4Md0iNA8hrA2Uy7U0qF8=;
 b=NWg8hvgygLV7X0Z/9/qbt0t5ljSc2gzeDWgm7opkV+uGJkXzMLznrT8wTv33qVwOdp
 zPLAxIV8jdoHISZnNed47lIE9ZD4MII+kL8X39zxIoFjEYuBu+JyV69zO561bDr/2X8e
 67osp/w8G50t3cwkALg1Xe23r7qBz/t2p81+g+h4Fp/OhUngNUQVXgbNJT7/yFuH2+oo
 lX092XKuaArXt+StTBq/Y/jhRhtSCgAHC0dkAFHP8DCANZM8yX595WK0aiqvNUY4SUek
 vtjX7WlkN+SRNB5eZm8AIMazmHNk3Xo/4IaGxXx8+J8+4NKcEO0O23Cn1B1L6E+TXPCA
 Bc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IOY3t4AaHZe80iw8hQcSliA4Md0iNA8hrA2Uy7U0qF8=;
 b=YzR0KMHNK69Rk31H0VOCAnQkkU5I1FxXvvGLISHk5ucXwTY2vMYEhriII1lece1wXJ
 yyn4Q4APORnE2fmKxdR/sybvj70FTyd/E48i4/cXWaI1fqi8/SUgkO1X8+Oep5OS/pls
 RWZbykPGWYquC5IQhwqFZ8s2wQA/O9P1TyM1rfUT+M6BsOIH5aVS58UBmwoiajc1shQT
 2B6rC7XAqy8mkZEzrx0wcgPb7roPL9cXP4bH2YGCJ/LRK19p9TiZOyCxbKWPDqq4+zgk
 cZ6pjp4yBYML871V9HYRDtAopcan6LDCGNWMogjMDHw2CN+wPGHMo8YcKoFat3Ry0rrD
 Oc0Q==
X-Gm-Message-State: AOAM533xgmSQBEH+S5LKdsk6BMht0fte87BneuOdy5yNC9eOhYNe+0uu
 3Y6hYRigsI+iR2KSaDebdGZt1+/Byt8Eog==
X-Google-Smtp-Source: ABdhPJw/cdRn+Sqe7gkyp4UB07/FMKrikH07ryGYIjcP1TZzaplc474UYWhVo0Xtx8bZ+ZY0JjosaQ==
X-Received: by 2002:a92:cd8f:: with SMTP id r15mr45348477ilb.278.1636343545975; 
 Sun, 07 Nov 2021 19:52:25 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:25 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 17/37] bsd-user/arm/target_arch_cpu.h: Implement
 target_cpu_clone_regs
Date: Sun,  7 Nov 2021 20:51:16 -0700
Message-Id: <20211108035136.43687-18-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement target_cpu_clone_regs to clone the resister state on a fork.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_cpu.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index 66215684d6..fa45d9335d 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -36,6 +36,14 @@ static inline void target_cpu_init(CPUARMState *env,
     }
 }
 
+static inline void target_cpu_clone_regs(CPUARMState *env, target_ulong newsp)
+{
+    if (newsp) {
+        env->regs[13] = newsp;
+    }
+    env->regs[0] = 0;
+}
+
 static inline void target_cpu_reset(CPUArchState *cpu)
 {
 }
-- 
2.33.0



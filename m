Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9228531A56C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:32:10 +0100 (CET)
Received: from localhost ([::1]:44652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAeAj-0003DI-GS
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:32:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVh-00027T-1n
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:45 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:39052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVe-0007wx-03
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:44 -0500
Received: by mail-pg1-x52f.google.com with SMTP id o63so246079pgo.6
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8yFMudlC6Jtq58F3MWdhR32H45GMT5rfYjMflXhCdac=;
 b=l1VDEOhaNNESyEXYSArjVAqbpGttz7E64h7NKXPqbFmOQSOzaGaAAW5hn/1TKgkksf
 XJHrKo21t7k2RZh/MDheF4NGWsu5dD38HtRE4OJBZ81k4ENOklfgjGdzfi9Y48nhcrbI
 LLu4waEy6t5FjiyimiGHY4Ol66ws7V9hjELKDtPXKlmOBrk9dtoH9VmtGB/bhTXzrga5
 IC1cZuRJBfGirT7+6f10UHeDgx/ZywIS/wYMnwziPok1BuybEqfF3wkC7CIr2sRSrkET
 B6Jek5tzwjI5APU1Xt5PchJ8QVeaXJQQSinYAnQvTW1yNOCAV6fXx/8EyC+WRcvwXdZO
 KX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8yFMudlC6Jtq58F3MWdhR32H45GMT5rfYjMflXhCdac=;
 b=nzaGgdFXCGsW1d4O9AIw23ZluzXDOc6FAQ2v29zNA8DPAIWTCDIlc6Rsrw5gQUso6B
 YdbmLUpMnbF6+LNpcTbL5IWeE+fj3h3v4Hp58aqG82LTx4hrTbZ+lMZa/IxG6mVfaWb0
 +RTkeT3Inxr01MhSi5Bv+7jYWYcoHDQx8ze/4vThmkvhBzJahykjIm7I+jczKzYV3v19
 gM15CAXAELZ2QZdKl/LAdReXTsDkDgOmXRirZcabjpVSDuCMcoyt71Xcnk85ZsVZQpK6
 Lnb0Hb4NPnhA9Jbt1T1zi4HiQebDqJufSENcgmKZLdEDdb/eJGqAgraVB/2yVAqAEcty
 RjQw==
X-Gm-Message-State: AOAM531GyE9+GNWwp2ibhV4u4AxajicmjUj23V+c0Uq7gipeAfdQ7dCi
 hnvYSOR1gGFRpSYtXL2uQ2iYWqmgGaSdTQ==
X-Google-Smtp-Source: ABdhPJw2ldkx7Ze3jJCc5Pf9M5Zgd+veCjpazF0aA/mqIEcn8UyRrqPHCjOgGXJQhLTslnua/hGr3w==
X-Received: by 2002:a62:444:0:b029:1bc:ebb6:71f8 with SMTP id
 65-20020a6204440000b02901bcebb671f8mr3983384pfe.75.1613155780649; 
 Fri, 12 Feb 2021 10:49:40 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k5sm9427618pfi.31.2021.02.12.10.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:49:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 30/31] target/arm: Enable MTE for user-only
Date: Fri, 12 Feb 2021 10:49:01 -0800
Message-Id: <20210212184902.1251044-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212184902.1251044-1-richard.henderson@linaro.org>
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 70cfcbc918..b8bc89e71f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -209,6 +209,21 @@ static void arm_cpu_reset(DeviceState *dev)
          * Note that this must match useronly_clean_ptr.
          */
         env->cp15.tcr_el[1].raw_tcr = (1ULL << 37);
+
+        /* Enable MTE */
+        if (cpu_isar_feature(aa64_mte, cpu)) {
+            /* Enable tag access, but leave TCF0 as No Effect (0). */
+            env->cp15.sctlr_el[1] |= SCTLR_ATA0;
+            /*
+             * Exclude all tags, so that tag 0 is always used.
+             * This corresponds to Linux current->thread.gcr_incl = 0.
+             *
+             * Set RRND, so that helper_irg() will generate a seed later.
+             * Here in cpu_reset(), the crypto subsystem has not yet been
+             * initialized.
+             */
+            env->cp15.gcr_el1 = 0x1ffff;
+        }
 #else
         /* Reset into the highest available EL */
         if (arm_feature(env, ARM_FEATURE_EL3)) {
-- 
2.25.1



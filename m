Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DDA445EC5
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 04:38:23 +0100 (CET)
Received: from localhost ([::1]:36570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miq3Z-0006rX-5o
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 23:38:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplu-0004Pe-Pw
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:20:07 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:46971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplr-00048F-Ps
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:20:06 -0400
Received: by mail-io1-xd36.google.com with SMTP id i79so8978844ioa.13
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 20:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IOY3t4AaHZe80iw8hQcSliA4Md0iNA8hrA2Uy7U0qF8=;
 b=MZ/vc/uwwMM0D4ZGvXXSa+8JpjH1La9hcwghoui1HGO/gFzC8EMAFuAfMn2/xReDwX
 g+2gj4bqsuBz7hk+W5PcypWYYNf6Q2RXBgz3s43tsedBYfz+P7k8Z9ITQebKBH4YEfGM
 UHQXCEZ7GBkaim6C69pYGTVMRRvXk3ZFdtgTe2csDZJup2tdrmGYrLCABis4KI3dd8Lk
 xc9vU66qA9jwyOHUI1KFiwVw9mzURmQXyeEBrQe7AZNFA4AovD2mHWqBembQKMcSQlGm
 TQDlapVuooqim9D1xMon1EfvYrdiin6/zVoF0IDJmcVDpnBCpDp2CTSVMbtztZkmTvzE
 8Dgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IOY3t4AaHZe80iw8hQcSliA4Md0iNA8hrA2Uy7U0qF8=;
 b=tSmRW+kb5cAr0thhzXoAgj3PHDmBvpIdMZAdKjqj62mNv5Fc0Agu5Est2V6C+ZMbCQ
 yOyl9zEqHFpVTgqLjZYY+3EzEH4c8yOoW41MHfT4mjc06DD9XE78e8DqxR8JPkzBLoId
 6rV/ZZRKs3CSKu6TVAS+RIhc9uHgr0gs2ZclMRnXi9naR970L0oywCZcCH01hhk0p0g2
 9IKvsuGeT6llRlFQXcmVD/Jk+qFFnrDhuDEL00w186DG5OENwlsRPMwmClK4YBWcJZJv
 t7dSghwyQu+HGi8J4OAXgIub90iBsJihn3XCzUbLjOUoxk25nn8+rckRfuw+tRhX6/r1
 ciOA==
X-Gm-Message-State: AOAM530BZr3pDXnCMa2OPvzHxXZeH5bRm4aRmAQT3vYVwbsp5F1M7/t6
 zOuKtni00BCrqZDkjmUttqPTzcZtNXMAHw==
X-Google-Smtp-Source: ABdhPJxla9FITUmU/XG7eNbWa2IPDTC1oVHDVn8ZxnC9wFLU2qew942nyuCUsa9e40iSLKnzmF2Wfg==
X-Received: by 2002:a02:2345:: with SMTP id u66mr6906527jau.129.1636082402573; 
 Thu, 04 Nov 2021 20:20:02 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:20:01 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 16/36] bsd-user/arm/target_arch_cpu.h: Implement
 target_cpu_clone_regs
Date: Thu,  4 Nov 2021 21:18:57 -0600
Message-Id: <20211105031917.87837-17-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
 Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
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



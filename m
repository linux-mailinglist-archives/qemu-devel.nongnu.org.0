Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD8031CE49
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:43:47 +0100 (CET)
Received: from localhost ([::1]:38210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3Ry-0003fT-B1
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:43:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC334-0000Er-HR
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:18:02 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32Q-0002Ue-3U
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:18:02 -0500
Received: by mail-wr1-x434.google.com with SMTP id n4so10809809wrx.1
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PhpQV/FF0DFKtngPe2D6ugwgrr2qM1uGeEbr3znkdr8=;
 b=FTA1/LL85PB4gyw8Q+SC/nABTLazHEb5ycZ+QZvjW7qYLh2LdYeMyuvbmZNU4Y0ftj
 jVI7bWlIs4fn+CB0Vb2C2lu22mivto8VNnKQt19T3N/916eE43qe/xb+gIXkPwkT94io
 79hA5cnnAlHZnrHSUCrHwwygBqRHAIzsCtPFcJdsWRMl3mqhmPzopcxAlrPOWVtgTVSU
 coItvH5nOKdFG6/3ZQ3cJFrCCxNY7X/K29GERfjHewIxlKtZE0gijUy9tQzSObyZwQCn
 eXQU7YXj90fUaHQnzrExGC+keKOsXepJupcmDoNmpTLTa53AFQ4bvaz2BWXN/evpgSH+
 Gv2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PhpQV/FF0DFKtngPe2D6ugwgrr2qM1uGeEbr3znkdr8=;
 b=kopQ4UQ2FrmXZK8aEhMCDzYNjAErOICIoy3zrmWWOVhRYhcL7DNYhKdVgvPh5uR+FL
 skGqslc1c3GJD7/tvaZESpu3aKGlEKQ+ZJ4AN8XyUCqrCozFvgh4zjaI8xxv3N6tFho+
 GbHIYlr8OXxzLp96LD0WOudka07mbTnzHLt9b3YMSAaoSAO0XO0KDuYupHk0KTLKApH+
 7vh7Z2BZVepYorXwkkwrOMtfFeXg81XR7ROlev6lT0g+RW1vyS3qAyV1kAV2uj0Eeu47
 njYXHCzL49rynQR4ynQ8TYY3nUe6vok7AFLRYZ+Y4hCZv1Ub0nGQ+LP5lqJVw+I++HOs
 kYww==
X-Gm-Message-State: AOAM531NYDLPOi9hk1ijuoswiRcKpsTK9zo3e3nhVEbsgHDS7OcN+LHc
 SvoYfELtg/C68UYDt8uZdOhYJDaaM3zWKA==
X-Google-Smtp-Source: ABdhPJxi5cS2z/nCl6LjEjT7ZSNc8x93ZuFX7pADHaYdwjztpz0gkT7DxRGQ920HaMb3iMO+Qm3Y1w==
X-Received: by 2002:a05:6000:4e:: with SMTP id
 k14mr24357603wrx.281.1613492239657; 
 Tue, 16 Feb 2021 08:17:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d5sm30630482wrb.14.2021.02.16.08.17.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 08:17:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/40] linux-user/aarch64: Signal SEGV_MTESERR for sync tag
 check fault
Date: Tue, 16 Feb 2021 16:16:45 +0000
Message-Id: <20210216161658.29881-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210216161658.29881-1-peter.maydell@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210212184902.1251044-28-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/aarch64/target_signal.h | 2 ++
 linux-user/aarch64/cpu_loop.c      | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/linux-user/aarch64/target_signal.h b/linux-user/aarch64/target_signal.h
index ddd73169f0f..777fb667fea 100644
--- a/linux-user/aarch64/target_signal.h
+++ b/linux-user/aarch64/target_signal.h
@@ -21,5 +21,7 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+#define TARGET_SEGV_MTESERR  9  /* Synchronous ARM MTE exception */
+
 #define TARGET_ARCH_HAS_SETUP_FRAME
 #endif /* AARCH64_TARGET_SIGNAL_H */
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 4e43906e66a..b6a2e65593f 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -134,6 +134,9 @@ void cpu_loop(CPUARMState *env)
             case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
                 info.si_code = TARGET_SEGV_ACCERR;
                 break;
+            case 0x11: /* Synchronous Tag Check Fault */
+                info.si_code = TARGET_SEGV_MTESERR;
+                break;
             default:
                 g_assert_not_reached();
             }
-- 
2.20.1



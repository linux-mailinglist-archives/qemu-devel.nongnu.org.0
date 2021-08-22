Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 137673F3D58
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 05:57:30 +0200 (CEST)
Received: from localhost ([::1]:41252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHebx-00020z-2g
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 23:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaF-0007fb-MB
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:43 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:40545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaD-0000Xn-35
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:43 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso16420573pjh.5
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 20:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+WaIHji4UVCfbzWSWYeif0ORIYit2XTMtjCt7U1K6k4=;
 b=h4FuiIBNN6iHZAQYRGRklNXnq+teFHvidRu7A6p5WHDv9N/ZrS4GUP2+W6fkGm5T9y
 b+Rn52UN61F4k4QC8cvqGjF/nVYZU/kUJbZOIQZkwne6BkzQOzZw/xwTfQ8/E3Belh0n
 XIryIhYA8RyksYzfb3T/Z0W0M48DvcFKyKB+nfat83HbSaDm75zXiVdz0UsmQ0ZFPzO9
 9v+adFTg0Fq2PSSilbAt1S1fka1cvBNCPlgU6fP5ccNlTkFMW5X/HA6pGW03071jEbMZ
 Ipb8MLvI55GzY3tjnW8i68XPon8agyP28e0q0Qwmsw7rhgBI6nlQDz2wb9gM8sbzHN4w
 +Z2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+WaIHji4UVCfbzWSWYeif0ORIYit2XTMtjCt7U1K6k4=;
 b=qG/5kQ2kAY26KbEUsBwJdJywAkGRy+0+OEaH2jxK8IZaEovJCAr6deufCBWWrqh4pj
 GgKQ0fMI0RwkBHwaWpBXy52MVdDLQYlo2md5nb2ybA7Azd4lTJW9yqHvmY8D8gTMjzBz
 o6+tlKO7TrvEZHWRNE6yc/KrD3pMcu6JASG/FYVHBSRxYcMkl+B47Ua3v0yepbkVeGcN
 rbuF3dDd6roEceFhDNQXAyCjenN6dpYR8B3Xc5TQN1DsDLVVA57hD74j21N3pGyh5xv7
 Ub6AbZB8yuEueUgdpMwI9uLZ6a1OPs3sUle+XtWQvRuXzqDaVgatCqNGHgn8vwYWwl1u
 Ye5Q==
X-Gm-Message-State: AOAM533asicm6HMG0+YFSpl07y0YjHoKVn1ly1NvyQHi+dsT7aqfHX4u
 qyJ2AE4lVJDYPbs3485nTZC/nv6R/n69jQ==
X-Google-Smtp-Source: ABdhPJxOZvdJvTya8mOw0k/SkeHkQS5HcyP1WE/8RIM4DL0onruHsheKeJSgsGe8kFFmMpuqQ/LxXg==
X-Received: by 2002:a17:90a:404a:: with SMTP id
 k10mr12982277pjg.145.1629604539504; 
 Sat, 21 Aug 2021 20:55:39 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x12sm11560533pfu.21.2021.08.21.20.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 20:55:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/30] linux-user/aarch64: Set siginfo_t addr field for
 SIGTRAP signals
Date: Sat, 21 Aug 2021 20:55:08 -0700
Message-Id: <20210822035537.283193-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210822035537.283193-1-richard.henderson@linaro.org>
References: <20210822035537.283193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

When generating a TRAP_BRKPT SIGTRAP, set the siginfo_t addr field
to the PC where the breakpoint/singlestep trap occurred; this is
what the kernel does for this signal for this architecture.

Fixes: Coverity 1459154
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210813131809.28655-2-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/cpu_loop.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index ee72a1c20f..5d8675944d 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -148,6 +148,7 @@ void cpu_loop(CPUARMState *env)
             info.si_signo = TARGET_SIGTRAP;
             info.si_errno = 0;
             info.si_code = TARGET_TRAP_BRKPT;
+            info._sifields._sigfault._addr = env->pc;
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
         case EXCP_SEMIHOST:
-- 
2.25.1



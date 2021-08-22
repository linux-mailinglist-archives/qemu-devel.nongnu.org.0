Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4703F3D5D
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 05:59:27 +0200 (CEST)
Received: from localhost ([::1]:49922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHedq-0007hH-K2
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 23:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaG-0007hE-UF
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:44 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:43570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaD-0000Ym-9c
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:44 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 qe12-20020a17090b4f8c00b00179321cbae7so9900605pjb.2
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 20:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wxQXtJmn/5fHjbKQYnHYNPRKlKJ8RKfJONraii7URWo=;
 b=MXbarbi2spXS8eJpRD710txdVUYKuU3Oju+UFC5UZV1jMy5QJ1Ee87CNEs6F3TOEdE
 ez894NSfY6DhA34yqPloyFDQaf1/vw1E1EX7Ibzr9bcQznCABKLQkxz4Hd3h3TOi7aEn
 u+sob1uzzXzKDU5/WGE9+UpkmVCILvyUHHM8GPrqtvIhgiuOz9O6oxGhxYCUfOh+Nr7x
 5bYXZDJnK9IUzVarpMedqR601CWmOgE+z+sXxvWus+t7DDVav7/bTaNLLjZfULomO8GE
 TErcKD57UC2zrBhgPt4k5iHCLplTuY4KB+/bja0QmkRRac1NbfRu3IkNcYsCZPefxigp
 TEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wxQXtJmn/5fHjbKQYnHYNPRKlKJ8RKfJONraii7URWo=;
 b=FhGKT0abD6nbxOWNbDeuJZfUyTQK6xJUeMdIUmrjXkPqKI2nMh3i5fHgbhzQA6sumS
 TqOT7xsqANo58hXCW+PcXq/LBDLGnK5x+TheBdFliCM/ERWj/H18bKnq3hOFGp0BI1X0
 7Pyl5Me4vhdL8X0eNsNih2SaGzeR+is7aOqE9wmPnsVQ2PtyG1HluIpkhSQoPxs2w72g
 Z4ojuWJUnVNc2oh4T0QHk1YwEBWx9mcFxLIfh9qfdsLaNUhidtY1ZgtkjWsirRgI9VCo
 PcK5Z1UrHAT7niHT6WbD1GyKkXtSS8TfN+/bXuBZNuWBKbTuUC88/p6RR2+7XZHBPeKr
 i5rQ==
X-Gm-Message-State: AOAM532KKaukxAjJVWqSNLO+I6BiiJN1BH3UvdjxV7WZ0Bdg7zZxe5TW
 zytGsEB09zROHbVImgmo+udWNJe8jHCRNA==
X-Google-Smtp-Source: ABdhPJzTVTt3gdjri++pqkyN2blSIbJ23DNQbRVX//ouqgJAwa7H07AwToifHqvUh9q5SaWgH/ehSw==
X-Received: by 2002:a17:90b:4d91:: with SMTP id
 oj17mr4023013pjb.209.1629604540080; 
 Sat, 21 Aug 2021 20:55:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x12sm11560533pfu.21.2021.08.21.20.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 20:55:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/30] linux-user/arm: Set siginfo_t addr field for SIGTRAP
 signals
Date: Sat, 21 Aug 2021 20:55:09 -0700
Message-Id: <20210822035537.283193-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210822035537.283193-1-richard.henderson@linaro.org>
References: <20210822035537.283193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210813131809.28655-3-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/cpu_loop.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 69632d15be..007752f5b7 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -453,6 +453,7 @@ void cpu_loop(CPUARMState *env)
             info.si_signo = TARGET_SIGTRAP;
             info.si_errno = 0;
             info.si_code = TARGET_TRAP_BRKPT;
+            info._sifields._sigfault._addr = env->regs[15];
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
         case EXCP_KERNEL_TRAP:
-- 
2.25.1



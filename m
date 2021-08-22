Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1863F3D88
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 06:16:19 +0200 (CEST)
Received: from localhost ([::1]:35316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHeu5-0001wE-Cd
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 00:16:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaP-0007rM-6S
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:54 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:39924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaM-0000hC-Mk
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:52 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 oc2-20020a17090b1c0200b00179e56772d6so6573897pjb.4
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 20:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jKxkWJetc9mOamPS46VjF9q1E3iRdGdDObeSI1Rk2wY=;
 b=s4PImu7w7akX/eHAWYCNWLnjz0bbwMF3F+YbTeGtdfTkvEEgkKq0bNu0nTC1TwB4/x
 bWXaDk8OCdGewwM0ZD51LXcshT74dPWcMf5VzJ5vHY5KvN5C3BK4fWMTAqRdO8Bp5M6r
 YKxo3j8Xhhdn/4RtP4LYaQU6C3DCMJYPuq5+yOD6cguW9GM9zmCIKE50cCOUekqd4FIJ
 Rh6WMP1XK0tLeP/LHaOgdNZN9oN/1gRSmetIjK/bIssEFi+m45iTjcXGQdzLWLKkSBv1
 Gre8b7QJtjiT7KMFkyx6znWlvSGx9HaxCdwnnx56lh59DSxqpzn6aJ9EcEk9I8g2Jp65
 qNiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jKxkWJetc9mOamPS46VjF9q1E3iRdGdDObeSI1Rk2wY=;
 b=aWjULolKyyYSepXgHuUv+gUm5NjE7aFEzVuho4k1HZ9IYLwO9NSFmtoezGbUuBV0iq
 t8nPx10WeFJueRLOcLvajS8V+QUbhtnp/uKv2gE6U0kVwbxj4sTnIzWuZpmfpd1p13mj
 Nc2C4hHr6d+6vp6byOyDEiid6m833DZlEBtq8lfsB1gA+70ku2YuGTAbb5mizt+x2JkT
 GGOhrUuc/UTnxcrYmZwYrBS/VmHonXEPxwPt0bV/WpqJFVvEqn40ITv6sqKA0ovkEkkw
 oZdmBiI3wl8S/OyxYcn+bQUY1R4Rkm/iv2N5O2vV3cVl0p17e+aAR+V0zU4PF0Zl8Jm3
 rY+w==
X-Gm-Message-State: AOAM533rW0/HvPRaOQ7CWsIIsnhyj2ah+SiQyLjn7lMr3f3zb35qRI5q
 0fBJZVJv77p/gBXnIOqAgPuCRoOX9+hTvw==
X-Google-Smtp-Source: ABdhPJweM9FDrHpO38NSCUOWdLvOdCLq7L8Y8n+F7feTB4nHlTtgrMLcHPD3NtSswTmhLk2EdWFY0g==
X-Received: by 2002:a17:90b:1102:: with SMTP id
 gi2mr12909025pjb.43.1629604549559; 
 Sat, 21 Aug 2021 20:55:49 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x12sm11560533pfu.21.2021.08.21.20.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 20:55:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/30] linux-user/hppa: Set FPE_CONDTRAP for COND
Date: Sat, 21 Aug 2021 20:55:23 -0700
Message-Id: <20210822035537.283193-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210822035537.283193-1-richard.henderson@linaro.org>
References: <20210822035537.283193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

This si_code was changed in 75abf64287cab, for linux 4.17.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall_defs.h  | 1 +
 linux-user/hppa/cpu_loop.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 55ccc6ae03..f9efbffe0c 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -688,6 +688,7 @@ typedef struct target_siginfo {
 #define TARGET_FPE_FLTINV      (7)  /* floating point invalid operation */
 #define TARGET_FPE_FLTSUB      (8)  /* subscript out of range */
 #define TARGET_FPE_FLTUNK      (14) /* undiagnosed fp exception */
+#define TARGET_FPE_CONDTRAP    (15) /* trap on condition */
 #define TARGET_NSIGFPE         15
 
 /*
diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index 7bc85dffd0..cc076e7cdb 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -171,6 +171,8 @@ void cpu_loop(CPUHPPAState *env)
             force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, env->iaoq_f);
             break;
         case EXCP_COND:
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_CONDTRAP, env->iaoq_f);
+            break;
         case EXCP_ASSIST:
             force_sig_fault(TARGET_SIGFPE, 0, env->iaoq_f);
             break;
-- 
2.25.1



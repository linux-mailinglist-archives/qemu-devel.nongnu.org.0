Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D468B50A432
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:29:48 +0200 (CEST)
Received: from localhost ([::1]:44408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhYkd-000305-W5
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZD-0007BJ-MD
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:17:59 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:40514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZC-0006FY-5e
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:17:59 -0400
Received: by mail-pg1-x52d.google.com with SMTP id h5so4900255pgc.7
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=r/x/miQLf6ebWpV7bnXYZjExmKCWn1NklUL03LEs0Hs=;
 b=a972qkJgvJZwLAoP+bpRHSBrXuUyaZ0SI5E6J8dHpxlNSO4dOVvLPMK2vGGIxCTTa+
 yaP3y4RdR4ZngL8ac5H6mOW5euQ/jNVFXg64t2YJHY39DOmN8jTtjOSHoyddl7K9nd7v
 oK/7XzvgqfGWRVPJ45jolOETY/oxcITwwcFNC7eLejsxyHGE2tMFVKuq8m+23GpKr4wa
 iIZPTgeGMVPvGOhnmijfXmBTITPrlCMm/htTfFUXuNMCkOGm2bCiJLMmKZimPu5FSfj6
 drSxMY0G/pfKyNF8EFRc9dWnBFWODzl1uiYf3f4yjffC/9vKTay8EPUunSKFIFNCzYPg
 hDBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r/x/miQLf6ebWpV7bnXYZjExmKCWn1NklUL03LEs0Hs=;
 b=kI+vEZU0i2jGNzWGErd5CfuEKnlfenRDx0vMnWkkMtVK/GFG+ed/C5EeHXQycb8wOa
 xi8o2PCjfmmCuv19v2KjSxY116cJsXfmrxh3FD4/EJpjAnFIs0yQDw3Ph4Bk+6I59IGg
 GoDFYHndGsoEpo4+mDB149zZa88aucH2oE8JTv86APvg+4LjctSTY4pCq52DsqtqdrNm
 KS0AVSp6PuUOtdhz65ZtHZutyWbqXVtDFegUnIqPia7BCm7c10CR8c6Lh9FbBjZ9s4x6
 7OkECIlCSCC1rAaKuY9BTtXg/zJ03x0cg6mtV9p7NXwbJiC+/OmjzCg2UioG2HKY2BbE
 GLQQ==
X-Gm-Message-State: AOAM532sWCsg6WUx8a4ZHtLJEbKhjl4MU8u3+CdpRykjF3GXa7qu7m+n
 9VduTGMSCwMPoiUgE0dDyaJb+YP5XcmWCw==
X-Google-Smtp-Source: ABdhPJxkGN0Q8CebfRePJW3UDqnIn+G43pc6EyML0ncJioniRaDw+8cku2q1rBGqza4OUqkIBKfI5w==
X-Received: by 2002:a05:6a00:3494:b0:50a:6317:80a1 with SMTP id
 cp20-20020a056a00349400b0050a631780a1mr160056pfb.24.1650554276915; 
 Thu, 21 Apr 2022 08:17:56 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.17.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:17:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 12/64] linux-user/nios2: Use force_sig_fault for EXCP_DEBUG
Date: Thu, 21 Apr 2022 08:16:43 -0700
Message-Id: <20220421151735.31996-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the simpler signal interface, which forces us to supply
the missing PC value to si_addr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/cpu_loop.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index f37850fe81..e725036628 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -26,7 +26,6 @@
 void cpu_loop(CPUNios2State *env)
 {
     CPUState *cs = env_cpu(env);
-    target_siginfo_t info;
     int trapnr, ret;
 
     for (;;) {
@@ -121,10 +120,7 @@ void cpu_loop(CPUNios2State *env)
             break;
 
         case EXCP_DEBUG:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->regs[R_PC]);
             break;
         default:
             EXCP_DUMP(env, "\nqemu: unhandled CPU exception %#x - aborting\n",
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3719443F6C4
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:44:12 +0200 (CEST)
Received: from localhost ([::1]:56192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgKgV-0007HO-5k
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJdt-0002et-Aw
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:26 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:45754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJdn-0000Pi-JJ
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:25 -0400
Received: by mail-pl1-x62d.google.com with SMTP id f8so5984420plo.12
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5hZhX5vZU8BaEoiEK8fUOl4WiuruFQqSWFfGeVps8ww=;
 b=pWjoOQhFKnnPZc+E8KGK8kqWSqfuy1D83OPxWlfT3UKehb6SD8QmJvFvlJbFc+jKr5
 DGqTFW2ZsczNZBiQ4ytfFXG58QR1CLJaZBgCVBb1Seu8RBQHlZpt2QY/NVHrDVd3I3jh
 82z8Q5ginFlv6UYRcdVjZvt4cFwIidlbYJSq4v6M/CdBceHRYqpGCQZ0bFLK7JQ6wkO+
 EDADIDg28/0LNFmA0MVCSj2NbpDOjjAl7NlZXzJSB2HbC7xdzl9LbqCJFFlP3gyHdP36
 8DlRrdtK6iD3e8KmWLXXwPiXekIrocGvmhI5FtwS8vyNWz+1w4wV5cq9sDJbUkpNXHKk
 jGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5hZhX5vZU8BaEoiEK8fUOl4WiuruFQqSWFfGeVps8ww=;
 b=P2x+CGBeCirGG2fgepzbZoa6tFrAt0U/UCXZUs7jjI6ggbpLbI5h0Fs45TijmhQBCp
 X6Ou4wT8IqMIQfPo6NUExNhAmqK+uzQ1VFLY6EEd+TjPV1y0LUOvb9nMR/QvqXp4F8J/
 jLW4SDycrBGHAd3t22/dVl3Z4CcPQVWsrCQ4UhWHtGrP/XuFFAlIHTVYFufQuKa5qt+M
 vr5g5SN87adVu7YkVjSzKJrc2Kb7zbZJT3r5h+Z4oBc0VBowTR6PUoC7/q1AxjfrK4I6
 3sqc4OTjmJPRbO2AcS/I+ArFANtTutj/JO3AOzPxswAt533puE+9A5pskJAhZrHlXvtz
 ZB1Q==
X-Gm-Message-State: AOAM531U622wdaNRKqHdU9P+etDN3j3303L4srtnzOEXYxuemqmLdn5d
 FfTrBfd/YuUPqhH3gPBAzLZaXtcspUKGMw==
X-Google-Smtp-Source: ABdhPJx7rmpGEi8IIiMHfGLrXqbNXv1x2nHhcwKYpm8vHG++POwtgwEW011sJBK8qBlvrU9juEyoCA==
X-Received: by 2002:a17:902:7608:b0:141:9a53:ceff with SMTP id
 k8-20020a170902760800b001419a53ceffmr5294320pll.78.1635482238407; 
 Thu, 28 Oct 2021 21:37:18 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id b8sm5228232pfv.56.2021.10.28.21.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:37:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 59/60] softmmu: remove useless condition in watchpoint check
Date: Thu, 28 Oct 2021 21:33:28 -0700
Message-Id: <20211029043329.1518029-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

cpu_check_watchpoint function checks cpu->watchpoint_hit at the entry.
But then it also does the same in the middle of the function,
while this field can't change.
That is why this patch removes this useless condition.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <163542169094.2127597.8801843697434113110.stgit@pasha-ThinkPad-X280>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 softmmu/physmem.c | 39 +++++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index d58752678d..9765a509d2 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -929,27 +929,26 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
             }
             wp->hitaddr = MAX(addr, wp->vaddr);
             wp->hitattrs = attrs;
-            if (!cpu->watchpoint_hit) {
-                if (wp->flags & BP_CPU && cc->tcg_ops->debug_check_watchpoint &&
-                    !cc->tcg_ops->debug_check_watchpoint(cpu, wp)) {
-                    wp->flags &= ~BP_WATCHPOINT_HIT;
-                    continue;
-                }
-                cpu->watchpoint_hit = wp;
 
-                mmap_lock();
-                /* This call also restores vCPU state */
-                tb_check_watchpoint(cpu, ra);
-                if (wp->flags & BP_STOP_BEFORE_ACCESS) {
-                    cpu->exception_index = EXCP_DEBUG;
-                    mmap_unlock();
-                    cpu_loop_exit(cpu);
-                } else {
-                    /* Force execution of one insn next time.  */
-                    cpu->cflags_next_tb = 1 | curr_cflags(cpu);
-                    mmap_unlock();
-                    cpu_loop_exit_noexc(cpu);
-                }
+            if (wp->flags & BP_CPU && cc->tcg_ops->debug_check_watchpoint &&
+                !cc->tcg_ops->debug_check_watchpoint(cpu, wp)) {
+                wp->flags &= ~BP_WATCHPOINT_HIT;
+                continue;
+            }
+            cpu->watchpoint_hit = wp;
+
+            mmap_lock();
+            /* This call also restores vCPU state */
+            tb_check_watchpoint(cpu, ra);
+            if (wp->flags & BP_STOP_BEFORE_ACCESS) {
+                cpu->exception_index = EXCP_DEBUG;
+                mmap_unlock();
+                cpu_loop_exit(cpu);
+            } else {
+                /* Force execution of one insn next time.  */
+                cpu->cflags_next_tb = 1 | curr_cflags(cpu);
+                mmap_unlock();
+                cpu_loop_exit_noexc(cpu);
             }
         } else {
             wp->flags &= ~BP_WATCHPOINT_HIT;
-- 
2.25.1



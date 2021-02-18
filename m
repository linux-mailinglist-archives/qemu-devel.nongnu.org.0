Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E34431E85E
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 11:05:01 +0100 (CET)
Received: from localhost ([::1]:47946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCgBA-00012J-62
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 05:05:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfuM-00079D-4X
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:47:38 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfuJ-0007J5-Ot
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:47:37 -0500
Received: by mail-wr1-x430.google.com with SMTP id l12so2208367wry.2
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 01:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zs3ZCon26CJzrjGkyi/ru0q40eBX9PJP1e1LsnAKqPY=;
 b=r14qM+vLAYuvyO2iiw4GSnpu0KGmCXjsKVYF6yEtaXbGD1/F+gXklOxWWSLiLwUQGu
 Sq7lrsW7UasnFgcTTRGTSgLbqhHzVRZT1YcCX3NvZVsIiXZwf1CC3hJvCJrXSNYCyqDs
 byXNCqOkcZQBkEJJNWk8a+vPxC6ZcE3Wy/SLyJXD5zn3c3BvjJSOLwrBluBIkWXFWclE
 D6+vuTSmhxqNG+H+Sr8zA68sINaLyF/TZvAPVM01G9f3ow1Y6pOefBw6UBgZ74CD4vCy
 bSKhV4Jk1cl9Vb9Kv0TPFF0wQhJPcoD3TRUIltFKXt4K7lTdeNVxuAw9KqXrPelyVLaQ
 +o+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zs3ZCon26CJzrjGkyi/ru0q40eBX9PJP1e1LsnAKqPY=;
 b=qYSY6YNfMJ+XykbHmRntQCNQ7vfs6hP8tbPs6dZfktsqyu7hOH/NvAEU85NUw93KM7
 n2pz+NELTXuXRwdRxWi4AuTNZSTg6rG079WTKVcixQmbvd3VVFd6L9YAGkjUKB5/0Gen
 +tW5xvuiSSxZCTirbdZhigXOjioyqByBZ1XKlEYjHIRJ6fLodcixfVjcTak4Swt+WLtk
 h4HLcjhRROJa1MZyj1S5niaB//fC6uRIShQVQ99WNBu2hhtWVUtAw3flWYQja6jTV5Mb
 8wBLe/NM5GF1omPd0tKXE+yTuwOYRUtVfd1Pa1fCufS0WfmLLVgnEqOqGG96XnOQI0Me
 HGNg==
X-Gm-Message-State: AOAM530VwMXeWcwW1c1IRQb1rb8zjZxWNg/i8/g7WTfo808SkLQ9WuYR
 DJY+9TyuoPMOzYHNUxJCxP7VAA==
X-Google-Smtp-Source: ABdhPJy76YMqSX7oz6PUwyWogRxCLf4cVzt8jKwNOeNmr7MCahCfrgHrzVpAv0/Bs0jtvzsQUX9yZQ==
X-Received: by 2002:a5d:4d0b:: with SMTP id z11mr3487950wrt.359.1613641652124; 
 Thu, 18 Feb 2021 01:47:32 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b15sm7645938wrr.47.2021.02.18.01.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 01:47:23 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 807BF1FF9F;
 Thu, 18 Feb 2021 09:47:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 16/23] accel/tcg: actually cache our partial icount TB
Date: Thu, 18 Feb 2021 09:46:59 +0000
Message-Id: <20210218094706.23038-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210218094706.23038-1-alex.bennee@linaro.org>
References: <20210218094706.23038-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we exit a block under icount with instructions left to execute we
might need a shorter than normal block to take us to the next
deterministic event. Instead of creating a throwaway block on demand
we use the existing compile flags mechanism to ensure we fetch (or
compile and fetch) a block with exactly the number of instructions we
need.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210213130325.14781-17-alex.bennee@linaro.org>

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index f2819eec7d..d24c1bdb74 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -730,16 +730,17 @@ static inline void cpu_loop_exec_tb(CPUState *cpu, TranslationBlock *tb,
     /* Ensure global icount has gone forward */
     icount_update(cpu);
     /* Refill decrementer and continue execution.  */
-    insns_left = MIN(0xffff, cpu->icount_budget);
+    insns_left = MIN(CF_COUNT_MASK, cpu->icount_budget);
     cpu_neg(cpu)->icount_decr.u16.low = insns_left;
     cpu->icount_extra = cpu->icount_budget - insns_left;
-    if (!cpu->icount_extra && insns_left < tb->icount) {
-        /* Execute any remaining instructions, then let the main loop
-         * handle the next event.
-         */
-        if (insns_left > 0) {
-            cpu_exec_nocache(cpu, insns_left, tb, false);
-        }
+
+    /*
+     * If the next tb has more instructions than we have left to
+     * execute we need to ensure we find/generate a TB with exactly
+     * insns_left instructions in it.
+     */
+    if (!cpu->icount_extra && insns_left > 0 && insns_left < tb->icount)  {
+        cpu->cflags_next_tb = (tb->cflags & ~CF_COUNT_MASK) | insns_left;
     }
 #endif
 }
-- 
2.20.1



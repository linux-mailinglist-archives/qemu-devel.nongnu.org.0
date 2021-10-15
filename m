Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A3E42E811
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:49:38 +0200 (CEST)
Received: from localhost ([::1]:60352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbFA1-0005oT-8H
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEcI-0006yL-Es
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:47 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:33780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEcD-0002wS-W9
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:46 -0400
Received: by mail-pl1-x62e.google.com with SMTP id y4so5641229plb.0
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pdzh8Ws2GkGBVDH5ETDlAj3vOFqZvQW52CUEjET/TWY=;
 b=CJCNLq7rj3AkfgcC6utiwUZqfc7wtb7dTqJ/NvvKces23Khe4OjVa6lQDM2OdBxNsp
 yZbGB1KpIwMxGJiyK7Ev5GtVKxDrJzX2W5PYUbM41t7qPwQ3UcxPbLQWYRNnfpryASZY
 /B+bmEjEe6eRWqvtzg/3JOgYdJD3tMjIHmIO9mCOTJJqF33m7Lt4Kg+ejvAXsKAiQUIj
 9lVkYs+1MSN91/sMUCl/VjDVP1SDkuyAGIq3zdDEVkm9MxcKhhKQ9uCBGJEfHzGdKzC3
 MZ1bmHWz4JVARFvVLc5l60WOuNxFZ12FKlXXJoaE4fHZFN4RrBNI8rLNe3cHnfvipQUJ
 P6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pdzh8Ws2GkGBVDH5ETDlAj3vOFqZvQW52CUEjET/TWY=;
 b=F7sVfWgwjXO06CyjIXmpVLHiympjouTwNrWAuKBvQSmocZzVytfHt6KePDOva4mdgr
 xssNho6qLUpnd6J4GIsLi6eM8/5m+J+ULyPu/1s2fHeT65erJ+kQwxpCflmHuUGHJQOe
 sNwvyd5X0uAZnLcKR3YEkTX4eW2GI9bH4mTO8aqVnyWXCsBWV27xXzmEsNlYgjwlASgH
 DhgJ3s0XP9O8RhRHjq9rUvGgSKz5iQylm47wttXMXHe1KzVy5WurX8ChBvcL2A0FBRLD
 h2cnUA3VAid2lUlA5M55dQAsSpT/v3wbibOAqv14xVQRk00PUZ3DHSkW+zET9C8wCouF
 BshA==
X-Gm-Message-State: AOAM531tnKl4dZoVutRPW1cfWEmCLRJvlZXLoE0VQM6PyThLNkHBozno
 p8Zc2BGnDcfo8LkOAEsdzMkWcAoMAZpZMQ==
X-Google-Smtp-Source: ABdhPJyNkPWdaWJg+lnQ+ivJg0bZnYcsQZ+d+WK+fKdvtt+ZZdAt9r22tyVgAtHFbpXpPzvwKz5hVA==
X-Received: by 2002:a17:90a:7345:: with SMTP id
 j5mr25397984pjs.48.1634271280785; 
 Thu, 14 Oct 2021 21:14:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q8sm10236885pja.52.2021.10.14.21.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:14:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 58/67] accel/tcg: Report unaligned atomics for user-only
Date: Thu, 14 Oct 2021 21:10:44 -0700
Message-Id: <20211015041053.2769193-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new cpu_loop_exit_sigbus for atomic_mmu_lookup, which
has access to complete alignment info from the TCGMemOpIdx arg.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/user-exec.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 5646f8e527..92cbffd7c6 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -476,11 +476,22 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
                                MemOpIdx oi, int size, int prot,
                                uintptr_t retaddr)
 {
+    MemOp mop = get_memop(oi);
+    int a_bits = get_alignment_bits(mop);
+    void *ret;
+
+    /* Enforce guest required alignment.  */
+    if (unlikely(addr & ((1 << a_bits) - 1))) {
+        MMUAccessType t = prot == PAGE_READ ? MMU_DATA_LOAD : MMU_DATA_STORE;
+        cpu_loop_exit_sigbus(env_cpu(env), addr, t, retaddr);
+    }
+
     /* Enforce qemu required alignment.  */
     if (unlikely(addr & (size - 1))) {
         cpu_loop_exit_atomic(env_cpu(env), retaddr);
     }
-    void *ret = g2h(env_cpu(env), addr);
+
+    ret = g2h(env_cpu(env), addr);
     set_helper_retaddr(retaddr);
     return ret;
 }
-- 
2.25.1



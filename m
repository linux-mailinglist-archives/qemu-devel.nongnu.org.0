Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3F8442D43
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:54:59 +0100 (CET)
Received: from localhost ([::1]:50646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsNW-0000TB-O6
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrhI-0001gI-Ji
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:20 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:43690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrhE-00021R-Ix
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:17 -0400
Received: by mail-qt1-x82d.google.com with SMTP id 8so986687qty.10
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G7SBr/WksrEb3wfGw9+4/7HGKeZrYxUMshTizcIBHp0=;
 b=hwOxAJR38Bn8SzPMelDs0iP37VCMq+iC6HOQ5gkLmtWP4rYNod0JUbgYV83t8YKTk3
 /+oGZzj+xTGXGeJuoMSHeYv+/QlPrmsJ5YodSrU3t7YHra/+OOfJA2XG9DTW1ofItvRz
 NjXs4dpzXzJrtakD9nr2yy76JlWzNsj/7FhB4SnJoj0FbnehR2/dguF39xfkbK/jLWLD
 IhwfL+iUkKnb52KJNcfT49xcqVizw5mQ5vuI/tAWsD3wShsPXEiesgJK9eoYHsyPO+ya
 BxPk8NTlIPtCMNsxZ8o6QEch5IIjHmIk9af/Qw7GmGQMFpr3+CGf+3ikwrdnjVbyX8Ap
 ROeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G7SBr/WksrEb3wfGw9+4/7HGKeZrYxUMshTizcIBHp0=;
 b=iMkgzXdWZwbTgRggwy8wbeIGgcdVRFNwRUZWqI+dPvoq9jrLBHKQkz/s42ug2aU48m
 /iBwswlL4/LznSJvVuFJLV4DpfVw82o8n1d2c8wHxDXeiVLltG8UrnE9Y38J68Inapwv
 xF5rqIRwIyw3H7tJnc8VXz9w+D2sY/VVtanOu+Eh5zkPzYi7iBJGGWYoL9r6EljEvxGp
 m/eHTdOB96+gwOXLdFSpZLRXsN3XZkDGy6mE3vcVDXcz9bxKdoY7qo516HFHhnLQiwZ9
 KWNVu49Xh6ENOuG7vUJGU3VFNq425Me2wmJTA1mrEw/gx/m7P06eXHyeNk7qQRZQFdFa
 93dQ==
X-Gm-Message-State: AOAM5315AvZVsublBL/VczFJfDWfT7bhuTeBoaSp5EkYGQTtkAODfiNs
 H9ErNf9VpZLEyh4d/XR+BcGYswH8dKAKeQ==
X-Google-Smtp-Source: ABdhPJwCSlh3cxeorN4fHXa7Hk4OokZF1NzPd0aaN+Q88C1VR7xiYHnBcopmfjvvLYZBM3qwoG87xw==
X-Received: by 2002:a05:622a:1313:: with SMTP id
 v19mr5966344qtk.340.1635851475740; 
 Tue, 02 Nov 2021 04:11:15 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm25sm12730854qkb.4.2021.11.02.04.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:11:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 57/60] accel/tcg: Report unaligned atomics for user-only
Date: Tue,  2 Nov 2021 07:07:37 -0400
Message-Id: <20211102110740.215699-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new cpu_loop_exit_sigbus for atomic_mmu_lookup, which
has access to complete alignment info from the TCGMemOpIdx arg.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/user-exec.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index c4f69908e9..1ee64f01fc 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -474,11 +474,22 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
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



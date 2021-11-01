Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D38C44200F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:31:30 +0100 (CET)
Received: from localhost ([::1]:52628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhc5X-0006DG-Ro
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:31:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb9H-0008Bg-4F
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:07 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:38721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb9F-0001Fw-Fw
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:06 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id a24so2769124qvb.5
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G7SBr/WksrEb3wfGw9+4/7HGKeZrYxUMshTizcIBHp0=;
 b=IOoUgL18/wQee0OnpOMixbyFV2o9zbdDNpngx023fYhHLHk/8mzdQRuuuysYNssYDl
 VmfS+YqjQDtMZXX6n1YWLThrO57VB45rME9Bh/Di55nac90iuH10OLlz3+Je8oZtEsnb
 uDmB3jtxBSRzukxH6WlLUWVrOALWoOoFi76Bzk/EitIc+Pr76pWFGB0VWJT6zOGYjj+S
 Fj9ABMJnNdkBF4gGDHXtlT0x+G8ER+3ADqeEEfE3nqjPyTYOdvKq0iyjC6yHV9q3qDNO
 6XBavW7mWvDk8pxcZLkv2TbyPqq5ZuVFY8Um5bre0HzPh+bSKGb5X/YyHgYNLVyYL/EQ
 14aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G7SBr/WksrEb3wfGw9+4/7HGKeZrYxUMshTizcIBHp0=;
 b=Snf0bHtIL/5l/28TQduL0AZqkZ4/3YbyhmZFgFf0HsqYVpiqkXftX1GTTrJHCtUaxb
 M7G40P4DEJlBNboBjqXrhsRQMYw+pXFOvOwNopf+8rRsb8p6+t+6OAFzGUhdQyCYt0zr
 e/MPb9Uo8r5UJ8F9nVJC5TuKTmR6Rvin9puBwg1YRalYvzFar2ZxcwtHOE/uM7N03a8M
 YxWfm8OMKZGiw9OQaQwvmjSZAUl0hK1rbeJEl2wDrIwJgmKX4bkrZ6Ydvh77qDW2TdtH
 W4uOBFtBXfqDsyzwtz53qB+beq8YUG9LIDbXb8wP6Zrvomn0hoBFspvEVc2ifP7X/GMe
 BQJA==
X-Gm-Message-State: AOAM533zWZMH/eESelxNMRskmBWCoxFQhg4BT4uIyjVxfJGPRmhZMCpS
 2qWCt1z1Ru93477r8XrkXxCJHLsnUNjvXg==
X-Google-Smtp-Source: ABdhPJyJnR4n1z/QiF/o7pid1CSyNLAr5kdB51UFfcFuGxLplPUnRMRoBodk98axS8Wq6HVBwgvNsQ==
X-Received: by 2002:a05:6214:1d2b:: with SMTP id
 f11mr13986523qvd.7.1635787864522; 
 Mon, 01 Nov 2021 10:31:04 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id 13sm1222289qkc.40.2021.11.01.10.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:31:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 57/60] accel/tcg: Report unaligned atomics for user-only
Date: Mon,  1 Nov 2021 13:27:26 -0400
Message-Id: <20211101172729.23149-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2a.google.com
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CEF42B2F2
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 04:55:17 +0200 (CEST)
Received: from localhost ([::1]:42180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUQG-0007eo-VS
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 22:55:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHk-0004eR-HE
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:28 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:40705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHi-0004uy-Ow
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:28 -0400
Received: by mail-pf1-x42d.google.com with SMTP id o133so1147657pfg.7
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=te2kf7hHJE1D45OuAMtE7bn/toedNLWAWMCQPiNKbOQ=;
 b=vCMCfN2KQG7/hmOP9Hlf0qxSJHIKTywetAlsuCgeqYsEXqoxyZg2WwuMf9aPSjfYpt
 4FgIDAtKrOTtEIlkXKacAp+On76Mz2NFEn3HfsQ+c5U/a6qeX8/u4IbX+lqh89/SrxO/
 aijrTAHWC/qePlqpu7qZPTlSJRcxoQVDoNxIBmdUpAz1m+GkekrsJwUmLbEqBeMg06Gh
 7NZ0QgG/V642YeWscHyIjEcCT3npsXU1wPAzX0en3vvwUA0g2ZwRAXvnIKjtFO4YNlC6
 oAfk0drt08VGUzzDzBztUDAyZX5GtaC4ICLURsniwbpuCJWKmATIXILCBYyi5GEhkYmZ
 /sCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=te2kf7hHJE1D45OuAMtE7bn/toedNLWAWMCQPiNKbOQ=;
 b=5VnwY9cPxpABqezzkQwSuKAYJIDIp73+yVSVOZCeNfAo7T4CjOj62ie++2ILGkv4lC
 8+fVbAZ0S46VhuTMT/0a91ZB6FMCNdyXzBk1h/k/WhqqFbd9fPNd4Gw1UYIex8erDPnO
 b0ShJrDNLtyV42RztizSxWUIiRuUcEXrMePslE3rLAPtO7Zjm7DgS6JpK1XesXPAe+vU
 Ss1f7a8/GticckTNPYBYr09q2Jr29ErVTEhY2ifzZR7c9vR/WlrDo1O5WDrx9NLDqBql
 LMUzUt2qpWJe0aLeHFSihw27Ja9enDj674Xp0eQASIBQsdRP6weOhxBzKrjqI2FQnuMn
 xqzw==
X-Gm-Message-State: AOAM532ltcIGoXEkc6vFv4/43EdAl0IKkXxhQ6ahSL88HxPzBc6T3Yot
 F2T1SO0gYEn3ZcGe0XMM8Zwp01HdNkU=
X-Google-Smtp-Source: ABdhPJxZfbBqNoK8QJa7NYVIVfvBf+twcfpZBEo4pKasRZlK/bvtPzM42R9kHPJi3h31Uib8GLyeFw==
X-Received: by 2002:a62:33c2:0:b0:44d:ab9:2e92 with SMTP id
 z185-20020a6233c2000000b0044d0ab92e92mr18541758pfz.10.1634093185387; 
 Tue, 12 Oct 2021 19:46:25 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 16/48] accel/tcg: Report unaligned atomics for user-only
Date: Tue, 12 Oct 2021 19:45:35 -0700
Message-Id: <20211013024607.731881-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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
index 83ed76cef9..5dcd58c6d5 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -547,11 +547,22 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
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



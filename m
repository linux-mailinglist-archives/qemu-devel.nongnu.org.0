Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6886B4B1B9B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 02:50:27 +0100 (CET)
Received: from localhost ([::1]:47866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIL4s-0008HX-BI
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 20:50:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKnK-00049t-8c
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:32:18 -0500
Received: from [2607:f8b0:4864:20::631] (port=45601
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKnG-0007PQ-0c
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:32:15 -0500
Received: by mail-pl1-x631.google.com with SMTP id w20so3391846plq.12
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eqQZpXDeCV1SzzmmGSe5uysSf0Qll8u+UkCjmQOI+nE=;
 b=oCjlMNx4fPvaMHkeF8P5Dbv7pEihIBintUIYvJYwXoSddqFaEut8YlWwKjki7CxnAT
 iNm9hnzxFwPgEOtDmJ5hDjL1tZXwSNvzBkD4NYd3awxmbXzjf7/I5mM4e6BFX5uHs0oT
 aIkr+Mx5n2vqSPQfUay1T9C9SDO6xp1l8alxCWPi/DzQ3WWDL6t4VQGvLJFa953D8ejx
 YWOkVX/r3L/L5Lt5cCTu+shVSKUWxxul219QKphmWnzkItjT8XLB5SOYo246UdMyVzHn
 88w6BR2KHgnXohBgYSUETUOa6iliB0PahEaGunQII5uDk+1fob8Qwmge3DEA0nEG2npL
 LRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eqQZpXDeCV1SzzmmGSe5uysSf0Qll8u+UkCjmQOI+nE=;
 b=Ypwj/s0LeZpvoSt4RbCOd2xlV/ouM9mKqGT4ABdfu9lOzKusvkfjBLKm8q1eG6ysPd
 W9FNsb4G4GheXv71lAsTDGKc8eO8Za4woscOASfxA1CVFeQH9SG4y4FKXJeCu9WX/a6c
 8E4Oq/EdvyFLc86ZRAyhBaZgT9Qi2Xr40srr8HV14ofxjzRiPQRQ6IIuRiWMH2Vpma75
 SXolzAdE7VsocGPsSQv5sgnjMFmGK+Blc+EW25vsd0b+ww4pb9lP+tpBWMPGl77b3IhB
 EubTchwwcE+QxjYfcvu/d/y8BSd6iIg8Z34OM5+mt54lm85q3xbYRI2o10zkM4rfcDWb
 tKVA==
X-Gm-Message-State: AOAM5332qzIgDlQx1Ag/g2MsxAE6GIyFiw9ccOs4Lx79Kha4HAwFHZv+
 wGu7VEQXjurGIvXEvVoGwyI9Y+drm6Ith/8P
X-Google-Smtp-Source: ABdhPJxgKgmkQOhCbAecwVQvyTdC2JHYB9LA8GbmuCxQM4udtAt5zbrjOEsIB/QOa2wFJMMddLvd0A==
X-Received: by 2002:a17:90b:707:: with SMTP id s7mr198320pjz.99.1644543132735; 
 Thu, 10 Feb 2022 17:32:12 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h5sm25738788pfi.111.2022.02.10.17.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 17:32:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/34] tcg/tci: Support raising sigbus for user-only
Date: Fri, 11 Feb 2022 12:30:40 +1100
Message-Id: <20220211013059.17994-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211013059.17994-1-richard.henderson@linaro.org>
References: <20220211013059.17994-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 336af5945a..fe92b5d084 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -292,11 +292,11 @@ static bool tci_compare64(uint64_t u0, uint64_t u1, TCGCond condition)
 static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
                             MemOpIdx oi, const void *tb_ptr)
 {
-    MemOp mop = get_memop(oi) & (MO_BSWAP | MO_SSIZE);
+    MemOp mop = get_memop(oi);
     uintptr_t ra = (uintptr_t)tb_ptr;
 
 #ifdef CONFIG_SOFTMMU
-    switch (mop) {
+    switch (mop & (MO_BSWAP | MO_SSIZE)) {
     case MO_UB:
         return helper_ret_ldub_mmu(env, taddr, oi, ra);
     case MO_SB:
@@ -326,10 +326,14 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
     }
 #else
     void *haddr = g2h(env_cpu(env), taddr);
+    unsigned a_mask = (1u << get_alignment_bits(mop)) - 1;
     uint64_t ret;
 
     set_helper_retaddr(ra);
-    switch (mop) {
+    if (taddr & a_mask) {
+        helper_unaligned_ld(env, taddr);
+    }
+    switch (mop & (MO_BSWAP | MO_SSIZE)) {
     case MO_UB:
         ret = ldub_p(haddr);
         break;
@@ -377,11 +381,11 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
 static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
                         MemOpIdx oi, const void *tb_ptr)
 {
-    MemOp mop = get_memop(oi) & (MO_BSWAP | MO_SSIZE);
+    MemOp mop = get_memop(oi);
     uintptr_t ra = (uintptr_t)tb_ptr;
 
 #ifdef CONFIG_SOFTMMU
-    switch (mop) {
+    switch (mop & (MO_BSWAP | MO_SIZE)) {
     case MO_UB:
         helper_ret_stb_mmu(env, taddr, val, oi, ra);
         break;
@@ -408,9 +412,13 @@ static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
     }
 #else
     void *haddr = g2h(env_cpu(env), taddr);
+    unsigned a_mask = (1u << get_alignment_bits(mop)) - 1;
 
     set_helper_retaddr(ra);
-    switch (mop) {
+    if (taddr & a_mask) {
+        helper_unaligned_st(env, taddr);
+    }
+    switch (mop & (MO_BSWAP | MO_SIZE)) {
     case MO_UB:
         stb_p(haddr, val);
         break;
-- 
2.25.1



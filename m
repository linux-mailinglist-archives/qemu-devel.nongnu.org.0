Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A02397669
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:20:16 +0200 (CEST)
Received: from localhost ([::1]:36850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo6Bj-000845-Ep
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5u2-0002eV-03
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:58 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:35630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5to-0002lh-Ro
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:57 -0400
Received: by mail-il1-x132.google.com with SMTP id b9so5546956ilr.2
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 08:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8C3VP8ByJD9nOcOCCpnMSfGWjxpkkiunp71Vyjf082Q=;
 b=kCz4rHnIb2TKG7X7R1jKeZrWSw5AoLhmhXXCjeK43HPLgXJfAIgYjDPZKTj1B3VNc2
 CJlo28ANn/eTxZ2FZRjra3pxLdHB9au+ZwgQP5noEXVLCeymfM/wtcmIEdanabRv4Gto
 eXt5VvJhfGU/BLQ1Ij5iEEwDib3GUUTZ5rTlQMqbgFhf/OI6gxw9l1D2WT3yyVqxuqZW
 NcG7MF6IB2C+eBrtFecUn/uGyDPOjmlnOx0Cb7f0mZuu3TXvh0JIK8AKA02n903tap4l
 1YnFAQMWu0Y4JYWUxPULVRJXfZwOkUfVQZuN2JSeFqsrgORIwz8wSlBmXKeS1kjPUCVr
 ikYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8C3VP8ByJD9nOcOCCpnMSfGWjxpkkiunp71Vyjf082Q=;
 b=nz0C2IS2yJb7hz5ZwLtDmHByA3WCJJ75iRfUWOkGlxpOZDgteuN+BTu6W2QFFovsx/
 Ia/9FZfvzevGcUvPCIEu5FNBBFcxLCBTWLWDqswfKi9sU4MFKhPBRRY1quAZBRbqVNFm
 PUoVHCTn99UAS8Ccj6Kh4D2OhOgBSo5jIP7Yy8T52scpZ+RwRV/QIO0fAa5EUteMjl+J
 kaFAXI3dHLx2LDTAUnszJnBF3zQ8zVz6K0T4NCSIrbJch7h/weDuz/5mV/1vttq9Puw7
 igtmYCP+auYkwfFaeNLjI6erSIjpL/lpl7C3kPHPWXtEJkdmJT41DuvLGaA4O0JnqP0L
 YVRA==
X-Gm-Message-State: AOAM532bxE1WmbTp75VkrdT93liaCWaQlChR0lGLp7T2n7cQ90R/G/Hq
 HPSoVgyuuJGqDivG1NvSwNPJzjlu777sMHEK
X-Google-Smtp-Source: ABdhPJx7GkgZXdgGC4WEZmJM+PM4ywPlvA6lzcmLGq5L7nZ4+hcxYww4NsZzhcjqA9dZ9cyGRI9Ebg==
X-Received: by 2002:a92:d90c:: with SMTP id s12mr4590471iln.201.1622559702857; 
 Tue, 01 Jun 2021 08:01:42 -0700 (PDT)
Received: from localhost.localdomain
 ([2607:fb90:806c:3e8a:9cf0:b3be:5e07:b99f])
 by smtp.gmail.com with ESMTPSA id f8sm4109909ilj.37.2021.06.01.08.01.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 08:01:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 26/27] tcg/tci: Use {set,clear}_helper_retaddr
Date: Tue,  1 Jun 2021 08:01:05 -0700
Message-Id: <20210601150106.12761-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601150106.12761-1-richard.henderson@linaro.org>
References: <20210601150106.12761-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x132.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wrap guest memory operations for tci like we do for cpu_ld*_data.

We cannot actually use the cpu_ldst.h interface without duplicating
the memory trace operations performed within, which will already
have been expanded into the tcg opcode stream.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 11219fec18..c61eb6b900 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -290,10 +290,9 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
                             TCGMemOpIdx oi, const void *tb_ptr)
 {
     MemOp mop = get_memop(oi) & (MO_BSWAP | MO_SSIZE);
-
-#ifdef CONFIG_SOFTMMU
     uintptr_t ra = (uintptr_t)tb_ptr;
 
+#ifdef CONFIG_SOFTMMU
     switch (mop) {
     case MO_UB:
         return helper_ret_ldub_mmu(env, taddr, oi, ra);
@@ -326,6 +325,7 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
     void *haddr = g2h(env_cpu(env), taddr);
     uint64_t ret;
 
+    set_helper_retaddr(ra);
     switch (mop) {
     case MO_UB:
         ret = ldub_p(haddr);
@@ -366,6 +366,7 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
     default:
         g_assert_not_reached();
     }
+    clear_helper_retaddr();
     return ret;
 #endif
 }
@@ -374,10 +375,9 @@ static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
                         TCGMemOpIdx oi, const void *tb_ptr)
 {
     MemOp mop = get_memop(oi) & (MO_BSWAP | MO_SSIZE);
-
-#ifdef CONFIG_SOFTMMU
     uintptr_t ra = (uintptr_t)tb_ptr;
 
+#ifdef CONFIG_SOFTMMU
     switch (mop) {
     case MO_UB:
         helper_ret_stb_mmu(env, taddr, val, oi, ra);
@@ -406,6 +406,7 @@ static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
 #else
     void *haddr = g2h(env_cpu(env), taddr);
 
+    set_helper_retaddr(ra);
     switch (mop) {
     case MO_UB:
         stb_p(haddr, val);
@@ -431,6 +432,7 @@ static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
     default:
         g_assert_not_reached();
     }
+    clear_helper_retaddr();
 #endif
 }
 
-- 
2.25.1



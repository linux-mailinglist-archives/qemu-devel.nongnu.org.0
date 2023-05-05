Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8806F8B00
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:29:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2yS-0006oK-Ih; Fri, 05 May 2023 17:28:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2yQ-0006iB-DY
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:28:18 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2yM-0005SN-8P
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:28:17 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f193ca059bso15335495e9.3
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683322093; x=1685914093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I4w3bX0EvMhXa1FPvD+aIFFJRHstVlIrJSKr2TPnALg=;
 b=tvwGAkuZcct1ba7lwM/DR25lP0a//EAh+BE3T+QAOUHDIOMdcIBRTemi6/66L9C5bl
 X+lZ121x2YvtuJ74TWuaxTRAHbzQwQTiCYGIgEjRwHtVLG48G0Q3UDvr+u6wbXGRtWri
 3EBUIwLv6avgKmCK5iQKQcSdJgMfhU1D5aZkaICwT8Pl5FvvTQhgGtAeT/tcibvLD63s
 csT19BgYKehyxDgxWXAbwikFvZnD6r9fXgTZuws97Lz4bjPXTYmZzbnd0wZ9LgizSkRe
 49Lc2JsQx97QwgbF+Xj504h87xogTe1IjH0NAdiBFisIfzJZFq/iXO08mg+4mcl10SRY
 dG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683322093; x=1685914093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I4w3bX0EvMhXa1FPvD+aIFFJRHstVlIrJSKr2TPnALg=;
 b=GNzCizlgnTHNM75kOExYtT7DUeZySf23OB3g1DfRjkHf+wmbuWUcVLa4Gi4V9rQY3+
 ES31RCj4zolK8Fm15x4xD4yNMO7Bcq2B8osTQPCCEkBejMI/nNjVN2bcGhTaaMmWgO2n
 BRpfXdxRoNU/1pmcN2jFm+Yp0SeJS2jzurFEQ2mduYGnaoo207mGzR+DAeOEAGkTIzxS
 WyBFhxZEooeyXO8ku5y+26rDahrCxwT3SKUPcu2AlZoF2udKQd2pyL1D3Pcj7d3NX86k
 4L+1IlbEZZNaQ6z9Z4nKdapwIiDPANaG5cDTi+GN8A1mcXnclS3hQ+Boz29tbi91F0a+
 eanQ==
X-Gm-Message-State: AC+VfDw5SjL/O0uGJjzX6Bn3B0ImsICvRzd5QbBhxWyOudoRgabXTPQH
 7Ub1XKp+HmAoZaNnMxJbouEEs2jTlFnuywsXhSr0Wg==
X-Google-Smtp-Source: ACHHUZ6kxri/ilT9GjakQFIrmX0vHAQcmi1lF+Y1hgmaeGlfljZ1N6CnL4rtgFmKjsC7wpkAl3HvhA==
X-Received: by 2002:a7b:c7c3:0:b0:3f1:72f8:6a92 with SMTP id
 z3-20020a7bc7c3000000b003f172f86a92mr2082123wmk.20.1683322092688; 
 Fri, 05 May 2023 14:28:12 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 z10-20020a05600c220a00b003f171234a08sm9009001wml.20.2023.05.05.14.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:28:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 42/42] tcg: Widen helper_*_st[bw]_mmu val arguments
Date: Fri,  5 May 2023 22:24:47 +0100
Message-Id: <20230505212447.374546-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

While the old type was correct in the ideal sense, some ABIs require
the argument to be zero-extended.  Using uint32_t for all such values
is a decent compromise.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-ldst.h | 10 +++++++---
 accel/tcg/cputlb.c     |  6 +++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/include/tcg/tcg-ldst.h b/include/tcg/tcg-ldst.h
index 2ba22bd5fe..684e394b06 100644
--- a/include/tcg/tcg-ldst.h
+++ b/include/tcg/tcg-ldst.h
@@ -55,15 +55,19 @@ tcg_target_ulong helper_be_ldsw_mmu(CPUArchState *env, target_ulong addr,
 tcg_target_ulong helper_be_ldsl_mmu(CPUArchState *env, target_ulong addr,
                                     MemOpIdx oi, uintptr_t retaddr);
 
-void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
+/*
+ * Value extended to at least uint32_t, so that some ABIs do not require
+ * zero-extension from uint8_t or uint16_t.
+ */
+void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                         MemOpIdx oi, uintptr_t retaddr);
-void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr);
 void helper_le_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr);
 void helper_le_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
                        MemOpIdx oi, uintptr_t retaddr);
-void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr);
 void helper_be_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr);
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index c8bd642d0e..3117886af1 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2508,7 +2508,7 @@ full_stb_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
     store_helper(env, addr, val, oi, retaddr, MO_UB);
 }
 
-void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
+void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                         MemOpIdx oi, uintptr_t retaddr)
 {
     full_stb_mmu(env, addr, val, oi, retaddr);
@@ -2521,7 +2521,7 @@ static void full_le_stw_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
     store_helper(env, addr, val, oi, retaddr, MO_LEUW);
 }
 
-void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr)
 {
     full_le_stw_mmu(env, addr, val, oi, retaddr);
@@ -2534,7 +2534,7 @@ static void full_be_stw_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
     store_helper(env, addr, val, oi, retaddr, MO_BEUW);
 }
 
-void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr)
 {
     full_be_stw_mmu(env, addr, val, oi, retaddr);
-- 
2.34.1



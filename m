Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB2D42C8BF
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 20:34:26 +0200 (CEST)
Received: from localhost ([::1]:38694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maj57-0002gT-LM
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 14:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maiu3-00043P-17
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:22:59 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:40770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maitz-00035c-9V
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:22:58 -0400
Received: by mail-pf1-x435.google.com with SMTP id o133so3215906pfg.7
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 11:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=syrOq70b+WQbswMfLFfnxL9wWHFgRBIzyHZ82I/3Gjg=;
 b=jRlebPvocMpudY4j1q55dw0S1q2B5z4RE3YIyoUeB50F+YdGmx5M+noLZSO/pG6cg2
 XjrGFgdl+bD5dYSrgnDPosxErCKOx9SkeSq8BOrRD6mBMuDJuo6qBZWRpxNpMefVaFba
 +fOJaN13MWHojC3j3B6BJuC3ozGxC2MhbukC3jqOjd1fdIYr7npU87RNUxflKQfJngPs
 /XPqO3qyH9a+v0oafU9VIuvw1p7urXZFCGSOLBFiYHqM8OIE3Mu2l4O+oXIwahhOwQ2N
 Ro+jrbdXGtg+Ay9wbRhOsxmgcrtfhjHZpIoMjadDWWS7uJYvLxaPc2XriiBdCuum2LqG
 Af7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=syrOq70b+WQbswMfLFfnxL9wWHFgRBIzyHZ82I/3Gjg=;
 b=wbE04btEGWKVSNIifzTJtzURdncl9RBrJdr4OPcTuJ8RkFjJ9tLMg59sqgi6QtslL9
 ohtHbl0pUdmufyJn9giOdJodO4aStUY8X7azJbFsUtpSy0qzFnyuXATESfTBb4Ps5Nyp
 r4RSpNf4xHXyNnwEurKpyYezcpUHWUKP9oZLm7lBObVIpSPx+nWez8KunEmMeTt1vI/J
 u5SAbfjdAll4gCRpgAq7M2TTj8pPd7xQEoItDIHi658EgZ4QPwHE2jzfTaYwfqfsEOMp
 2L7u5gqaGfGTrocEF6yCJEJRkkPdIk94WrOegVRHNppQ5ESBX4AkxRHICcRB7HrWwPYV
 RFkA==
X-Gm-Message-State: AOAM532nTKPTDH9cQWVhxNbFho8wvpM6EtPmvDFEeskwFRSG47MEfNPk
 nwZyFXgX7cc+7C2cF4pkQOVfwkKIeY8rUw==
X-Google-Smtp-Source: ABdhPJxLQBv2BRGPlqy7cuixSoKpjLozB3+6kibvrRFZGKd5uHIui6+k+3XGC+iQlpH9wV/PKV16gg==
X-Received: by 2002:a63:e057:: with SMTP id n23mr583399pgj.183.1634149372430; 
 Wed, 13 Oct 2021 11:22:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z2sm177140pfe.210.2021.10.13.11.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 11:22:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/15] target/mips: Use cpu_*_data_ra for msa load/store
Date: Wed, 13 Oct 2021 11:22:33 -0700
Message-Id: <20211013182239.991127-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013182239.991127-1-richard.henderson@linaro.org>
References: <20211013182239.991127-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We should not have been using the helper_ret_* set of
functions, as they are supposed to be private to tcg.
Nor should we have been using the plain cpu_*_data set
of functions, as they do not handle unwinding properly.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/msa_helper.c | 420 +++++++++++------------------------
 1 file changed, 135 insertions(+), 285 deletions(-)

diff --git a/target/mips/tcg/msa_helper.c b/target/mips/tcg/msa_helper.c
index 167d9a591c..a8880ce81c 100644
--- a/target/mips/tcg/msa_helper.c
+++ b/target/mips/tcg/msa_helper.c
@@ -8222,79 +8222,42 @@ void helper_msa_ld_b(CPUMIPSState *env, uint32_t wd,
                      target_ulong addr)
 {
     wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
-    MEMOP_IDX(DF_BYTE)
-#if !defined(CONFIG_USER_ONLY)
+    uintptr_t ra = GETPC();
+
 #if !defined(HOST_WORDS_BIGENDIAN)
-    pwd->b[0]  = helper_ret_ldub_mmu(env, addr + (0  << DF_BYTE), oi, GETPC());
-    pwd->b[1]  = helper_ret_ldub_mmu(env, addr + (1  << DF_BYTE), oi, GETPC());
-    pwd->b[2]  = helper_ret_ldub_mmu(env, addr + (2  << DF_BYTE), oi, GETPC());
-    pwd->b[3]  = helper_ret_ldub_mmu(env, addr + (3  << DF_BYTE), oi, GETPC());
-    pwd->b[4]  = helper_ret_ldub_mmu(env, addr + (4  << DF_BYTE), oi, GETPC());
-    pwd->b[5]  = helper_ret_ldub_mmu(env, addr + (5  << DF_BYTE), oi, GETPC());
-    pwd->b[6]  = helper_ret_ldub_mmu(env, addr + (6  << DF_BYTE), oi, GETPC());
-    pwd->b[7]  = helper_ret_ldub_mmu(env, addr + (7  << DF_BYTE), oi, GETPC());
-    pwd->b[8]  = helper_ret_ldub_mmu(env, addr + (8  << DF_BYTE), oi, GETPC());
-    pwd->b[9]  = helper_ret_ldub_mmu(env, addr + (9  << DF_BYTE), oi, GETPC());
-    pwd->b[10] = helper_ret_ldub_mmu(env, addr + (10 << DF_BYTE), oi, GETPC());
-    pwd->b[11] = helper_ret_ldub_mmu(env, addr + (11 << DF_BYTE), oi, GETPC());
-    pwd->b[12] = helper_ret_ldub_mmu(env, addr + (12 << DF_BYTE), oi, GETPC());
-    pwd->b[13] = helper_ret_ldub_mmu(env, addr + (13 << DF_BYTE), oi, GETPC());
-    pwd->b[14] = helper_ret_ldub_mmu(env, addr + (14 << DF_BYTE), oi, GETPC());
-    pwd->b[15] = helper_ret_ldub_mmu(env, addr + (15 << DF_BYTE), oi, GETPC());
+    pwd->b[0]  = cpu_ldub_data_ra(env, addr + (0  << DF_BYTE), ra);
+    pwd->b[1]  = cpu_ldub_data_ra(env, addr + (1  << DF_BYTE), ra);
+    pwd->b[2]  = cpu_ldub_data_ra(env, addr + (2  << DF_BYTE), ra);
+    pwd->b[3]  = cpu_ldub_data_ra(env, addr + (3  << DF_BYTE), ra);
+    pwd->b[4]  = cpu_ldub_data_ra(env, addr + (4  << DF_BYTE), ra);
+    pwd->b[5]  = cpu_ldub_data_ra(env, addr + (5  << DF_BYTE), ra);
+    pwd->b[6]  = cpu_ldub_data_ra(env, addr + (6  << DF_BYTE), ra);
+    pwd->b[7]  = cpu_ldub_data_ra(env, addr + (7  << DF_BYTE), ra);
+    pwd->b[8]  = cpu_ldub_data_ra(env, addr + (8  << DF_BYTE), ra);
+    pwd->b[9]  = cpu_ldub_data_ra(env, addr + (9  << DF_BYTE), ra);
+    pwd->b[10] = cpu_ldub_data_ra(env, addr + (10 << DF_BYTE), ra);
+    pwd->b[11] = cpu_ldub_data_ra(env, addr + (11 << DF_BYTE), ra);
+    pwd->b[12] = cpu_ldub_data_ra(env, addr + (12 << DF_BYTE), ra);
+    pwd->b[13] = cpu_ldub_data_ra(env, addr + (13 << DF_BYTE), ra);
+    pwd->b[14] = cpu_ldub_data_ra(env, addr + (14 << DF_BYTE), ra);
+    pwd->b[15] = cpu_ldub_data_ra(env, addr + (15 << DF_BYTE), ra);
 #else
-    pwd->b[0]  = helper_ret_ldub_mmu(env, addr + (7  << DF_BYTE), oi, GETPC());
-    pwd->b[1]  = helper_ret_ldub_mmu(env, addr + (6  << DF_BYTE), oi, GETPC());
-    pwd->b[2]  = helper_ret_ldub_mmu(env, addr + (5  << DF_BYTE), oi, GETPC());
-    pwd->b[3]  = helper_ret_ldub_mmu(env, addr + (4  << DF_BYTE), oi, GETPC());
-    pwd->b[4]  = helper_ret_ldub_mmu(env, addr + (3  << DF_BYTE), oi, GETPC());
-    pwd->b[5]  = helper_ret_ldub_mmu(env, addr + (2  << DF_BYTE), oi, GETPC());
-    pwd->b[6]  = helper_ret_ldub_mmu(env, addr + (1  << DF_BYTE), oi, GETPC());
-    pwd->b[7]  = helper_ret_ldub_mmu(env, addr + (0  << DF_BYTE), oi, GETPC());
-    pwd->b[8]  = helper_ret_ldub_mmu(env, addr + (15 << DF_BYTE), oi, GETPC());
-    pwd->b[9]  = helper_ret_ldub_mmu(env, addr + (14 << DF_BYTE), oi, GETPC());
-    pwd->b[10] = helper_ret_ldub_mmu(env, addr + (13 << DF_BYTE), oi, GETPC());
-    pwd->b[11] = helper_ret_ldub_mmu(env, addr + (12 << DF_BYTE), oi, GETPC());
-    pwd->b[12] = helper_ret_ldub_mmu(env, addr + (11 << DF_BYTE), oi, GETPC());
-    pwd->b[13] = helper_ret_ldub_mmu(env, addr + (10 << DF_BYTE), oi, GETPC());
-    pwd->b[14] = helper_ret_ldub_mmu(env, addr + (9  << DF_BYTE), oi, GETPC());
-    pwd->b[15] = helper_ret_ldub_mmu(env, addr + (8  << DF_BYTE), oi, GETPC());
-#endif
-#else
-#if !defined(HOST_WORDS_BIGENDIAN)
-    pwd->b[0]  = cpu_ldub_data(env, addr + (0  << DF_BYTE));
-    pwd->b[1]  = cpu_ldub_data(env, addr + (1  << DF_BYTE));
-    pwd->b[2]  = cpu_ldub_data(env, addr + (2  << DF_BYTE));
-    pwd->b[3]  = cpu_ldub_data(env, addr + (3  << DF_BYTE));
-    pwd->b[4]  = cpu_ldub_data(env, addr + (4  << DF_BYTE));
-    pwd->b[5]  = cpu_ldub_data(env, addr + (5  << DF_BYTE));
-    pwd->b[6]  = cpu_ldub_data(env, addr + (6  << DF_BYTE));
-    pwd->b[7]  = cpu_ldub_data(env, addr + (7  << DF_BYTE));
-    pwd->b[8]  = cpu_ldub_data(env, addr + (8  << DF_BYTE));
-    pwd->b[9]  = cpu_ldub_data(env, addr + (9  << DF_BYTE));
-    pwd->b[10] = cpu_ldub_data(env, addr + (10 << DF_BYTE));
-    pwd->b[11] = cpu_ldub_data(env, addr + (11 << DF_BYTE));
-    pwd->b[12] = cpu_ldub_data(env, addr + (12 << DF_BYTE));
-    pwd->b[13] = cpu_ldub_data(env, addr + (13 << DF_BYTE));
-    pwd->b[14] = cpu_ldub_data(env, addr + (14 << DF_BYTE));
-    pwd->b[15] = cpu_ldub_data(env, addr + (15 << DF_BYTE));
-#else
-    pwd->b[0]  = cpu_ldub_data(env, addr + (7  << DF_BYTE));
-    pwd->b[1]  = cpu_ldub_data(env, addr + (6  << DF_BYTE));
-    pwd->b[2]  = cpu_ldub_data(env, addr + (5  << DF_BYTE));
-    pwd->b[3]  = cpu_ldub_data(env, addr + (4  << DF_BYTE));
-    pwd->b[4]  = cpu_ldub_data(env, addr + (3  << DF_BYTE));
-    pwd->b[5]  = cpu_ldub_data(env, addr + (2  << DF_BYTE));
-    pwd->b[6]  = cpu_ldub_data(env, addr + (1  << DF_BYTE));
-    pwd->b[7]  = cpu_ldub_data(env, addr + (0  << DF_BYTE));
-    pwd->b[8]  = cpu_ldub_data(env, addr + (15 << DF_BYTE));
-    pwd->b[9]  = cpu_ldub_data(env, addr + (14 << DF_BYTE));
-    pwd->b[10] = cpu_ldub_data(env, addr + (13 << DF_BYTE));
-    pwd->b[11] = cpu_ldub_data(env, addr + (12 << DF_BYTE));
-    pwd->b[12] = cpu_ldub_data(env, addr + (11 << DF_BYTE));
-    pwd->b[13] = cpu_ldub_data(env, addr + (10 << DF_BYTE));
-    pwd->b[14] = cpu_ldub_data(env, addr + (9 << DF_BYTE));
-    pwd->b[15] = cpu_ldub_data(env, addr + (8 << DF_BYTE));
-#endif
+    pwd->b[0]  = cpu_ldub_data_ra(env, addr + (7  << DF_BYTE), ra);
+    pwd->b[1]  = cpu_ldub_data_ra(env, addr + (6  << DF_BYTE), ra);
+    pwd->b[2]  = cpu_ldub_data_ra(env, addr + (5  << DF_BYTE), ra);
+    pwd->b[3]  = cpu_ldub_data_ra(env, addr + (4  << DF_BYTE), ra);
+    pwd->b[4]  = cpu_ldub_data_ra(env, addr + (3  << DF_BYTE), ra);
+    pwd->b[5]  = cpu_ldub_data_ra(env, addr + (2  << DF_BYTE), ra);
+    pwd->b[6]  = cpu_ldub_data_ra(env, addr + (1  << DF_BYTE), ra);
+    pwd->b[7]  = cpu_ldub_data_ra(env, addr + (0  << DF_BYTE), ra);
+    pwd->b[8]  = cpu_ldub_data_ra(env, addr + (15 << DF_BYTE), ra);
+    pwd->b[9]  = cpu_ldub_data_ra(env, addr + (14 << DF_BYTE), ra);
+    pwd->b[10] = cpu_ldub_data_ra(env, addr + (13 << DF_BYTE), ra);
+    pwd->b[11] = cpu_ldub_data_ra(env, addr + (12 << DF_BYTE), ra);
+    pwd->b[12] = cpu_ldub_data_ra(env, addr + (11 << DF_BYTE), ra);
+    pwd->b[13] = cpu_ldub_data_ra(env, addr + (10 << DF_BYTE), ra);
+    pwd->b[14] = cpu_ldub_data_ra(env, addr + (9 << DF_BYTE), ra);
+    pwd->b[15] = cpu_ldub_data_ra(env, addr + (8 << DF_BYTE), ra);
 #endif
 }
 
@@ -8302,47 +8265,26 @@ void helper_msa_ld_h(CPUMIPSState *env, uint32_t wd,
                      target_ulong addr)
 {
     wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
-    MEMOP_IDX(DF_HALF)
-#if !defined(CONFIG_USER_ONLY)
+    uintptr_t ra = GETPC();
+
 #if !defined(HOST_WORDS_BIGENDIAN)
-    pwd->h[0] = helper_ret_lduw_mmu(env, addr + (0 << DF_HALF), oi, GETPC());
-    pwd->h[1] = helper_ret_lduw_mmu(env, addr + (1 << DF_HALF), oi, GETPC());
-    pwd->h[2] = helper_ret_lduw_mmu(env, addr + (2 << DF_HALF), oi, GETPC());
-    pwd->h[3] = helper_ret_lduw_mmu(env, addr + (3 << DF_HALF), oi, GETPC());
-    pwd->h[4] = helper_ret_lduw_mmu(env, addr + (4 << DF_HALF), oi, GETPC());
-    pwd->h[5] = helper_ret_lduw_mmu(env, addr + (5 << DF_HALF), oi, GETPC());
-    pwd->h[6] = helper_ret_lduw_mmu(env, addr + (6 << DF_HALF), oi, GETPC());
-    pwd->h[7] = helper_ret_lduw_mmu(env, addr + (7 << DF_HALF), oi, GETPC());
+    pwd->h[0] = cpu_lduw_data_ra(env, addr + (0 << DF_HALF), ra);
+    pwd->h[1] = cpu_lduw_data_ra(env, addr + (1 << DF_HALF), ra);
+    pwd->h[2] = cpu_lduw_data_ra(env, addr + (2 << DF_HALF), ra);
+    pwd->h[3] = cpu_lduw_data_ra(env, addr + (3 << DF_HALF), ra);
+    pwd->h[4] = cpu_lduw_data_ra(env, addr + (4 << DF_HALF), ra);
+    pwd->h[5] = cpu_lduw_data_ra(env, addr + (5 << DF_HALF), ra);
+    pwd->h[6] = cpu_lduw_data_ra(env, addr + (6 << DF_HALF), ra);
+    pwd->h[7] = cpu_lduw_data_ra(env, addr + (7 << DF_HALF), ra);
 #else
-    pwd->h[0] = helper_ret_lduw_mmu(env, addr + (3 << DF_HALF), oi, GETPC());
-    pwd->h[1] = helper_ret_lduw_mmu(env, addr + (2 << DF_HALF), oi, GETPC());
-    pwd->h[2] = helper_ret_lduw_mmu(env, addr + (1 << DF_HALF), oi, GETPC());
-    pwd->h[3] = helper_ret_lduw_mmu(env, addr + (0 << DF_HALF), oi, GETPC());
-    pwd->h[4] = helper_ret_lduw_mmu(env, addr + (7 << DF_HALF), oi, GETPC());
-    pwd->h[5] = helper_ret_lduw_mmu(env, addr + (6 << DF_HALF), oi, GETPC());
-    pwd->h[6] = helper_ret_lduw_mmu(env, addr + (5 << DF_HALF), oi, GETPC());
-    pwd->h[7] = helper_ret_lduw_mmu(env, addr + (4 << DF_HALF), oi, GETPC());
-#endif
-#else
-#if !defined(HOST_WORDS_BIGENDIAN)
-    pwd->h[0] = cpu_lduw_data(env, addr + (0 << DF_HALF));
-    pwd->h[1] = cpu_lduw_data(env, addr + (1 << DF_HALF));
-    pwd->h[2] = cpu_lduw_data(env, addr + (2 << DF_HALF));
-    pwd->h[3] = cpu_lduw_data(env, addr + (3 << DF_HALF));
-    pwd->h[4] = cpu_lduw_data(env, addr + (4 << DF_HALF));
-    pwd->h[5] = cpu_lduw_data(env, addr + (5 << DF_HALF));
-    pwd->h[6] = cpu_lduw_data(env, addr + (6 << DF_HALF));
-    pwd->h[7] = cpu_lduw_data(env, addr + (7 << DF_HALF));
-#else
-    pwd->h[0] = cpu_lduw_data(env, addr + (3 << DF_HALF));
-    pwd->h[1] = cpu_lduw_data(env, addr + (2 << DF_HALF));
-    pwd->h[2] = cpu_lduw_data(env, addr + (1 << DF_HALF));
-    pwd->h[3] = cpu_lduw_data(env, addr + (0 << DF_HALF));
-    pwd->h[4] = cpu_lduw_data(env, addr + (7 << DF_HALF));
-    pwd->h[5] = cpu_lduw_data(env, addr + (6 << DF_HALF));
-    pwd->h[6] = cpu_lduw_data(env, addr + (5 << DF_HALF));
-    pwd->h[7] = cpu_lduw_data(env, addr + (4 << DF_HALF));
-#endif
+    pwd->h[0] = cpu_lduw_data_ra(env, addr + (3 << DF_HALF), ra);
+    pwd->h[1] = cpu_lduw_data_ra(env, addr + (2 << DF_HALF), ra);
+    pwd->h[2] = cpu_lduw_data_ra(env, addr + (1 << DF_HALF), ra);
+    pwd->h[3] = cpu_lduw_data_ra(env, addr + (0 << DF_HALF), ra);
+    pwd->h[4] = cpu_lduw_data_ra(env, addr + (7 << DF_HALF), ra);
+    pwd->h[5] = cpu_lduw_data_ra(env, addr + (6 << DF_HALF), ra);
+    pwd->h[6] = cpu_lduw_data_ra(env, addr + (5 << DF_HALF), ra);
+    pwd->h[7] = cpu_lduw_data_ra(env, addr + (4 << DF_HALF), ra);
 #endif
 }
 
@@ -8350,31 +8292,18 @@ void helper_msa_ld_w(CPUMIPSState *env, uint32_t wd,
                      target_ulong addr)
 {
     wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
-    MEMOP_IDX(DF_WORD)
-#if !defined(CONFIG_USER_ONLY)
+    uintptr_t ra = GETPC();
+
 #if !defined(HOST_WORDS_BIGENDIAN)
-    pwd->w[0] = helper_ret_ldul_mmu(env, addr + (0 << DF_WORD), oi, GETPC());
-    pwd->w[1] = helper_ret_ldul_mmu(env, addr + (1 << DF_WORD), oi, GETPC());
-    pwd->w[2] = helper_ret_ldul_mmu(env, addr + (2 << DF_WORD), oi, GETPC());
-    pwd->w[3] = helper_ret_ldul_mmu(env, addr + (3 << DF_WORD), oi, GETPC());
+    pwd->w[0] = cpu_ldl_data_ra(env, addr + (0 << DF_WORD), ra);
+    pwd->w[1] = cpu_ldl_data_ra(env, addr + (1 << DF_WORD), ra);
+    pwd->w[2] = cpu_ldl_data_ra(env, addr + (2 << DF_WORD), ra);
+    pwd->w[3] = cpu_ldl_data_ra(env, addr + (3 << DF_WORD), ra);
 #else
-    pwd->w[0] = helper_ret_ldul_mmu(env, addr + (1 << DF_WORD), oi, GETPC());
-    pwd->w[1] = helper_ret_ldul_mmu(env, addr + (0 << DF_WORD), oi, GETPC());
-    pwd->w[2] = helper_ret_ldul_mmu(env, addr + (3 << DF_WORD), oi, GETPC());
-    pwd->w[3] = helper_ret_ldul_mmu(env, addr + (2 << DF_WORD), oi, GETPC());
-#endif
-#else
-#if !defined(HOST_WORDS_BIGENDIAN)
-    pwd->w[0] = cpu_ldl_data(env, addr + (0 << DF_WORD));
-    pwd->w[1] = cpu_ldl_data(env, addr + (1 << DF_WORD));
-    pwd->w[2] = cpu_ldl_data(env, addr + (2 << DF_WORD));
-    pwd->w[3] = cpu_ldl_data(env, addr + (3 << DF_WORD));
-#else
-    pwd->w[0] = cpu_ldl_data(env, addr + (1 << DF_WORD));
-    pwd->w[1] = cpu_ldl_data(env, addr + (0 << DF_WORD));
-    pwd->w[2] = cpu_ldl_data(env, addr + (3 << DF_WORD));
-    pwd->w[3] = cpu_ldl_data(env, addr + (2 << DF_WORD));
-#endif
+    pwd->w[0] = cpu_ldl_data_ra(env, addr + (1 << DF_WORD), ra);
+    pwd->w[1] = cpu_ldl_data_ra(env, addr + (0 << DF_WORD), ra);
+    pwd->w[2] = cpu_ldl_data_ra(env, addr + (3 << DF_WORD), ra);
+    pwd->w[3] = cpu_ldl_data_ra(env, addr + (2 << DF_WORD), ra);
 #endif
 }
 
@@ -8382,14 +8311,10 @@ void helper_msa_ld_d(CPUMIPSState *env, uint32_t wd,
                      target_ulong addr)
 {
     wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
-    MEMOP_IDX(DF_DOUBLE)
-#if !defined(CONFIG_USER_ONLY)
-    pwd->d[0] = helper_ret_ldq_mmu(env, addr + (0 << DF_DOUBLE), oi, GETPC());
-    pwd->d[1] = helper_ret_ldq_mmu(env, addr + (1 << DF_DOUBLE), oi, GETPC());
-#else
-    pwd->d[0] = cpu_ldq_data(env, addr + (0 << DF_DOUBLE));
-    pwd->d[1] = cpu_ldq_data(env, addr + (1 << DF_DOUBLE));
-#endif
+    uintptr_t ra = GETPC();
+
+    pwd->d[0] = cpu_ldq_data_ra(env, addr + (0 << DF_DOUBLE), ra);
+    pwd->d[1] = cpu_ldq_data_ra(env, addr + (1 << DF_DOUBLE), ra);
 }
 
 #define MSA_PAGESPAN(x) \
@@ -8415,81 +8340,44 @@ void helper_msa_st_b(CPUMIPSState *env, uint32_t wd,
 {
     wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
     int mmu_idx = cpu_mmu_index(env, false);
+    uintptr_t ra = GETPC();
+
+    ensure_writable_pages(env, addr, mmu_idx, ra);
 
-    MEMOP_IDX(DF_BYTE)
-    ensure_writable_pages(env, addr, mmu_idx, GETPC());
-#if !defined(CONFIG_USER_ONLY)
 #if !defined(HOST_WORDS_BIGENDIAN)
-    helper_ret_stb_mmu(env, addr + (0  << DF_BYTE), pwd->b[0],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (1  << DF_BYTE), pwd->b[1],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (2  << DF_BYTE), pwd->b[2],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (3  << DF_BYTE), pwd->b[3],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (4  << DF_BYTE), pwd->b[4],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (5  << DF_BYTE), pwd->b[5],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (6  << DF_BYTE), pwd->b[6],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (7  << DF_BYTE), pwd->b[7],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (8  << DF_BYTE), pwd->b[8],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (9  << DF_BYTE), pwd->b[9],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (10 << DF_BYTE), pwd->b[10], oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (11 << DF_BYTE), pwd->b[11], oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (12 << DF_BYTE), pwd->b[12], oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (13 << DF_BYTE), pwd->b[13], oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (14 << DF_BYTE), pwd->b[14], oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (15 << DF_BYTE), pwd->b[15], oi, GETPC());
+    cpu_stb_data_ra(env, addr + (0  << DF_BYTE), pwd->b[0], ra);
+    cpu_stb_data_ra(env, addr + (1  << DF_BYTE), pwd->b[1], ra);
+    cpu_stb_data_ra(env, addr + (2  << DF_BYTE), pwd->b[2], ra);
+    cpu_stb_data_ra(env, addr + (3  << DF_BYTE), pwd->b[3], ra);
+    cpu_stb_data_ra(env, addr + (4  << DF_BYTE), pwd->b[4], ra);
+    cpu_stb_data_ra(env, addr + (5  << DF_BYTE), pwd->b[5], ra);
+    cpu_stb_data_ra(env, addr + (6  << DF_BYTE), pwd->b[6], ra);
+    cpu_stb_data_ra(env, addr + (7  << DF_BYTE), pwd->b[7], ra);
+    cpu_stb_data_ra(env, addr + (8  << DF_BYTE), pwd->b[8], ra);
+    cpu_stb_data_ra(env, addr + (9  << DF_BYTE), pwd->b[9], ra);
+    cpu_stb_data_ra(env, addr + (10 << DF_BYTE), pwd->b[10], ra);
+    cpu_stb_data_ra(env, addr + (11 << DF_BYTE), pwd->b[11], ra);
+    cpu_stb_data_ra(env, addr + (12 << DF_BYTE), pwd->b[12], ra);
+    cpu_stb_data_ra(env, addr + (13 << DF_BYTE), pwd->b[13], ra);
+    cpu_stb_data_ra(env, addr + (14 << DF_BYTE), pwd->b[14], ra);
+    cpu_stb_data_ra(env, addr + (15 << DF_BYTE), pwd->b[15], ra);
 #else
-    helper_ret_stb_mmu(env, addr + (7  << DF_BYTE), pwd->b[0],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (6  << DF_BYTE), pwd->b[1],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (5  << DF_BYTE), pwd->b[2],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (4  << DF_BYTE), pwd->b[3],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (3  << DF_BYTE), pwd->b[4],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (2  << DF_BYTE), pwd->b[5],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (1  << DF_BYTE), pwd->b[6],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (0  << DF_BYTE), pwd->b[7],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (15 << DF_BYTE), pwd->b[8],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (14 << DF_BYTE), pwd->b[9],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (13 << DF_BYTE), pwd->b[10], oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (12 << DF_BYTE), pwd->b[11], oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (11 << DF_BYTE), pwd->b[12], oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (10 << DF_BYTE), pwd->b[13], oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (9  << DF_BYTE), pwd->b[14], oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (8  << DF_BYTE), pwd->b[15], oi, GETPC());
-#endif
-#else
-#if !defined(HOST_WORDS_BIGENDIAN)
-    cpu_stb_data(env, addr + (0  << DF_BYTE), pwd->b[0]);
-    cpu_stb_data(env, addr + (1  << DF_BYTE), pwd->b[1]);
-    cpu_stb_data(env, addr + (2  << DF_BYTE), pwd->b[2]);
-    cpu_stb_data(env, addr + (3  << DF_BYTE), pwd->b[3]);
-    cpu_stb_data(env, addr + (4  << DF_BYTE), pwd->b[4]);
-    cpu_stb_data(env, addr + (5  << DF_BYTE), pwd->b[5]);
-    cpu_stb_data(env, addr + (6  << DF_BYTE), pwd->b[6]);
-    cpu_stb_data(env, addr + (7  << DF_BYTE), pwd->b[7]);
-    cpu_stb_data(env, addr + (8  << DF_BYTE), pwd->b[8]);
-    cpu_stb_data(env, addr + (9  << DF_BYTE), pwd->b[9]);
-    cpu_stb_data(env, addr + (10 << DF_BYTE), pwd->b[10]);
-    cpu_stb_data(env, addr + (11 << DF_BYTE), pwd->b[11]);
-    cpu_stb_data(env, addr + (12 << DF_BYTE), pwd->b[12]);
-    cpu_stb_data(env, addr + (13 << DF_BYTE), pwd->b[13]);
-    cpu_stb_data(env, addr + (14 << DF_BYTE), pwd->b[14]);
-    cpu_stb_data(env, addr + (15 << DF_BYTE), pwd->b[15]);
-#else
-    cpu_stb_data(env, addr + (7  << DF_BYTE), pwd->b[0]);
-    cpu_stb_data(env, addr + (6  << DF_BYTE), pwd->b[1]);
-    cpu_stb_data(env, addr + (5  << DF_BYTE), pwd->b[2]);
-    cpu_stb_data(env, addr + (4  << DF_BYTE), pwd->b[3]);
-    cpu_stb_data(env, addr + (3  << DF_BYTE), pwd->b[4]);
-    cpu_stb_data(env, addr + (2  << DF_BYTE), pwd->b[5]);
-    cpu_stb_data(env, addr + (1  << DF_BYTE), pwd->b[6]);
-    cpu_stb_data(env, addr + (0  << DF_BYTE), pwd->b[7]);
-    cpu_stb_data(env, addr + (15 << DF_BYTE), pwd->b[8]);
-    cpu_stb_data(env, addr + (14 << DF_BYTE), pwd->b[9]);
-    cpu_stb_data(env, addr + (13 << DF_BYTE), pwd->b[10]);
-    cpu_stb_data(env, addr + (12 << DF_BYTE), pwd->b[11]);
-    cpu_stb_data(env, addr + (11 << DF_BYTE), pwd->b[12]);
-    cpu_stb_data(env, addr + (10 << DF_BYTE), pwd->b[13]);
-    cpu_stb_data(env, addr + (9  << DF_BYTE), pwd->b[14]);
-    cpu_stb_data(env, addr + (8  << DF_BYTE), pwd->b[15]);
-#endif
+    cpu_stb_data_ra(env, addr + (7  << DF_BYTE), pwd->b[0], ra);
+    cpu_stb_data_ra(env, addr + (6  << DF_BYTE), pwd->b[1], ra);
+    cpu_stb_data_ra(env, addr + (5  << DF_BYTE), pwd->b[2], ra);
+    cpu_stb_data_ra(env, addr + (4  << DF_BYTE), pwd->b[3], ra);
+    cpu_stb_data_ra(env, addr + (3  << DF_BYTE), pwd->b[4], ra);
+    cpu_stb_data_ra(env, addr + (2  << DF_BYTE), pwd->b[5], ra);
+    cpu_stb_data_ra(env, addr + (1  << DF_BYTE), pwd->b[6], ra);
+    cpu_stb_data_ra(env, addr + (0  << DF_BYTE), pwd->b[7], ra);
+    cpu_stb_data_ra(env, addr + (15 << DF_BYTE), pwd->b[8], ra);
+    cpu_stb_data_ra(env, addr + (14 << DF_BYTE), pwd->b[9], ra);
+    cpu_stb_data_ra(env, addr + (13 << DF_BYTE), pwd->b[10], ra);
+    cpu_stb_data_ra(env, addr + (12 << DF_BYTE), pwd->b[11], ra);
+    cpu_stb_data_ra(env, addr + (11 << DF_BYTE), pwd->b[12], ra);
+    cpu_stb_data_ra(env, addr + (10 << DF_BYTE), pwd->b[13], ra);
+    cpu_stb_data_ra(env, addr + (9  << DF_BYTE), pwd->b[14], ra);
+    cpu_stb_data_ra(env, addr + (8  << DF_BYTE), pwd->b[15], ra);
 #endif
 }
 
@@ -8498,49 +8386,28 @@ void helper_msa_st_h(CPUMIPSState *env, uint32_t wd,
 {
     wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
     int mmu_idx = cpu_mmu_index(env, false);
+    uintptr_t ra = GETPC();
+
+    ensure_writable_pages(env, addr, mmu_idx, ra);
 
-    MEMOP_IDX(DF_HALF)
-    ensure_writable_pages(env, addr, mmu_idx, GETPC());
-#if !defined(CONFIG_USER_ONLY)
 #if !defined(HOST_WORDS_BIGENDIAN)
-    helper_ret_stw_mmu(env, addr + (0 << DF_HALF), pwd->h[0], oi, GETPC());
-    helper_ret_stw_mmu(env, addr + (1 << DF_HALF), pwd->h[1], oi, GETPC());
-    helper_ret_stw_mmu(env, addr + (2 << DF_HALF), pwd->h[2], oi, GETPC());
-    helper_ret_stw_mmu(env, addr + (3 << DF_HALF), pwd->h[3], oi, GETPC());
-    helper_ret_stw_mmu(env, addr + (4 << DF_HALF), pwd->h[4], oi, GETPC());
-    helper_ret_stw_mmu(env, addr + (5 << DF_HALF), pwd->h[5], oi, GETPC());
-    helper_ret_stw_mmu(env, addr + (6 << DF_HALF), pwd->h[6], oi, GETPC());
-    helper_ret_stw_mmu(env, addr + (7 << DF_HALF), pwd->h[7], oi, GETPC());
+    cpu_stw_data_ra(env, addr + (0 << DF_HALF), pwd->h[0], ra);
+    cpu_stw_data_ra(env, addr + (1 << DF_HALF), pwd->h[1], ra);
+    cpu_stw_data_ra(env, addr + (2 << DF_HALF), pwd->h[2], ra);
+    cpu_stw_data_ra(env, addr + (3 << DF_HALF), pwd->h[3], ra);
+    cpu_stw_data_ra(env, addr + (4 << DF_HALF), pwd->h[4], ra);
+    cpu_stw_data_ra(env, addr + (5 << DF_HALF), pwd->h[5], ra);
+    cpu_stw_data_ra(env, addr + (6 << DF_HALF), pwd->h[6], ra);
+    cpu_stw_data_ra(env, addr + (7 << DF_HALF), pwd->h[7], ra);
 #else
-    helper_ret_stw_mmu(env, addr + (3 << DF_HALF), pwd->h[0], oi, GETPC());
-    helper_ret_stw_mmu(env, addr + (2 << DF_HALF), pwd->h[1], oi, GETPC());
-    helper_ret_stw_mmu(env, addr + (1 << DF_HALF), pwd->h[2], oi, GETPC());
-    helper_ret_stw_mmu(env, addr + (0 << DF_HALF), pwd->h[3], oi, GETPC());
-    helper_ret_stw_mmu(env, addr + (7 << DF_HALF), pwd->h[4], oi, GETPC());
-    helper_ret_stw_mmu(env, addr + (6 << DF_HALF), pwd->h[5], oi, GETPC());
-    helper_ret_stw_mmu(env, addr + (5 << DF_HALF), pwd->h[6], oi, GETPC());
-    helper_ret_stw_mmu(env, addr + (4 << DF_HALF), pwd->h[7], oi, GETPC());
-#endif
-#else
-#if !defined(HOST_WORDS_BIGENDIAN)
-    cpu_stw_data(env, addr + (0 << DF_HALF), pwd->h[0]);
-    cpu_stw_data(env, addr + (1 << DF_HALF), pwd->h[1]);
-    cpu_stw_data(env, addr + (2 << DF_HALF), pwd->h[2]);
-    cpu_stw_data(env, addr + (3 << DF_HALF), pwd->h[3]);
-    cpu_stw_data(env, addr + (4 << DF_HALF), pwd->h[4]);
-    cpu_stw_data(env, addr + (5 << DF_HALF), pwd->h[5]);
-    cpu_stw_data(env, addr + (6 << DF_HALF), pwd->h[6]);
-    cpu_stw_data(env, addr + (7 << DF_HALF), pwd->h[7]);
-#else
-    cpu_stw_data(env, addr + (3 << DF_HALF), pwd->h[0]);
-    cpu_stw_data(env, addr + (2 << DF_HALF), pwd->h[1]);
-    cpu_stw_data(env, addr + (1 << DF_HALF), pwd->h[2]);
-    cpu_stw_data(env, addr + (0 << DF_HALF), pwd->h[3]);
-    cpu_stw_data(env, addr + (7 << DF_HALF), pwd->h[4]);
-    cpu_stw_data(env, addr + (6 << DF_HALF), pwd->h[5]);
-    cpu_stw_data(env, addr + (5 << DF_HALF), pwd->h[6]);
-    cpu_stw_data(env, addr + (4 << DF_HALF), pwd->h[7]);
-#endif
+    cpu_stw_data_ra(env, addr + (3 << DF_HALF), pwd->h[0], ra);
+    cpu_stw_data_ra(env, addr + (2 << DF_HALF), pwd->h[1], ra);
+    cpu_stw_data_ra(env, addr + (1 << DF_HALF), pwd->h[2], ra);
+    cpu_stw_data_ra(env, addr + (0 << DF_HALF), pwd->h[3], ra);
+    cpu_stw_data_ra(env, addr + (7 << DF_HALF), pwd->h[4], ra);
+    cpu_stw_data_ra(env, addr + (6 << DF_HALF), pwd->h[5], ra);
+    cpu_stw_data_ra(env, addr + (5 << DF_HALF), pwd->h[6], ra);
+    cpu_stw_data_ra(env, addr + (4 << DF_HALF), pwd->h[7], ra);
 #endif
 }
 
@@ -8549,33 +8416,20 @@ void helper_msa_st_w(CPUMIPSState *env, uint32_t wd,
 {
     wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
     int mmu_idx = cpu_mmu_index(env, false);
+    uintptr_t ra = GETPC();
+
+    ensure_writable_pages(env, addr, mmu_idx, ra);
 
-    MEMOP_IDX(DF_WORD)
-    ensure_writable_pages(env, addr, mmu_idx, GETPC());
-#if !defined(CONFIG_USER_ONLY)
 #if !defined(HOST_WORDS_BIGENDIAN)
-    helper_ret_stl_mmu(env, addr + (0 << DF_WORD), pwd->w[0], oi, GETPC());
-    helper_ret_stl_mmu(env, addr + (1 << DF_WORD), pwd->w[1], oi, GETPC());
-    helper_ret_stl_mmu(env, addr + (2 << DF_WORD), pwd->w[2], oi, GETPC());
-    helper_ret_stl_mmu(env, addr + (3 << DF_WORD), pwd->w[3], oi, GETPC());
+    cpu_stl_data_ra(env, addr + (0 << DF_WORD), pwd->w[0], ra);
+    cpu_stl_data_ra(env, addr + (1 << DF_WORD), pwd->w[1], ra);
+    cpu_stl_data_ra(env, addr + (2 << DF_WORD), pwd->w[2], ra);
+    cpu_stl_data_ra(env, addr + (3 << DF_WORD), pwd->w[3], ra);
 #else
-    helper_ret_stl_mmu(env, addr + (1 << DF_WORD), pwd->w[0], oi, GETPC());
-    helper_ret_stl_mmu(env, addr + (0 << DF_WORD), pwd->w[1], oi, GETPC());
-    helper_ret_stl_mmu(env, addr + (3 << DF_WORD), pwd->w[2], oi, GETPC());
-    helper_ret_stl_mmu(env, addr + (2 << DF_WORD), pwd->w[3], oi, GETPC());
-#endif
-#else
-#if !defined(HOST_WORDS_BIGENDIAN)
-    cpu_stl_data(env, addr + (0 << DF_WORD), pwd->w[0]);
-    cpu_stl_data(env, addr + (1 << DF_WORD), pwd->w[1]);
-    cpu_stl_data(env, addr + (2 << DF_WORD), pwd->w[2]);
-    cpu_stl_data(env, addr + (3 << DF_WORD), pwd->w[3]);
-#else
-    cpu_stl_data(env, addr + (1 << DF_WORD), pwd->w[0]);
-    cpu_stl_data(env, addr + (0 << DF_WORD), pwd->w[1]);
-    cpu_stl_data(env, addr + (3 << DF_WORD), pwd->w[2]);
-    cpu_stl_data(env, addr + (2 << DF_WORD), pwd->w[3]);
-#endif
+    cpu_stl_data_ra(env, addr + (1 << DF_WORD), pwd->w[0], ra);
+    cpu_stl_data_ra(env, addr + (0 << DF_WORD), pwd->w[1], ra);
+    cpu_stl_data_ra(env, addr + (3 << DF_WORD), pwd->w[2], ra);
+    cpu_stl_data_ra(env, addr + (2 << DF_WORD), pwd->w[3], ra);
 #endif
 }
 
@@ -8584,14 +8438,10 @@ void helper_msa_st_d(CPUMIPSState *env, uint32_t wd,
 {
     wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
     int mmu_idx = cpu_mmu_index(env, false);
+    uintptr_t ra = GETPC();
 
-    MEMOP_IDX(DF_DOUBLE)
     ensure_writable_pages(env, addr, mmu_idx, GETPC());
-#if !defined(CONFIG_USER_ONLY)
-    helper_ret_stq_mmu(env, addr + (0 << DF_DOUBLE), pwd->d[0], oi, GETPC());
-    helper_ret_stq_mmu(env, addr + (1 << DF_DOUBLE), pwd->d[1], oi, GETPC());
-#else
-    cpu_stq_data(env, addr + (0 << DF_DOUBLE), pwd->d[0]);
-    cpu_stq_data(env, addr + (1 << DF_DOUBLE), pwd->d[1]);
-#endif
+
+    cpu_stq_data_ra(env, addr + (0 << DF_DOUBLE), pwd->d[0], ra);
+    cpu_stq_data_ra(env, addr + (1 << DF_DOUBLE), pwd->d[1], ra);
 }
-- 
2.25.1



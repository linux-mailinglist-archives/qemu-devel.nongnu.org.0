Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E5C42B321
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 05:09:01 +0200 (CEST)
Received: from localhost ([::1]:51508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUdY-0008Ch-KY
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 23:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHx-0004wS-5I
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:42 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:41699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHs-00053K-2P
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:40 -0400
Received: by mail-pg1-x52e.google.com with SMTP id d23so878260pgh.8
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=slyF7IqLapKeWo1JxWwPfUqGwcDiZ/hynums2qQtXjA=;
 b=jZRVnYXmBkd4Xm26xudwezcNBS3hox2n+vw+Z5oqyo04uizt+kcqzTw0lxNTanzZtV
 CUF73o00EZy41wxEr5QUfaP3CDR3UyuCerbL54LjdIQWjWi1JmqxsgYSCnYo9dQmUPut
 I1TIWP5UAnTQCsA+VeD3bAH/VisTta4YLMnqsvo8HQ++JWf9RaSgeSXAhNOkF52D/8zx
 llbPVrDAoCDb6qN3bu8Gx5fHR34EoZm2D30s11OKrezuAPTUaueOkefNTXw2HrJoj07e
 xgJKBs+OUbYBTm7AqbH0SjBPXcOUzy5YbPvTPUASoSujjXpNyl0tBeZU/uIAbBGFtVJy
 dhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=slyF7IqLapKeWo1JxWwPfUqGwcDiZ/hynums2qQtXjA=;
 b=4wlD4zx1C/2rGwEkQuIpzHekg4VDTKmFodoGVm17GmZ+8IgPrcnX6llOtzPQ3AbuQP
 0jy7k1a9OqmPHu0RZKzizy0Qt+qvvcdq/sC3YsWdIz23cQK+qRTgjPSaU1n/lnDmXoao
 5TKQBOIAnLEEpuiADZyfSeSwm2RlyIbWBRRKwqnzyTPO4NwqvekxBdojXi3sSXGeSmZx
 qRu3xuFRHhZ1ya/s3EtdZ1iT+Bba4laBFru9W2iY7ZClVTY7h5SRcm7OJhDqhtuIHiz9
 Zr7rxoQP99Z5bwvb3YooYg0b1UxpTLqq5sxp1/w3s78zyc6Ly+urCxC7WoDHdyL9S3GW
 GAdw==
X-Gm-Message-State: AOAM531n7IrIfFaf79+Z69tK4LdxPFrlRGegWSmx74aa/DrBvKLacVaS
 LThb/tACnz1prW5PEiqf6KMEvR3yALBNSA==
X-Google-Smtp-Source: ABdhPJwaRZiZDPdF397vN8RlcWtnI4mI1LDURfKh31fE20fHdtKWaWK2EFp4KDq+dqdQQj6CDSIFww==
X-Received: by 2002:a05:6a00:2b1:b0:44d:b18:8192 with SMTP id
 q17-20020a056a0002b100b0044d0b188192mr18416721pfs.35.1634093194491; 
 Tue, 12 Oct 2021 19:46:34 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 25/48] target/mips: Use 8-byte memory ops for msa load/store
Date: Tue, 12 Oct 2021 19:45:44 -0700
Message-Id: <20211013024607.731881-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than use 4-16 separate operations, use 2 operations
plus some byte reordering as necessary.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/msa_helper.c | 201 +++++++++++++----------------------
 1 file changed, 71 insertions(+), 130 deletions(-)

diff --git a/target/mips/tcg/msa_helper.c b/target/mips/tcg/msa_helper.c
index a8880ce81c..e40c1b7057 100644
--- a/target/mips/tcg/msa_helper.c
+++ b/target/mips/tcg/msa_helper.c
@@ -8218,47 +8218,31 @@ void helper_msa_ffint_u_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
 #define MEMOP_IDX(DF)
 #endif
 
+#ifdef TARGET_WORDS_BIGENDIAN
+static inline uint64_t bswap16x4(uint64_t x)
+{
+    uint64_t m = 0x00ff00ff00ff00ffull;
+    return ((x & m) << 8) | ((x >> 8) & m);
+}
+
+static inline uint64_t bswap32x2(uint64_t x)
+{
+    return ror64(bswap64(x), 32);
+}
+#endif
+
 void helper_msa_ld_b(CPUMIPSState *env, uint32_t wd,
                      target_ulong addr)
 {
     wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
     uintptr_t ra = GETPC();
+    uint64_t d0, d1;
 
-#if !defined(HOST_WORDS_BIGENDIAN)
-    pwd->b[0]  = cpu_ldub_data_ra(env, addr + (0  << DF_BYTE), ra);
-    pwd->b[1]  = cpu_ldub_data_ra(env, addr + (1  << DF_BYTE), ra);
-    pwd->b[2]  = cpu_ldub_data_ra(env, addr + (2  << DF_BYTE), ra);
-    pwd->b[3]  = cpu_ldub_data_ra(env, addr + (3  << DF_BYTE), ra);
-    pwd->b[4]  = cpu_ldub_data_ra(env, addr + (4  << DF_BYTE), ra);
-    pwd->b[5]  = cpu_ldub_data_ra(env, addr + (5  << DF_BYTE), ra);
-    pwd->b[6]  = cpu_ldub_data_ra(env, addr + (6  << DF_BYTE), ra);
-    pwd->b[7]  = cpu_ldub_data_ra(env, addr + (7  << DF_BYTE), ra);
-    pwd->b[8]  = cpu_ldub_data_ra(env, addr + (8  << DF_BYTE), ra);
-    pwd->b[9]  = cpu_ldub_data_ra(env, addr + (9  << DF_BYTE), ra);
-    pwd->b[10] = cpu_ldub_data_ra(env, addr + (10 << DF_BYTE), ra);
-    pwd->b[11] = cpu_ldub_data_ra(env, addr + (11 << DF_BYTE), ra);
-    pwd->b[12] = cpu_ldub_data_ra(env, addr + (12 << DF_BYTE), ra);
-    pwd->b[13] = cpu_ldub_data_ra(env, addr + (13 << DF_BYTE), ra);
-    pwd->b[14] = cpu_ldub_data_ra(env, addr + (14 << DF_BYTE), ra);
-    pwd->b[15] = cpu_ldub_data_ra(env, addr + (15 << DF_BYTE), ra);
-#else
-    pwd->b[0]  = cpu_ldub_data_ra(env, addr + (7  << DF_BYTE), ra);
-    pwd->b[1]  = cpu_ldub_data_ra(env, addr + (6  << DF_BYTE), ra);
-    pwd->b[2]  = cpu_ldub_data_ra(env, addr + (5  << DF_BYTE), ra);
-    pwd->b[3]  = cpu_ldub_data_ra(env, addr + (4  << DF_BYTE), ra);
-    pwd->b[4]  = cpu_ldub_data_ra(env, addr + (3  << DF_BYTE), ra);
-    pwd->b[5]  = cpu_ldub_data_ra(env, addr + (2  << DF_BYTE), ra);
-    pwd->b[6]  = cpu_ldub_data_ra(env, addr + (1  << DF_BYTE), ra);
-    pwd->b[7]  = cpu_ldub_data_ra(env, addr + (0  << DF_BYTE), ra);
-    pwd->b[8]  = cpu_ldub_data_ra(env, addr + (15 << DF_BYTE), ra);
-    pwd->b[9]  = cpu_ldub_data_ra(env, addr + (14 << DF_BYTE), ra);
-    pwd->b[10] = cpu_ldub_data_ra(env, addr + (13 << DF_BYTE), ra);
-    pwd->b[11] = cpu_ldub_data_ra(env, addr + (12 << DF_BYTE), ra);
-    pwd->b[12] = cpu_ldub_data_ra(env, addr + (11 << DF_BYTE), ra);
-    pwd->b[13] = cpu_ldub_data_ra(env, addr + (10 << DF_BYTE), ra);
-    pwd->b[14] = cpu_ldub_data_ra(env, addr + (9 << DF_BYTE), ra);
-    pwd->b[15] = cpu_ldub_data_ra(env, addr + (8 << DF_BYTE), ra);
-#endif
+    /* Load 8 bytes at a time.  Vector element ordering makes this LE.  */
+    d0 = cpu_ldq_le_data_ra(env, addr + 0, ra);
+    d1 = cpu_ldq_le_data_ra(env, addr + 8, ra);
+    pwd->d[0] = d0;
+    pwd->d[1] = d1;
 }
 
 void helper_msa_ld_h(CPUMIPSState *env, uint32_t wd,
@@ -8266,26 +8250,20 @@ void helper_msa_ld_h(CPUMIPSState *env, uint32_t wd,
 {
     wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
     uintptr_t ra = GETPC();
+    uint64_t d0, d1;
 
-#if !defined(HOST_WORDS_BIGENDIAN)
-    pwd->h[0] = cpu_lduw_data_ra(env, addr + (0 << DF_HALF), ra);
-    pwd->h[1] = cpu_lduw_data_ra(env, addr + (1 << DF_HALF), ra);
-    pwd->h[2] = cpu_lduw_data_ra(env, addr + (2 << DF_HALF), ra);
-    pwd->h[3] = cpu_lduw_data_ra(env, addr + (3 << DF_HALF), ra);
-    pwd->h[4] = cpu_lduw_data_ra(env, addr + (4 << DF_HALF), ra);
-    pwd->h[5] = cpu_lduw_data_ra(env, addr + (5 << DF_HALF), ra);
-    pwd->h[6] = cpu_lduw_data_ra(env, addr + (6 << DF_HALF), ra);
-    pwd->h[7] = cpu_lduw_data_ra(env, addr + (7 << DF_HALF), ra);
-#else
-    pwd->h[0] = cpu_lduw_data_ra(env, addr + (3 << DF_HALF), ra);
-    pwd->h[1] = cpu_lduw_data_ra(env, addr + (2 << DF_HALF), ra);
-    pwd->h[2] = cpu_lduw_data_ra(env, addr + (1 << DF_HALF), ra);
-    pwd->h[3] = cpu_lduw_data_ra(env, addr + (0 << DF_HALF), ra);
-    pwd->h[4] = cpu_lduw_data_ra(env, addr + (7 << DF_HALF), ra);
-    pwd->h[5] = cpu_lduw_data_ra(env, addr + (6 << DF_HALF), ra);
-    pwd->h[6] = cpu_lduw_data_ra(env, addr + (5 << DF_HALF), ra);
-    pwd->h[7] = cpu_lduw_data_ra(env, addr + (4 << DF_HALF), ra);
+    /*
+     * Load 8 bytes at a time.  Use little-endian load, then for
+     * big-endian target, we must then swap the four halfwords.
+     */
+    d0 = cpu_ldq_le_data_ra(env, addr + 0, ra);
+    d1 = cpu_ldq_le_data_ra(env, addr + 8, ra);
+#ifdef TARGET_WORDS_BIGENDIAN
+    d0 = bswap16x4(d0);
+    d1 = bswap16x4(d1);
 #endif
+    pwd->d[0] = d0;
+    pwd->d[1] = d1;
 }
 
 void helper_msa_ld_w(CPUMIPSState *env, uint32_t wd,
@@ -8293,18 +8271,20 @@ void helper_msa_ld_w(CPUMIPSState *env, uint32_t wd,
 {
     wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
     uintptr_t ra = GETPC();
+    uint64_t d0, d1;
 
-#if !defined(HOST_WORDS_BIGENDIAN)
-    pwd->w[0] = cpu_ldl_data_ra(env, addr + (0 << DF_WORD), ra);
-    pwd->w[1] = cpu_ldl_data_ra(env, addr + (1 << DF_WORD), ra);
-    pwd->w[2] = cpu_ldl_data_ra(env, addr + (2 << DF_WORD), ra);
-    pwd->w[3] = cpu_ldl_data_ra(env, addr + (3 << DF_WORD), ra);
-#else
-    pwd->w[0] = cpu_ldl_data_ra(env, addr + (1 << DF_WORD), ra);
-    pwd->w[1] = cpu_ldl_data_ra(env, addr + (0 << DF_WORD), ra);
-    pwd->w[2] = cpu_ldl_data_ra(env, addr + (3 << DF_WORD), ra);
-    pwd->w[3] = cpu_ldl_data_ra(env, addr + (2 << DF_WORD), ra);
+    /*
+     * Load 8 bytes at a time.  Use little-endian load, then for
+     * big-endian target, we must then bswap the two words.
+     */
+    d0 = cpu_ldq_le_data_ra(env, addr + 0, ra);
+    d1 = cpu_ldq_le_data_ra(env, addr + 8, ra);
+#ifdef TARGET_WORDS_BIGENDIAN
+    d0 = bswap32x2(d0);
+    d1 = bswap32x2(d1);
 #endif
+    pwd->d[0] = d0;
+    pwd->d[1] = d1;
 }
 
 void helper_msa_ld_d(CPUMIPSState *env, uint32_t wd,
@@ -8312,9 +8292,12 @@ void helper_msa_ld_d(CPUMIPSState *env, uint32_t wd,
 {
     wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
     uintptr_t ra = GETPC();
+    uint64_t d0, d1;
 
-    pwd->d[0] = cpu_ldq_data_ra(env, addr + (0 << DF_DOUBLE), ra);
-    pwd->d[1] = cpu_ldq_data_ra(env, addr + (1 << DF_DOUBLE), ra);
+    d0 = cpu_ldq_data_ra(env, addr + 0, ra);
+    d1 = cpu_ldq_data_ra(env, addr + 8, ra);
+    pwd->d[0] = d0;
+    pwd->d[1] = d1;
 }
 
 #define MSA_PAGESPAN(x) \
@@ -8344,41 +8327,9 @@ void helper_msa_st_b(CPUMIPSState *env, uint32_t wd,
 
     ensure_writable_pages(env, addr, mmu_idx, ra);
 
-#if !defined(HOST_WORDS_BIGENDIAN)
-    cpu_stb_data_ra(env, addr + (0  << DF_BYTE), pwd->b[0], ra);
-    cpu_stb_data_ra(env, addr + (1  << DF_BYTE), pwd->b[1], ra);
-    cpu_stb_data_ra(env, addr + (2  << DF_BYTE), pwd->b[2], ra);
-    cpu_stb_data_ra(env, addr + (3  << DF_BYTE), pwd->b[3], ra);
-    cpu_stb_data_ra(env, addr + (4  << DF_BYTE), pwd->b[4], ra);
-    cpu_stb_data_ra(env, addr + (5  << DF_BYTE), pwd->b[5], ra);
-    cpu_stb_data_ra(env, addr + (6  << DF_BYTE), pwd->b[6], ra);
-    cpu_stb_data_ra(env, addr + (7  << DF_BYTE), pwd->b[7], ra);
-    cpu_stb_data_ra(env, addr + (8  << DF_BYTE), pwd->b[8], ra);
-    cpu_stb_data_ra(env, addr + (9  << DF_BYTE), pwd->b[9], ra);
-    cpu_stb_data_ra(env, addr + (10 << DF_BYTE), pwd->b[10], ra);
-    cpu_stb_data_ra(env, addr + (11 << DF_BYTE), pwd->b[11], ra);
-    cpu_stb_data_ra(env, addr + (12 << DF_BYTE), pwd->b[12], ra);
-    cpu_stb_data_ra(env, addr + (13 << DF_BYTE), pwd->b[13], ra);
-    cpu_stb_data_ra(env, addr + (14 << DF_BYTE), pwd->b[14], ra);
-    cpu_stb_data_ra(env, addr + (15 << DF_BYTE), pwd->b[15], ra);
-#else
-    cpu_stb_data_ra(env, addr + (7  << DF_BYTE), pwd->b[0], ra);
-    cpu_stb_data_ra(env, addr + (6  << DF_BYTE), pwd->b[1], ra);
-    cpu_stb_data_ra(env, addr + (5  << DF_BYTE), pwd->b[2], ra);
-    cpu_stb_data_ra(env, addr + (4  << DF_BYTE), pwd->b[3], ra);
-    cpu_stb_data_ra(env, addr + (3  << DF_BYTE), pwd->b[4], ra);
-    cpu_stb_data_ra(env, addr + (2  << DF_BYTE), pwd->b[5], ra);
-    cpu_stb_data_ra(env, addr + (1  << DF_BYTE), pwd->b[6], ra);
-    cpu_stb_data_ra(env, addr + (0  << DF_BYTE), pwd->b[7], ra);
-    cpu_stb_data_ra(env, addr + (15 << DF_BYTE), pwd->b[8], ra);
-    cpu_stb_data_ra(env, addr + (14 << DF_BYTE), pwd->b[9], ra);
-    cpu_stb_data_ra(env, addr + (13 << DF_BYTE), pwd->b[10], ra);
-    cpu_stb_data_ra(env, addr + (12 << DF_BYTE), pwd->b[11], ra);
-    cpu_stb_data_ra(env, addr + (11 << DF_BYTE), pwd->b[12], ra);
-    cpu_stb_data_ra(env, addr + (10 << DF_BYTE), pwd->b[13], ra);
-    cpu_stb_data_ra(env, addr + (9  << DF_BYTE), pwd->b[14], ra);
-    cpu_stb_data_ra(env, addr + (8  << DF_BYTE), pwd->b[15], ra);
-#endif
+    /* Store 8 bytes at a time.  Vector element ordering makes this LE.  */
+    cpu_stq_le_data_ra(env, addr + 0, pwd->d[0], ra);
+    cpu_stq_le_data_ra(env, addr + 0, pwd->d[1], ra);
 }
 
 void helper_msa_st_h(CPUMIPSState *env, uint32_t wd,
@@ -8387,28 +8338,19 @@ void helper_msa_st_h(CPUMIPSState *env, uint32_t wd,
     wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
     int mmu_idx = cpu_mmu_index(env, false);
     uintptr_t ra = GETPC();
+    uint64_t d0, d1;
 
     ensure_writable_pages(env, addr, mmu_idx, ra);
 
-#if !defined(HOST_WORDS_BIGENDIAN)
-    cpu_stw_data_ra(env, addr + (0 << DF_HALF), pwd->h[0], ra);
-    cpu_stw_data_ra(env, addr + (1 << DF_HALF), pwd->h[1], ra);
-    cpu_stw_data_ra(env, addr + (2 << DF_HALF), pwd->h[2], ra);
-    cpu_stw_data_ra(env, addr + (3 << DF_HALF), pwd->h[3], ra);
-    cpu_stw_data_ra(env, addr + (4 << DF_HALF), pwd->h[4], ra);
-    cpu_stw_data_ra(env, addr + (5 << DF_HALF), pwd->h[5], ra);
-    cpu_stw_data_ra(env, addr + (6 << DF_HALF), pwd->h[6], ra);
-    cpu_stw_data_ra(env, addr + (7 << DF_HALF), pwd->h[7], ra);
-#else
-    cpu_stw_data_ra(env, addr + (3 << DF_HALF), pwd->h[0], ra);
-    cpu_stw_data_ra(env, addr + (2 << DF_HALF), pwd->h[1], ra);
-    cpu_stw_data_ra(env, addr + (1 << DF_HALF), pwd->h[2], ra);
-    cpu_stw_data_ra(env, addr + (0 << DF_HALF), pwd->h[3], ra);
-    cpu_stw_data_ra(env, addr + (7 << DF_HALF), pwd->h[4], ra);
-    cpu_stw_data_ra(env, addr + (6 << DF_HALF), pwd->h[5], ra);
-    cpu_stw_data_ra(env, addr + (5 << DF_HALF), pwd->h[6], ra);
-    cpu_stw_data_ra(env, addr + (4 << DF_HALF), pwd->h[7], ra);
+    /* Store 8 bytes at a time.  See helper_msa_ld_h. */
+    d0 = pwd->d[0];
+    d1 = pwd->d[1];
+#ifdef TARGET_WORDS_BIGENDIAN
+    d0 = bswap16x4(d0);
+    d1 = bswap16x4(d1);
 #endif
+    cpu_stq_le_data_ra(env, addr + 0, d0, ra);
+    cpu_stq_le_data_ra(env, addr + 8, d1, ra);
 }
 
 void helper_msa_st_w(CPUMIPSState *env, uint32_t wd,
@@ -8417,20 +8359,19 @@ void helper_msa_st_w(CPUMIPSState *env, uint32_t wd,
     wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
     int mmu_idx = cpu_mmu_index(env, false);
     uintptr_t ra = GETPC();
+    uint64_t d0, d1;
 
     ensure_writable_pages(env, addr, mmu_idx, ra);
 
-#if !defined(HOST_WORDS_BIGENDIAN)
-    cpu_stl_data_ra(env, addr + (0 << DF_WORD), pwd->w[0], ra);
-    cpu_stl_data_ra(env, addr + (1 << DF_WORD), pwd->w[1], ra);
-    cpu_stl_data_ra(env, addr + (2 << DF_WORD), pwd->w[2], ra);
-    cpu_stl_data_ra(env, addr + (3 << DF_WORD), pwd->w[3], ra);
-#else
-    cpu_stl_data_ra(env, addr + (1 << DF_WORD), pwd->w[0], ra);
-    cpu_stl_data_ra(env, addr + (0 << DF_WORD), pwd->w[1], ra);
-    cpu_stl_data_ra(env, addr + (3 << DF_WORD), pwd->w[2], ra);
-    cpu_stl_data_ra(env, addr + (2 << DF_WORD), pwd->w[3], ra);
+    /* Store 8 bytes at a time.  See helper_msa_ld_w. */
+    d0 = pwd->d[0];
+    d1 = pwd->d[1];
+#ifdef TARGET_WORDS_BIGENDIAN
+    d0 = bswap32x2(d0);
+    d1 = bswap32x2(d1);
 #endif
+    cpu_stq_le_data_ra(env, addr + 0, d0, ra);
+    cpu_stq_le_data_ra(env, addr + 8, d1, ra);
 }
 
 void helper_msa_st_d(CPUMIPSState *env, uint32_t wd,
@@ -8442,6 +8383,6 @@ void helper_msa_st_d(CPUMIPSState *env, uint32_t wd,
 
     ensure_writable_pages(env, addr, mmu_idx, GETPC());
 
-    cpu_stq_data_ra(env, addr + (0 << DF_DOUBLE), pwd->d[0], ra);
-    cpu_stq_data_ra(env, addr + (1 << DF_DOUBLE), pwd->d[1], ra);
+    cpu_stq_data_ra(env, addr + 0, pwd->d[0], ra);
+    cpu_stq_data_ra(env, addr + 8, pwd->d[1], ra);
 }
-- 
2.25.1



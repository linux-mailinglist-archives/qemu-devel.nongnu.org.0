Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBABB5103CE
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:43:42 +0200 (CEST)
Received: from localhost ([::1]:33924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOHt-0002bc-V3
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5d-0002xD-DX
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:04 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:38911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5a-0003n3-IP
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:01 -0400
Received: by mail-pl1-x62f.google.com with SMTP id n18so30753088plg.5
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k0IsIX7Ck4EtbQii90oZ9+BigHGoubRwN65gCKY+dLo=;
 b=ZZiB6oo4+2NcXVazBJOgVVGMb81SxD4+NUhfjzbn9cxWxR/PPmsPXbOy95TCjf4pUK
 R/FXAMdeVvvgob5sn3DUX6LqFQN5fmgniE0Pfv758Cw9Lmo8+qneFG202kqaQKOvSn4i
 PCu9SWtIk/cWjBN6OcFTe6g7tfJgCT7Xj6zxOTOt+IHUeJhMlZcINs/2kwFxECXpJAlZ
 GcdG9chSTd7PU0RUhUqp8i9dDIy91C07wqKM3b5X/IlV3cnrNhDk5G8gR6xmDWSxh7Hh
 wl2e9a+qE0nZMv6qRrxIIlz0uRHONFXawhmQ8h0i5G9xPGI6/r8BYeZ6st/NYia6/5/H
 Z4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k0IsIX7Ck4EtbQii90oZ9+BigHGoubRwN65gCKY+dLo=;
 b=kKmIHTj4UiJot+N3b7V69YOtSLrbXJRhgYzAfbehOyYfRV6oIiZIujM0O+3zqdVH5h
 j8iKbIWI7ejJ2xsRPW7Wo78zSQIxZWE10Nk+IiqlvuzTejUjs3zVw9W7ZBIkX7+nC74Q
 DYtz6LzQzVRVzdC9V7zXVuseC7Mr+mGtZvVZuTgAg1Y26fCI7JOwdggcOz2MldnXf7gp
 EZIuYFN2kDoYY0loXLkocDAMEK7mVy0hp5FUjd/sta0VKsNSzaCYK1qDuMy+4s5tIW9i
 K3RSbbYVh8b2RIvnFE3nPvMjmcxusxrtVcEQ4e8CiXzjh8HMPGXuRcVAVMKzEOM2uB0i
 DqJw==
X-Gm-Message-State: AOAM531fOpwRcOt2BOdrBIT2d9ds81JBqME06uXu1TiEkYfH00aKDPwf
 uljFw3DMN5cCBtqrU62hlQpQr8Iu0K0IRg==
X-Google-Smtp-Source: ABdhPJz0HAPQi6F7S0zBvXn97r8dAgbeDi/F4HsputTaGmO2CbfYLHqiV/C+6Bl6ESKXjyL19b1CyQ==
X-Received: by 2002:a17:90b:1e45:b0:1d2:3ef6:18d9 with SMTP id
 pi5-20020a17090b1e4500b001d23ef618d9mr39041317pjb.221.1650990655788; 
 Tue, 26 Apr 2022 09:30:55 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:30:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/47] target/arm: Use tcg_constant in disas_ldst_*
Date: Tue, 26 Apr 2022 09:30:06 -0700
Message-Id: <20220426163043.100432-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 1caca38a79..4cdc869d52 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3693,7 +3693,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
     mop = endian | size | align;
 
     elements = (is_q ? 16 : 8) >> size;
-    tcg_ebytes = tcg_const_i64(1 << size);
+    tcg_ebytes = tcg_constant_i64(1 << size);
     for (r = 0; r < rpt; r++) {
         int e;
         for (e = 0; e < elements; e++) {
@@ -3709,7 +3709,6 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
             }
         }
     }
-    tcg_temp_free_i64(tcg_ebytes);
 
     if (!is_store) {
         /* For non-quad operations, setting a slice of the low
@@ -3839,7 +3838,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
                                 total);
     mop = finalize_memop(s, scale);
 
-    tcg_ebytes = tcg_const_i64(1 << scale);
+    tcg_ebytes = tcg_constant_i64(1 << scale);
     for (xs = 0; xs < selem; xs++) {
         if (replicate) {
             /* Load and replicate to all elements */
@@ -3861,7 +3860,6 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
         tcg_gen_add_i64(clean_addr, clean_addr, tcg_ebytes);
         rt = (rt + 1) % 32;
     }
-    tcg_temp_free_i64(tcg_ebytes);
 
     if (is_postidx) {
         if (rm == 31) {
@@ -4052,7 +4050,7 @@ static void disas_ldst_tag(DisasContext *s, uint32_t insn)
 
     if (is_zero) {
         TCGv_i64 clean_addr = clean_data_tbi(s, addr);
-        TCGv_i64 tcg_zero = tcg_const_i64(0);
+        TCGv_i64 tcg_zero = tcg_constant_i64(0);
         int mem_index = get_mem_index(s);
         int i, n = (1 + is_pair) << LOG2_TAG_GRANULE;
 
@@ -4062,7 +4060,6 @@ static void disas_ldst_tag(DisasContext *s, uint32_t insn)
             tcg_gen_addi_i64(clean_addr, clean_addr, 8);
             tcg_gen_qemu_st_i64(tcg_zero, clean_addr, mem_index, MO_UQ);
         }
-        tcg_temp_free_i64(tcg_zero);
     }
 
     if (index != 0) {
-- 
2.34.1



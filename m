Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C1E488271
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 09:40:55 +0100 (CET)
Received: from localhost ([::1]:55318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n66KW-00049P-6y
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 02:40:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65I4-0001Lu-KN
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:33:30 -0500
Received: from [2607:f8b0:4864:20::62a] (port=36860
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65I3-0003cY-5Q
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:33:24 -0500
Received: by mail-pl1-x62a.google.com with SMTP id p14so6707086plf.3
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 22:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/AYwq3dHnlsFGe0HxehxjaeDvoLxdWXzGgDqUZldkDo=;
 b=TBmM4wK2YA18yUt9+NsWvwgYuCjxSZ5BWVk7I1bBOY1bsZCnuEbgeZk5gQHAEZfxXM
 rf/wN4BTE+5/ygM7NP3YyyMkfymTQu8P9kIocaRXqi/CrMyifCoD6C/d0iLBoHDuR0mo
 kabh3z6GyL68Q+uyjMfE5+lel0VgNMUsXuBeu28ZRQU3IXGcpOHHX1NfLop1zamTy+Oy
 /RZQshH9+KUgtpFCGCkSWp9yS2RHBzQzvzpMTx2yC5OjEzz/VFW3e81XGl0iC2/z+3nG
 nl8EYwTQXr8YWf5Ugh/VNaXxZq8Jo5DrkHjLCFqjEeHbqZYBfuV8uBLQxPaE6flo+MSJ
 1Q7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/AYwq3dHnlsFGe0HxehxjaeDvoLxdWXzGgDqUZldkDo=;
 b=z3VCNlHI2w6sl1NeAf4G+f/BWnsz5g/Aa0wO5qYtR/mHb+CrhqsSPKk/G/kiDU7kda
 g89D5qnLMmUlckBBgXywfy7gXNND2nudtlfRUDtwOcXdb36iNvq90338aw0oyyf9wuhY
 DparLlUMTgeMaR30sbsBhdqCpS/q6gbZJLkHLjn7iOL9hbECofB8PSR6eLy9AbJ1tZeR
 aHwCtK8GdAtQGGvgkubhTjqaMZDXMuN34Gm5zlYLCURo0UYVNKAeTPhwryC3o8hgCIbv
 YL4EvVWtg0YncbP3FIyKy20Amj4MKbnbNmmqmKKC9FET5F1yNXGGVjm58W4Muvy36ySs
 BTwQ==
X-Gm-Message-State: AOAM530g8xp/VODls92Ed6YmIaK+sWJzpGFk8E91g3ZLLP/3AvdRhb/L
 wY93MQCT63PrGePv0pzylIoL1Z2LZExwnA==
X-Google-Smtp-Source: ABdhPJxrNG+2jljTKdsYolxSCwaoVg8OL07yoLqjVN9Dm4gS7F4yed3KIYxckLU7fIfIxY16WWqxyg==
X-Received: by 2002:a17:902:d4c8:b0:149:c99e:dd83 with SMTP id
 o8-20020a170902d4c800b00149c99edd83mr16295027plg.146.1641623601943; 
 Fri, 07 Jan 2022 22:33:21 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id s7sm834760pfu.133.2022.01.07.22.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 22:33:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/7] tcg/arm: Check alignment for ldrd and strd
Date: Fri,  7 Jan 2022 22:33:10 -0800
Message-Id: <20220108063313.477784-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220108063313.477784-1-richard.henderson@linaro.org>
References: <20220108063313.477784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will shortly allow the use of unaligned memory accesses,
and these require proper alignment.  Use get_alignment_bits
to verify and remove USING_SOFTMMU.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index ea8b90e6e2..8a20224dd1 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -35,12 +35,6 @@ bool use_neon_instructions;
 #endif
 
 /* ??? Ought to think about changing CONFIG_SOFTMMU to always defined.  */
-#ifdef CONFIG_SOFTMMU
-# define USING_SOFTMMU 1
-#else
-# define USING_SOFTMMU 0
-#endif
-
 #ifdef CONFIG_DEBUG_TCG
 static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
     "%r0",  "%r1",  "%r2",  "%r3",  "%r4",  "%r5",  "%r6",  "%r7",
@@ -1621,8 +1615,8 @@ static void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
         tcg_out_ld32_r(s, COND_AL, datalo, addrlo, addend);
         break;
     case MO_Q:
-        /* Avoid ldrd for user-only emulation, to handle unaligned.  */
-        if (USING_SOFTMMU
+        /* LDRD requires alignment; double-check that. */
+        if (get_alignment_bits(opc) >= MO_64
             && (datalo & 1) == 0 && datahi == datalo + 1) {
             tcg_out_ldrd_r(s, COND_AL, datalo, addrlo, addend);
         } else if (datalo != addend) {
@@ -1664,8 +1658,8 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg datalo,
         tcg_out_ld32_12(s, COND_AL, datalo, addrlo, 0);
         break;
     case MO_Q:
-        /* Avoid ldrd for user-only emulation, to handle unaligned.  */
-        if (USING_SOFTMMU
+        /* LDRD requires alignment; double-check that. */
+        if (get_alignment_bits(opc) >= MO_64
             && (datalo & 1) == 0 && datahi == datalo + 1) {
             tcg_out_ldrd_8(s, COND_AL, datalo, addrlo, 0);
         } else if (datalo == addrlo) {
@@ -1741,8 +1735,8 @@ static void tcg_out_qemu_st_index(TCGContext *s, ARMCond cond, MemOp opc,
         tcg_out_st32_r(s, cond, datalo, addrlo, addend);
         break;
     case MO_64:
-        /* Avoid strd for user-only emulation, to handle unaligned.  */
-        if (USING_SOFTMMU
+        /* STRD requires alignment; double-check that. */
+        if (get_alignment_bits(opc) >= MO_64
             && (datalo & 1) == 0 && datahi == datalo + 1) {
             tcg_out_strd_r(s, cond, datalo, addrlo, addend);
         } else {
@@ -1773,8 +1767,8 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg datalo,
         tcg_out_st32_12(s, COND_AL, datalo, addrlo, 0);
         break;
     case MO_64:
-        /* Avoid strd for user-only emulation, to handle unaligned.  */
-        if (USING_SOFTMMU
+        /* STRD requires alignment; double-check that. */
+        if (get_alignment_bits(opc) >= MO_64
             && (datalo & 1) == 0 && datahi == datalo + 1) {
             tcg_out_strd_8(s, COND_AL, datalo, addrlo, 0);
         } else {
-- 
2.25.1



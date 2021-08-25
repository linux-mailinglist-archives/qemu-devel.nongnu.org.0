Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4413F75E2
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:29:48 +0200 (CEST)
Received: from localhost ([::1]:56708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIsyR-0001Q9-W4
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsZc-0002na-PQ
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:04:08 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:42667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsZa-0002r0-Pc
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:04:08 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 k20-20020a05600c0b5400b002e87ad6956eso2870437wmr.1
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 06:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4siFvW7S02H4ZfJAR8lTKG1U1eRDBpwvb6iIyC7aiXg=;
 b=m5oQfoxiI11l9OIX+c4IFSXgbOwg21gKO7BiJlmXiio0jpT7s0EmGEBIhagh564aey
 f/mLRw7Sv2oxrL5ItnBpkSuRvPLxOoQpH082uNvYx2q0Se0E1ixedJ3GfjTw+ajJNVOY
 MkpsBef2S0mhbgjvzDawsj/2hks5RvkU5HX3knBwrMx2BCTbY4gLZqam10ym0u3eZGoW
 BRfGruGQ0Ydgr13akS0+jD52y7mdSUovfB/tuQ2unHplI2/uQHMLebe6yLyCGmknnyBY
 F68EfihrsFbPHeAydB+Jdpvg9JngPi/qVcxLnbCgdJACk/HX4lX42i5qe1rpHAX4rPcS
 XEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4siFvW7S02H4ZfJAR8lTKG1U1eRDBpwvb6iIyC7aiXg=;
 b=KR8xXfCEEd9dSEOGKl/oC/o9/7T3hCgwFJZ5V2u1BVj19Sv78DKeDzc0pIBXXoF2pe
 UzlK1u6fxsB6avq2kD7IUjNeuGhShVsDl1vq7Z9hOi8o2SAE6EPQGYJtAlw0ZBng4jwT
 8bn1WQAEeVOQIvZqWuv3x5Uw7cnOGdTdi/582bK/Dv+NWkUugRTomSq+zjJ3zGPQpkw1
 5PlJjCn04DTDq6YmRgWVAWFoncNI79qRKiqGK0zIquH2mfmfP+fltZTZzj/lreZ7woT9
 QGcRIw94t5Vt4V1gD+gfGc6tqkeKMLkGZM/2DceLg0SpSvog19a9Txi9TSMMvnCvMaQS
 4Wcw==
X-Gm-Message-State: AOAM530krgQznFNvOKp3oCVoIxvmzyUwdnQd/hKFqBLOheVm/99LMerT
 P06X9HzCoWQr+OuxVYzQjRLVLM8UE6g=
X-Google-Smtp-Source: ABdhPJzWabGbYBjwk9poY+dkz4WEJyhsrrCNs72s9pR698ieUbzCbBrC2NB/o5ilEWH7H9S4ocnX2w==
X-Received: by 2002:a1c:a5ca:: with SMTP id o193mr8999939wme.160.1629896644994; 
 Wed, 25 Aug 2021 06:04:04 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 m7sm5155893wmq.29.2021.08.25.06.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:04:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/28] target/mips: Call cpu_is_bigendian & inline GET_OFFSET
 in ld/st helpers
Date: Wed, 25 Aug 2021 15:02:07 +0200
Message-Id: <20210825130211.1542338-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825130211.1542338-1-f4bug@amsat.org>
References: <20210825130211.1542338-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The target endianess information is stored in the BigEndian
bit of the Config0 register in CP0.

As a first step, inline the GET_OFFSET() macro, calling
cpu_is_bigendian() to get the 'direction' of the offset.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210818215517.2560994-2-f4bug@amsat.org>
---
 target/mips/tcg/ldst_helper.c | 55 +++++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 22 deletions(-)

diff --git a/target/mips/tcg/ldst_helper.c b/target/mips/tcg/ldst_helper.c
index d42812b8a6a..8d1dfea6766 100644
--- a/target/mips/tcg/ldst_helper.c
+++ b/target/mips/tcg/ldst_helper.c
@@ -52,31 +52,36 @@ HELPER_LD_ATOMIC(lld, ldq, 0x7, (target_ulong))
 
 #endif /* !CONFIG_USER_ONLY */
 
+static inline bool cpu_is_bigendian(CPUMIPSState *env)
+{
+    return extract32(env->CP0_Config0, CP0C0_BE, 1);
+}
+
 #ifdef TARGET_WORDS_BIGENDIAN
 #define GET_LMASK(v) ((v) & 3)
-#define GET_OFFSET(addr, offset) (addr + (offset))
 #else
 #define GET_LMASK(v) (((v) & 3) ^ 3)
-#define GET_OFFSET(addr, offset) (addr - (offset))
 #endif
 
 void helper_swl(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
                 int mem_idx)
 {
+    int dir = cpu_is_bigendian(env) ? 1 : -1;
+
     cpu_stb_mmuidx_ra(env, arg2, (uint8_t)(arg1 >> 24), mem_idx, GETPC());
 
     if (GET_LMASK(arg2) <= 2) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 1), (uint8_t)(arg1 >> 16),
+        cpu_stb_mmuidx_ra(env, arg2 + 1 * dir, (uint8_t)(arg1 >> 16),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK(arg2) <= 1) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 2), (uint8_t)(arg1 >> 8),
+        cpu_stb_mmuidx_ra(env, arg2 + 2 * dir, (uint8_t)(arg1 >> 8),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK(arg2) == 0) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 3), (uint8_t)arg1,
+        cpu_stb_mmuidx_ra(env, arg2 + 3 * dir, (uint8_t)arg1,
                           mem_idx, GETPC());
     }
 }
@@ -84,20 +89,22 @@ void helper_swl(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
 void helper_swr(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
                 int mem_idx)
 {
+    int dir = cpu_is_bigendian(env) ? 1 : -1;
+
     cpu_stb_mmuidx_ra(env, arg2, (uint8_t)arg1, mem_idx, GETPC());
 
     if (GET_LMASK(arg2) >= 1) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -1), (uint8_t)(arg1 >> 8),
+        cpu_stb_mmuidx_ra(env, arg2 - 1 * dir, (uint8_t)(arg1 >> 8),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK(arg2) >= 2) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -2), (uint8_t)(arg1 >> 16),
+        cpu_stb_mmuidx_ra(env, arg2 - 2 * dir, (uint8_t)(arg1 >> 16),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK(arg2) == 3) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -3), (uint8_t)(arg1 >> 24),
+        cpu_stb_mmuidx_ra(env, arg2 - 3 * dir, (uint8_t)(arg1 >> 24),
                           mem_idx, GETPC());
     }
 }
@@ -116,40 +123,42 @@ void helper_swr(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
 void helper_sdl(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
                 int mem_idx)
 {
+    int dir = cpu_is_bigendian(env) ? 1 : -1;
+
     cpu_stb_mmuidx_ra(env, arg2, (uint8_t)(arg1 >> 56), mem_idx, GETPC());
 
     if (GET_LMASK64(arg2) <= 6) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 1), (uint8_t)(arg1 >> 48),
+        cpu_stb_mmuidx_ra(env, arg2 + 1 * dir, (uint8_t)(arg1 >> 48),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) <= 5) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 2), (uint8_t)(arg1 >> 40),
+        cpu_stb_mmuidx_ra(env, arg2 + 2 * dir, (uint8_t)(arg1 >> 40),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) <= 4) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 3), (uint8_t)(arg1 >> 32),
+        cpu_stb_mmuidx_ra(env, arg2 + 3 * dir, (uint8_t)(arg1 >> 32),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) <= 3) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 4), (uint8_t)(arg1 >> 24),
+        cpu_stb_mmuidx_ra(env, arg2 + 4 * dir, (uint8_t)(arg1 >> 24),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) <= 2) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 5), (uint8_t)(arg1 >> 16),
+        cpu_stb_mmuidx_ra(env, arg2 + 5 * dir, (uint8_t)(arg1 >> 16),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) <= 1) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 6), (uint8_t)(arg1 >> 8),
+        cpu_stb_mmuidx_ra(env, arg2 + 6 * dir, (uint8_t)(arg1 >> 8),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) <= 0) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 7), (uint8_t)arg1,
+        cpu_stb_mmuidx_ra(env, arg2 + 7 * dir, (uint8_t)arg1,
                           mem_idx, GETPC());
     }
 }
@@ -157,40 +166,42 @@ void helper_sdl(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
 void helper_sdr(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
                 int mem_idx)
 {
+    int dir = cpu_is_bigendian(env) ? 1 : -1;
+
     cpu_stb_mmuidx_ra(env, arg2, (uint8_t)arg1, mem_idx, GETPC());
 
     if (GET_LMASK64(arg2) >= 1) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -1), (uint8_t)(arg1 >> 8),
+        cpu_stb_mmuidx_ra(env, arg2 - 1 * dir, (uint8_t)(arg1 >> 8),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) >= 2) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -2), (uint8_t)(arg1 >> 16),
+        cpu_stb_mmuidx_ra(env, arg2 - 2 * dir, (uint8_t)(arg1 >> 16),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) >= 3) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -3), (uint8_t)(arg1 >> 24),
+        cpu_stb_mmuidx_ra(env, arg2 - 3 * dir, (uint8_t)(arg1 >> 24),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) >= 4) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -4), (uint8_t)(arg1 >> 32),
+        cpu_stb_mmuidx_ra(env, arg2 - 4 * dir, (uint8_t)(arg1 >> 32),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) >= 5) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -5), (uint8_t)(arg1 >> 40),
+        cpu_stb_mmuidx_ra(env, arg2 - 5 * dir, (uint8_t)(arg1 >> 40),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) >= 6) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -6), (uint8_t)(arg1 >> 48),
+        cpu_stb_mmuidx_ra(env, arg2 - 6 * dir, (uint8_t)(arg1 >> 48),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) == 7) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -7), (uint8_t)(arg1 >> 56),
+        cpu_stb_mmuidx_ra(env, arg2 - 7 * dir, (uint8_t)(arg1 >> 56),
                           mem_idx, GETPC());
     }
 }
-- 
2.31.1



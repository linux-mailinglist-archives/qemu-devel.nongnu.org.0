Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DB83F097C
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 18:46:10 +0200 (CEST)
Received: from localhost ([::1]:47958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGOhd-0005rY-Vl
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 12:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGOf5-0003Fl-O8
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 12:43:31 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGOf3-00042l-Vn
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 12:43:31 -0400
Received: by mail-wr1-x436.google.com with SMTP id f5so4438106wrm.13
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 09:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ibaxaWoB80RThVUaBh+iN68HbOGwmZxSh4QYtisHkss=;
 b=czmGEBe5T7BU0jYD3N84dQtfQbnrF4Nyio6chgwJ3Wv1T66tey+FZmwWwIJqZ4m9cb
 Cwtx2WleKANsEagaeWnPj4T9cm/JNReG0wJ35TaNRw3TFCe9hKWBDDl87ZYwGgNCDj2/
 XW1XUcl8aUeBcQuXj1uGrT1NABjAo+1vAyKkc8YlmLvX//02nZMGH27blCRtefykbdHN
 fUtWrS7VydJlvNEfKJ0cz57uIjcLO7hhsS6UZKXcFsaX22aGJ7/5+unB55SvEeJjZxQV
 5znjVtIe2CFF0VCkqXkDfWHc08UQ4SQ1qw2GQfqBCKr0xosXZ1l0KjTQXQar5sMPb1kX
 kdLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ibaxaWoB80RThVUaBh+iN68HbOGwmZxSh4QYtisHkss=;
 b=ZrJlSwLABQ6blCiZiRVRJn4rQbo1Wlsey9qGyIb+YA/0nasdTrz9Ud/P0RcP3Deens
 NLzO/qvug9dCv5MFq+RSxXoGF2DcGdoriUuaYZXy1WxjpGQljCEvbwXo60QHDMaoVZ9S
 GLg2+AmcabtkWxdYXlrdxxhrNNfMkl3IpRPcoHsT3szqLrxL1uDdgKhkDwqD00nbLRh1
 WZpigShHUgd1A1lpKMoZMLID/rtcbWIVS6Om6P6ZHxH5otqz4+O2AOe6qsxjiB5XN5p9
 mblfFr4pfBUsJDHNB6n+YEajF5hzD8BlfwdmILLz+lEli7teET/GFu9VpZtRv5bbRKRo
 ujlw==
X-Gm-Message-State: AOAM533c9w+R6Oq2JY91NutLzva9VgVM10oJMnfjhO8boIdBy/eXlX6Q
 Cn9IbiReiqHMLX52CaxoZMvUKQBt2EU=
X-Google-Smtp-Source: ABdhPJzvohUYzXt+uSKGUHToGuLwdcMG2JPREh4lwWA2NWh6IjEBW3B/3ozNkI6kb9TQcRfso6PQkw==
X-Received: by 2002:adf:f285:: with SMTP id k5mr11745547wro.117.1629305008385; 
 Wed, 18 Aug 2021 09:43:28 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id y11sm384786wru.0.2021.08.18.09.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 09:43:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] target/mips: Replace GET_OFFSET() macro by get_offset()
 function
Date: Wed, 18 Aug 2021 18:43:17 +0200
Message-Id: <20210818164321.2474534-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210818164321.2474534-1-f4bug@amsat.org>
References: <20210818164321.2474534-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The target endianess information is stored in the BigEndian
bit of the Config0 register in CP0.

As a first step, replace the GET_OFFSET() macro by an inlined
get_offset() function, passing CPUMIPSState as argument.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/ldst_helper.c | 57 +++++++++++++++++++++--------------
 1 file changed, 35 insertions(+), 22 deletions(-)

diff --git a/target/mips/tcg/ldst_helper.c b/target/mips/tcg/ldst_helper.c
index d42812b8a6a..97e7ad7d7a4 100644
--- a/target/mips/tcg/ldst_helper.c
+++ b/target/mips/tcg/ldst_helper.c
@@ -52,31 +52,44 @@ HELPER_LD_ATOMIC(lld, ldq, 0x7, (target_ulong))
 
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
 
+static inline target_ulong get_offset(CPUMIPSState *env,
+                                      target_ulong addr, int offset)
+{
+    if (cpu_is_bigendian(env)) {
+        return addr + offset;
+    } else {
+        return addr - offset;
+    }
+}
+
 void helper_swl(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
                 int mem_idx)
 {
     cpu_stb_mmuidx_ra(env, arg2, (uint8_t)(arg1 >> 24), mem_idx, GETPC());
 
     if (GET_LMASK(arg2) <= 2) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 1), (uint8_t)(arg1 >> 16),
+        cpu_stb_mmuidx_ra(env, get_offset(env, arg2, 1), (uint8_t)(arg1 >> 16),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK(arg2) <= 1) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 2), (uint8_t)(arg1 >> 8),
+        cpu_stb_mmuidx_ra(env, get_offset(env, arg2, 2), (uint8_t)(arg1 >> 8),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK(arg2) == 0) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 3), (uint8_t)arg1,
+        cpu_stb_mmuidx_ra(env, get_offset(env, arg2, 3), (uint8_t)arg1,
                           mem_idx, GETPC());
     }
 }
@@ -87,17 +100,17 @@ void helper_swr(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
     cpu_stb_mmuidx_ra(env, arg2, (uint8_t)arg1, mem_idx, GETPC());
 
     if (GET_LMASK(arg2) >= 1) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -1), (uint8_t)(arg1 >> 8),
+        cpu_stb_mmuidx_ra(env, get_offset(env, arg2, -1), (uint8_t)(arg1 >> 8),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK(arg2) >= 2) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -2), (uint8_t)(arg1 >> 16),
+        cpu_stb_mmuidx_ra(env, get_offset(env, arg2, -2), (uint8_t)(arg1 >> 16),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK(arg2) == 3) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -3), (uint8_t)(arg1 >> 24),
+        cpu_stb_mmuidx_ra(env, get_offset(env, arg2, -3), (uint8_t)(arg1 >> 24),
                           mem_idx, GETPC());
     }
 }
@@ -119,37 +132,37 @@ void helper_sdl(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
     cpu_stb_mmuidx_ra(env, arg2, (uint8_t)(arg1 >> 56), mem_idx, GETPC());
 
     if (GET_LMASK64(arg2) <= 6) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 1), (uint8_t)(arg1 >> 48),
+        cpu_stb_mmuidx_ra(env, get_offset(env, arg2, 1), (uint8_t)(arg1 >> 48),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) <= 5) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 2), (uint8_t)(arg1 >> 40),
+        cpu_stb_mmuidx_ra(env, get_offset(env, arg2, 2), (uint8_t)(arg1 >> 40),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) <= 4) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 3), (uint8_t)(arg1 >> 32),
+        cpu_stb_mmuidx_ra(env, get_offset(env, arg2, 3), (uint8_t)(arg1 >> 32),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) <= 3) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 4), (uint8_t)(arg1 >> 24),
+        cpu_stb_mmuidx_ra(env, get_offset(env, arg2, 4), (uint8_t)(arg1 >> 24),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) <= 2) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 5), (uint8_t)(arg1 >> 16),
+        cpu_stb_mmuidx_ra(env, get_offset(env, arg2, 5), (uint8_t)(arg1 >> 16),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) <= 1) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 6), (uint8_t)(arg1 >> 8),
+        cpu_stb_mmuidx_ra(env, get_offset(env, arg2, 6), (uint8_t)(arg1 >> 8),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) <= 0) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, 7), (uint8_t)arg1,
+        cpu_stb_mmuidx_ra(env, get_offset(env, arg2, 7), (uint8_t)arg1,
                           mem_idx, GETPC());
     }
 }
@@ -160,37 +173,37 @@ void helper_sdr(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
     cpu_stb_mmuidx_ra(env, arg2, (uint8_t)arg1, mem_idx, GETPC());
 
     if (GET_LMASK64(arg2) >= 1) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -1), (uint8_t)(arg1 >> 8),
+        cpu_stb_mmuidx_ra(env, get_offset(env, arg2, -1), (uint8_t)(arg1 >> 8),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) >= 2) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -2), (uint8_t)(arg1 >> 16),
+        cpu_stb_mmuidx_ra(env, get_offset(env, arg2, -2), (uint8_t)(arg1 >> 16),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) >= 3) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -3), (uint8_t)(arg1 >> 24),
+        cpu_stb_mmuidx_ra(env, get_offset(env, arg2, -3), (uint8_t)(arg1 >> 24),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) >= 4) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -4), (uint8_t)(arg1 >> 32),
+        cpu_stb_mmuidx_ra(env, get_offset(env, arg2, -4), (uint8_t)(arg1 >> 32),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) >= 5) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -5), (uint8_t)(arg1 >> 40),
+        cpu_stb_mmuidx_ra(env, get_offset(env, arg2, -5), (uint8_t)(arg1 >> 40),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) >= 6) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -6), (uint8_t)(arg1 >> 48),
+        cpu_stb_mmuidx_ra(env, get_offset(env, arg2, -6), (uint8_t)(arg1 >> 48),
                           mem_idx, GETPC());
     }
 
     if (GET_LMASK64(arg2) == 7) {
-        cpu_stb_mmuidx_ra(env, GET_OFFSET(arg2, -7), (uint8_t)(arg1 >> 56),
+        cpu_stb_mmuidx_ra(env, get_offset(env, arg2, -7), (uint8_t)(arg1 >> 56),
                           mem_idx, GETPC());
     }
 }
-- 
2.31.1



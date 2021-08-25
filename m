Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4018A3F75B9
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:18:42 +0200 (CEST)
Received: from localhost ([::1]:38360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIsnh-0003MI-AM
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsZg-0002tO-JB
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:04:13 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:53199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsZf-0002t8-4Q
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:04:12 -0400
Received: by mail-wm1-x335.google.com with SMTP id f10so14961496wml.2
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 06:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YqJT0Fe/p9d6kMQvfyYHlMwUslWVnfzG0wkISYe1e7Q=;
 b=cfNUtn2Q9e4GA62oP+dPY67nxv7JRdn7Pp2GsIAsbhMDlX7gn+vhVootIi5gYiOfp6
 nKKs9WJiGF9E78HZ34jfLCDwZj1Ubi2PQJF5vjq9fkQ8ijK5tv1dyowPyERs+NlcaADm
 tW3SghczqVJ77wAClwPf+11OeK5/3SdsFnUxavZ4iLytdo15+MexSN3WNAAarH3w2tqA
 4Fx2PSj1MYNCKKlHrLRS3NLQ5YqnZ6KTs0hGjbIi4pCsFWpbCr+qnHuu1E0T/jE2PbZn
 33RTCTWcO/0T7UrQ5z2KKjHtXv4Uyggu1uG4V4cu4Usi+Rz2TdxCOAG5sYXOMLn7YCsM
 Mg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YqJT0Fe/p9d6kMQvfyYHlMwUslWVnfzG0wkISYe1e7Q=;
 b=gvdKOcfMUWG31WvF+/F3gSrOLyvAHrw5Z3gE1MH5t2zB0aOVDwS8C3EIdgiinPEC9i
 CVYi1lhS1li/1gmYe3BfBdONQ87tcmniRFdZUG1p2TIfKh2mBQkCsChB+glmOvIcVjSK
 rgC6H4L8X7+Ws3s3E7XBjRy2LdpIWTliFYibnd6zmlCWVuKt4coehxqBO0QNiRbEoZwb
 WPyJ+mP106AJwRaroUPu/1NjvaPyUBiNgZ4iGj10tzWOpa2kC7jMFYR+rIc6dYHbY0r8
 WJpgd2dZ91gi6yTqshN8fr5FG96xVx47V6hqTn1IADbrs64fCcATt9wBwu89dy9istU1
 TVHw==
X-Gm-Message-State: AOAM531d7CO4HIlKrVEsdEn/4n7bTs54QJMXv+7g0gfSNGhsl5aQaABz
 b5kFkhwVzWSLGLdgS9apjAHff9atoe4=
X-Google-Smtp-Source: ABdhPJynRXRPSd8wWM1Cgd5VR1zx4nvKVXMEH6a/UAvdObKGDRTxAijooZAVWll1tjsBK2cREcSadQ==
X-Received: by 2002:a1c:27c2:: with SMTP id n185mr8946330wmn.20.1629896649497; 
 Wed, 25 Aug 2021 06:04:09 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 11sm5335283wmi.15.2021.08.25.06.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:04:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/28] target/mips: Replace GET_LMASK() macro by get_lmask(32)
 function
Date: Wed, 25 Aug 2021 15:02:08 +0200
Message-Id: <20210825130211.1542338-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825130211.1542338-1-f4bug@amsat.org>
References: <20210825130211.1542338-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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

Replace the GET_LMASK() macro by an inlined get_lmask() function,
passing CPUMIPSState and the word size as argument.

We can remove one use of the TARGET_WORDS_BIGENDIAN definition.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210818215517.2560994-3-f4bug@amsat.org>
---
 target/mips/tcg/ldst_helper.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/target/mips/tcg/ldst_helper.c b/target/mips/tcg/ldst_helper.c
index 8d1dfea6766..054459703aa 100644
--- a/target/mips/tcg/ldst_helper.c
+++ b/target/mips/tcg/ldst_helper.c
@@ -57,30 +57,39 @@ static inline bool cpu_is_bigendian(CPUMIPSState *env)
     return extract32(env->CP0_Config0, CP0C0_BE, 1);
 }
 
-#ifdef TARGET_WORDS_BIGENDIAN
-#define GET_LMASK(v) ((v) & 3)
-#else
-#define GET_LMASK(v) (((v) & 3) ^ 3)
-#endif
+static inline target_ulong get_lmask(CPUMIPSState *env,
+                                     target_ulong value, unsigned bits)
+{
+    unsigned mask = (bits / BITS_PER_BYTE) - 1;
+
+    value &= mask;
+
+    if (!cpu_is_bigendian(env)) {
+        value ^= mask;
+    }
+
+    return value;
+}
 
 void helper_swl(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
                 int mem_idx)
 {
+    target_ulong lmask = get_lmask(env, arg2, 32);
     int dir = cpu_is_bigendian(env) ? 1 : -1;
 
     cpu_stb_mmuidx_ra(env, arg2, (uint8_t)(arg1 >> 24), mem_idx, GETPC());
 
-    if (GET_LMASK(arg2) <= 2) {
+    if (lmask <= 2) {
         cpu_stb_mmuidx_ra(env, arg2 + 1 * dir, (uint8_t)(arg1 >> 16),
                           mem_idx, GETPC());
     }
 
-    if (GET_LMASK(arg2) <= 1) {
+    if (lmask <= 1) {
         cpu_stb_mmuidx_ra(env, arg2 + 2 * dir, (uint8_t)(arg1 >> 8),
                           mem_idx, GETPC());
     }
 
-    if (GET_LMASK(arg2) == 0) {
+    if (lmask == 0) {
         cpu_stb_mmuidx_ra(env, arg2 + 3 * dir, (uint8_t)arg1,
                           mem_idx, GETPC());
     }
@@ -89,21 +98,22 @@ void helper_swl(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
 void helper_swr(CPUMIPSState *env, target_ulong arg1, target_ulong arg2,
                 int mem_idx)
 {
+    target_ulong lmask = get_lmask(env, arg2, 32);
     int dir = cpu_is_bigendian(env) ? 1 : -1;
 
     cpu_stb_mmuidx_ra(env, arg2, (uint8_t)arg1, mem_idx, GETPC());
 
-    if (GET_LMASK(arg2) >= 1) {
+    if (lmask >= 1) {
         cpu_stb_mmuidx_ra(env, arg2 - 1 * dir, (uint8_t)(arg1 >> 8),
                           mem_idx, GETPC());
     }
 
-    if (GET_LMASK(arg2) >= 2) {
+    if (lmask >= 2) {
         cpu_stb_mmuidx_ra(env, arg2 - 2 * dir, (uint8_t)(arg1 >> 16),
                           mem_idx, GETPC());
     }
 
-    if (GET_LMASK(arg2) == 3) {
+    if (lmask == 3) {
         cpu_stb_mmuidx_ra(env, arg2 - 3 * dir, (uint8_t)(arg1 >> 24),
                           mem_idx, GETPC());
     }
-- 
2.31.1



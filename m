Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A5E3F0DC5
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 23:57:52 +0200 (CEST)
Received: from localhost ([::1]:34626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGTZH-0006XJ-Kf
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 17:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTX2-0003kK-Nr
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:55:32 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:38568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTX1-0008QN-7j
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:55:32 -0400
Received: by mail-wr1-x42a.google.com with SMTP id u16so5761828wrn.5
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 14:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W6S/3CJZSP/BlDLbxQ5gLlsNt2yHDOQ34zQ37MfEbrQ=;
 b=b6+3/2xNjkLSWfWiNMIDQ5/MX5/lojlQCmiydwKqvLNPuFLT8t3PfGCHScGVflCDfq
 6QxtFK2WsvOiHxYrf/VCKhQ1yzwtOfLu6y07HNIhh3ufi8uwGBcJElqgucTIyOzcco7W
 +D929j9WtrDm2Gs/ySvNY6LwyfMXWrcWHTLVzz0p8WqUXMu7Yu/l0Ugshvbo5Wc5hVIx
 OsKjWO1UXGOlpQ03eU0JHCILnEFcAK7jmL9iO2wKOfzXqEW09d/sx4wt2v8S3E2bo5N2
 Crwf7kbLGxhKetyRJCjG86Y3w6IBNlc7bbjwv+JE1RZokFYMODJQ91ogM3F4E2n246x/
 cCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=W6S/3CJZSP/BlDLbxQ5gLlsNt2yHDOQ34zQ37MfEbrQ=;
 b=bes9pX4jz61ylwVqN9ctcge+BUf0rVVVR955cnue8yB7tRnHkEc7AjYEF2/qCDF2pr
 DiA9H8CVsF4tu3DVZPIBnxx/KXx4ti58CPReeMkCaToNTtFw7bNQTTUTZniBOEAkOZY9
 Eolh43lmjH2TppCVh/KthKWpP0/FO20jUp8PhhuKV0eXWkoGqXa8YPd3Y1W01Y8q3kQE
 HEjag2/AtxcbF3f3+Zh4FyD0DAjpO8Q11zoNi8F4Nr74MBmVkGJMV9SzsvaE7ClT9jPU
 6uyivBVaDB8TbYavWUMKY0Q9smCZDoHQ6kdAbLC7875m0F+D2GqZDwgvT+nUB9xmCdQP
 iUvw==
X-Gm-Message-State: AOAM532mlIma3fMGAJWLJS0srux/02U+F1wD9i4H/sVqa3WfkjiOyky2
 K1p7gzGeHk279MnjospVyfYYemCASC0=
X-Google-Smtp-Source: ABdhPJzX1/txMrBVqeT2HlkG7xlPsgMSc+3tUGTInbD7KZLEvEsRmh4C8yC8etYf6lkl0lT1CwZlDg==
X-Received: by 2002:adf:c549:: with SMTP id s9mr13292557wrf.344.1629323729665; 
 Wed, 18 Aug 2021 14:55:29 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id z137sm6442070wmc.14.2021.08.18.14.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 14:55:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/5] target/mips: Replace GET_LMASK() macro by
 get_lmask(32) function
Date: Wed, 18 Aug 2021 23:55:14 +0200
Message-Id: <20210818215517.2560994-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210818215517.2560994-1-f4bug@amsat.org>
References: <20210818215517.2560994-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The target endianess information is stored in the BigEndian
bit of the Config0 register in CP0.

Replace the GET_LMASK() macro by an inlined get_lmask() function,
passing CPUMIPSState and the word size as argument.

We can remove one use of the TARGET_WORDS_BIGENDIAN definition.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/ldst_helper.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/target/mips/tcg/ldst_helper.c b/target/mips/tcg/ldst_helper.c
index 8d1dfea6766..c48a2818681 100644
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
+    if (cpu_is_bigendian(env)) {
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66188313CBA
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:10:11 +0100 (CET)
Received: from localhost ([::1]:59946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9AzC-000254-Dc
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:10:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l94oY-0003xr-BU
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:34:53 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:35483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l94oO-0003uF-9k
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:34:46 -0500
Received: by mail-wm1-x335.google.com with SMTP id j21so10197628wmj.0
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 03:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yCPs8uBbj3EM3WeNeRALMaxaZ1sbESL4fRT0Kc+6RkY=;
 b=jJyxm0V0qQiInDv9y92pmEQsyEYSwhilFeaolMc3ri+p4+BxvEvaMqUTlqI7Pfq1hD
 2kSBDCnpOD4VSBK9jzq5N2ankMI79TeezXyEqr4RuXxF1XCWy6UNjrtfZJHtSKr5Q72m
 ZlZ1sHynchg0CdPpQwp41eEO82fhINn7h5Y/YUieVjgX2AwNTF5zDeZQEbe/O3dFdKrL
 Z/v5j8t4k88UsFI8S4So3XpZltGy6J/6VBP6gHgAurXpUHEqE+2fO+Mo69r2HqMv6nLS
 LKfcA5RnS8YfNgxAqSGOsSK5RAjKFGhPR0HNVghyp81IuCvBPgLnBmkccX9PhkaungQI
 gknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yCPs8uBbj3EM3WeNeRALMaxaZ1sbESL4fRT0Kc+6RkY=;
 b=Nx7L6F3ZcdaVZHRSGFRKEP4zLHPkqgG1AeiGBsR2PrCiJ//XCfT0qoaiwnO2ZCR0Q5
 QkE6dEcUXNkYwtXzozuEx+BFNDvTspdpFc7X0BrCdCmjXws/Rizck1lB5LalOaV2B2kw
 su0mPOZaNljbRk9nMIdDamQaR1Q//DjacxNGJOcNAD4AUqp1wBdShDy427mB0B/ov7mY
 9Bu36aK1ozXgweBUBrq2gIGwNlhCeHzsWofXsL7Za93mU3XO9kgmwa8udu2fRdZlURad
 8q6x19cVzRTRlPUWqwxN0cN5jcuTHVrBwlof+eKXURZGSo+UXfqskl64Uwwfu16HFXSf
 jr7A==
X-Gm-Message-State: AOAM533XUbzrLh+1jZv71tsYMyj4VHsOg/Hk8A6emxY0xBDToq+H9ndg
 N1fFRr4VNBo11eL3hxUXMCvR8DQfqgmLQw==
X-Google-Smtp-Source: ABdhPJzuzeAnwpoy4GwrbxIVLFdpjBltE+104fo2yeHjNQxv8S2pwsi2mj1nhkMW2x4+1hQ84A6vsg==
X-Received: by 2002:a1c:4d05:: with SMTP id o5mr14250483wmh.51.1612784075058; 
 Mon, 08 Feb 2021 03:34:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a21sm16818134wmb.5.2021.02.08.03.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 03:34:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] target/ppc: Drop use of gdb_get_float64() and ldfq_p()
Date: Mon,  8 Feb 2021 11:34:26 +0000
Message-Id: <20210208113428.7181-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210208113428.7181-1-peter.maydell@linaro.org>
References: <20210208113428.7181-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We used to make a distinction between 'float64'/'float32' types and
the 'uint64_t'/'uint32_t' types, requiring special conversion
operations to go between them.  We've now dropped this distinction as
unnecessary, and the 'float*' types remain primarily for
documentation purposes when used in places like the function
prototypes of TCG helper functions.

This means that there's no need for a special gdb_get_float64()
function to write a float64 value to the GDB protocol buffer; we can
just use gdb_get_reg64().

Similarly, for reading a value out of the GDB buffer into a float64
we can use ldq_p() and need not use ldfq_p().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/ppc/gdbstub.c            | 8 ++++----
 target/ppc/translate_init.c.inc | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index 01459dd31d2..c28319fb974 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -130,7 +130,7 @@ int ppc_cpu_gdb_read_register(CPUState *cs, GByteArray *buf, int n)
         gdb_get_regl(buf, env->gpr[n]);
     } else if (n < 64) {
         /* fprs */
-        gdb_get_float64(buf, *cpu_fpr_ptr(env, n - 32));
+        gdb_get_reg64(buf, *cpu_fpr_ptr(env, n - 32));
     } else {
         switch (n) {
         case 64:
@@ -184,7 +184,7 @@ int ppc_cpu_gdb_read_register_apple(CPUState *cs, GByteArray *buf, int n)
         gdb_get_reg64(buf, env->gpr[n]);
     } else if (n < 64) {
         /* fprs */
-        gdb_get_float64(buf, *cpu_fpr_ptr(env, n - 32));
+        gdb_get_reg64(buf, *cpu_fpr_ptr(env, n - 32));
     } else if (n < 96) {
         /* Altivec */
         gdb_get_reg64(buf, n - 64);
@@ -241,7 +241,7 @@ int ppc_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
         env->gpr[n] = ldtul_p(mem_buf);
     } else if (n < 64) {
         /* fprs */
-        *cpu_fpr_ptr(env, n - 32) = ldfq_p(mem_buf);
+        *cpu_fpr_ptr(env, n - 32) = ldq_p(mem_buf);
     } else {
         switch (n) {
         case 64:
@@ -291,7 +291,7 @@ int ppc_cpu_gdb_write_register_apple(CPUState *cs, uint8_t *mem_buf, int n)
         env->gpr[n] = ldq_p(mem_buf);
     } else if (n < 64) {
         /* fprs */
-        *cpu_fpr_ptr(env, n - 32) = ldfq_p(mem_buf);
+        *cpu_fpr_ptr(env, n - 32) = ldq_p(mem_buf);
     } else {
         switch (n) {
         case 64 + 32:
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 9867d0a6e4a..7bd111d905e 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -9907,7 +9907,7 @@ static int gdb_get_float_reg(CPUPPCState *env, GByteArray *buf, int n)
 {
     uint8_t *mem_buf;
     if (n < 32) {
-        gdb_get_float64(buf, *cpu_fpr_ptr(env, n));
+        gdb_get_reg64(buf, *cpu_fpr_ptr(env, n));
         mem_buf = gdb_get_reg_ptr(buf, 8);
         ppc_maybe_bswap_register(env, mem_buf, 8);
         return 8;
@@ -9925,7 +9925,7 @@ static int gdb_set_float_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
 {
     if (n < 32) {
         ppc_maybe_bswap_register(env, mem_buf, 8);
-        *cpu_fpr_ptr(env, n) = ldfq_p(mem_buf);
+        *cpu_fpr_ptr(env, n) = ldq_p(mem_buf);
         return 8;
     }
     if (n == 32) {
-- 
2.20.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FBB5B8A27
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 16:16:18 +0200 (CEST)
Received: from localhost ([::1]:44228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYTBZ-0001Fv-R2
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 10:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYSMF-0007sP-QV
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 09:23:15 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYSME-0000aW-5k
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 09:23:15 -0400
Received: by mail-wr1-x431.google.com with SMTP id bo13so9176147wrb.1
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 06:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=KfQlb4Kf/qCPlICOyHg/LYLEi3mUvRQuhI0h+42sfkk=;
 b=jvpEOt99C5m7h8E77uvE264WK2oedEd/sTUfW1MGIytU3fVdm0OmRrk9OTNR+Gu7x5
 A11Kp32L354S7DWiCPrTEcHHAjwPXhsC9ffZzVMSvWwTaUqeupujsu7CLc09xKBlRZma
 vCGlQIHKPkntz5BvA0o3txCvgzvLqYhfZBrn2CkBoYSTHnoEj49F2zz1zWPRxFjim14N
 sHT1pjJuYFWA4faZG6tltGd8JmIR8ADODoiWPdszQX1kVShXSCKqIH9iTgc3E0fqI8o/
 w+0FqeDBsgy2fuYhH52BR8+lWXlmA9M75Z50OH6J52VWafB6VKVogiU9E5tNpHoGyicG
 G9PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=KfQlb4Kf/qCPlICOyHg/LYLEi3mUvRQuhI0h+42sfkk=;
 b=2W+zXrrOA486BebAP9gKsKIJYiY2TiyZwPB+hflGt2nHWCTvoGLxw313enKsKqrnZg
 ZHF1xD5Gpn1Ybu/6jhwu0aljjNKvFMQr4b4ZwlEJnCn5w9E1kGH/6c7qYwyi3dG8D4CY
 Jm3owfD40hnx7CThb2YX0Au/aE0T4nKXlCD3dX9t4e8nDz8S5t+gDvLmvAgo3C4Zi2L3
 WfznuVXj2CtL5wQ9zj/+gNmxE7WV0dK6Ni161L+FBWv8pItsaaBEjnlAgpWUnPARo5Rt
 3u2SzfIGlbvjkRyjzmlbhvUbje6gTjP1mj/wmPcpiElBdfw+pQ2k14pP1qd2ECVnaaAw
 cG2w==
X-Gm-Message-State: ACgBeo0nRINrnlIwdIHZYi/CJwpqHXNh0SIynjz2IDWpWcJtZK+CL2U3
 eG6QcqKn22WF+kfKZ1aoQoP9RPaCpRG4goW1
X-Google-Smtp-Source: AA6agR72m3jlsihLrj7xQyZiGIkPWhTy0S+uP2+T0jTsJq/75nbuWTjmUlMkthV9m8epXo3hOpw/+Q==
X-Received: by 2002:a05:6000:1189:b0:228:62c7:7e6c with SMTP id
 g9-20020a056000118900b0022862c77e6cmr22490110wrx.716.1663161792683; 
 Wed, 14 Sep 2022 06:23:12 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 p15-20020a5d48cf000000b00226dedf1ab7sm13768244wrs.76.2022.09.14.06.23.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 06:23:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/11] target/nios2: Convert semihosting errno to gdb remote
 errno
Date: Wed, 14 Sep 2022 14:22:59 +0100
Message-Id: <20220914132308.118495-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914132308.118495-1-richard.henderson@linaro.org>
References: <20220914132308.118495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The semihosting abi used by nios2 uses the gdb remote
protocol filesys errnos.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/nios2-semi.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c
index 614fd76695..f76e8588c5 100644
--- a/target/nios2/nios2-semi.c
+++ b/target/nios2/nios2-semi.c
@@ -43,6 +43,35 @@
 #define HOSTED_ISATTY 12
 #define HOSTED_SYSTEM 13
 
+static int host_to_gdb_errno(int err)
+{
+#define E(X)  case E##X: return GDB_E##X
+    switch (err) {
+    E(PERM);
+    E(NOENT);
+    E(INTR);
+    E(BADF);
+    E(ACCES);
+    E(FAULT);
+    E(BUSY);
+    E(EXIST);
+    E(NODEV);
+    E(NOTDIR);
+    E(ISDIR);
+    E(INVAL);
+    E(NFILE);
+    E(MFILE);
+    E(FBIG);
+    E(NOSPC);
+    E(SPIPE);
+    E(ROFS);
+    E(NAMETOOLONG);
+    default:
+        return GDB_EUNKNOWN;
+    }
+#undef E
+}
+
 static void nios2_semi_u32_cb(CPUState *cs, uint64_t ret, int err)
 {
     Nios2CPU *cpu = NIOS2_CPU(cs);
@@ -50,7 +79,7 @@ static void nios2_semi_u32_cb(CPUState *cs, uint64_t ret, int err)
     target_ulong args = env->regs[R_ARG1];
 
     if (put_user_u32(ret, args) ||
-        put_user_u32(err, args + 4)) {
+        put_user_u32(host_to_gdb_errno(err), args + 4)) {
         /*
          * The nios2 semihosting ABI does not provide any way to report this
          * error to the guest, so the best we can do is log it in qemu.
@@ -69,7 +98,7 @@ static void nios2_semi_u64_cb(CPUState *cs, uint64_t ret, int err)
 
     if (put_user_u32(ret >> 32, args) ||
         put_user_u32(ret, args + 4) ||
-        put_user_u32(err, args + 8)) {
+        put_user_u32(host_to_gdb_errno(err), args + 8)) {
         /* No way to report this via nios2 semihosting ABI; just log it */
         qemu_log_mask(LOG_GUEST_ERROR, "nios2-semihosting: return value "
                       "discarded because argument block not writable\n");
-- 
2.34.1



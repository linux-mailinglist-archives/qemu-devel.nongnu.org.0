Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E3E55C092
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 13:09:16 +0200 (CEST)
Received: from localhost ([::1]:55750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o695n-0005jx-Tv
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 07:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o68xv-0002mY-U6
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:01:10 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:38853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o68xp-0007kf-Q4
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:01:03 -0400
Received: by mail-pl1-x630.google.com with SMTP id m14so10748996plg.5
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 04:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xcxh7ubUhJGco7vRyAEMpV91NTEHoXb+MMYx1sQcaR0=;
 b=MRu/k47ZEKJvpXEdUMOfIu91OEloqcp01Iq8v6Go0z4H0o+qgblYjliQlm/kP6KZI+
 XEluw1nBMt/ib6oOQGIwe2HKuLq5uGLP79djq532WPyUFyyUhk5iDpeBhY4Rz7udUdJm
 myq9C1XxY8P0bsI+AESQvzQZ4HgN0ThwUlU5G7oo6o7sRRvBgpteBRD8ahhXyb2p5BYk
 8gJQwV17s3mLwFHPgPGGr7ZhBzCIatVMli3D48Z5HYqTcT/V4ark27rLw0yKemMGMwPD
 7f8nTUwyqzADNXQWjXJds0DIakesDELN0CZejHPpF75O+6Ga/JAa4rqAL9avjMRRB1vg
 VHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xcxh7ubUhJGco7vRyAEMpV91NTEHoXb+MMYx1sQcaR0=;
 b=7NnhooUulO58qvaUrxr1zy61Gj9GGHhYzspDWe+ttiRw5X39B/aNYxz8sisVaqjd9e
 HptF9IQSK9bacYNm0KsHlzx8845jpkQd7cMrJpvBfVAYE0KlkxAkKCfGFxmmT/MFdS6a
 zHQY7Sd6twLTnae90OgMgLM+EsMmOPP0OA0y7djk/9P5YXBSSW9GIR1TBW8Amuk2f2SL
 L7OwLQDbfNIne35O6Lkd5uVdPQ219Pm71H9V8Vsza/6lwe1IGXV2Gl9wmlom64NBjbEn
 U1Wj9tKaQKkt7wCm0RXwEP+I6PBrlZSSzuDo7LCbFoC0VeMhQy4k7l4lT4RBwzJ9RL+l
 CGXQ==
X-Gm-Message-State: AJIora83q0WB3PnY9Eg5ebA/WFzNu4Fmh7/D3o4pK+TIxZlz6r0GrGOY
 Rtkj5i9xfeyhX0wy4DW5dJp9Jqc3sbFTCg==
X-Google-Smtp-Source: AGRyM1us0FlIzCq9gJn1QvWp6RHHv/gNqe3qKK33ZdkF4+COn90Q3pRHXhnLHQqvgsBjKGZKmiz0mA==
X-Received: by 2002:a17:902:ea02:b0:16a:57bb:d344 with SMTP id
 s2-20020a170902ea0200b0016a57bbd344mr3064626plg.150.1656414059967; 
 Tue, 28 Jun 2022 04:00:59 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 p22-20020a1709027ed600b0016a0fe1a1fbsm9044501plb.220.2022.06.28.04.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 04:00:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v5 2/2] target/m68k: Convert semihosting errno to gdb remote
 errno
Date: Tue, 28 Jun 2022 16:30:47 +0530
Message-Id: <20220628110047.666612-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628110047.666612-1-richard.henderson@linaro.org>
References: <20220628110047.666612-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

The semihosting abi used by m68k uses the gdb remote
protocol filesys errnos.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/m68k-semi.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
index 586a801034..87b1314925 100644
--- a/target/m68k/m68k-semi.c
+++ b/target/m68k/m68k-semi.c
@@ -41,6 +41,35 @@
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
 static void m68k_semi_u32_cb(CPUState *cs, uint64_t ret, int err)
 {
     M68kCPU *cpu = M68K_CPU(cs);
@@ -48,7 +77,7 @@ static void m68k_semi_u32_cb(CPUState *cs, uint64_t ret, int err)
 
     target_ulong args = env->dregs[1];
     if (put_user_u32(ret, args) ||
-        put_user_u32(err, args + 4)) {
+        put_user_u32(host_to_gdb_errno(err), args + 4)) {
         /*
          * The m68k semihosting ABI does not provide any way to report this
          * error to the guest, so the best we can do is log it in qemu.
@@ -67,7 +96,7 @@ static void m68k_semi_u64_cb(CPUState *cs, uint64_t ret, int err)
     target_ulong args = env->dregs[1];
     if (put_user_u32(ret >> 32, args) ||
         put_user_u32(ret, args + 4) ||
-        put_user_u32(err, args + 8)) {
+        put_user_u32(host_to_gdb_errno(err), args + 8)) {
         /* No way to report this via m68k semihosting ABI; just log it */
         qemu_log_mask(LOG_GUEST_ERROR, "m68k-semihosting: return value "
                       "discarded because argument block not writable\n");
-- 
2.34.1



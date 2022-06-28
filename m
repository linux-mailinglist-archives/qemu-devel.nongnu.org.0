Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C108355C0A8
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 13:25:03 +0200 (CEST)
Received: from localhost ([::1]:49326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o69L4-0004lz-RW
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 07:25:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o69Hx-0001mr-T6
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:21:51 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:33435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o69Hw-0003oM-9C
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:21:49 -0400
Received: by mail-pl1-x62d.google.com with SMTP id n10so10833625plp.0
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 04:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KfQlb4Kf/qCPlICOyHg/LYLEi3mUvRQuhI0h+42sfkk=;
 b=LzmloAUAiYxjKXdf2JqUqvP9onq9whuCi9ADdxk7ahIjjKlFXoMgm0mpMGdSJDj0rK
 Az4J52T3Y0yWxRQx2tRvUOLfExqVpLGdoVXdOyFoMWv/RIM+A1A28eAc5zE5Eg07FK7J
 3sfk7HNQZ+5kwzVk+ta+GPMJrn60gw1y/6YLqXshsCpUMnxBQRIK2j5yKLNNA0QJRATx
 32I54q8tINRzxc0WmQMMCmv+EtmxZcdbrVdBk8gi33p8xhovPQ+Ct/25zEZAWFhC+I+E
 PgNJkFxgfMrWKk9BpSpQXemDU3vyU+ssVRPD3q2bpQ4GDQfm2sJ/5+Jrl2MAM97XOYg2
 EzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KfQlb4Kf/qCPlICOyHg/LYLEi3mUvRQuhI0h+42sfkk=;
 b=yUh0l266rCDX/cSFkJl7sQtynoubxSHeyrrsjsyaYGzq58GGa1qyH2MMVDGEuoe/ZN
 j/4gCpkvURwc9SYgio/x955qsRFlOmcvVUcNcuExJp9Ec+xnXATtom7JKbqFhn8fgVaI
 LozrNZnT4pwqC9w9dYCVEwo7WlRGkZmgVg0fsQnLMkD2qrRN8wNTAiUQ6T5EGXx/0mlz
 ncNXV2oeeFuSGhO+3ddyLJwCOPGOl43eONCZfM6ysvwiY2YjSr5x7KOcSGyQxq/ACXCk
 p7rK5MC+j5mzuEpQ2xBAd0uMSVXuaBVaxLdMBdAb9rRhRn5+g/wn8SmhWoAc2OdPtVkR
 7ETQ==
X-Gm-Message-State: AJIora+nXy8Hduueu5ynJUhwT1TqX6wMjneQwAPz/xGI8tVc7Zdg8if1
 Wa8qRZ51pt1OUOrrZOEkc0N7/YXk7wN1SA==
X-Google-Smtp-Source: AGRyM1vvsAahrxNKXNZ+Qchzcs89PQMAuWYBdWnB0iMWQD2MhJc4DPG97To40tKVEbbDVsOiErogrA==
X-Received: by 2002:a17:90b:2c47:b0:1ec:f52d:90dd with SMTP id
 rw7-20020a17090b2c4700b001ecf52d90ddmr26124023pjb.221.1656415306727; 
 Tue, 28 Jun 2022 04:21:46 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g19-20020a62e313000000b0051ba8b742e4sm9192177pfh.69.2022.06.28.04.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 04:21:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org,
	peter.maydell@linaro.org
Subject: [PATCH v5 2/2] target/nios2: Convert semihosting errno to gdb remote
 errno
Date: Tue, 28 Jun 2022 16:51:35 +0530
Message-Id: <20220628112135.685617-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628112135.685617-1-richard.henderson@linaro.org>
References: <20220628112135.685617-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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



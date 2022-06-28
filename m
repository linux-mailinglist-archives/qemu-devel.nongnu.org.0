Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C656F55BF08
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 09:23:12 +0200 (CEST)
Received: from localhost ([::1]:35482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o65Z1-00030T-S2
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 03:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63K3-0002e1-2P
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:36 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:45574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63K1-0000an-5t
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:34 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 g20-20020a17090a579400b001ed52939d72so6024074pji.4
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QTidsW/sRsHGcxNCrK3b1asXzS4RAQoz54ikW3J5w+g=;
 b=PdP3BM1y/ajBZm0VBpLOGB93nY0LP6UWQeDY/EsgTvncT3NpKEEgADJLio+Qsj0VTu
 n5L0Iqrl/3vmM/X6i4scTGY+fn9rCHmUzDsc4ouw1FBaCXyryxfVoGoebh4xAIiGFVq+
 4gMmm9M3YYLfjk9S8xV9RqiO8Avvkp2keWeD5X3NOCxVui4fTh/LWBj07KmSJ65tWqJ6
 xmEUfFPxdvd/F9BX9tSRpqMCBDTPiMIp/KVTcOeJt21odExscFQ21+gh/7KG/KVbV30V
 Nc0WSmgvIaEb2///sNYisysnlYLyx7X+0x2XKFziROQk+dVLfpUqsfDGzYdYkEwldMoC
 2qbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QTidsW/sRsHGcxNCrK3b1asXzS4RAQoz54ikW3J5w+g=;
 b=ofK+dTlZlfMTeijA2bXX9K/hSEEjIJUARtspWehJhNTNc8PF++pqWgBU43P722Q2Xe
 MTToUoSnx2pIHt1GLoPZy659k3Tx4g/0thRnLYtggui1IgoHOs6NNvLx4ipGA9lYTtCb
 Xz1fJvetzqhidnS7DrnuqjahwhEIAasdLeuJKu2bLcdUFmGaf9VBtkGVp9SSHuMaz0tT
 jL+L1JwvQZduK+9MRPYl2t9UXgZKQ5mZbf7mieh0fCzMxcWxH+Y4qnDdq+BXlvCfxkFb
 2fSChH8PbeiYIpSbfErdBLjPyzbCk2QEhivtCOP88iz3I4zpV7dzKdB3AWt9NWWlkf7+
 7tgA==
X-Gm-Message-State: AJIora9Oy4U2KjwWKKnJqqHLcT2heSHCJWPqxyuqn8tBGFAbImKKSB3W
 8fuw2julfRDnPmW9aX8E2NDyZDW9Z0JJEg==
X-Google-Smtp-Source: AGRyM1szcLzcqmTB/uwBqSTIhAJMqoFIpXuZobCcB1DFsyMPQDwKNWG5iJ3midjwQaqo+f+TWMRGqg==
X-Received: by 2002:a17:90b:4a0b:b0:1ed:4a56:d805 with SMTP id
 kk11-20020a17090b4a0b00b001ed4a56d805mr16629093pjb.246.1656392371419; 
 Mon, 27 Jun 2022 21:59:31 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y7-20020aa78f27000000b00522c0a75c39sm8259686pfr.196.2022.06.27.21.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:59:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 58/60] target/mips: Drop pread and pwrite syscalls from
 semihosting
Date: Tue, 28 Jun 2022 10:24:01 +0530
Message-Id: <20220628045403.508716-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

We don't implement it with _WIN32 hosts, and the syscalls
are missing from the gdb remote file i/o interface.
Since we can't implement them universally, drop them.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/sysemu/mips-semi.c | 39 ++++++------------------------
 1 file changed, 7 insertions(+), 32 deletions(-)

diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index 2a039baf4c..67c35fe7f9 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -182,8 +182,8 @@ static int get_open_flags(target_ulong target_flags)
     return open_flags;
 }
 
-static int write_to_file(CPUMIPSState *env, target_ulong fd, target_ulong vaddr,
-                         target_ulong len, target_ulong offset)
+static int write_to_file(CPUMIPSState *env, target_ulong fd,
+                         target_ulong vaddr, target_ulong len)
 {
     int num_of_bytes;
     void *dst = lock_user(VERIFY_READ, vaddr, len, 1);
@@ -192,23 +192,14 @@ static int write_to_file(CPUMIPSState *env, target_ulong fd, target_ulong vaddr,
         return -1;
     }
 
-    if (offset) {
-#ifdef _WIN32
-        num_of_bytes = 0;
-#else
-        num_of_bytes = pwrite(fd, dst, len, offset);
-#endif
-    } else {
-        num_of_bytes = write(fd, dst, len);
-    }
+    num_of_bytes = write(fd, dst, len);
 
     unlock_user(dst, vaddr, 0);
     return num_of_bytes;
 }
 
 static int read_from_file(CPUMIPSState *env, target_ulong fd,
-                          target_ulong vaddr, target_ulong len,
-                          target_ulong offset)
+                          target_ulong vaddr, target_ulong len)
 {
     int num_of_bytes;
     void *dst = lock_user(VERIFY_WRITE, vaddr, len, 0);
@@ -217,15 +208,7 @@ static int read_from_file(CPUMIPSState *env, target_ulong fd,
         return -1;
     }
 
-    if (offset) {
-#ifdef _WIN32
-        num_of_bytes = 0;
-#else
-        num_of_bytes = pread(fd, dst, len, offset);
-#endif
-    } else {
-        num_of_bytes = read(fd, dst, len);
-    }
+    num_of_bytes = read(fd, dst, len);
 
     unlock_user(dst, vaddr, len);
     return num_of_bytes;
@@ -312,11 +295,11 @@ void mips_semihosting(CPUMIPSState *env)
         gpr[3] = errno_mips(errno);
         break;
     case UHI_read:
-        gpr[2] = read_from_file(env, gpr[4], gpr[5], gpr[6], 0);
+        gpr[2] = read_from_file(env, gpr[4], gpr[5], gpr[6]);
         gpr[3] = errno_mips(errno);
         break;
     case UHI_write:
-        gpr[2] = write_to_file(env, gpr[4], gpr[5], gpr[6], 0);
+        gpr[2] = write_to_file(env, gpr[4], gpr[5], gpr[6]);
         gpr[3] = errno_mips(errno);
         break;
     case UHI_lseek:
@@ -382,14 +365,6 @@ void mips_semihosting(CPUMIPSState *env)
         FREE_TARGET_STRING(p, gpr[4]);
         abort();
         break;
-    case UHI_pread:
-        gpr[2] = read_from_file(env, gpr[4], gpr[5], gpr[6], gpr[7]);
-        gpr[3] = errno_mips(errno);
-        break;
-    case UHI_pwrite:
-        gpr[2] = write_to_file(env, gpr[4], gpr[5], gpr[6], gpr[7]);
-        gpr[3] = errno_mips(errno);
-        break;
 #ifndef _WIN32
     case UHI_link:
         GET_TARGET_STRINGS_2(p, gpr[4], p2, gpr[5]);
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C7C518F8B
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:57:49 +0200 (CEST)
Received: from localhost ([::1]:43922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzae-0007Wr-Af
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZi-00008p-1m
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:46 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:36739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZg-0006Lz-9L
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:45 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 gj17-20020a17090b109100b001d8b390f77bso3236773pjb.1
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vchvWnQo4YVofH3IH1WWni/usGrLZ5KUM5YMsZGZNkI=;
 b=S19xWTONITFI2jr+My+2I/32WrEJeYsStXMuRPt9I8KOqL9hqX8GHNUUQJEA8mrQsN
 jpNP1tPSEzf2w/Qo9DhaJA1+YnOrZeBaIkDyPCfppwwPA8bzVNtPF9xowqF4sihMQdA8
 gdnpCKLZecJAv36P/Al/1aIQmFzuSxcX/m8x+tTdFoxnQqNCrHtXa9i7VbHou3Mxxi06
 CTyj97zXuC3aKK1wQPQ9T6Z0uU3Y+1yTaQVWLJettVT7M2LqLENXaCRzmI5Cvk8Ba3cG
 wFl2RKgMqTcEIm7cQ5sHzS3xueUBRef7Tr8ch3M66yS263y6r//3MPf6ICSdah4N+5a6
 2d6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vchvWnQo4YVofH3IH1WWni/usGrLZ5KUM5YMsZGZNkI=;
 b=BZeIqw6r3fyzbwaV+W8kLG7TNbFLNpyCcW+0gVTvGlccEKmt0aDH9+/4kKfpODeMMY
 hin/X9rdQccji6zJMOoMNvRqS0pDYX/8HwRCyKoPMs71XigZ40Znt5FfDCOBdzcJy5xe
 hZS1h4WS0tmIqruLo1f+oKNZjxxyZGV3gfwCvJAKC/we6AIkQoE3UNtMK+YVrn3Fl7EG
 ZacqXUNQK4/QRDmdlAFZWKTzW9ILvicoDShyETnM3J7su/SJhb9s1NFT4wWcNnk3OXQL
 48pYSz5mCZqMJRAW7NTihPeVNEZXSt17W7b8fV2iFlp9uVGsd+ki8yqU+fAEtAUSeLXE
 Kz0A==
X-Gm-Message-State: AOAM533QaBExhbKtOcm20Wr1sqBBrJ6748uDPbaZ4I6dwP3suj++bz/4
 CVQpLlDvWX1C+LvxUUYYnI6VSvoLScdIQA==
X-Google-Smtp-Source: ABdhPJw9mC62dckBhAiUmhJrhuDZM+gfZOMBSgI6dzX1rNqWbgNy4+bnrjhgfR6QDM29uEUX7Cv2rQ==
X-Received: by 2002:a17:90b:1bc4:b0:1dc:2133:2e01 with SMTP id
 oa4-20020a17090b1bc400b001dc21332e01mr6564571pjb.221.1651607563037; 
 Tue, 03 May 2022 12:52:43 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a17090b025000b001dbe11be891sm1692286pjb.44.2022.05.03.12.52.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:52:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 58/74] target/mips: Drop pread and pwrite syscalls from
 semihosting
Date: Tue,  3 May 2022 12:48:27 -0700
Message-Id: <20220503194843.1379101-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/sysemu/mips-semi.c | 39 ++++++------------------------
 1 file changed, 7 insertions(+), 32 deletions(-)

diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index 254c7fad9a..93c9d3d0b3 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -188,8 +188,8 @@ static int get_open_flags(target_ulong target_flags)
     return open_flags;
 }
 
-static int write_to_file(CPUMIPSState *env, target_ulong fd, target_ulong vaddr,
-                         target_ulong len, target_ulong offset)
+static int write_to_file(CPUMIPSState *env, target_ulong fd,
+                         target_ulong vaddr, target_ulong len)
 {
     int num_of_bytes;
     void *dst = lock_user(VERIFY_READ, vaddr, len, 1);
@@ -197,23 +197,14 @@ static int write_to_file(CPUMIPSState *env, target_ulong fd, target_ulong vaddr,
         report_fault(env);
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
@@ -221,15 +212,7 @@ static int read_from_file(CPUMIPSState *env, target_ulong fd,
         report_fault(env);
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
@@ -309,11 +292,11 @@ void mips_semihosting(CPUMIPSState *env)
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
@@ -379,14 +362,6 @@ void mips_semihosting(CPUMIPSState *env)
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
     default:
         error_report("Unknown UHI operation %d", op);
         abort();
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C89542149
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 07:34:28 +0200 (CEST)
Received: from localhost ([::1]:56990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyoKp-0006pr-FQ
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 01:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyo6m-0006u7-F3
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:19:57 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:51941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyo6k-00022n-2R
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:19:56 -0400
Received: by mail-pj1-x102d.google.com with SMTP id cx11so17604822pjb.1
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 22:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vchvWnQo4YVofH3IH1WWni/usGrLZ5KUM5YMsZGZNkI=;
 b=HO93Od8Vu9r1/7Kh/vDT8rMHYrZUCwZlEUwD7ybT0KMJJGpaehkDXxlBKXRotfBuvL
 rlsT3h/MR8tJHQ2EuMz9yZw3pCN7gDJDhAzboNaIilqpj+6WVhuXVtc/+B1BqPcu5jD2
 i/sdaq04RFONOuKrsgoE+Go4Qn4VyfXOvkLgNO6nXrMcuNG+AR5uK3XC8cs0UoT3XgMz
 x8O4vba/txcRUZ1ap17I9dohaiXDS2l9/2z/EVk9of8onkkNfSSgUY5PLeF0F+N32rou
 AgfYb2+BATJy7gg/YrfJlBmS1ympWgSwNSm9nQloQU8xKqVgiVdFalG6d4SdIGoIuhX5
 H28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vchvWnQo4YVofH3IH1WWni/usGrLZ5KUM5YMsZGZNkI=;
 b=o9zuqMWtHk52MeVvkt2kqFIvRmE0DZejINyYMWMXhMRg7wGWM9+duKD8ulKrxkI+Wo
 aQVATO8iiS8/hAflGaV0veYJVKvioIe93pxDnIxjKB7PC1x/gzlZAsKPWWc8xI7lyv5b
 18px1Gi4hZ2Fw9a4bYiELQL06ZPVfwXGuCyVG9ofLeDyLF68x+AT8UN7QHcWIc+G3H+c
 HguPgQUK/jyQjr82q6vo98TTPo60slzUBU5CmQQvrVM0nH8m+WCLZQfAV+4WppazCNhP
 /JNiNX53fEWdWB7N3Fx9H4M/KnSaTZx9FVZIoGm66yrSB5hT9Met54Vm398J/+qmNYGP
 Agsw==
X-Gm-Message-State: AOAM530/Tp11v63jYqK/KJmo+SAJInt9f4GX76saDCv7mjj39yKa8g2j
 twtzFWw8osC8as3lw1F2XNLMJaTUBnjc1g==
X-Google-Smtp-Source: ABdhPJzQi3nSng+qOGH+9GvOxIVMIpl9+jcGP786BjSMmR2fAjhDNehq+0zd14UA306TqArTYlRJOA==
X-Received: by 2002:a17:90b:4b90:b0:1e8:48bd:453 with SMTP id
 lr16-20020a17090b4b9000b001e848bd0453mr24626763pjb.86.1654665591427; 
 Tue, 07 Jun 2022 22:19:51 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:c626:2f70:ac99:7c97])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a170902d58800b001641244d051sm13378807plh.257.2022.06.07.22.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 22:19:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org
Subject: [PATCH v4 05/11] target/mips: Drop pread and pwrite syscalls from
 semihosting
Date: Tue,  7 Jun 2022 22:19:39 -0700
Message-Id: <20220608051945.802339-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220608051945.802339-1-richard.henderson@linaro.org>
References: <20220608051945.802339-1-richard.henderson@linaro.org>
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 128EB31A50A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:09:43 +0100 (CET)
Received: from localhost ([::1]:52834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdp0-0001f3-4M
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:09:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVT-0001cy-QS
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:31 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:46442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVM-0007oj-32
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:31 -0500
Received: by mail-pg1-x534.google.com with SMTP id r38so217756pgk.13
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i+QGQk1wRzy6Ro0EOko1tw2TQzEaxVBUE4AsBVR40qs=;
 b=q4CGnCR3tv5qQPKJAqW48sPpe1a+xzzn0Hyf/wXvVF5Akh241yH8Gz3XKf31eFipJw
 3CHiWXX54VT8s5z8FSRPObjOdLHfzQvCKbvHRLCrHpbHoBq44n0HnarCOzP2VGO3B3+v
 y2nVOnHcZEPse+UkXw0E/PdUadvSO7Prkb7Q6+P/yPLcz0mMMe5NNp6C8wvQybbUgaBW
 cJxIIYfpZFhX3/uwo4cEZ3BSz66Q0CnqcRRhxFjjdCw8zbxxK6k9HUHs1XHUklYMf1Jh
 cXcIkXyAsuxssWckmu3zqoeiAKoxlwm7M2A2YVvvCrSWoT4VRffkFMyEIrF50yYbD6H4
 1MGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i+QGQk1wRzy6Ro0EOko1tw2TQzEaxVBUE4AsBVR40qs=;
 b=O3GxnkyZ8frAyA9WL0g8TlAw+/i4eiXoBPkjgOCUGRZTty+Bq1morZFE8VK4Yb2k64
 f59h+QsPYAlnjrH5KiTXEQK/DiEg4MJAaAuDKCbS1hsGtCL02T4hg9g43tixxHNGibUE
 2r+qpkrcNsoszEifEaYZZchPIf+zFPVvM9dGoOJfZdE3QZ2P60E1ciFTDyc6Lm4w9OpS
 AH83rV+5BE2Y8z9iL3fZmYVkhTJRfUM/rVoCEX3mTgoKR5YRgh3ScYOqZzUWgMcl1aKu
 HKapdMokJo4bv8Nk5LYLoqAMX56E93zOfi3/vABdesAarIUtmlLpVVEC2lbFlpHjA0C7
 d6BA==
X-Gm-Message-State: AOAM5339Q3OM2WnmLxpDR1hBqeyRBc8l5U5w7BcYYxM9V+F4CLZl0RA4
 ztRwGgAlZbScUxS+Iby1SxZ0Bb1Q9o2K/w==
X-Google-Smtp-Source: ABdhPJw+yAL9qioL1dYN51emDM3MNf6wPPBXmsCzb2sSybeBkol2sGh55EKFyoALlu41nLA33Vqdzg==
X-Received: by 2002:a62:644f:0:b029:1d3:b559:fe7a with SMTP id
 y76-20020a62644f0000b02901d3b559fe7amr4058961pfb.21.1613155761781; 
 Fri, 12 Feb 2021 10:49:21 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k5sm9427618pfi.31.2021.02.12.10.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:49:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 13/31] linux-user: Explicitly untag memory management
 syscalls
Date: Fri, 12 Feb 2021 10:48:44 -0800
Message-Id: <20210212184902.1251044-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212184902.1251044-1-richard.henderson@linaro.org>
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We define target_mmap et al as untagged, so that they can be
used from the binary loaders.  Explicitly call cpu_untagged_addr
for munmap, mprotect, mremap syscall entry points.

Add a few comments for the syscalls that are exempted by the
kernel's tagged-address-abi.rst.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 748893904e..4451f8e4f0 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -889,6 +889,8 @@ abi_long do_brk(abi_ulong new_brk)
     abi_long mapped_addr;
     abi_ulong new_alloc_size;
 
+    /* brk pointers are always untagged */
+
     DEBUGF_BRK("do_brk(" TARGET_ABI_FMT_lx ") -> ", new_brk);
 
     if (!new_brk) {
@@ -4588,6 +4590,8 @@ static inline abi_ulong do_shmat(CPUArchState *cpu_env,
     int i,ret;
     abi_ulong shmlba;
 
+    /* shmat pointers are always untagged */
+
     /* find out the length of the shared memory segment */
     ret = get_errno(shmctl(shmid, IPC_STAT, &shm_info));
     if (is_error(ret)) {
@@ -4655,6 +4659,8 @@ static inline abi_long do_shmdt(abi_ulong shmaddr)
     int i;
     abi_long rv;
 
+    /* shmdt pointers are always untagged */
+
     mmap_lock();
 
     for (i = 0; i < N_SHM_REGIONS; ++i) {
@@ -9691,6 +9697,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                                         v5, v6));
         }
 #else
+        /* mmap pointers are always untagged */
         ret = get_errno(target_mmap(arg1, arg2, arg3,
                                     target_to_host_bitmask(arg4, mmap_flags_tbl),
                                     arg5,
@@ -9709,8 +9716,10 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         return get_errno(ret);
 #endif
     case TARGET_NR_munmap:
+        arg1 = cpu_untagged_addr(cpu, arg1);
         return get_errno(target_munmap(arg1, arg2));
     case TARGET_NR_mprotect:
+        arg1 = cpu_untagged_addr(cpu, arg1);
         {
             TaskState *ts = cpu->opaque;
             /* Special hack to detect libc making the stack executable.  */
@@ -9725,6 +9734,8 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         return get_errno(target_mprotect(arg1, arg2, arg3));
 #ifdef TARGET_NR_mremap
     case TARGET_NR_mremap:
+        arg1 = cpu_untagged_addr(cpu, arg1);
+        /* mremap new_addr (arg5) is always untagged */
         return get_errno(target_mremap(arg1, arg2, arg3, arg4, arg5));
 #endif
         /* ??? msync/mlock/munlock are broken for softmmu.  */
-- 
2.25.1



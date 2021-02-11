Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DCF318C2B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:38:43 +0100 (CET)
Received: from localhost ([::1]:57228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lACB8-0003C7-FY
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:38:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZE-0008Kf-Fk
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:33 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:37277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZ3-0008Up-2b
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:31 -0500
Received: by mail-wm1-x331.google.com with SMTP id m1so5643225wml.2
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hb0J2s80EhWinzon/ZpySDkNPOarrpfCwXclcW514TM=;
 b=P1vtQghUTDqLRDSr/E0s0AgG+dz3qEc337TGf62zNONLf9JfA6kUPRtJ07mLrzHHbm
 Fibq5rNv5MrclW2f6CG0XIUl1L3+3Dd+svAN7+JWmOIXdp1BlrEKOtsy+P7p8E4piGr2
 poq7cTPbkUTI6mqQhnt7EDF+Ft4bI5zyQ/z/jA4TBFN7iYXXIHezFmU/Axf9pmN+ht/a
 zJ3EDZMSxqH6swu/d5twgYtVpn1YAvFwrvN6w8vN/ANU19tHYC+eUB5qil3U1VwkZ+E1
 IxAcmMm/QKAXwA0J8yrLDb/r/kP+jVclmPatMXPaLmyP3rPMZ+/SiXPUd+y7i75G4m9y
 jZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hb0J2s80EhWinzon/ZpySDkNPOarrpfCwXclcW514TM=;
 b=VjU1oOEA/2acC65k1kOKReHUqyRbEu4OufycPEy5HLrQlk2j0fumiQw9X+C+6nhiB4
 JGQf8zEYOdFnD7fcmmn4yyI7bSATEbLn8o8z3fRKxoeH6pvH6bE6e4RjxL5jpz8IDhXP
 pvKnzWab545MqfI4+hKzvMxanMnh83GYy29NgDktoi6rUTh9iWw3DC8lHwuFDblRU9Xu
 6u+0lUoX2HziTARFluO7UEXEKBar/dbBC9mVjwN+YBUZftenvFFzNeDj3ChOdBhojX98
 +BZE5kC7KogRrk2Xd8k5RO8S71EVW7GIcW8AqFjnEW5lk29tYgfVXCrbRdL5K7rQN7qG
 8MIg==
X-Gm-Message-State: AOAM5312DJNtIztcQbdDxcLgxo7mvcGmbtorwn6H9ZAomQaumkTHtxrg
 xrWYL9sRsaGUxkrelUxH2tgaZr0g+Wjd7g==
X-Google-Smtp-Source: ABdhPJzzX6TnUvKvGNxCyIbYtw3wZIVlT9WNLfNWawIJBJLYkCGBlrRWt7DpcD8zpeIklRcP0GuUtg==
X-Received: by 2002:a1c:4e13:: with SMTP id g19mr5239403wmh.55.1613048359838; 
 Thu, 11 Feb 2021 04:59:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/45] linux-user: Explicitly untag memory management syscalls
Date: Thu, 11 Feb 2021 12:58:37 +0000
Message-Id: <20210211125900.22777-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

We define target_mmap et al as untagged, so that they can be
used from the binary loaders.  Explicitly call cpu_untagged_addr
for munmap, mprotect, mremap syscall entry points.

Add a few comments for the syscalls that are exempted by the
kernel's tagged-address-abi.rst.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210210000223.884088-14-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/syscall.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 748893904e3..4451f8e4f08 100644
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
2.20.1



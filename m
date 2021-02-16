Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA5E31CE05
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:29:18 +0100 (CET)
Received: from localhost ([::1]:60682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3Dx-0005Au-C3
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:29:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32g-0007iC-IS
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:38 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32F-0002On-8u
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:38 -0500
Received: by mail-wr1-x42e.google.com with SMTP id v15so13788529wrx.4
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JjY315MInI4vG0RSnDggioNC4B0M+dGQT3MUTReQ2S0=;
 b=X2ZEJMcYZoE1ZEyiNWQiUTG/08jLqDUnYIpMVbilxqCPLhlQ8m6YVwrVEveV16Yvb7
 X+B0VRqs+hoifrwbYSz5ZfxhPlT3ucUqc5C2L1VU+0rA3KWg47bD+IzveJQBHXQrtRwI
 2Jq2yPjM560u+n9O+xmnOSpHsK1yrwYLiJ902HclMz3KhtZDm6iEcrpfgFZwBZOt0mjU
 lI3uKOrFJSVeqhjIZYCJtfM52VcgjA/OaTtXKzoe/2461e8s83a+tI6IvksFwWDhGLpi
 lKCqBDr5/E5xjg/8MgoNlV+cy/UsGwO/EWTv/uQT5z1VwqXFE7KzDiHtgJC9333LUHqV
 VHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JjY315MInI4vG0RSnDggioNC4B0M+dGQT3MUTReQ2S0=;
 b=DiNHMYUgqjyCBmGzt3omwJGsA1UZvenU1UNvwOK77fA4tzryMC+B1SBXMlb1D6Rxzd
 OfdNKMmssYwOKD9dZ0TBLQkA+HvBljnqRjeWPIIHkDdIhW4wXFFen0bAo+Gi2D4HfxaB
 u72jooPwAlzhqaInSCzKEzv20pzmzcDCOjDhGMLWEy5tqWTmvIgVdXMMMtj2nf5eQJk2
 2DA47X8WdFDLD2AxfDe9Hnkb8QiSQ4ChQZTM1ngw/y/LJIKmL6dy3g8UhtFs72dKS0CD
 FV3L06foXX+7Rx4DCo60Q7UrvpL033+Nm3lRva/V9Swl3Pr/Nium/0/bsK4bTNfBBX+Q
 6W8Q==
X-Gm-Message-State: AOAM5331Bq5qWmQtCmTCaFBh1lD0Waa3YbEckiM3Oqw1Pj2qZ7uY8AD4
 rB2gLag7uyy/gRka53g9DawkygP7JWWXFg==
X-Google-Smtp-Source: ABdhPJwm/8Se3dvnTJdAhJmxgZ8GpETQs+EDSZ+fAbcKwe0w2vNL57hr7LMPzu3fNUMItBLff9h4zw==
X-Received: by 2002:a5d:558b:: with SMTP id i11mr24898135wrv.125.1613492229707; 
 Tue, 16 Feb 2021 08:17:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d5sm30630482wrb.14.2021.02.16.08.17.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 08:17:09 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/40] linux-user: Explicitly untag memory management syscalls
Date: Tue, 16 Feb 2021 16:16:31 +0000
Message-Id: <20210216161658.29881-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210216161658.29881-1-peter.maydell@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Message-id: 20210212184902.1251044-14-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/syscall.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index e7fd99f1acc..d5badd753e3 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -894,6 +894,8 @@ abi_long do_brk(abi_ulong new_brk)
     abi_long mapped_addr;
     abi_ulong new_alloc_size;
 
+    /* brk pointers are always untagged */
+
     DEBUGF_BRK("do_brk(" TARGET_ABI_FMT_lx ") -> ", new_brk);
 
     if (!new_brk) {
@@ -4599,6 +4601,8 @@ static inline abi_ulong do_shmat(CPUArchState *cpu_env,
     int i,ret;
     abi_ulong shmlba;
 
+    /* shmat pointers are always untagged */
+
     /* find out the length of the shared memory segment */
     ret = get_errno(shmctl(shmid, IPC_STAT, &shm_info));
     if (is_error(ret)) {
@@ -4666,6 +4670,8 @@ static inline abi_long do_shmdt(abi_ulong shmaddr)
     int i;
     abi_long rv;
 
+    /* shmdt pointers are always untagged */
+
     mmap_lock();
 
     for (i = 0; i < N_SHM_REGIONS; ++i) {
@@ -9703,6 +9709,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                                         v5, v6));
         }
 #else
+        /* mmap pointers are always untagged */
         ret = get_errno(target_mmap(arg1, arg2, arg3,
                                     target_to_host_bitmask(arg4, mmap_flags_tbl),
                                     arg5,
@@ -9721,8 +9728,10 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
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
@@ -9737,6 +9746,8 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
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



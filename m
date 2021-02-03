Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8626630E342
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 20:30:11 +0100 (CET)
Received: from localhost ([::1]:53916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Nqs-0005gf-J5
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 14:30:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOR-0007Ll-Rt
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:48 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:34276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOM-0001bn-Ca
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:47 -0500
Received: by mail-pg1-x52f.google.com with SMTP id o7so406323pgl.1
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 11:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/s8XFE9gqNZNWpQb6lsvETqFxexdpDzYtAtiO9bn45A=;
 b=hxDAeK17mLOOu0eaQLp0OwHC7vJvS6hhi9LGBYVH+DvfPjfz7hEfzZIBjScC5T6PUP
 yYmo5c21ylBZaih3H+PkhrEZq3Uv0/u53EVLyBUtG02iGc4Cp5oQ1bYzQ9BPZCSabT3Q
 lQh5/mwS1FGZmmEMxbmrpvDCPCjjiHboFl4IIPkXfkCho1Z6x9kRGcpko6hQgnLMOOC6
 cH2uYQH/u5giPa6Jz92RjM9CoTvWVPRx3ElQMwppH6qA7Gzs5cC6CWbqxHvKocF80L0t
 DP2UYYybhmptY2KxVq2YvPuZCpOtI4hypFXe5KeSnXYuFgEiHYqFDWW74uiUISPGHKac
 gDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/s8XFE9gqNZNWpQb6lsvETqFxexdpDzYtAtiO9bn45A=;
 b=AY8HXBfLO1MEmTOEgegkyfIzy+s5cj/+Auz39ybU0a7ZjJFXENbe0S8ZL7flnt2LEo
 sB5D6AvUsMK/Qk5OZDxV9bhyKfiW+/d89OUYKGS3OZfLBPQJWx+Gf8z5BEzcQRkYSq/5
 iJ6SeqKkM+KN1BrL/mUkAlxM5s5krF583nDd2cVrC11/jglTdES7+apOWCBw4b9txbGV
 xFbVziifdw4Ok05jNhyHkG1ml4qWwB1XI2theeRNTzlqneST1t9m1nTPJShGo3LuJLFq
 OWWWoH5HCaIv63wcl6M1H4LuulAZgmJRw/IEYWjvr8+lxWdntRFckAUraHaSE1CJDpyF
 DjCA==
X-Gm-Message-State: AOAM531maLc1t6/EE66/Goohk25cMcScde06qUXiSdurvjz8mysUjG4G
 CaDxjiMs5JlEij8aN6QqAsR4CsOsQjuFH6ZR
X-Google-Smtp-Source: ABdhPJwQ8ImLhIXFmnvxxZ69hgOXln2mD2YpbohExXb7xUViQqUheKWNHA35BozKYkv0JR0UkED/Pg==
X-Received: by 2002:a63:c205:: with SMTP id b5mr5114407pgd.281.1612378841023; 
 Wed, 03 Feb 2021 11:00:41 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:00:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 13/31] linux-user: Explicitly untag memory management
 syscalls
Date: Wed,  3 Feb 2021 08:59:52 -1000
Message-Id: <20210203190010.759771-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We define target_mmap et al as untagged, so that they can be
used from the binary loaders.  Explicitly call cpu_untagged_addr
for munmap, mprotect, mremap syscall entry points.

Add a few comments for the syscalls that are exempted by the
kernel's tagged-address-abi.rst.

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



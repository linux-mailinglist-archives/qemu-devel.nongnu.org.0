Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4561E315ABF
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 01:13:46 +0100 (CET)
Received: from localhost ([::1]:40386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9d8b-0005MJ-A3
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 19:13:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cy6-0003mU-B4
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:02:54 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:39824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cxx-00082W-65
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:02:54 -0500
Received: by mail-pj1-x1035.google.com with SMTP id d2so107479pjs.4
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 16:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i+QGQk1wRzy6Ro0EOko1tw2TQzEaxVBUE4AsBVR40qs=;
 b=em193n5/Wa54Yfe9Psj3M86onjtvLXj+wnNOvjKGJ4OGQBELhJZ+6T0i17bDn57PFM
 lbNIwuLozUA/bFzR2fPvObAjTerWeeCLxYOUQ8PkQEedzGZPn55KJl7G9JiwwqgPKNtL
 Bojy20a2t7FDA20Rg36e8j1ppDvNLXBjEZNabOzT5sKa/x5ygpVFSerx3NvNGwCFQvqk
 ggdWk2dPU5SxUTL9NKSJfbT2Jr/AkWuohDNCJxYgYmTPzSBRXk+AqScusGncgy7jN1ZM
 zGzPvOCliJ7qo1D7vtv+ku3hhTYqiL9FT6ZWnlkzlqaEnNfYAYxj7owq8NdeidWIHn+J
 Hufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i+QGQk1wRzy6Ro0EOko1tw2TQzEaxVBUE4AsBVR40qs=;
 b=T8/XR3Iq5K6dAmE4JEqCSeRxMlOBSVj9Ry8nGc21YHtNrSUK9z7i8e5fJNvPNgC/L+
 axlrRd+/VbVw7+eN0WscgPBzKSi/DkZletPbNT01IIR1jxMRbKtyMtv9OMXF8AvEi5gV
 DFFL7ux4qOGwrR2Us28yVajVNQUgWGO+YnP9Efw7tfSRJoehjiSqWuvkS5AIOFLWlpqK
 fj+2YMFJzvyEheFhPEn346jOXfTR3kbn2uWfN4FyHIPBnjJEoWBapoqSktVgF9XQOGsm
 Dk4XgSW4ijyLE8j4YaX88BY4T6Uyprwp8D8R012EmlVwU1LY5K74Q1qGpbLKeyuOZboH
 uXkg==
X-Gm-Message-State: AOAM532vwLaTJ+pxjkZwnnrlmX7yD5fWpNlggoXOw6yyJECOx8uHCeJw
 aClV5eaSQvY9JZnhnZKioN+se8jbs7k3HA==
X-Google-Smtp-Source: ABdhPJytSvRFXUVJCKj8H1XwCcbfuST2nEnoqLcsCBu8ThxnArYBrcjeTA2MNy/MrJElmXNvbERMMw==
X-Received: by 2002:a17:902:ac97:b029:e2:9393:f5a6 with SMTP id
 h23-20020a170902ac97b02900e29393f5a6mr357559plr.44.1612915361440; 
 Tue, 09 Feb 2021 16:02:41 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id me3sm164189pjb.32.2021.02.09.16.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 16:02:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 13/31] linux-user: Explicitly untag memory management
 syscalls
Date: Tue,  9 Feb 2021 16:02:05 -0800
Message-Id: <20210210000223.884088-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210000223.884088-1-richard.henderson@linaro.org>
References: <20210210000223.884088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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



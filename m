Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5673A4D14
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 08:09:33 +0200 (CEST)
Received: from localhost ([::1]:53498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrwpn-0007sY-KO
	for lists+qemu-devel@lfdr.de; Sat, 12 Jun 2021 02:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrwor-0007Cy-Vh
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 02:08:33 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:54194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrwop-0005LK-Un
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 02:08:33 -0400
Received: by mail-pj1-x1031.google.com with SMTP id ei4so6840639pjb.3
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 23:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZgOnCitZlqlTnEPIFZ21UGE7oN9kAkKUuKMHWVj2mzA=;
 b=cFe6lmn2KRXBKA43l6JtcqUcI5JikEW6sXxgcJkduc4j8gHq6A3CHGHXjF7gi1i9ss
 N2Vex+dshyIP5pRuCa4EBwa+MmtUDXnP3+/RVCgSc5VyQnAnkeb1//XIDxM3Np4m4Dg+
 Tbjx81gn68O2fZqd4gfH0c0VvlbhiT35BrMpZE3bBOtB5OhKV89d3cIwfRCFss2OselU
 7dHi/dh94ozDqWyuVZZPrtjVmm1Exf8brcIiRxJTDE5y1XHXrXHN2lnV4zp+yZKGc/Ow
 dRW3wS2W7FtW23PUVyCshO/kHsZUtt0qYrYnwTto4nCBBuv07GfIqackXyjnxOE7K1tv
 NTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZgOnCitZlqlTnEPIFZ21UGE7oN9kAkKUuKMHWVj2mzA=;
 b=JRlQRxwFXOr9ew2q8YOqDa/1DAu6Yn9cQYyXzOSZjdMbGl+pk1fr8DCssU7fkt7B03
 I2t/ECIHrJE835sFNfBIdnAg/W8r3hXmP0PLdsUpLqyb2iBv9PqarzaaQlmzb4C/Mk0T
 R87Q5jdKOOlIk7klaWPepiqTGRto0t4ZAcdkSJ6v3NK6VoQuY3rBI63mvOS7DmznO+W2
 oSLPDZk6HtrZcQ73dqmsxd/3VMX33zX5V4L3OvCxCVPV9j3VGJvSFIEhXASYhxTVo8Q3
 IOLMgh8o849YBdvK7Vfq5KqFW0ruYbpl7B6MBdJzfcH6nGP5kKEbDjPFs/S+lIoGV1pC
 7ufA==
X-Gm-Message-State: AOAM532N9fqBoZa0KLLiyLv6itWjJdOo4ejJV5SaaHFRM6sUtolIYZxT
 RG19vM/ulx0rp0VoWHrXdQjIwInL7QUrog==
X-Google-Smtp-Source: ABdhPJww3diTQQ80k1bhm2B9ooQ2eUDC7fgcgycNrnZ5FRdTRQuKGtYuE7AtTu1aDNehj52w4tRH2w==
X-Received: by 2002:a17:90a:a395:: with SMTP id
 x21mr8007128pjp.63.1623478109892; 
 Fri, 11 Jun 2021 23:08:29 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id gk21sm6353994pjb.22.2021.06.11.23.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 23:08:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user: Set CF_PARALLEL when mapping shared memory
Date: Fri, 11 Jun 2021 23:08:28 -0700
Message-Id: <20210612060828.695332-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signal the translator to use host atomic instructions for
guest operations, insofar as it is possible.  This is the
best we can do to allow the guest to interact atomically
with other processes.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/121
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/mmap.c    | 14 ++++++++++++++
 linux-user/syscall.c | 12 ++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 7e3b245036..0e103859fe 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -451,6 +451,20 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
         goto fail;
     }
 
+    /*
+     * If we're mapping shared memory, ensure we generate code for parallel
+     * execution and flush old translations.  This will work up to the level
+     * supported by the host -- anything that requires EXCP_ATOMIC will not
+     * be atomic with respect to an external process.
+     */
+    if (flags & MAP_SHARED) {
+        CPUState *cpu = thread_cpu;
+        if (!(cpu->tcg_cflags & CF_PARALLEL)) {
+            cpu->tcg_cflags |= CF_PARALLEL;
+            tb_flush(cpu);
+        }
+    }
+
     real_start = start & qemu_host_page_mask;
     host_offset = offset & qemu_host_page_mask;
 
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 974dd46c9a..54037db8d6 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -4603,6 +4603,7 @@ static inline abi_ulong target_shmlba(CPUArchState *cpu_env)
 static inline abi_ulong do_shmat(CPUArchState *cpu_env,
                                  int shmid, abi_ulong shmaddr, int shmflg)
 {
+    CPUState *cpu = env_cpu(cpu_env);
     abi_long raddr;
     void *host_raddr;
     struct shmid_ds shm_info;
@@ -4633,6 +4634,17 @@ static inline abi_ulong do_shmat(CPUArchState *cpu_env,
 
     mmap_lock();
 
+    /*
+     * We're mapping shared memory, so ensure we generate code for parallel
+     * execution and flush old translations.  This will work up to the level
+     * supported by the host -- anything that requires EXCP_ATOMIC will not
+     * be atomic with respect to an external process.
+     */
+    if (!(cpu->tcg_cflags & CF_PARALLEL)) {
+        cpu->tcg_cflags |= CF_PARALLEL;
+        tb_flush(cpu);
+    }
+
     if (shmaddr)
         host_raddr = shmat(shmid, (void *)g2h_untagged(shmaddr), shmflg);
     else {
-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 810DA543E6E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 23:19:51 +0200 (CEST)
Received: from localhost ([::1]:43556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz35i-0004iR-1z
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 17:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nz336-00017r-IC
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 17:17:08 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:42682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nz334-00069V-Ao
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 17:17:08 -0400
Received: by mail-il1-x136.google.com with SMTP id p1so17494176ilj.9
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 14:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FhYZZ966K8Fto0GgZfW1CgR/cEkdwN4ztsC31H6e9R8=;
 b=64plnoav2psOz1ZS0NCXbeCes2Sl7g8Iz3X1yXnfpa3KeR04EZ6WMkEPcvTfql+bhX
 aXWnesdDVFmIQmgR6+LBFZDGVcM8O6ZO8+ZEazXWgNIIoaxz2Y+Kq4BJhjJs/qUB52qJ
 qaQssd3UyN+DeIu2fUzvbrpfcWLrFJU5fngMLdpf6QJEzyBGpl3G+XO41VqZOAU38Kwy
 MSJui6hXKt9X6fhdmpVnxh7bM3GCMFr/QWkgz88bV3yE3n9JCNHz0qycKTRTWquKPd2m
 caAEtPYzeCLeyZF0mBAIR4ZQsAFUGWnekBVLfioB+IYZVMNRyS3S+6M2fI2I0qlMb6p7
 QzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FhYZZ966K8Fto0GgZfW1CgR/cEkdwN4ztsC31H6e9R8=;
 b=uLOULMZYUFGMFKRd7Pc7P3JHII6TespkyV3lTNqRC1L+S5ZY3gPWtLXJF7glJJi/+2
 ytxhVMcNY1RmLsKPhbOsGTuKuSBvl6iB2kwl+39ij9OeQETP6oAtUuV4xQixa0QQFtVX
 PglyPLoWVUXisV+01CVxcD3Y40jP94F2wpb6TNzkOzomtuyzm4PawMJE4zhUheBI4pwJ
 CPVl1R+micYvZZjlinoTWHR7bbKhHrangY2QQUikydcUPa+1HF/szC3+OhZFFLch5SJA
 +VJFzWi8Mv1QJAlQQpBNLtD1446urOFy4Gb+rv9nFVvPne/gfevEv3IkRhaUUR63Ck2E
 DASQ==
X-Gm-Message-State: AOAM532FWV8HYwkOXcJ3z2dtoBSa4KX0rGFwWQ4XIN3Tru30Qb1LqWfo
 h7pdY3EMBSIjY3APB9MvsN4MnP8j54iHrQ==
X-Google-Smtp-Source: ABdhPJw49mXNqhTLNsQzCc2sCPrUzJYaQRKqdSvHQbV1t2IHzhHSHRjdHzIqp+OPku6UDYq2tISlew==
X-Received: by 2002:a05:6e02:1c22:b0:2d1:abab:8806 with SMTP id
 m2-20020a056e021c2200b002d1abab8806mr19390982ilh.300.1654723024930; 
 Wed, 08 Jun 2022 14:17:04 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 k29-20020a02661d000000b0032ead96ee5csm8418552jac.165.2022.06.08.14.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 14:17:04 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@FreeBSD.org, def@freebsd.org, Warner Losh <imp@bsdimp.com>,
 arrowd@freebsd.org, Kyle Evans <kevans@freebsd.org>
Subject: [PATCH v2 3/6] bsd-user/freebsd/os-syscall.c: Tracing and error
 boilerplate
Date: Wed,  8 Jun 2022 15:17:08 -0600
Message-Id: <20220608211711.56158-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220608211711.56158-1-imp@bsdimp.com>
References: <20220608211711.56158-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add in the tracing and this system call not implemented boilerplate. Do
this by moving the guts of do_freebsd_syscall to freebsd_syscall. Put
the tracing in the wrapper function. Since freebsd_syscall is a
singleton static function, it will almost certainly be inlined. Fix
comments that referred to do_syscall since that was renamed some tie
ago.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/os-syscall.c | 44 +++++++++++++++++++++++++++++++----
 1 file changed, 40 insertions(+), 4 deletions(-)

diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 52093d479d8..1c4c9983f1a 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -190,16 +190,52 @@ void unlock_iovec(struct iovec *vec, abi_ulong target_addr,
 }
 
 /*
- * do_syscall() should always have a single exit point at the end so that
- * actions, such as logging of syscall results, can be performed.  All errnos
- * that do_syscall() returns must be -TARGET_<errcode>.
+ * All errnos that freebsd_syscall() returns must be -TARGET_<errcode>.
+ */
+static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
+                                abi_long arg2, abi_long arg3, abi_long arg4,
+                                abi_long arg5, abi_long arg6, abi_long arg7,
+                                abi_long arg8)
+{
+    abi_long ret;
+
+    switch (num) {
+    default:
+        qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
+        ret = -TARGET_ENOSYS;
+        break;
+    }
+
+    return ret;
+}
+
+/*
+ * do_freebsd_syscall() should always have a single exit point at the end so
+ * that actions, such as logging of syscall results, can be performed. This
+ * as a wrapper around freebsd_syscall() so that actually happens. Since
+ * that is a singleton, modern compilers will inline it anyway...
  */
 abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
                             abi_long arg2, abi_long arg3, abi_long arg4,
                             abi_long arg5, abi_long arg6, abi_long arg7,
                             abi_long arg8)
 {
-    return 0;
+    CPUState *cpu = env_cpu(cpu_env);
+    int ret;
+
+    trace_guest_user_syscall(cpu, num, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
+    if (do_strace) {
+        print_freebsd_syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
+    }
+
+    ret = freebsd_syscall(cpu_env, num, arg1, arg2, arg3, arg4, arg5, arg6,
+                          arg7, arg8);
+    if (do_strace) {
+        print_freebsd_syscall_ret(num, ret);
+    }
+    trace_guest_user_syscall_ret(cpu, num, ret);
+
+    return ret;
 }
 
 void syscall_init(void)
-- 
2.33.1



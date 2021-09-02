Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F083FF83F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 02:07:03 +0200 (CEST)
Received: from localhost ([::1]:33320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLwjW-00060K-Fq
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 20:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwR7-0006o3-Aj
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:01 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:37396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwR5-0002yz-NI
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:01 -0400
Received: by mail-io1-xd2f.google.com with SMTP id b7so4725944iob.4
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 16:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+8JkNpfesdBOSdFjmNZn5gJ/TH6i2DvTMe8UnLYkrDo=;
 b=G1tDNxMLXpSYaa5LKFZr3YFf26g6xI6xY38hlcXgHBA5DRJTQ0EB5QLi0qWCZmFoC1
 mgCbKdwSxpVtOuZtsK4PSsl4mprbj3aa5NknjvvKfAduLU7B6ymFYfgsb67nRajfuuDn
 mNxmTDCZWgV8HLdYxDSY1nllZ2uDD09B33UayB5CA0MsqqdQ4zOCkvbhSYpYT2ObQ5rz
 s9bAsVmPQboQ6A3L96gvZE4lQnizOJ1ttoieTK01/BBI3LOKzzsinCQN5oLwp8XeAbXI
 dzNMtwwCBF1V0Wb5G7nPLzEA2ghY2oFJxN7X0Gr4OG1mCtt683hwZz+RiH0k83kvxFAC
 uiAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+8JkNpfesdBOSdFjmNZn5gJ/TH6i2DvTMe8UnLYkrDo=;
 b=W5ypctWkrExXCBR6EK1Uskmjo9icyTLiAD8DYTvo3mftkzGbxEj3A+gSn9XjoKnp42
 61wICSN4WgSACvqFu7Id01BpN1dgdnCwHJGd8Ngunxm7TSxnby3+U3iip8jzrZ7GI639
 tCUUK4HyuCKGaOeqxFbK+ta2V/vmBbY797uNNKu+H2QoH+Bvl7zz8y710gc91q7OVFOu
 Rrlu3ILfqNZv56wtUFKOPDDf+SAiw/9jNG6CHCHL1AMf/UDFgHBKcIFYoyOrUpL3iXtR
 TE0PlGQ/skzH7cG6GqOBvQupi2umAjNWk1aU6wyUwezbw7/iatU2IJF9HSvQvOqmTUgh
 UFhg==
X-Gm-Message-State: AOAM531saZterQTZkD3uO5+9v1OLr9VpgUMWgb6CU84I3ioQZe0yhlAy
 Duy3MlZMcVttIvDmMtvvJqO+gxb/xCm9Dw==
X-Google-Smtp-Source: ABdhPJzskiaUFZD2e+qUFbIil85AzfLAv9maitoT24gLLP/tuxhrBfxFDx1ozCpcwbpZM/MaVYulPQ==
X-Received: by 2002:a02:a391:: with SMTP id y17mr270442jak.47.1630626478192;
 Thu, 02 Sep 2021 16:47:58 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm1740502ilg.15.2021.09.02.16.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 16:47:57 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/43] bsd-user: assume pthreads and support of __thread
Date: Thu,  2 Sep 2021 17:47:01 -0600
Message-Id: <20210902234729.76141-16-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210902234729.76141-1-imp@bsdimp.com>
References: <20210902234729.76141-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

All compilers for some time have supported this. Follow linux-user and
eliminate the #define THREAD and unconditionally insert __thread where
needed. Please insert: "(see 24cb36a61c6: "configure: Make NPTL
non-optional")"

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 bsd-user/main.c |  2 +-
 bsd-user/qemu.h | 10 +---------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 1388c7a13d..e06cc7b414 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -309,7 +309,7 @@ static void usage(void)
     exit(1);
 }
 
-THREAD CPUState *thread_cpu;
+__thread CPUState *thread_cpu;
 
 bool qemu_cpu_is_self(CPUState *cpu)
 {
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index d1ab58a8eb..cf248ad3df 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -40,12 +40,6 @@ extern enum BSDType bsd_type;
 #include "target_syscall.h"
 #include "exec/gdbstub.h"
 
-#if defined(CONFIG_USE_NPTL)
-#define THREAD __thread
-#else
-#define THREAD
-#endif
-
 /*
  * This struct is used to hold certain information about the image.  Basically,
  * it replicates in user space what would be certain task_struct fields in the
@@ -155,7 +149,7 @@ abi_long do_openbsd_syscall(void *cpu_env, int num, abi_long arg1,
                             abi_long arg2, abi_long arg3, abi_long arg4,
                             abi_long arg5, abi_long arg6);
 void gemu_log(const char *fmt, ...) GCC_FMT_ATTR(1, 2);
-extern THREAD CPUState *thread_cpu;
+extern __thread CPUState *thread_cpu;
 void cpu_loop(CPUArchState *env);
 char *target_strerror(int err);
 int get_osversion(void);
@@ -422,8 +416,6 @@ static inline void *lock_user_string(abi_ulong guest_addr)
 #define unlock_user_struct(host_ptr, guest_addr, copy)          \
     unlock_user(host_ptr, guest_addr, (copy) ? sizeof(*host_ptr) : 0)
 
-#if defined(CONFIG_USE_NPTL)
 #include <pthread.h>
-#endif
 
 #endif /* QEMU_H */
-- 
2.32.0



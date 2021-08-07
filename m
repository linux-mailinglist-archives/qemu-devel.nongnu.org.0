Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B463E3739
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 23:51:41 +0200 (CEST)
Received: from localhost ([::1]:43514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCUEG-0006qM-D2
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 17:51:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU63-000724-7M
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:11 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:36832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU61-0004rJ-1U
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:10 -0400
Received: by mail-io1-xd36.google.com with SMTP id f11so19875899ioj.3
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Myl5Kg/hYpTADGYYXyFryFopq7pZ0lkHu9eYZSvu+pg=;
 b=tChnutsjKbf4Xj0+IdhM5AbaXQG1uEria6Y4V7qBFC9uJhNuVp1pcYF93OPnbwWpph
 fccjd6oaXW9JJZkeUfeyhHAeh5SCFDTMhmKt+7p6gIiFhI1okKNMRuv7YF2k7iL1ZONw
 hpHVGQBGbAoL0pD42NPOGtp+XCs96URtsh7strXhX+41pe3oSceZtjE5QsrKx1GP6wbh
 xPkmZGu58FHBvLF6IbMTEYWeGVQ5Wv+L5uwQEcDcaNj5G8NC3P5m54yOsfKpe5E4wTzk
 cbAKfvj/wQuPE+LcM4OFZrhy82dlwVVx5ia2TqvnfUd41q2XG5RVqjpqB5Jm3+niuwKa
 rmLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Myl5Kg/hYpTADGYYXyFryFopq7pZ0lkHu9eYZSvu+pg=;
 b=MH+jkdwPaOp0VZrLcvd96B44wYw0pXCmgEnNwqiemlCEd+cOvtWnlR4Q0egOvVGmDY
 W6wtNFEkve+aHcGqQ+7Zc8wS6E0F+ByYNj1+gy6ezD7Vqq8JJwKQaOxudt1tNyKP9cqT
 qeRN2/HxUOMdXCJZXeOoDePOKwRWOdKIxp2DimW8+p2ecOiUbZvZrIdrBIZ7weyMeEc3
 tFgnS3pm0QQSLTCHeFe0O3Euh/ydq950Pm/wgaSVWkttPuSpM/tkqZTc+sX1mCqQ4mBz
 +EeZMIdPFxiWu+sdcJM01DRf5O3Jor+bp6qUZMR9EsmMeffg1TVbsVtjJyMWPi1LDRdZ
 W2+Q==
X-Gm-Message-State: AOAM530hQGPY/3Re6M2JbqW1t5AZ02ELyM4CAWPjM6yk0dzxnxjUzvKT
 nl9Eq8RoEdDMMmphQJbMxmMd2q2fbyElfe5F
X-Google-Smtp-Source: ABdhPJyqCRY0uyC2/sfUiFHUZgRhuClCbOoyemKHLk03toulPdDBK612VkICNTftuBckBD+wklbrQA==
X-Received: by 2002:a02:a581:: with SMTP id b1mr15918116jam.84.1628372587743; 
 Sat, 07 Aug 2021 14:43:07 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:43:07 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 17/49] bsd-user: assume pthreads and support of
 __thread
Date: Sat,  7 Aug 2021 15:42:10 -0600
Message-Id: <20210807214242.82385-18-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All compilers for some time have supported this. Follow linux-user and
eliminate the #define THREAD and unconditionally insert __thread where
needed.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c |  2 +-
 bsd-user/qemu.h | 10 +---------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 65958729f1..9166049c5a 100644
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



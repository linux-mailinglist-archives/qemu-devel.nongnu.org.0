Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 650EC403097
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 23:59:23 +0200 (CEST)
Received: from localhost ([::1]:39822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNj7i-0006II-Fd
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 17:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2Q-0005mH-If
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:53:54 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:46800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2P-0000rp-5d
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:53:54 -0400
Received: by mail-il1-x12a.google.com with SMTP id u17so141700ilm.13
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 14:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+8JkNpfesdBOSdFjmNZn5gJ/TH6i2DvTMe8UnLYkrDo=;
 b=Gei2yzz7XZ7oH4ZXDddBsadV9cwNJoRmWJnOfmuUri7ajgZbdhxtxStBbzVqHQ+LNY
 r6dJpcQCilEWs1I69luuWjwi/VARmpzXpc03gI7ygE5c6j9tr/wCoWkTAVkNIlMuetPD
 +sIOyPhGksQibFqGjuCQYQnEFkIxqBW7lDDxPa+6guK0xVmgUcg1gjWGIp6+ZFGFPa6C
 ae8m0j8nLz+YlNjq7aS0YRRXdaxfcvL9bLoviD7E0jVHL5yMIlkexK5LYdJUmgPlJgw/
 2QA+L116leB4+4//Pe3Um4EaitrIBkrE+NG7LiHJ5rJl+Pe/oSspXi7KCmcq7KAShZKU
 7hPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+8JkNpfesdBOSdFjmNZn5gJ/TH6i2DvTMe8UnLYkrDo=;
 b=fhGy4hrfPtSuSNYVMUvEJWZ6EZFdyxVXs78V3U67A1BaSv8/J6OAyajBfikh/xy/N0
 Opx7P4jN0KHjKVol+5bFoVkTWQzlLWxB2ey0D7PfRyBUbpYMoQD+2iwVNaZiwt9xllIY
 v9GdskeGJmZaRi00XqmfRtCH/klcDR6DWKm3SEwfUhumt2u1kpuMJPmEki1faMs/TSJh
 94dhMga91n7vwm+W7zPkiov6cfU6FPQY6zW9cso2OzTjaGO20x6+Utyb4u8afzmpCIkB
 weH5Dl5QEN6MCY0S0evFsvOTgO4kmSZaKQPu7Z3ckVFi8HJUKQNSTGBN2abEYLQv4deB
 9BbA==
X-Gm-Message-State: AOAM531HrkZefZWEXNv0FDq0aMLr4g++7KXNpCevywmd7Tp4dZ8RBkVV
 PIJ4bkXZkKVIC9GvBPSHaENHDvtW7VdWVHtOFHQ=
X-Google-Smtp-Source: ABdhPJz6npR2nPrVyiXXwc11qopf2Yr4fDB4rTQV16pWdIp1glWO+q7dZyrhiAMiFxqYnltCHv7bTQ==
X-Received: by 2002:a05:6e02:d0b:: with SMTP id
 g11mr252805ilj.321.1631051631652; 
 Tue, 07 Sep 2021 14:53:51 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id t17sm192477iln.24.2021.09.07.14.53.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 14:53:51 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 15/42] bsd-user: assume pthreads and support of __thread
Date: Tue,  7 Sep 2021 15:53:05 -0600
Message-Id: <20210907215332.30737-16-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907215332.30737-1-imp@bsdimp.com>
References: <20210907215332.30737-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12a;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12a.google.com
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



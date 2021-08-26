Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C73C3F8FE3
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:27:51 +0200 (CEST)
Received: from localhost ([::1]:53700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJMuX-0003GC-CP
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMfv-00066X-B5
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:39 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:38645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMft-0006rb-Lt
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:39 -0400
Received: by mail-io1-xd34.google.com with SMTP id a13so5582781iol.5
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 14:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FZj4aoLX7JsLMNjQFdzZZBBCDiwsQceUBZmpSc2bNx4=;
 b=W1eQYU3PCeahDv5mOWBKNgVH2Pbgf7R87f1SePHX1fQ7rcqsnsgvsyH/5dVBvVpvI7
 R0pmg9SY1PJ5nhHaEyIXHtrUtCLNP4LpZkwmPOXol+3c5+UiCqbErpO6WazuCkBv23Ed
 w4/44puyZGc9A5XpBmB00yy2xSltQ8I4bhkgj8/MFdxkekgKcMrBtzgGyLv847d0h+/W
 CpSsOT4q+WGzdk64BB1eggMLL106OrF2wGfU+OEHtwl7d+xfQ+M/aktOV3n21W00FQHg
 ROs/4VLdnKmMvZo53A5r+gHzyceXYo55uFDvFzc8kbo0QSdGHN2BMkx1dV8otk5+Nhb/
 93NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FZj4aoLX7JsLMNjQFdzZZBBCDiwsQceUBZmpSc2bNx4=;
 b=DuD1YU1H7f57Q8YhPbPO9ets4NeFcY561mNi+qL6VYu682RnnzQz2W4EcwuBW1G+CC
 Pa8f9WBob9PmKmolnNJucSFOk2m/r97hcR6kNciqG7x4W/uByYR3XcoOoFDzgdrPWsCp
 vRGdyLy654PyCmdSwGXgVjNddUG9SLqkQXyU2BtCPHwamLKcNVg8xn6e8FZnW0Axp7Gk
 ubAS/ARfrHJXYFtvHjZzzZ/IB+sfTpSEtqZdYnPrFDjfcKM+3hpCW/Yfdxvttw+8C0dH
 sOR1lfsXXpwdQ0d/mwP/K4bqJnWJJ3Z1hCLwbsrizm/NVYHDDzCpwN3aitDFlp+iWZXv
 oeKg==
X-Gm-Message-State: AOAM5334p+lfv3XcboLdZsAF+LShXkoXQ2XIj0fJFShza0eE42LNwRQ5
 uLc3HHVh9XPgrxVwYXad8H0em7Uf4n3GIJS6
X-Google-Smtp-Source: ABdhPJzm7LK3UsKCgy+FKFfv0xUcqQ3Q8S91A/mHA6gbAOxRYfdNpJ1mt9csYigZ32XEcnC5F+keVQ==
X-Received: by 2002:a5e:9901:: with SMTP id t1mr4639161ioj.92.1630012356317;
 Thu, 26 Aug 2021 14:12:36 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm2348633ilp.75.2021.08.26.14.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 14:12:35 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/43] bsd-user: assume pthreads and support of __thread
Date: Thu, 26 Aug 2021 15:11:33 -0600
Message-Id: <20210826211201.98877-16-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826211201.98877-1-imp@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

All compilers for some time have supported this. Follow linux-user and
eliminate the #define THREAD and unconditionally insert __thread where
needed.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/main.c |  2 +-
 bsd-user/qemu.h | 10 +---------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 7e1284c368..3f6f4080e8 100644
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F192F3FF845
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 02:10:03 +0200 (CEST)
Received: from localhost ([::1]:41456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLwmQ-0003kr-Vr
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 20:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRB-0006vd-L4
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:07 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:40954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwR8-00030z-JC
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:05 -0400
Received: by mail-io1-xd29.google.com with SMTP id z1so4732005ioh.7
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 16:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F4nNlPsSLsV01qd9qw15BkXhhoStqZH5Vk+tUnfSu6A=;
 b=H3qIwNchCH8yK99/1Jvrf6OKEoAvlpnzm9mptU0a1o4VQmVTPr7w9SS1La2Q7Ru9A3
 W/QAcEBYnLd9gKEgISB/9xY2Qu0OT4PT5GfEJSz2Ur00DHyYCChredrc93m4CcXBkY9P
 321xsPP8QyedDrgz5w2QyMUfFARePV6V3Icg/G1xX330VUsbbvp6xQGPpFkQqWG4fJH0
 VyvwVCOqam+2NR59txyz1RX1jgVleW/+z9CMWwzwjLiIOEecIX0+GGVcSMQozJg1OP/k
 0UQV0aY6UYJUL3hfInRsnA95lGd8erDEs9ArvGLeGhubq0TgN15rU6lyLxB2Wwjo4RpM
 85Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F4nNlPsSLsV01qd9qw15BkXhhoStqZH5Vk+tUnfSu6A=;
 b=qvELbr+T2d/CgWmdLYXSjzYi3a69bmE0Dh+KIoi3vRmboosD40lZqAokSI3LjGgsHy
 NJ5GUVibwFLwUuczoN+oWtivDcdTXaCBVpjJeIkHGSg+ZgCLKqDpQj+6Pw73ynpkxp19
 7/GTehTgWHsfGsR+Te8MUAvZ2mUtkvcMryglz+kOdBYBaAdEV8elfSx5OouqxNk6dU6e
 2JJK16JWKRQby4AlmeWigEyMtU0h2RiBVMMd7klDdREbo8TU6BL3RWFrV+CbN1bf8dn0
 6TE5AG7CT3NpCWgeegU6MvoLPJg12IwGcdYXfjFp6WxV0HtYX9NGSbmfatStNQpzZrLs
 wS7g==
X-Gm-Message-State: AOAM531db9FoS5cfTofcPs7wxdg6Hik0LtD+BUsTOdug2nMz48JiWP0K
 DMH3VPHYqtakV2fMKG3bCusM2OiTIEaVBA==
X-Google-Smtp-Source: ABdhPJxoRvbGc7yKQReBqjZVr1YRKJXMyqCQGoEmymOlaLP/5YPWk2ypiOG99FqEoro9V/DGXh6vtA==
X-Received: by 2002:a05:6638:2216:: with SMTP id
 l22mr269139jas.39.1630626481386; 
 Thu, 02 Sep 2021 16:48:01 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm1740502ilg.15.2021.09.02.16.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 16:48:00 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 18/43] bsd-user: save the path to the qemu emulator
Date: Thu,  2 Sep 2021 17:47:04 -0600
Message-Id: <20210902234729.76141-19-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210902234729.76141-1-imp@bsdimp.com>
References: <20210902234729.76141-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd29.google.com
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
 Stacey Son <sson@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Save the path to the qemu emulator. This will be used later when we have
a more complete implementation of exec.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/main.c | 21 +++++++++++++++++++++
 bsd-user/qemu.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 607fdd8380..d7c8a3e348 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -43,6 +43,8 @@
 
 #include "host-os.h"
 
+#include <sys/sysctl.h>
+
 int singlestep;
 unsigned long mmap_min_addr;
 uintptr_t guest_base;
@@ -52,6 +54,7 @@ unsigned long reserved_va;
 static const char *interp_prefix = CONFIG_QEMU_INTERP_PREFIX;
 const char *qemu_uname_release;
 enum BSDType bsd_type;
+char qemu_proc_pathname[PATH_MAX];  /* full path to exeutable */
 
 /*
  * XXX: on x86 MAP_GROWSDOWN only works if ESP <= address + 32, so
@@ -336,6 +339,22 @@ void init_task_state(TaskState *ts)
     ts->sigqueue_table[i].next = NULL;
 }
 
+static void save_proc_pathname(char *argv0)
+{
+    int mib[4];
+    size_t len;
+
+    mib[0] = CTL_KERN;
+    mib[1] = KERN_PROC;
+    mib[2] = KERN_PROC_PATHNAME;
+    mib[3] = -1;
+
+    len = sizeof(qemu_proc_pathname);
+    if (sysctl(mib, 4, qemu_proc_pathname, &len, NULL, 0)) {
+        perror("sysctl");
+    }
+}
+
 int main(int argc, char **argv)
 {
     const char *filename;
@@ -360,6 +379,8 @@ int main(int argc, char **argv)
         usage();
     }
 
+    save_proc_pathname(argv[0]);
+
     error_init(argv[0]);
     module_call_init(MODULE_INIT_TRACE);
     qemu_init_cpu_list();
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index cf248ad3df..6c4ec61d76 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -207,6 +207,7 @@ void mmap_fork_start(void);
 void mmap_fork_end(int child);
 
 /* main.c */
+extern char qemu_proc_pathname[];
 extern unsigned long x86_stack_size;
 
 /* user access */
-- 
2.32.0



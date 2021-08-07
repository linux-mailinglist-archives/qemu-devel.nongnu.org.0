Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1532E3E373C
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 23:53:28 +0200 (CEST)
Received: from localhost ([::1]:51956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCUFz-00046X-4E
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 17:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU66-0007Ei-8e
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:14 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:38738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU64-0004tt-Nu
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:14 -0400
Received: by mail-io1-xd29.google.com with SMTP id a13so19904670iol.5
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BTHyu9k2kFrGG65EoJAfC+s4flP2ULxollHRiXJphB0=;
 b=AJG+mD+i0cEmr1c1q8Vvte7OEJUzGlQLJNI09FTUnNQjmpK65qK1ln5mOywNd1cPLy
 Nism9cp2EWmKn76V6EB3DUkF0T0YtDbhrTHHH+muGy/NwQVazaRUJQi8S8KNcp99Fd2w
 q3VfHdn1nqxN9i3vZMASINlf2vYzqIgsJRN8b6Kz/BPbzVL/WUSEDB+RkLj8b+Nd9cS1
 fv0dk4xkdzlmia25F3AVkyeTKGhd7k4DkVJO8nvVgDnFYnHae4iS3H+RgxOTJKYjKnAW
 uQV9cywemEqv2Sf+/17MR+7wksiC5ZrZC9XQ98K22Dlgs6UliK2ShZJO0+Y5waGMP3u3
 cupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BTHyu9k2kFrGG65EoJAfC+s4flP2ULxollHRiXJphB0=;
 b=SqkuBooqCGE7slJ/z1HZ/tjQl0alNLR/lGhSKCmx01JWM+wckxprnfaIpOJwlABtLJ
 USbnXhnDqn6uAVwecCPs0qWfIQlJxttoweBX95fRWwPHkR4gt6cMfCym+ygz1MMKuJQM
 SMeT04kmFZS93OjGYRKns2kDmcWevrcw3+EUOb3Gx6rwdLLXF5s1j6RUEC1pVh4p6W0Z
 5Zlea+3oQKhzve3MIYPVvaqI5DG5a4GfQ7s7KUkX2kzp6kkBh4t354dMjn9H2n0htfN1
 x7QUEtgXN8838oDzjTYIzJUGD+AK+skiiyfKZYS5y1x6/i9OUnGTzA4Zv0TKroKomzq/
 IVCg==
X-Gm-Message-State: AOAM531bNh90swr4CCar2fNI2T4FkoJ24Vqh6/WP8vjrly1Im5uABLWw
 yfx3//h3tc7GuEN/SEXm6rgyyN90kJVF1NRA
X-Google-Smtp-Source: ABdhPJzQQuYVcTj/6YRysNGh/zneZ/VbKeTjk4hhEbGxFwckGRDVbvWflAywpKdcdW9Ov2z21eN8yw==
X-Received: by 2002:a02:1cc5:: with SMTP id c188mr15543023jac.46.1628372591370; 
 Sat, 07 Aug 2021 14:43:11 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:43:11 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 20/49] bsd-user: save the path the qemu emulator
Date: Sat,  7 Aug 2021 15:42:13 -0600
Message-Id: <20210807214242.82385-21-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
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
Cc: kevans@freebsd.org, Stacey Son <sson@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Save the path to the qemu emulator. This will be used later when we have
a more complete implementation of exec.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c | 21 +++++++++++++++++++++
 bsd-user/qemu.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index d9965e6611..c59edad155 100644
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
+    len = PATH_MAX;
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



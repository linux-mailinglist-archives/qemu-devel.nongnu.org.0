Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3104F3F9032
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:36:30 +0200 (CEST)
Received: from localhost ([::1]:54054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJN2p-0005il-8K
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:36:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMfx-0006EQ-Ha
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:41 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:35462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMfw-0006t3-2t
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:41 -0400
Received: by mail-il1-x135.google.com with SMTP id h29so4749716ila.2
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 14:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KspnYGpyiVMcdxakE6pVYy6oU11mJouFsCxYi9vG7eg=;
 b=ZAzHUTBUpvULhZGt0c7aw+2ODHJ65iJdDP2HUHyr6/8zGuygEwjAqGuWyzn9t0LjNu
 VljeBMFJQy8WMI/iJUT6tjsgsPFVJtuupAZJ+t9lyptBAD0nCC1HWlDq8190GFtd+KDx
 PCSh94HRjzNhoDmK5txWdJy0TAzuBRtM1odBDZyezrOptnA8yqcMIzZ9gmfoFnQexVnY
 T8q91lRNHCH/EeROW5rEjlsxhaUjYlrRra+quLrAalkzdNh87hxaTXmyWTygA3mqm/hL
 xUJl1xt6g0ONlkdBoPFpVv7vI1zCnhIY3J0hrZI64kgqkNAjp+kJ+tIWvWi6tHcrQnVG
 QAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KspnYGpyiVMcdxakE6pVYy6oU11mJouFsCxYi9vG7eg=;
 b=kW50h2lwhfEnMbZLDusgmQtEPola8REGnBxo7Ibkn4F6fxcZWXk8b6DORDiKmVZCHa
 Xu30rZ8YmZZjeY/mbdLT/lw6vN7M6G6JnaxrhtmP9afjTM0QgZZ4694HbSvoDZZ/0gRq
 xwVSrWM3gLjxUgRw0orhKBXXNQgpm3vqjmwaMPHCki4V9PjYZMzgWOH6oyvTIgMDrenV
 exnGtdAfiX+ANsNzko0LNQq96Fy47K9ytGKOmFhPiOanAAAevbgaQ9iSUQFKzy1ZuBuI
 F56bYD9pFw2sBSka+GH01JtnCjR35yT2XA4nF8VbuDNlwtM+TDxemwX3ngiVfpjMFduW
 FDsA==
X-Gm-Message-State: AOAM530ZScdlfyon34w+HEpOj6sn5Y5AATFHMTnHEo9x09zCSJFxK6KO
 K1nCertzELhVCdg8l9j+u7lXYNKuGLhndCXB
X-Google-Smtp-Source: ABdhPJxZC1EIzP02gzOWVaMcCEsFgyScMUDrLAbc5l6lW/OfHxGP8IDTDofloFFtNahfyEomXt12+Q==
X-Received: by 2002:a05:6e02:1107:: with SMTP id
 u7mr3865485ilk.39.1630012358866; 
 Thu, 26 Aug 2021 14:12:38 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm2348633ilp.75.2021.08.26.14.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 14:12:38 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/43] bsd-user: save the path to the qemu emulator
Date: Thu, 26 Aug 2021 15:11:36 -0600
Message-Id: <20210826211201.98877-19-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826211201.98877-1-imp@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::135;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x135.google.com
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
index 3a23e63cf8..f7e1df5da5 100644
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



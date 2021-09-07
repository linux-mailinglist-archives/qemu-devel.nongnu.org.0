Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D7F4030AC
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 00:02:15 +0200 (CEST)
Received: from localhost ([::1]:48174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNjAV-0003fe-0J
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 18:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2T-0005pH-4R
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:53:58 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:42830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2R-0000ub-NA
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:53:56 -0400
Received: by mail-io1-xd31.google.com with SMTP id b10so447485ioq.9
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 14:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fibrjHiBo3BWeiBRUCFmwdLyefDsJC7g8aB8krYG+xI=;
 b=M6DRERTWmX8JVqHLIQb5C2vG4A8szHFR0zKKZpjtrO3DQAX6Oh2YrMZAM+BR9AeoOz
 v1ca7PwiXbCqiIh9AsCEFHKkcXxGwCAqgnRbzELFyQMnW0qoSDpiR+oxYhuaYavZtkTE
 UYRldymLGD28CS2HHN8zJbk+aLf1qklBQUEtSH86iPsEZwXv/nYtAiTCNtsazWxhxQS4
 0cfb0eF3dqYR69OIwGmm58Urg3CCQs232bhjbBrBkN5gUUg3+rjj8dHJld4n4muMbTeQ
 CwsbTDWYAUqHannJ56Kk0x+zmwEMetwGNBbNv5c94OLPl0G4ZCh9twhCV8zh2AyOZ3aG
 CyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fibrjHiBo3BWeiBRUCFmwdLyefDsJC7g8aB8krYG+xI=;
 b=sENrlzL6oj7uesasjK2s8+GzjaI60K3Kd5P6J0q+IxLp0FjSBaLAdj2QIboxGkJvcH
 7uPRi72mQxqheGR1F/dNuaJH3XMf47JZHVbAjQJdkVC5E+gmM8p1Y5KslGu1z62EWU4Q
 TVuW/lsslPwLOgKLKD2XQx2A6sUMIQHap5rGFoukIMI3DL1o8z30E+l3rq23BrOqhMiJ
 eeSfra6fSMCE6pPSq77P2E+I/nXQRXh5XTwWh2vZEHcvk6qi7Y3cpYcheQXl9NiMP151
 JXIKIcvwucsWv72iBP+IPLAWwBwQOeo5KCFphKo9jVPmzJ/9GV1JIWPswDQg/Epy2STc
 Aq0w==
X-Gm-Message-State: AOAM530vvtz51dWfq1XLHz3aLK33fjEN3NxEcZLxYsSgTTbCOgPvY3Jr
 xxRv1urJJb9WXyH47VZRVU9rd3/QofEUxplsyDo=
X-Google-Smtp-Source: ABdhPJw000Vx0F2zoxzox+ON5wtgSUHWKNfKA3ADZVPcU+OQ09YyM2p0yVkhLL0o9po4KSzpzcfCdw==
X-Received: by 2002:a5d:9256:: with SMTP id e22mr307869iol.152.1631051634470; 
 Tue, 07 Sep 2021 14:53:54 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id t17sm192477iln.24.2021.09.07.14.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 14:53:53 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 18/42] bsd-user: save the path to the qemu emulator
Date: Tue,  7 Sep 2021 15:53:08 -0600
Message-Id: <20210907215332.30737-19-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907215332.30737-1-imp@bsdimp.com>
References: <20210907215332.30737-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
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
Cc: Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stacey Son <sson@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Save the path to the qemu emulator. This will be used later when we have
a more complete implementation of exec.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F3B36A21C
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:29:07 +0200 (CEST)
Received: from localhost ([::1]:36898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laL9X-0007nC-09
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiL-0005d9-9y
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:10 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:40755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKi6-0004GQ-3W
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:00 -0400
Received: by mail-il1-x135.google.com with SMTP id c18so43123844iln.7
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CWwnQ467vFuXEUPgGAX4g261qyt/TTfvpq777LQXKTo=;
 b=aq3AIIe4Mam9V5JJC+eMqka2/9IY+1ldTKt5o9oyyLcCn/DN3UoxVAquv/snpcESxk
 IT8qpO1vpzXRW/PYw4e87NDs7OSZpBdG78yxfgFvWzevnoauokHGR46wngh7Gkb78on6
 3Dv0tfR/zdJW+EsJSBbuCSch+IySTkZgcW5NvVQfTnlDjqQ4ny3jC7tRSl7HF4lE3KH/
 8WyvsliAdBntYrt6asxmeYHWsk1l5DirXrFg93Kof9/0feY4WM6pHcoprFhACOAQDd5S
 Fg8oOuI6aq7+kJbAcUSRQ8bQIQS8S++pkfsOnnZRhvZABjDHK8HRZf6S7hA91tB4juKb
 8dFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CWwnQ467vFuXEUPgGAX4g261qyt/TTfvpq777LQXKTo=;
 b=frNNH/I/KrYH4tv8pF4Wf9kBWAsBHPjgYycl/QTEV5pMqrTtNWVbCGZbo2QdOaLAqP
 k8g1Ur4Yp7Uxav32rDNm6wbhEK6kB4R7B2WMLilrfg3SqfJ40Y5ePrDLbEIQHIV5PosB
 czj4i9h/6AQRL4JkViJHHgXaWehnptXbP26OuVUQcmhGLqJYn8UEdMGKkcvI81ku9ix4
 iP2VtZXaCUgDxXlwKZQjbeRps8WYZhZlLb8g4K4I5xAe4g4kWtVoKLCrdIYmAzEi3yPM
 CfIzXWrpAqs7am0zznwYn31yDiApl792w4teRDgYubhqSb7F5fWr5WePMjk59bORxzmy
 qX3w==
X-Gm-Message-State: AOAM530oxkGwgG4UFzyU056FeQFUIhNYed7Dn/XWMJheZxTipbd9UIcy
 8XtI5Ic072rw9dnyhYLdlcCltcgP8zvcslnu
X-Google-Smtp-Source: ABdhPJwoLpktzVje1KhR4fGjg8BNAYHYcb64DyJLKg2gHjA0ucNm492f0x4biq1pzsOpmyS42xkjbQ==
X-Received: by 2002:a05:6e02:1c06:: with SMTP id
 l6mr7226225ilh.185.1619280044785; 
 Sat, 24 Apr 2021 09:00:44 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:44 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/48] bsd-user: use qemu_strtoul in preference to strtol
Date: Sat, 24 Apr 2021 09:59:50 -0600
Message-Id: <20210424160016.15200-23-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 8f5cb7162d..a98a45df21 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -37,6 +37,7 @@
 #include "tcg/tcg.h"
 #include "qemu/timer.h"
 #include "qemu/envlist.h"
+#include "qemu/cutils.h"
 #include "exec/log.h"
 #include "trace/control.h"
 
@@ -613,7 +614,7 @@ int main(int argc, char **argv)
     TaskState ts1, *ts = &ts1;
     CPUArchState *env;
     CPUState *cpu;
-    int optind;
+    int optind, rv;
     const char *r;
     const char *gdbstub = NULL;
     char **target_environ, **wrk;
@@ -678,8 +679,8 @@ int main(int argc, char **argv)
             }
         } else if (!strcmp(r, "s")) {
             r = argv[optind++];
-            x86_stack_size = strtol(r, (char **)&r, 0);
-            if (x86_stack_size <= 0) {
+            rv = qemu_strtoul(r, &r, 0, &x86_stack_size);
+            if (rv < 0 || x86_stack_size <= 0) {
                 usage();
             }
             if (*r == 'M') {
@@ -710,7 +711,10 @@ int main(int argc, char **argv)
                 exit(1);
             }
         } else if (!strcmp(r, "B")) {
-            guest_base = strtol(argv[optind++], NULL, 0);
+            rv = qemu_strtoul(argv[optind++], NULL, 0, &guest_base);
+            if (rv < 0) {
+                usage();
+            }
             have_guest_base = true;
         } else if (!strcmp(r, "drop-ld-preload")) {
             (void) envlist_unsetenv(envlist, "LD_PRELOAD");
-- 
2.22.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F5D48C389
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 12:50:09 +0100 (CET)
Received: from localhost ([::1]:51430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7c8n-00013k-1n
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 06:50:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bvL-0007G8-EJ
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:36:15 -0500
Received: from [2a00:1450:4864:20::52b] (port=35577
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bvJ-0004j0-Ay
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:36:15 -0500
Received: by mail-ed1-x52b.google.com with SMTP id q25so8789604edb.2
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 03:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0myPl6OHjV6t6kuNhHnigg5iN4dMo4gSfiEskPIfieA=;
 b=jIsj2kyp8DeiLAQooIjy42T7P0KY7QuG7pyaqWJlwfBUURNzoATBz/sfbDx0otQm91
 OF1nmieMi2qEhaQcBg8vhsDnPMjP67+hJK6F7Lo11b4lkp5lws8J4tW3Lu2N+abw4swz
 Lm43JO6TAzXooKXzFfS+UQd+OHt9uOhEgqkUhLduNDF2ryu8UYzVwYi9IPoX7gjAa2Nl
 FycOBK8i6iwEwZzdB8KkPAToKOvIrf/KHMCLE70aLKEVFBe56OOA4ORRh7Lr7l84Wg8V
 mDnS0tHIeQtmFL5j625gMIKInd142lSChq90b5hD7V0SM59YTIHLUIBS/kIohAWGocxq
 961w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0myPl6OHjV6t6kuNhHnigg5iN4dMo4gSfiEskPIfieA=;
 b=LeYSW4rtqG4+QKF+zPHpKqF1WIMtelxxRUHQ53EBgOfxbJToKDr2yfzd5MgWmHWenm
 Xd0iyBVfZo3UxvIE4ff6G2pPTZlZzF+ztNaxYoWLWFo//2qNeeuhFxINd9fwzUIoxVYk
 Y1JDCCL2YqV3uwgzOS9kebbOHCpxiXXwbOah0ij2y8j1axIhk5xT27I3HfvTwoYgXiab
 82mqz2SQNqFk1PfxuRQ8t1prQHM6hEHkqk8iHJPKPWX6Rj5VgnpZYOffOwKkGni3YmSR
 aeHqSaqmiNr8hAuArFHefLNywlPc3Yrzri4g9ckAd3+hiN/NGCr1sJjR82TtUkrBuGen
 allA==
X-Gm-Message-State: AOAM533p2AKPW/ONJNM2dctcsUTZEyew5sF7sYW1X2hFyRSXcNxbOXpp
 GFc2CupxpLW3DVCIJfIQtsL3xw==
X-Google-Smtp-Source: ABdhPJymbV//xnwnZ8uPL0qBapVEwY5DEzwi599knFop4vjcIp+ZyNYhLvjE038cGXcFvfphfwzX0w==
X-Received: by 2002:a17:907:212c:: with SMTP id
 qo12mr2503707ejb.713.1641987371933; 
 Wed, 12 Jan 2022 03:36:11 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r12sm417799ejb.32.2022.01.12.03.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 03:36:10 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 545651FFCE;
 Wed, 12 Jan 2022 11:27:24 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 22/31] monitor: move x-query-profile into accel/tcg to fix build
Date: Wed, 12 Jan 2022 11:27:13 +0000
Message-Id: <20220112112722.3641051-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220112112722.3641051-1-alex.bennee@linaro.org>
References: <20220112112722.3641051-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As --enable-profiler isn't defended in CI we missed this breakage.
Move the qmp handler into accel/tcg so we have access to the helpers
we need. While we are at it ensure we gate the feature on CONFIG_TCG.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Fixes: 37087fde0e ("qapi: introduce x-query-profile QMP command")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/773
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220105135009.1584676-23-alex.bennee@linaro.org>

diff --git a/qapi/machine.json b/qapi/machine.json
index b6a37e17c4..c87c81b803 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1503,6 +1503,7 @@
 ##
 { 'command': 'x-query-profile',
   'returns': 'HumanReadableText',
+  'if': 'CONFIG_TCG',
   'features': [ 'unstable' ] }
 
 ##
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 409ec8c38c..8b4cd6c59d 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -1090,4 +1090,35 @@ HumanReadableText *qmp_x_query_opcount(Error **errp)
     return human_readable_text_from_str(buf);
 }
 
+#ifdef CONFIG_PROFILER
+
+int64_t dev_time;
+
+HumanReadableText *qmp_x_query_profile(Error **errp)
+{
+    g_autoptr(GString) buf = g_string_new("");
+    static int64_t last_cpu_exec_time;
+    int64_t cpu_exec_time;
+    int64_t delta;
+
+    cpu_exec_time = tcg_cpu_exec_time();
+    delta = cpu_exec_time - last_cpu_exec_time;
+
+    g_string_append_printf(buf, "async time  %" PRId64 " (%0.3f)\n",
+                           dev_time, dev_time / (double)NANOSECONDS_PER_SECOND);
+    g_string_append_printf(buf, "qemu time   %" PRId64 " (%0.3f)\n",
+                           delta, delta / (double)NANOSECONDS_PER_SECOND);
+    last_cpu_exec_time = cpu_exec_time;
+    dev_time = 0;
+
+    return human_readable_text_from_str(buf);
+}
+#else
+HumanReadableText *qmp_x_query_profile(Error **errp)
+{
+    error_setg(errp, "Internal profiler not compiled");
+    return NULL;
+}
+#endif
+
 #endif /* !CONFIG_USER_ONLY */
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 14e3beeaaf..db4d186448 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -368,37 +368,6 @@ void qmp_display_reload(DisplayReloadOptions *arg, Error **errp)
     }
 }
 
-#ifdef CONFIG_PROFILER
-
-int64_t dev_time;
-
-HumanReadableText *qmp_x_query_profile(Error **errp)
-{
-    g_autoptr(GString) buf = g_string_new("");
-    static int64_t last_cpu_exec_time;
-    int64_t cpu_exec_time;
-    int64_t delta;
-
-    cpu_exec_time = tcg_cpu_exec_time();
-    delta = cpu_exec_time - last_cpu_exec_time;
-
-    g_string_append_printf(buf, "async time  %" PRId64 " (%0.3f)\n",
-                           dev_time, dev_time / (double)NANOSECONDS_PER_SECOND);
-    g_string_append_printf(buf, "qemu time   %" PRId64 " (%0.3f)\n",
-                           delta, delta / (double)NANOSECONDS_PER_SECOND);
-    last_cpu_exec_time = cpu_exec_time;
-    dev_time = 0;
-
-    return human_readable_text_from_str(buf);
-}
-#else
-HumanReadableText *qmp_x_query_profile(Error **errp)
-{
-    error_setg(errp, "Internal profiler not compiled");
-    return NULL;
-}
-#endif
-
 static int qmp_x_query_rdma_foreach(Object *obj, void *opaque)
 {
     RdmaProvider *rdma;
diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 407a1da800..e90f20a107 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -358,6 +358,7 @@ SRST
     Show host USB devices.
 ERST
 
+#if defined(CONFIG_TCG)
     {
         .name       = "profile",
         .args_type  = "",
@@ -365,6 +366,7 @@ ERST
         .help       = "show profiling information",
         .cmd_info_hrt = qmp_x_query_profile,
     },
+#endif
 
 SRST
   ``info profile``
-- 
2.30.2



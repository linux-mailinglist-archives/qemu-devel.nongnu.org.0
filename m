Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6494854B1
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 15:36:18 +0100 (CET)
Received: from localhost ([::1]:49894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n57Oj-0005Tz-Vf
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 09:36:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n574l-0001JA-CV
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:15:42 -0500
Received: from [2a00:1450:4864:20::435] (port=36591
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n574a-000824-66
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:15:37 -0500
Received: by mail-wr1-x435.google.com with SMTP id r17so83294180wrc.3
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 06:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=86Yt5zhC1h3HZ5qW3lGqfRT4JQiaWr3EJLEC/Aa05K4=;
 b=L+75PvBrURG0dPbKUy6ceyF7tytO2FrQZjoAt3v6p8iOj4OTheJipSALaelz+K7LMl
 gsUVoLg8/kWnri6BljzKzPHY4bmNIv9mmEiYvocMddDyM/kGrIT5IiYh6wAI/9cJ86Ly
 B27v4hfSHFm/bcQUEdjYEAkr2WBlGyD6crSRkr/V0GpA/MJefCRu7fb6avDgPtGsEOu4
 wRXrINjLPx93OcXbIK/SxWdEEnxt1+g1uTyeL15WKryJRUiB4iIDnYmXVHFhjs1RW5b2
 j2A+VG5+PS0dd3CpBMhugEnMdn8P4B8vG20MqUz8QY6W2pdNDr6AxDlWyUH3zIKuSnHu
 6GlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=86Yt5zhC1h3HZ5qW3lGqfRT4JQiaWr3EJLEC/Aa05K4=;
 b=ZUO27VmFhtFZq/lJuNhLs8I51/x2HY1K/lsn5pjcwzOHIKBg5Hhc0ukbtU9WdmGV9H
 lbJgQ85Q/jtn1KrF7Fy63l/qCwA5MX/Q9cBCp3hQpzCiJdin7XdEeAEEpVY2kz4OE4Gq
 x4IvQ3PrKDx2+stZlXpG0xVjFESQSEvukwtA7ZNOtZoshyS6iHO6uDdqscIYqJkrgytw
 K4kUJHraphXXUzqrlKY+XgM/TO+aA33ZK4YGF6RiMxNVZ6wi+1olfF/4gBH++J1sCIF2
 nPTt/TsuSMGZZjgoA+rys8hkMdyzatzB+/UEvE18QpN/5SCMlzse1iiD8Sl+NzbvW4EQ
 WjLw==
X-Gm-Message-State: AOAM530VdgBQR/Taap7wnt+u6GjtJws1rX4nhcWC9AQhbhPL6lCYnUZo
 PaKrZAjiE5BHpqjgGyHoLELeUA==
X-Google-Smtp-Source: ABdhPJxwfSzesEBqHdLKr3MZIjjPk6xw007t+Cw3vmg0JkQUUIEymawbF7p/34uRroKD7M7nuHvw5g==
X-Received: by 2002:adf:fb07:: with SMTP id c7mr9563036wrr.608.1641392115321; 
 Wed, 05 Jan 2022 06:15:15 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d10sm44845450wri.57.2022.01.05.06.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 06:15:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2A33C1FFBA;
 Wed,  5 Jan 2022 13:50:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 22/34] monitor: move x-query-profile into accel/tcg to fix
 build
Date: Wed,  5 Jan 2022 13:49:57 +0000
Message-Id: <20220105135009.1584676-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220105135009.1584676-1-alex.bennee@linaro.org>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: fam@euphon.net, Eduardo Habkost <eduardo@habkost.net>, berrange@redhat.com,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, f4bug@amsat.org,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
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
Message-Id: <20211214195048.1438209-1-alex.bennee@linaro.org>

---
v3
  - also add #ifdef CONFIG_TCG to hmp-commands-info.hx
---
 qapi/machine.json    |  1 +
 accel/tcg/cpu-exec.c | 31 +++++++++++++++++++++++++++++++
 monitor/qmp-cmds.c   | 31 -------------------------------
 hmp-commands-info.hx |  2 ++
 4 files changed, 34 insertions(+), 31 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 372535b348..91d15b91c3 100644
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



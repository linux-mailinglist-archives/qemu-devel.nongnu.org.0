Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D7C6B5131
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 20:54:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1painY-0001HM-Im; Fri, 10 Mar 2023 14:53:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1painV-0001GJ-Rc
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:53:01 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1painU-0004fZ-5n
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:53:01 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 p3-20020a17090ad30300b0023a1cd5065fso6222761pju.0
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 11:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678477979;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T5bbx8sg/Anm+07Z29jSPoGQLySawFafuCtWNzz/H14=;
 b=cWJQDoMyjUWqWTPZReKRO0DZCX2VzSlsrzFVF3CHUF3xks7vKk0ORhv+BUtxaKD5jm
 ttA0HA3hGTk6IoB7WqTFggagE+ApdE9I1MsL4yXHWfzFi5Obje8KIhZX2injtICv4Wr7
 e4diO2jQmLcPR42jNcG16qm1DlWx/JKiWFYQ4NrkygBTgbPkZ/yXsZCw2WUs87xccitJ
 Sc4S8LkqZP4wgrbWvgjLj3YfBPG9K8mlyaajqdVGdKOfZAfnR3rnG00RHEUTX3agxkyl
 TIZxD1Il/pzh5rH0BSLGgdVAi0NZqXEie4UWWp85gXFaqBOZF4MtLRzduA1iEmOuEA9v
 UVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678477979;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T5bbx8sg/Anm+07Z29jSPoGQLySawFafuCtWNzz/H14=;
 b=kaLJg1FVAWtYj4UgGnwPMQbYUUYyig1fxrbUIS9a+9OzHQTZ+HIqYojV0teCXctqnc
 avJcWSzDkXXomzMRswQVqh2wyX3poUGTKFlw62nzN1VGoMPcHjxvieSTc2I7GTFPY8jV
 BcukujywnkB/1WWE9Dj8vAhH1vOSekJIEpT2MLOyB+X8rj1ykruwztmRohHDYtzx40TI
 i/Iu63ehT1PRDbfR3cAdo0pNwJwOAVgcwVZaahmPI8/MoxcFdNybVyGPfUvUMZfkl883
 m2NTgp6CfGmutgsgGpeaMFAu1BdvnJvQLcqu4lj3J/h/6CCMBlwFcoVGyf0+++LHi/K9
 y8nQ==
X-Gm-Message-State: AO0yUKXwInFvplppprYPllnwhn2ZSmtQGzEkw67YZ+3KBDjgglwqox+A
 LvpVMt0hunHCj1e7NkTWJ6WfxS7A18HTzjrGBgQ=
X-Google-Smtp-Source: AK7set9lJ9YnSW3BXTt4U+0RD/uMAPac54mGIXHkdr4fTGHPaXcpQAP+CMboPCzGT4FMtP6HJSwp8A==
X-Received: by 2002:a17:902:da90:b0:19c:e405:4446 with SMTP id
 j16-20020a170902da9000b0019ce4054446mr31551859plx.30.1678477978841; 
 Fri, 10 Mar 2023 11:52:58 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a170903244100b001991d6c6c64sm351465pls.185.2023.03.10.11.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 11:52:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 6/7] include/qemu: Split out plugin-event.h
Date: Fri, 10 Mar 2023 11:52:51 -0800
Message-Id: <20230310195252.210956-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310195252.210956-1-richard.henderson@linaro.org>
References: <20230310195252.210956-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The usage in hw/core/cpu.h only requires QEMU_PLUGIN_EV_MAX.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h       |  2 +-
 include/qemu/plugin-event.h | 26 ++++++++++++++++++++++++++
 include/qemu/plugin.h       | 17 +----------------
 3 files changed, 28 insertions(+), 17 deletions(-)
 create mode 100644 include/qemu/plugin-event.h

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 75689bff02..821e937020 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -30,7 +30,7 @@
 #include "qemu/rcu_queue.h"
 #include "qemu/queue.h"
 #include "qemu/thread.h"
-#include "qemu/plugin.h"
+#include "qemu/plugin-event.h"
 #include "qom/object.h"
 
 typedef int (*WriteCoreDumpFunction)(const void *buf, size_t size,
diff --git a/include/qemu/plugin-event.h b/include/qemu/plugin-event.h
new file mode 100644
index 0000000000..7056d8427b
--- /dev/null
+++ b/include/qemu/plugin-event.h
@@ -0,0 +1,26 @@
+/*
+ * Copyright (C) 2017, Emilio G. Cota <cota@braap.org>
+ *
+ * License: GNU GPL, version 2 or later.
+ *   See the COPYING file in the top-level directory.
+ */
+#ifndef QEMU_PLUGIN_EVENT_H
+#define QEMU_PLUGIN_EVENT_H
+
+/*
+ * Events that plugins can subscribe to.
+ */
+enum qemu_plugin_event {
+    QEMU_PLUGIN_EV_VCPU_INIT,
+    QEMU_PLUGIN_EV_VCPU_EXIT,
+    QEMU_PLUGIN_EV_VCPU_TB_TRANS,
+    QEMU_PLUGIN_EV_VCPU_IDLE,
+    QEMU_PLUGIN_EV_VCPU_RESUME,
+    QEMU_PLUGIN_EV_VCPU_SYSCALL,
+    QEMU_PLUGIN_EV_VCPU_SYSCALL_RET,
+    QEMU_PLUGIN_EV_FLUSH,
+    QEMU_PLUGIN_EV_ATEXIT,
+    QEMU_PLUGIN_EV_MAX, /* total number of plugin events we support */
+};
+
+#endif /* QEMU_PLUGIN_EVENT_H */
diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index e0ebedef84..6bf4bce188 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -12,24 +12,9 @@
 #include "qemu/error-report.h"
 #include "qemu/queue.h"
 #include "qemu/option.h"
+#include "qemu/plugin-event.h"
 #include "exec/memopidx.h"
 
-/*
- * Events that plugins can subscribe to.
- */
-enum qemu_plugin_event {
-    QEMU_PLUGIN_EV_VCPU_INIT,
-    QEMU_PLUGIN_EV_VCPU_EXIT,
-    QEMU_PLUGIN_EV_VCPU_TB_TRANS,
-    QEMU_PLUGIN_EV_VCPU_IDLE,
-    QEMU_PLUGIN_EV_VCPU_RESUME,
-    QEMU_PLUGIN_EV_VCPU_SYSCALL,
-    QEMU_PLUGIN_EV_VCPU_SYSCALL_RET,
-    QEMU_PLUGIN_EV_FLUSH,
-    QEMU_PLUGIN_EV_ATEXIT,
-    QEMU_PLUGIN_EV_MAX, /* total number of plugin events we support */
-};
-
 /*
  * Option parsing/processing.
  * Note that we can load an arbitrary number of plugins.
-- 
2.34.1



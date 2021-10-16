Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9049343043A
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 20:37:27 +0200 (CEST)
Received: from localhost ([::1]:42770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mboYg-0007gG-Lj
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 14:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDf-0008PU-03
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:43 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:37476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDa-00029x-Pq
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:42 -0400
Received: by mail-pf1-x433.google.com with SMTP id q19so11274354pfl.4
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 11:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9lqN/uiH3UUIeVg5yhYMxWg7ld7QYTaBAGHdI8OeAIs=;
 b=mPAuZ95NqgeCGGOUN11IL5iIs6uSGsT7NGdnaSOP/QOhK6GgrDBqtCERNfRj3WQcek
 cGE1Nk6tKBCh71BUyrvVoAiQb36FaXI2OLV/Tmpb9Sb5iyVE1eTegvkmRP51EUt8bV4y
 qPi8YrW7cCWx00b75//wBzJF/VHaESqaMDE2QJnHXgRX1pmXTlX209/Rzao6jS3+eTDf
 y4lIupYx+BtzNlWan1NyxP7NiMOtB9gG67y2PyS5bdbouV1FtBsxL9h+NlA0AadK1d/T
 j0gKbbXlnz8Jiu5wRvSCkqo8/5Q7nrwWpIg8Z/XPbmqic5g+dfYuJJkK8e8H6jf08cv1
 mEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9lqN/uiH3UUIeVg5yhYMxWg7ld7QYTaBAGHdI8OeAIs=;
 b=VmwqvDGKwRhTnjsKG+I+YB0nFbdJ5rtytP3LtfvVmWTlEFMeFcDPc1ziujCH+r3Ylc
 mh6BPefi9PU1dBO6MrOznPeVUhvLDi6vrp9pp5bp9qyE1x/QsUGZhdlBvCUyHM+Qc+6I
 1zdZf9SWblrkVtj5GyN6S7Z9XukvvpjXxDNXX94AXjlNc4WKj1JiWD1loB/ppbpllrmy
 eeqZx92YmniO4UStvaZz7w9A6OkFhscAmPtyx7wSCVBkVqKkycqENGpjsSK1Y63hjYn8
 5pCRApPBaWCg73Qn07mCblEorfXdD/YYthlMFtd+szY+JQaP/rRKdVxc9eZ4PENRCznO
 4uVw==
X-Gm-Message-State: AOAM530fgi08FjSI9Hr++K6Vl6vrvEWbCxAhM/1PHL1+QU3SigU5jCf3
 NYsxWiuG/9MMsmOh0m/mZ3t9WLbnGzV4lg==
X-Google-Smtp-Source: ABdhPJxpka6enIz+swhTS0AJV6ZoARdmBcNtb4SmfXAF7jMtZSF5qDOUvgXz+0lgI7+AkWmBrvLvhQ==
X-Received: by 2002:a05:6a00:1ad4:b0:44d:9ab:c129 with SMTP id
 f20-20020a056a001ad400b0044d09abc129mr19168036pfv.14.1634408137474; 
 Sat, 16 Oct 2021 11:15:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id ob5sm5075097pjb.2.2021.10.16.11.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 11:15:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/24] Revert "cpu: Move cpu_common_props to hw/core/cpu.c"
Date: Sat, 16 Oct 2021 11:15:14 -0700
Message-Id: <20211016181514.3165661-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016181514.3165661-1-richard.henderson@linaro.org>
References: <20211016181514.3165661-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 1b36e4f5a5de585210ea95f2257839c2312be28f.

Despite a comment saying why cpu_common_props cannot be placed in
a file that is compiled once, it was moved anyway.  Revert that.

Since then, Property is not defined in hw/core/cpu.h, so it is now
easier to declare a function to install the properties rather than
the Property array itself.

Cc: Eduardo Habkost <ehabkost@redhat.com>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h |  1 +
 cpu.c                 | 21 +++++++++++++++++++++
 hw/core/cpu-common.c  | 17 +----------------
 3 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index b7d5bc1200..1a10497af3 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1008,6 +1008,7 @@ void QEMU_NORETURN cpu_abort(CPUState *cpu, const char *fmt, ...)
     GCC_FMT_ATTR(2, 3);
 
 /* $(top_srcdir)/cpu.c */
+void cpu_class_init_props(DeviceClass *dc);
 void cpu_exec_initfn(CPUState *cpu);
 void cpu_exec_realizefn(CPUState *cpu, Error **errp);
 void cpu_exec_unrealizefn(CPUState *cpu);
diff --git a/cpu.c b/cpu.c
index e1799a15bc..9bce67ef55 100644
--- a/cpu.c
+++ b/cpu.c
@@ -179,6 +179,27 @@ void cpu_exec_unrealizefn(CPUState *cpu)
     cpu_list_remove(cpu);
 }
 
+static Property cpu_common_props[] = {
+#ifndef CONFIG_USER_ONLY
+    /*
+     * Create a memory property for softmmu CPU object,
+     * so users can wire up its memory. (This can't go in hw/core/cpu.c
+     * because that file is compiled only once for both user-mode
+     * and system builds.) The default if no link is set up is to use
+     * the system address space.
+     */
+    DEFINE_PROP_LINK("memory", CPUState, memory, TYPE_MEMORY_REGION,
+                     MemoryRegion *),
+#endif
+    DEFINE_PROP_BOOL("start-powered-off", CPUState, start_powered_off, false),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+void cpu_class_init_props(DeviceClass *dc)
+{
+    device_class_set_props(dc, cpu_common_props);
+}
+
 void cpu_exec_initfn(CPUState *cpu)
 {
     cpu->as = NULL;
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index e2f5a64604..9e3241b430 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -257,21 +257,6 @@ static int64_t cpu_common_get_arch_id(CPUState *cpu)
     return cpu->cpu_index;
 }
 
-static Property cpu_common_props[] = {
-#ifndef CONFIG_USER_ONLY
-    /* Create a memory property for softmmu CPU object,
-     * so users can wire up its memory. (This can't go in hw/core/cpu.c
-     * because that file is compiled only once for both user-mode
-     * and system builds.) The default if no link is set up is to use
-     * the system address space.
-     */
-    DEFINE_PROP_LINK("memory", CPUState, memory, TYPE_MEMORY_REGION,
-                     MemoryRegion *),
-#endif
-    DEFINE_PROP_BOOL("start-powered-off", CPUState, start_powered_off, false),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void cpu_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -286,7 +271,7 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     dc->realize = cpu_common_realizefn;
     dc->unrealize = cpu_common_unrealizefn;
     dc->reset = cpu_common_reset;
-    device_class_set_props(dc, cpu_common_props);
+    cpu_class_init_props(dc);
     /*
      * Reason: CPUs still need special care by board code: wiring up
      * IRQs, adding reset handlers, halting non-first CPUs, ...
-- 
2.25.1



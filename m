Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E73842E7F2
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:38:36 +0200 (CEST)
Received: from localhost ([::1]:52620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbEzL-00063B-9w
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:38:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEc4-0006U8-Ce
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:32 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:39604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEc2-0002lr-MW
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:32 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 ls18-20020a17090b351200b001a00250584aso8447411pjb.4
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9lqN/uiH3UUIeVg5yhYMxWg7ld7QYTaBAGHdI8OeAIs=;
 b=P5B71VSi1+VMlTDxlHkiYLGQsICQM6ftakBQ+W5AWd7paiMDzsaXXwtuMMt75eOFro
 SVl2Id2rdy+lQfOiAbK4okwACo7ulJaDwy5CwbzTbkwWqWzMSc4iFrSIXENbenU/xf/F
 H/rNSprsA+KSmeR3BDfazcX1soyZVQ/v6hn0MEZ2QFM7MftW18Caf9BHHkhd9GVa+lql
 V4U7j8tZsaSuyFKSNPtmQngNquNZJPwIdoIh8WbBFG0V+Zx9FP1KrYI6Awx0a0ErvkcZ
 cdDO4VruWnI/BzA/+scwuXQZCc4dmfMnDgMbAL216hDGm+VGTqLhc3k+iZfOYwTEfRgz
 KNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9lqN/uiH3UUIeVg5yhYMxWg7ld7QYTaBAGHdI8OeAIs=;
 b=NPcxTi5nCDaSFxT1HYSHMZ77TMWX/FACNKY5L/nYIdR1TX6U7S/yREhNoTIws5xnKt
 epuRFqX6OXRgw7+Gksb5wFBMxLkIH6uGK2UXfC4lZwY/FAxgVRr1QOLkmbo0X3WnmuCF
 9yl9tAdJuzMKnbcu2kpOGUQBXPiCbKjAulLClzNVQb6jynEcLE0H3Wvoo1U/eLffHkqE
 rOLHTLGus2JnoFv0E2aTU6KoYgAFQ5Sfj8K/EMF52fW+0K8nKGrcSf+V9ocDZgCgXqcm
 BAsXGXTJLgHfMndKjeKZRecBi+Vx7wND34EDtZBaUVq9G375AVWrEl5SzSJgZxBvVy8I
 XlrA==
X-Gm-Message-State: AOAM530M95F07GJuoykNE43wei6qDU4YZt5F8fDxZXGxyos/Q5AUnWGf
 wTdflZbw9mvPlY6QsJienPNfQaQGsNI=
X-Google-Smtp-Source: ABdhPJymYvhWniIWzjO+QJSnE1JfZ0eQutcTKxS2xTahydRJZdmWC9HAXMSRH48i6XaJQY1AEDVXPQ==
X-Received: by 2002:a17:90a:1507:: with SMTP id
 l7mr10749099pja.141.1634271269353; 
 Thu, 14 Oct 2021 21:14:29 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q8sm10236885pja.52.2021.10.14.21.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:14:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 42/67] Revert "cpu: Move cpu_common_props to hw/core/cpu.c"
Date: Thu, 14 Oct 2021 21:10:28 -0700
Message-Id: <20211015041053.2769193-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alex.bennee@linaro.org,
 laurent@vivier.eu, imp@bsdimp.com, Eduardo Habkost <ehabkost@redhat.com>
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



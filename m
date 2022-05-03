Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1015D518F91
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 23:02:00 +0200 (CEST)
Received: from localhost ([::1]:48908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzeh-000403-0z
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 17:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlya0-0000r8-6Y
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:53:04 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:46724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZx-0006P4-Qk
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:53:03 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 6so3178141pgb.13
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sy4e+GA4siKpkmbYnx/SmxHTQKZjthdwLglaK4m7nGc=;
 b=bnm700Ov3cN4Mn7/s9nRHWlAqpin4qDrn39pZMYTJwYiXEiEmDfCCSGmdgyYpMCPVt
 N6NwNMy8auxJKYW8aIW9tzkiTwQ3CmqJuO3RJSIB0CVwdtfITF+8nGvg2oQO1LXnbajF
 wGN5mwCCPZkhIB7p3tvSZOk86RB1JTqsG7X/fXjfwJpSpDJlnvqiq6MZmBhIiqTZ9jrz
 CNbivUplEmuGMdmFe7GAfe9kv9eJyI+WaKIo6sDZtdwiH6Kp0vJQpKLskNwaQ4l35dWH
 xJzCD5LEyM2VmTEY1iidt7wCeCZ3+eY6bL5nfqi/TLt2gDnTqHllJspTMRx6xzYAJESC
 wG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sy4e+GA4siKpkmbYnx/SmxHTQKZjthdwLglaK4m7nGc=;
 b=kKFOk8GRj9mV2QNIhImiambfvVY0DOHjNa65XtkucXPE92tC031NQ2X/bxmKHGVrQB
 M/7rqeZI/6I3PdOOaWR6l1EfKgYmTgBKlGkyIt0OaZeP7TkRo5BknugpK4BBgfncDv+j
 YhL9bHPDphV/Dz0Fnb3BRkGEDZslirRSVKZxaBbo0u3p/zMvB2jXkydnUMovD9q0meGR
 THu0KZuvbpYgGYj0/t3W4yt25iIgEQh8pwBu/CdZWyyqewqSLB7uJMVcJCRHNF3GnsWj
 dkI/iDtf5gUlTvyTZoCeMsW8bd9pkZYzwlgh2LR7QafR3L2689CLLjcn9jISZXd2kLn2
 IVCA==
X-Gm-Message-State: AOAM532/pFTuJS+Tkv26nB6iiwaoGiyQ6ptFIA+YvZkvJSxKqnu4KLlO
 08iCLfaICJMJE3Q6LIZE/uWrY6hGpJRWkQ==
X-Google-Smtp-Source: ABdhPJzC4FK76TNxZ9z7JF7r7QKX+0vrBh5KnbmgThSMSqMpbJAbSp0lBP3lIfIgWwaFp4VnmKvUuA==
X-Received: by 2002:a63:d50c:0:b0:39d:61df:ad7b with SMTP id
 c12-20020a63d50c000000b0039d61dfad7bmr15255632pgg.47.1651607580518; 
 Tue, 03 May 2022 12:53:00 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a17090b025000b001dbe11be891sm1692286pjb.44.2022.05.03.12.52.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:53:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 74/74] tests/tcg/rx: Enable semihosting multiarch tests
Date: Tue,  3 May 2022 12:48:43 -0700
Message-Id: <20220503194843.1379101-75-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/rx/outc.c                  | 15 +++++++++++++++
 tests/tcg/rx/Makefile.softmmu-target | 24 ++++++++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 tests/tcg/rx/outc.c
 create mode 100644 tests/tcg/rx/Makefile.softmmu-target

diff --git a/tests/tcg/rx/outc.c b/tests/tcg/rx/outc.c
new file mode 100644
index 0000000000..3f8720d7ca
--- /dev/null
+++ b/tests/tcg/rx/outc.c
@@ -0,0 +1,15 @@
+/*
+ * minilib.h compatibility code
+ *
+ * Copyright Linaro Ltd 2022
+ *
+ * Rely on newlib/libgloss for functionality.
+ */
+
+#include "minilib.h"
+#include <sys/unistd.h>
+
+void __sys_outc(char c)
+{
+    write(1, &c, 1);
+}
diff --git a/tests/tcg/rx/Makefile.softmmu-target b/tests/tcg/rx/Makefile.softmmu-target
new file mode 100644
index 0000000000..aaa1cebb92
--- /dev/null
+++ b/tests/tcg/rx/Makefile.softmmu-target
@@ -0,0 +1,24 @@
+#
+# RX system tests
+#
+
+RX_SYSTEM_SRC = $(SRC_PATH)/tests/tcg/rx
+VPATH += $(RX_SYSTEM_SRC)
+
+TESTS += $(MULTIARCH_TESTS)
+
+CFLAGS += -Og -g $(MINILIB_INC)
+LDFLAGS += -msim
+
+MINILIB_OBJS += outc.o
+.PRECIOUS: $(MINILIB_OBJS)
+
+%.o: %.c
+	$(call quiet-command, $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -c $< -o $@, CC, $@)
+
+%: %.o $(LINK_SCRIPT) $(MINILIB_OBJS)
+	$(call quiet-command, $(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS) $(MINILIB_OBJS), LD, $@)
+
+QEMU_OPTS = -M gdbsim-r5f562n7 -m 128 -semihosting-config enable=on,target=native,chardev=output -kernel
+
+memory: CFLAGS+=-DCHECK_UNALIGNED=0
-- 
2.34.1



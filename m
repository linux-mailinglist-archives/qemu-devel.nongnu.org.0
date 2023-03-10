Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA116B5135
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 20:55:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paina-0001Hj-47; Fri, 10 Mar 2023 14:53:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1painW-0001Go-QR
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:53:02 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1painV-0004fr-9S
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:53:02 -0500
Received: by mail-pl1-x633.google.com with SMTP id a2so6799044plm.4
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 11:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678477980;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZI3yEJ2Lc21he8le+fWeyTzXmLbDRb40vBMQaTo2uKo=;
 b=O07Hx36OIOASh009kICTNTm+IvGKtb/wdB8UCZ+Hu/5G55YMmswXKI9IiWS/GyX2LM
 vJp5yY56HaNDQ+v4Z0EHoYbkh6519Eq5ZJX4KxH7lpSs0f2UjgsgEBfE4pmZzdafc0VA
 otw+x3tspp3LTNUMhxOyHl2wb9aNXM23f7BBssEpljBQY/spjUiPpFgtfKxkvRNAmFEm
 yvLlzX9pQrukULz7p9w9ZyTXK7VrYTT6dE7UD8QpMM/FZx77vYP4GsnhXRh/0q9l2iOO
 UByQ4YWVyr5Lax4r4rX7jvacAon7D1H5ggrUMDtvws4l/JSeI0dQYOjg0ET0r+ucvqNE
 523w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678477980;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZI3yEJ2Lc21he8le+fWeyTzXmLbDRb40vBMQaTo2uKo=;
 b=lafWilVW3WeDbaxxwOhaOjDhs75Dh4/BcfF42S6cbB20OfGrZHfXSUu90Hn1hNhoQd
 Hr5cxAutrMb26MuHA14Wc6lsQ86SaYwNJffE95YdLg72NJyRuC1oziUYmB5EaYCR6YJK
 M8f1x883nDqxE1+p3RPbghZyWLo5BSYtHrU8NZN9BeIfNB3e4fZbQzqQbxZpE1gmo+7W
 hlmxu+SXgEOD+JNjI0a5235v5rvcI61xZOVIUKVBl5tlirb5ElczlJztkqEjZcB0mpXZ
 vSK+b04SfObBDVEc18HHNq1vVVadvUxvijz3CHa7ixMZeiDlsBUMKh2eTU1Xco1ZuDgX
 5yfQ==
X-Gm-Message-State: AO0yUKXHjrNPjZIOx80FbD2K3e9xcnDSZ90RbOy8tXBZeOmgP75auS+x
 FoCw3IrwUugBbaD8rvGHvy9ufb8X4aOltPOtZhk=
X-Google-Smtp-Source: AK7set9kxIR3SZb7TZDDlqe1KIHierwSjXQaMIVB+su0lnS1GCAkZss2Euwmn3ICVlIP3Kbnusqnug==
X-Received: by 2002:a17:902:ce90:b0:19a:9434:af30 with SMTP id
 f16-20020a170902ce9000b0019a9434af30mr30396630plg.18.1678477979763; 
 Fri, 10 Mar 2023 11:52:59 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a170903244100b001991d6c6c64sm351465pls.185.2023.03.10.11.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 11:52:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 7/7] include/qemu/plugin: Inline
 qemu_plugin_disable_mem_helpers
Date: Fri, 10 Mar 2023 11:52:52 -0800
Message-Id: <20230310195252.210956-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310195252.210956-1-richard.henderson@linaro.org>
References: <20230310195252.210956-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

Now that we've broken the include loop with cpu.h,
we can bring this inline.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/plugin.h |  6 +++++-
 plugins/core.c        | 11 -----------
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index 6bf4bce188..bc0781cab8 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -14,6 +14,7 @@
 #include "qemu/option.h"
 #include "qemu/plugin-event.h"
 #include "exec/memopidx.h"
+#include "hw/core/cpu.h"
 
 /*
  * Option parsing/processing.
@@ -204,7 +205,10 @@ void qemu_plugin_atexit_cb(void);
 
 void qemu_plugin_add_dyn_cb_arr(GArray *arr);
 
-void qemu_plugin_disable_mem_helpers(CPUState *cpu);
+static inline void qemu_plugin_disable_mem_helpers(CPUState *cpu)
+{
+    cpu->plugin_mem_cbs = NULL;
+}
 
 /**
  * qemu_plugin_user_exit(): clean-up callbacks before calling exit callbacks
diff --git a/plugins/core.c b/plugins/core.c
index 04632886b9..9912f2cfdb 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -553,17 +553,6 @@ void qemu_plugin_user_postfork(bool is_child)
     }
 }
 
-
-/*
- * Call this function after longjmp'ing to the main loop. It's possible that the
- * last instruction of a TB might have used helpers, and therefore the
- * "disable" instruction will never execute because it ended up as dead code.
- */
-void qemu_plugin_disable_mem_helpers(CPUState *cpu)
-{
-    cpu->plugin_mem_cbs = NULL;
-}
-
 static bool plugin_dyn_cb_arr_cmp(const void *ap, const void *bp)
 {
     return ap == bp;
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAAF3C1623
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:38:17 +0200 (CEST)
Received: from localhost ([::1]:56118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1W6S-0008Hg-Px
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:38:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1VnA-000197-QH
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:21 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:46701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vn8-0008Jw-Dc
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:19 -0400
Received: by mail-ej1-x633.google.com with SMTP id c17so10205986ejk.13
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J5848Llpvi/KqMPcQycDbJwiq+hPIvn6uOvqDWiLumI=;
 b=V/JMAWiQ7MdNjDiYcQB/0CNnenD8+vHD8fLxIAfvo71V7yVj93+EID9pWG6ceN7mTh
 jZKcY4lbOJ89C1nOzmZ85HcbYD7fWPvj56gtyDIgFbZ89RNrRMCxo0cVM5ZA2mJUXX6y
 UuxTAo0N6mZowu3k49GxzO7SRCCXZLayjadSxgsr8WIaAvO7E/ToCILtua2JLuVoGa1E
 3QLylKrfjUMoxNncaiN5BUfrpjgWyt5mQpJanhcBsOtFz3HUj0zFpeAO+nBkkcUMMpL2
 sKfCvPxLmRh1UxDl+3M9j1reuZXvY0O9adCRgnzT0gAy/8TGdCRPOj+M+6jm16QnpC19
 IBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=J5848Llpvi/KqMPcQycDbJwiq+hPIvn6uOvqDWiLumI=;
 b=uJfb+Sq4evz/I1OpFf1xBDUmqgo7Z/9OZS/+fKW80z92ZOhjO1App4+vB8EWIJR6gZ
 GCSKeT6Ki312hTkS5btq1Mc6++Ssx62ZvjR04mvgJsPqlSwFhNRBT0Wx3hL8t0SM3efw
 y4x3MOs7Dqyj9Vp44ckAtwtVNVDFbplD7r/+sUbBQyLwB2qFTRqlts69IdjY3hDmDE6Z
 gLsySe0KkM4kjbUIKCE3gVmQgwqZTO3a++ANEIXe6w2JGp4tWfjopcAOzkorO5xh9BKL
 chIkXGLMBZslU55ZqYadFv/VoFxdQaVqdBQ65XMP0DQIJDzr2M8rv+yHqICvJPYPscqh
 hlGA==
X-Gm-Message-State: AOAM532Y5YAwqER1qzgYgdQ/3Pm34l6pJSZWJbnxutsPx+hoxqFyyZv4
 x0dMMIV+7HX3kmfNo+3HJva8bgn7D3o=
X-Google-Smtp-Source: ABdhPJyLasWyjf1Rmhrmy1+ekLi2NAZ5yYkSXr4xEl18QR8ZxMjUsOX6xBGhOp+gMnLL3aEtYOld+Q==
X-Received: by 2002:a17:906:cb86:: with SMTP id
 mf6mr9435107ejb.116.1625757496830; 
 Thu, 08 Jul 2021 08:18:16 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:18:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 38/48] monitor/tcg: move tcg hmp commands to accel/tcg,
 register them dynamically
Date: Thu,  8 Jul 2021 17:17:38 +0200
Message-Id: <20210708151748.408754-39-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Jose R . Ziviani" <jziviani@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

One more little step towards modular tcg ...

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210624103836.2382472-35-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/tcg/hmp.c       | 29 +++++++++++++++++++++++++++++
 accel/tcg/meson.build |  1 +
 hmp-commands-info.hx  |  2 --
 monitor/misc.c        | 18 ------------------
 4 files changed, 30 insertions(+), 20 deletions(-)
 create mode 100644 accel/tcg/hmp.c

diff --git a/accel/tcg/hmp.c b/accel/tcg/hmp.c
new file mode 100644
index 0000000000..a6e72fdb3e
--- /dev/null
+++ b/accel/tcg/hmp.c
@@ -0,0 +1,29 @@
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "exec/exec-all.h"
+#include "monitor/monitor.h"
+#include "sysemu/tcg.h"
+
+static void hmp_info_jit(Monitor *mon, const QDict *qdict)
+{
+    if (!tcg_enabled()) {
+        error_report("JIT information is only available with accel=tcg");
+        return;
+    }
+
+    dump_exec_info();
+    dump_drift_info();
+}
+
+static void hmp_info_opcount(Monitor *mon, const QDict *qdict)
+{
+    dump_opcount_info();
+}
+
+static void hmp_tcg_register(void)
+{
+    monitor_register_hmp("jit", true, hmp_info_jit);
+    monitor_register_hmp("opcount", true, hmp_info_opcount);
+}
+
+type_init(hmp_tcg_register);
diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
index 0ae9180282..137a1a44cc 100644
--- a/accel/tcg/meson.build
+++ b/accel/tcg/meson.build
@@ -15,6 +15,7 @@ specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
 
 specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
   'cputlb.c',
+  'hmp.c',
 ))
 
 tcg_module_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index ce42aef47a..27206ac049 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -274,7 +274,6 @@ ERST
         .args_type  = "",
         .params     = "",
         .help       = "show dynamic compiler info",
-        .cmd        = hmp_info_jit,
     },
 #endif
 
@@ -289,7 +288,6 @@ ERST
         .args_type  = "",
         .params     = "",
         .help       = "show dynamic compiler opcode counters",
-        .cmd        = hmp_info_opcount,
     },
 #endif
 
diff --git a/monitor/misc.c b/monitor/misc.c
index ad476c6e51..b28874d6dc 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -320,24 +320,6 @@ static void hmp_info_registers(Monitor *mon, const QDict *qdict)
     }
 }
 
-#ifdef CONFIG_TCG
-static void hmp_info_jit(Monitor *mon, const QDict *qdict)
-{
-    if (!tcg_enabled()) {
-        error_report("JIT information is only available with accel=tcg");
-        return;
-    }
-
-    dump_exec_info();
-    dump_drift_info();
-}
-
-static void hmp_info_opcount(Monitor *mon, const QDict *qdict)
-{
-    dump_opcount_info();
-}
-#endif
-
 static void hmp_info_sync_profile(Monitor *mon, const QDict *qdict)
 {
     int64_t max = qdict_get_try_int(qdict, "max", 10);
-- 
2.31.1




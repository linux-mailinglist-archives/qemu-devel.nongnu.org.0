Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FBB6E4E75
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 18:41:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poRuL-0002Ir-6p; Mon, 17 Apr 2023 12:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1poRuJ-0002I0-25
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 12:40:47 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1poRuH-0001Lp-Cr
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 12:40:46 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f09f954d29so16430545e9.0
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 09:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681749644; x=1684341644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=exlqhHtpNYfOagC4ag8CmHQpsGR3QrEyzrEn9wP3FGw=;
 b=ywOtLTvz2cZU98DamN+XRTh1Fgz9YnGQfz6vBBM7Ej0X9O2QM5jSxc46Vuo6Q1dGvB
 aklJ92UIW0Xp5AI6tS9HKKPsKXpExWyF4s7dA12LJnAmgaJpk8sUv3HvAZC5TU7t863u
 6nzU190+Jo8GR5wqrYKxKySUIesZq1wu9Ex+L7I7kwQNIU2bL/+7v+5elrEsT3WFbjCV
 KnXu51os8c8L+T5/LGHucpaiX3hs1fWE87y6lWEOHvfO8XUIIMog1+jUgnFVw1Dt7V12
 XN4meiv98uAJtAVQV4iAbm/8IgBtXKipvbzSTX3ZE8ny7/el7P2q/vWMxT/3LHgqkFkf
 pn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681749644; x=1684341644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=exlqhHtpNYfOagC4ag8CmHQpsGR3QrEyzrEn9wP3FGw=;
 b=bkHk/BAP93aMdFsfRtjBc5vYfgf0+mB1WOEZLk5pG5dxQdWjJLuPfmGrXeJmodO0nA
 Ce/OdFkc61jCHfDqkadufdhofs4OXdvX6MhlXqJOOw0smIDM8o47H3mGDYeIq1DmGu7v
 TR/DLGqf+0QcJ9lQuHUDaGD6xhHvbgbeKnXRprV/HS3ZwhN+ri4zf+RCjoRoNDNVounj
 AUalY8frkD1pE5lLzj/ux6ljRo4TcXBDx2xs9Ow0g73iLMjzAHYTS8qbqw4DRKo4E4qG
 BAERXl9UCa98ZP1VqOOfa9HCRR2U539BOUUV5IBiP6/t9iQvIbKLGmEQ08fZTHWS1um2
 DpTg==
X-Gm-Message-State: AAQBX9dwGSMGiNCgx8cJrAnBXfeCcB3x3fy+Dlpr2Dg/6ddp/y0n5MOt
 QGRsgkWl5nxCen3dxcMNXlWosk5Xk4kBDR33qF8=
X-Google-Smtp-Source: AKy350bsaF1f+Lcqqll5M2lnR/askrplOHaIXPQhftt/Ll3P0i89Jz1ABcxAOo+KCtdROyNHQM/SbA==
X-Received: by 2002:a5d:4cc6:0:b0:2f8:a7c0:5ce7 with SMTP id
 c6-20020a5d4cc6000000b002f8a7c05ce7mr5685549wrt.8.1681749644100; 
 Mon, 17 Apr 2023 09:40:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a5d61d1000000b002faaa9a1721sm2595103wrv.58.2023.04.17.09.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 09:40:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v3 02/10] softmmu: Don't use 'singlestep' global in QMP and
 HMP commands
Date: Mon, 17 Apr 2023 17:40:33 +0100
Message-Id: <20230417164041.684562-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230417164041.684562-1-peter.maydell@linaro.org>
References: <20230417164041.684562-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The HMP 'singlestep' command, the QMP 'query-status' command and the
HMP 'info status' command (which is just wrapping the QMP command
implementation) look at the 'singlestep' global variable. Make them
access the new TCG accelerator 'one-insn-per-tb' property instead.

This leaves the HMP and QMP command/field names and output strings
unchanged; we will clean that up later.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 softmmu/runstate-hmp-cmds.c | 18 ++++++++++++++++--
 softmmu/runstate.c          | 10 +++++++++-
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/softmmu/runstate-hmp-cmds.c b/softmmu/runstate-hmp-cmds.c
index d55a7d4db89..127521a483a 100644
--- a/softmmu/runstate-hmp-cmds.c
+++ b/softmmu/runstate-hmp-cmds.c
@@ -20,6 +20,7 @@
 #include "qapi/error.h"
 #include "qapi/qapi-commands-run-state.h"
 #include "qapi/qmp/qdict.h"
+#include "qemu/accel.h"
 
 void hmp_info_status(Monitor *mon, const QDict *qdict)
 {
@@ -43,13 +44,26 @@ void hmp_info_status(Monitor *mon, const QDict *qdict)
 void hmp_singlestep(Monitor *mon, const QDict *qdict)
 {
     const char *option = qdict_get_try_str(qdict, "option");
+    AccelState *accel = current_accel();
+    bool newval;
+
+    if (!object_property_find(OBJECT(accel), "one-insn-per-tb")) {
+        monitor_printf(mon,
+                       "This accelerator does not support setting one-insn-per-tb\n");
+        return;
+    }
+
     if (!option || !strcmp(option, "on")) {
-        singlestep = 1;
+        newval = true;
     } else if (!strcmp(option, "off")) {
-        singlestep = 0;
+        newval = false;
     } else {
         monitor_printf(mon, "unexpected option %s\n", option);
+        return;
     }
+    /* If the property exists then setting it can never fail */
+    object_property_set_bool(OBJECT(accel), "one-insn-per-tb",
+                             newval, &error_abort);
 }
 
 void hmp_watchdog_action(Monitor *mon, const QDict *qdict)
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index d1e04586dbc..2f2396c819e 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -40,6 +40,7 @@
 #include "qapi/error.h"
 #include "qapi/qapi-commands-run-state.h"
 #include "qapi/qapi-events-run-state.h"
+#include "qemu/accel.h"
 #include "qemu/error-report.h"
 #include "qemu/job.h"
 #include "qemu/log.h"
@@ -234,9 +235,16 @@ bool runstate_needs_reset(void)
 StatusInfo *qmp_query_status(Error **errp)
 {
     StatusInfo *info = g_malloc0(sizeof(*info));
+    AccelState *accel = current_accel();
 
+    /*
+     * We ignore errors, which will happen if the accelerator
+     * is not TCG. "singlestep" is meaningless for other accelerators,
+     * so we will set the StatusInfo field to false for those.
+     */
+    info->singlestep = object_property_get_bool(OBJECT(accel),
+                                                "one-insn-per-tb", NULL);
     info->running = runstate_is_running();
-    info->singlestep = singlestep;
     info->status = current_run_state;
 
     return info;
-- 
2.34.1



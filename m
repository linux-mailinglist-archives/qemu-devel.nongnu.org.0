Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE086F4385
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:16:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptov4-0003uP-2D; Tue, 02 May 2023 08:15:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptoui-0003oT-UJ
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:34 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouU-0003CJ-BO
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:17 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f192c23fffso22255025e9.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 05:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683029709; x=1685621709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=j8pXzW9Nm3kkhgKu1saoLpMViecNPm3VyC27ijU32xw=;
 b=a71wwlA3eDLkC/esaoOMjE2HLvDnXmCbRsrCDf5IEslQeA4v+133RNeDBq0WWcLRXz
 8bd3ZRYJJGaiHTaDKFwJT8t7nvuD5NPb3UQ3y/644C8EDXLc6+iYWSmdMmL86aKOZKfn
 u0nwj1yNmSBR2oYzXeXRW9nZQcJpG1JUyWyegWGZk1ONdqDbexiC3c0XVVs8zNW9/pPY
 zOdvc1NhDuZTGJ5X9zmxuzjZBUO44YHaFYVkrXiTpeZ5JhurjqEdWKro7VOwcuNovBCQ
 CTwgsHUeVTgzAWovhZsusVOFIkIqS5IXG+g85VnVbOAPSKy9VwmTemXy+gZlau8QtG7n
 erbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683029709; x=1685621709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j8pXzW9Nm3kkhgKu1saoLpMViecNPm3VyC27ijU32xw=;
 b=ck8rvsZ6XnrBXjtIs4U2XCxq3lcYiMUvgbYdWF0ZFmHyWUyuB/mh5IDPKRkMeUtdhO
 jTFA3MhJCHOz0UH7kq094lQNBGgmAPByIO10oMy1Sujkog5x4Y74Re9pp9wweGE0SPwG
 mYJ26ayPKAvpcx3fcMlym8dMhqoeKzOEMkFZgTlh9DBO/+3NK5HIZTncoDdwNyfAhqS0
 9wWGNqkTHNS45SdXNU+wSnK1ZdAqlAfIJAh1dcTpKzdVDAZBEGrn+x7dTsngV6AWHwC1
 XolYRQzXi+nZZmwSHtWC1vanLlCUSpkaiUB76c/nb+zKAkPuESNNEdgnmBTB0sytJNVg
 37TQ==
X-Gm-Message-State: AC+VfDymd/hKif6YhJja26IStXAp74CNeCB1hFp5Z9uFsQK13/T2MGuH
 CmG50Xe2wUkljBiv2IE6w/DuaVUlhJktcha4Rss=
X-Google-Smtp-Source: ACHHUZ7Py9PNGugkekUOh9HUIJA8HDygTPvqMhq/rGFaNURsoMof2TSYBsNX4V1N1dw2IRoBg0nr6g==
X-Received: by 2002:a7b:c5c6:0:b0:3f1:9acf:8682 with SMTP id
 n6-20020a7bc5c6000000b003f19acf8682mr11546842wmk.17.1683029708965; 
 Tue, 02 May 2023 05:15:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm35040330wmk.20.2023.05.02.05.15.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:15:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/35] softmmu: Don't use 'singlestep' global in QMP and HMP
 commands
Date: Tue,  2 May 2023 13:14:41 +0100
Message-Id: <20230502121459.2422303-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502121459.2422303-1-peter.maydell@linaro.org>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230417164041.684562-3-peter.maydell@linaro.org
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



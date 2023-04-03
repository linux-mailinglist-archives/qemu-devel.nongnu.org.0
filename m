Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFFD6D4A87
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 16:48:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjLSS-0003sE-HN; Mon, 03 Apr 2023 10:46:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjLSK-0003pt-UQ
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:46:49 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjLSE-0001A2-QY
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:46:48 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 l10-20020a05600c1d0a00b003f04bd3691eso3386441wms.5
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 07:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680533200;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YO9m3UJpoeAUuVfDe6PY7fBDGyKIbPa3OPAs5QubE+o=;
 b=seAGP8d4KRnOPTUqCSng1fZszaI9Uj1OZhhPS7Dmz5UHLTv/QL462tyYmMSO/8PUrl
 DEIzd+sfDkX75fJ7ZrwFXxVwrO7I5w1pJnyBfDn7HIXLMVL5UkE1fzUbjdAewbbw9p3+
 j/p5NVY5ATXSHvelnkixIfoEatzt+NIG2gvkczXeYoDAIC6DqYfq/Tshqia5LOzqGk/1
 5or4hVLiRVRkSU6PLT7JG7ngDnu7ldiURCkecwacluys4WLG49b79g7gr7Ay55tZzAnW
 NxNotc7SM7P9RP4GoiUTuZQjL5GZNhY2A9EyargVfUtLIcUs5Lhi4cMy8dmeFMid01oA
 p2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680533200;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YO9m3UJpoeAUuVfDe6PY7fBDGyKIbPa3OPAs5QubE+o=;
 b=yx3OeNQrTHtNni9OR++CqiLakHGwOQk08oCOj74RqJa0LoxPnXKvgPoeP/i45T18Ja
 +aeGVwnrAKKW/staog88S0Ta/ftGRIdJOCLI9pp+bL3YG7t3MUJG5dLCySjxN75mlNE3
 ewjaJyS6U0ffjbYzP+wlwXX+8VbiPfQKlFd/2YSv9AQty2A9NsSB46Hp6qFOj3P+LxXR
 x7rm8YxgG/SX+deVI1ajlyFAqaS0dGG3qje+v3/72iTJRbQgBqdHsWCtk7oqAij0xxGB
 aZAG6tyLUzOWiGcRzf96+SNZudha7q0qHoDPQ4NnpMdiuV/tkqHSmk1sY2QS+NM2tK1U
 A8GQ==
X-Gm-Message-State: AAQBX9e8Ls6GaTetVfVekPiygVg0ReJ6ysxek+ERr/pkFXZmz4BGljQ1
 i2KcnIvUhQZb1ILIDXfvwFOjXDRn3u3ukgfCRzU=
X-Google-Smtp-Source: AKy350bkO2dKg6ZrQ6P8gIh9/YokYPzUF0zjaWhJFegR+Y3jdSZkO+ZNWBlVCGcuSTYmMiCTQ9ybNA==
X-Received: by 2002:a7b:c7cb:0:b0:3ed:5d41:f998 with SMTP id
 z11-20020a7bc7cb000000b003ed5d41f998mr14325423wmk.15.1680533200589; 
 Mon, 03 Apr 2023 07:46:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a056000018400b002c56013c07fsm9786747wrx.109.2023.04.03.07.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 07:46:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 02/10] softmmu: Don't use 'singlestep' global in QMP and
 HMP commands
Date: Mon,  3 Apr 2023 15:46:29 +0100
Message-Id: <20230403144637.2949366-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403144637.2949366-1-peter.maydell@linaro.org>
References: <20230403144637.2949366-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

The HMP 'singlestep' command, the QMP 'query-status' command and the
HMP 'info status' command (which is just wrapping the QMP command
implementation) look at the 'singlestep' global variable. Make them
access the new TCG accelerator 'one-insn-per-tb' property instead.

This leaves the HMP and QMP command/field names and output strings
unchanged; we will clean that up later.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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



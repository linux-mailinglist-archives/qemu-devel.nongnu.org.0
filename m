Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C157D6F43A6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:21:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptovf-0004nl-PQ; Tue, 02 May 2023 08:16:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouj-0003oe-01
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:37 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouW-0003DD-E9
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:19 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f178da21afso23956315e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 05:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683029711; x=1685621711;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Kauz1K8w3UOgRl+od3Ft3DDzAldSqZ0YrdeSyWjNWko=;
 b=oI6TiZgAO6hOvYW37FkLZ8781aDXSIj5kx24W/KpY2ZSqAZcZU88zgo9Il9ayeEIwF
 mw4oC6nG73afrilX4x8gPDi5GKV4ZZWS68GTCwaixHtZ/q2Pd69ji4TW4vmA7r1iz924
 5hgEYEMbEZtFLL8V4Nv2cjqIzQ+ez/eh0aA+sb56jCH9sdYW6mid3OSRH7DLjz+McX2R
 jiny5pP8+P3442xuDa5ttzENHrvNq2Zea4osmYRdwJE/qiucXEsFpRupuAPC9fq8Pin8
 h6IWoYV1fCD85Cg/u+UYQHmAYyeFgAilt9/PoKDconfptuuiw2I07ukSkyMbKGBax2Yv
 GtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683029711; x=1685621711;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kauz1K8w3UOgRl+od3Ft3DDzAldSqZ0YrdeSyWjNWko=;
 b=UWk7EzscdxlPB/4V0LeSNLDwZVd6Fn6V4Ko5WhvtE0baGG0Jvl3THQDa0U7nqiIg8L
 4CNgCFxNG/8puphhCoBmMFTjSZoruEXNnDtM8Cq0o/UPrQ9baz/eO02Yx0KF4o/3sN4s
 L1wTwvtV+7AupxAT4+DggvZv1euZRA+Xa7zIfTgiW5p8sy90DTJ9Oq+wuJNhtmAoUTSC
 ZUZrEV0zBS7ceTRr9aUHzegpM0kXTAtu5h8R0k/2h0qS5+Gkj04NZ7WYkrOCVbn8SbZe
 YDCVCI4XdhIZJNH/S/zxNZIvb0wVcudauw+izvD23ZjL0phlEzlmUynrYq9/YKri7T+g
 WUkQ==
X-Gm-Message-State: AC+VfDxRbJlbXD/4Zmj2QwYPhyCtPnD11IbNNXUZ0iZntYK9R7MM6n6f
 bPOdMY/qgwCrvpqhjD6qpv827Ub6gkH++qOb4n4=
X-Google-Smtp-Source: ACHHUZ7kefS4lph/+SBD0J27cCi9oXgELliIurIF13Pyqp4HB0YrCnYa7g1HchBV/9dX4CfybQvkxQ==
X-Received: by 2002:a05:600c:2052:b0:3ee:ed5:6115 with SMTP id
 p18-20020a05600c205200b003ee0ed56115mr12878292wmg.19.1683029711090; 
 Tue, 02 May 2023 05:15:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm35040330wmk.20.2023.05.02.05.15.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:15:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/35] accel/tcg: Report one-insn-per-tb in 'info jit',
 not 'info status'
Date: Tue,  2 May 2023 13:14:46 +0100
Message-Id: <20230502121459.2422303-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502121459.2422303-1-peter.maydell@linaro.org>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

Currently we report whether the TCG accelerator is in
'one-insn-per-tb' mode in the 'info status' output.  This is a pretty
minor piece of TCG specific information, and we want to deprecate the
'singlestep' field of the associated QMP command.  Move the
'one-insn-per-tb' reporting to 'info jit'.

We don't need a deprecate-and-drop period for this because the
HMP interface has no stability guarantees.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230417164041.684562-8-peter.maydell@linaro.org
---
 accel/tcg/monitor.c         | 14 ++++++++++++++
 softmmu/runstate-hmp-cmds.c |  5 ++---
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/monitor.c b/accel/tcg/monitor.c
index 1450e160e95..92fce580f11 100644
--- a/accel/tcg/monitor.c
+++ b/accel/tcg/monitor.c
@@ -7,6 +7,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/accel.h"
 #include "qapi/error.h"
 #include "qapi/type-helpers.h"
 #include "qapi/qapi-commands-machine.h"
@@ -36,6 +37,18 @@ static void dump_drift_info(GString *buf)
     }
 }
 
+static void dump_accel_info(GString *buf)
+{
+    AccelState *accel = current_accel();
+    bool one_insn_per_tb = object_property_get_bool(OBJECT(accel),
+                                                    "one-insn-per-tb",
+                                                    &error_fatal);
+
+    g_string_append_printf(buf, "Accelerator settings:\n");
+    g_string_append_printf(buf, "one-insn-per-tb: %s\n\n",
+                           one_insn_per_tb ? "on" : "off");
+}
+
 HumanReadableText *qmp_x_query_jit(Error **errp)
 {
     g_autoptr(GString) buf = g_string_new("");
@@ -45,6 +58,7 @@ HumanReadableText *qmp_x_query_jit(Error **errp)
         return NULL;
     }
 
+    dump_accel_info(buf);
     dump_exec_info(buf);
     dump_drift_info(buf);
 
diff --git a/softmmu/runstate-hmp-cmds.c b/softmmu/runstate-hmp-cmds.c
index 127521a483a..a477838dc5a 100644
--- a/softmmu/runstate-hmp-cmds.c
+++ b/softmmu/runstate-hmp-cmds.c
@@ -28,9 +28,8 @@ void hmp_info_status(Monitor *mon, const QDict *qdict)
 
     info = qmp_query_status(NULL);
 
-    monitor_printf(mon, "VM status: %s%s",
-                   info->running ? "running" : "paused",
-                   info->singlestep ? " (single step mode)" : "");
+    monitor_printf(mon, "VM status: %s",
+                   info->running ? "running" : "paused");
 
     if (!info->running && info->status != RUN_STATE_PAUSED) {
         monitor_printf(mon, " (%s)", RunState_str(info->status));
-- 
2.34.1



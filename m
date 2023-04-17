Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7D96E4E7F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 18:42:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poRuP-0002LU-Oo; Mon, 17 Apr 2023 12:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1poRuM-0002Ja-3o
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 12:40:50 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1poRuK-0001Mv-EN
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 12:40:49 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f167d0c91bso17424555e9.2
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 09:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681749647; x=1684341647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IUG+bykQ/Oriq02A76XvnJLKzQfmPW2xVt1eESF/Lno=;
 b=xQECE0s5pfvuyI7WIbnyqv1c0KixhBCx7kmChV9RagOgI92R8NbksRN/YqbGX9bpTy
 mo0qmJ2BhU+MedNjgpzegqhq8Qm7gk4i71AxvuGqefW8g4+JXRgzaTzi1yR7oXgtkPj3
 LuGdqFadfiVtM/Shtj6KGwafd9KqcK+5ZrAS/z7vaHpv5XBV15qU9neL/jbZ/zq1bnd8
 NNQxAW/WrEePUni6iXqODzDXPvVTAOHDJbNiAqvYr4Tuo2ouKUy/6He5Codz9ZkThrxd
 4xhNsMY/FQf3zY5pGDe9gsJ7vVwywfZwe2w+Y2vq/Nek8oJSvZpSFj9TQVMaK4RwIOFX
 NxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681749647; x=1684341647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IUG+bykQ/Oriq02A76XvnJLKzQfmPW2xVt1eESF/Lno=;
 b=PvddpFGLo3ZNy+gpR7dLkK2Tnsrt7FSlg57/udGclNey9IuIURlYWg1+FN4zsq58JA
 j4gVvJVO3GiQooYzDlMuM6qpCkAv3u81t5Aj3hiEaIGnlTyfU+Juocd3f9PZDxAUX0Dy
 IpQjuqxNA2u1/be/l6HMpOmBiky5S1ZmkWrUEDxwl60xKlbxa4kco/UEa5W3WNhKOtWG
 Pf59kWLNRFbfwnOxoop/AgOIvY0RvO+3wET9nAjEyfq8NG4C8GuRTJ0e4zXKjZJ0R7n3
 VKOen1gbF5wRXbvMuwP0y2xZLgF9g9R715HA+YyrX7unvdo1T7NhELpiQG3ZOTqcXuZM
 NGag==
X-Gm-Message-State: AAQBX9cjjop601rk1roC1cgYXwiafZDCQyMGHGBuzaFKY+QPHCSGIyTR
 zsW2AjPRC2prFi2gXny0Fk//Tvsj117RISWHZ8A=
X-Google-Smtp-Source: AKy350YAWEuYJA63NMcwEdiyAIDv16VSQZ7H+ckeTJfQm0aiDW9OojY7QjUU821LYLRmiaiI0PaWgw==
X-Received: by 2002:adf:f40e:0:b0:2f4:cf53:c961 with SMTP id
 g14-20020adff40e000000b002f4cf53c961mr5470660wro.54.1681749646915; 
 Mon, 17 Apr 2023 09:40:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a5d61d1000000b002faaa9a1721sm2595103wrv.58.2023.04.17.09.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 09:40:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v3 07/10] accel/tcg: Report one-insn-per-tb in 'info jit',
 not 'info status'
Date: Mon, 17 Apr 2023 17:40:38 +0100
Message-Id: <20230417164041.684562-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230417164041.684562-1-peter.maydell@linaro.org>
References: <20230417164041.684562-1-peter.maydell@linaro.org>
MIME-Version: 1.0
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
---
The new 'accelerator settings' subsection of the output
currently only has one item, but it would be a place to put
other stuff, eg if we wanted to mention whether split-wx is
enabled.
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



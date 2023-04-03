Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 031956D4A81
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 16:47:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjLSU-0003tQ-0P; Mon, 03 Apr 2023 10:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjLSN-0003r1-78
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:46:51 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjLSJ-0001Ah-OI
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:46:50 -0400
Received: by mail-wr1-x42b.google.com with SMTP id i9so29634053wrp.3
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 07:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680533205;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4jK6aPnvhoLlQ8Sv74zAHKAsy82lPEcHA6DLIZvbg24=;
 b=BEfE6BNm71DFP8VVZHyHGsapIj2CJ0tY5hkapng3u4kT8/t4AlgJtwskhJQqLhQgol
 8ujXM1mS2FEebstCTedd8itoYRkqAA402UEnH/Hq1utAS4RyqFrI4QMOHATzlnTBl2TS
 OrrUZRbcWNv+XhoucK52PSZ2OlHVFZmhNlr+PVSM8TrKX5hsv+/43I8rmHM9yzLs0zVO
 hIr8Kg1QvR9SUJSRxGt6RHoRsAcXusy79/tSJ0T6dRKUitruhm2XlLah9PfswAqjaeRF
 xh4y0XcWLyiaTZdNzaXvwPByn+dKqhK19vo1LGR2E03oxLLGdNGq0jRc/O2ch79QZhyj
 SvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680533205;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4jK6aPnvhoLlQ8Sv74zAHKAsy82lPEcHA6DLIZvbg24=;
 b=5UkAUZJC1QSXL0mYUy65v4fUn6kMG2ErzCVSeI14UdmeO2C3W5fLqaSU1A19zVl2mP
 p/YkWBC2mVMVJpwPo+VQsSwC8XAZLsA7qOIo2x+RXyk1kUhTXCoL/AkuHqORAQnhYNLq
 NAUGdczJdOKoEfiE9p4X2ea/W9YX8BCqst92CPbV/k0sNzWrGabXXBuWa0WO5miJJQAu
 y3YrPNaraDRw7d+KSFQ3UD3/7ngSIlS2Ua9RETc/eDmpjD+aahqkB+wBipYOAIOhhpdU
 Wsu5xxb2K4PaMnaIKbBpSDqcUvHbCOORAI97b3iUW4UxaWnKzRh+YcwMHS4wbfcFEzAX
 wcLA==
X-Gm-Message-State: AAQBX9fiyLzVq/kPTkTCMDXs8hMg5aLnbNz0djq5qaU4YkKOIpIhWvef
 sQbZs8+HSOMALxnL0LJj14xSDm0TaAbFLxpj1S0=
X-Google-Smtp-Source: AKy350agU63LEuzy3saVlgDrzb3SaZt0LZsMsGqM8HQP7fHqgRl44bRKK8hvTLqf5CwXHkqWKoAUPQ==
X-Received: by 2002:adf:fccc:0:b0:2cf:e868:f789 with SMTP id
 f12-20020adffccc000000b002cfe868f789mr26405539wrs.48.1680533205070; 
 Mon, 03 Apr 2023 07:46:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a056000018400b002c56013c07fsm9786747wrx.109.2023.04.03.07.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 07:46:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 10/10] hmp: Deprecate 'singlestep' member of StatusInfo
Date: Mon,  3 Apr 2023 15:46:37 +0100
Message-Id: <20230403144637.2949366-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403144637.2949366-1-peter.maydell@linaro.org>
References: <20230403144637.2949366-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

The 'singlestep' member of StatusInfo has never done what
the QMP documentation claims it does. What it actually
reports is whether TCG is working in "one guest instruction
per translation block" mode.

Create a new 'one-insn-per-tb' member whose name matches
what the field actually does and the new command line
options. Deprecate the old 'singlestep' field.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/about/deprecated.rst   | 10 ++++++++++
 docs/interop/qmp-intro.txt  |  1 +
 qapi/run-state.json         | 17 ++++++++++++++---
 softmmu/runstate-hmp-cmds.c |  2 +-
 softmmu/runstate.c          |  6 ++++--
 5 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 6f5e689aa45..dd36becdf3b 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -199,6 +199,16 @@ accepted incorrect commands will return an error. Users should make sure that
 all arguments passed to ``device_add`` are consistent with the documented
 property types.
 
+``StatusInfo`` member ``singlestep`` (since 8.1)
+''''''''''''''''''''''''''''''''''''''''''''''''
+
+The ``singlestep`` member of the ``StatusInfo`` returned from
+the ``query-status`` command is deprecated, because its name
+is confusing and it never did what the documentation claimed
+or what its name suggests. Use the ``one-insn-per-tb``
+member instead, which reports the same information the old
+``singlestep`` member did but under a clearer name.
+
 Human Monitor Protocol (HMP) commands
 -------------------------------------
 
diff --git a/docs/interop/qmp-intro.txt b/docs/interop/qmp-intro.txt
index 1c745a7af04..b22916b23df 100644
--- a/docs/interop/qmp-intro.txt
+++ b/docs/interop/qmp-intro.txt
@@ -73,6 +73,7 @@ Escape character is '^]'.
 { "execute": "query-status" }
 {
     "return": {
+        "one-insn-per-tb": false,
         "status": "prelaunch", 
         "singlestep": false, 
         "running": false
diff --git a/qapi/run-state.json b/qapi/run-state.json
index 9d34afa39e0..1de8c5c55d0 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -104,16 +104,27 @@
 #
 # @running: true if all VCPUs are runnable, false if not runnable
 #
-# @singlestep: true if VCPUs are in single-step mode
+# @one-insn-per-tb: true if using TCG with one guest instruction
+#                   per translation block
+#
+# @singlestep: deprecated synonym for @one-insn-per-tb
 #
 # @status: the virtual machine @RunState
 #
+# Features:
+# @deprecated: Member 'singlestep' is deprecated. Use @one-insn-per-tb instead.
+#
 # Since: 0.14
 #
-# Notes: @singlestep is enabled through the GDB stub
+# Notes: @one-insn-per-tb is enabled on the command line with
+#        '-accel tcg,one-insn-per-tb=on', or with the HMP
+#        'one-insn-per-tb' command.
 ##
 { 'struct': 'StatusInfo',
-  'data': {'running': 'bool', 'singlestep': 'bool', 'status': 'RunState'} }
+  'data': {'running': 'bool',
+           'singlestep': { 'type': 'bool', 'features': [ 'deprecated' ]},
+           'one-insn-per-tb': 'bool',
+           'status': 'RunState'} }
 
 ##
 # @query-status:
diff --git a/softmmu/runstate-hmp-cmds.c b/softmmu/runstate-hmp-cmds.c
index 20facb055f0..404d331b523 100644
--- a/softmmu/runstate-hmp-cmds.c
+++ b/softmmu/runstate-hmp-cmds.c
@@ -30,7 +30,7 @@ void hmp_info_status(Monitor *mon, const QDict *qdict)
 
     monitor_printf(mon, "VM status: %s%s",
                    info->running ? "running" : "paused",
-                   info->singlestep ? " (one insn per TB)" : "");
+                   info->one_insn_per_tb ? " (one insn per TB)" : "");
 
     if (!info->running && info->status != RUN_STATE_PAUSED) {
         monitor_printf(mon, " (%s)", RunState_str(info->status));
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 2f2396c819e..a93e74c41ca 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -239,11 +239,13 @@ StatusInfo *qmp_query_status(Error **errp)
 
     /*
      * We ignore errors, which will happen if the accelerator
-     * is not TCG. "singlestep" is meaningless for other accelerators,
+     * is not TCG. "one-insn-per-tb" is meaningless for other accelerators,
      * so we will set the StatusInfo field to false for those.
      */
-    info->singlestep = object_property_get_bool(OBJECT(accel),
+    info->one_insn_per_tb = object_property_get_bool(OBJECT(accel),
                                                 "one-insn-per-tb", NULL);
+    /* Deprecated member with same meaning as one-insn-per-tb */
+    info->singlestep = info->one_insn_per_tb;
     info->running = runstate_is_running();
     info->status = current_run_state;
 
-- 
2.34.1



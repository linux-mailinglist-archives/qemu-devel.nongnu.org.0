Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF7E6D4A82
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 16:47:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjLSc-0003uw-Ik; Mon, 03 Apr 2023 10:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjLSM-0003qj-II
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:46:50 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjLSJ-0001AS-Og
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:46:50 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 l10-20020a05600c1d0a00b003f04bd3691eso3386532wms.5
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 07:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680533203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3epTQBYW6Jzl8bhA8JL/NwcO0wptisWs4DJRdCAPoII=;
 b=AlbMeKsScGDONiGb/vOejVPMuGqUv8apX5hpFUCt4RXTLIKcQpyQIPCoYpGnu8nNLf
 rjXRxm3rPs2cqBYL2x3RCQBUX/2Nzdkh/Rb4JCL5bwqBf1xe4YtGBQZmIRRB1pfvJlz8
 p9PO9bWNNPBEPXcWCZ2aEYCjA+E/ZPwB2+T3K5EybFdJ/t+sM/HbEh8qKf+LWbEY5DBB
 hHdXxiSYIHtZox2c31BxM5KR55fpDQLr7Ro3e4BJLS9eusYjYvI3PuBE/s66rpcjjNt1
 2vChk31H3t+fZlRxisXQspv5yY6tEbj0395L/zT43/jdqajUTl4vd75vLKtgRLpoSi4M
 4Xqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680533203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3epTQBYW6Jzl8bhA8JL/NwcO0wptisWs4DJRdCAPoII=;
 b=ZPs/n84fwz8yWqHnScfz0tb+BNI6Ca1A5qjGQmL4SSVXrwDoZC0bN4ZqWVxtdVYjJo
 zv3mHfq35VP6O/G2AL+J3RH50IaMI8HVVAEebBPAwcrUaDSRb5Jce8jj03OIhYn636Z1
 W6uozzUPZMLqsUF6Xhen8U6woM20V08Oy4uIwXxxncQJJbB5YD7xtMp/yZ3uQ8FkTdHM
 llXNixwyGKZ3tGPuqRtD8KwHsFpt4tzlMnOFLSx8Rj5l03B8AG63Ngbt2LhRepfDhoZT
 RrffmVKcNwGWT7X/ujw+XnQCaeHcIIf/HsWBTCnXAbdyhTfxK1CAt2wyIa0pMrenWK31
 fgcw==
X-Gm-Message-State: AO0yUKWok8n1+5jFyLtAJ/w7QD+CGda9rk+BVi8nhwW5e+e0wDxn+Qog
 4DXf2YY/H2b4LseGzIZWmzNPGlgRA4+GTugayRg=
X-Google-Smtp-Source: AK7set+xP3gfF+j8oxnNRd3t5FXyXZVPfyeg0UVQHEZEGl49R6I4Vn4aApCXnzJCw7ZRQc+CODZHJw==
X-Received: by 2002:a1c:4b07:0:b0:3eb:2b88:a69a with SMTP id
 y7-20020a1c4b07000000b003eb2b88a69amr27060975wma.14.1680533203364; 
 Mon, 03 Apr 2023 07:46:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a056000018400b002c56013c07fsm9786747wrx.109.2023.04.03.07.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 07:46:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 07/10] hmp: Add 'one-insn-per-tb' command equivalent to
 'singlestep'
Date: Mon,  3 Apr 2023 15:46:34 +0100
Message-Id: <20230403144637.2949366-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403144637.2949366-1-peter.maydell@linaro.org>
References: <20230403144637.2949366-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

The 'singlestep' HMP command is confusing, because it doesn't
actually have anything to do with single-stepping the CPU.  What it
does do is force TCG emulation to put one guest instruction in each
TB, which can be useful in some situations.

Create a new HMP command  'one-insn-per-tb', so we can document that
'singlestep' is just a deprecated synonym for it, and eventually
perhaps drop it.

We aren't obliged to do deprecate-and-drop for HMP commands,
but it's easy enough to do so, so we do.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/about/deprecated.rst   |  9 +++++++++
 include/monitor/hmp.h       |  2 +-
 softmmu/runstate-hmp-cmds.c |  2 +-
 tests/qtest/test-hmp.c      |  1 +
 hmp-commands.hx             | 25 +++++++++++++++++++++----
 5 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 3c62671dac1..6f5e689aa45 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -199,6 +199,15 @@ accepted incorrect commands will return an error. Users should make sure that
 all arguments passed to ``device_add`` are consistent with the documented
 property types.
 
+Human Monitor Protocol (HMP) commands
+-------------------------------------
+
+``singlestep`` (since 8.1)
+''''''''''''''''''''''''''
+
+The ``singlestep`` command has been replaced by the ``one-insn-per-tb``
+command, which has the same behaviour but a less misleading name.
+
 Host Architectures
 ------------------
 
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index fdb69b7f9ca..13f9a2dedb8 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -158,7 +158,7 @@ void hmp_info_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
 void hmp_human_readable_text_helper(Monitor *mon,
                                     HumanReadableText *(*qmp_handler)(Error **));
 void hmp_info_stats(Monitor *mon, const QDict *qdict);
-void hmp_singlestep(Monitor *mon, const QDict *qdict);
+void hmp_one_insn_per_tb(Monitor *mon, const QDict *qdict);
 void hmp_watchdog_action(Monitor *mon, const QDict *qdict);
 void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict);
 void hmp_info_capture(Monitor *mon, const QDict *qdict);
diff --git a/softmmu/runstate-hmp-cmds.c b/softmmu/runstate-hmp-cmds.c
index 127521a483a..76d1399ed85 100644
--- a/softmmu/runstate-hmp-cmds.c
+++ b/softmmu/runstate-hmp-cmds.c
@@ -41,7 +41,7 @@ void hmp_info_status(Monitor *mon, const QDict *qdict)
     qapi_free_StatusInfo(info);
 }
 
-void hmp_singlestep(Monitor *mon, const QDict *qdict)
+void hmp_one_insn_per_tb(Monitor *mon, const QDict *qdict)
 {
     const char *option = qdict_get_try_str(qdict, "option");
     AccelState *accel = current_accel();
diff --git a/tests/qtest/test-hmp.c b/tests/qtest/test-hmp.c
index b4a920df898..cb3530df722 100644
--- a/tests/qtest/test-hmp.c
+++ b/tests/qtest/test-hmp.c
@@ -64,6 +64,7 @@ static const char *hmp_cmds[] = {
     "screendump /dev/null",
     "sendkey x",
     "singlestep on",
+    "one-insn-per-tb on",
     "wavcapture /dev/null",
     "stopcapture 0",
     "sum 0 512",
diff --git a/hmp-commands.hx b/hmp-commands.hx
index bb85ee1d267..9afbb54a515 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -378,18 +378,35 @@ SRST
   only *tag* as parameter.
 ERST
 
+    {
+        .name       = "one-insn-per-tb",
+        .args_type  = "option:s?",
+        .params     = "[on|off]",
+        .help       = "run emulation with one guest instruction per translation block",
+        .cmd        = hmp_one_insn_per_tb,
+    },
+
+SRST
+``one-insn-per-tb [off]``
+  Run the emulation with one guest instruction per translation block.
+  This slows down emulation a lot, but can be useful in some situations,
+  such as when trying to analyse the logs produced by the ``-d`` option.
+  This only has an effect when using TCG, not with KVM or other accelerators.
+
+  If called with option off, the emulation returns to normal mode.
+ERST
+
     {
         .name       = "singlestep",
         .args_type  = "option:s?",
         .params     = "[on|off]",
-        .help       = "run emulation in singlestep mode or switch to normal mode",
-        .cmd        = hmp_singlestep,
+        .help       = "deprecated synonym for one-insn-per-tb",
+        .cmd        = hmp_one_insn_per_tb,
     },
 
 SRST
 ``singlestep [off]``
-  Run the emulation in single step mode.
-  If called with option off, the emulation returns to normal mode.
+  This is a deprecated synonym for the one-insn-per-tb command.
 ERST
 
     {
-- 
2.34.1



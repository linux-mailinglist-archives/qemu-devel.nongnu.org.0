Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6181A68C459
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 18:15:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP54J-0000j2-IA; Mon, 06 Feb 2023 12:14:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pP54G-0000hx-2x
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 12:14:12 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pP54D-0001R4-Ga
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 12:14:11 -0500
Received: by mail-wr1-x429.google.com with SMTP id r2so11061121wrv.7
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 09:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aqub2Ln/xHWuYzGV026+az3A7a2YzS+9nE8r5yCljvE=;
 b=m/n5cJx5nwPw2FA0hmYUOnj/TmfU5kTviyj9uv76kDOcPvfiXXmjc1fXJG4HVOwq7y
 LnAyVXlGd2n6gB0v3lpwHx0WasqAW6R7QuxaQ5OG6fp4ZZ3sQ2zPZfm+WQCsJCnOxLzx
 OML9wPLMaay+y1xxGvjRabSbRZg+yNjlti0V8Zv5daNR+meucdn0/qQcQEwniNN2ESlz
 aNpyn02+k1vDjch3X39EYj62lvTKLBpNXaOwu7GBohLQ0T8kmVaILAB6ZAu2oi5xUq32
 Kd7g1IB/wtVazPghHGIo0uD+LP7eUwAQ6c28hgi0yyhf5qODUEweVqqO4KUk3aE/QB/Y
 VOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aqub2Ln/xHWuYzGV026+az3A7a2YzS+9nE8r5yCljvE=;
 b=xZqyB9z//42nqZYwbRtdqEVHpgdL9CSqG7W75ImLdXzFXl9sIvtuuqkv1oYMzs9R4T
 fX4+9p3tpC9n25OvuJEUPg3s4Of5o+mraUSd/kL7nxY08MtyrLQ3IatLAyjaxSLLnbU/
 B6tX8WXbcyWLYjoy/yXOST97u5w2YHQFw/1dxP9HwHFLHeaZKDsFz1vqLRVzdGhpAUXv
 4USyOViz6iS7bKBncHHYq83pcytiyzBznK1d6lOKgKWfvuJTPTYtp6xmfTDzCeA3sWgJ
 8FN3ENkhcQE6OLqTKsvdn2vyG1HsrP5KRsy/StGFwhc/DdfHPp9Z8Ax/3cBleT3r5c7H
 6WOQ==
X-Gm-Message-State: AO0yUKUjp8ayJDPx55J0LfvqeBosBYN+wpTbm/7NV4o3xoG24SIzeqr6
 zecdzCb/mnYic5wkXBkeAvjrdwxwl2AilU7z
X-Google-Smtp-Source: AK7set8o6d846IlQoNjUJdEw12VqTAaNkcg7Tr22OiUISnnrTC6NX0CIUgCkZf2uLH/qMv2IshTXRw==
X-Received: by 2002:a5d:6d05:0:b0:2bf:ee65:b0b0 with SMTP id
 e5-20020a5d6d05000000b002bfee65b0b0mr24515766wrq.41.1675703647904; 
 Mon, 06 Feb 2023 09:14:07 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a05600015ca00b002bfd137ecddsm9529841wry.11.2023.02.06.09.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 09:14:07 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Markus Armbruster <armbru@redhat.com>
Subject: [RFC PATCH 5/5] hmp: Add 'one-insn-per-tb' command equivalent to
 'singlestep'
Date: Mon,  6 Feb 2023 17:13:59 +0000
Message-Id: <20230206171359.1327671-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230206171359.1327671-1-peter.maydell@linaro.org>
References: <20230206171359.1327671-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/monitor/hmp.h       |  2 +-
 softmmu/runstate-hmp-cmds.c |  2 +-
 tests/qtest/test-hmp.c      |  1 +
 hmp-commands.hx             | 25 +++++++++++++++++++++----
 4 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 2220f14fc98..e66c8c63799 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -156,7 +156,7 @@ void hmp_info_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
 void hmp_human_readable_text_helper(Monitor *mon,
                                     HumanReadableText *(*qmp_handler)(Error **));
 void hmp_info_stats(Monitor *mon, const QDict *qdict);
-void hmp_singlestep(Monitor *mon, const QDict *qdict);
+void hmp_one_insn_per_tb(Monitor *mon, const QDict *qdict);
 void hmp_watchdog_action(Monitor *mon, const QDict *qdict);
 void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict);
 void hmp_info_capture(Monitor *mon, const QDict *qdict);
diff --git a/softmmu/runstate-hmp-cmds.c b/softmmu/runstate-hmp-cmds.c
index 29c9a038863..da218aa4b86 100644
--- a/softmmu/runstate-hmp-cmds.c
+++ b/softmmu/runstate-hmp-cmds.c
@@ -40,7 +40,7 @@ void hmp_info_status(Monitor *mon, const QDict *qdict)
     qapi_free_StatusInfo(info);
 }
 
-void hmp_singlestep(Monitor *mon, const QDict *qdict)
+void hmp_one_insn_per_tb(Monitor *mon, const QDict *qdict)
 {
     const char *option = qdict_get_try_str(qdict, "option");
     if (!option || !strcmp(option, "on")) {
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
index fbb5daf09be..88933567845 100644
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



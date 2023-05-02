Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 629E26F43BB
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:23:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptovA-00047a-0A; Tue, 02 May 2023 08:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptoui-0003od-Vu
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:36 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouX-0003DR-4J
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:20 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f182d745deso35924245e9.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 05:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683029711; x=1685621711;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yRpHTF6gUhcift1QfiFZpMBeeq76xSt6EAXJWyDrQZs=;
 b=HghBuyKp0AKDimEoiO4K6aoM5CUtac7ze/C42CjxQmDRfEH12NdwxZ/hFBADAzwwQU
 +V/chwrZTSM0680JkTOXkIVA0IgVdrUaX2600sa10R+dPEZyIV5GV32TLMo5B3UkDkun
 BDmQ4UfkUQ7w6DRq6gbhG9wCTnaXm0f4iWhCERCXBteeosts+mRAFP7+W3jmXDMRSsvj
 fL44vpLdmJUzZABOnNaB+H/jwfMpvSrOGBOLdwfBN+WIO4v6B4KNb5CZO5xor0GG5FmF
 izWutXgWFYR21mEJZiavgYVl/5j5ENcV8Y4eazqrhFpaFf056uXad7Lojx/Wzc1PgY+Y
 vCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683029711; x=1685621711;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yRpHTF6gUhcift1QfiFZpMBeeq76xSt6EAXJWyDrQZs=;
 b=NCtSUD0NCgwrOgeN23UXneoqZdH+AVLEm4df9OaXuXzg90ho8Xb610JTxrTwGETAPy
 elGcQo1SjQnzvlFd1B6Bu2umetS9QNDWxTGWy3l7sr3SBqqwbjVKOrAfTV07uwVKW6GY
 Ur8vJOGuU9wdkMk9uk3vXFnxMLHyR7TJ1tiBm0no5keUaxzjXFluva53lh6NvGvyAUQJ
 YXZWrsgUkAkyaDPoIWugEWd7vM/gZkkBsnHaJgNUuLa9sjEfv2Eiu5oMlUgZM1ejEnh2
 +4vCHbfS6bqRf9Mrgr5lkkHB6qJ6sShHBipPMRhbne6vAMmC955KQKsx43x6daHNBgTk
 FIZQ==
X-Gm-Message-State: AC+VfDz9BePJ2tA0niKKfxSoga7x2gxKthqLfyHufZgMrTlohH22gzTn
 tiixdSH/RLWst6mahdLtHkKUiqVXOOs4E2qlQbA=
X-Google-Smtp-Source: ACHHUZ4AXH9mGtuLqaifSOv/pHU8ifndLm+TN/bebFqwOyDZAFvBzCjjpabk/7RCfYUUAZ0SNgWSCA==
X-Received: by 2002:a05:600c:224e:b0:3ea:d620:570a with SMTP id
 a14-20020a05600c224e00b003ead620570amr12774710wmm.38.1683029711500; 
 Tue, 02 May 2023 05:15:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm35040330wmk.20.2023.05.02.05.15.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:15:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/35] hmp: Add 'one-insn-per-tb' command equivalent to
 'singlestep'
Date: Tue,  2 May 2023 13:14:47 +0100
Message-Id: <20230502121459.2422303-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502121459.2422303-1-peter.maydell@linaro.org>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230417164041.684562-9-peter.maydell@linaro.org
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
index a477838dc5a..2df670f0c06 100644
--- a/softmmu/runstate-hmp-cmds.c
+++ b/softmmu/runstate-hmp-cmds.c
@@ -40,7 +40,7 @@ void hmp_info_status(Monitor *mon, const QDict *qdict)
     qapi_free_StatusInfo(info);
 }
 
-void hmp_singlestep(Monitor *mon, const QDict *qdict)
+void hmp_one_insn_per_tb(Monitor *mon, const QDict *qdict)
 {
     const char *option = qdict_get_try_str(qdict, "option");
     AccelState *accel = current_accel();
diff --git a/tests/qtest/test-hmp.c b/tests/qtest/test-hmp.c
index b4a920df898..6704be239be 100644
--- a/tests/qtest/test-hmp.c
+++ b/tests/qtest/test-hmp.c
@@ -56,6 +56,7 @@ static const char *hmp_cmds[] = {
     "o /w 0 0x1234",
     "object_add memory-backend-ram,id=mem1,size=256M",
     "object_del mem1",
+    "one-insn-per-tb on",
     "pmemsave 0 4096 \"/dev/null\"",
     "p $pc + 8",
     "qom-list /",
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



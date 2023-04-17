Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7466E4E7E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 18:42:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poRuP-0002LH-EK; Mon, 17 Apr 2023 12:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1poRuN-0002Jz-3n
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 12:40:51 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1poRuL-0001N6-6b
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 12:40:50 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f16ecaadd1so14616455e9.1
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 09:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681749647; x=1684341647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XdrcDkwMacIqQO2KUO210mgRUqyMuFKPIP+LZZZwEDs=;
 b=RR872PwJau76BNYSBlWDk0V7M3asnkqWar+CxQUXQrDNqQLz+3OuTDDc6PmFu+W+Aa
 mqtwAYTP4r4SH/horCoAe953RhK8cUQwQSMSCYrTRA86lYmLEIttCtFmd+YmPe7DAXBK
 GAgh1P5QtotIpewadvh6yrF2ABqpERrWfeQXspZJmNV84mCSZKa4i894Y4RfHz88H7lJ
 bxPl+yawB8qDI0tLDP7FfEmHeq6bOhSiPJGK6Yq/leZ+as9pu8hlB9puy8tn1WuFJ2Tv
 dtCOvgestXemHpFtb4cr0zb27Hba8q8hrjrZE9ZOeSWAwQ2JbuOKG1Z2InpWJCsWnyVU
 p7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681749647; x=1684341647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XdrcDkwMacIqQO2KUO210mgRUqyMuFKPIP+LZZZwEDs=;
 b=GTTrjjurFZmawHiodejpJrYrVEvBekxqjd9No1faXEIimT70Yiiff5TmsTaKJMvZWr
 qG7gk1UwPrk8+7jBzfcHYYvFHUvMNYHlIx5ZfyRWgUi34iR8+PAAzAtFB7QeO13EvzYh
 XNVJglqn2L8+pc4xOXPnIthzVObeGMWnTHs8rVGuaalZ/yUgIIY17QJoB1fumZ+r293O
 T1LwnMwgsDjEjDKk8vofSCEazh4NmVut6oqHm+/kFMsGl/fWN2upRLVqOKTCND+YQy5B
 /mc1KxdTZ8aeS2nj0Bq3MZ8dFQJX5/hWvaOgrkvsAGwiZFuMtoe0XqYvHBcVns8AqScF
 R9yA==
X-Gm-Message-State: AAQBX9eiBPHRxPK8NeE/hRnVvOS5ncWZl2tkf99XaFBpormF9rnY9HEd
 +sWqO0+fCCjZ9QtRrm54PW1cjV9G55bUxhPMzdU=
X-Google-Smtp-Source: AKy350bIUQ2PccjuA47BsiSgfjOr0WnlJLusJ50iYjJOtaOkCJgkSw5b5Xk+IJmVZxTT8HzFD4AYrQ==
X-Received: by 2002:adf:f547:0:b0:2fb:1d3a:93ff with SMTP id
 j7-20020adff547000000b002fb1d3a93ffmr2053433wrp.61.1681749647507; 
 Mon, 17 Apr 2023 09:40:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a5d61d1000000b002faaa9a1721sm2595103wrv.58.2023.04.17.09.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 09:40:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v3 08/10] hmp: Add 'one-insn-per-tb' command equivalent to
 'singlestep'
Date: Mon, 17 Apr 2023 17:40:39 +0100
Message-Id: <20230417164041.684562-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230417164041.684562-1-peter.maydell@linaro.org>
References: <20230417164041.684562-1-peter.maydell@linaro.org>
MIME-Version: 1.0
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



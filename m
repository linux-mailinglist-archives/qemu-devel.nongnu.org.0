Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AC736DE49
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:28:34 +0200 (CEST)
Received: from localhost ([::1]:41160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbnzF-0001vW-0b
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbndl-0001HM-QV
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:06:22 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbndg-0006bW-EC
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:06:21 -0400
Received: by mail-wr1-x42a.google.com with SMTP id h15so11587277wre.11
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 10:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tn2MzTrz7xwfpKYZAt9e7EHE2771er0S6seDM+df6hc=;
 b=chMIc7ugskdXUfGWNYfEr9IL9quipWYmFjLPuF34VY5iwOtD32XPM61PQLx1xFy/e+
 4KVnsbih9+twOgc93LtV7nri41JrBejiKzUyHqBkbaN1MYUPqMiGmikorag4HK06MXsN
 fR3l/HgRbCWnOgLu40oKEsgDOzrBgyJcP+3qS9v/Ps7W5MWKvB+C6Er6o4yTI6gm1XOp
 yi+eByEevGjyVM4hEvIrFaT8Dnj4+uxybgmHCdTcS/4dsbOxwaW6wIsMySbDJFmA9mmv
 I8N7Hd/HfN7Rzp5fzBqE0B92LBEOpjyrMBFf6UlEvYFykCAqyNMevblD5ho0XITghIds
 wzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tn2MzTrz7xwfpKYZAt9e7EHE2771er0S6seDM+df6hc=;
 b=PAN+KCjGzguiov70r0Sb4NbSRJOBMQ6Nzmfb6cgChoIYLlvp/OeegOCk9BKKxA69LX
 WN+lnKzKFVhug/71hfgHPIVqA12ju2h0+rMoqVVDnbq9zuaQgMNSJ+t4EyaJUYOPONNY
 UgFuE9CYBKgkuw2ixyrYxM13VTRE0ClW+ZANH2ABlVlUcfV888tqRmgO48+O9hMW8U5k
 i+Fa9uTud76HLLEzlHOqyXjTozLNjHTSL0TbiwRrUXG6GL0pLo6Nim+a1dz/3L2BZX3e
 Xw/PvK5FxRZsV19NfG8ApdwAspBIlHC9rC8uW0Z9OkchoPpI1PncVvC4FC3ZHlRA97BY
 nDxQ==
X-Gm-Message-State: AOAM532OBN5oTYBq3hpf2tBvTiufesW8zPx0nSzDCexBHXwCFxOsAlwy
 HM5rzXgve/QCS0KaleJbEH0iH25XRZzLnw==
X-Google-Smtp-Source: ABdhPJxi2jhAvNCHXwv7A8TYsMQZTiMpj93nmCJBiYwgF5NvxVQIkRzyRntEZiI8kO/Y7kR5gI4Agw==
X-Received: by 2002:adf:f80f:: with SMTP id s15mr3953974wrp.341.1619629574227; 
 Wed, 28 Apr 2021 10:06:14 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id l14sm346220wmq.4.2021.04.28.10.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 10:06:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 19/30] target/mips: Move sysemu TCG-specific code to
 tcg/sysemu/ subfolder
Date: Wed, 28 Apr 2021 19:03:59 +0200
Message-Id: <20210428170410.479308-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428170410.479308-1-f4bug@amsat.org>
References: <20210428170410.479308-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move cp0_helper.c and mips-semi.c to the new tcg/sysemu/ folder,
adapting the Meson machinery.

Move the opcode definitions to tcg/sysemu_helper.h.inc.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/helper.h                      | 166 +--------------------
 target/mips/tcg/sysemu_helper.h.inc       | 168 ++++++++++++++++++++++
 target/mips/{ => tcg/sysemu}/cp0_helper.c |   0
 target/mips/{ => tcg/sysemu}/mips-semi.c  |   0
 target/mips/meson.build                   |   5 -
 target/mips/tcg/meson.build               |   3 +
 target/mips/tcg/sysemu/meson.build        |   4 +
 7 files changed, 179 insertions(+), 167 deletions(-)
 create mode 100644 target/mips/tcg/sysemu_helper.h.inc
 rename target/mips/{ => tcg/sysemu}/cp0_helper.c (100%)
 rename target/mips/{ => tcg/sysemu}/mips-semi.c (100%)
 create mode 100644 target/mips/tcg/sysemu/meson.build

diff --git a/target/mips/helper.h b/target/mips/helper.h
index 709494445dd..bc308e5db13 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -2,10 +2,6 @@ DEF_HELPER_3(raise_exception_err, noreturn, env, i32, int)
 DEF_HELPER_2(raise_exception, noreturn, env, i32)
 DEF_HELPER_1(raise_exception_debug, noreturn, env)
 
-#ifndef CONFIG_USER_ONLY
-DEF_HELPER_1(do_semihosting, void, env)
-#endif
-
 #ifdef TARGET_MIPS64
 DEF_HELPER_4(sdl, void, env, tl, tl, int)
 DEF_HELPER_4(sdr, void, env, tl, tl, int)
@@ -42,164 +38,6 @@ DEF_HELPER_FLAGS_1(dbitswap, TCG_CALL_NO_RWG_SE, tl, tl)
 
 DEF_HELPER_FLAGS_4(rotx, TCG_CALL_NO_RWG_SE, tl, tl, i32, i32, i32)
 
-#ifndef CONFIG_USER_ONLY
-/* CP0 helpers */
-DEF_HELPER_1(mfc0_mvpcontrol, tl, env)
-DEF_HELPER_1(mfc0_mvpconf0, tl, env)
-DEF_HELPER_1(mfc0_mvpconf1, tl, env)
-DEF_HELPER_1(mftc0_vpecontrol, tl, env)
-DEF_HELPER_1(mftc0_vpeconf0, tl, env)
-DEF_HELPER_1(mfc0_random, tl, env)
-DEF_HELPER_1(mfc0_tcstatus, tl, env)
-DEF_HELPER_1(mftc0_tcstatus, tl, env)
-DEF_HELPER_1(mfc0_tcbind, tl, env)
-DEF_HELPER_1(mftc0_tcbind, tl, env)
-DEF_HELPER_1(mfc0_tcrestart, tl, env)
-DEF_HELPER_1(mftc0_tcrestart, tl, env)
-DEF_HELPER_1(mfc0_tchalt, tl, env)
-DEF_HELPER_1(mftc0_tchalt, tl, env)
-DEF_HELPER_1(mfc0_tccontext, tl, env)
-DEF_HELPER_1(mftc0_tccontext, tl, env)
-DEF_HELPER_1(mfc0_tcschedule, tl, env)
-DEF_HELPER_1(mftc0_tcschedule, tl, env)
-DEF_HELPER_1(mfc0_tcschefback, tl, env)
-DEF_HELPER_1(mftc0_tcschefback, tl, env)
-DEF_HELPER_1(mfc0_count, tl, env)
-DEF_HELPER_1(mfc0_saar, tl, env)
-DEF_HELPER_1(mfhc0_saar, tl, env)
-DEF_HELPER_1(mftc0_entryhi, tl, env)
-DEF_HELPER_1(mftc0_status, tl, env)
-DEF_HELPER_1(mftc0_cause, tl, env)
-DEF_HELPER_1(mftc0_epc, tl, env)
-DEF_HELPER_1(mftc0_ebase, tl, env)
-DEF_HELPER_2(mftc0_configx, tl, env, tl)
-DEF_HELPER_1(mfc0_lladdr, tl, env)
-DEF_HELPER_1(mfc0_maar, tl, env)
-DEF_HELPER_1(mfhc0_maar, tl, env)
-DEF_HELPER_2(mfc0_watchlo, tl, env, i32)
-DEF_HELPER_2(mfc0_watchhi, tl, env, i32)
-DEF_HELPER_2(mfhc0_watchhi, tl, env, i32)
-DEF_HELPER_1(mfc0_debug, tl, env)
-DEF_HELPER_1(mftc0_debug, tl, env)
-#ifdef TARGET_MIPS64
-DEF_HELPER_1(dmfc0_tcrestart, tl, env)
-DEF_HELPER_1(dmfc0_tchalt, tl, env)
-DEF_HELPER_1(dmfc0_tccontext, tl, env)
-DEF_HELPER_1(dmfc0_tcschedule, tl, env)
-DEF_HELPER_1(dmfc0_tcschefback, tl, env)
-DEF_HELPER_1(dmfc0_lladdr, tl, env)
-DEF_HELPER_1(dmfc0_maar, tl, env)
-DEF_HELPER_2(dmfc0_watchlo, tl, env, i32)
-DEF_HELPER_2(dmfc0_watchhi, tl, env, i32)
-DEF_HELPER_1(dmfc0_saar, tl, env)
-#endif /* TARGET_MIPS64 */
-
-DEF_HELPER_2(mtc0_index, void, env, tl)
-DEF_HELPER_2(mtc0_mvpcontrol, void, env, tl)
-DEF_HELPER_2(mtc0_vpecontrol, void, env, tl)
-DEF_HELPER_2(mttc0_vpecontrol, void, env, tl)
-DEF_HELPER_2(mtc0_vpeconf0, void, env, tl)
-DEF_HELPER_2(mttc0_vpeconf0, void, env, tl)
-DEF_HELPER_2(mtc0_vpeconf1, void, env, tl)
-DEF_HELPER_2(mtc0_yqmask, void, env, tl)
-DEF_HELPER_2(mtc0_vpeopt, void, env, tl)
-DEF_HELPER_2(mtc0_entrylo0, void, env, tl)
-DEF_HELPER_2(mtc0_tcstatus, void, env, tl)
-DEF_HELPER_2(mttc0_tcstatus, void, env, tl)
-DEF_HELPER_2(mtc0_tcbind, void, env, tl)
-DEF_HELPER_2(mttc0_tcbind, void, env, tl)
-DEF_HELPER_2(mtc0_tcrestart, void, env, tl)
-DEF_HELPER_2(mttc0_tcrestart, void, env, tl)
-DEF_HELPER_2(mtc0_tchalt, void, env, tl)
-DEF_HELPER_2(mttc0_tchalt, void, env, tl)
-DEF_HELPER_2(mtc0_tccontext, void, env, tl)
-DEF_HELPER_2(mttc0_tccontext, void, env, tl)
-DEF_HELPER_2(mtc0_tcschedule, void, env, tl)
-DEF_HELPER_2(mttc0_tcschedule, void, env, tl)
-DEF_HELPER_2(mtc0_tcschefback, void, env, tl)
-DEF_HELPER_2(mttc0_tcschefback, void, env, tl)
-DEF_HELPER_2(mtc0_entrylo1, void, env, tl)
-DEF_HELPER_2(mtc0_context, void, env, tl)
-DEF_HELPER_2(mtc0_memorymapid, void, env, tl)
-DEF_HELPER_2(mtc0_pagemask, void, env, tl)
-DEF_HELPER_2(mtc0_pagegrain, void, env, tl)
-DEF_HELPER_2(mtc0_segctl0, void, env, tl)
-DEF_HELPER_2(mtc0_segctl1, void, env, tl)
-DEF_HELPER_2(mtc0_segctl2, void, env, tl)
-DEF_HELPER_2(mtc0_pwfield, void, env, tl)
-DEF_HELPER_2(mtc0_pwsize, void, env, tl)
-DEF_HELPER_2(mtc0_wired, void, env, tl)
-DEF_HELPER_2(mtc0_srsconf0, void, env, tl)
-DEF_HELPER_2(mtc0_srsconf1, void, env, tl)
-DEF_HELPER_2(mtc0_srsconf2, void, env, tl)
-DEF_HELPER_2(mtc0_srsconf3, void, env, tl)
-DEF_HELPER_2(mtc0_srsconf4, void, env, tl)
-DEF_HELPER_2(mtc0_hwrena, void, env, tl)
-DEF_HELPER_2(mtc0_pwctl, void, env, tl)
-DEF_HELPER_2(mtc0_count, void, env, tl)
-DEF_HELPER_2(mtc0_saari, void, env, tl)
-DEF_HELPER_2(mtc0_saar, void, env, tl)
-DEF_HELPER_2(mthc0_saar, void, env, tl)
-DEF_HELPER_2(mtc0_entryhi, void, env, tl)
-DEF_HELPER_2(mttc0_entryhi, void, env, tl)
-DEF_HELPER_2(mtc0_compare, void, env, tl)
-DEF_HELPER_2(mtc0_status, void, env, tl)
-DEF_HELPER_2(mttc0_status, void, env, tl)
-DEF_HELPER_2(mtc0_intctl, void, env, tl)
-DEF_HELPER_2(mtc0_srsctl, void, env, tl)
-DEF_HELPER_2(mtc0_cause, void, env, tl)
-DEF_HELPER_2(mttc0_cause, void, env, tl)
-DEF_HELPER_2(mtc0_ebase, void, env, tl)
-DEF_HELPER_2(mttc0_ebase, void, env, tl)
-DEF_HELPER_2(mtc0_config0, void, env, tl)
-DEF_HELPER_2(mtc0_config2, void, env, tl)
-DEF_HELPER_2(mtc0_config3, void, env, tl)
-DEF_HELPER_2(mtc0_config4, void, env, tl)
-DEF_HELPER_2(mtc0_config5, void, env, tl)
-DEF_HELPER_2(mtc0_lladdr, void, env, tl)
-DEF_HELPER_2(mtc0_maar, void, env, tl)
-DEF_HELPER_2(mthc0_maar, void, env, tl)
-DEF_HELPER_2(mtc0_maari, void, env, tl)
-DEF_HELPER_3(mtc0_watchlo, void, env, tl, i32)
-DEF_HELPER_3(mtc0_watchhi, void, env, tl, i32)
-DEF_HELPER_3(mthc0_watchhi, void, env, tl, i32)
-DEF_HELPER_2(mtc0_xcontext, void, env, tl)
-DEF_HELPER_2(mtc0_framemask, void, env, tl)
-DEF_HELPER_2(mtc0_debug, void, env, tl)
-DEF_HELPER_2(mttc0_debug, void, env, tl)
-DEF_HELPER_2(mtc0_performance0, void, env, tl)
-DEF_HELPER_2(mtc0_errctl, void, env, tl)
-DEF_HELPER_2(mtc0_taglo, void, env, tl)
-DEF_HELPER_2(mtc0_datalo, void, env, tl)
-DEF_HELPER_2(mtc0_taghi, void, env, tl)
-DEF_HELPER_2(mtc0_datahi, void, env, tl)
-
-#if defined(TARGET_MIPS64)
-DEF_HELPER_2(dmtc0_entrylo0, void, env, i64)
-DEF_HELPER_2(dmtc0_entrylo1, void, env, i64)
-#endif
-
-/* MIPS MT functions */
-DEF_HELPER_2(mftgpr, tl, env, i32)
-DEF_HELPER_2(mftlo, tl, env, i32)
-DEF_HELPER_2(mfthi, tl, env, i32)
-DEF_HELPER_2(mftacx, tl, env, i32)
-DEF_HELPER_1(mftdsp, tl, env)
-DEF_HELPER_3(mttgpr, void, env, tl, i32)
-DEF_HELPER_3(mttlo, void, env, tl, i32)
-DEF_HELPER_3(mtthi, void, env, tl, i32)
-DEF_HELPER_3(mttacx, void, env, tl, i32)
-DEF_HELPER_2(mttdsp, void, env, tl)
-DEF_HELPER_0(dmt, tl)
-DEF_HELPER_0(emt, tl)
-DEF_HELPER_1(dvpe, tl, env)
-DEF_HELPER_1(evpe, tl, env)
-
-/* R6 Multi-threading */
-DEF_HELPER_1(dvp, tl, env)
-DEF_HELPER_1(evp, tl, env)
-#endif /* !CONFIG_USER_ONLY */
-
 /* microMIPS functions */
 DEF_HELPER_4(lwm, void, env, tl, tl, i32)
 DEF_HELPER_4(swm, void, env, tl, tl, i32)
@@ -783,4 +621,8 @@ DEF_HELPER_FLAGS_2(rddsp, 0, tl, tl, env)
 
 DEF_HELPER_3(cache, void, env, tl, i32)
 
+#ifndef CONFIG_USER_ONLY
+#include "tcg/sysemu_helper.h.inc"
+#endif /* !CONFIG_USER_ONLY */
+
 #include "msa_helper.h.inc"
diff --git a/target/mips/tcg/sysemu_helper.h.inc b/target/mips/tcg/sysemu_helper.h.inc
new file mode 100644
index 00000000000..d136c4160a7
--- /dev/null
+++ b/target/mips/tcg/sysemu_helper.h.inc
@@ -0,0 +1,168 @@
+/*
+ *  QEMU MIPS sysemu helpers
+ *
+ *  Copyright (c) 2004-2005 Jocelyn Mayer
+ *  Copyright (c) 2006 Marius Groeger (FPU operations)
+ *  Copyright (c) 2006 Thiemo Seufer (MIPS32R2 support)
+ *  Copyright (c) 2009 CodeSourcery (MIPS16 and microMIPS support)
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+DEF_HELPER_1(do_semihosting, void, env)
+
+/* CP0 helpers */
+DEF_HELPER_1(mfc0_mvpcontrol, tl, env)
+DEF_HELPER_1(mfc0_mvpconf0, tl, env)
+DEF_HELPER_1(mfc0_mvpconf1, tl, env)
+DEF_HELPER_1(mftc0_vpecontrol, tl, env)
+DEF_HELPER_1(mftc0_vpeconf0, tl, env)
+DEF_HELPER_1(mfc0_random, tl, env)
+DEF_HELPER_1(mfc0_tcstatus, tl, env)
+DEF_HELPER_1(mftc0_tcstatus, tl, env)
+DEF_HELPER_1(mfc0_tcbind, tl, env)
+DEF_HELPER_1(mftc0_tcbind, tl, env)
+DEF_HELPER_1(mfc0_tcrestart, tl, env)
+DEF_HELPER_1(mftc0_tcrestart, tl, env)
+DEF_HELPER_1(mfc0_tchalt, tl, env)
+DEF_HELPER_1(mftc0_tchalt, tl, env)
+DEF_HELPER_1(mfc0_tccontext, tl, env)
+DEF_HELPER_1(mftc0_tccontext, tl, env)
+DEF_HELPER_1(mfc0_tcschedule, tl, env)
+DEF_HELPER_1(mftc0_tcschedule, tl, env)
+DEF_HELPER_1(mfc0_tcschefback, tl, env)
+DEF_HELPER_1(mftc0_tcschefback, tl, env)
+DEF_HELPER_1(mfc0_count, tl, env)
+DEF_HELPER_1(mfc0_saar, tl, env)
+DEF_HELPER_1(mfhc0_saar, tl, env)
+DEF_HELPER_1(mftc0_entryhi, tl, env)
+DEF_HELPER_1(mftc0_status, tl, env)
+DEF_HELPER_1(mftc0_cause, tl, env)
+DEF_HELPER_1(mftc0_epc, tl, env)
+DEF_HELPER_1(mftc0_ebase, tl, env)
+DEF_HELPER_2(mftc0_configx, tl, env, tl)
+DEF_HELPER_1(mfc0_lladdr, tl, env)
+DEF_HELPER_1(mfc0_maar, tl, env)
+DEF_HELPER_1(mfhc0_maar, tl, env)
+DEF_HELPER_2(mfc0_watchlo, tl, env, i32)
+DEF_HELPER_2(mfc0_watchhi, tl, env, i32)
+DEF_HELPER_2(mfhc0_watchhi, tl, env, i32)
+DEF_HELPER_1(mfc0_debug, tl, env)
+DEF_HELPER_1(mftc0_debug, tl, env)
+#ifdef TARGET_MIPS64
+DEF_HELPER_1(dmfc0_tcrestart, tl, env)
+DEF_HELPER_1(dmfc0_tchalt, tl, env)
+DEF_HELPER_1(dmfc0_tccontext, tl, env)
+DEF_HELPER_1(dmfc0_tcschedule, tl, env)
+DEF_HELPER_1(dmfc0_tcschefback, tl, env)
+DEF_HELPER_1(dmfc0_lladdr, tl, env)
+DEF_HELPER_1(dmfc0_maar, tl, env)
+DEF_HELPER_2(dmfc0_watchlo, tl, env, i32)
+DEF_HELPER_2(dmfc0_watchhi, tl, env, i32)
+DEF_HELPER_1(dmfc0_saar, tl, env)
+#endif /* TARGET_MIPS64 */
+
+DEF_HELPER_2(mtc0_index, void, env, tl)
+DEF_HELPER_2(mtc0_mvpcontrol, void, env, tl)
+DEF_HELPER_2(mtc0_vpecontrol, void, env, tl)
+DEF_HELPER_2(mttc0_vpecontrol, void, env, tl)
+DEF_HELPER_2(mtc0_vpeconf0, void, env, tl)
+DEF_HELPER_2(mttc0_vpeconf0, void, env, tl)
+DEF_HELPER_2(mtc0_vpeconf1, void, env, tl)
+DEF_HELPER_2(mtc0_yqmask, void, env, tl)
+DEF_HELPER_2(mtc0_vpeopt, void, env, tl)
+DEF_HELPER_2(mtc0_entrylo0, void, env, tl)
+DEF_HELPER_2(mtc0_tcstatus, void, env, tl)
+DEF_HELPER_2(mttc0_tcstatus, void, env, tl)
+DEF_HELPER_2(mtc0_tcbind, void, env, tl)
+DEF_HELPER_2(mttc0_tcbind, void, env, tl)
+DEF_HELPER_2(mtc0_tcrestart, void, env, tl)
+DEF_HELPER_2(mttc0_tcrestart, void, env, tl)
+DEF_HELPER_2(mtc0_tchalt, void, env, tl)
+DEF_HELPER_2(mttc0_tchalt, void, env, tl)
+DEF_HELPER_2(mtc0_tccontext, void, env, tl)
+DEF_HELPER_2(mttc0_tccontext, void, env, tl)
+DEF_HELPER_2(mtc0_tcschedule, void, env, tl)
+DEF_HELPER_2(mttc0_tcschedule, void, env, tl)
+DEF_HELPER_2(mtc0_tcschefback, void, env, tl)
+DEF_HELPER_2(mttc0_tcschefback, void, env, tl)
+DEF_HELPER_2(mtc0_entrylo1, void, env, tl)
+DEF_HELPER_2(mtc0_context, void, env, tl)
+DEF_HELPER_2(mtc0_memorymapid, void, env, tl)
+DEF_HELPER_2(mtc0_pagemask, void, env, tl)
+DEF_HELPER_2(mtc0_pagegrain, void, env, tl)
+DEF_HELPER_2(mtc0_segctl0, void, env, tl)
+DEF_HELPER_2(mtc0_segctl1, void, env, tl)
+DEF_HELPER_2(mtc0_segctl2, void, env, tl)
+DEF_HELPER_2(mtc0_pwfield, void, env, tl)
+DEF_HELPER_2(mtc0_pwsize, void, env, tl)
+DEF_HELPER_2(mtc0_wired, void, env, tl)
+DEF_HELPER_2(mtc0_srsconf0, void, env, tl)
+DEF_HELPER_2(mtc0_srsconf1, void, env, tl)
+DEF_HELPER_2(mtc0_srsconf2, void, env, tl)
+DEF_HELPER_2(mtc0_srsconf3, void, env, tl)
+DEF_HELPER_2(mtc0_srsconf4, void, env, tl)
+DEF_HELPER_2(mtc0_hwrena, void, env, tl)
+DEF_HELPER_2(mtc0_pwctl, void, env, tl)
+DEF_HELPER_2(mtc0_count, void, env, tl)
+DEF_HELPER_2(mtc0_saari, void, env, tl)
+DEF_HELPER_2(mtc0_saar, void, env, tl)
+DEF_HELPER_2(mthc0_saar, void, env, tl)
+DEF_HELPER_2(mtc0_entryhi, void, env, tl)
+DEF_HELPER_2(mttc0_entryhi, void, env, tl)
+DEF_HELPER_2(mtc0_compare, void, env, tl)
+DEF_HELPER_2(mtc0_status, void, env, tl)
+DEF_HELPER_2(mttc0_status, void, env, tl)
+DEF_HELPER_2(mtc0_intctl, void, env, tl)
+DEF_HELPER_2(mtc0_srsctl, void, env, tl)
+DEF_HELPER_2(mtc0_cause, void, env, tl)
+DEF_HELPER_2(mttc0_cause, void, env, tl)
+DEF_HELPER_2(mtc0_ebase, void, env, tl)
+DEF_HELPER_2(mttc0_ebase, void, env, tl)
+DEF_HELPER_2(mtc0_config0, void, env, tl)
+DEF_HELPER_2(mtc0_config2, void, env, tl)
+DEF_HELPER_2(mtc0_config3, void, env, tl)
+DEF_HELPER_2(mtc0_config4, void, env, tl)
+DEF_HELPER_2(mtc0_config5, void, env, tl)
+DEF_HELPER_2(mtc0_lladdr, void, env, tl)
+DEF_HELPER_2(mtc0_maar, void, env, tl)
+DEF_HELPER_2(mthc0_maar, void, env, tl)
+DEF_HELPER_2(mtc0_maari, void, env, tl)
+DEF_HELPER_3(mtc0_watchlo, void, env, tl, i32)
+DEF_HELPER_3(mtc0_watchhi, void, env, tl, i32)
+DEF_HELPER_3(mthc0_watchhi, void, env, tl, i32)
+DEF_HELPER_2(mtc0_xcontext, void, env, tl)
+DEF_HELPER_2(mtc0_framemask, void, env, tl)
+DEF_HELPER_2(mtc0_debug, void, env, tl)
+DEF_HELPER_2(mttc0_debug, void, env, tl)
+DEF_HELPER_2(mtc0_performance0, void, env, tl)
+DEF_HELPER_2(mtc0_errctl, void, env, tl)
+DEF_HELPER_2(mtc0_taglo, void, env, tl)
+DEF_HELPER_2(mtc0_datalo, void, env, tl)
+DEF_HELPER_2(mtc0_taghi, void, env, tl)
+DEF_HELPER_2(mtc0_datahi, void, env, tl)
+
+#if defined(TARGET_MIPS64)
+DEF_HELPER_2(dmtc0_entrylo0, void, env, i64)
+DEF_HELPER_2(dmtc0_entrylo1, void, env, i64)
+#endif
+
+/* MIPS MT functions */
+DEF_HELPER_2(mftgpr, tl, env, i32)
+DEF_HELPER_2(mftlo, tl, env, i32)
+DEF_HELPER_2(mfthi, tl, env, i32)
+DEF_HELPER_2(mftacx, tl, env, i32)
+DEF_HELPER_1(mftdsp, tl, env)
+DEF_HELPER_3(mttgpr, void, env, tl, i32)
+DEF_HELPER_3(mttlo, void, env, tl, i32)
+DEF_HELPER_3(mtthi, void, env, tl, i32)
+DEF_HELPER_3(mttacx, void, env, tl, i32)
+DEF_HELPER_2(mttdsp, void, env, tl)
+DEF_HELPER_0(dmt, tl)
+DEF_HELPER_0(emt, tl)
+DEF_HELPER_1(dvpe, tl, env)
+DEF_HELPER_1(evpe, tl, env)
+
+/* R6 Multi-threading */
+DEF_HELPER_1(dvp, tl, env)
+DEF_HELPER_1(evp, tl, env)
diff --git a/target/mips/cp0_helper.c b/target/mips/tcg/sysemu/cp0_helper.c
similarity index 100%
rename from target/mips/cp0_helper.c
rename to target/mips/tcg/sysemu/cp0_helper.c
diff --git a/target/mips/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
similarity index 100%
rename from target/mips/mips-semi.c
rename to target/mips/tcg/sysemu/mips-semi.c
diff --git a/target/mips/meson.build b/target/mips/meson.build
index 9a507937ece..a55af1cd6cf 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -47,11 +47,6 @@
 
 mips_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
 
-mips_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
-  'cp0_helper.c',
-  'mips-semi.c',
-))
-
 mips_ss.add_all(when: 'CONFIG_TCG', if_true: [mips_tcg_ss])
 
 target_arch += {'mips': mips_ss}
diff --git a/target/mips/tcg/meson.build b/target/mips/tcg/meson.build
index b74fa04303e..2cffc5a5ac6 100644
--- a/target/mips/tcg/meson.build
+++ b/target/mips/tcg/meson.build
@@ -1,3 +1,6 @@
 if have_user
   subdir('user')
 endif
+if have_system
+  subdir('sysemu')
+endif
diff --git a/target/mips/tcg/sysemu/meson.build b/target/mips/tcg/sysemu/meson.build
new file mode 100644
index 00000000000..5c3024e7760
--- /dev/null
+++ b/target/mips/tcg/sysemu/meson.build
@@ -0,0 +1,4 @@
+mips_softmmu_ss.add(files(
+  'cp0_helper.c',
+  'mips-semi.c',
+))
-- 
2.26.3



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC366E4E7D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 18:42:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poRuP-0002LC-5g; Mon, 17 Apr 2023 12:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1poRuL-0002JS-QN
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 12:40:49 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1poRuJ-0001Mg-KW
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 12:40:49 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f09f954d29so16431015e9.0
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 09:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681749646; x=1684341646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5vzGB5zyqexh5lZpRKf1Wm53aoZK4fu1hbifevUF8JI=;
 b=Cnzs/4CavDfYthDw1hlBMv+leZ3cCYcx7HPMcZEL+1iKq0MBh9aqsHlWXlVpe/JOJV
 GVtH16lK3xHt67v8bOgxtxylb6FXj58pQglOTAZbEK7R4OowW9CuNugWrMQ49hvHZpaZ
 xasuu+9lrMx9JMrwjfvxNYEJ9GWVuR9Fnjhhr92v5ka6NQu7pB6Oj/IX9NxAfacQoaU4
 jOlQJe+L05IXVUnHRWffzi8ReEuGC6cgLJktscAjYoK9NHgWrhhXHlePpmre89IiwN0o
 ojd+ZLW+6jA+jnQWRU284cj3NlOG/uYgtsgqHWMYcHfYd7C15kiR5KUB8h5TxfXiqtWR
 s51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681749646; x=1684341646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5vzGB5zyqexh5lZpRKf1Wm53aoZK4fu1hbifevUF8JI=;
 b=ebx2tor4aqE0o3+kqaI2GyKsGPuiuz0wsrFrk0idvWL5wKdRdFDuotADRzK5UKQd1M
 Ap2k835L5XteLpXw8y/oQZ78AdabR9QiB9zCI//tC1ckRLo4Z/gJ2Di6tVlnffl1JOYs
 E+DwZfB9fWQBSmjzRNojpAvoLj9pQuADx6RBGDEmR74oAUUen5KoJHsGwTKLEruT7mJU
 j6RHpz4Kc5Excm+/MGATWzoHnKK7xB89Q/NUTiw9ya9rQ5DaeFt6lYJoFZuDGimI9HgX
 +egngUeWg0VG8TD/EPADnZ3genLXUcYWNE/tb4FbpIShuvpdmRrg9bAIF/El+n8dYouG
 jaag==
X-Gm-Message-State: AAQBX9epgz45KH5rL0nlHuvmlMXkBH9q33TqUGPvgnPbDsRYhAQlc+y2
 Dm6VMeYnzfEV4asYCRwprZYsm/4gCyNmN5ieAas=
X-Google-Smtp-Source: AKy350be5jSZOQJOPH1m5UhDLscM+4m4hCk+ImxYip+UD6KYG3cBBVCI95RQqpqvPkJntWCrP5DIPw==
X-Received: by 2002:adf:e688:0:b0:2f4:62cc:922b with SMTP id
 r8-20020adfe688000000b002f462cc922bmr6648536wrm.16.1681749646377; 
 Mon, 17 Apr 2023 09:40:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a5d61d1000000b002faaa9a1721sm2595103wrv.58.2023.04.17.09.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 09:40:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v3 06/10] Document that -singlestep command line option is
 deprecated
Date: Mon, 17 Apr 2023 17:40:37 +0100
Message-Id: <20230417164041.684562-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230417164041.684562-1-peter.maydell@linaro.org>
References: <20230417164041.684562-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

Document that the -singlestep command line option is now
deprecated, as it is replaced by either the TCG accelerator
property 'one-insn-per-tb' for system emulation or the new
'-one-insn-per-tb' option for usermode emulation, and remove
the only use of the deprecated syntax from a README.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/about/deprecated.rst | 16 ++++++++++++++++
 qemu-options.hx           |  5 +++--
 tcg/tci/README            |  2 +-
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 1ca9dc33d61..3c62671dac1 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -111,6 +111,22 @@ Use ``-machine acpi=off`` instead.
 The HAXM project has been retired (see https://github.com/intel/haxm#status).
 Use "whpx" (on Windows) or "hvf" (on macOS) instead.
 
+``-singlestep`` (since 8.1)
+'''''''''''''''''''''''''''
+
+The ``-singlestep`` option has been turned into an accelerator property,
+and given a name that better reflects what it actually does.
+Use ``-accel tcg,one-insn-per-tb=on`` instead.
+
+User-mode emulator command line arguments
+-----------------------------------------
+
+``-singlestep`` (since 8.1)
+'''''''''''''''''''''''''''
+
+The ``-singlestep`` option has been given a name that better reflects
+what it actually does. For both linux-user and bsd-user, use the
+new ``-one-insn-per-tb`` option instead.
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/qemu-options.hx b/qemu-options.hx
index 1dffd36884e..6a59e997497 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4159,10 +4159,11 @@ SRST
 ERST
 
 DEF("singlestep", 0, QEMU_OPTION_singlestep, \
-    "-singlestep     always run in singlestep mode\n", QEMU_ARCH_ALL)
+    "-singlestep     deprecated synonym for -accel tcg,one-insn-per-tb=on\n", QEMU_ARCH_ALL)
 SRST
 ``-singlestep``
-    Run the emulation in single step mode.
+    This is a deprecated synonym for the TCG accelerator property
+    ``one-insn-per-tb``.
 ERST
 
 DEF("preconfig", 0, QEMU_OPTION_preconfig, \
diff --git a/tcg/tci/README b/tcg/tci/README
index f72a40a395a..4a8b5b54018 100644
--- a/tcg/tci/README
+++ b/tcg/tci/README
@@ -49,7 +49,7 @@ The only difference from running QEMU with TCI to running without TCI
 should be speed. Especially during development of TCI, it was very
 useful to compare runs with and without TCI. Create /tmp/qemu.log by
 
-        qemu-system-i386 -d in_asm,op_opt,cpu -D /tmp/qemu.log -singlestep
+        qemu-system-i386 -d in_asm,op_opt,cpu -D /tmp/qemu.log -accel tcg,one-insn-per-tb=on
 
 once with interpreter and once without interpreter and compare the resulting
 qemu.log files. This is also useful to see the effects of additional
-- 
2.34.1



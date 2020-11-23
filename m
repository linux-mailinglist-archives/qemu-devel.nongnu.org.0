Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D772C1736
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 22:05:57 +0100 (CET)
Received: from localhost ([::1]:48490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khJ24-0003XJ-Q4
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 16:05:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIiV-0001Zg-Hv
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:45:43 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:36852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIiT-0001Sj-N7
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:45:43 -0500
Received: by mail-wr1-x441.google.com with SMTP id z7so4295123wrn.3
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 12:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SBIr5PT79YnRUqQgQlYRdY4YoLLnHZdi2jwadwiH97E=;
 b=uJjuyRPMhlFDcqqjqSZrLyWj4Np4Ae9X38Uq5vBjacQfDaUNgot4dslBKIRkhectFE
 XR37hbQgJqa/GBq8ag66LSWSFHvjlqhVD/dwOTHs2nUJcTC1vH5nNvG/LIrq4Qz2Xyip
 JZ7Eofuy6wlSppwbFxX7fF77CUkwTfiKC9F1DHCPBHxE741JFI7levdEI2kJE7W+zYVS
 jumduxhfnSNtTrw8eg7Qh4HNGesaplBrGQlUpPFxowMRPzGa8Qrt/8iTwWCkyTm55j6I
 Y2V9U1Qm8IpPt3ODD4ftK660jlswS1j0g/uwIMIrQZGttHl4x74XR6/lye24cdJI3m4p
 FSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SBIr5PT79YnRUqQgQlYRdY4YoLLnHZdi2jwadwiH97E=;
 b=IktaRtyYDMTbrl8bDq54mBSfivXsdHgM2Zy0VFNOnHqBRS5RPlZ6vhq9d8alViXNt4
 cJI7crAcRYjlmKjvyWdjjG3wfUnJGvpNVutqkWksyyaULyt9HPdTaIbge0qq9nm+KkuM
 eLsKi6zDPZjvNtYweF8etrFb1bOOIuKLSaFJqmN3HVhL8OT7cdvRpFbidmXtSIm3TWX3
 1XThLvz5XHQcTYo3+E7cTVLr9kfPryXDAVQuAtADfrNluWpCx4foW1w1Kn9oh18el7E6
 PdfR02TnqwCDHLJAUOhDyVu5VCdBgaHzGh5dfVN6t+7rqnQFhLeJqVetsZr11YTv0LgR
 P6QA==
X-Gm-Message-State: AOAM533YOURif9mGe9/pYjG8qkxehUITmv3y+IWSmdjNkKwNWUr0GKJY
 ggmIlwzLkVdEQXAsP2teNl462RA2x8Y=
X-Google-Smtp-Source: ABdhPJx1CGPcw8LNQycD3mmwdTWHTs/Mqn7cF8KhqbBFwJCIPHfQiVbiXsG+nkYa3fX0VhyLDEaQUw==
X-Received: by 2002:a5d:4e4c:: with SMTP id r12mr1551574wrt.348.1606164340092; 
 Mon, 23 Nov 2020 12:45:40 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id a144sm883581wmd.47.2020.11.23.12.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 12:45:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/28] target/mips: Extract Multi-Threading helper
 definitions
Date: Mon, 23 Nov 2020 21:44:30 +0100
Message-Id: <20201123204448.3260804-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201123204448.3260804-1-f4bug@amsat.org>
References: <20201123204448.3260804-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'MIPS MT' is defined as a Module by MIPS. Extract the helper
definitions to 'mod-mt_helper.h.inc'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201120210844.2625602-9-f4bug@amsat.org>
---
 target/mips/helper.h            | 23 +--------------------
 target/mips/mod-mt_helper.h.inc | 36 +++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 22 deletions(-)
 create mode 100644 target/mips/mod-mt_helper.h.inc

diff --git a/target/mips/helper.h b/target/mips/helper.h
index 82f40c3b9bc..18366bc0345 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -179,25 +179,6 @@ DEF_HELPER_2(dmtc0_entrylo0, void, env, i64)
 DEF_HELPER_2(dmtc0_entrylo1, void, env, i64)
 #endif
 
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
 #endif /* !CONFIG_USER_ONLY */
 
 /* microMIPS functions */
@@ -208,9 +189,6 @@ DEF_HELPER_4(ldm, void, env, tl, tl, i32)
 DEF_HELPER_4(sdm, void, env, tl, tl, i32)
 #endif
 
-DEF_HELPER_2(fork, void, tl, tl)
-DEF_HELPER_2(yield, tl, env, tl)
-
 /* CP1 functions */
 DEF_HELPER_2(cfc1, tl, env, i32)
 DEF_HELPER_4(ctc1, void, env, tl, i32, i32)
@@ -451,3 +429,4 @@ DEF_HELPER_3(cache, void, env, tl, i32)
 
 #include "mod-dsp_helper.h.inc"
 #include "mod-msa_helper.h.inc"
+#include "mod-mt_helper.h.inc"
diff --git a/target/mips/mod-mt_helper.h.inc b/target/mips/mod-mt_helper.h.inc
new file mode 100644
index 00000000000..0db58e2a780
--- /dev/null
+++ b/target/mips/mod-mt_helper.h.inc
@@ -0,0 +1,36 @@
+/*
+ * MIPS Multi-Threading helpers for QEMU.
+ *
+ *  Copyright (c) 2004-2005 Jocelyn Mayer
+ *  Copyright (c) 2006 Marius Groeger (FPU operations)
+ *  Copyright (c) 2006 Thiemo Seufer (MIPS32R2 support)
+ *  Copyright (c) 2009 CodeSourcery (MIPS16 and microMIPS support)
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+#ifndef CONFIG_USER_ONLY
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
+
+DEF_HELPER_0(dmt, tl)
+DEF_HELPER_0(emt, tl)
+
+DEF_HELPER_1(dvpe, tl, env)
+DEF_HELPER_1(evpe, tl, env)
+
+/* R6 Multi-threading */
+DEF_HELPER_1(dvp, tl, env)
+DEF_HELPER_1(evp, tl, env)
+#endif /* !CONFIG_USER_ONLY */
+
+DEF_HELPER_2(fork, void, tl, tl)
+DEF_HELPER_2(yield, tl, env, tl)
-- 
2.26.2



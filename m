Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 925542BB821
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 22:13:19 +0100 (CET)
Received: from localhost ([::1]:48604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgDiY-0007OL-KF
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 16:13:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDeu-0003Wa-Jz
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:09:32 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:39132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDes-0003xg-Rl
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:09:32 -0500
Received: by mail-wm1-x342.google.com with SMTP id s13so11239565wmh.4
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 13:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y6PVLgrWI9U5avOLga7o8h5cNRHQNNP+gsHWE0oqgdU=;
 b=M9MHZFjuIT/OicHfAKQzkdF/xuGEoOW03jasoyee94WayFuKqe/e5CtLKNuW5vGmyh
 yvdmn38rK4Q3FDNJw4wQUiEYO/rwDT3ILeZVXEbyP9cGUL75TeBC5Kw6jsr4MUbLlG0u
 XpuU2sPLzFaGtmypTzxRpDafFPzrFJgZekjLkHbOdFdzFEUJchhNPoQDjigErgWASOGz
 6Fd4ewUaOMyBfK3eIw6APzQxH7A4MMNOZMlPFSZACpMj5QOtd7TANUc7pMpjBVVD63qi
 L/Y0d1FhOG5BFisNYX6ecszEfm4mdE20ZtLzqdtQCuRG6hN7B2qNon4cx6J1k9vOr4IG
 80pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=y6PVLgrWI9U5avOLga7o8h5cNRHQNNP+gsHWE0oqgdU=;
 b=MJwfQF13V6GduPoxcyBr5elgzkUmZQ318DJJJyIlK2q7VB3jTVj9zrebArqE4/dWz4
 FW6n+q7GSCAl9iUh0xfLjGEoPoBOewiA/2oS3NlI0t3xw9uC4dlX0JpUkMwJFnyRV3Kp
 TGOZg8zkKRXltR3ngSQM1gwlftBQLJi3Yf1mVDIJAKKdNiPSeIbpLTKUcI6ELFH9uOjQ
 BHGv2ioId6BcaNPQfocXgl28LN5y+WYRYWC4u7o8cQwfnxjau0bgaVQKoQjSpPqHGOlx
 jrm0LPJtK98yyroKLggwvralbTx4icyit7OgtEAcUuczcf9K6kWUTPRwFnGED4FwPg/C
 ILWw==
X-Gm-Message-State: AOAM533JZPlpWwEASoHhScFdfmm59UVGoCfhJcT+7RvCweqwks5y7zMb
 MozvN5sM+4VC13nun/dKrY2IqSYPvsY=
X-Google-Smtp-Source: ABdhPJxT0FE6nsn2TrUHEzv2uJYg/JskkUyZag3J9dRd6iGlFuuQtyHP7i65E5WedmJPL17L+qJwtQ==
X-Received: by 2002:a1c:2b03:: with SMTP id r3mr11306852wmr.184.1605906569285; 
 Fri, 20 Nov 2020 13:09:29 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id 60sm6144403wrs.69.2020.11.20.13.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 13:09:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/26] target/mips: Extract Multi-Threading helper definitions
Date: Fri, 20 Nov 2020 22:08:26 +0100
Message-Id: <20201120210844.2625602-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120210844.2625602-1-f4bug@amsat.org>
References: <20201120210844.2625602-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'MIPS MT' is defined as a Module by MIPS. Extract the helper
definitions to 'mod-mips-mt_helper.h.inc'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/helper.h                 | 24 +------------------
 target/mips/mod-mips-mt_helper.h.inc | 36 ++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 23 deletions(-)
 create mode 100644 target/mips/mod-mips-mt_helper.h.inc

diff --git a/target/mips/helper.h b/target/mips/helper.h
index bce869f3718..c15caed9fca 100644
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
@@ -451,4 +429,4 @@ DEF_HELPER_3(cache, void, env, tl, i32)
 
 #include "mod-mips-dsp_helper.h.inc"
 #include "mod-mips-msa_helper.h.inc"
-
+#include "mod-mips-mt_helper.h.inc"
diff --git a/target/mips/mod-mips-mt_helper.h.inc b/target/mips/mod-mips-mt_helper.h.inc
new file mode 100644
index 00000000000..0db58e2a780
--- /dev/null
+++ b/target/mips/mod-mips-mt_helper.h.inc
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



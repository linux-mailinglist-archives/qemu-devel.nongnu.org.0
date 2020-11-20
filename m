Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2FF2BB83E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 22:21:59 +0100 (CET)
Received: from localhost ([::1]:38820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgDqw-0006yh-7H
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 16:21:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDfk-0004IT-8f
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:10:24 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:37324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDff-0004CB-S1
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:10:23 -0500
Received: by mail-wr1-x443.google.com with SMTP id b6so11729162wrt.4
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 13:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mGpWJo81sEg14F0La+W267Kh3e04560JtsIKJ6WctAs=;
 b=s9H+wkgh8r+Is1lPC9kHaVcMvST7hZOA/2SrnOXoq0dUyvjQ1/EcBA2a/03u8aWTAm
 2XnQmj7IUeMUfpMRXD48gKeuz1MxwKXTgfp//96qaA5LTD15tyg9RQjg9p7wR1U0FvCT
 WAt0GN0vkD0hXKNsNSsa57tWYdqqZe+/IJDqz9Fote9h2LxOLi5y/JTEz1aAUUonarW6
 2lO9FQvCN3ISnZwCHQBh7DX0nvi3pk2L6wXuPlTM0un7LcFPmlRI0Vp3QXjDy5aIfPd5
 Ogg7Uf509E1ZV8AnSQKKrOOaLnhromBsDMClJJLmtmLFeFU2QrjKQLlbYaSa1k8tNuQA
 vlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mGpWJo81sEg14F0La+W267Kh3e04560JtsIKJ6WctAs=;
 b=jtht1W8KN1eyku9GwqZIvvImrZLH9UMPW7lZb/a29qBgqjahwmk17C3T1Cs3kkSMYG
 EAVPkj0vcIzvhTdk10tqSo1hVjkCSygO+Le4ZzwnIVsRz5imTgHJN1WsTxPTB4tyL712
 GXzs+7h7ltkznJsoT2UOb77riAnksLS38BalmhHlWXQ5AG2YKyCR0c/mw6Op2LOP58FO
 hSUCYJh5jicE1PnSJpqOVDg8/xqjzmL2Igk6spIqzN1qXr5R5iZs8aBceQMUtthEDtnM
 VlLZlDugimBX8ZkW8s70VQ5ODRtvNgPsWYVCMUq9Jc3SvRyx7ax3iaBNHH/lSVtsSiyY
 3zEw==
X-Gm-Message-State: AOAM532C7djLR51sYGH3Wtf1lVkCS6VbEnpQMYjIz4J0dHCTLlmfiYon
 qnpiT94p99EWclwTKtjw4UmqbwqDmi8=
X-Google-Smtp-Source: ABdhPJyT83mp/scHb82XhBnzPZwIfyXE/LFPmg82pmZVsMxV4Arn5Gyur3DCBhGXFnarxHZXwmP97w==
X-Received: by 2002:adf:9144:: with SMTP id j62mr19053439wrj.419.1605906616303; 
 Fri, 20 Nov 2020 13:10:16 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id d3sm6542024wrg.16.2020.11.20.13.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 13:10:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/26] target/mips: Extract Loongson SIMD helper definitions
Date: Fri, 20 Nov 2020 22:08:35 +0100
Message-Id: <20201120210844.2625602-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120210844.2625602-1-f4bug@amsat.org>
References: <20201120210844.2625602-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

Extract the Loongson SIMD helper definitions to
'vendor-loong-simd_helper.h'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/helper.h                       | 60 +------------------
 target/mips/vendor-loong-simd_helper.h.inc | 69 ++++++++++++++++++++++
 2 files changed, 70 insertions(+), 59 deletions(-)
 create mode 100644 target/mips/vendor-loong-simd_helper.h.inc

diff --git a/target/mips/helper.h b/target/mips/helper.h
index 77d66018c8c..134dcaf0d59 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -343,65 +343,6 @@ DEF_HELPER_1(rdhwr_xnp, tl, env)
 DEF_HELPER_2(pmon, void, env, int)
 DEF_HELPER_1(wait, void, env)
 
-/* Loongson multimedia functions.  */
-DEF_HELPER_FLAGS_2(paddsh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(paddush, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(paddh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(paddw, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(paddsb, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(paddusb, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(paddb, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-
-DEF_HELPER_FLAGS_2(psubsh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(psubush, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(psubh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(psubw, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(psubsb, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(psubusb, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(psubb, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-
-DEF_HELPER_FLAGS_2(pshufh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(packsswh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(packsshb, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(packushb, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-
-DEF_HELPER_FLAGS_2(punpcklhw, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(punpckhhw, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(punpcklbh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(punpckhbh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(punpcklwd, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(punpckhwd, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-
-DEF_HELPER_FLAGS_2(pavgh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(pavgb, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(pmaxsh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(pminsh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(pmaxub, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(pminub, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-
-DEF_HELPER_FLAGS_2(pcmpeqw, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(pcmpgtw, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(pcmpeqh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(pcmpgth, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(pcmpeqb, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(pcmpgtb, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-
-DEF_HELPER_FLAGS_2(psllw, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(psllh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(psrlw, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(psrlh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(psraw, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(psrah, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-
-DEF_HELPER_FLAGS_2(pmullh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(pmulhh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(pmulhuh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_2(pmaddhw, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-
-DEF_HELPER_FLAGS_2(pasubub, TCG_CALL_NO_RWG_SE, i64, i64, i64)
-DEF_HELPER_FLAGS_1(biadd, TCG_CALL_NO_RWG_SE, i64, i64)
-DEF_HELPER_FLAGS_1(pmovmskb, TCG_CALL_NO_RWG_SE, i64, i64)
-
 DEF_HELPER_3(cache, void, env, tl, i32)
 
 #include "isa-micromips_helper.h.inc"
@@ -411,3 +352,4 @@ DEF_HELPER_3(cache, void, env, tl, i32)
 #include "mod-mips-mt_helper.h.inc"
 
 #include "vendor-vr54xx_helper.h.inc"
+#include "vendor-loong-simd_helper.h.inc"
diff --git a/target/mips/vendor-loong-simd_helper.h.inc b/target/mips/vendor-loong-simd_helper.h.inc
new file mode 100644
index 00000000000..30e5fda66e9
--- /dev/null
+++ b/target/mips/vendor-loong-simd_helper.h.inc
@@ -0,0 +1,69 @@
+/*
+ * Loongson SIMD instruction emulation helpers for QEMU.
+ *
+ *  Copyright (c) 2004-2005 Jocelyn Mayer
+ *  Copyright (c) 2006 Marius Groeger (FPU operations)
+ *  Copyright (c) 2006 Thiemo Seufer (MIPS32R2 support)
+ *  Copyright (c) 2009 CodeSourcery (MIPS16 and microMIPS support)
+ *  Copyright (c) 2011 Richard Henderson <rth@twiddle.net>
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+DEF_HELPER_FLAGS_2(paddsh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(paddush, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(paddh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(paddw, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(paddsb, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(paddusb, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(paddb, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+
+DEF_HELPER_FLAGS_2(psubsh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(psubush, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(psubh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(psubw, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(psubsb, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(psubusb, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(psubb, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+
+DEF_HELPER_FLAGS_2(pshufh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(packsswh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(packsshb, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(packushb, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+
+DEF_HELPER_FLAGS_2(punpcklhw, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(punpckhhw, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(punpcklbh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(punpckhbh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(punpcklwd, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(punpckhwd, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+
+DEF_HELPER_FLAGS_2(pavgh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(pavgb, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(pmaxsh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(pminsh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(pmaxub, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(pminub, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+
+DEF_HELPER_FLAGS_2(pcmpeqw, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(pcmpgtw, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(pcmpeqh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(pcmpgth, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(pcmpeqb, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(pcmpgtb, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+
+DEF_HELPER_FLAGS_2(psllw, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(psllh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(psrlw, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(psrlh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(psraw, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(psrah, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+
+DEF_HELPER_FLAGS_2(pmullh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(pmulhh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(pmulhuh, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(pmaddhw, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+
+DEF_HELPER_FLAGS_2(pasubub, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_1(biadd, TCG_CALL_NO_RWG_SE, i64, i64)
+DEF_HELPER_FLAGS_1(pmovmskb, TCG_CALL_NO_RWG_SE, i64, i64)
-- 
2.26.2



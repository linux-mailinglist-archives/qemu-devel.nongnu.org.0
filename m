Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 994E13F758F
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:06:40 +0200 (CEST)
Received: from localhost ([::1]:47158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIsby-0004wH-L9
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsYQ-0006tA-7D
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:02:54 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsYK-0002NU-G5
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:02:53 -0400
Received: by mail-wr1-x42d.google.com with SMTP id h4so6156773wro.7
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 06:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/eMBnlVY7aRA5TQWaHvUi3TTkCtDi3J83ziaggVBpSU=;
 b=vdOcuZzjufp4mMzMGdAqGk1fi/xeypirVj96tGt/cYfvcXiGRrJVowJDSjzEpKBT1s
 ZetPQV+Ijd06wLX/WrZTO+rQKeAQtnEVyCxjr/TOMhzyc1dLzHhXYPxyCWWmDND96eMA
 BpQyzaUxm8MmvF1cUQnFOUX/wpvPzlgVnZGMvwEPtEVGF24/hqwgAC4mdewgePtirIB0
 XpAYdXjkCUgnJU/4xkZp9ZGbUV+sIBAAffhslufOJ7gR+bJhPiaSQmMH109IH+z+Xsgf
 1dnPdnUfDQBjE79hcIZ8xH1kuakBHL2M8U5tUKtly29HOYPSMyLWI10XIVsJ9xngb2tF
 nUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/eMBnlVY7aRA5TQWaHvUi3TTkCtDi3J83ziaggVBpSU=;
 b=oEuRyPSuBzBFGlb34CvqZlU8kvW0GGdvkThAlzk9KZbpwb3RjCTgdTdB8oeX9CzIYU
 W9cFJWVjt8PFwD8+E9xsam6wqJ138W4+ngD/jpIF8HRZOaGH3UDIgxTPvr5VbXc61iEH
 XX7Tkr2ln4Qc7dPT26ZBWe5+xp2XVeazToBUpfmaaxp/ELWqgtuyVEa9RqcninF6y7pS
 Ck4Qs3Sgjd15RsyJHBznDiAp9xDny36lpzLKDQaPINV8HJePsfvji0XpW3psnPgcvUbG
 v3UuoJnfwTunlhpQEP1gxSu7yk13dTQ31uNcSUhikdqrqvLXo5qNOdHhPq8CX3ZuDAh5
 +Vuw==
X-Gm-Message-State: AOAM532jQvJvJ8Kx0o8Zcjav8ZC2cmVdxIE1+652MarWcWOAVtfQqraW
 688yHuvA4Orm34b1Awt8OMmldsbBVJQ=
X-Google-Smtp-Source: ABdhPJyCxtRB8IXSCcw+I6KtXsxo7wEr5yaT54NJaBSNHvECNNrZZQS1PzllpIt73oMMtEGUyE5quA==
X-Received: by 2002:adf:e645:: with SMTP id b5mr24823448wrn.34.1629896566934; 
 Wed, 25 Aug 2021 06:02:46 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 k1sm22016945wrz.61.2021.08.25.06.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:02:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/28] target/mips: Extract NEC Vr54xx helper definitions
Date: Wed, 25 Aug 2021 15:01:50 +0200
Message-Id: <20210825130211.1542338-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825130211.1542338-1-f4bug@amsat.org>
References: <20210825130211.1542338-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the NEC Vr54xx helper definitions to
'vendor-vr54xx_helper.h'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201120210844.2625602-15-f4bug@amsat.org>
---
 target/mips/helper.h                | 18 +++---------------
 target/mips/tcg/vr54xx_helper.h.inc | 24 ++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 15 deletions(-)
 create mode 100644 target/mips/tcg/vr54xx_helper.h.inc

diff --git a/target/mips/helper.h b/target/mips/helper.h
index a9c6c7d1a31..de32d82e980 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -16,21 +16,6 @@ DEF_HELPER_3(lld, tl, env, tl, int)
 #endif
 #endif
 
-DEF_HELPER_3(muls, tl, env, tl, tl)
-DEF_HELPER_3(mulsu, tl, env, tl, tl)
-DEF_HELPER_3(macc, tl, env, tl, tl)
-DEF_HELPER_3(maccu, tl, env, tl, tl)
-DEF_HELPER_3(msac, tl, env, tl, tl)
-DEF_HELPER_3(msacu, tl, env, tl, tl)
-DEF_HELPER_3(mulhi, tl, env, tl, tl)
-DEF_HELPER_3(mulhiu, tl, env, tl, tl)
-DEF_HELPER_3(mulshi, tl, env, tl, tl)
-DEF_HELPER_3(mulshiu, tl, env, tl, tl)
-DEF_HELPER_3(macchi, tl, env, tl, tl)
-DEF_HELPER_3(macchiu, tl, env, tl, tl)
-DEF_HELPER_3(msachi, tl, env, tl, tl)
-DEF_HELPER_3(msachiu, tl, env, tl, tl)
-
 DEF_HELPER_FLAGS_1(bitswap, TCG_CALL_NO_RWG_SE, tl, tl)
 #ifdef TARGET_MIPS64
 DEF_HELPER_FLAGS_1(dbitswap, TCG_CALL_NO_RWG_SE, tl, tl)
@@ -609,3 +594,6 @@ DEF_HELPER_FLAGS_2(rddsp, 0, tl, tl, env)
 #endif /* !CONFIG_USER_ONLY */
 
 #include "tcg/msa_helper.h.inc"
+
+/* Vendor extensions */
+#include "tcg/vr54xx_helper.h.inc"
diff --git a/target/mips/tcg/vr54xx_helper.h.inc b/target/mips/tcg/vr54xx_helper.h.inc
new file mode 100644
index 00000000000..50b1f5b818d
--- /dev/null
+++ b/target/mips/tcg/vr54xx_helper.h.inc
@@ -0,0 +1,24 @@
+/*
+ * MIPS NEC Vr54xx instruction emulation helpers for QEMU.
+ *
+ *  Copyright (c) 2004-2005 Jocelyn Mayer
+ *  Copyright (c) 2006 Marius Groeger (FPU operations)
+ *  Copyright (c) 2006 Thiemo Seufer (MIPS32R2 support)
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+DEF_HELPER_3(muls, tl, env, tl, tl)
+DEF_HELPER_3(mulsu, tl, env, tl, tl)
+DEF_HELPER_3(macc, tl, env, tl, tl)
+DEF_HELPER_3(maccu, tl, env, tl, tl)
+DEF_HELPER_3(msac, tl, env, tl, tl)
+DEF_HELPER_3(msacu, tl, env, tl, tl)
+DEF_HELPER_3(mulhi, tl, env, tl, tl)
+DEF_HELPER_3(mulhiu, tl, env, tl, tl)
+DEF_HELPER_3(mulshi, tl, env, tl, tl)
+DEF_HELPER_3(mulshiu, tl, env, tl, tl)
+DEF_HELPER_3(macchi, tl, env, tl, tl)
+DEF_HELPER_3(macchiu, tl, env, tl, tl)
+DEF_HELPER_3(msachi, tl, env, tl, tl)
+DEF_HELPER_3(msachiu, tl, env, tl, tl)
-- 
2.31.1



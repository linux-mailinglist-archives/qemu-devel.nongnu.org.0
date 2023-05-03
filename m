Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E328E6F5187
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:30:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6tk-00057h-1l; Wed, 03 May 2023 03:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tc-0004uD-NV
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:28 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ta-0005iG-E8
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:28 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f1e2555b5aso31819335e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098845; x=1685690845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jIBJg2lmoN4SFecYrI5sb6VaAgGxZyVvAyGpaJ4I0ws=;
 b=MI2QrCHBaJr2rSGvyWcrKwtLmgSpURhGnEIeBB0yQ7TwBQZH85trUJYf6Z56Vv/U5c
 hMV2DK0KJ4ldk2YBsmpf/ode3EvDMt1JpOY9A4QqdGDqcPklhPGeGN/+gOOgPa01eiIB
 VNLL6/s/TxaI6IK0MbXkhKXusvJLkZv+P8YQZUStAL2LBcusrYbHRPG/IrsusySRH03E
 RL8VcBi6IfoRfhi1THxD0qR4mpbvsQG75q39LNas88S9KZd8Dal5jHoCqg8zgYywVGAB
 ABqaKvt9u2J+6h6CSZsphVfxF8/HdhtFiiA5YZ+0of2mB4ExT8xAhaDaa7GLSt+YGuX1
 GNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098845; x=1685690845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jIBJg2lmoN4SFecYrI5sb6VaAgGxZyVvAyGpaJ4I0ws=;
 b=X5Atj1oa59qhxOwjRXjjKgLxIJw9ETRIaR+LGS45HWQIxKl/CVnfARtzL/o8z6kxCt
 mdB0jivH06poMVZKwDs6fJPj1e1ufEdyBOem2gJtiSdYyA+xmGAX/TwmAIszZCcsDZj1
 z/5eiu4MVmGoACYwf8GKP6TKF/G4C5otEXVNEpcQrla9ypr5biIQTTN3F/qccc1bbAQn
 3CtxWr3dGVWVjNnm1gXw86fliu8kWoRVAF9+nEjVBdaqTVLV8gXWwquoYz2fon8pcmXm
 aIxr68XViqz8Lxy/YoN2JELTWrIxhQ/TF/ijU32ri5gOTI3Ds7beZkhULNxWJApY4IPw
 MZUQ==
X-Gm-Message-State: AC+VfDzKubhWt+gYspyQ9hqxcnNvFp4/fjSSJIu3gs+YUdpTphqNPMVc
 efJjahE9XBnJIuc4WsO4jnQI/lz5GVnMBWNIXvZDVg==
X-Google-Smtp-Source: ACHHUZ7UEy2gy/IA0KsGLH1Rxc6RTZPU8ZQgJ8wRgVbcsWBhqE2Js26Ncu6gaT8f7ZJgQbp3/tiMYQ==
X-Received: by 2002:a05:600c:220d:b0:3f1:9526:22be with SMTP id
 z13-20020a05600c220d00b003f1952622bemr14185100wml.23.1683098845014; 
 Wed, 03 May 2023 00:27:25 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 69/84] target/mips: Tidy helpers for translation
Date: Wed,  3 May 2023 08:23:16 +0100
Message-Id: <20230503072331.1747057-70-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
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

Move most includes from *translate*.c to translate.h, ensuring
that we get the ordering correct.  Ensure cpu.h is first.
Use disas/disas.h instead of exec/log.h.
Drop otherwise unused includes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.h            |  6 ++++--
 target/mips/tcg/msa_translate.c        |  3 ---
 target/mips/tcg/mxu_translate.c        |  2 --
 target/mips/tcg/octeon_translate.c     |  4 +---
 target/mips/tcg/rel6_translate.c       |  2 --
 target/mips/tcg/translate.c            | 18 ++++++------------
 target/mips/tcg/translate_addr_const.c |  1 -
 target/mips/tcg/tx79_translate.c       |  4 +---
 target/mips/tcg/vr54xx_translate.c     |  3 ---
 9 files changed, 12 insertions(+), 31 deletions(-)

diff --git a/target/mips/tcg/translate.h b/target/mips/tcg/translate.h
index fa8bf55209..3b0498a47a 100644
--- a/target/mips/tcg/translate.h
+++ b/target/mips/tcg/translate.h
@@ -8,9 +8,11 @@
 #ifndef TARGET_MIPS_TRANSLATE_H
 #define TARGET_MIPS_TRANSLATE_H
 
-#include "qemu/log.h"
-#include "exec/translator.h"
+#include "cpu.h"
 #include "tcg/tcg-op.h"
+#include "exec/translator.h"
+#include "exec/helper-gen.h"
+#include "qemu/log.h"
 
 #define MIPS_DEBUG_DISAS 0
 
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 220cd3b048..b5b66fb38a 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -11,11 +11,8 @@
  * SPDX-License-Identifier: LGPL-2.1-or-later
  */
 #include "qemu/osdep.h"
-#include "tcg/tcg-op.h"
-#include "exec/helper-gen.h"
 #include "translate.h"
 #include "fpu_helper.h"
-#include "internal.h"
 
 static int elm_n(DisasContext *ctx, int x);
 static int elm_df(DisasContext *ctx, int x);
diff --git a/target/mips/tcg/mxu_translate.c b/target/mips/tcg/mxu_translate.c
index be038b5f07..39348b3a91 100644
--- a/target/mips/tcg/mxu_translate.c
+++ b/target/mips/tcg/mxu_translate.c
@@ -16,8 +16,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "tcg/tcg-op.h"
-#include "exec/helper-gen.h"
 #include "translate.h"
 
 /*
diff --git a/target/mips/tcg/octeon_translate.c b/target/mips/tcg/octeon_translate.c
index 103c304d10..e25c4cbaa0 100644
--- a/target/mips/tcg/octeon_translate.c
+++ b/target/mips/tcg/octeon_translate.c
@@ -7,10 +7,8 @@
  */
 
 #include "qemu/osdep.h"
-#include "tcg/tcg-op.h"
-#include "tcg/tcg-op-gvec.h"
-#include "exec/helper-gen.h"
 #include "translate.h"
+#include "tcg/tcg-op-gvec.h"
 
 /* Include the auto-generated decoder.  */
 #include "decode-octeon.c.inc"
diff --git a/target/mips/tcg/rel6_translate.c b/target/mips/tcg/rel6_translate.c
index d631851258..59f237ba3b 100644
--- a/target/mips/tcg/rel6_translate.c
+++ b/target/mips/tcg/rel6_translate.c
@@ -9,8 +9,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "tcg/tcg-op.h"
-#include "exec/helper-gen.h"
 #include "translate.h"
 
 /* Include the auto-generated decoders.  */
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 312ed66989..f3da05ba3b 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -23,19 +23,13 @@
  */
 
 #include "qemu/osdep.h"
-#include "cpu.h"
-#include "internal.h"
-#include "tcg/tcg-op.h"
-#include "exec/translator.h"
-#include "exec/helper-proto.h"
-#include "exec/helper-gen.h"
-#include "semihosting/semihost.h"
-
-#include "trace.h"
-#include "exec/log.h"
-#include "qemu/qemu-print.h"
-#include "fpu_helper.h"
 #include "translate.h"
+#include "internal.h"
+#include "exec/helper-proto.h"
+#include "semihosting/semihost.h"
+#include "trace.h"
+#include "disas/disas.h"
+#include "fpu_helper.h"
 
 #define HELPER_H "helper.h"
 #include "exec/helper-info.c.inc"
diff --git a/target/mips/tcg/translate_addr_const.c b/target/mips/tcg/translate_addr_const.c
index a510da406c..6f4b39f715 100644
--- a/target/mips/tcg/translate_addr_const.c
+++ b/target/mips/tcg/translate_addr_const.c
@@ -11,7 +11,6 @@
  * SPDX-License-Identifier: LGPL-2.1-or-later
  */
 #include "qemu/osdep.h"
-#include "tcg/tcg-op.h"
 #include "translate.h"
 
 bool gen_lsa(DisasContext *ctx, int rd, int rt, int rs, int sa)
diff --git a/target/mips/tcg/tx79_translate.c b/target/mips/tcg/tx79_translate.c
index 3a45a1bfea..dd6fb8a7bd 100644
--- a/target/mips/tcg/tx79_translate.c
+++ b/target/mips/tcg/tx79_translate.c
@@ -8,10 +8,8 @@
  */
 
 #include "qemu/osdep.h"
-#include "tcg/tcg-op.h"
-#include "tcg/tcg-op-gvec.h"
-#include "exec/helper-gen.h"
 #include "translate.h"
+#include "tcg/tcg-op-gvec.h"
 
 /* Include the auto-generated decoder.  */
 #include "decode-tx79.c.inc"
diff --git a/target/mips/tcg/vr54xx_translate.c b/target/mips/tcg/vr54xx_translate.c
index 804672f84c..2c1f6cc527 100644
--- a/target/mips/tcg/vr54xx_translate.c
+++ b/target/mips/tcg/vr54xx_translate.c
@@ -10,10 +10,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "tcg/tcg-op.h"
-#include "exec/helper-gen.h"
 #include "translate.h"
-#include "internal.h"
 
 /* Include the auto-generated decoder. */
 #include "decode-vr54xx.c.inc"
-- 
2.34.1



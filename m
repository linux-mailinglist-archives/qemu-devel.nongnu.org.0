Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C642C6F5181
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:30:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6tk-00057q-35; Wed, 03 May 2023 03:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ta-0004oe-5p
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:26 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tY-0005dV-BS
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:25 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f19a7f9424so47079195e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098843; x=1685690843;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v5+X8dtE6LfSMMjI2gnNlBbQTFJOMR9qw0ZxeW19zPE=;
 b=ulZFmgQTz+oOEN8+2pojoEhY3Igp5uRNhXdHiYKsxF3C4e7EEGvjFWBCoCNAoqv/3B
 Le7yfL+03cosZAeZvzehLRTCIbeqbidpTY1QWjBAcyqU+drysU/yENFxJDG7bzxLTE3v
 duwp/1cQ5nh7eZPvu7o/DMagBV8jR0jGlugM0R5SSBa+3SmvE1p9f2EM/DQNVl3BX4dQ
 4tuWV4lm40ZKMrQ8D7CxAO61xLhI/+LpMkvXxC9NFzsz5JEDalOYSWfwuNDMh4YiemnH
 mUnLVqrdpdRSTqEbg5oiTxa4lbK75QkOQuSVEHuiVcOiK/9NA9DbLpezseEVNuYU7Qf+
 ZeWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098843; x=1685690843;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v5+X8dtE6LfSMMjI2gnNlBbQTFJOMR9qw0ZxeW19zPE=;
 b=W4Hf5Mj8PJ/fvSo57jE/5C4w/hF63qIgcXdwNmY/JHhnLA9WSVnvPr6MMcV0NmdZHc
 BmeZIS3gPKcW0UEgOjDE9H4KxTfw1PPmEXjKyD1hwb6QOTbZQz30OSoG2ol/FPWhdg53
 a92rtF61M4KSIkZrgRDrAxo4SmOsC6gRzTIsEjFMJykO4WIZOpkreGdhUTMo43L51Hg3
 Ik/dKZpUR1TLJ7qoBTbk4q38yhH8b+Lqp2rZ1n5K6c4MqW9Sg8eCREcnD82r//H3e5XJ
 T5w8wq4/kAKg6u5V8NzJRbB+e2vJMie43XQrfIByrr7dCLvjj+kaS6JzxQWVd+oIEb66
 6LoA==
X-Gm-Message-State: AC+VfDyCG3/vr9YlopQBcYuyumW0FHyDSk1jGkNUSeiLY8R+V++JSdLY
 8bg56hAeA0SFB8DVWoGIZYaZFljeMO5Hi5muHLpmWA==
X-Google-Smtp-Source: ACHHUZ6j604Z3gwCAD1univIaTFiQsoI3o5N4V2VPv3HYvDacXdeCDDKvJA8Y7av/HSVuV4cZYUp1g==
X-Received: by 2002:a1c:7211:0:b0:3f1:728a:1881 with SMTP id
 n17-20020a1c7211000000b003f1728a1881mr14264143wmc.31.1683098843509; 
 Wed, 03 May 2023 00:27:23 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 67/84] accel/tcg: Move translator_fake_ldb out of line
Date: Wed,  3 May 2023 08:23:14 +0100
Message-Id: <20230503072331.1747057-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
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

This is used by exactly one host in extraordinary circumstances.
This means that translator.h need not include plugin-gen.h;
translator.c already includes plugin-gen.h.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/translator.h | 8 +-------
 accel/tcg/translator.c    | 5 +++++
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/include/exec/translator.h b/include/exec/translator.h
index c1a1203789..228002a623 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -22,7 +22,6 @@
 #include "qemu/bswap.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
-#include "exec/plugin-gen.h"
 #include "exec/translate-all.h"
 #include "tcg/tcg.h"
 
@@ -229,12 +228,7 @@ translator_ldq_swap(CPUArchState *env, DisasContextBase *db,
  * re-synthesised for s390x "ex"). It ensures we update other areas of
  * the translator with details of the executed instruction.
  */
-
-static inline void translator_fake_ldb(uint8_t insn8, abi_ptr pc)
-{
-    plugin_insn_append(pc, &insn8, sizeof(insn8));
-}
-
+void translator_fake_ldb(uint8_t insn8, abi_ptr pc);
 
 /*
  * Return whether addr is on the same page as where disassembly started.
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 7a130e706e..60a613c99d 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -345,3 +345,8 @@ uint64_t translator_ldq(CPUArchState *env, DisasContextBase *db, abi_ptr pc)
     plugin_insn_append(pc, &plug, sizeof(ret));
     return ret;
 }
+
+void translator_fake_ldb(uint8_t insn8, abi_ptr pc)
+{
+    plugin_insn_append(pc, &insn8, sizeof(insn8));
+}
-- 
2.34.1



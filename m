Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2076F51FB
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:41:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6ta-0004jg-4G; Wed, 03 May 2023 03:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tO-0004AE-DR
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:14 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tJ-0005cC-BU
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:14 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f193ca059bso29170395e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098828; x=1685690828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bcj/euyGiGp4/2yiosYxnHgrpcergKi9oXLbGDIpzQ4=;
 b=n2NcLii26IVbBqiZ1mFtpCb9eZtpvOBqRMYqCwDNcvDp+LmUrThpl6BaeB4WR1iEPY
 uy1V2khkEdYKfB1s43XR9QxsnpUnoFJTT5hXPO3TSSFcLh60+fIRyC97XveeES4ycdFS
 HpHcDPcZwkg3x7unvYrTqSqRq3Rwv+e5I38H0Lpm7QZ3KyfE/DJn91ov1Ruk4SEqmokA
 DudcXqrxEosWKTMver3G6cQCnXFfkp079GCTSvCa3GDJcy4KmZY3msjV8x9NBDfTSylN
 NliB2Vth3jyM2JtQ2xL4r0WfC1E40QJJYstuhCfRxfSx2A+AnEf7S+RBc0wJL0N7Up0x
 aSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098828; x=1685690828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bcj/euyGiGp4/2yiosYxnHgrpcergKi9oXLbGDIpzQ4=;
 b=aP4knIWlx0Q89R4YhS23Hjm6J30oKASC0T7UBMozDnN0THFLM3Z4bAq78W7STMQAYR
 mRhQh6LDTYCp0+NXBzXsf3zjwnt9O34KhIzOT3dvxqCzud389hBA4Er8KfFGqrjIKOCd
 g+Z4eR0wDvLkmydj5rPmEjvo+ZRTmzAvYhWWqsHI7sibh5NcJw6dhiLYcjnAi+5pwyx0
 wGjQeB+ZRV5DbsmqnXMcae/FEPC1RszGQ4cXwgM1Y6NMbOLzPxFDI03HxaZ0sVdmkyAF
 7LF9IEj2oJLMZ/fkNHwSWa8exiIjab4yKxBFg4EiX4OM6li1UZSQ8KYaJ7rYxVDE8Rnu
 1ikg==
X-Gm-Message-State: AC+VfDxZ8ke0yBQiRL0V6L8hPExrVsgw+gUG3OXv1PMtLIBNQSqRX3XE
 OGARjEfvxy3KINkn1gM+V+xUc/YNGpoVip6easiKYw==
X-Google-Smtp-Source: ACHHUZ6A/VnqTd/6KnE8UaWL7s1QOkvKjIWsYOHT1S0hEppguzY/EgOPbHXYs3goAt+SX8gwg5LzMA==
X-Received: by 2002:a1c:f617:0:b0:3f1:6f52:74d with SMTP id
 w23-20020a1cf617000000b003f16f52074dmr14446671wmc.39.1683098827801; 
 Wed, 03 May 2023 00:27:07 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 46/84] target/hexagon: Include helper-gen.h where needed
Date: Wed,  3 May 2023 08:22:53 +0100
Message-Id: <20230503072331.1747057-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

This had been included via tcg-op-common.h via tcg-op.h,
but that is going away.  In idef-parser.y, shuffle some
tcg related includes into a more logical order.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/genptr.c                  | 1 +
 target/hexagon/translate.c               | 1 +
 target/hexagon/idef-parser/idef-parser.y | 3 ++-
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index 244063b1d2..b44669cc37 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -20,6 +20,7 @@
 #include "internal.h"
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-op-gvec.h"
+#include "exec/helper-gen.h"
 #include "insn.h"
 #include "opcodes.h"
 #include "translate.h"
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index cddd7c5db4..521e7c82dd 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -20,6 +20,7 @@
 #include "cpu.h"
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-op-gvec.h"
+#include "exec/helper-gen.h"
 #include "exec/cpu_ldst.h"
 #include "exec/log.h"
 #include "internal.h"
diff --git a/target/hexagon/idef-parser/idef-parser.y b/target/hexagon/idef-parser/idef-parser.y
index 5444fd4749..2cd7f3089c 100644
--- a/target/hexagon/idef-parser/idef-parser.y
+++ b/target/hexagon/idef-parser/idef-parser.y
@@ -845,13 +845,14 @@ int main(int argc, char **argv)
     fputs("#include \"qemu/log.h\"\n", output_file);
     fputs("#include \"cpu.h\"\n", output_file);
     fputs("#include \"internal.h\"\n", output_file);
+    fputs("#include \"tcg/tcg.h\"\n", output_file);
     fputs("#include \"tcg/tcg-op.h\"\n", output_file);
+    fputs("#include \"exec/helper-gen.h\"\n", output_file);
     fputs("#include \"insn.h\"\n", output_file);
     fputs("#include \"opcodes.h\"\n", output_file);
     fputs("#include \"translate.h\"\n", output_file);
     fputs("#define QEMU_GENERATE\n", output_file);
     fputs("#include \"genptr.h\"\n", output_file);
-    fputs("#include \"tcg/tcg.h\"\n", output_file);
     fputs("#include \"macros.h\"\n", output_file);
     fprintf(output_file, "#include \"%s\"\n", argv[ARG_INDEX_EMITTER_H]);
 
-- 
2.34.1



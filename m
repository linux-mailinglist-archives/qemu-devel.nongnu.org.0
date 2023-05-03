Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA20B6F520E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:43:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6x6-0000QR-Id; Wed, 03 May 2023 03:31:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6wi-0007lH-Lt
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:30:45 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6we-00071y-D2
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:30:39 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f178da21b5so31003745e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683099035; x=1685691035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eCVemSFgAo7tVkLV/FNbfI0DKmiBw4oAjQq+qI19gpU=;
 b=uTazvgvKbXfRygFd63kbXV0Qqcxg1bE/N8Pb6mbILlfIGJ50CEnSWHxUM1tTFwXVrI
 mzZI16rlkB4KztSVT5LwGD7a1oVhqKOhXjAV1DktA6V76WDylHgK00WneTMnb59hIsHy
 WfbzO4lCp3R8zt+p/lq8LKCLZ9kjZipDfYanlIciMQHtpeNDC2Ziv6McvOE54l9d7Twn
 CrOf1wqAfQ+yNJvKSpENRNj661x3K8oVTwimuyDvYx6Qase7BNP0qH3ZNf02+siLmvQa
 KdXq/9LUbbAxmGsuvSCU13U2YC70Kbun3Lb0tZSPcSh4A0EKw6xaHtuId4WIokwALu7v
 sjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683099035; x=1685691035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eCVemSFgAo7tVkLV/FNbfI0DKmiBw4oAjQq+qI19gpU=;
 b=Ws4UXOAlRKCS5vsXx7vs/F5l1Z3VLhFWLnl4skSAr2rvY+Ns2YurpN8+963JeYQuq0
 mdEcbWR0zAGn8HECqFaOUtCyIyXYVSDrOaw2817I+jgyVbih1XxRmfqhLgbjGFU8YP5J
 2u/H+QcNB040bJOc+z4S5vklNVzNtNuSq9/jEEsoD0km/VS/Xlda9UkLvNh7gpLmLc1d
 5z9di03EquO35NJgYMXhc+APKeS2Fe12h2dhnjfqFzMSJnniJHdDx7ork6UxNWtg6LAh
 bK3lUqCWrPuTKvtSJ2DL6TSr9zVbfUQK9nlMLGpS7Z4TSgfVjg2dTKySgbgjyN2G2dH7
 V2HA==
X-Gm-Message-State: AC+VfDwxCc4BKWL+HPPiNeIqoDRN8XB5z7rZdC4hMEX0coPFrSAvFqG1
 HxZm+GbxDFXXakxr8N/NEVqR8c3JaTUwb/MjKtGVtg==
X-Google-Smtp-Source: ACHHUZ5D2WElrtqxsF0Yf4Bd0dXK8rBAJXnd10o72C7tdlLN2drL7o5VqfY2gNMz/eleXySM1NKNAA==
X-Received: by 2002:a5d:6642:0:b0:306:44ea:4fba with SMTP id
 f2-20020a5d6642000000b0030644ea4fbamr386185wrw.31.1683099034988; 
 Wed, 03 May 2023 00:30:34 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a1cc918000000b003f0ad8d1c69sm982896wmb.25.2023.05.03.00.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:30:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 82/84] disas: Remove target-specific headers
Date: Wed,  3 May 2023 08:23:29 +0100
Message-Id: <20230503072331.1747057-83-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/disas/disas.h | 6 ------
 disas/disas.c         | 3 ++-
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/include/disas/disas.h b/include/disas/disas.h
index 6c394e0b09..176775eff7 100644
--- a/include/disas/disas.h
+++ b/include/disas/disas.h
@@ -1,11 +1,6 @@
 #ifndef QEMU_DISAS_H
 #define QEMU_DISAS_H
 
-#include "exec/hwaddr.h"
-
-#ifdef NEED_CPU_H
-#include "cpu.h"
-
 /* Disassemble this for me please... (debugging). */
 void disas(FILE *out, const void *code, size_t size);
 void target_disas(FILE *out, CPUState *cpu, uint64_t code, size_t size);
@@ -17,7 +12,6 @@ char *plugin_disas(CPUState *cpu, uint64_t addr, size_t size);
 
 /* Look up symbol for debugging purpose.  Returns "" if unknown. */
 const char *lookup_symbol(uint64_t orig_addr);
-#endif
 
 struct syminfo;
 struct elf32_sym;
diff --git a/disas/disas.c b/disas/disas.c
index f5e95043cf..a709831e8d 100644
--- a/disas/disas.c
+++ b/disas/disas.c
@@ -3,9 +3,10 @@
 #include "disas/dis-asm.h"
 #include "elf.h"
 #include "qemu/qemu-print.h"
-
 #include "disas/disas.h"
 #include "disas/capstone.h"
+#include "hw/core/cpu.h"
+#include "exec/memory.h"
 
 typedef struct CPUDebug {
     struct disassemble_info info;
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D8E6F512F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:22:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6bo-0004nl-BD; Wed, 03 May 2023 03:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6am-0008FD-Pe
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:08:02 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aE-0005qN-Sw
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:08:00 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f1728c2a57so47627065e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097645; x=1685689645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g0XhypHJuKT2RLCHGyOOS8cpna/MQwPu76GFexENMHE=;
 b=CO0Sw3ltI+LRP4jx8Sqcg7I/yQ9ZmMrVpTIL7MErWesdzwUdYs8CFLkEwMpecXxhgL
 hW6J1wQrEAHyIDwYHd+UMWEqR691ODuMDVugiZTf3v1mz+tU3k46xGq/xsswx8XOTK4s
 F869utksGgjQDdnKRb8HTgml/Dgj+RJnBhcuujUBc7ioIIdeIbm3vsoEapBuWZbnGCu4
 n2C/ln00C+GetzoLzEYzS6FtNT3Q+wgZq3QaLlnBawcL8sTM0XqM7tYcJTlLa/y92ppU
 2Jn8k1tpbmMZeDrJENpog13oTS0wNLcfgaPVRaIBWZohvuD30aw3O8Dg6knSNbsR0taZ
 d7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097645; x=1685689645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g0XhypHJuKT2RLCHGyOOS8cpna/MQwPu76GFexENMHE=;
 b=ZYQUtMm7ax8u2m/WnLT63cgSr2DNtooeig4Vlalb4yLGx8MSSeyg/VGhmoUSsy61C7
 r+ageIoIL+YalaVfwGxUvGym7YQgdFLsUTs0nxSfMhYShuD0GZtLlTOOvZnf5w7g463N
 LHmKKt5MfI7TC3GSOw17fOBr1Yr5hoUEBigX1KagKaciO9Gti0bcRK98ovkwsahsjvro
 pIa2bfcMazKMzyPBTQUSGnE+K21MSRFwEGbsclR/1flfdSjCmU6xnj7gYOTn6VHdbWBK
 cdV47fevNBNHJYdksVQNzyAGpJIkGEiYy9r6ZyEKt+fQhjBYZEZfT4TdhXh8SZ6SkZqh
 rQFw==
X-Gm-Message-State: AC+VfDx87GiO/gusAypeLVo577l03Ux2c7ZCzdxfpb02MDxYrQnk6Qp3
 0rLUhJNeGVvF9x2xsfyaAFRDsVMpupySY4kQBZX13A==
X-Google-Smtp-Source: ACHHUZ5Lh1F4spRWM+Vw5pW9C5t8cVmXQnKsWIk8QzMK7h+Y2I06CIxR0FpD5H6xA/RiAtJT9k8uZA==
X-Received: by 2002:a1c:7502:0:b0:3ee:36f:3485 with SMTP id
 o2-20020a1c7502000000b003ee036f3485mr14848011wmc.8.1683097644870; 
 Wed, 03 May 2023 00:07:24 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 36/57] tcg/loongarch64: Assert the host supports unaligned
 accesses
Date: Wed,  3 May 2023 08:06:35 +0100
Message-Id: <20230503070656.1746170-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This should be true of all server class loongarch64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index e651ec5c71..ccc13ffdb4 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -30,6 +30,7 @@
  */
 
 #include "../tcg-ldst.c.inc"
+#include <asm/hwcap.h>
 
 #ifdef CONFIG_DEBUG_TCG
 static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
@@ -1674,6 +1675,11 @@ static void tcg_target_qemu_prologue(TCGContext *s)
 
 static void tcg_target_init(TCGContext *s)
 {
+    unsigned long hwcap = qemu_getauxval(AT_HWCAP);
+
+    /* All server class loongarch have UAL; only embedded do not. */
+    assert(hwcap & HWCAP_LOONGARCH_UAL);
+
     tcg_target_available_regs[TCG_TYPE_I32] = ALL_GENERAL_REGS;
     tcg_target_available_regs[TCG_TYPE_I64] = ALL_GENERAL_REGS;
 
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C2F564678
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:40:52 +0200 (CEST)
Received: from localhost ([::1]:45020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7w5z-0007Jj-Gz
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7vSG-0004uc-6X
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:59:48 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:51076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7vSE-0004BH-Ob
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:59:47 -0400
Received: by mail-pj1-x102a.google.com with SMTP id go6so6662513pjb.0
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KtmNbu9yExeJxvfDUNJQ5c1VHDhvr7IbviTyJY19R0g=;
 b=GdnBGArj2cGdcl4t5v62Ds5t+DfkYD1SbHtHrlog4Fzk4v/F0ugRwxwUnuSW4EHY5O
 1VFALVbUXK1UIM8dtj2ru99FSuDGnSov31SnBhfNEQAQ+xwTAgM2RBmtbJwOmXbY4rjN
 eA/TFm7HVX43JW4KI+83MLGYJR/X02lLYfwnjaVfaNUM+9Vjv+0IWGU9ZxBoxMao6X15
 EF8MqMUIqumZzyfxRUzC3fI5KB9smEx/lwzbw2RRZdVUBGPfd9fUyYZ7ij2nmSCRwysU
 ZYw/AARz5QpF366AMib03s+LhYUpZShouCdWzPrmaQI+e9jOVDGpDIyPPZmT9q89U6tz
 b1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KtmNbu9yExeJxvfDUNJQ5c1VHDhvr7IbviTyJY19R0g=;
 b=hZLewKQA7RcPvuhA3FP99QyRZp75EMhbJt8zo/XViiSR95Qy6r5ZlIZq368rC+4r4c
 iO964FX7qGeNPJmUQ7hvbW0mznjKTsK4CEY/PDk0K78X9lWuL8xK7xM8NxxdG58d9MtD
 5x8MmWQDTbnL9SDjLacWgXiDCn93moKyltK81mg46NfTe2jN+PLbkcgwfqx3AwTg40ps
 BrvPctyiH7KeQ/qZsonSjrfn3pt7D9l6eYR8gjAffXFYFAlj3+i/P44vYOQIkZrefag7
 NT6KFYdWJxjjAYljUN6wtDJADOpGhhOCqPBpi3tpF4q5dnRSqG/8YESUYy7WteTunJna
 ZJQg==
X-Gm-Message-State: AJIora9mk7ib+RL1XQpeh8uPyOolLCL+Mqg0br1tIESNgsdwxiaGmJJp
 8Xl9UKZvVCDmAAZ9MhvmXVibLxt2360keSSQ
X-Google-Smtp-Source: AGRyM1uOeZ7obv5R18Iz75j1OjQLT8KqrYKj9S+SOlUWvEkgGcpKf/v7ZDiFYlF360BTVJxVa6APww==
X-Received: by 2002:a17:90b:4cc8:b0:1ee:d3a3:4e6 with SMTP id
 nd8-20020a17090b4cc800b001eed3a304e6mr29811244pjb.54.1656838785213; 
 Sun, 03 Jul 2022 01:59:45 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 cq16-20020a056a00331000b00518764d09cdsm18777593pfb.164.2022.07.03.01.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:59:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PATCH v21 08/13] target/loongarch: Fix missing update CSR_BADV
Date: Sun,  3 Jul 2022 14:29:08 +0530
Message-Id: <20220703085913.772936-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703085913.772936-1-richard.henderson@linaro.org>
References: <20220703085913.772936-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Song Gao <gaosong@loongson.cn>

loongarch_cpu_do_interrupt() should update CSR_BADV for some EXCCODE.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220624031049.1716097-9-gaosong@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/cpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 4c8f96bc3a..e32d4cc269 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -171,18 +171,20 @@ static void loongarch_cpu_do_interrupt(CPUState *cs)
         cause = cs->exception_index;
         update_badinstr = 0;
         break;
-    case EXCCODE_ADEM:
     case EXCCODE_SYS:
     case EXCCODE_BRK:
+    case EXCCODE_INE:
+    case EXCCODE_IPE:
+    case EXCCODE_FPE:
+        env->CSR_BADV = env->pc;
+        QEMU_FALLTHROUGH;
+    case EXCCODE_ADEM:
     case EXCCODE_PIL:
     case EXCCODE_PIS:
     case EXCCODE_PME:
     case EXCCODE_PNR:
     case EXCCODE_PNX:
     case EXCCODE_PPI:
-    case EXCCODE_INE:
-    case EXCCODE_IPE:
-    case EXCCODE_FPE:
         cause = cs->exception_index;
         break;
     default:
-- 
2.34.1



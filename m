Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7D75090EE
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:59:25 +0200 (CEST)
Received: from localhost ([::1]:54718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGU0-0006oT-4n
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhFoe-00015b-PL
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:16:40 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:53940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhFod-0003AP-5E
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:16:40 -0400
Received: by mail-pj1-x102d.google.com with SMTP id bx5so2828250pjb.3
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 12:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lqh/xOkffB1ftS+Rqae5WASRyFAS1IUV+ifzHuHPJMs=;
 b=B5ZU5EJXUpSlNSkq5w84D7KK3DzD5NDAbM9jfLDwVJPLlTQTYLP82QSOl7qLhuQ3pL
 LRddfmwuI4QOjaolLPqLa+sZBULtCcD/6OKqQB6oLHBOa96Tbj8ipfTYrn9L/9NvuB/h
 EqVhV3c8ZWAfpxy4d+SI1s9biD9QhhchHelrAFPQZLAZxNSzLw9uDIS29SgxHy2iDi0H
 q44dJNzkAUqPcN6b69AHnVR0gOK9i7BlnrbVXTWItO2dVnyejjXYOJZWqbqK1HRC8bUH
 NWuAfoa8J+lafSdO9WVZzD6PCuiBeDTQIaEUll7cqWue+ACBYAq4izR1IvTGpA5DCZ43
 SZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lqh/xOkffB1ftS+Rqae5WASRyFAS1IUV+ifzHuHPJMs=;
 b=sfPLDHQdRTTHQI5Y6sygj6sMZRI3SNJco2YNyCAjSZj4oLeOjiK44E372EN34IIJs4
 owp8eINHUhQ6YPtshJ9xaOtd6BHFWYvxB9elyCBZ/d4yAMMJegAkuu1GshZvHS6I2z/b
 7cc70psNTIV0chWm0Fe8Fbt/X13Fwu2eYdlCLiO/c5ZmH+arkoYIQzGlv+8+KQs2kv9f
 FgnuxTRqyp4xqBrdgpFt1gOAY5DipX5hI4AdpsCQex3VNC5w3aWs8+LoUYU3dIDaG6vt
 PDwQvc7Ym1XuDE6wfvDuhUMFIp3qWseQF729fllZIqlph4CxW+D2Lb6Zns488gp533yR
 XaaA==
X-Gm-Message-State: AOAM533x9RevgDqT3ae7+cb+gHw/lqHxWhyF4U8d+cEMk9eJlJNq+ZMM
 ZX9j1Eqv1e9HjzqnaAg7k0A1SPMN8jHJGg==
X-Google-Smtp-Source: ABdhPJwPAtKJ7aXJchKzFNhjEUESu5BwwitKWiE6sL/nzBq6sM1BN/w2GGCiB7bZvWx39pp6VxuGfw==
X-Received: by 2002:a17:902:7887:b0:156:788a:56d1 with SMTP id
 q7-20020a170902788700b00156788a56d1mr21970562pll.110.1650482197720; 
 Wed, 20 Apr 2022 12:16:37 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 n24-20020aa79058000000b0050612d0fe01sm20599200pfo.2.2022.04.20.12.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 12:16:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] accel/tcg: Remove ATOMIC_MMU_IDX
Date: Wed, 20 Apr 2022 12:16:33 -0700
Message-Id: <20220420191634.1402437-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420191634.1402437-1-richard.henderson@linaro.org>
References: <20220420191634.1402437-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The last use of this macro was removed in f3e182b10013
("accel/tcg: Push trace info building into atomic_common.c.inc")

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c    | 1 -
 accel/tcg/user-exec.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 2035b2ac0a..dd45e0467b 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2552,7 +2552,6 @@ void cpu_stq_le_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
     glue(glue(glue(cpu_atomic_ ## X, SUFFIX), END), _mmu)
 
 #define ATOMIC_MMU_CLEANUP
-#define ATOMIC_MMU_IDX   get_mmuidx(oi)
 
 #include "atomic_common.c.inc"
 
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 8edf0bbaa1..ac57324d4f 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -506,7 +506,6 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
 #define ATOMIC_NAME(X) \
     glue(glue(glue(cpu_atomic_ ## X, SUFFIX), END), _mmu)
 #define ATOMIC_MMU_CLEANUP do { clear_helper_retaddr(); } while (0)
-#define ATOMIC_MMU_IDX MMU_USER_IDX
 
 #define DATA_SIZE 1
 #include "atomic_template.h"
-- 
2.34.1



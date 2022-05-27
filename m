Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FD95366D7
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:13:43 +0200 (CEST)
Received: from localhost ([::1]:60340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nueT0-0004IB-69
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:13:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueM3-00031h-Gx
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:06:31 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:41716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueM0-0001d6-TK
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:06:31 -0400
Received: by mail-pf1-x42a.google.com with SMTP id p8so4944831pfh.8
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9CQLR9+ZabdVBvj8yT9hoESiXzPxfvDoRGYhKlSAaF0=;
 b=mt03msywCe/dPxaEu9GJ/sl3afRG3iu3cN3mqRMbZBcOiTQfRlzRD+xqavz2uQwa2c
 VngJAKod20t3pBPIHLQfus41+Kij+T0ZyAskqGkkX560L400DY/VgFIAEVOhNWmJmbVI
 7buJGsyaH8Ityah1GHjFQGDVCQzPASiN4FPMFh2H8kTAFwgdJfRs/gjVjQ36rxa1eEJw
 GYKqpLa98vMbRCBCvBsk1lz1gK4pHbjl1/EYuO94xMwaEzFVxVPZ++4wMzvGHbdOCL8S
 unY9donK+oUigcxumKbNnsyYxg+9WXI3F+FVuQejSdbb3iEXtJM+AFJKlpEaiROaknNg
 zIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9CQLR9+ZabdVBvj8yT9hoESiXzPxfvDoRGYhKlSAaF0=;
 b=ZYpO4XVHgVo3xt/vejONB+9/a0lysWUsao1eCtoKLOkUwTpTxwW9vOpPrurx5PUV6M
 RzHvc2k1XsrgFUXA1AsmtG/MrgRu2qDADltYifS/7Q7UyBRj7/0sx5iQ3mD0rsxLvY9S
 21ZoxlM/H/bPzOtf9nvmrUvLe2nsI9YHPnQIS4Z0i5rDL7O7sc5olRgTmFq6FscrHdOL
 JzRVjr569KyNw0UzQCEUqHqMmnUw80Jrk3z7BnvHThqZwfHPlrJ6xZc0DhuSLtCEBY8B
 W9qLV3M3YI35wlkwDeFFObMGC5Vf2SiKEcvjk0MERFPAy6Aw3K3NjxXROsbGoqY2quXM
 JPrw==
X-Gm-Message-State: AOAM533flmPSoZnIh9VNfXKy73R6rU7+UY7e0UfQKZssGqfGDS/+zGv4
 Z4RIMftGPz9xdqB9emiFPW27kxv7Pq45nQ==
X-Google-Smtp-Source: ABdhPJzEC/53RT/8SnMX6ZQS9E92SMYGPz4sCxJYloye1CpiXsLFfMfUzm5g7YUKveRjF+7N7aM+FA==
X-Received: by 2002:a05:6a00:238f:b0:4f6:b09a:4c63 with SMTP id
 f15-20020a056a00238f00b004f6b09a4c63mr45411028pfc.35.1653674787327; 
 Fri, 27 May 2022 11:06:27 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170902cf4a00b001618fee3900sm3934492plg.196.2022.05.27.11.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:06:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 03/15] target/arm: Do not use aarch64_sve_zcr_get_valid_len
 in reset
Date: Fri, 27 May 2022 11:06:11 -0700
Message-Id: <20220527180623.185261-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527180623.185261-1-richard.henderson@linaro.org>
References: <20220527180623.185261-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

We don't need to constrain the value set in zcr_el[1],
because it will be done by sve_zcr_len_for_el.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d2bd74c2ed..0621944167 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -208,8 +208,7 @@ static void arm_cpu_reset(DeviceState *dev)
                                          CPACR_EL1, ZEN, 3);
         /* with reasonable vector length */
         if (cpu_isar_feature(aa64_sve, cpu)) {
-            env->vfp.zcr_el[1] =
-                aarch64_sve_zcr_get_valid_len(cpu, cpu->sve_default_vq - 1);
+            env->vfp.zcr_el[1] = cpu->sve_default_vq - 1;
         }
         /*
          * Enable 48-bit address space (TODO: take reserved_va into account).
-- 
2.34.1



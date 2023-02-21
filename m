Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BB269D963
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 04:42:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUJXH-0005wb-4p; Mon, 20 Feb 2023 22:41:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUJX6-0005rY-U2
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 22:41:38 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUJX4-0005nq-1S
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 22:41:36 -0500
Received: by mail-pj1-x1043.google.com with SMTP id u10so3311245pjc.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 19:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dV3tomdbYmAqkN5Vs+1qw+A5YDs8BGZbPqInFvA+4kU=;
 b=EWO5prRUt3P9m/uqTJ/VzV/p820sQhFivmFxggKSP31SBrSYiIrxJXyW6P4h7UnCGI
 ZePg6+RFkeUao384uAKkNTguxD+DLYblGgp4ZwN8ICkR8FSzYbvOEblsDKE4ochkMGiF
 SpoTfEmGQHYbkxL2VKFAbFP3uVVFaxi66lwJzBK637trjEVY8oG+iK+9f5Re6/is/ft2
 MNsUzk3RQWiYE5X9zis1lVGyp5HYMiZeRbDfr9U7btaCNkIADufRp7YvnIOg3RcyBYLd
 D3TBBEasZliVfhHbRVxIDTCKy1SMN7DIknzIlaY5nkZ7156jx7BJGILabuddqwZBDAsS
 CWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dV3tomdbYmAqkN5Vs+1qw+A5YDs8BGZbPqInFvA+4kU=;
 b=RPvYSo5OCL5BP5w5RDQf6nuBIxc1L4pbGtdXAB+20d9pYVQwRE0Ph7z83CCiU6y4hH
 hs6B6tp8vnfIZFBpxFusZWzXpme4EIn1T/iIrNCDtDDjB6WNnr//615JLG7nA6YruvaL
 5284OLNDzdtzS4viC/FBvuIf68236Zye6euOvxF65jlTMHAzCOvXo8DGJXhS540ey4QG
 HSUZDyhscXSiQQp/ydEgCLNdrfzWtm0BxUssx9tFzoRRnOaokpnisTaqLb6V0H1TWqWM
 +/W+0Ua6y+kaK2geQh8nyfYmLIj6a7XfdKjqdC91oB2veP6Q5WH/z1HdN4g+CnKSvLix
 AKRA==
X-Gm-Message-State: AO0yUKXwww94C9WdIkdxmfWcFb9Vjnd/prE4WsbNtloNl9GEXFH2pjgY
 eJxwCvht7UMVlEd7kHWUFgzXIl527WWlQPV4WHHB+w==
X-Google-Smtp-Source: AK7set/a8OpPIZLaekJ77IGK5mdKo3cj8Ks9foCnIVgxkQeW4MdUmTVCYoFTff9hYsYkJP5zvFwboQ==
X-Received: by 2002:a17:902:f947:b0:19a:968d:26f9 with SMTP id
 kx7-20020a170902f94700b0019a968d26f9mr3669853plb.54.1676950888490; 
 Mon, 20 Feb 2023 19:41:28 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a170902c1c400b0019a88c1cf63sm69851plc.180.2023.02.20.19.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 19:41:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 2/2] target/arm: Fix arm_cpu_get_phys_page_attrs_debug for
 m-profile
Date: Mon, 20 Feb 2023 17:41:22 -1000
Message-Id: <20230221034122.471707-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221034122.471707-1-richard.henderson@linaro.org>
References: <20230221034122.471707-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

M-profile is not supported by arm_is_secure, so using it as
a replacement when bypassing get_phys_addr was incorrect.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1421
Fixes: 4a35855682ce ("target/arm: Plumb debug into S1Translate")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index cb073ac477..057cc9f641 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2974,9 +2974,10 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
+    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
     S1Translate ptw = {
-        .in_mmu_idx = arm_mmu_idx(env),
-        .in_secure = arm_is_secure(env),
+        .in_mmu_idx = mmu_idx,
+        .in_secure = regime_is_secure(env, mmu_idx),
         .in_debug = true,
     };
     GetPhysAddrResult res = {};
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 832385B88B4
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 14:56:46 +0200 (CEST)
Received: from localhost ([::1]:49640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYRwb-0000QL-LY
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 08:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwY-0000Q6-Ny
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:38 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwO-0008WI-RJ
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:38 -0400
Received: by mail-wr1-x42d.google.com with SMTP id e16so25307416wrx.7
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 04:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=dQ81od6doz03swvkUZvq7V0SI8zn3X9BL8rb2WfrUR0=;
 b=bGOheQeqcEuC0Ho8pO9e75ZjFaKUUUwmmviuoxlcDMTI8WRkmGpVKlbMPUfXdLo+Qi
 O5Jowt88Gvpg42qM9eEQ7rePMXKDUs0q6gHpGuLuQdH+KV8jnJ2MQdjrsL2PiNXGZaeM
 cjXdiObBEEf0y5xpZxf767XSWXhVhHHpa6yoIT9nspUds7UE1Dx5e4+XccFhTRKaoKjz
 3ZOU/P0xpH5fZxWYh+pq6+rb4VmbYa0ZIvl/hS5TJayZpukoWXHRB0dcDECG4qS/TYJu
 nA8u7NPezIi7qZ2HDOKncQTmpip81mg6tx2tPBVFO+Y9SLSgrPgL2Jx+WWTFRLXjmOqc
 OOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=dQ81od6doz03swvkUZvq7V0SI8zn3X9BL8rb2WfrUR0=;
 b=PgNLUWvCp3139Iarp/1XYQZtmU5KVWrJx2ww/sjXqY/7WBg14xTgsrDqU/fXRNwLzG
 QY2cmFNyRlPLLqXxU3yDiWtYv5UTeTLTyCraVgFYGeBzFLK4RSLGnxpiF8h6oZZy6iSR
 lGpqxM/k1X8l1vR+ut49+2iVw5KnxPtotuQMe6geEBuIBll2S/CW7nxiRlnylFmaNvw8
 XgKtnUs2cKmfhGyXxGEedVW9dPhbd0xrg5uItaShCoVm9iLNAk8sKl9camJjFK7wuC28
 BdPtea+0TjEr8dMeCuiCWOtz9Z8FcsmzpYjEHwd/SmNsmVIlHEpdrPDTr/1G37k0FvWw
 BuvA==
X-Gm-Message-State: ACgBeo2oAVhOUZOuBPBP4mp3pjcWBLyIFZC/ynf3elDJvjxyXXZuPFCK
 UJMMHHRsg942W6E2oH2TuqHyfcN4GnH1af9P
X-Google-Smtp-Source: AA6agR6kAdA8Z3JVeK3IPAtk29Tv0/nb9YY/aEP0u2PyRec23dbU6xrsu2/vf/46UJW10AGMg7CNIw==
X-Received: by 2002:a5d:424a:0:b0:228:811f:c1a2 with SMTP id
 s10-20020a5d424a000000b00228811fc1a2mr20436348wrr.262.1663156347534; 
 Wed, 14 Sep 2022 04:52:27 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm13712970wru.49.2022.09.14.04.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:52:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 09/20] target/arm: Don't corrupt high half of PMOVSR when cycle
 counter overflows
Date: Wed, 14 Sep 2022 12:52:06 +0100
Message-Id: <20220914115217.117532-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914115217.117532-1-richard.henderson@linaro.org>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
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

From: Peter Maydell <peter.maydell@linaro.org>

When the cycle counter overflows, we are intended to set bit 31 in PMOVSR
to indicate this. However a missing ULL suffix means that we end up
setting all of bits 63-31. Fix the bug.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220822132358.3524971-2-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7ff03f1a4b..e4824e01b8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1186,7 +1186,7 @@ static void pmccntr_op_start(CPUARMState *env)
         uint64_t overflow_mask = env->cp15.c9_pmcr & PMCRLC ? \
                                  1ull << 63 : 1ull << 31;
         if (env->cp15.c15_ccnt & ~new_pmccntr & overflow_mask) {
-            env->cp15.c9_pmovsr |= (1 << 31);
+            env->cp15.c9_pmovsr |= (1ULL << 31);
             pmu_update_irq(env);
         }
 
-- 
2.34.1



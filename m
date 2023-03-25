Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 570826C8DB3
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 12:57:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pg2WL-0003Xh-Db; Sat, 25 Mar 2023 07:57:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2WG-0003WF-Bj
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 07:57:12 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2WD-0001m3-BW
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 07:57:11 -0400
Received: by mail-oi1-x22d.google.com with SMTP id l18so3107598oic.13
 for <qemu-devel@nongnu.org>; Sat, 25 Mar 2023 04:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679745428;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gOdvlCRUUrcZC9U0eZGQ9ggXWyuOCCNFNeedj3EMSZ0=;
 b=VxQF5/8cWKBcbVb1XStdcQYtZOoiBfrcRr7LI9tGhwS5p1BeLon30MxeHElNtGhHQf
 wIe5BL/pzESxD+bXqQr/PepMoRnUavf0wHKyPc7Q7o1AlAauA2NHdcnYww0StWUVKXnv
 ORJb+lRD0Hp9RjLE2rmpVju4JeCdnzJqBGf+FPvqUTLtPHeapv5aE10VvsKAA3PTGBna
 Jz2HFhJMHEzc0+8u4Gb5FNz6CuxQfAzEEA9CayyG/msUSf2MZBrcRH3WW/AvVyjhCViq
 6xuJokDTSWkEpWP8/yXWXCxTrrpuM47k8Il6wJ9CpcV4waQ52h6WEle1hfHxpnbrQJxY
 t89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679745428;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gOdvlCRUUrcZC9U0eZGQ9ggXWyuOCCNFNeedj3EMSZ0=;
 b=F/5rt456+HE9u5uU7C9Q978hWMoSMD01bKOaaul7DfbPM43yo4QaLQXy0UOcYXhDGh
 hRoMJooLCJtLGLZH2bttSGV9GsM6If9n8FmhLFnhR9frxgzp3HwDRB+nQ8NLHaSbUOC1
 ofHkIubd9tYyQHZrtzgzLtnX+nHXIlc8NBNmhTGWW0NV1OZ570IyTYtE2Zz+XlcKL3Uw
 kHk2Uv4jjJhyr1T0xCIBrnEqwNTzaIA46IWZaLkWJ5TNBvDGIIi4UxDHl/XTxymLw0Ox
 DlrirCyz6neHaRi9ih00ljBCwl4LGuyyutwYOC2javwoF7Px2H1hWildCxjE2/GVtLZL
 acbw==
X-Gm-Message-State: AO0yUKVKmTNepWTQJVk6N9HXHaieekQ72O9lDFD90TtqyB4oBi5Yvy4y
 4N60mAlbfwQpYXvSWi+YPGAAJG2uqZtOyKbcQRc=
X-Google-Smtp-Source: AKy350Z4bz/UalHHSBO0kOdp4DzlXiYZXEH6Y7lxAZiE+ltj42QrrgpmbozR9sNv6Gl6kmi+Mx58Mw==
X-Received: by 2002:a17:90b:4f91:b0:23c:fea5:74ca with SMTP id
 qe17-20020a17090b4f9100b0023cfea574camr5981631pjb.23.1679741683969; 
 Sat, 25 Mar 2023 03:54:43 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 15/25] target/riscv: Move hstatus.spvp check to
 check_access_hlsv
Date: Sat, 25 Mar 2023 03:54:19 -0700
Message-Id: <20230325105429.1142530-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The current cpu_mmu_index value is really irrelevant to
the HLV/HSV lookup.  Provide the correct priv level directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 8 +-------
 target/riscv/op_helper.c  | 2 +-
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 8a124888cd..0adfd4a12b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -784,12 +784,6 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         use_background = true;
     }
 
-    /* MPRV does not affect the virtual-machine load/store
-       instructions, HLV, HLVX, and HSV. */
-    if (mmuidx_2stage(mmu_idx)) {
-        mode = get_field(env->hstatus, HSTATUS_SPVP);
-    }
-
     if (first_stage == false) {
         /* We are in stage 2 translation, this is similar to stage 1. */
         /* Stage 2 is always taken as U-mode */
@@ -1251,7 +1245,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     /* MPRV does not affect the virtual-machine load/store
        instructions, HLV, HLVX, and HSV. */
     if (mmuidx_2stage(mmu_idx)) {
-        mode = get_field(env->hstatus, HSTATUS_SPVP);
+        ;
     } else if (mode == PRV_M && access_type != MMU_INST_FETCH &&
                get_field(env->mstatus, MSTATUS_MPRV)) {
         mode = get_field(env->mstatus, MSTATUS_MPP);
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 81362537b6..db7252e09d 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -437,7 +437,7 @@ static int check_access_hlsv(CPURISCVState *env, bool x, uintptr_t ra)
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
     }
 
-    return cpu_mmu_index(env, x) | MMU_2STAGE_BIT;
+    return get_field(env->hstatus, HSTATUS_SPVP) | MMU_2STAGE_BIT;
 }
 
 target_ulong helper_hyp_hlv_bu(CPURISCVState *env, target_ulong addr)
-- 
2.34.1



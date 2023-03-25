Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A186C8E49
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 13:42:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pg3DL-00062K-4Z; Sat, 25 Mar 2023 08:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg3DJ-00062C-7m
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 08:41:41 -0400
Received: from mail-oi1-f182.google.com ([209.85.167.182])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg3DH-0008M3-GT
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 08:41:41 -0400
Received: by mail-oi1-f182.google.com with SMTP id f17so3169765oiw.10
 for <qemu-devel@nongnu.org>; Sat, 25 Mar 2023 05:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679748086;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+p35/oWwAnwR4nkxv4vCszWfRwgaL1NMREdWhFXiQdY=;
 b=vxPydTEmcX5Mo/R7Mqi/sYZhF2b+YhqLA42owwKs1nWDJT0OCMZKDCfofDz9VvhpLU
 YOVVSEUizvW8+ODKDPNZZ3IVkxrNPWvgyc2BY7v2TRxC8iI8G0KDF9itndshrbKWjZKm
 zTAfS3tC599GOQ8hLtgX33780WKtCcYdreflJDTzkUj6QeBivFMvDqEg3elKzadYGSyh
 OKZLSXsi3KhDkPXWJJKY4Zwx09ICDe7+ug2EsJaleA5WiCSoi3uxE0vLYEh9zAIA2fL6
 0RNCOvkEPPgsWfh03PQegT47/wdHpZH5I7p3WzUMzanBcAcxPQLn+1+DlUFu18c/+UHq
 UFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679748086;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+p35/oWwAnwR4nkxv4vCszWfRwgaL1NMREdWhFXiQdY=;
 b=OXPE3AjMnUJqRqcmWnMgEKueDIqLfICLDyxPqrexgU1CJt/+sMmMkvp+XSOFJBGTIr
 NJM2EcBLqljlq5K64oC/L8bMclveBx1P9fNGrTZzdSuy8Jg9e+lSGJxDDDCI9aof5FvT
 u04vBH1rKbC2R5z+2TwjMXuSNx5JGlFyUSrQ/CVTHvRO5GQCekkd6xT0JJHumOpdIzBQ
 Q2ulKtv9yaUBQG4tNs+5Ahig2FiM5WMDSvDaRfl8R0o3011aeTWAyif1+RPF6m7dV05V
 ibsszK76LDDkIFe0wpiLeBlrAmv7X4yLxRV7vyL75JDAGtYEHbVeG1feOGXQy1Pe2lgc
 Fm9w==
X-Gm-Message-State: AO0yUKUoLZJAxK1Tc769j6XuSEyhWBsV+1EQu3C75Z3P5adsUp56Jhhv
 0A/3Qwnhjx0bApsrJbYx+n1kEpa8crdsXD5o5LA=
X-Google-Smtp-Source: AKy350ZNHDDSFMh+cpvIsuDH7keH4t+m4yBlyDvCSQeRZ+t3Rf+wjE56zKIj4EbAQvJsYmCQDPHs/w==
X-Received: by 2002:a17:90b:4a46:b0:22b:b832:d32 with SMTP id
 lb6-20020a17090b4a4600b0022bb8320d32mr6155611pjb.9.1679741685769; 
 Sat, 25 Mar 2023 03:54:45 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 17/25] target/riscv: Check SUM in the correct register
Date: Sat, 25 Mar 2023 03:54:21 -0700
Message-Id: <20230325105429.1142530-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.167.182;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-f182.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Table 9.5 "Effect of MPRV..." specifies that MPV=1 uses VS-level
vsstatus.SUM instead of HS-level sstatus.SUM.

For HLV/HSV instructions, the HS-level register does not apply, but
the VS-level register presumably does, though this is not mentioned
explicitly in the manual.  However, it matches the behavior for MPV.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 12 ++++++++----
 target/riscv/op_helper.c  |  6 +++++-
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 6c42f9c6fd..0017ecbf37 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -42,11 +42,16 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 
     /* All priv -> mmu_idx mapping are here */
     if (!ifetch) {
-        if (mode == PRV_M && get_field(env->mstatus, MSTATUS_MPRV)) {
+        uint64_t status = env->mstatus;
+
+        if (mode == PRV_M && get_field(status, MSTATUS_MPRV)) {
             mode = get_field(env->mstatus, MSTATUS_MPP);
             virt = get_field(env->mstatus, MSTATUS_MPV);
+            if (virt) {
+                status = env->vsstatus;
+            }
         }
-        if (mode == PRV_S && get_field(env->mstatus, MSTATUS_SUM)) {
+        if (mode == PRV_S && get_field(status, MSTATUS_SUM)) {
             mode = MMUIdx_S_SUM;
         }
     }
@@ -838,8 +843,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         }
         widened = 2;
     }
-    /* status.SUM will be ignored if execute on background */
-    sum = mmuidx_sum(mmu_idx) || use_background || is_debug;
+    sum = mmuidx_sum(mmu_idx) || is_debug;
     switch (vm) {
     case VM_1_10_SV32:
       levels = 2; ptidxbits = 10; ptesize = 4; break;
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index db7252e09d..93d4ae8b3e 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -437,7 +437,11 @@ static int check_access_hlsv(CPURISCVState *env, bool x, uintptr_t ra)
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
     }
 
-    return get_field(env->hstatus, HSTATUS_SPVP) | MMU_2STAGE_BIT;
+    int mode = get_field(env->hstatus, HSTATUS_SPVP);
+    if (!x && mode == PRV_S && get_field(env->vsstatus, MSTATUS_SUM)) {
+        mode = MMUIdx_S_SUM;
+    }
+    return mode | MMU_2STAGE_BIT;
 }
 
 target_ulong helper_hyp_hlv_bu(CPURISCVState *env, target_ulong addr)
-- 
2.34.1



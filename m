Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CF239A53E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:04:22 +0200 (CEST)
Received: from localhost ([::1]:34324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loppV-00009S-NA
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkY-0007xU-PM
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:14 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkW-0006nc-TS
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:14 -0400
Received: by mail-wr1-x433.google.com with SMTP id m18so6399977wrv.2
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=oyyg5KAs5qRNGGXNnqnV1KKSwlhes9323oqJd8dOK2U=;
 b=kB2rfpQZLYALZWd8frAoAp614QV3UpJED4+bCpq27aGqHjemiOTBt0H6k/hMI9CO5i
 vEpnu1e+LpqIXYhuwR8lM9M5I09IuJ6M8VQxiQJmD/8VWo5dl+lUEi98/z5TnP9XSLMa
 iwdM+4DkPZV9Uh2gct/0mYoQyuC4p1d2a5c4HEKWrtsVpwZymhr0GE19PbD1j4BSF9WS
 dqkoi0jHDe21NUTuLH+hH8OXG13k920psjbldA4UFHxPhbSm8f+4d892KXNreqsQ8Vlk
 yBSDuEsatSP78nsJJ+zGzmrbAWAnfH5DKIsxhcEShYvDz+Z3DOKjD4E+9j3izfwRwHaA
 bRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oyyg5KAs5qRNGGXNnqnV1KKSwlhes9323oqJd8dOK2U=;
 b=jy+xi8hUVsz60D1vYUS1XH0ukFNswieRjUrUqKPMuTwN7xP6IsZ28hcUFYw2yUD8A9
 3N3cuWFP5RsdbrQSwE0MZ3s177RyeubtVJCqD0jIkqOWO/2Euyk6UWeebZRr7Np/XXJq
 IuuDZ9AQ+GvkT+Rw3sIqCseWQiMzYTaAR7YD8n0S8brCXEvaH1xqK12jHC3v3H1rz+Xi
 HBw8MWde2+yTsnnVqxcSecsncgvi+QgRgrHMC53V7GiM7wFSw3ZUTIAX+dyW548ZwOW6
 1V64Sm8KtFjbJ6x4US3n6XPldU6V3kRlNNQrJMKjpp7xl9/NvU2aZdKnjvK372hXcDpx
 bHGQ==
X-Gm-Message-State: AOAM530GrflHKxfRstxbV7i507PTKnil6q1qa5YuoVq+oZyNwNGVek7l
 AlxkgY37iiCOrWIZOReyrGtgEt2KIIrt0Bjw
X-Google-Smtp-Source: ABdhPJyJ3wtj7tQvGfR7hd/vcAuPlBslCIny4OijO/9WLcd43o1n8krkWvvHGptSo005nkoHepmdAA==
X-Received: by 2002:a05:6000:1b8a:: with SMTP id
 r10mr670507wru.296.1622735951455; 
 Thu, 03 Jun 2021 08:59:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/45] target/arm: Implement M-profile VPR register
Date: Thu,  3 Jun 2021 16:58:25 +0100
Message-Id: <20210603155904.26021-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

If MVE is implemented for an M-profile CPU then it has a VPR
register, which tracks predication information.

Implement the read and write handling of this register, and
the migration of its state.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210520152840.24453-7-peter.maydell@linaro.org
---
 target/arm/cpu.h           |  6 ++++++
 target/arm/machine.c       | 19 +++++++++++++++++++
 target/arm/translate-vfp.c | 38 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f1bd7d787cd..df2f189c49b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -564,6 +564,7 @@ typedef struct CPUARMState {
         uint32_t cpacr[M_REG_NUM_BANKS];
         uint32_t nsacr;
         int ltpsize;
+        uint32_t vpr;
     } v7m;
 
     /* Information associated with an exception about to be taken:
@@ -1761,6 +1762,11 @@ FIELD(V7M_FPCCR, ASPEN, 31, 1)
      R_V7M_FPCCR_UFRDY_MASK |                   \
      R_V7M_FPCCR_ASPEN_MASK)
 
+/* v7M VPR bits */
+FIELD(V7M_VPR, P0, 0, 16)
+FIELD(V7M_VPR, MASK01, 16, 4)
+FIELD(V7M_VPR, MASK23, 20, 4)
+
 /*
  * System register ID fields.
  */
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 6ad1d306b12..62a71a3b640 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -318,6 +318,24 @@ static const VMStateDescription vmstate_m_fp = {
     }
 };
 
+static bool mve_needed(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+
+    return cpu_isar_feature(aa32_mve, cpu);
+}
+
+static const VMStateDescription vmstate_m_mve = {
+    .name = "cpu/m/mve",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = mve_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(env.v7m.vpr, ARMCPU),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 static const VMStateDescription vmstate_m = {
     .name = "cpu/m",
     .version_id = 4,
@@ -344,6 +362,7 @@ static const VMStateDescription vmstate_m = {
         &vmstate_m_other_sp,
         &vmstate_m_v8m,
         &vmstate_m_fp,
+        &vmstate_m_mve,
         NULL
     }
 };
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 791c4f5f70b..2316e105acc 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -703,6 +703,12 @@ static FPSysRegCheckResult fp_sysreg_checks(DisasContext *s, int regno)
             return FPSysRegCheckFailed;
         }
         break;
+    case ARM_VFP_VPR:
+    case ARM_VFP_P0:
+        if (!dc_isar_feature(aa32_mve, s)) {
+            return FPSysRegCheckFailed;
+        }
+        break;
     default:
         return FPSysRegCheckFailed;
     }
@@ -817,6 +823,25 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
         tcg_temp_free_i32(sfpa);
         break;
     }
+    case ARM_VFP_VPR:
+        /* Behaves as NOP if not privileged */
+        if (IS_USER(s)) {
+            break;
+        }
+        tmp = loadfn(s, opaque);
+        store_cpu_field(tmp, v7m.vpr);
+        break;
+    case ARM_VFP_P0:
+    {
+        TCGv_i32 vpr;
+        tmp = loadfn(s, opaque);
+        vpr = load_cpu_field(v7m.vpr);
+        tcg_gen_deposit_i32(vpr, vpr, tmp,
+                            R_V7M_VPR_P0_SHIFT, R_V7M_VPR_P0_LENGTH);
+        store_cpu_field(vpr, v7m.vpr);
+        tcg_temp_free_i32(tmp);
+        break;
+    }
     default:
         g_assert_not_reached();
     }
@@ -935,6 +960,19 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         tcg_temp_free_i32(fpscr);
         break;
     }
+    case ARM_VFP_VPR:
+        /* Behaves as NOP if not privileged */
+        if (IS_USER(s)) {
+            break;
+        }
+        tmp = load_cpu_field(v7m.vpr);
+        storefn(s, opaque, tmp);
+        break;
+    case ARM_VFP_P0:
+        tmp = load_cpu_field(v7m.vpr);
+        tcg_gen_extract_i32(tmp, tmp, R_V7M_VPR_P0_SHIFT, R_V7M_VPR_P0_LENGTH);
+        storefn(s, opaque, tmp);
+        break;
     default:
         g_assert_not_reached();
     }
-- 
2.20.1



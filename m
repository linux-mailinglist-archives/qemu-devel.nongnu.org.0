Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5077B39A547
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:04:58 +0200 (CEST)
Received: from localhost ([::1]:35940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lopq5-0001Fs-9N
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkZ-00080x-It
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:15 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkX-0006oX-NW
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:15 -0400
Received: by mail-wr1-x436.google.com with SMTP id u7so938078wrs.10
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=z+tbQwBoE6ol9K1/Y5CjCzDYZXTy7W8OMuxCoCUNVPk=;
 b=CaAFHhIg4ie2MVQiFkQfAcrO2xBKxs8k3fgRO5QRLWYShsAtfL1nYoIkwjI6Stot/E
 cooZLX0pMVzVEGZgpYfr+Y+wzCzzbuxpQcVbQiT/6gXmjKKqEfCG7N15Lwj0lIhhyCLr
 4deqz/ImRu8qJ3hgFqbghF/vcA9OPMnMFjv6Xn8qe7sgMl77N40AvjJ8cew8nVyj7kr3
 9c0oZ5uK30ETbmAlg0nmxnhCrzeZsk3N35bl29ZYSzGwF50gjkrqypwGOabtbXbZx6gS
 HIx4VwQQdysm5EKMqBHiZ5vT4vL0E9C39CgHDTN1JB2EqtGdLgBdiqaB7yX2kMuI5Mam
 3+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z+tbQwBoE6ol9K1/Y5CjCzDYZXTy7W8OMuxCoCUNVPk=;
 b=sot0vDwnqSAiaKPp391AGSiMs05xVlb9ExoAuVPWicW19ge5pfS/ilX1jLTrAo/bnT
 AGpwuFQEZDF8j+hw7e11pYIhRmGjZJ7ErYC47woqPVYfSbJJ7U7dfSz6i+xniZvL7jav
 fCj4KxhesIlj4n9fGtI4+srJbYi6QkelPgiPsVbI2BDsx1GSxd61GAhLNYkvRqrw7Lvc
 W5VBerq9o/AriPwaD/xutzs+HwCgrX0n9MXT04hc2474c/F/Tt8WfjHfg3zPLs0hWaqB
 UuGZh6LRY5GGTfFPMENd0pK+2r2IwpIf1aZ3xhhg6i6Z/fiEFI/weB3TCIQ5CTP1m3EW
 H/zw==
X-Gm-Message-State: AOAM533/pJ3UA464h920RnQVQoixYy4cSSzoM3UXmfrnBtITU0jQD8K8
 IAOhGYX3etCP/aiVqJ5gBrOfCifZYmJi6jwY
X-Google-Smtp-Source: ABdhPJwvbhymPi9NMcXlBuFVfeDpPIp0QjxsD4Emt4dqOSRDuEr99PpLyXuGlWe8Vo+NcXCTqTRWfQ==
X-Received: by 2002:adf:f382:: with SMTP id m2mr653786wro.394.1622735952216;
 Thu, 03 Jun 2021 08:59:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/45] target/arm: Make FPSCR.LTPSIZE writable for MVE
Date: Thu,  3 Jun 2021 16:58:26 +0100
Message-Id: <20210603155904.26021-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

The M-profile FPSCR has an LTPSIZE field, but if MVE is not
implemented it is read-only and always reads as 4; this is how QEMU
currently handles it.

Make the field writable when MVE is implemented.

We can safely add the field to the MVE migration struct because
currently no CPUs enable MVE and so the migration struct is never
used.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210520152840.24453-8-peter.maydell@linaro.org
---
 target/arm/cpu.h        | 3 ++-
 target/arm/machine.c    | 1 +
 target/arm/vfp_helper.c | 9 ++++++---
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index df2f189c49b..c389b1e9691 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -563,7 +563,7 @@ typedef struct CPUARMState {
         uint32_t fpdscr[M_REG_NUM_BANKS];
         uint32_t cpacr[M_REG_NUM_BANKS];
         uint32_t nsacr;
-        int ltpsize;
+        uint32_t ltpsize;
         uint32_t vpr;
     } v7m;
 
@@ -1562,6 +1562,7 @@ void vfp_set_fpscr(CPUARMState *env, uint32_t val);
 
 #define FPCR_LTPSIZE_SHIFT 16   /* LTPSIZE, M-profile only */
 #define FPCR_LTPSIZE_MASK (7 << FPCR_LTPSIZE_SHIFT)
+#define FPCR_LTPSIZE_LENGTH 3
 
 #define FPCR_NZCV_MASK (FPCR_N | FPCR_Z | FPCR_C | FPCR_V)
 #define FPCR_NZCVQC_MASK (FPCR_NZCV_MASK | FPCR_QC)
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 62a71a3b640..81e30de8243 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -332,6 +332,7 @@ static const VMStateDescription vmstate_m_mve = {
     .needed = mve_needed,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(env.v7m.vpr, ARMCPU),
+        VMSTATE_UINT32(env.v7m.ltpsize, ARMCPU),
         VMSTATE_END_OF_LIST()
     },
 };
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 01b9d8557f7..e0886ab5a56 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -195,8 +195,10 @@ uint32_t vfp_get_fpscr(CPUARMState *env)
 
 void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
 {
+    ARMCPU *cpu = env_archcpu(env);
+
     /* When ARMv8.2-FP16 is not supported, FZ16 is RES0.  */
-    if (!cpu_isar_feature(any_fp16, env_archcpu(env))) {
+    if (!cpu_isar_feature(any_fp16, cpu)) {
         val &= ~FPCR_FZ16;
     }
 
@@ -210,11 +212,12 @@ void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
          * because in v7A no-short-vector-support cores still had to
          * allow Stride/Len to be written with the only effect that
          * some insns are required to UNDEF if the guest sets them.
-         *
-         * TODO: if M-profile MVE implemented, set LTPSIZE.
          */
         env->vfp.vec_len = extract32(val, 16, 3);
         env->vfp.vec_stride = extract32(val, 20, 2);
+    } else if (cpu_isar_feature(aa32_mve, cpu)) {
+        env->v7m.ltpsize = extract32(val, FPCR_LTPSIZE_SHIFT,
+                                     FPCR_LTPSIZE_LENGTH);
     }
 
     if (arm_feature(env, ARM_FEATURE_NEON)) {
-- 
2.20.1



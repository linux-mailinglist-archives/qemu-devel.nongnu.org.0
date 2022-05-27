Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B765366D6
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:13:00 +0200 (CEST)
Received: from localhost ([::1]:58704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nueSJ-0003Cr-79
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueM3-00031i-Kj
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:06:31 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:47019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueM2-0001dA-1g
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:06:31 -0400
Received: by mail-pf1-x433.google.com with SMTP id j6so4926660pfe.13
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vc6A4fJ2bpA25nPv/BuEPYKtg306M4XfmsuW8OQnyWk=;
 b=i6n32vXeQlZRyGRIWYESF8+QaYwy/aQKXl92/ZypR/DjgOcSn6oqW4BqLT+W5gcc0j
 r44/92d+9WHPA1Q6DXXQ32XrCRyMesnzdjVpm98Wysxi08YpFDWtHmsllAHgaPM1DZ22
 bxPr1QGnHiEgrhNCQZithunDDP8m9X1yC4cPLc59g24imbTjCbLDhZy6bpirYHc5IA3g
 DDNRKVVS2VA4jWjA5JZMOdwNFoOHanwI+umhXYPygLEnFz9mnCubPJfQNegc9b4f4HQr
 1BGlyxRNHYnSIWi8+LdTk0jJcC+WfZadpzPYdDw+ntBoumiRqr2dikQuFWaI5zKmq9I7
 bmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vc6A4fJ2bpA25nPv/BuEPYKtg306M4XfmsuW8OQnyWk=;
 b=joEI/0KedYc0mA9nghO60t+Frf6UdWGTF7NMiLE2NTC1+q8xZXM4BnNdtMOHhKOHcu
 ndww/PCd6+SKF2bioElIJDkdWF2QaRhHBB+HKENh1cL1OJ5FQ/SVEVVtUOSIJCQOYDJf
 5dlIEQmIsnLQFhtJsr10H7a8O/gOqXxm1B0Ax0+lzhE/KDSghpc/V9ko/HLAC6yphrJ2
 L9cfj0KXLcBkM3kajzXqOkm1ij226fdPCZnhC+H2Sup50cTsBlQX1mSFuheRsxNIaVzs
 XFEZRfRflAkOvOWEh+Ef9QvcfhWp8oFVp9/HlNno7jd9dvbouaK72sqJSfK6NXipDAei
 p4kw==
X-Gm-Message-State: AOAM531opSNzh4yeD9aSG3FB5BOOPotPZ8YWZ6bB7599OLAb6Ca9034Y
 wKLoyvrXiZzT0egIAO/l5vVjJCq3CSq6LA==
X-Google-Smtp-Source: ABdhPJxO6vOvdVZmySDD9+4NMxV3ttfiSTqqfVmAX3S11UdX5SMGZwZD+HzuVpDCueM5cO4/NqkBtQ==
X-Received: by 2002:a63:1a17:0:b0:3fa:e901:1c68 with SMTP id
 a23-20020a631a17000000b003fae9011c68mr11153205pga.243.1653674786362; 
 Fri, 27 May 2022 11:06:26 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170902cf4a00b001618fee3900sm3934492plg.196.2022.05.27.11.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:06:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 02/15] linux-user/aarch64: Use SVE_LEN from hflags
Date: Fri, 27 May 2022 11:06:10 -0700
Message-Id: <20220527180623.185261-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527180623.185261-1-richard.henderson@linaro.org>
References: <20220527180623.185261-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the digested vector length rather than the raw zcr_el[1] value.

This fixes an incorrect return from do_prctl_set_vl where we didn't
take into account the set of vector lengths supported by the cpu.
It also prepares us for Streaming SVE mode, where the vector length
comes from a different cpreg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_prctl.h | 19 +++++++++++++------
 linux-user/aarch64/signal.c       |  4 ++--
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/linux-user/aarch64/target_prctl.h b/linux-user/aarch64/target_prctl.h
index 3f5a5d3933..fcbb90e881 100644
--- a/linux-user/aarch64/target_prctl.h
+++ b/linux-user/aarch64/target_prctl.h
@@ -10,7 +10,7 @@ static abi_long do_prctl_get_vl(CPUArchState *env)
 {
     ARMCPU *cpu = env_archcpu(env);
     if (cpu_isar_feature(aa64_sve, cpu)) {
-        return ((cpu->env.vfp.zcr_el[1] & 0xf) + 1) * 16;
+        return (EX_TBFLAG_A64(env->hflags, SVE_LEN) + 1) * 16;
     }
     return -TARGET_EINVAL;
 }
@@ -25,18 +25,25 @@ static abi_long do_prctl_set_vl(CPUArchState *env, abi_long arg2)
      */
     if (cpu_isar_feature(aa64_sve, env_archcpu(env))
         && arg2 >= 0 && arg2 <= 512 * 16 && !(arg2 & 15)) {
-        ARMCPU *cpu = env_archcpu(env);
         uint32_t vq, old_vq;
 
-        old_vq = (env->vfp.zcr_el[1] & 0xf) + 1;
+        old_vq = EX_TBFLAG_A64(env->hflags, SVE_LEN) + 1;
+
+        /*
+         * Bound the value of vq, so that we know that it fits into
+         * the 4-bit field in ZCR_EL1.  Rely on the hflags rebuild
+         * to sort out the length supported by the cpu.
+         */
         vq = MAX(arg2 / 16, 1);
-        vq = MIN(vq, cpu->sve_max_vq);
+        vq = MIN(vq, 16);
+        env->vfp.zcr_el[1] = vq - 1;
+        arm_rebuild_hflags(env);
+
+        vq = EX_TBFLAG_A64(env->hflags, SVE_LEN) + 1;
 
         if (vq < old_vq) {
             aarch64_sve_narrow_vq(env, vq);
         }
-        env->vfp.zcr_el[1] = vq - 1;
-        arm_rebuild_hflags(env);
         return vq * 16;
     }
     return -TARGET_EINVAL;
diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 7de4c96eb9..57e9360743 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -315,7 +315,7 @@ static int target_restore_sigframe(CPUARMState *env,
 
         case TARGET_SVE_MAGIC:
             if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
-                vq = (env->vfp.zcr_el[1] & 0xf) + 1;
+                vq = EX_TBFLAG_A64(env->hflags, SVE_LEN) + 1;
                 sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
                 if (!sve && size == sve_size) {
                     sve = (struct target_sve_context *)ctx;
@@ -434,7 +434,7 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
 
     /* SVE state needs saving only if it exists.  */
     if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
-        vq = (env->vfp.zcr_el[1] & 0xf) + 1;
+        vq = EX_TBFLAG_A64(env->hflags, SVE_LEN) + 1;
         sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
         sve_ofs = alloc_sigframe_space(sve_size, &layout);
     }
-- 
2.34.1



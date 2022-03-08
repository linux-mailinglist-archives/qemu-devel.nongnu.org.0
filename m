Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D13194D1128
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:38:18 +0100 (CET)
Received: from localhost ([::1]:33834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUQD-00062g-Uq
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:38:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU9O-0005Lt-37
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:54 -0500
Received: from [2607:f8b0:4864:20::1031] (port=38510
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU9M-0006UF-Ik
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:53 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 ge19-20020a17090b0e1300b001bcca16e2e7so1435389pjb.3
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ta/28CvyDoU7eRgMKLBRwX53uj2wXJ6ov5bazLvyx9o=;
 b=m7AlE6b9CFOGk+iiHhhOlYXQbmULrN2SHjdikBlv6i0VoSupXvpozaSAaM1f++Dh7v
 u9K5Xvr9HCioqWcKfdk3aL7FLnT+h2V0Lrp9kxiQg9JtKdnAWxGc0zEgiCMfa3bB5jPN
 RJGnFXwlisn9igbPCWA2t8jR/EEKYtk31sRKvDI/XNvh5YFsq6Ieb2VlKrk8xm0jJxtt
 VqECToXHW2pmkoULIt7B2CG7cC3egrZos9WkXh4QjRCSsx3V43JeJbOalsrkGOdb9rwS
 lDH54Jdm46Uo4TKhnOI3rj5S3AQQKC9ESUNSFBz1AZUXzZtgtwcxvFEPXeT7lI79wJp9
 zsTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ta/28CvyDoU7eRgMKLBRwX53uj2wXJ6ov5bazLvyx9o=;
 b=UovWt029hKpzcxJZ4TNRC9JNouWpWEj4SFO823zHHdSLiIfjESUhUnuvuMg/aXTYtt
 cithBMuIwF/Xzew0HJtVhq8NOYPrQq35sQw+pYU4flZlNzuhDVv2Lh0aV2s2o/hgBWGG
 kE+sY7ETfL75nk12JgUvh6zkNonnr+gPoYvA+wYj4EKYp9tBLugAE48UolKe8Ut/WHu4
 emqM9XylL1LoLgEHAc350e0vapM/FQ1JDeUXS9cI4zoBviWm1q5A1nt0Xo1d5Lr0Z0gy
 gUamtqgoeoJunjGp/aOQGUBwQ/VjYYgqOhRxp4/+FGWDNlkR8/EyPQwRYz+63V2yUn5A
 JtnA==
X-Gm-Message-State: AOAM533OCo77XVwFyNYnhULu+gMpv+IOvuBUJnAqwGdjd20YHgO2fG3i
 aIsM0wIkmhiXTVsSOZxMXHk3QSqK2aDjtg==
X-Google-Smtp-Source: ABdhPJwf+X3kUuE2nxmmxA3mpRP2xr/kqo5Y541HS+7Jt95b4uNbCmEVTf1ZgrBQtHcYcev97dfUNg==
X-Received: by 2002:a17:902:d481:b0:151:b6e0:34bf with SMTP id
 c1-20020a170902d48100b00151b6e034bfmr15896219plg.140.1646724050676; 
 Mon, 07 Mar 2022 23:20:50 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p125-20020a622983000000b004f6c5d58225sm13790899pfp.90.2022.03.07.23.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:20:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 26/33] target/nios2: Update helper_eret for shadow registers
Date: Mon,  7 Mar 2022 21:19:58 -1000
Message-Id: <20220308072005.307955-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308072005.307955-1-richard.henderson@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When CRS = 0, we restore from estatus; otherwise from sstatus.
Do not allow reserved status bits to be set via this restore.
Add the fields defined for EIC to status.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h       |  1 +
 target/nios2/cpu.c       | 16 ++++++++++++----
 target/nios2/op_helper.c | 20 +++++++++++++++++++-
 3 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index efaac274aa..c48daa5640 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -83,6 +83,7 @@ enum {
     R_FP     = 28,
     R_EA     = 29,
     R_BA     = 30,
+    R_SSTATUS = 30,
     R_RA     = 31,
 };
 
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 05f4a7a93a..6ece92a2b8 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -109,10 +109,18 @@ static void nios2_cpu_initfn(Object *obj)
     WR_FIELD(CR_EXCEPTION, CAUSE);
     WR_REG(CR_BADADDR);
 
-    /* TODO: These control registers are not present with the EIC. */
-    RO_FIELD(CR_STATUS, RSIE);
-    WR_REG(CR_IENABLE);
-    RO_REG(CR_IPENDING);
+    if (cpu->eic_present) {
+        WR_FIELD(CR_STATUS, RSIE);
+        RO_FIELD(CR_STATUS, NMI);
+        WR_FIELD(CR_STATUS, PRS);
+        RO_FIELD(CR_STATUS, CRS);
+        WR_FIELD(CR_STATUS, IL);
+        WR_FIELD(CR_STATUS, IH);
+    } else {
+        RO_FIELD(CR_STATUS, RSIE);
+        WR_REG(CR_IENABLE);
+        RO_REG(CR_IPENDING);
+    }
 
     if (cpu->mmu_present) {
         WR_FIELD(CR_STATUS, U);
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index e656986e3c..42342f007f 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -34,7 +34,25 @@ void helper_raise_exception(CPUNios2State *env, uint32_t index)
 #ifndef CONFIG_USER_ONLY
 void helper_eret(CPUNios2State *env, uint32_t new_pc)
 {
-    env->status = env->estatus;
+    Nios2CPU *cpu = env_archcpu(env);
+    unsigned crs = FIELD_EX32(env->status, CR_STATUS, CRS);
+    uint32_t val;
+
+    if (crs == 0) {
+        val = env->estatus;
+    } else {
+        val = env->shadow_regs[crs][R_SSTATUS];
+    }
+
+    /*
+     * Both estatus and sstatus have no constraints on write;
+     * do not allow reserved fields in status to be set.
+     */
+    val &= (cpu->cr_state[CR_STATUS].writable |
+            cpu->cr_state[CR_STATUS].readonly);
+    env->status = val;
+    nios2_update_crs(env);
+
     env->pc = new_pc;
     cpu_loop_exit(env_cpu(env));
 }
-- 
2.25.1



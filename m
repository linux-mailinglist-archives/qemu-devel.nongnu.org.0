Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A7233A75F
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 19:17:52 +0100 (CET)
Received: from localhost ([::1]:40608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLVJH-0007qv-EY
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 14:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLV1V-0002Dh-F7
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:59:29 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:39886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLV1I-00028W-Og
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:59:29 -0400
Received: by mail-qt1-x829.google.com with SMTP id g24so7648066qts.6
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 10:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rHSsmMGgFTbVP+9XKxjAVaBht/aShtydPxFkUYIpqOM=;
 b=bta5pLlXHGReqLeXRf5hiEZupd2K1+MlcOoAxT2YO1D5AEY6JNpUuVqxD7bdHg/wP6
 JgYVHAlhSKq9GmHecFUtct0aGNr40AIVpMc6s41JAjfNqyhyggp9/M0HUPNhSMFQl+uF
 4ppLUPkk4vD/Rvt6BCWFy/WCDiEeQnk1KVCRH5WDFX5HPtp7yCvghnQVoZ/9F7YCDnM2
 mfLfaoK6VnXN5UoaRUnpoaNQnIYQeZQLejuQAXBD9qfAKg1g1wA7BCDjQqUqMsW7Cddk
 Jllh143lnkfO8qyme48Nyk3Mt9KPrwR+fUYi4ndv1lSA+bR+qKvb8sQQ415csLRS1j+n
 H+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rHSsmMGgFTbVP+9XKxjAVaBht/aShtydPxFkUYIpqOM=;
 b=QWvdiTMrHqKLi68QZxNlK5ztUnbHSOfmWap52RjkrOpGCiK+A1jFhRliJ6SV/K5/WP
 Vj+KNGgGEgmfzxKhbB4NG4YAeEQGQe/5XpT9a2rVFTrHAM8ehG03B4kkapm/WfxgCfon
 SDhLsvAuGdMcpiOzA0Rh8FsFPuRopquwjDhvKSBKQhyYkWNVZVqzpiGUtEYs7nxrOkyc
 XwUZVOX4hNKsV9WNrSBtSHfA0EUCGNXRZlwRKJc90pUzhAFeNA30ABIR16D+4jz2Z6j7
 VEu0btskf7e+PpIyCAHuqiPzrapv2NlG8l/r6dBx/8X/bN1YAM1qb/yIoSC7SynKzhzW
 MkKA==
X-Gm-Message-State: AOAM532KRPWoWAct/Mnicuesefk1ZYKkTDKjo4+OEn8ENjtn3WFYV5Ei
 g82LnWeOf+GexOrKXE3cgFpaEDl5CPFy4rIC
X-Google-Smtp-Source: ABdhPJx6cs3lRd0IMX8+og/bCdkTJx6qDmxvV2yBswRdr9MN0y3j6mWbAMSXyWT5o5g/tGQI9ShLuw==
X-Received: by 2002:ac8:5b8e:: with SMTP id a14mr19892550qta.189.1615744754950; 
 Sun, 14 Mar 2021 10:59:14 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id c127sm10216240qkd.87.2021.03.14.10.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 10:59:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/16] target/ppc: Retain hflags_nmsr only for migration
Date: Sun, 14 Mar 2021 11:58:55 -0600
Message-Id: <20210314175906.1733746-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314175906.1733746-1-richard.henderson@linaro.org>
References: <20210314175906.1733746-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: ivan@vmfacility.fr, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have eliminated all normal uses of hflags_nmsr.  We need
not even compute it except when we want to migrate.  Rename
the field to emphasize this.

Remove the fixme comment for migrating access_type.  This value
is only ever used with the current executing instruction, and
is never live when the cpu is halted for migration.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h         | 4 ++--
 target/ppc/helper_regs.c | 2 --
 target/ppc/machine.c     | 9 ++++++---
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 061d2eed1b..79c4033a42 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1105,8 +1105,8 @@ struct CPUPPCState {
 #endif
 
     /* These resources are used only in QEMU core */
-    target_ulong hflags;      /* hflags is MSR & HFLAGS_MASK */
-    target_ulong hflags_nmsr; /* specific hflags, not coming from MSR */
+    target_ulong hflags;
+    target_ulong hflags_compat_nmsr; /* for migration compatibility */
     int immu_idx;     /* precomputed MMU index to speed up insn accesses */
     int dmmu_idx;     /* precomputed MMU index to speed up data accesses */
 
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 95b9aca61f..a87e354ca2 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -104,8 +104,6 @@ void hreg_compute_hflags(CPUPPCState *env)
          */
         uint32_t le = extract32(env->spr[SPR_HID0], 3, 1);
         env->hflags |= le << MSR_LE;
-        /* Retain for backward compatibility with migration. */
-        env->hflags_nmsr = le << MSR_LE;
     }
 }
 
diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index f6eeda9642..1f7a353c78 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -310,6 +310,10 @@ static int cpu_pre_save(void *opaque)
         }
     }
 
+    /* Retain migration compatibility for pre 6.0 for 601 machines. */
+    env->hflags_compat_nmsr = (env->flags & POWERPC_FLAG_HID0_LE
+                               ? env->hflags & MSR_LE : 0);
+
     return 0;
 }
 
@@ -829,9 +833,8 @@ const VMStateDescription vmstate_ppc_cpu = {
         /* Supervisor mode architected state */
         VMSTATE_UINTTL(env.msr, PowerPCCPU),
 
-        /* Internal state */
-        VMSTATE_UINTTL(env.hflags_nmsr, PowerPCCPU),
-        /* FIXME: access_type? */
+        /* Backward compatible internal state */
+        VMSTATE_UINTTL(env.hflags_compat_nmsr, PowerPCCPU),
 
         /* Sanity checking */
         VMSTATE_UINTTL_TEST(mig_msr_mask, PowerPCCPU, cpu_pre_2_8_migration),
-- 
2.25.1



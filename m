Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 220A8339AB1
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 02:05:31 +0100 (CET)
Received: from localhost ([::1]:47268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKsig-0004e5-1V
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 20:05:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKsds-000746-Cx
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 20:00:32 -0500
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:45053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKsdo-0003PZ-4O
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 20:00:32 -0500
Received: by mail-qv1-xf29.google.com with SMTP id by2so5181219qvb.11
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 17:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rHSsmMGgFTbVP+9XKxjAVaBht/aShtydPxFkUYIpqOM=;
 b=TXnzeBGdkKUNYlTpxXNPt2I5vQLvQe2mSWx1sgYiWl6tWJUQyZv49ag4Rq7hG84n0/
 6uhFsE5uoUiyFxlU2Dv9mLpTXEmrHYFQpld0eatS2L3aCyXPfGOSgYb6lOCJHSJRBjGC
 yciCF4ASsHn0Jn6JOXWJrU/YOZ2iXPhXL04nikrk8Yh4KA5RzUJ10gUwju1HXK3HcSzz
 LVlIpM5ePK3yU8Oq1HrpkOtYf2Q2n3e2h9yS1pvdSPrp2HA6BabG+e/EmxPx4+bGXszE
 tliBuuovIJtTx0byqk4/ZetGMu85Qupx2PbV8CwerflQgj3AunlG+mFM7uymlQoVPSEU
 pc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rHSsmMGgFTbVP+9XKxjAVaBht/aShtydPxFkUYIpqOM=;
 b=KDNPWha6P50v3l3Rc8DNhEUCiynUO6p/q9leDeRiI5UC6Gr4ocrwFw51EL0A8+jDYJ
 P7G1PkQlAaBwaDMuqV6VLPifWg62Ses3reb37RDQri7oHLQjrZOVNR8rbdwxfidxJzEs
 psZyx8oasx/jqEt752C0gR9gRFjE2DjtSaqxfoioQxy5bvayj/c0thNfXLpBiVGAsUxw
 m1FLLx/w81Sj6po1XVW6pKX1LLTPZAGDK7kKFyOsuYHYrERgzWMiTNiTF2seYLnZAzRT
 UG6/8WKIme3Av5OadvH2EfX3Lfplz4fckempUFmw/2n+zWIw1/RJ5G6XOqqBSsilzQmb
 yymg==
X-Gm-Message-State: AOAM531JJGSMQ7xjk1VUOBNXv2nsqsG22Y7kQ932U/gxQGt1aYGreKcM
 WLm/GPjOuSnMveH1TLA4IMpOAhwsb9poBwtJ
X-Google-Smtp-Source: ABdhPJxaQyZJQRQQcpu8YFEgM7ymGkzzWSjsky0ip5CBBwCPM1wuWUgWszrKBno1FjFbZkFkVmzVFQ==
X-Received: by 2002:a05:6214:1909:: with SMTP id
 er9mr873722qvb.5.1615597227114; 
 Fri, 12 Mar 2021 17:00:27 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id l129sm5602078qkd.76.2021.03.12.17.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 17:00:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/15] target/ppc: Retain hflags_nmsr only for migration
Date: Fri, 12 Mar 2021 19:00:08 -0600
Message-Id: <20210313010018.819153-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210313010018.819153-1-richard.henderson@linaro.org>
References: <20210313010018.819153-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf29.google.com
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



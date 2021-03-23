Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B31346814
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:49:12 +0100 (CET)
Received: from localhost ([::1]:35942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOm5V-0002Bm-Tv
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOm0l-0008Fb-04
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:44:16 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:46015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOm0L-0003fG-CL
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:44:11 -0400
Received: by mail-oi1-x22e.google.com with SMTP id d12so18099751oiw.12
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 11:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZZn5IlT2BapleTJTqEZmRXFES9KCoo4eQgHLgV0kshE=;
 b=KFLJe20OoyGU7DeNegRcCDinW+fVHZ2S6bCuEfl6Pd8uqm54RBK4MIRF76Vof4ckIN
 CZYnjs2zrJ2b332cxhKzclrLdiI6Wsd0VPXpHwvXeH/c2lyVYVihCMpFNMdZZmfGEKx7
 yzigmPa2FKljB6Rhu1V0mp7+uhDzeJroYtmsgyh8HzuwBqQjy953MrROBpt2DW3ZVyzZ
 A06uaG0qfBGMX2+AjRtFR6Y5cREtDfJKuBnPr7UcfqnI0sTMJyKuyCq3bjCIvYleMhiG
 bIkxRVsnrkyEtt9JQazbFEMA1TbyLIAv5OVqdpxLse2wde4vBqnVsuumfUNsLD2YGY2/
 HQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZZn5IlT2BapleTJTqEZmRXFES9KCoo4eQgHLgV0kshE=;
 b=AL5ZqEOyWni/Ul1dN5jR5av38yYp9C6ied86LE+XmFi7RxNVx1sBqUV/67fr54FEHb
 IWrBoEVY3mT5mMIqCYzqry/Pb9m9NplH9c1SAKpHTTPIgrG2Zu5iI+LZ8Uti0bvvfUG1
 nkDdjRZQqGATtja7PUExBd/SUD4ywou4QHQNrV+cyjpDddDae6/0kSvp3uUz1DHy4siv
 iuRBeQFZ/ETBM35wkp6JDgE0tA+Js6wVXY2YB7T7nILpaFAeAmkSGGAGwhaOvPQQahN4
 wk7Xt+D7BeVbNrT8vHfhGNN0mHMomk/lXDLkk/UpTkpSdDE7V4wlnDXzrZ4gsalf77ks
 g37g==
X-Gm-Message-State: AOAM533HCX/KT93rr1FFpYa8RZ/22IDtATRo316KHGjjluZvqVB/HZwM
 mhusuPRPC0uim5RkGsuY7DFd63sQYJq43zeL
X-Google-Smtp-Source: ABdhPJy6sYHVxYQj4f8flGA00ZjLN/SAhspqSBwXLvA3y8kyM2aHYm5qbIqFUkJxDc1bYIIZ1DDY6w==
X-Received: by 2002:a05:6808:13d0:: with SMTP id
 d16mr4451655oiw.169.1616525024541; 
 Tue, 23 Mar 2021 11:43:44 -0700 (PDT)
Received: from localhost.localdomain (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id x23sm3902825ood.28.2021.03.23.11.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 11:43:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/10] target/ppc: Extract post_load_update_msr
Date: Tue, 23 Mar 2021 12:43:31 -0600
Message-Id: <20210323184340.619757-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210323184340.619757-1-richard.henderson@linaro.org>
References: <20210323184340.619757-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
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
Cc: qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract post_load_update_msr to share between cpu_load_old
and cpu_post_load in updating the msr.

Suggested-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/machine.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index 1f7a353c78..09c5765a87 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -10,6 +10,18 @@
 #include "kvm_ppc.h"
 #include "exec/helper-proto.h"
 
+static void post_load_update_msr(CPUPPCState *env)
+{
+    target_ulong msr = env->msr;
+
+    /*
+     * Invalidate all supported msr bits except MSR_TGPR/MSR_HVB
+     * before restoring.  Note that this recomputes hflags and mem_idx.
+     */
+    env->msr ^= env->msr_mask & ~((1ULL << MSR_TGPR) | MSR_HVB);
+    ppc_store_msr(env, msr);
+}
+
 static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
 {
     PowerPCCPU *cpu = opaque;
@@ -21,7 +33,6 @@ static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
     int32_t slb_nr;
 #endif
     target_ulong xer;
-    target_ulong msr;
 
     for (i = 0; i < 32; i++) {
         qemu_get_betls(f, &env->gpr[i]);
@@ -117,13 +128,7 @@ static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
     qemu_get_sbe32(f); /* Discard unused mmu_idx */
     qemu_get_sbe32(f); /* Discard unused power_mode */
 
-    /*
-     * Invalidate all supported msr bits except MSR_TGPR/MSR_HVB
-     * before restoring.  Note that this recomputes hflags and mem_idx.
-     */
-    msr = env->msr;
-    env->msr ^= env->msr_mask & ~((1ULL << MSR_TGPR) | MSR_HVB);
-    ppc_store_msr(env, msr);
+    post_load_update_msr(env);
 
     return 0;
 }
@@ -343,7 +348,6 @@ static int cpu_post_load(void *opaque, int version_id)
     PowerPCCPU *cpu = opaque;
     CPUPPCState *env = &cpu->env;
     int i;
-    target_ulong msr;
 
     /*
      * If we're operating in compat mode, we should be ok as long as
@@ -417,13 +421,7 @@ static int cpu_post_load(void *opaque, int version_id)
         ppc_store_sdr1(env, env->spr[SPR_SDR1]);
     }
 
-    /*
-     * Invalidate all supported msr bits except MSR_TGPR/MSR_HVB
-     * before restoring.  Note that this recomputes hflags and mem_idx.
-     */
-    msr = env->msr;
-    env->msr ^= env->msr_mask & ~((1ULL << MSR_TGPR) | MSR_HVB);
-    ppc_store_msr(env, msr);
+    post_load_update_msr(env);
 
     return 0;
 }
-- 
2.25.1



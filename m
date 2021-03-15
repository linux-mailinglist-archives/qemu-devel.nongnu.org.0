Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B89C033C659
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:06:56 +0100 (CET)
Received: from localhost ([::1]:36980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsYJ-0000Ez-PF
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsEV-00079O-Hs
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:46:27 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:38760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsES-0001Zn-8V
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:46:27 -0400
Received: by mail-oi1-x231.google.com with SMTP id v192so27925124oia.5
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 11:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rHSsmMGgFTbVP+9XKxjAVaBht/aShtydPxFkUYIpqOM=;
 b=gO66qMzZIYFpYve6KSFi/YLxFvc7XJmGWjJWe8D01+6j7MjvC5lr6kMrlXwDwqfwCb
 rHQPOmP+0RtVp6CcjQDqqsWwoHl0n03LbpF9CJ6cmaQs0J34WFfr5FcVLAv77wysG/F3
 mPqtaPDJ6qyc8MzQjuNuqdJ7tBdU0Lw9bQYzxWKjo6L+/q46IEP1lVGHShZ20hUaUeFd
 MN8eML9vpm9d5UVqX5ZyOi7VohChly3VO0KQSmeKrvQKheepzcdJt0RO6pfbvoqEuP7r
 VjVHPlVzsx4Sh17rHPqEfMUVhcjm7YC/YnmRTqbxTu+64rCDW4RYpdXaxQ5Nvs2yPyBV
 7xsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rHSsmMGgFTbVP+9XKxjAVaBht/aShtydPxFkUYIpqOM=;
 b=kuHgnwPDUHlm/kCHyIDWGDYz4XfLnAdE376YIY+lEMS0Tgfb+6FE6g2MU+wIq2kF+K
 Gq9+LYmeaASX7lHV0GPui6OjpcdaFk/LnuWn4nvay1+tmMSIHIPu8USyjbZXvb3EFmpp
 X9hQWtUe71B6L5xNzO0DhHqZiKlXVjjF5af8U5g2L+heUqYm8uRW5Z33FwmL7mr+w1Tq
 mVgFli39+FN3HIgIhlfAzZUvQIBtiZyeQ3lioIaK0a5i2zvaFYG4JiSD4B2SarmWIwyW
 AEKMMRYxxb8gtbKmEjeIEzmoCbNqxEYbF4nvYaCDyWELGPx9teB+UPsEzhZHjSdlCoaD
 k/dA==
X-Gm-Message-State: AOAM530zHOitAbp12BMyTZ+4ccbektAgXWQLkYg10Tvh53QdV4JRADBL
 JcSiuQ4co38sxpP1gup01l90CPwYA6l3gBX1
X-Google-Smtp-Source: ABdhPJzQVBXlAu0Rnl/jepDpiZLh2Mbmo41lxm80zDANXdkQQHIN8AxVSRqg2gDDFvjfkj/5eGP98A==
X-Received: by 2002:a05:6808:14c8:: with SMTP id
 f8mr367819oiw.55.1615833983197; 
 Mon, 15 Mar 2021 11:46:23 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id o25sm7519851otk.11.2021.03.15.11.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 11:46:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/17] target/ppc: Retain hflags_nmsr only for migration
Date: Mon, 15 Mar 2021 12:46:03 -0600
Message-Id: <20210315184615.1985590-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315184615.1985590-1-richard.henderson@linaro.org>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
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



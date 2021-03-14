Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C3433A74E
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 19:11:51 +0100 (CET)
Received: from localhost ([::1]:59130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLVDR-0003Sz-1Q
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 14:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLV1Z-0002P2-Ie
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:59:33 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:45975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLV1S-00029i-Re
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:59:33 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id t16so6733242qvr.12
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 10:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/W2WFobHDD4oLw5DS+3Y+2H+mE4fKJy/+HfV/Ly0jXA=;
 b=alFHopLVEKxq26J+vRxd1mQcS4GyHPp9Zka57dPHHaVIogBVyq0tTrLeQQ8klO4can
 gt6/JWdaB3vR1T9rLgDr1W5n7vAzSuJWoxPzpyegIIzy9EZbON/UfpV4tfKjY79ZsXgc
 QsZgOpU61aB9eOByXPneScnTKN43iIvMNpXWYSNCb2rD+0uR6BRVdmdP9aAZ4c33C6BT
 6THBBh35h1ZJGpmvJjfOn715PcxBUZeCv43YwyuGlx4jGsX+ZDCZihwmPoJ39SEsmybx
 ypV69QRX++DR29AQiTn4898xDJo7s1sVo5GinVBAxadii+qr+rFpGSAhhH92olACIuJ9
 UGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/W2WFobHDD4oLw5DS+3Y+2H+mE4fKJy/+HfV/Ly0jXA=;
 b=FXt0OByRb5Al1hy7NEwvvtFxrNkXynCSJJ9aRJjytktT9TQjTuZPfxXBormV4Olyy8
 0fqYzefOuR9k1lfAlB1G4cv/tCLcZQ/ZIYxUZGxE3wGQXUf0lIOgGrE5/Bq6DbOyYD45
 dfqa3iSVpxaVmd3lxx5HwiE9wsigoWrfbx3PjzzH9mGbzvZUe3W/6QtO69yS67eH0lCT
 ouhFUp0V4eMSkVaxvL0DDxShQxliJG7iP8cxg1pOceGgIUsUeaSHXtUe8wBsZ1qnJJwl
 p6EgfJ6qcwR7n4h12z3QoTCOXiXj7uP6XnO1JQ1IY0DtI5ka1vG0nko67p0gFep1/mWz
 VIFg==
X-Gm-Message-State: AOAM533iZ8t82r5Za+hhksbL2JTd5e9HP4ImNc9SjzKCxryrIjAXgT1z
 p6PjRYMRB6cX5suc2hBqIC7boVHiN5rwIk51
X-Google-Smtp-Source: ABdhPJwgs/jpXQgl+xs/83+sLTybR4srVsOQ+aFixx96D0zduJ77FPnwvT/x3BVPqaB0H+BX6TilkA==
X-Received: by 2002:a05:6214:18d2:: with SMTP id
 cy18mr21305948qvb.50.1615744758233; 
 Sun, 14 Mar 2021 10:59:18 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id c127sm10216240qkd.87.2021.03.14.10.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 10:59:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/16] target/ppc: Reduce env->hflags to uint32_t
Date: Sun, 14 Mar 2021 11:58:58 -0600
Message-Id: <20210314175906.1733746-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314175906.1733746-1-richard.henderson@linaro.org>
References: <20210314175906.1733746-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
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

It will be stored in tb->flags, which is also uint32_t,
so let's use the correct size.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h         | 4 ++--
 target/ppc/misc_helper.c | 2 +-
 target/ppc/translate.c   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 39f35b570c..2abaf56869 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1128,8 +1128,8 @@ struct CPUPPCState {
     bool resume_as_sreset;
 #endif
 
-    /* These resources are used only in QEMU core */
-    target_ulong hflags;
+    /* These resources are used only in TCG */
+    uint32_t hflags;
     target_ulong hflags_compat_nmsr; /* for migration compatibility */
     int immu_idx;     /* precomputed MMU index to speed up insn accesses */
     int dmmu_idx;     /* precomputed MMU index to speed up data accesses */
diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
index 63e3147eb4..b04b4d7c6e 100644
--- a/target/ppc/misc_helper.c
+++ b/target/ppc/misc_helper.c
@@ -199,7 +199,7 @@ void helper_store_hid0_601(CPUPPCState *env, target_ulong val)
     if ((val ^ hid0) & 0x00000008) {
         /* Change current endianness */
         hreg_compute_hflags(env);
-        qemu_log("%s: set endianness to %c => " TARGET_FMT_lx "\n", __func__,
+        qemu_log("%s: set endianness to %c => %08x\n", __func__,
                  val & 0x8 ? 'l' : 'b', env->hflags);
     }
 }
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index a9325a12e5..a85b890bb0 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7657,7 +7657,7 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                  env->nip, env->lr, env->ctr, cpu_read_xer(env),
                  cs->cpu_index);
     qemu_fprintf(f, "MSR " TARGET_FMT_lx " HID0 " TARGET_FMT_lx "  HF "
-                 TARGET_FMT_lx " iidx %d didx %d\n",
+                 "%08x iidx %d didx %d\n",
                  env->msr, env->spr[SPR_HID0],
                  env->hflags, env->immu_idx, env->dmmu_idx);
 #if !defined(NO_TIMER_DUMP)
-- 
2.25.1



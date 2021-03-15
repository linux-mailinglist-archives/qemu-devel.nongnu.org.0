Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C87C833C65D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:07:35 +0100 (CET)
Received: from localhost ([::1]:40730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsYw-0001rm-SK
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsEX-0007Dv-FE
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:46:29 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:40641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsEV-0001bt-J5
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:46:29 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 101-20020a9d04ee0000b02901b506659320so5632806otm.7
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 11:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/W2WFobHDD4oLw5DS+3Y+2H+mE4fKJy/+HfV/Ly0jXA=;
 b=mxm7evbxEvcuoPGM8bDrxGda5wWcmtqY7MFSCxwrDyYwQ3OiVwyPQ9JN2TD7PFMlsx
 prlnvKBnnk/6nzHwTTwf+yzlM+llHdI6DWvovSrOQ7ukumQ3YwheD/rM79xSszZAtDus
 16Un9aSAAKHRMk53nt1bb/4RB0lB2bIZ1seOgzjpmkWL3ahftv1Xmwm+3k3ddcVHe1Q0
 POB7O+r7a9g7jUDTrExr3Fx72VseQ5K7g0dKtsbs3lTRpnBDLqVpgvTZhUAJLBzxxHQB
 +7xIDKxaGIBn+MU+6EU5sAwGkQbKX5nKDrrl2PC16ciIrBVVRVDaTkt/kRAgVgveKAZr
 uhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/W2WFobHDD4oLw5DS+3Y+2H+mE4fKJy/+HfV/Ly0jXA=;
 b=aavDjCZUPErnGo2ftKI+JquHwhlfu6+hrRDUxk3SAdbY1NUd7dts1g4eGA8QfjL6cz
 6FkunUG5nHYKtFvV2YhkN+j1MOAld4W4JzgbbQfu8lbHlEIRKEzTgDW/UB5mXb2ucu2E
 SaJS1lNFhC1Lww/BlVer6UP4uyLOp6s5KP+XpxWgkHCrhMguFLlPfXp+bTbn1dMMGG9u
 0o9uMysdlVAQd18PQy8O1QjRwNJe9wSpwEfXwYO4A4cM3fhSYSCT2kB4EgIeCr2XQKnV
 5hmeA9hQPzZR3sY/id87hzkN879QGZ/BYJEx4i2ci3mIxHLEic71BucAgeyruLwp0Cpy
 avQw==
X-Gm-Message-State: AOAM531gZJp3GhCZt+n7Pg/0Xiv9FNmnWvjQAmySWlYIRE9UO8Agurms
 JvenYbuGnhvnAuKecDDko6OKPZc4CjkNglID
X-Google-Smtp-Source: ABdhPJwtf5p1imdIIGvgd/TzsUmdK7WOW0IZLdGpj4ys1UHlsfnxRukrBzqoFQ7XLaM3dvK4dpp7xw==
X-Received: by 2002:a05:6830:1352:: with SMTP id
 r18mr393778otq.283.1615833986376; 
 Mon, 15 Mar 2021 11:46:26 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id o25sm7519851otk.11.2021.03.15.11.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 11:46:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/17] target/ppc: Reduce env->hflags to uint32_t
Date: Mon, 15 Mar 2021 12:46:06 -0600
Message-Id: <20210315184615.1985590-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315184615.1985590-1-richard.henderson@linaro.org>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
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



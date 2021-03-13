Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DD0339AB3
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 02:05:32 +0100 (CET)
Received: from localhost ([::1]:47348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKsih-0004fr-Aj
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 20:05:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKsdx-0007Fk-5t
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 20:00:37 -0500
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:35634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKsds-0003Rf-6o
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 20:00:36 -0500
Received: by mail-qv1-xf31.google.com with SMTP id x27so5173202qvd.2
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 17:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/W2WFobHDD4oLw5DS+3Y+2H+mE4fKJy/+HfV/Ly0jXA=;
 b=EM5cdiAWwlilEeFou6WNHpqta05rTxVaEosVKCI7nAL+oGXjQxX111pei2XGYCmC34
 10HPtl+AddPkUWcGrsEd3BfH4KI9/u1NGs1lD89/DgCbAjybybNhSZ2maj7Q0mVIc2TQ
 CWB6ZpI4bihV15o8TjovYHP5Hknt0Wnfbu+kGe5aDZ2wz/18Lbqz+NbgnJfQC0PYSb90
 Z1Vj2qEaY8w4ZvrF0VjC+ohPJmSXlEe3hynqzvElAcfTS7ZTXSoTHEUp7bPzrQBDW0XB
 VnVAcfoMd8fhDLnafScRsGXn8YFVvLQINxl352mfWJP/L2SD30ujNHMdFgadimwkGRgR
 qy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/W2WFobHDD4oLw5DS+3Y+2H+mE4fKJy/+HfV/Ly0jXA=;
 b=Tmw4rdLtexbwLDDcYYs6BGCDe2GTXkm2Ck0NhniTUKooVVJJr6zLRbPWIWg4EQt5c5
 6KHa47OY3kBkxHluG201dBnXLzDFDCWeO16SVJWY5DaSzEmeYOeIAUIxhKINae9eyCCo
 AzIKBZDPWWQFIOHxvOFWlprgK1/TSQrG6Dxn24RVV1tcv63OarmKF6P3MI7U6tBDj3mA
 tSvSPmKZQ+6Nh+FOlSpP0ynGlmvR9uOQjM/Sf5fivAX0+IJEhogsRibxVAUJAivIC9zN
 7gpytdiTMFY7FvWJcpOramI0H+fPJe/qZ820nKbBQDiIFPqq/IRbbb38oxLLR8+Mn4l0
 h1+g==
X-Gm-Message-State: AOAM531fruI4lgg2RTQnmeaLwvJr+ZXcALRKXXlRRCpsBFsAEXargwV4
 ookB06r2nJxcbpx1CrsWL9BoBRuQJMKXelKj
X-Google-Smtp-Source: ABdhPJyQZQvp248xqSXJZPRkQl2X4bkxfXZrE2Pir3545TygL/NkhPVJxWRiobTQLKiFD7bw+TKeKg==
X-Received: by 2002:a0c:f349:: with SMTP id e9mr914589qvm.59.1615597231220;
 Fri, 12 Mar 2021 17:00:31 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id l129sm5602078qkd.76.2021.03.12.17.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 17:00:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/15] target/ppc: Reduce env->hflags to uint32_t
Date: Fri, 12 Mar 2021 19:00:11 -0600
Message-Id: <20210313010018.819153-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210313010018.819153-1-richard.henderson@linaro.org>
References: <20210313010018.819153-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf31.google.com
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



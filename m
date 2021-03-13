Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E37339AB9
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 02:10:03 +0100 (CET)
Received: from localhost ([::1]:60310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKsn4-00021R-SZ
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 20:10:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKsdy-0007I4-8z
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 20:00:38 -0500
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:33634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKsdt-0003SK-5g
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 20:00:37 -0500
Received: by mail-qt1-x831.google.com with SMTP id 94so5298010qtc.0
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 17:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LL8bkt3cpcyBMDK/LZ6QT2j+SFhG/YMWEf75uL1t8Es=;
 b=Cv0+ZDFMtf3mkAXi7k6pq5yzDBAlB9JHPCaP8v5C8BZQ/WZWKSQEXKisMQRYXKcd2T
 y0rpptNNXbQ6H1VCwywkMMEtPlPhb3MsROurPwixxMvQzSon2SUqVHe1Eb61NvLAYjnu
 dYRLsCTg77LelJh+9mvOcLaAbq2mJ21gxSmsEAMs5BXhW2PhNqPKGhbReEjkZTN4uFKP
 NjKa+iPrnUZAqbEwMegn3pegYs5tiHxFS7OhV0y+3NmjenJRxqyW8+W6ai3axyPHufWX
 rjXB32mg/6gyKNKpp1p+3CGHkE9Pr3hd954v+lz2Gmxiz5wUqFVsna+L3pBt8iry0ZXP
 eGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LL8bkt3cpcyBMDK/LZ6QT2j+SFhG/YMWEf75uL1t8Es=;
 b=m3s9OKXrSSsVsbuj3iiY8ABlU2+fLU7pEOq5NukyA9VzkSVa0fwLuJavp7L3hzUCb2
 DnxbnxHOa0cQ6rr/8wEcS6eDaTRO84wUMp/ChZjGi9ctdNY3mCdNaLc/VIbXQB4M5oM6
 YF35G600AXFeEIx+JmrA8P3PnfESkLgQLdp1Ev5wTuFp35MOQTnfuXMqXQ7DRU5Qs5dr
 hn5yY4RIKPpwh8dlAempdYgqvCveK471crOpPSgsI5kSlHzZxmJQ2OHJci8r9ttNC8qw
 MFBmDkCLJt5bdDCFS76xtU0Jgbq47zFTKxcTf7GQmWp0Zu9EiRMNxAEN1pM6Xfsza5Oi
 +DjQ==
X-Gm-Message-State: AOAM5302RVf0mCColnSC07J/sx5WL2X2iWoEraRfcpKPmkJQmZprdxwO
 tlAyzevQzfYkjoaWfGjePzWU9ha4Q+YKQ6yf
X-Google-Smtp-Source: ABdhPJzdvwepjG7ai342RpDV9UrX23QIVJtj07B1j4L7hpcA3q2Niyhf1tbHnqQ9r/Z5TeawKiCusQ==
X-Received: by 2002:ac8:4702:: with SMTP id f2mr2374395qtp.128.1615597232221; 
 Fri, 12 Mar 2021 17:00:32 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id l129sm5602078qkd.76.2021.03.12.17.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 17:00:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/15] target/ppc: Put dbcr0 single-step bits into hflags
Date: Fri, 12 Mar 2021 19:00:12 -0600
Message-Id: <20210313010018.819153-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210313010018.819153-1-richard.henderson@linaro.org>
References: <20210313010018.819153-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x831.google.com
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

Because these bits were not in hflags, the code generated
for single-stepping on BookE was essentially random.
Recompute hflags when storing to dbcr0.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/helper_regs.c | 20 +++++++++++++++-----
 target/ppc/misc_helper.c |  3 +++
 target/ppc/translate.c   | 11 -----------
 3 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 0a746bffd7..c735540333 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -107,11 +107,21 @@ void hreg_compute_hflags(CPUPPCState *env)
         hflags |= le << MSR_LE;
     }
 
-    if (ppc_flags & POWERPC_FLAG_BE) {
-        msr_mask |= 1 << MSR_BE;
-    }
-    if (ppc_flags & POWERPC_FLAG_SE) {
-        msr_mask |= 1 << MSR_SE;
+    if (ppc_flags & POWERPC_FLAG_DE) {
+        target_ulong dbcr0 = env->spr[SPR_BOOKE_DBCR0];
+        if (dbcr0 & DBCR0_ICMP) {
+            hflags |= 1 << HFLAGS_SE;
+        }
+        if (dbcr0 & DBCR0_BRT) {
+            hflags |= 1 << HFLAGS_BE;
+        }
+    } else {
+        if (ppc_flags & POWERPC_FLAG_BE) {
+            msr_mask |= 1 << MSR_BE;
+        }
+        if (ppc_flags & POWERPC_FLAG_SE) {
+            msr_mask |= 1 << MSR_SE;
+        }
     }
 
     if (msr_is_64bit(env, msr)) {
diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
index b04b4d7c6e..a5ee1fd63c 100644
--- a/target/ppc/misc_helper.c
+++ b/target/ppc/misc_helper.c
@@ -215,6 +215,9 @@ void helper_store_403_pbr(CPUPPCState *env, uint32_t num, target_ulong value)
 
 void helper_store_40x_dbcr0(CPUPPCState *env, target_ulong val)
 {
+    /* Bits 26 & 27 affect single-stepping */
+    hreg_compute_hflags(env);
+    /* Bits 28 & 29 affect reset or shutdown. */
     store_40x_dbcr0(env, val);
 }
 
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index a85b890bb0..7912495f28 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7923,17 +7923,6 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     if ((hflags >> HFLAGS_BE) & 1) {
         ctx->singlestep_enabled |= CPU_BRANCH_STEP;
     }
-    if ((env->flags & POWERPC_FLAG_DE) && msr_de) {
-        ctx->singlestep_enabled = 0;
-        target_ulong dbcr0 = env->spr[SPR_BOOKE_DBCR0];
-        if (dbcr0 & DBCR0_ICMP) {
-            ctx->singlestep_enabled |= CPU_SINGLE_STEP;
-        }
-        if (dbcr0 & DBCR0_BRT) {
-            ctx->singlestep_enabled |= CPU_BRANCH_STEP;
-        }
-
-    }
     if (unlikely(ctx->base.singlestep_enabled)) {
         ctx->singlestep_enabled |= GDBSTUB_SINGLE_STEP;
     }
-- 
2.25.1



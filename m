Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3253BB908
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 10:23:58 +0200 (CEST)
Received: from localhost ([::1]:48842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0JtV-0007Gi-69
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 04:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1m0Jo5-0006Pm-N9
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 04:18:21 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1m0Jo1-0005aU-KX
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 04:18:21 -0400
Received: by mail-wr1-x42c.google.com with SMTP id i8so21047940wrc.0
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 01:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r9h3lRGJRSnBCO7X87sinEBUmp1Vgja7lYk6khReouQ=;
 b=m7DEWrFTKlh//REaf6leq3ohfQgcRo+1LGmhazN3WXcizNcIO1a8ZGeLdUjkGlQoQT
 hPpGekZt2XXDB/kfAd3Pqw/4iSr8YPE94Ch2pCB1CZ0x8DheLfT1wTNpdMNpYio8XOGA
 emT9g/Rp3rjfLJSSrovBGkJOELKYYfGBn7uJNFDRmjTXXCClhzxbAxWNMEspNaK48JOV
 fTIKu4SEP1xsE2VJKNUN+Q27Nh25BqDQykXCAY1VcO0/2X1UzYMJP7RcgHSCmfOTiX6V
 xHyxWUwPwxORRUwP+c3z3TwORX7gEU0cfNymNBBBR1dLafeypNpKQ07TxSGgjnHUihDB
 G2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r9h3lRGJRSnBCO7X87sinEBUmp1Vgja7lYk6khReouQ=;
 b=V0AFsvfd3cRcIL8zqx/uABQVwvDHrIOSThJAEQHQUuFXGbqTCxICkQIdYWS4kfesmz
 7m/k0z1ZZZTk5+piPSMYLBFfPHq7R/PYujmA8TpjIl8W56+Ijv9GMutbhs1phce28w05
 y+WpqEeOXaBP9SY8qFUblIvN4fo81ikwUQnfHLUw8dthd+53yF0P2ANyqWhYAHtQLwHf
 1Jwdsjiav5HM3HrRSaiIRKUM5zoS2nX+V2aAOvm9jWmMYX4BeCMcdHuNqWNjOhpX2puv
 owRspmdbQlp25Q7Ujm/ed0LOp3ws/sMDJpTrAWNhmv8n3ZiyxiayS4X/gGlqDcQc+vAt
 AXdQ==
X-Gm-Message-State: AOAM533N3hOwgVZ+Q6AP8t2e3Z93x+lA0nbIIM1Epryx9s8e3P0GTcJC
 GBEhAzX2d2EZEqMR3y61O6pTDpVKnKqJtw==
X-Google-Smtp-Source: ABdhPJwZbtjM6H8ftbjFyfJrLG8aU4bYktPsd8TTRMOnnZD7Djr8NysuwFWhnznEQhEyTMEU0r/Rmw==
X-Received: by 2002:adf:d232:: with SMTP id k18mr3378317wrh.35.1625473093187; 
 Mon, 05 Jul 2021 01:18:13 -0700 (PDT)
Received: from localhost.localdomain ([37.160.151.142])
 by smtp.gmail.com with ESMTPSA id n5sm3662014wri.31.2021.07.05.01.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 01:18:12 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] target/i386: Added consistency checks for EFER
Date: Mon,  5 Jul 2021 10:18:01 +0200
Message-Id: <20210705081802.18960-4-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210705081802.18960-1-laramglazier@gmail.com>
References: <20210705081802.18960-1-laramglazier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=laramglazier@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

EFER.SVME has to be set, and EFER[63:16], EFER[9], EFER[7:5]
are reserved and must be zero.
In Addition the combinations
 * EFER.LMA or EFER.LME is non-zero and the processor does not support LM
 * non-zero EFER.LME and CR0.PG and zero CR4.PAE
 * non-zero EFER.LME and CR0.PG and zero CR0.PE
 * non-zero EFER.LME, CR0.PG, CR4.PAE, CS.L and CS.D
are all invalid.
(AMD64 Architecture Programmer's Manual, V2, 15.5)

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
---
 target/i386/cpu.h                   |  2 ++
 target/i386/tcg/sysemu/svm_helper.c | 39 +++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index f7fa5870b1..f5280b2951 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -464,6 +464,8 @@ typedef enum X86Seg {
 #define MSR_EFER_SVME  (1 << 12)
 #define MSR_EFER_FFXSR (1 << 14)
 
+#define MSR_EFER_RESERVED 0xffffffffffff02e0
+
 #define MSR_STAR                        0xc0000081
 #define MSR_LSTAR                       0xc0000082
 #define MSR_CSTAR                       0xc0000083
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 276c240f70..d652d6f9da 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -65,6 +65,41 @@ static inline void svm_load_seg_cache(CPUX86State *env, hwaddr addr,
                            sc->base, sc->limit, sc->flags);
 }
 
+static inline bool is_efer_invalid_state (CPUX86State *env)
+{
+    if (!(env->efer & MSR_EFER_SVME)) {
+        return true;
+    }
+
+    if (env->efer & MSR_EFER_RESERVED) {
+        return true;
+    }
+
+    if ((env->efer & (MSR_EFER_LMA | MSR_EFER_LME)) &&
+            !(env->features[FEAT_8000_0001_EDX] & CPUID_EXT2_LM)) {
+        return true;
+    }
+
+    if ((env->efer & MSR_EFER_LME) && (env->cr[0] & CR0_PG_MASK)
+                                && !(env->cr[4] & CR4_PAE_MASK)) {
+        return true;
+    }
+
+    if ((env->efer & MSR_EFER_LME) && (env->cr[0] & CR0_PG_MASK)
+                                && !(env->cr[0] & CR0_PE_MASK)) {
+        return true;
+    }
+
+    if ((env->efer & MSR_EFER_LME) && (env->cr[0] & CR0_PG_MASK)
+                                && (env->cr[4] & CR4_PAE_MASK)
+                                && (env->segs[R_CS].flags & DESC_L_MASK)
+                                && (env->segs[R_CS].flags & DESC_B_MASK)) {
+        return true;
+    }
+
+    return false;
+}
+
 void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
 {
     CPUState *cs = env_cpu(env);
@@ -277,6 +312,10 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
         cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
     }
 
+    if (is_efer_invalid_state(env)) {
+        cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
+    }
+
     switch (x86_ldub_phys(cs,
                       env->vm_vmcb + offsetof(struct vmcb, control.tlb_ctl))) {
     case TLB_CONTROL_DO_NOTHING:
-- 
2.25.1



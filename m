Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A77F3D126E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 17:30:38 +0200 (CEST)
Received: from localhost ([::1]:55002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6EBB-0005Ac-NA
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 11:30:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1m6E7u-0007Ms-O7
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 11:27:18 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:44613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1m6E7r-00047v-3X
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 11:27:13 -0400
Received: by mail-ed1-x52f.google.com with SMTP id l1so2865419edr.11
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 08:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vmJrqeHNro/WAYR3YPS5dBwEOyTd8DYwPa8hCABvMR8=;
 b=MDd0bk25MGOzM66JrJ/QCLWpMyXNqUg67r2Te7sgC9VtdiMtIpHxQscI1a1tXWxP3C
 3nN1BdUhOs173TQQJuvisdoXFJrGMyfAltW44RxlxZKh2fKxMw1cb3iuKY5YrQzIivlT
 ezlKjinFX8dEyJmhGnc4n22Ntl3tKqnlODU/+CPO0QYWGM7+o37NeQaQFxtncMatlqpC
 DBhwV7OPccJ3W3cgfKhA5O6P6VjimhiFc7f0Yg8W0na5lgZa0rD9aSbB5YITTUB9XX1L
 2BdYE3f08RPVwTIgNp2kxr70AtTQhSr7N/4halHL3eW18OIXzZI+aA1N4xyJbaV4vFR/
 Bsyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vmJrqeHNro/WAYR3YPS5dBwEOyTd8DYwPa8hCABvMR8=;
 b=Y+HDgUl6HhkzcoCGS+9x3pVnxxNqZQ8oFn4gQ7iP94Sg+rhLcjl5Sa9LUeKdF+BK3I
 yww9Z8aaKDIM04kfnxhEkOYf6xuLGRksXnXmG48eo9XnntGcIFemHJyz9IX9jEN/fOk8
 p+GJS6OTWNXLusKetWVivWyJT3gAkXAtEqQ8BpqLD+pDDUXYenlfVAxcynWaQ+LtbgnV
 vs7VWhgPegfR8iePZeSgJYciyFoYoxm5yilJYt7wMd5hlbFP6B1ctSGE/1+1MVkQa4jq
 gtgVBl8CvaMLf+uRYPRiOJpjPq/TvDr7CVkEZRjSsWV4EJ0IdcD85sLhUZOPdWXXy4Hg
 hMhg==
X-Gm-Message-State: AOAM531Inw7YedELx5oROfK9TuN8NXN6/LQ1OnUuHvh9p+c9gtHyfDD+
 9IgCanGWoSyrZ9D/vMRQLzmd0pCee6BognCY
X-Google-Smtp-Source: ABdhPJzLf2Whc/vyZxyzSk47Tjit2+M4yuVelhO9LAA2VVIT5jxXsGISNBFl4AGL400Yyd01mybuag==
X-Received: by 2002:a05:6402:b8f:: with SMTP id
 cf15mr48153618edb.286.1626881229636; 
 Wed, 21 Jul 2021 08:27:09 -0700 (PDT)
Received: from localhost.localdomain ([151.68.51.173])
 by smtp.gmail.com with ESMTPSA id r27sm10253217edb.66.2021.07.21.08.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 08:27:09 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] target/i386: Added consistency checks for EFER
Date: Wed, 21 Jul 2021 17:26:51 +0200
Message-Id: <20210721152651.14683-3-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721152651.14683-1-laramglazier@gmail.com>
References: <20210721152651.14683-1-laramglazier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=laramglazier@gmail.com; helo=mail-ed1-x52f.google.com
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

EFER.SVME has to be set, and EFER reserved bits must
be zero.
In addition the combinations
 * EFER.LMA or EFER.LME is non-zero and the processor does not support LM
 * non-zero EFER.LME and CR0.PG and zero CR4.PAE
 * non-zero EFER.LME and CR0.PG and zero CR0.PE
 * non-zero EFER.LME, CR0.PG, CR4.PAE, CS.L and CS.D
are all invalid.
(AMD64 Architecture Programmer's Manual, V2, 15.5)

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
---
 target/i386/cpu.h                   |  5 ++++
 target/i386/tcg/sysemu/svm_helper.c | 40 +++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 5d98a4e7c0..0b3057bdb6 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -466,6 +466,11 @@ typedef enum X86Seg {
 #define MSR_EFER_SVME  (1 << 12)
 #define MSR_EFER_FFXSR (1 << 14)
 
+#define MSR_EFER_RESERVED\
+        (~(target_ulong)(MSR_EFER_SCE | MSR_EFER_LME\
+            | MSR_EFER_LMA | MSR_EFER_NXE | MSR_EFER_SVME\
+            | MSR_EFER_FFXSR))
+
 #define MSR_STAR                        0xc0000081
 #define MSR_LSTAR                       0xc0000082
 #define MSR_CSTAR                       0xc0000083
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 00618cff23..b6df36d4e5 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -65,6 +65,42 @@ static inline void svm_load_seg_cache(CPUX86State *env, hwaddr addr,
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
+
 void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
 {
     CPUState *cs = env_cpu(env);
@@ -278,6 +314,10 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
     }
 #endif
 
+    if (is_efer_invalid_state(env)) {
+        cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
+    }
+
     switch (x86_ldub_phys(cs,
                       env->vm_vmcb + offsetof(struct vmcb, control.tlb_ctl))) {
     case TLB_CONTROL_DO_NOTHING:
-- 
2.25.1



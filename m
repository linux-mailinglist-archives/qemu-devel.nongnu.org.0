Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9919931431F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:41:01 +0100 (CET)
Received: from localhost ([::1]:40566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FDI-0004Fi-Ky
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:41:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCw-0003rv-Dj
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:22 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCs-0006Op-Ct
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:22 -0500
Received: by mail-wr1-x430.google.com with SMTP id v14so2807878wro.7
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HPHe7Vt+jCNPgmVLFMhvQHjgRggFRCcm+DPxxH2tOSs=;
 b=akffWxT0/TmOGPNPAuB/Ton5N/3lGdYCBuK3Lcys4M2ZTPsj+z4aiSZ7sOGareFIhn
 ubb0Xb7Ou3qlAxbiDQ6BQaUYQjMwjkHLMjIjj6zjkVaRFOoHZjs5LVWtGoPLQfcAbYbi
 xbrtWcAeg4VyOzJ+PGtK82K6wwZoA6+HyoaUd+Y1xqEz3TzymWq9nP6RvYTDBP4Sgqw6
 U2matbRKL+pCuF1NXQdHUpgxk+FHNVBLEmW2KZkcfpBEXvvmzg4oNPFRIZsZe5t62eEl
 EiY25PuBrPObcVD+Ovs/QiwZNPa6R7ilZIknK63ST8xAO82lT7SZ+fUHpJyFV3qkh6iM
 9k7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HPHe7Vt+jCNPgmVLFMhvQHjgRggFRCcm+DPxxH2tOSs=;
 b=rYhc8mOG8hi0JiJiEOcVc8ZEdV7eReupNKj1vA9YQfijg55EOnr+2jl9Ws4XZAab5s
 nrfncFif0g0pFANxmxA1HPpVkh6smc44sqU2A4c4DctQ4UyCbOn7gc6tIVhh4j8VAlXL
 vbouD/cB6EAl6zCWSWlt+mBZPcAMAR2/VI3HEXX3cFFHM49RluKMudIW/kp/yaeDD766
 e55sXsYDeka7zzbVZtB751uGS46s+HEEy3HlYJ/jSZYZYooyj3n8XTYrClhEAQqk7syN
 PEflWh3onZA4QcIIZ1Jt5dGFtDaZlABpIajUiZ5W4+KhMmSf31uYecJLev5su/baQzqQ
 wmcA==
X-Gm-Message-State: AOAM5316QU1MJtQtWJ8a6hEOhMVdt3hbWW5Y3JGqNw22rSlrEolrxv+2
 AOn4Sxw2S5Bx+aU7ModZjDG/8j95ndo1VQ==
X-Google-Smtp-Source: ABdhPJxHPaSD9u2qt5goF6fUTxd181xom5QCnkOfDUAJYWjFQWa1bKE/gmLdCJS1vUjWCNv681rvgA==
X-Received: by 2002:a5d:5185:: with SMTP id k5mr21726709wrv.40.1612808657163; 
 Mon, 08 Feb 2021 10:24:17 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:24:16 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 46/46] target/i386: Expose VMX entry/exit load pkrs control bits
Date: Mon,  8 Feb 2021 19:23:31 +0100
Message-Id: <20210208182331.58897-47-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Chenyi Qiang <chenyi.qiang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chenyi Qiang <chenyi.qiang@intel.com>

Expose the VMX exit/entry load pkrs control bits in
VMX_TRUE_EXIT_CTLS/VMX_TRUE_ENTRY_CTLS MSRs to guest, which supports the
PKS in nested VM.

Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
Message-Id: <20210205083325.13880-3-chenyi.qiang@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 4 ++--
 target/i386/cpu.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 0b0d65c21c..9c3d2d60b7 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1215,7 +1215,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             "vmx-exit-save-efer", "vmx-exit-load-efer",
                 "vmx-exit-save-preemption-timer", "vmx-exit-clear-bndcfgs",
             NULL, "vmx-exit-clear-rtit-ctl", NULL, NULL,
-            NULL, NULL, NULL, NULL,
+            NULL, "vmx-exit-load-pkrs", NULL, NULL,
         },
         .msr = {
             .index = MSR_IA32_VMX_TRUE_EXIT_CTLS,
@@ -1230,7 +1230,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             NULL, "vmx-entry-ia32e-mode", NULL, NULL,
             NULL, "vmx-entry-load-perf-global-ctrl", "vmx-entry-load-pat", "vmx-entry-load-efer",
             "vmx-entry-load-bndcfgs", NULL, "vmx-entry-load-rtit-ctl", NULL,
-            NULL, NULL, NULL, NULL,
+            NULL, NULL, "vmx-entry-load-pkrs", NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
         },
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index cc5a26f35b..8d599bb5b8 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -973,6 +973,7 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define VMX_VM_EXIT_CLEAR_BNDCFGS                   0x00800000
 #define VMX_VM_EXIT_PT_CONCEAL_PIP                  0x01000000
 #define VMX_VM_EXIT_CLEAR_IA32_RTIT_CTL             0x02000000
+#define VMX_VM_EXIT_LOAD_IA32_PKRS                  0x20000000
 
 #define VMX_VM_ENTRY_LOAD_DEBUG_CONTROLS            0x00000004
 #define VMX_VM_ENTRY_IA32E_MODE                     0x00000200
@@ -984,6 +985,7 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define VMX_VM_ENTRY_LOAD_BNDCFGS                   0x00010000
 #define VMX_VM_ENTRY_PT_CONCEAL_PIP                 0x00020000
 #define VMX_VM_ENTRY_LOAD_IA32_RTIT_CTL             0x00040000
+#define VMX_VM_ENTRY_LOAD_IA32_PKRS                 0x00400000
 
 /* Supported Hyper-V Enlightenments */
 #define HYPERV_FEAT_RELAXED             0
-- 
2.29.2



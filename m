Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEAC314281
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:04:29 +0100 (CET)
Received: from localhost ([::1]:39356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Edw-00019g-VI
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:04:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCN-00033S-KY
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:48 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCL-00066L-SK
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:47 -0500
Received: by mail-wr1-x436.google.com with SMTP id v14so2805909wro.7
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5+Qquv8OR22XOEyWZERU5+Z7g58iUqcyj2p9zxcpyRs=;
 b=BCbbI36F60SUgrK/cwkULiuW3yLypiE8SrciEOFI9ONSiv8WmELrgLf2oux8Dqqcou
 f9xjbayNjA5WqWrFi1NoSg0J7yKqQ+tM+vmfbSeKNoj3R3RQoW58qt/98VApcfK1ixbI
 ILJx6wBbU07/w8/mMylZ2CIYjSUxuyDXLoRUKJiV47s247e/bNPxHMDZqkZPozllFw3O
 j4f75in1VHffb5vNFAMc4FG9siqwq1FSJ5W3s4ZYapAQqEoHCYhdaQI6c9fP0Xwjne5d
 48medoSg1c+fKfNZiagW+wIBbvFY7+PK8EQdntaffNzcrn7mM/leaGNy0gW7D4kt/DDM
 wRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5+Qquv8OR22XOEyWZERU5+Z7g58iUqcyj2p9zxcpyRs=;
 b=Ulsw9WF6WdTTD+pQbJX2RUtj4txQFgbxgaIkOXVP3V8SMwXdF5ENzlrGJeN/vUpCus
 im3bAZGwPibkcV00RzU1+aJdWYhA44Um5PGklALuiBQ9ZY6sfjBsS5OYmaJlTj/ESKut
 dAoXcdOtf7KOYnSfJfUtZfO9ucyD4+Q7NbU620zlbWoqey50weAFGSnctsgzuOjYm4mf
 ZV94Z1D7G71tRyO5x/QAqJlDncOVoxUMm+/XlS+TZauWg+DtsN1MC+KHweRIsF7PzjbH
 EVhCNXpyt2CZi4n3r4OPj/KnwNam7/iGY3oBaZC/gI1p7bCHdAW/MOx6tEz8vXxJvPoJ
 AtCQ==
X-Gm-Message-State: AOAM531M4aEXOFjb9AJn/n+yuT/Hcj2R+0pGMCOe+yYidinicWVtdLiL
 GxnWT1yk3X92KX3f1o3PBe1DNyw/ohZmwA==
X-Google-Smtp-Source: ABdhPJyqDffqbXNbT5XAGup+ZfAWUu0SRjKjx0hlhO931CqQZDffjTBgOcEHR8HdWAIf7TM1rg1HsA==
X-Received: by 2002:adf:dd81:: with SMTP id x1mr8406954wrl.233.1612808624586; 
 Mon, 08 Feb 2021 10:23:44 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:23:44 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/46] x86/cpu: Populate SVM CPUID feature bits
Date: Mon,  8 Feb 2021 19:22:57 +0100
Message-Id: <20210208182331.58897-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
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
Cc: Wei Huang <wei.huang2@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wei Huang <wei.huang2@amd.com>

Newer AMD CPUs will add CPUID_0x8000000A_EDX[28] bit, which indicates
that SVM instructions (VMRUN/VMSAVE/VMLOAD) will trigger #VMEXIT before
CPU checking their EAX against reserved memory regions. This change will
allow the hypervisor to avoid intercepting #GP and emulating SVM
instructions. KVM turns on this CPUID bit for nested VMs. In order to
support it, let us populate this bit, along with other SVM feature bits,
in FEAT_SVM.

Signed-off-by: Wei Huang <wei.huang2@amd.com>
Message-Id: <20210126202456.589932-1-wei.huang2@amd.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c |  6 +++---
 target/i386/cpu.h | 24 ++++++++++++++----------
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index e775e9abb5..ff25ad6f6c 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -926,11 +926,11 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             "npt", "lbrv", "svm-lock", "nrip-save",
             "tsc-scale", "vmcb-clean",  "flushbyasid", "decodeassists",
             NULL, NULL, "pause-filter", NULL,
-            "pfthreshold", NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
+            "pfthreshold", "avic", NULL, "v-vmsave-vmload",
+            "vgif", NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
+            "svme-addr-chk", NULL, NULL, NULL,
         },
         .cpuid = { .eax = 0x8000000A, .reg = R_EDX, },
         .tcg_features = TCG_SVM_FEATURES,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d23a5b340a..b39ec505de 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -670,16 +670,20 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define CPUID_EXT3_PERFCORE (1U << 23)
 #define CPUID_EXT3_PERFNB  (1U << 24)
 
-#define CPUID_SVM_NPT          (1U << 0)
-#define CPUID_SVM_LBRV         (1U << 1)
-#define CPUID_SVM_SVMLOCK      (1U << 2)
-#define CPUID_SVM_NRIPSAVE     (1U << 3)
-#define CPUID_SVM_TSCSCALE     (1U << 4)
-#define CPUID_SVM_VMCBCLEAN    (1U << 5)
-#define CPUID_SVM_FLUSHASID    (1U << 6)
-#define CPUID_SVM_DECODEASSIST (1U << 7)
-#define CPUID_SVM_PAUSEFILTER  (1U << 10)
-#define CPUID_SVM_PFTHRESHOLD  (1U << 12)
+#define CPUID_SVM_NPT             (1U << 0)
+#define CPUID_SVM_LBRV            (1U << 1)
+#define CPUID_SVM_SVMLOCK         (1U << 2)
+#define CPUID_SVM_NRIPSAVE        (1U << 3)
+#define CPUID_SVM_TSCSCALE        (1U << 4)
+#define CPUID_SVM_VMCBCLEAN       (1U << 5)
+#define CPUID_SVM_FLUSHASID       (1U << 6)
+#define CPUID_SVM_DECODEASSIST    (1U << 7)
+#define CPUID_SVM_PAUSEFILTER     (1U << 10)
+#define CPUID_SVM_PFTHRESHOLD     (1U << 12)
+#define CPUID_SVM_AVIC            (1U << 13)
+#define CPUID_SVM_V_VMSAVE_VMLOAD (1U << 15)
+#define CPUID_SVM_VGIF            (1U << 16)
+#define CPUID_SVM_SVME_ADDR_CHK   (1U << 28)
 
 /* Support RDFSBASE/RDGSBASE/WRFSBASE/WRGSBASE */
 #define CPUID_7_0_EBX_FSGSBASE          (1U << 0)
-- 
2.29.2




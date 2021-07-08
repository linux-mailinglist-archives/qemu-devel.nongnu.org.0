Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6943C162F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:41:08 +0200 (CEST)
Received: from localhost ([::1]:36514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1W9D-0005dR-Fn
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:41:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1VnB-0001AV-U6
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:23 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:39637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vn9-0008Kq-DF
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:21 -0400
Received: by mail-ej1-x633.google.com with SMTP id ga42so10258479ejc.6
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=94ZgvUoaV4rrbqz1c29cq+0EjAl0jsTM0BgmjnATI8E=;
 b=B/mX2xLyP8JrimErU8/gkvN/8gKCCvpj5RanSXcOsbeH8zCbpQzQZQPfVl1DRex+sr
 kzwk0IPtHo/D/z7a09CffgkruxnJi2aT/lfHBx/1KR1Qrg2AKg6RhqXhqNEAhZAxfBuJ
 X7TzZAWzzWx8nSPxgFsWi/Ru708sHxikCYiXNIaX2EE3zxamETMLFxc0TUhybntnrlhn
 OH829ofZkUaPYsVmwntTtXkEq9ivIeWsgrRyBdhH2Is6FKBGUQ+PmUW8bKMFmEEwFkFv
 KJwJMOmwKETG9ahr/zDNEV40oPbNlTYfbu5IVXzcJkmiaF1EfUisdL9EJziL/4l71i8H
 Ojqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=94ZgvUoaV4rrbqz1c29cq+0EjAl0jsTM0BgmjnATI8E=;
 b=nmJfBMzDLuwWVrjD7tMjhrYS/5ilSNweJKxD3ogo0rkbm5vGIFsuTvtU2lvEts5Ffn
 rHEVi1tm7oS1mPAHm2sASTMXdN9vK+2+/8DxN6eTnF1h5O1TJ1iACkQnJkvfFIe18AuP
 37O01UGesDF2m2TMLUhj8IxoVubuT3RrT7C/K5iuQVX9uC5riaqC07TldyBbvwPcIRi/
 2dnZg7d3GhRyE0bf+nbaLvt/wdTAAd/NEM5FBWpM3Tlh/61HQ6RqnI7RV5L0Nmh9OnGG
 n24rpNGjlYywZ2cZEXaDbfc5w92wosImPSBlqirj4TIf3cOJSK0C3/t1MjtMI4Gjm3Y+
 aaPg==
X-Gm-Message-State: AOAM532hvAu2SvpCdL9akrRFlgJTev2oGri7vylg0Blu03uCK71u+8fq
 3/cs+u1STHbAW9/cXUgS3/Jep1X28VY=
X-Google-Smtp-Source: ABdhPJyH6gVUmOYcY6El1gN//0Fbmjq3AO0GF44VBOdGbwRTEcfh5ZCkvE/B+Ps4dukMikhJINobdA==
X-Received: by 2002:a17:906:744:: with SMTP id
 z4mr31689238ejb.347.1625757498156; 
 Thu, 08 Jul 2021 08:18:18 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:18:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 40/48] target/i386: Added DR6 and DR7 consistency checks
Date: Thu,  8 Jul 2021 17:17:40 +0200
Message-Id: <20210708151748.408754-41-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lara Lazier <laramglazier@gmail.com>

DR6[63:32] and DR7[63:32] are reserved and need to be zero.
(AMD64 Architecture Programmer's Manual, V2, 15.5)

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
Message-Id: <20210705081802.18960-3-laramglazier@gmail.com>
[Ignore for 32-bit builds. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/svm.h                   | 2 ++
 target/i386/tcg/sysemu/svm_helper.c | 9 ++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/i386/svm.h b/target/i386/svm.h
index adc058dc76..4bde9f3475 100644
--- a/target/i386/svm.h
+++ b/target/i386/svm.h
@@ -140,6 +140,8 @@
 #define SVM_MSRPM_SIZE		(1ULL << 13)
 #define SVM_IOPM_SIZE		((1ULL << 13) + 1)
 
+#define SVM_DR_RESERVED_MASK 0xffffffff00000000ULL
+
 struct QEMU_PACKED vmcb_control_area {
 	uint16_t intercept_cr_read;
 	uint16_t intercept_cr_write;
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index fa701829e5..047f31628e 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -269,7 +269,14 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
     env->dr[6] = x86_ldq_phys(cs,
                           env->vm_vmcb + offsetof(struct vmcb, save.dr6));
 
-    /* FIXME: guest state consistency checks */
+#ifdef TARGET_X86_64
+    if (env->dr[6] & SVM_DR_RESERVED_MASK) {
+        cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
+    }
+    if (env->dr[7] & SVM_DR_RESERVED_MASK) {
+        cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
+    }
+#endif
 
     switch (x86_ldub_phys(cs,
                       env->vm_vmcb + offsetof(struct vmcb, control.tlb_ctl))) {
-- 
2.31.1




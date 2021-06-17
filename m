Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 309283AB07C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:57:31 +0200 (CEST)
Received: from localhost ([::1]:59658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltomA-0007bM-7l
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNY-000339-MP
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:04 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:44932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNW-0006LY-V2
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:04 -0400
Received: by mail-ej1-x62c.google.com with SMTP id gt18so8689641ejc.11
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zu0RUwB1p19Fagtd8xyL4/0jgFufKWq1IEEH4S5GC2c=;
 b=ZVTrQj9EgxNG/+/9+oq9y8opSvQAdCTmJleSeiSDMvWXhSa98q+8t8/wSRgEVWrKAC
 nBW0nvjwC6UH8jgqLZJm3WPQlnp0vnYvj/0MvTjpdKBS3EQsctn7GIxYtxymtoEsh25P
 7QDwoF4wHBaT1nepVgw0VrnsUtfYznK2QVqIgsQmLJ1yz0cR/PKAWMxcCZtA4/s3B+i+
 4IrmhGA5j0bH8mMMkOcDkmeb8xFywyfx4+wvITUYyez0P49tZV4hNN/yxPJrX1iKPVBC
 Hb7fKW2PkrCZYXU6d5n6nhz7DeHBv1mcZI7B5fqoS5KjnWtjCbMlXu91FZ6M5fq91tCU
 xLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zu0RUwB1p19Fagtd8xyL4/0jgFufKWq1IEEH4S5GC2c=;
 b=EdXLr3ku8dGc2hARRFwUBz9fiIACZAegWicFJDRP9XfBYj0WWgC3jFYWFttLu4fdbv
 QMpaMFnKYp2vnBvX1h7SMjRIW4rCh+O25/6ZJvyMeplcjU8iwfOVGP4lQ+OiN5uMVeT+
 gVspgxD9By9Y5FIqG2Iz9xnOpgV+tCTxAZlkmHdDd6g0njImyhNaR2Dx2/mVUctH89rH
 PzNFadZ/3nCYbhNrouPuKdM0jTgCh90OJUuX0TIa8M4YgGVBqllzuXq/YOGj8DhTrwFr
 dhuDaZkVInr5u8n+PrLJB2xrpjqF/88PKqQDLXPqtznav/djHTIKVmAawwJJI0oowLMr
 cxyA==
X-Gm-Message-State: AOAM533b72YAZ+erGP1G8W9PYsSj0gxNzqwQQa/wKyw83sIaQvTdLVEn
 2dJMfLgbkg4lO6P+5mvTOiT3NLTTMh4=
X-Google-Smtp-Source: ABdhPJwHeQ9QE8QWeugkKfGIR07QYL3HZKi6YqdNL2eHQYpfr+KkJ+RxrvaOwFMTjwlEOfI5AddcpQ==
X-Received: by 2002:a17:906:528b:: with SMTP id
 c11mr2984079ejm.156.1623922321540; 
 Thu, 17 Jun 2021 02:32:01 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:32:01 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 35/45] target/i386: Added consistency checks for VMRUN
 intercept and ASID
Date: Thu, 17 Jun 2021 11:31:24 +0200
Message-Id: <20210617093134.900014-36-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
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
Cc: Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lara Lazier <laramglazier@gmail.com>

Zero VMRUN intercept and ASID should cause an immediate VMEXIT
during the consistency checks performed by VMRUN.
(AMD64 Architecture Programmer's Manual, V2, 15.5)

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
Message-Id: <20210616123907.17765-3-laramglazier@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/sysemu/svm_helper.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 2f7606bebf..902bf03fc3 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -72,6 +72,7 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
     uint64_t nested_ctl;
     uint32_t event_inj;
     uint32_t int_ctl;
+    uint32_t asid;
 
     cpu_svm_check_intercept_param(env, SVM_EXIT_VMRUN, 0, GETPC());
 
@@ -154,9 +155,18 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
 
     nested_ctl = x86_ldq_phys(cs, env->vm_vmcb + offsetof(struct vmcb,
                                                           control.nested_ctl));
+    asid = x86_ldq_phys(cs, env->vm_vmcb + offsetof(struct vmcb,
+                                                          control.asid));
 
     env->nested_pg_mode = 0;
 
+    if (!cpu_svm_has_intercept(env, SVM_EXIT_VMRUN)) {
+        cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
+    }
+    if (asid == 0) {
+        cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
+    }
+
     if (nested_ctl & SVM_NPT_ENABLED) {
         env->nested_cr3 = x86_ldq_phys(cs,
                                 env->vm_vmcb + offsetof(struct vmcb,
-- 
2.31.1




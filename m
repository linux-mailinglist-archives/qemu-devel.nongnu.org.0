Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F583A9AAA
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 14:43:34 +0200 (CEST)
Received: from localhost ([::1]:46012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltUtJ-00018y-3y
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 08:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1ltUp9-0003bZ-7f
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 08:39:15 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:46844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1ltUp6-00069G-9r
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 08:39:15 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 h22-20020a05600c3516b02901a826f84095so1609752wmq.5
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 05:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ekrn13A6/U3zEOEcU318yRQykH0/TL88PUf0ufSa0Mw=;
 b=DzQnV+v5P/kDl/i3GdYWqaPmELnD0Xc9OT0HO0vt3Cp3Kl5g21DVO6YlrZSklfx33/
 Vg3m69D+9HCMtKZs1mqEqvHJ+FfwU62LUGTHbzfCponZ/RF4jSHb/4BayiX5qeD7s2/9
 boarhF0zzX5fbD0bv+sDtdDWiLD72C5XiConwgUE2FNSWJUqFAhVTHLGg1Kj1coumLiy
 V3Fx/4oX1rPJh9k0iYShxelBfGKJDYCTf2SnmRnQZ5ZOpeKUmXCPrVFRR0ZUZO5RuuCm
 T7kO88a6JI393N/GparLm1yfA6q+B6DRuamKCygjUrM4w3EtJeuTbx+svCVa3yvqAdjm
 2dpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ekrn13A6/U3zEOEcU318yRQykH0/TL88PUf0ufSa0Mw=;
 b=PolbpZiInDh4cRVaXoFSfl479XD7cstJqHJx+wBTX+DHwAiX3Isa7k8j0dRvusjd4s
 Lu6BCS5zb5FGFXrcF93vx5LRi7SOEoZ7Deo+0yHGltD+dKBbCy1JhLVnwxS5/RkukDnL
 7ekJlpPaEqn2Zq/BWQg4cIJR5mflp45Gd7kV9IRiAx863ohKO104+0PxJLpgSfZb5TdW
 hnWN8eUcF+JkUaXDDIrDemxapQfBOe8W+eGCJIVvrfjg/+13f4NiQwGh3Vz0tp1+hVgE
 jbiMW/AHOkOhRC2R3NFyfOKxbyIqLT3KfvqmjMpZgAt3RXGMrd5YHGsn5ekO+z9K9ysi
 I48w==
X-Gm-Message-State: AOAM530mv8WEKlg5uRtFZJwEG9DTqoHTA497Zm3+tPw+aMYmJzhiqaZd
 wjX6Tp+lbc/LZ+qovbo5kNq8+WKuym6EyQ==
X-Google-Smtp-Source: ABdhPJzSN2NcyHPICu5sR6bhDJFTmQQK/as3N2q1Ve8Q3MYju23X+2zpxfCh2Zdr2X8rLZKtGNYE1A==
X-Received: by 2002:a05:600c:4f4d:: with SMTP id
 m13mr11341536wmq.14.1623847150948; 
 Wed, 16 Jun 2021 05:39:10 -0700 (PDT)
Received: from localhost.localdomain ([82.197.173.73])
 by smtp.gmail.com with ESMTPSA id c12sm2330273wrr.90.2021.06.16.05.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 05:39:10 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] target/i386: Added consistency checks for VMRUN
 intercept and ASID
Date: Wed, 16 Jun 2021 14:39:05 +0200
Message-Id: <20210616123907.17765-3-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616123907.17765-1-laramglazier@gmail.com>
References: <20210616123907.17765-1-laramglazier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=laramglazier@gmail.com; helo=mail-wm1-x329.google.com
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

Zero VMRUN intercept and ASID should cause an immediate VMEXIT
during the consistency checks performed by VMRUN.
(AMD64 Architecture Programmer's Manual, V2, 15.5)

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
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
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 453BC3A5FC4
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 12:12:00 +0200 (CEST)
Received: from localhost ([::1]:51018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsjZX-0001Vk-CN
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 06:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1lsjWt-00059W-Hc
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 06:09:15 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:35414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1lsjWr-000447-MJ
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 06:09:15 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 k5-20020a05600c1c85b02901affeec3ef8so12663529wms.0
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 03:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ObF/ZgQFN9zjCXfOIGIVn098TNV5d0DYaS9kaxO+1to=;
 b=ULJSpRtTNUwssCXmGNd1POehg/U2jddkGHHwi2fhasQfp/Qye7fAsBZSf69vxI/9bx
 suEZsYZQ9UwN64/tb1dAH75uCztnWLvOX40gZcW7nDnMTXAuPMmfxINbh14VaAd0easc
 8ynayXdbFaZW+CCRYxyiMLFbpO4v5wjOgOrDUJ9T3XRWiFysHazv1Q+xYxg9zfB324rm
 +D8GRyeALPlhXVgATIGQRqyXRPQau6sc56kL1nwN69DrFfER8WhqCz3q6IsmlKsn6qYB
 JIdujP0ODEKmeWaxAYp7AAvuvQkKLqHdu4C8dRpgzj8zeuS2qxOZIzt0a9hal3i/46I3
 S4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ObF/ZgQFN9zjCXfOIGIVn098TNV5d0DYaS9kaxO+1to=;
 b=P806hqR5Ucwfwk8N7y6tWzOf/jaoViQvBppjiUHgWG+f5Ri+ig9s+coujAcR7/Q1gZ
 Bf0TKo0EiFFnnQ3RCjE1f5VEtJthwQH/cil0WR9K5xHiMA6XIIthKBm8tU3nOPZASMS7
 h6ymlsB+eI1mC/6Qq4XdrUsC1WyjmJzsYT1ky7L6ruPqdE90xiaSiYPYbA7bvg3b407c
 HCvA6GjPLdrRCua0Kj1eKMZL2cXM1zXieXeIZfNNtKSKzcmKBUyCVH9qRcXPkgqoVpDE
 3E92xn6ZxbRQUwmadtBXhSQ45hELDcGuRH405WCKHxUpvl5+txbYfdysRE1gRw+13xcA
 /bqg==
X-Gm-Message-State: AOAM533g0U82RPK2GNWEuYrC3pvSu4lUHwT3mvKT+RI8Z9TUgfjrzMs9
 ecpl4JwAOsAIDwUkB6+ixHscXba4tfCf5A==
X-Google-Smtp-Source: ABdhPJylDOhDCBqwgp5cRayYcD1KVqcKrNtZqBehWALAij0sI+N4/cXiWxFKxyIzQqZlA+m1s3lgmA==
X-Received: by 2002:a1c:2142:: with SMTP id h63mr15926613wmh.84.1623665352262; 
 Mon, 14 Jun 2021 03:09:12 -0700 (PDT)
Received: from localhost.localdomain ([37.161.140.231])
 by smtp.gmail.com with ESMTPSA id o18sm15752254wrx.59.2021.06.14.03.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 03:09:11 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] target/i386: Added consistency checks for VMRUN intercept
 and ASID
Date: Mon, 14 Jun 2021 12:09:00 +0200
Message-Id: <20210614100902.15860-2-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614100902.15860-1-laramglazier@gmail.com>
References: <20210614100902.15860-1-laramglazier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=laramglazier@gmail.com; helo=mail-wm1-x332.google.com
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
 target/i386/svm.h                   |  2 ++
 target/i386/tcg/sysemu/svm_helper.c | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/target/i386/svm.h b/target/i386/svm.h
index 87965e5bc2..1c55d4f829 100644
--- a/target/i386/svm.h
+++ b/target/i386/svm.h
@@ -135,6 +135,8 @@
 #define SVM_NPTEXIT_GPA     (1ULL << 32)
 #define SVM_NPTEXIT_GPT     (1ULL << 33)
 
+#define SVM_VMRUN_INTERCEPT (1ULL << 32)
+
 struct QEMU_PACKED vmcb_control_area {
 	uint16_t intercept_cr_read;
 	uint16_t intercept_cr_write;
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 9d671297cf..ff826fe11a 100644
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
 
+    if (!(env->intercept & SVM_VMRUN_INTERCEPT)) {
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



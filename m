Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D8F37A22F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:33:21 +0200 (CEST)
Received: from localhost ([::1]:50794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgNpQ-0005EJ-9H
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNX0-0001wk-EZ
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWn-0000mo-TR
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620720845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ezGmCMYOiCV40UrkNi9AVqDEoJB2ZgiXVLRY7j8GxSg=;
 b=F2gDAzKvW+mFY/Ki7hyHeZz1r0pQlTRTjTGUih8KQseiBEsp994TM+BXeKNMJbWrZbdSxo
 YTlzn3bL4dqSJzwyFvlRVeAs+33ynSAKq1zocKs4VBmGOp2pqxEuzW04kfmdC0hOtIwOZH
 RBqmHqxPZc0LVn8nLyOGkK32217TFsU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-qb6oLwwBMw6pFfRrdFkQyg-1; Tue, 11 May 2021 04:14:03 -0400
X-MC-Unique: qb6oLwwBMw6pFfRrdFkQyg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA3858189C9
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:14:02 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88FF16E51B
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:14:02 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/33] target/i386: move paging mode constants from SVM to cpu.h
Date: Tue, 11 May 2021 04:13:40 -0400
Message-Id: <20210511081350.419428-24-pbonzini@redhat.com>
In-Reply-To: <20210511081350.419428-1-pbonzini@redhat.com>
References: <20210511081350.419428-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will reuse the page walker for both SVM and regular accesses.  To do
so we will build a function that receives the currently active paging
mode; start by including in cpu.h the constants and the function to go
from cr4/hflags/efer to the paging mode.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.h                    |  8 ++++++++
 target/i386/svm.h                    |  5 -----
 target/i386/tcg/sysemu/excp_helper.c | 26 ++++++++++++++++++++++----
 target/i386/tcg/sysemu/svm_helper.c  | 13 +------------
 4 files changed, 31 insertions(+), 21 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 0b182b7a5f..dbebd67f98 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -303,6 +303,11 @@ typedef enum X86Seg {
 #define PG_ERROR_I_D_MASK  0x10
 #define PG_ERROR_PK_MASK   0x20
 
+#define PG_MODE_PAE      (1 << 0)
+#define PG_MODE_LMA      (1 << 1)
+#define PG_MODE_NXE      (1 << 2)
+#define PG_MODE_PSE      (1 << 3)
+
 #define MCG_CTL_P       (1ULL<<8)   /* MCG_CAP register available */
 #define MCG_SER_P       (1ULL<<24) /* MCA recovery/new status bits */
 #define MCG_LMCE_P      (1ULL<<27) /* Local Machine Check Supported */
@@ -2105,6 +2110,9 @@ static inline bool cpu_vmx_maybe_enabled(CPUX86State *env)
            ((env->cr[4] & CR4_VMXE_MASK) || (env->hflags & HF_SMM_MASK));
 }
 
+/* excp_helper.c */
+int get_pg_mode(CPUX86State *env);
+
 /* fpu_helper.c */
 void update_fp_status(CPUX86State *env);
 void update_mxcsr_status(CPUX86State *env);
diff --git a/target/i386/svm.h b/target/i386/svm.h
index b515b5ced4..87965e5bc2 100644
--- a/target/i386/svm.h
+++ b/target/i386/svm.h
@@ -132,11 +132,6 @@
 
 #define SVM_NPT_ENABLED     (1 << 0)
 
-#define SVM_NPT_PAE         (1 << 0)
-#define SVM_NPT_LMA         (1 << 1)
-#define SVM_NPT_NXE         (1 << 2)
-#define SVM_NPT_PSE         (1 << 3)
-
 #define SVM_NPTEXIT_GPA     (1ULL << 32)
 #define SVM_NPTEXIT_GPT     (1ULL << 33)
 
diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 7697fa4adc..e616ac6f13 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -21,6 +21,24 @@
 #include "cpu.h"
 #include "tcg/helper-tcg.h"
 
+int get_pg_mode(CPUX86State *env)
+{
+    int pg_mode = 0;
+    if (env->cr[4] & CR4_PAE_MASK) {
+        pg_mode |= PG_MODE_PAE;
+    }
+    if (env->cr[4] & CR4_PSE_MASK) {
+        pg_mode |= PG_MODE_PSE;
+    }
+    if (env->hflags & HF_LMA_MASK) {
+        pg_mode |= PG_MODE_LMA;
+    }
+    if (env->efer & MSR_EFER_NXE) {
+        pg_mode |= PG_MODE_NXE;
+    }
+    return pg_mode;
+}
+
 static hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
                         int *prot)
 {
@@ -37,16 +55,16 @@ static hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
         return gphys;
     }
 
-    if (!(env->nested_pg_mode & SVM_NPT_NXE)) {
+    if (!(env->nested_pg_mode & PG_MODE_NXE)) {
         rsvd_mask |= PG_NX_MASK;
     }
 
-    if (env->nested_pg_mode & SVM_NPT_PAE) {
+    if (env->nested_pg_mode & PG_MODE_PAE) {
         uint64_t pde, pdpe;
         target_ulong pdpe_addr;
 
 #ifdef TARGET_X86_64
-        if (env->nested_pg_mode & SVM_NPT_LMA) {
+        if (env->nested_pg_mode & PG_MODE_LMA) {
             uint64_t pml5e;
             uint64_t pml4e_addr, pml4e;
 
@@ -147,7 +165,7 @@ static hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
         ptep = pde | PG_NX_MASK;
 
         /* if host cr4 PSE bit is set, then we use a 4MB page */
-        if ((pde & PG_PSE_MASK) && (env->nested_pg_mode & SVM_NPT_PSE)) {
+        if ((pde & PG_PSE_MASK) && (env->nested_pg_mode & PG_MODE_PSE)) {
             page_size = 4096 * 1024;
             pte_addr = pde_addr;
 
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index d6c2cccda6..4d81d341b8 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -163,18 +163,7 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
                                                         control.nested_cr3));
         env->hflags2 |= HF2_NPT_MASK;
 
-        if (env->cr[4] & CR4_PAE_MASK) {
-            env->nested_pg_mode |= SVM_NPT_PAE;
-        }
-        if (env->cr[4] & CR4_PSE_MASK) {
-            env->nested_pg_mode |= SVM_NPT_PSE;
-        }
-        if (env->hflags & HF_LMA_MASK) {
-            env->nested_pg_mode |= SVM_NPT_LMA;
-        }
-        if (env->efer & MSR_EFER_NXE) {
-            env->nested_pg_mode |= SVM_NPT_NXE;
-        }
+        env->nested_pg_mode = get_pg_mode(env);
     }
 
     /* enable intercepts */
-- 
2.26.2




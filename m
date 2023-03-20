Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABC26C12B4
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:07:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFB8-0001Fq-Od; Mon, 20 Mar 2023 09:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peFB1-0001Dc-Si
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:03:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peFB0-0006DS-8I
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:03:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679317429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kzVjN9YG4Oheb+FJ6E8OSV8+d+7w4HRcR1MW8JbCO3k=;
 b=cyanecHnNDymu+ft3aXG/c+nv1DRV0nIiPhZPXZG49T4kSGOjp0HTZDwm1DUkjNgVMMabc
 kM1JchuL7+ydHTqwVopThvxlMDJba4nJF5qwIfuCEm45XvaZCfRxry0VsQs3Sucm/unvUW
 8RR1+VMziZk4bvDQz1GGptr/iIpRclM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-MAzis6NLPX-wQW-Ynf04Nw-1; Mon, 20 Mar 2023 09:03:46 -0400
X-MC-Unique: MAzis6NLPX-wQW-Ynf04Nw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E10D385557F;
 Mon, 20 Mar 2023 13:03:45 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F10FCC15BA0;
 Mon, 20 Mar 2023 13:03:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 Harold Grovesteen <h.grovsteen@tx.rr.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 09/24] target/s390x: Handle branching to odd addresses
Date: Mon, 20 Mar 2023 14:03:15 +0100
Message-Id: <20230320130330.406378-10-thuth@redhat.com>
In-Reply-To: <20230320130330.406378-1-thuth@redhat.com>
References: <20230320130330.406378-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Ilya Leoshkevich <iii@linux.ibm.com>

Let branching happen and try to generate a new translation block with
an odd address. Generate a specification exception in
cpu_get_tb_cpu_state().

Reported-by: Harold Grovesteen <h.grovsteen@tx.rr.com>
Reported-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230316164428.275147-2-iii@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/cpu.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 82c2f575bb..c47e7adcb1 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -29,6 +29,7 @@
 #include "cpu_models.h"
 #include "exec/cpu-defs.h"
 #include "qemu/cpu-float.h"
+#include "tcg/tcg_s390x.h"
 
 #define ELF_MACHINE_UNAME "S390X"
 
@@ -383,6 +384,14 @@ static inline int cpu_mmu_index(CPUS390XState *env, bool ifetch)
 static inline void cpu_get_tb_cpu_state(CPUS390XState* env, target_ulong *pc,
                                         target_ulong *cs_base, uint32_t *flags)
 {
+    if (env->psw.addr & 1) {
+        /*
+         * Instructions must be at even addresses.
+         * This needs to be checked before address translation.
+         */
+        env->int_pgm_ilen = 2; /* see s390_cpu_tlb_fill() */
+        tcg_s390_program_interrupt(env, PGM_SPECIFICATION, 0);
+    }
     *pc = env->psw.addr;
     *cs_base = env->ex_value;
     *flags = (env->psw.mask >> FLAG_MASK_PSW_SHIFT) & FLAG_MASK_PSW;
-- 
2.31.1



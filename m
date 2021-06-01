Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC0E3979DE
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 20:14:48 +0200 (CEST)
Received: from localhost ([::1]:47634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo8ud-00023H-QN
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 14:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lo8qO-0001yc-VZ
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 14:10:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lo8qN-0005az-7R
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 14:10:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622571022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R57ND6+vzYJ+A27EAuFK8s6uaKLDP/UdLrP951bUWvg=;
 b=alMD6zVaSXs4jy4IeuT1qgJBtgxe+PKBy5h/KUZ7j3xXl+yUSSXXA4TogKsjTOwRuNI6R8
 KLGtHeXbtnaDSX2EwJnUgrHwqE9yePelgpwuHfVeO9X8ElA6JRwiXX6hJZHMrtBA1se5wY
 CACcVwu3vkLwLGJ2yLcUOUW9ggkMvaA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-Bx-2YlnGMWG4-61_QXJLAA-1; Tue, 01 Jun 2021 14:10:20 -0400
X-MC-Unique: Bx-2YlnGMWG4-61_QXJLAA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 457A28015F5;
 Tue,  1 Jun 2021 18:10:19 +0000 (UTC)
Received: from localhost (ovpn-112-239.rdu2.redhat.com [10.10.112.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 108ED2BFED;
 Tue,  1 Jun 2021 18:10:18 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 05/24] i386/cpu_dump: support AVX512 ZMM regs dump
Date: Tue,  1 Jun 2021 14:09:55 -0400
Message-Id: <20210601181014.2568861-6-ehabkost@redhat.com>
In-Reply-To: <20210601181014.2568861-1-ehabkost@redhat.com>
References: <20210601181014.2568861-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Robert Hoo <robert.hu@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Robert Hoo <robert.hu@linux.intel.com>

Since commit fa4518741e (target-i386: Rename struct XMMReg to ZMMReg),
CPUX86State.xmm_regs[] has already been extended to 512bit to support
AVX512.
Also, other qemu level supports for AVX512 registers are there for
years.
But in x86_cpu_dump_state(), still only dump XMM registers no matter
YMM/ZMM is enabled.
This patch is to complement this, let it dump XMM/YMM/ZMM accordingly.

Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1618986232-73826-1-git-send-email-robert.hu@linux.intel.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu-dump.c | 63 ++++++++++++++++++++++++++++++++----------
 1 file changed, 48 insertions(+), 15 deletions(-)

diff --git a/target/i386/cpu-dump.c b/target/i386/cpu-dump.c
index aac21f1f60b..02b635a52cf 100644
--- a/target/i386/cpu-dump.c
+++ b/target/i386/cpu-dump.c
@@ -478,6 +478,11 @@ void x86_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     qemu_fprintf(f, "EFER=%016" PRIx64 "\n", env->efer);
     if (flags & CPU_DUMP_FPU) {
         int fptag;
+        const uint64_t avx512_mask = XSTATE_OPMASK_MASK | \
+                                     XSTATE_ZMM_Hi256_MASK | \
+                                     XSTATE_Hi16_ZMM_MASK | \
+                                     XSTATE_YMM_MASK | XSTATE_SSE_MASK,
+                       avx_mask = XSTATE_YMM_MASK | XSTATE_SSE_MASK;
         fptag = 0;
         for(i = 0; i < 8; i++) {
             fptag |= ((!env->fptags[i]) << i);
@@ -499,21 +504,49 @@ void x86_cpu_dump_state(CPUState *cs, FILE *f, int flags)
             else
                 qemu_fprintf(f, " ");
         }
-        if (env->hflags & HF_CS64_MASK)
-            nb = 16;
-        else
-            nb = 8;
-        for(i=0;i<nb;i++) {
-            qemu_fprintf(f, "XMM%02d=%08x%08x%08x%08x",
-                         i,
-                         env->xmm_regs[i].ZMM_L(3),
-                         env->xmm_regs[i].ZMM_L(2),
-                         env->xmm_regs[i].ZMM_L(1),
-                         env->xmm_regs[i].ZMM_L(0));
-            if ((i & 1) == 1)
-                qemu_fprintf(f, "\n");
-            else
-                qemu_fprintf(f, " ");
+
+        if ((env->xcr0 & avx512_mask) == avx512_mask) {
+            /* XSAVE enabled AVX512 */
+            for (i = 0; i < NB_OPMASK_REGS; i++) {
+                qemu_fprintf(f, "Opmask%02d=%016"PRIx64"%s", i,
+                             env->opmask_regs[i], ((i & 3) == 3) ? "\n" : " ");
+            }
+
+            nb = (env->hflags & HF_CS64_MASK) ? 32 : 8;
+            for (i = 0; i < nb; i++) {
+                qemu_fprintf(f, "ZMM%02d=%016"PRIx64" %016"PRIx64" %016"PRIx64
+                             " %016"PRIx64" %016"PRIx64" %016"PRIx64
+                             " %016"PRIx64" %016"PRIx64"\n",
+                             i,
+                             env->xmm_regs[i].ZMM_Q(7),
+                             env->xmm_regs[i].ZMM_Q(6),
+                             env->xmm_regs[i].ZMM_Q(5),
+                             env->xmm_regs[i].ZMM_Q(4),
+                             env->xmm_regs[i].ZMM_Q(3),
+                             env->xmm_regs[i].ZMM_Q(2),
+                             env->xmm_regs[i].ZMM_Q(1),
+                             env->xmm_regs[i].ZMM_Q(0));
+            }
+        } else if ((env->xcr0 & avx_mask)  == avx_mask) {
+            /* XSAVE enabled AVX */
+            nb = env->hflags & HF_CS64_MASK ? 16 : 8;
+            for (i = 0; i < nb; i++) {
+                qemu_fprintf(f, "YMM%02d=%016"PRIx64" %016"PRIx64" %016"PRIx64
+                             " %016"PRIx64"\n", i,
+                             env->xmm_regs[i].ZMM_Q(3),
+                             env->xmm_regs[i].ZMM_Q(2),
+                             env->xmm_regs[i].ZMM_Q(1),
+                             env->xmm_regs[i].ZMM_Q(0));
+            }
+        } else { /* SSE and below cases */
+            nb = env->hflags & HF_CS64_MASK ? 16 : 8;
+            for (i = 0; i < nb; i++) {
+                qemu_fprintf(f, "XMM%02d=%016"PRIx64" %016"PRIx64"%s",
+                             i,
+                             env->xmm_regs[i].ZMM_Q(1),
+                             env->xmm_regs[i].ZMM_Q(0),
+                             (i & 1) ? "\n" : " ");
+            }
         }
     }
     if (flags & CPU_DUMP_CODE) {
-- 
2.30.2



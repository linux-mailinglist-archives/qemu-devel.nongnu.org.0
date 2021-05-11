Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC2D37A1B2
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:24:57 +0200 (CEST)
Received: from localhost ([::1]:53878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgNhI-0004zU-8Q
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWw-0001ts-Uv
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWn-0000mW-7m
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620720844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U9PUJQqH8xfgcO+OEAyS6xoWcjiu0j48SD+Ck06CFc8=;
 b=jKjYMqBb59fTAsY0EyifEDjoIjcFmmjxRs/oX7tI4qQKUl0BbV/sMwb5CzljyAfklBE9MG
 2ecCEsP2QmHOcH3m25NK2HV6ggtpcbm0AOf+zyLLbgGtsYOLpWVGKnF/yV4J28JHBzZpFt
 lpENopZJhHlH8nDG2GuuFX2h+Pj1IdQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-qzaSwquLNFeX8Dxp27A18g-1; Tue, 11 May 2021 04:14:02 -0400
X-MC-Unique: qzaSwquLNFeX8Dxp27A18g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24BCA801817;
 Tue, 11 May 2021 08:14:01 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C421619D9D;
 Tue, 11 May 2021 08:14:00 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/33] i386: make cpu_load_efer sysemu-only
Date: Tue, 11 May 2021 04:13:36 -0400
Message-Id: <20210511081350.419428-20-pbonzini@redhat.com>
In-Reply-To: <20210511081350.419428-1-pbonzini@redhat.com>
References: <20210511081350.419428-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

cpu_load_efer is now used only for sysemu code.

Therefore, move this function implementation to
sysemu-only section of helper.c

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210322132800.7470-22-cfontana@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.h    | 20 +++++---------------
 target/i386/helper.c | 13 +++++++++++++
 2 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 5aae3ec0f4..0b182b7a5f 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1958,6 +1958,11 @@ static inline AddressSpace *cpu_addressspace(CPUState *cs, MemTxAttrs attrs)
     return cpu_get_address_space(cs, cpu_asidx_from_attrs(cs, attrs));
 }
 
+/*
+ * load efer and update the corresponding hflags. XXX: do consistency
+ * checks with cpuid bits?
+ */
+void cpu_load_efer(CPUX86State *env, uint64_t val);
 uint8_t x86_ldub_phys(CPUState *cs, hwaddr addr);
 uint32_t x86_lduw_phys(CPUState *cs, hwaddr addr);
 uint32_t x86_ldl_phys(CPUState *cs, hwaddr addr);
@@ -2054,21 +2059,6 @@ static inline uint32_t cpu_compute_eflags(CPUX86State *env)
     return eflags;
 }
 
-
-/* load efer and update the corresponding hflags. XXX: do consistency
-   checks with cpuid bits? */
-static inline void cpu_load_efer(CPUX86State *env, uint64_t val)
-{
-    env->efer = val;
-    env->hflags &= ~(HF_LMA_MASK | HF_SVME_MASK);
-    if (env->efer & MSR_EFER_LMA) {
-        env->hflags |= HF_LMA_MASK;
-    }
-    if (env->efer & MSR_EFER_SVME) {
-        env->hflags |= HF_SVME_MASK;
-    }
-}
-
 static inline MemTxAttrs cpu_get_mem_attrs(CPUX86State *env)
 {
     return ((MemTxAttrs) { .secure = (env->hflags & HF_SMM_MASK) != 0 });
diff --git a/target/i386/helper.c b/target/i386/helper.c
index 8c180b5b2b..533b29cb91 100644
--- a/target/i386/helper.c
+++ b/target/i386/helper.c
@@ -574,6 +574,19 @@ void do_cpu_sipi(X86CPU *cpu)
 #endif
 
 #ifndef CONFIG_USER_ONLY
+
+void cpu_load_efer(CPUX86State *env, uint64_t val)
+{
+    env->efer = val;
+    env->hflags &= ~(HF_LMA_MASK | HF_SVME_MASK);
+    if (env->efer & MSR_EFER_LMA) {
+        env->hflags |= HF_LMA_MASK;
+    }
+    if (env->efer & MSR_EFER_SVME) {
+        env->hflags |= HF_SVME_MASK;
+    }
+}
+
 uint8_t x86_ldub_phys(CPUState *cs, hwaddr addr)
 {
     X86CPU *cpu = X86_CPU(cs);
-- 
2.26.2




Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B461737A19A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:18:47 +0200 (CEST)
Received: from localhost ([::1]:36546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgNbK-0001cI-Nz
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWm-0001aB-9l
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWg-0000hF-L6
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620720838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CRfifRRU6iDZU0CbyJ9ZL7nfHYUy2lzv/0Zzl+Op7ys=;
 b=hUBW9ORctc5UHSI/3kYB2jmRfqNgb4uF9Ys2veNYh+2Suk/qSO54W9aQH6/XkFwj8OygIT
 64ec+8UrHWmOrwRA+42/xxyjz0gV0Ltj8YV9WkK4b3wUyaeA2bfDqb7I3a809qpbmgD5Qg
 yhGnhZy7tB3SCjGfDXep2i+kSgDLYIE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-dRKEO_oONRGX1gBpER3UYQ-1; Tue, 11 May 2021 04:13:55 -0400
X-MC-Unique: dRKEO_oONRGX1gBpER3UYQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9F1C107ACCD;
 Tue, 11 May 2021 08:13:54 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3ACE45D9E3;
 Tue, 11 May 2021 08:13:54 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/33] target/i386: fix host_cpu_adjust_phys_bits error handling
Date: Tue, 11 May 2021 04:13:23 -0400
Message-Id: <20210511081350.419428-7-pbonzini@redhat.com>
In-Reply-To: <20210511081350.419428-1-pbonzini@redhat.com>
References: <20210511081350.419428-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

move the check for phys_bits outside of host_cpu_adjust_phys_bits,
because otherwise it is impossible to return an error condition
explicitly.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210322132800.7470-8-cfontana@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/host-cpu.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/target/i386/host-cpu.c b/target/i386/host-cpu.c
index 9cfe56ce41..d07d41c34c 100644
--- a/target/i386/host-cpu.c
+++ b/target/i386/host-cpu.c
@@ -50,7 +50,7 @@ static void host_cpu_enable_cpu_pm(X86CPU *cpu)
     env->features[FEAT_1_ECX] |= CPUID_EXT_MONITOR;
 }
 
-static uint32_t host_cpu_adjust_phys_bits(X86CPU *cpu, Error **errp)
+static uint32_t host_cpu_adjust_phys_bits(X86CPU *cpu)
 {
     uint32_t host_phys_bits = host_cpu_phys_bits();
     uint32_t phys_bits = cpu->phys_bits;
@@ -77,14 +77,6 @@ static uint32_t host_cpu_adjust_phys_bits(X86CPU *cpu, Error **errp)
         }
     }
 
-    if (phys_bits &&
-        (phys_bits > TARGET_PHYS_ADDR_SPACE_BITS ||
-         phys_bits < 32)) {
-        error_setg(errp, "phys-bits should be between 32 and %u "
-                   " (but is %u)",
-                   TARGET_PHYS_ADDR_SPACE_BITS, phys_bits);
-    }
-
     return phys_bits;
 }
 
@@ -97,7 +89,17 @@ void host_cpu_realizefn(CPUState *cs, Error **errp)
         host_cpu_enable_cpu_pm(cpu);
     }
     if (env->features[FEAT_8000_0001_EDX] & CPUID_EXT2_LM) {
-        cpu->phys_bits = host_cpu_adjust_phys_bits(cpu, errp);
+        uint32_t phys_bits = host_cpu_adjust_phys_bits(cpu);
+
+        if (phys_bits &&
+            (phys_bits > TARGET_PHYS_ADDR_SPACE_BITS ||
+             phys_bits < 32)) {
+            error_setg(errp, "phys-bits should be between 32 and %u "
+                       " (but is %u)",
+                       TARGET_PHYS_ADDR_SPACE_BITS, phys_bits);
+            return;
+        }
+        cpu->phys_bits = phys_bits;
     }
 }
 
-- 
2.26.2




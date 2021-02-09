Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB363315184
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 15:27:00 +0100 (CET)
Received: from localhost ([::1]:46538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Tyl-0002lh-QO
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 09:26:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l9TWJ-0001jg-5w
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:57:35 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:56204 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l9TWG-0007yT-3S
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:57:34 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id BE7A841281;
 Tue,  9 Feb 2021 13:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1612879049; x=1614693450; bh=83VB29ryhP6ci6Nul87zn1ygz9jX6V7nZdO
 WHsqbWug=; b=Cd0Rn0RN7PcUY3WZWUiPeGpERIqRDtWWC1WqI748nf8sYgdUU7y
 9d/zTucQF9mzLc4BZdy8WOJy8oSX9s1u4d0Q/PgiBRtMTNk7anPCo9u953RbmOQR
 i5gT5kczfQ4EFYorqQZF5DyJ8tvWzwYPHi53ALkYQD7uloz86ofCvxQU=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9FRlDwG3NIdm; Tue,  9 Feb 2021 16:57:29 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 5354A412E7;
 Tue,  9 Feb 2021 16:57:28 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 9 Feb
 2021 16:57:28 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL hvf 5/5] hvf: Fetch cr4 before evaluating CPUID(1)
Date: Tue, 9 Feb 2021 16:57:22 +0300
Message-ID: <20210209135722.4891-6-r.bolshakov@yadro.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209135722.4891-1-r.bolshakov@yadro.com>
References: <20210209135722.4891-1-r.bolshakov@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Asad Ali <asad@osaro.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Graf <agraf@csgraf.de>

The CPUID function 1 has a bit called OSXSAVE which tells user space the
status of the CR4.OSXSAVE bit. Our generic CPUID function injects that bit
based on the status of CR4.

With Hypervisor.framework, we do not synchronize full CPU state often enough
for this function to see the CR4 update before guest user space asks for it.

To be on the save side, let's just always synchronize it when we receive a
CPUID(1) request. That way we can set the bit with real confidence.

Reported-by: Asad Ali <asad@osaro.com>
Signed-off-by: Alexander Graf <agraf@csgraf.de>
Message-Id: <20210123004129.6364-1-agraf@csgraf.de>
[RB: resolved conflict with another CPUID change]
Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
---
 target/i386/hvf/hvf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 5a8914564b..d2fb680058 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -828,6 +828,10 @@ int hvf_vcpu_exec(CPUState *cpu)
             uint32_t rcx = (uint32_t)rreg(cpu->hvf_fd, HV_X86_RCX);
             uint32_t rdx = (uint32_t)rreg(cpu->hvf_fd, HV_X86_RDX);
 
+            if (rax == 1) {
+                /* CPUID1.ecx.OSXSAVE needs to know CR4 */
+                env->cr[4] = rvmcs(cpu->hvf_fd, VMCS_GUEST_CR4);
+            }
             hvf_cpu_x86_cpuid(env, rax, rcx, &rax, &rbx, &rcx, &rdx);
 
             wreg(cpu->hvf_fd, HV_X86_RAX, rax);
-- 
2.30.0



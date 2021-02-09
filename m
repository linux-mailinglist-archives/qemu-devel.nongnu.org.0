Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E3E31517F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 15:25:27 +0100 (CET)
Received: from localhost ([::1]:42430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9TxG-0000zP-4q
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 09:25:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l9TWH-0001fj-Q0
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:57:33 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:56188 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l9TWF-0007y7-Pe
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:57:33 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 69AD54127C;
 Tue,  9 Feb 2021 13:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1612879049; x=1614693450; bh=54yn9wGwhewtmlsigr2i4DLu8msIcXhiu81
 ro63Ambc=; b=LlnbuuRYZ3giMvf6J/bfxtr46OkoJnObxNYP0zwSlcToAKGlSot
 8jWfmF+Q+FDgfmYLgAJCMJpq51dpXsWgzsPTvSJvX86y4tLHwuqdfTArhOqVrXje
 5qy59p/d9h6BrN3VFiw0poYlhpzK66MYN70PKku16KRj84FLJ4WPtdaM=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H2xKUuh02BWb; Tue,  9 Feb 2021 16:57:29 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id A118841281;
 Tue,  9 Feb 2021 16:57:27 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 9 Feb
 2021 16:57:27 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL hvf 4/5] target/i386/hvf: add rdmsr 35H MSR_CORE_THREAD_COUNT
Date: Tue, 9 Feb 2021 16:57:21 +0300
Message-ID: <20210209135722.4891-5-r.bolshakov@yadro.com>
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
Cc: Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>

Some guests (ex. Darwin-XNU) can attemp to read this MSR to retrieve and
validate CPU topology comparing it to ACPI MADT content

MSR description from Intel Manual:
35H: MSR_CORE_THREAD_COUNT: Configured State of Enabled Processor Core
  Count and Logical Processor Count

Bits 15:0 THREAD_COUNT The number of logical processors that are
  currently enabled in the physical package

Bits 31:16 Core_COUNT The number of processor cores that are currently
  enabled in the physical package

Bits 63:32 Reserved

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Message-Id: <20210113205323.33310-1-yaroshchuk2000@gmail.com>
[RB: reordered MSR definition and dropped u suffix from shift offset]
Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
---
 target/i386/cpu.h         | 1 +
 target/i386/hvf/x86_emu.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d23a5b340a..e2fe0689cc 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -366,6 +366,7 @@ typedef enum X86Seg {
 
 #define MSR_IA32_SMBASE                 0x9e
 #define MSR_SMI_COUNT                   0x34
+#define MSR_CORE_THREAD_COUNT           0x35
 #define MSR_MTRRcap                     0xfe
 #define MSR_MTRRcap_VCNT                8
 #define MSR_MTRRcap_FIXRANGE_SUPPORT    (1 << 8)
diff --git a/target/i386/hvf/x86_emu.c b/target/i386/hvf/x86_emu.c
index da570e352b..e52c39ddb1 100644
--- a/target/i386/hvf/x86_emu.c
+++ b/target/i386/hvf/x86_emu.c
@@ -668,6 +668,7 @@ void simulate_rdmsr(struct CPUState *cpu)
 {
     X86CPU *x86_cpu = X86_CPU(cpu);
     CPUX86State *env = &x86_cpu->env;
+    CPUState *cs = env_cpu(env);
     uint32_t msr = ECX(env);
     uint64_t val = 0;
 
@@ -745,6 +746,10 @@ void simulate_rdmsr(struct CPUState *cpu)
     case MSR_MTRRdefType:
         val = env->mtrr_deftype;
         break;
+    case MSR_CORE_THREAD_COUNT:
+        val = cs->nr_threads * cs->nr_cores; /* thread count, bits 15..0 */
+        val |= ((uint32_t)cs->nr_cores << 16); /* core count, bits 31..16 */
+        break;
     default:
         /* fprintf(stderr, "%s: unknown msr 0x%x\n", __func__, msr); */
         val = 0;
-- 
2.30.0



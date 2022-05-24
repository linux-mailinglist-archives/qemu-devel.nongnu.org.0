Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6145F532D0C
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 17:13:47 +0200 (CEST)
Received: from localhost ([::1]:34734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntWED-0002Um-Uc
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 11:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ntWCS-0000mk-9m
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:11:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ntWCO-0008Fj-5o
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:11:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653405111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ASyypiKIaTA9T8oki1qDGXZMHxAzCXjFV+TR++Lcy44=;
 b=TaE6H6Z/g4bzDrd9SZQLAPRMuCaYww2Y+oMIlQp9rKXUukRmPsXtUtTEH0JNonfzOo+O/N
 r1xVlxWN9LN6BvSGctPjZn3MPz64HszuRBTZwm9s1RuGU5cX9rHv1e+KWJuhOuFIpndN4+
 o/OHBAJ0A/pg9zUMFpl1H7/srvwylQc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-hf14hXBxMMeEMsOjkvPQQg-1; Tue, 24 May 2022 11:10:25 -0400
X-MC-Unique: hf14hXBxMMeEMsOjkvPQQg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E54A33831C50;
 Tue, 24 May 2022 15:10:24 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 176EB2166B2A;
 Tue, 24 May 2022 15:10:23 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, f4bug@amsat.org,
 yang.zhong@intel.com
Subject: [PATCH 2/2] x86: cpu: fixup number of addressable IDs for logical
 processors sharing cache
Date: Tue, 24 May 2022 11:10:20 -0400
Message-Id: <20220524151020.2541698-3-imammedo@redhat.com>
In-Reply-To: <20220524151020.2541698-1-imammedo@redhat.com>
References: <20220524151020.2541698-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When QEMU is started with '-cpu host,host-cache-info=on', it will
passthrough host's number of logical processors sharing cache and
number of processor cores in the physical package. QEMU already
fixes up the later to correctly reflect number of configured cores
for VM, however number of logical processors sharing cache is still
comes from host CPU, which confuses guest started with:

       -machine q35,accel=kvm \
       -cpu host,host-cache-info=on,l3-cache=off \
       -smp 20,sockets=2,dies=1,cores=10,threads=1  \
       -numa node,nodeid=0,memdev=ram-node0 \
       -numa node,nodeid=1,memdev=ram-node1 \
       -numa cpu,socket-id=0,node-id=0 \
       -numa cpu,socket-id=1,node-id=1

on 2 socket Xeon 4210R host with 10 cores per socket
with CPUID[04H]:
      ...
        --- cache 3 ---
      cache type                           = unified cache (3)
      cache level                          = 0x3 (3)
      self-initializing cache level        = true
      fully associative cache              = false
      maximum IDs for CPUs sharing cache   = 0x1f (31)
      maximum IDs for cores in pkg         = 0xf (15)
      ...
that doesn't match number of logical processors VM was
configured with and as result RHEL 9.0 guest complains:

   sched: CPU #10's llc-sibling CPU #0 is not on the same node! [node: 1 != 0]. Ignoring dependency.
   WARNING: CPU: 10 PID: 0 at arch/x86/kernel/smpboot.c:421 topology_sane.isra.0+0x67/0x80
   ...
   Call Trace:
     set_cpu_sibling_map+0x176/0x590
     start_secondary+0x5b/0x150
     secondary_startup_64_no_verify+0xc2/0xcb

Fix it by capping max number of logical processors to vcpus/socket
as it was configured, which fixes the issue.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=2088311
---
PS:
 capping to logical cpus/socket was arbitrarily chosen (maybe
 it should be per die or something else but don't see that in spec)
---
 target/i386/cpu.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index bbe37dce2e..ffb274dcf6 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5276,10 +5276,22 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         /* cache info: needed for Core compatibility */
         if (cpu->cache_info_passthrough) {
             x86_cpu_get_cache_cpuid(index, count, eax, ebx, ecx, edx);
-            /* QEMU gives out its own APIC IDs, never pass down bits 31..26.  */
-            *eax &= ~0xFC000000;
-            if ((*eax & 31) && cs->nr_cores > 1) {
-                *eax |= (pow2ceil(cs->nr_cores) - 1) << 26;
+            /*
+             * QEMU has its own number of cores/logical cpus,
+             * set 24..14, 31..26 bit to configured values
+             */
+            if (*eax & 31) {
+                int host_vcpus_per_cache = 1 + ((*eax & 0x3FFC000) >> 14);
+                int vcpus_per_socket = env->nr_dies * cs->nr_cores *
+                                       cs->nr_threads;
+                if (cs->nr_cores > 1) {
+                    *eax &= ~0xFC000000;
+                    *eax |= (pow2ceil(cs->nr_cores) - 1) << 26;
+                }
+                if (host_vcpus_per_cache > vcpus_per_socket) {
+                    *eax &= ~0x3FFC000;
+                    *eax |= (pow2ceil(vcpus_per_socket) - 1) << 14;
+                }
             }
         } else if (cpu->vendor_cpuid_only && IS_AMD_CPU(env)) {
             *eax = *ebx = *ecx = *edx = 0;
-- 
2.31.1



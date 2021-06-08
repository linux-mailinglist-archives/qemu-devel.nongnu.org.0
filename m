Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8595039F631
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 14:15:59 +0200 (CEST)
Received: from localhost ([::1]:47386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqaeE-00013g-2g
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 08:15:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lqaXH-0000bn-5O
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 08:08:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lqaXF-0001r9-FH
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 08:08:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623154124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=51CXz5zudz8r6+Ysqa9Ng1IA4d6iN7C68KcoxRlBQyg=;
 b=Jy4MpThRNtFaQiBNlfnJaiH1r8Vt7BE5fuGWlpY/f+DWU70s6Oa9dx1IfWyzvbNqF4YBzf
 DhyQb8Hatl4Tm40Uux1udQ/Ue/gy/FiUgle8lE4HiriAXPxQFPODoh9uiIQR4ZMfnZT506
 aewsHncDxhy18rMnzVUZrThBxaUH5AM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-UOz97iokM-ap819Q1Fjd2Q-1; Tue, 08 Jun 2021 08:08:43 -0400
X-MC-Unique: UOz97iokM-ap819Q1Fjd2Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED4C7BBEE1;
 Tue,  8 Jun 2021 12:08:42 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B23465B826;
 Tue,  8 Jun 2021 12:08:37 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v8 7/9] i386: HV_HYPERCALL_AVAILABLE privilege bit is always
 needed
Date: Tue,  8 Jun 2021 14:08:15 +0200
Message-Id: <20210608120817.1325125-8-vkuznets@redhat.com>
In-Reply-To: <20210608120817.1325125-1-vkuznets@redhat.com>
References: <20210608120817.1325125-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to TLFS, Hyper-V guest is supposed to check
HV_HYPERCALL_AVAILABLE privilege bit before accessing
HV_X64_MSR_GUEST_OS_ID/HV_X64_MSR_HYPERCALL MSRs but at least some
Windows versions ignore that. As KVM is very permissive and allows
accessing these MSRs unconditionally, no issue is observed. We may,
however, want to tighten the checks eventually. Conforming to the
spec is probably also a good idea.

Enable HV_HYPERCALL_AVAILABLE bit unconditionally.

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/kvm/kvm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 1cce0969067e..33830117fa31 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -810,8 +810,6 @@ static struct {
     [HYPERV_FEAT_RELAXED] = {
         .desc = "relaxed timing (hv-relaxed)",
         .flags = {
-            {.func = HV_CPUID_FEATURES, .reg = R_EAX,
-             .bits = HV_HYPERCALL_AVAILABLE},
             {.func = HV_CPUID_ENLIGHTMENT_INFO, .reg = R_EAX,
              .bits = HV_RELAXED_TIMING_RECOMMENDED}
         }
@@ -820,7 +818,7 @@ static struct {
         .desc = "virtual APIC (hv-vapic)",
         .flags = {
             {.func = HV_CPUID_FEATURES, .reg = R_EAX,
-             .bits = HV_HYPERCALL_AVAILABLE | HV_APIC_ACCESS_AVAILABLE},
+             .bits = HV_APIC_ACCESS_AVAILABLE},
             {.func = HV_CPUID_ENLIGHTMENT_INFO, .reg = R_EAX,
              .bits = HV_APIC_ACCESS_RECOMMENDED}
         }
@@ -829,8 +827,7 @@ static struct {
         .desc = "clocksources (hv-time)",
         .flags = {
             {.func = HV_CPUID_FEATURES, .reg = R_EAX,
-             .bits = HV_HYPERCALL_AVAILABLE | HV_TIME_REF_COUNT_AVAILABLE |
-             HV_REFERENCE_TSC_AVAILABLE}
+             .bits = HV_TIME_REF_COUNT_AVAILABLE | HV_REFERENCE_TSC_AVAILABLE}
         }
     },
     [HYPERV_FEAT_CRASH] = {
@@ -1343,6 +1340,9 @@ static int hyperv_fill_cpuids(CPUState *cs,
     c->ebx = hv_build_cpuid_leaf(cs, HV_CPUID_FEATURES, R_EBX);
     c->edx = hv_build_cpuid_leaf(cs, HV_CPUID_FEATURES, R_EDX);
 
+    /* Unconditionally required with any Hyper-V enlightenment */
+    c->eax |= HV_HYPERCALL_AVAILABLE;
+
     /* Not exposed by KVM but needed to make CPU hotplug in Windows work */
     c->edx |= HV_CPU_DYNAMIC_PARTITIONING_AVAILABLE;
 
-- 
2.31.1



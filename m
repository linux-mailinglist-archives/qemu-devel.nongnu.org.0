Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 130F93C746B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:23:59 +0200 (CEST)
Received: from localhost ([::1]:55192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3LCQ-0004I6-1Z
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m3L7u-0003g9-OI
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:19:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m3L7s-0006tG-3t
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:19:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626193155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g5Cdc7MIHpGu0GQUWuPrSUZWBnD4tfTQIZW41psbBxw=;
 b=PjBgln9sM6TWnnhoUOMGYq+HBHoMNVx2N4Npdez73Wle6frVVYxPyOHGWy2z4R7mBNUuhO
 8BBpbJM0L+xvH4E1DJY2UzGmu3lCBcn/FPw6qFw3X2uMaw6hK12/oufKlhnGMbiZmyqrAH
 nsrY0Z9lhuG/FGggbDdGHbPClBBHmzg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-cno4CPdCOtWnLX_IU6P9Ew-1; Tue, 13 Jul 2021 12:19:14 -0400
X-MC-Unique: cno4CPdCOtWnLX_IU6P9Ew-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18CDF8015F5;
 Tue, 13 Jul 2021 16:19:13 +0000 (UTC)
Received: from localhost (ovpn-113-28.rdu2.redhat.com [10.10.113.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D46665D9CA;
 Tue, 13 Jul 2021 16:19:12 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 06/11] i386: HV_HYPERCALL_AVAILABLE privilege bit is always
 needed
Date: Tue, 13 Jul 2021 12:09:52 -0400
Message-Id: <20210713160957.3269017-7-ehabkost@redhat.com>
In-Reply-To: <20210713160957.3269017-1-ehabkost@redhat.com>
References: <20210713160957.3269017-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vitaly Kuznetsov <vkuznets@redhat.com>

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
Message-Id: <20210608120817.1325125-8-vkuznets@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/kvm/kvm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 945d24300c0..eee1a6b46ea 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -813,8 +813,6 @@ static struct {
     [HYPERV_FEAT_RELAXED] = {
         .desc = "relaxed timing (hv-relaxed)",
         .flags = {
-            {.func = HV_CPUID_FEATURES, .reg = R_EAX,
-             .bits = HV_HYPERCALL_AVAILABLE},
             {.func = HV_CPUID_ENLIGHTMENT_INFO, .reg = R_EAX,
              .bits = HV_RELAXED_TIMING_RECOMMENDED}
         }
@@ -823,7 +821,7 @@ static struct {
         .desc = "virtual APIC (hv-vapic)",
         .flags = {
             {.func = HV_CPUID_FEATURES, .reg = R_EAX,
-             .bits = HV_HYPERCALL_AVAILABLE | HV_APIC_ACCESS_AVAILABLE},
+             .bits = HV_APIC_ACCESS_AVAILABLE},
             {.func = HV_CPUID_ENLIGHTMENT_INFO, .reg = R_EAX,
              .bits = HV_APIC_ACCESS_RECOMMENDED}
         }
@@ -832,8 +830,7 @@ static struct {
         .desc = "clocksources (hv-time)",
         .flags = {
             {.func = HV_CPUID_FEATURES, .reg = R_EAX,
-             .bits = HV_HYPERCALL_AVAILABLE | HV_TIME_REF_COUNT_AVAILABLE |
-             HV_REFERENCE_TSC_AVAILABLE}
+             .bits = HV_TIME_REF_COUNT_AVAILABLE | HV_REFERENCE_TSC_AVAILABLE}
         }
     },
     [HYPERV_FEAT_CRASH] = {
@@ -1346,6 +1343,9 @@ static int hyperv_fill_cpuids(CPUState *cs,
     c->ebx = hv_build_cpuid_leaf(cs, HV_CPUID_FEATURES, R_EBX);
     c->edx = hv_build_cpuid_leaf(cs, HV_CPUID_FEATURES, R_EDX);
 
+    /* Unconditionally required with any Hyper-V enlightenment */
+    c->eax |= HV_HYPERCALL_AVAILABLE;
+
     /* Not exposed by KVM but needed to make CPU hotplug in Windows work */
     c->edx |= HV_CPU_DYNAMIC_PARTITIONING_AVAILABLE;
 
-- 
2.31.1



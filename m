Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1C83FEB86
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 11:47:01 +0200 (CEST)
Received: from localhost ([::1]:38864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLjJD-00052A-Ti
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 05:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1mLj9c-00036u-Lx
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:37:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1mLj9a-0005Wb-Iy
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:37:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630575422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JeO/dbG8cPFnuPwB0X8XkU+O/2Py6SQwP8cNEH6/1ZI=;
 b=CgpnSoip6a6X2ez/sb4aZhDHYn/f+Cn4ling0RFaPSH7z87DlEKqf6/4sCkWBbEufIe+mu
 gOZkUQrkbcyKAkObeHA12kBjzbZKQUMG51yCJ5T+ZcWOaxwxKVH7ZphoP2L2cAdaXwvEHq
 0lJ+vr7haNei5XKUSYOQG3HM05G06YE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-KLwXrHBiPKqo0qnIbUc1JA-1; Thu, 02 Sep 2021 05:35:45 -0400
X-MC-Unique: KLwXrHBiPKqo0qnIbUc1JA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01547107ACC7
 for <qemu-devel@nongnu.org>; Thu,  2 Sep 2021 09:35:45 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FA7877BE7;
 Thu,  2 Sep 2021 09:35:42 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/8] i386: Move HV_APIC_ACCESS_RECOMMENDED bit setting to
 hyperv_fill_cpuids()
Date: Thu,  2 Sep 2021 11:35:27 +0200
Message-Id: <20210902093530.345756-6-vkuznets@redhat.com>
In-Reply-To: <20210902093530.345756-1-vkuznets@redhat.com>
References: <20210902093530.345756-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Vadim Rozenfeld <vrozenfe@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In preparation to enabling Hyper-V + APICv/AVIC move
HV_APIC_ACCESS_RECOMMENDED setting out of kvm_hyperv_properties[]: the
'real' feature bit for the vAPIC features is HV_APIC_ACCESS_AVAILABLE,
HV_APIC_ACCESS_RECOMMENDED is a recommendation to use the feature which
we may not always want to give.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/kvm/kvm.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index bd0b53416315..430007c2691a 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -821,9 +821,7 @@ static struct {
         .desc = "virtual APIC (hv-vapic)",
         .flags = {
             {.func = HV_CPUID_FEATURES, .reg = R_EAX,
-             .bits = HV_APIC_ACCESS_AVAILABLE},
-            {.func = HV_CPUID_ENLIGHTMENT_INFO, .reg = R_EAX,
-             .bits = HV_APIC_ACCESS_RECOMMENDED}
+             .bits = HV_APIC_ACCESS_AVAILABLE}
         }
     },
     [HYPERV_FEAT_TIME] = {
@@ -1366,6 +1364,7 @@ static int hyperv_fill_cpuids(CPUState *cs,
         c->ebx |= HV_POST_MESSAGES | HV_SIGNAL_EVENTS;
     }
 
+
     /* Not exposed by KVM but needed to make CPU hotplug in Windows work */
     c->edx |= HV_CPU_DYNAMIC_PARTITIONING_AVAILABLE;
 
@@ -1374,6 +1373,10 @@ static int hyperv_fill_cpuids(CPUState *cs,
     c->eax = hv_build_cpuid_leaf(cs, HV_CPUID_ENLIGHTMENT_INFO, R_EAX);
     c->ebx = cpu->hyperv_spinlock_attempts;
 
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_VAPIC)) {
+        c->eax |= HV_APIC_ACCESS_RECOMMENDED;
+    }
+
     if (cpu->hyperv_no_nonarch_cs == ON_OFF_AUTO_ON) {
         c->eax |= HV_NO_NONARCH_CORESHARING;
     } else if (cpu->hyperv_no_nonarch_cs == ON_OFF_AUTO_AUTO) {
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9DF39F64C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 14:20:18 +0200 (CEST)
Received: from localhost ([::1]:36550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqaiP-0004Gy-7a
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 08:20:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lqaXV-0000n0-Mx
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 08:09:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lqaXK-0001su-EF
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 08:09:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623154129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fwNASzpJSSWJ/QDMbCs/NvTGp6Vc+5PAUz4eup5zGBU=;
 b=UsPIyQebrdn/IUhZR6Jk5EolK+ObYey3mgpeAfDU97L3kDUujM2EpUVZ8o14LiQntUhEP2
 qAn2x9WdLYkaopweCngvPJ2PYjtAe6eMELBhFNoBD+e40oXpATso/RZw2TfAmAbjtqLSg1
 5HxFCLJ5yIGrwh/pKj3kAQn3J+4JsN8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-FNdLw9ZeMX-9KYx-I1CWrA-1; Tue, 08 Jun 2021 08:08:46 -0400
X-MC-Unique: FNdLw9ZeMX-9KYx-I1CWrA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33AB1BBEE3;
 Tue,  8 Jun 2021 12:08:45 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 616605B4A7;
 Tue,  8 Jun 2021 12:08:43 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v8 8/9] i386: Hyper-V SynIC requires
 POST_MESSAGES/SIGNAL_EVENTS privileges
Date: Tue,  8 Jun 2021 14:08:16 +0200
Message-Id: <20210608120817.1325125-9-vkuznets@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
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

When Hyper-V SynIC is enabled, we may need to allow Windows guests to make
hypercalls (POST_MESSAGES/SIGNAL_EVENTS). No issue is currently observed
because KVM is very permissive, allowing these hypercalls regarding of
guest visible CPUid bits.

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/kvm/hyperv-proto.h | 6 ++++++
 target/i386/kvm/kvm.c          | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/target/i386/kvm/hyperv-proto.h b/target/i386/kvm/hyperv-proto.h
index e30d64b4ade4..5fbb385cc136 100644
--- a/target/i386/kvm/hyperv-proto.h
+++ b/target/i386/kvm/hyperv-proto.h
@@ -38,6 +38,12 @@
 #define HV_ACCESS_FREQUENCY_MSRS     (1u << 11)
 #define HV_ACCESS_REENLIGHTENMENTS_CONTROL  (1u << 13)
 
+/*
+ * HV_CPUID_FEATURES.EBX bits
+ */
+#define HV_POST_MESSAGES             (1u << 4)
+#define HV_SIGNAL_EVENTS             (1u << 5)
+
 /*
  * HV_CPUID_FEATURES.EDX bits
  */
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 33830117fa31..260c563d59a3 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1343,6 +1343,12 @@ static int hyperv_fill_cpuids(CPUState *cs,
     /* Unconditionally required with any Hyper-V enlightenment */
     c->eax |= HV_HYPERCALL_AVAILABLE;
 
+    /* SynIC and Vmbus devices require messages/signals hypercalls */
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNIC) &&
+        !cpu->hyperv_synic_kvm_only) {
+        c->ebx |= HV_POST_MESSAGES | HV_SIGNAL_EVENTS;
+    }
+
     /* Not exposed by KVM but needed to make CPU hotplug in Windows work */
     c->edx |= HV_CPU_DYNAMIC_PARTITIONING_AVAILABLE;
 
-- 
2.31.1



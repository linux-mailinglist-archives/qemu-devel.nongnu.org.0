Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0FF39A061
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 13:56:06 +0200 (CEST)
Received: from localhost ([::1]:42778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lolxF-00051n-DH
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 07:56:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lolqP-0005Zb-Ot
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 07:49:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lolqO-0002Ah-76
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 07:49:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622720939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3+WeXJaJYzTaKvefMUC6ffYWX8vYTQP1Tl+XzsqOGQw=;
 b=hoSA5EW2DHe8eoRyAGaaJz3BM1It93Vtw3eUut4SniDlSLMS+foTfPsdzCh7VY600iQe5K
 dPxpXr5z7UIM4vD7AOlBqm4qhFNowB1DSbibBtjWhtS9smSY2JVoqF626109y+YsIFTU9O
 OXv+vBpQfmXdqNKIDwkkfoLs5HTAKNw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-NG7axeZdM8CnBX8huX0vwQ-1; Thu, 03 Jun 2021 07:48:58 -0400
X-MC-Unique: NG7axeZdM8CnBX8huX0vwQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86005180FD67
 for <qemu-devel@nongnu.org>; Thu,  3 Jun 2021 11:48:57 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FB501A8A0;
 Thu,  3 Jun 2021 11:48:55 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v7 8/9] i386: Hyper-V SynIC requires
 POST_MESSAGES/SIGNAL_EVENTS priviliges
Date: Thu,  3 Jun 2021 13:48:34 +0200
Message-Id: <20210603114835.847451-9-vkuznets@redhat.com>
In-Reply-To: <20210603114835.847451-1-vkuznets@redhat.com>
References: <20210603114835.847451-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
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
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When Hyper-V SynIC is enabled, we may need to allow Windows guests to make
hypercalls (POST_MESSAGES/SIGNAL_EVENTS). No issue is currently observed
because KVM is very permissive, allowing these hypercalls regarding of
guest visible CPUid bits.

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
index a3897d4d8788..6a32d43e6ec1 100644
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



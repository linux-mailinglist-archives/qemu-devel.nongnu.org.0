Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C643C7474
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:26:13 +0200 (CEST)
Received: from localhost ([::1]:35108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3LEa-0001Hk-K6
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m3L7v-0003iA-T5
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:19:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m3L7t-0006ud-05
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:19:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626193156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FGIoWhWTdf6Sax8hktc53jnOBfQk1TJaNlNeCGFHgGw=;
 b=JqyQNukpnRLJFKXp8TSwjO0CguKBRfCl2KfDU2xwHcHw4/BoHEps/eHA4wDnXNJOSzyXWL
 Uun2YexSxNy+hD+/f2zBZBQVFDbKjb1mdTKVLecadBBP41I9ueAWfBTJG/JXSYm0YOq5Rg
 Mn7GewKg3ywqTXdsmKXk9YoJaB8qAIY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-pFBUbuqTOWKI540AV4d75Q-1; Tue, 13 Jul 2021 12:19:15 -0400
X-MC-Unique: pFBUbuqTOWKI540AV4d75Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECD5B1B2C980;
 Tue, 13 Jul 2021 16:19:13 +0000 (UTC)
Received: from localhost (ovpn-113-28.rdu2.redhat.com [10.10.113.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B39CC60936;
 Tue, 13 Jul 2021 16:19:13 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 07/11] i386: Hyper-V SynIC requires POST_MESSAGES/SIGNAL_EVENTS
 privileges
Date: Tue, 13 Jul 2021 12:09:53 -0400
Message-Id: <20210713160957.3269017-8-ehabkost@redhat.com>
In-Reply-To: <20210713160957.3269017-1-ehabkost@redhat.com>
References: <20210713160957.3269017-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

When Hyper-V SynIC is enabled, we may need to allow Windows guests to make
hypercalls (POST_MESSAGES/SIGNAL_EVENTS). No issue is currently observed
because KVM is very permissive, allowing these hypercalls regarding of
guest visible CPUid bits.

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Message-Id: <20210608120817.1325125-9-vkuznets@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/kvm/hyperv-proto.h | 6 ++++++
 target/i386/kvm/kvm.c          | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/target/i386/kvm/hyperv-proto.h b/target/i386/kvm/hyperv-proto.h
index e30d64b4ade..5fbb385cc13 100644
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
index eee1a6b46ea..59ed8327ac1 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1346,6 +1346,12 @@ static int hyperv_fill_cpuids(CPUState *cs,
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



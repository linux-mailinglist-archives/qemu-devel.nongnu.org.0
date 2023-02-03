Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 296CD6899FE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 14:45:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNwN5-00018t-KW; Fri, 03 Feb 2023 08:44:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pNwN2-000183-1l
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 08:44:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pNwN0-0006wf-28
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 08:44:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675431889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3O8Hu2Eff4RtUTfyebeMbncBmuF855AAStNr0xiY9Dk=;
 b=F4h2sOTfE4P1hu6bmBjhdzExmiWhcNI3jE/K4NP6nwer4v3sdJAEYt1S432aelAgU3okAv
 bgnRTxu38h7dWXbHPQTAzThLnRTslkD4xSKbzJDhR9kpMe+TGWLb7u7yeuZ4i0W9ewGSYP
 1PZDtwFG1jNFxqo7FuqzToKfVoyKgPU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-2I4wLs87PpOfqkIBVRLcmQ-1; Fri, 03 Feb 2023 08:44:46 -0500
X-MC-Unique: 2I4wLs87PpOfqkIBVRLcmQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13C9B811E6E;
 Fri,  3 Feb 2023 13:44:46 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.39.192.149])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23E22408573E;
 Fri,  3 Feb 2023 13:44:44 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Eric Auger <eauger@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v5 1/3] arm/virt: don't try to spell out the accelerator
Date: Fri,  3 Feb 2023 14:44:31 +0100
Message-Id: <20230203134433.31513-2-cohuck@redhat.com>
In-Reply-To: <20230203134433.31513-1-cohuck@redhat.com>
References: <20230203134433.31513-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Just use current_accel_name() directly.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/arm/virt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ea2413a0bad7..bdc297a4570c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2123,21 +2123,21 @@ static void machvirt_init(MachineState *machine)
     if (vms->secure && (kvm_enabled() || hvf_enabled())) {
         error_report("mach-virt: %s does not support providing "
                      "Security extensions (TrustZone) to the guest CPU",
-                     kvm_enabled() ? "KVM" : "HVF");
+                     current_accel_name());
         exit(1);
     }
 
     if (vms->virt && (kvm_enabled() || hvf_enabled())) {
         error_report("mach-virt: %s does not support providing "
                      "Virtualization extensions to the guest CPU",
-                     kvm_enabled() ? "KVM" : "HVF");
+                     current_accel_name());
         exit(1);
     }
 
     if (vms->mte && (kvm_enabled() || hvf_enabled())) {
         error_report("mach-virt: %s does not support providing "
                      "MTE to the guest CPU",
-                     kvm_enabled() ? "KVM" : "HVF");
+                     current_accel_name());
         exit(1);
     }
 
-- 
2.39.1



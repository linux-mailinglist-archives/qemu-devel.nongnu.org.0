Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 574A06B0801
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 14:09:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZtWY-00020c-DE; Wed, 08 Mar 2023 08:08:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1pZtWW-00020F-Ch
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:08:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1pZtWU-0000Yt-Pa
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:08:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678280881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=u3Ab7Oa0DL9m01oXQYyLKBpXwiadNu2U0TDqPSMhOfM=;
 b=cCQWsE3KCU+sqTWqbcljopGsGyrINSJ1aKusgxpUSYBPMBhK6KDCAOhvKqLCmI+t4K13LW
 JiyywKBoPFDeuGhUFNafmUDnnzA4wuO+YnCjR1uYlDBRggwdceQrUmxUcDwHfS+VrxrrdO
 xedzWHowVO8wdpUXVaMhtxJSyakkxS0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-X0Crtv0gMruBRWmx8rxSPQ-1; Wed, 08 Mar 2023 08:06:19 -0500
X-MC-Unique: X0Crtv0gMruBRWmx8rxSPQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75BE0848D92;
 Wed,  8 Mar 2023 13:06:18 +0000 (UTC)
Received: from wi2021.rezanina.moe.rezanina.moe (unknown [10.45.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 774A3440DE;
 Wed,  8 Mar 2023 13:06:17 +0000 (UTC)
From: mrezanin@redhat.com
To: qemu-devel@nongnu.org
Cc: dwmw@amazon.co.uk, paul@xen.org, pbonzini@redhat.com,
 peter.maydell@linaro.org, Miroslav Rezanina <mrezanin@redhat.com>
Subject: [PATCH] Fix build without CONFIG_XEN_EMU
Date: Wed,  8 Mar 2023 08:05:57 -0500
Message-Id: <20230308130557.2420-1-mrezanin@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mrezanin@redhat.com;
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

From: Miroslav Rezanina <mrezanin@redhat.com>

Upstream commit ddf0fd9ae1 "hw/xen: Support HVM_PARAM_CALLBACK_TYPE_GSI callback"
added kvm_xen_maybe_deassert_callback usage to target/i386/kvm/kvm.c file without
conditional preprocessing check. This breaks any build not using CONFIG_XEN_EMU.

Protect call by conditional preprocessing to allow build without CONFIG_XEN_EMU.

Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
---
 target/i386/kvm/kvm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 1aef54f87e..de531842f6 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -4991,6 +4991,7 @@ MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run)
         kvm_rate_limit_on_bus_lock();
     }
 
+#ifdef CONFIG_XEN_EMU    
     /*
      * If the callback is asserted as a GSI (or PCI INTx) then check if
      * vcpu_info->evtchn_upcall_pending has been cleared, and deassert
@@ -5001,6 +5002,7 @@ MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run)
     if (x86_cpu->env.xen_callback_asserted) {
         kvm_xen_maybe_deassert_callback(cpu);
     }
+#endif
 
     /* We need to protect the apic state against concurrent accesses from
      * different threads in case the userspace irqchip is used. */
-- 
2.39.1



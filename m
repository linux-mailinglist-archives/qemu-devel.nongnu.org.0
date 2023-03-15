Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 718956BAE38
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 11:53:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcOjf-0006th-Lv; Wed, 15 Mar 2023 06:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pcOjb-0006rI-Ja
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 06:51:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pcOja-0000xy-6f
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 06:51:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678877513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y484XF/5n9dTTC4P4cElC5+o2eYunuK0zMCqjMK2Nk4=;
 b=Ll6Eq83IaI6BsOMkswk0J/5qpTghAgI3x0Qs29Ltfkm7Ac6BNQPhBR/zYRphPccG9K70Sp
 mjwajLSmYKUXdIXYJ+mDbIxc9y6Q5D2EkDqwJStaKufbWERdFpWfgWLxhocD6XVzGSUWMD
 CNSCzE8SEZT8bTwkN2+16iKr3JwItZg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-qJHzc8clOaqr1KX36nq0MQ-1; Wed, 15 Mar 2023 06:51:52 -0400
X-MC-Unique: qJHzc8clOaqr1KX36nq0MQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 o3-20020a5d6483000000b002cc4fe0f7fcso3113408wri.7
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 03:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678877511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y484XF/5n9dTTC4P4cElC5+o2eYunuK0zMCqjMK2Nk4=;
 b=uaDI0Fk7I2hGwp3dL1OBkgZIPbv6UfRGPjMEuHxQQdpTcgpLKGN+M3TqpoUuD06YiF
 9LQjFXDwkHGnxFL5YbA/Pn0zHnuY5Tc30+uUsTwUu1MPdcTZqrBoTnfQxMb77vvI3w1J
 hxQrUv8Y1mT1D9nbWUBhJw7vFexdPDCpwOe8nMNRa/WH5rIllGqlX8I2l1jgk7CYcLhU
 uT5/TSFt2Cyf0pN4Y0toXW9h0Lm0EtCYo9yrisF3ng3koE9HilUPPRz01pO7dU7nfBum
 Q0bWIhaGFcz7dbVUQQwqzqFcIVh1bdfazdHdPCyvZ56j+J+tOYd180VsNVu1JlW2mJzU
 JvJQ==
X-Gm-Message-State: AO0yUKXa/FwB/PwN5tfPphL9onFfD3fy43yl+hnu1y6/iDTagTjeTFFC
 q1WrObQne0anY4mat+JcfLeAeo00cIBw3kDBZrQQuaPXxkh9+v+M7A7/PABkkSM45sxDTel07gG
 YNsht/RDRflKAbBdRgm4KaoQYJ1f195vP2x1bHIh21pulxbH6YS9ZcyY14ytEBlDbd9FM6yOZG6
 0=
X-Received: by 2002:a05:600c:a46:b0:3ed:276d:81a4 with SMTP id
 c6-20020a05600c0a4600b003ed276d81a4mr8945348wmq.32.1678877511258; 
 Wed, 15 Mar 2023 03:51:51 -0700 (PDT)
X-Google-Smtp-Source: AK7set+BDQZe1JvhH6NGpeAE1G99m9Yf4Rlswlu7CdSRZAJOdNSPaElvS0YefBwbQhYeYxo7v2f7MA==
X-Received: by 2002:a05:600c:a46:b0:3ed:276d:81a4 with SMTP id
 c6-20020a05600c0a4600b003ed276d81a4mr8945330wmq.32.1678877510856; 
 Wed, 15 Mar 2023 03:51:50 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d5004000000b002ceaeb24c0asm4322227wrt.58.2023.03.15.03.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 03:51:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Miroslav Rezanina <mrezanin@redhat.com>,
 David Woodhouse <dwmw@amazon.co.uk>
Subject: [PULL 1/4] Fix build without CONFIG_XEN_EMU
Date: Wed, 15 Mar 2023 11:51:45 +0100
Message-Id: <20230315105148.611544-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315105148.611544-1-pbonzini@redhat.com>
References: <20230315105148.611544-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Message-Id: <20230308130557.2420-1-mrezanin@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm/kvm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 1aef54f87e64..de531842f6b1 100644
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
2.39.2



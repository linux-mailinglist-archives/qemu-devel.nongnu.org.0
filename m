Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D19716BAE36
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 11:52:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcOjh-0006uE-C3; Wed, 15 Mar 2023 06:52:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pcOjf-0006ti-8a
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 06:51:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pcOjd-0000yN-KH
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 06:51:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678877517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c2VIOEzLZxes85MXleyhO5ZyIaPt2L1Caway/46OBF4=;
 b=W70jWpgWKZBIakQWG5lv8zJat6AAWX2597Nn9l4H/b534+UZqI6deqndNkMpWK7bZeLpvq
 jaT7utsNUUbPPeAqX8AxqMtIZIQPp+C+713Z6ygrJmSnx4DRF/tZmVuVMhdm3o820BLKBb
 eJmZjpG1XTObAMlw0TQk+B8tibW2RpM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-dQYxfcsZM8S759oG0ZvxMg-1; Wed, 15 Mar 2023 06:51:55 -0400
X-MC-Unique: dQYxfcsZM8S759oG0ZvxMg-1
Received: by mail-wm1-f69.google.com with SMTP id
 k20-20020a05600c1c9400b003e2249bd2b4so6595613wms.5
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 03:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678877514;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c2VIOEzLZxes85MXleyhO5ZyIaPt2L1Caway/46OBF4=;
 b=0N2WF665kc3ByePKvFyqIgmGeT6M860MItwpUdXhsyFCVCitFbxDNf0nQ4lEZnjDGK
 To5Rpc2A080X5STnQaYzUtINHIKB89nQnpOVoRDwq4tfSw9RDc8Dg5WBVEu2HT0ymaP2
 20aXYRaD7dBCatNBTjvWjhkETJZBkI4sARNTvobG0bbrmAIrYmlB9vPhAbUDrGcjo5lr
 /HojyZtCKM9zqBHJV84yb+LwmDQXScTUqvUNn7+WPJ/mymayI5H8ngllajDLdMUq5A0M
 TvBcihFt2Lz/BmlaKRSGvtXlWP7rviPtjnA80ucaRFmo99cVXzFI32ksrXpayvia+k+T
 XQ1w==
X-Gm-Message-State: AO0yUKWSAf1FFitnsxag6zNy9pF565cslOBWorH31Vo+0M4XmMbG6SB3
 JUkE2PBK3U2eCuQTshWlXtiSBYmFZhg8bOBwa0Hvl2WvrCS7Wcu/Kv6anKC08NgjvrGWlMS+ovl
 3sd4k7942Qh2GG6wteahfehfb8W4RmKOvIoGAwVYm5LtetlKdAAeqbpQXpHSI+/N8CzMsV9pmd2
 o=
X-Received: by 2002:a5d:4692:0:b0:2c7:885:7333 with SMTP id
 u18-20020a5d4692000000b002c708857333mr1513052wrq.49.1678877513960; 
 Wed, 15 Mar 2023 03:51:53 -0700 (PDT)
X-Google-Smtp-Source: AK7set/VmsXy6iYmlSZctmP9LLKWl2gLe5ieAdL3TRWc2es944CGMVcWfNRwsThr3SZeT38rl94n3w==
X-Received: by 2002:a5d:4692:0:b0:2c7:885:7333 with SMTP id
 u18-20020a5d4692000000b002c708857333mr1513039wrq.49.1678877513674; 
 Wed, 15 Mar 2023 03:51:53 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a056000121200b002cf1c435afcsm4269276wrx.11.2023.03.15.03.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 03:51:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw2@infradead.org>,
	Peter Xu <peterx@redhat.com>
Subject: [PULL 3/4] hw/intc/ioapic: Update KVM routes before redelivering IRQ,
 on RTE update
Date: Wed, 15 Mar 2023 11:51:47 +0100
Message-Id: <20230315105148.611544-4-pbonzini@redhat.com>
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

From: David Woodhouse <dwmw2@infradead.org>

A Linux guest will perform IRQ migration after the IRQ has happened,
updating the RTE to point to the new destination CPU and then unmasking
the interrupt.

However, when the guest updates the RTE, ioapic_mem_write() calls
ioapic_service(), which redelivers the pending level interrupt via
kvm_set_irq(), *before* calling ioapic_update_kvm_routes() which sets
the new target CPU.

Thus, the IRQ which is supposed to go to the new target CPU is instead
misdelivered to the previous target. An example where the guest kernel
is attempting to migrate from CPU#2 to CPU#0 shows:

xenstore_read tx 0 path control/platform-feature-xs_reset_watches
ioapic_set_irq vector: 11 level: 1
ioapic_set_remote_irr set remote irr for pin 11
ioapic_service: trigger KVM IRQ 11
[    0.523627] The affinity mask was 0-3 and the handler is on 2
ioapic_mem_write ioapic mem write addr 0x0 regsel: 0x27 size 0x4 val 0x26
ioapic_update_kvm_routes: update KVM route for IRQ 11: fee02000 8021
ioapic_mem_write ioapic mem write addr 0x10 regsel: 0x26 size 0x4 val 0x18021
xenstore_reset_watches
ioapic_set_irq vector: 11 level: 1
ioapic_mem_read ioapic mem read addr 0x10 regsel: 0x26 size 0x4 retval 0x1c021
[    0.524569] ioapic_ack_level IRQ 11 moveit = 1
ioapic_eoi_broadcast EOI broadcast for vector 33
ioapic_clear_remote_irr clear remote irr for pin 11 vector 33
ioapic_mem_write ioapic mem write addr 0x0 regsel: 0x26 size 0x4 val 0x26
ioapic_mem_read ioapic mem read addr 0x10 regsel: 0x26 size 0x4 retval 0x18021
[    0.525235] ioapic_finish_move IRQ 11 calls irq_move_masked_irq()
[    0.526147] irq_do_set_affinity for IRQ 11, 0
[    0.526732] ioapic_set_affinity for IRQ 11, 0
[    0.527330] ioapic_setup_msg_from_msi for IRQ11 target 0
ioapic_mem_write ioapic mem write addr 0x0 regsel: 0x26 size 0x4 val 0x27
ioapic_mem_write ioapic mem write addr 0x10 regsel: 0x27 size 0x4 val 0x0
ioapic_mem_write ioapic mem write addr 0x0 regsel: 0x27 size 0x4 val 0x26
ioapic_mem_write ioapic mem write addr 0x10 regsel: 0x26 size 0x4 val 0x18021
[    0.527623] ioapic_set_affinity returns 0
[    0.527623] ioapic_finish_move IRQ 11 calls unmask_ioapic_irq()
ioapic_mem_write ioapic mem write addr 0x0 regsel: 0x26 size 0x4 val 0x26
ioapic_mem_write ioapic mem write addr 0x10 regsel: 0x26 size 0x4 val 0x8021
ioapic_set_remote_irr set remote irr for pin 11
ioapic_service: trigger KVM IRQ 11
ioapic_update_kvm_routes: update KVM route for IRQ 11: fee00000 8021
[    0.529571] The affinity mask was 0 and the handler is on 2
[    xenstore_watch path memory/target token FFFFFFFF92847D40

There are no other code paths in ioapic_mem_write() which need the KVM
IRQ routing table to be updated, so just shift the call from the end
of the function to happen right before the call to ioapic_service()
and thus deliver the re-enabled IRQ to the right place.

Alternative fixes might have been just to remove the part in
ioapic_service() which delivers the IRQ via kvm_set_irq() because
surely delivering as MSI ought to work just fine anyway in all cases?
That code lacks a comment justifying its existence.

Or maybe in the specific case shown in the above log, it would have
sufficed for ioapic_update_kvm_routes() to update the route *even*
when the IRQ is masked. It's not like it's actually going to get
triggered unless QEMU deliberately does so, anyway? But that only
works because the target CPU happens to be in the high word of the
RTE; if something in the *low* word (vector, perhaps) was changed
at the same time as the unmask, we'd still trigger with stale data.

Fixes: 15eafc2e602f "kvm: x86: add support for KVM_CAP_SPLIT_IRQCHIP"
Signed-off-by: David Woodhouse <dwmw2@infradead.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Message-Id: <20230308111952.2728440-2-dwmw2@infradead.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/intc/ioapic.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/intc/ioapic.c b/hw/intc/ioapic.c
index 6364ecab1bc8..716ffc8bbbda 100644
--- a/hw/intc/ioapic.c
+++ b/hw/intc/ioapic.c
@@ -405,6 +405,7 @@ ioapic_mem_write(void *opaque, hwaddr addr, uint64_t val,
                 s->ioredtbl[index] |= ro_bits;
                 s->irq_eoi[index] = 0;
                 ioapic_fix_edge_remote_irr(&s->ioredtbl[index]);
+                ioapic_update_kvm_routes(s);
                 ioapic_service(s);
             }
         }
@@ -417,8 +418,6 @@ ioapic_mem_write(void *opaque, hwaddr addr, uint64_t val,
         ioapic_eoi_broadcast(val);
         break;
     }
-
-    ioapic_update_kvm_routes(s);
 }
 
 static const MemoryRegionOps ioapic_io_ops = {
-- 
2.39.2



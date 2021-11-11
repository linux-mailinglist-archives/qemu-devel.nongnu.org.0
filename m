Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A49B244D5B9
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 12:20:21 +0100 (CET)
Received: from localhost ([::1]:56622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml87w-00009l-Pu
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 06:20:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ml7v0-0004qT-Lr
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:06:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ml7uy-0001ig-Ur
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:06:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636628816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iZIX6cRMnaI8/3/8RKmJBVyA+zNvAK13IGGFpXZi56Q=;
 b=LNTzRvtmI+Wern9fWKvrwNg3fYVq2Ow/3kDxMQLWqr+HADkkeVht9CYDvAbli4SGojPV6e
 BDtBkSrmbstXWVUxRz45fmWb5wVdEpUW+8fNMPq9VxvY3StBgq9S5Lr1Ozp1A+TraBsvzS
 kyZ2VzD45z5DJFpmbqV4Vk9JW5gsHpQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-XB0cZ4tIMJG89WaIzemoYQ-1; Thu, 11 Nov 2021 06:06:53 -0500
X-MC-Unique: XB0cZ4tIMJG89WaIzemoYQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16EC99F92A;
 Thu, 11 Nov 2021 11:06:52 +0000 (UTC)
Received: from avogadro.lan (unknown [10.39.194.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 126F610074E0;
 Thu, 11 Nov 2021 11:06:41 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] kvm: add support for KVM_GUESTDBG_BLOCKIRQ
Date: Thu, 11 Nov 2021 12:06:04 +0100
Message-Id: <20211111110604.207376-6-pbonzini@redhat.com>
In-Reply-To: <20211111110604.207376-1-pbonzini@redhat.com>
References: <20211111110604.207376-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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
Cc: cohuck@redhat.com, mst@redhat.com, alex.bennee@linaro.org,
 mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Maxim Levitsky <mlevitsk@redhat.com>

Use the KVM_GUESTDBG_BLOCKIRQ debug flag if supported. 

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
[Extracted from Maxim's patch into a separate commit. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 2f5597572a..0e66ebb497 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -61,6 +61,10 @@
 #endif
 #define PAGE_SIZE qemu_real_host_page_size
 
+#ifndef KVM_GUESTDBG_BLOCKIRQ
+#define KVM_GUESTDBG_BLOCKIRQ 0
+#endif
+
 //#define DEBUG_KVM
 
 #ifdef DEBUG_KVM
@@ -2574,6 +2578,15 @@ static int kvm_init(MachineState *ms)
     kvm_sstep_flags = 0;
     if (kvm_has_guest_debug) {
         kvm_sstep_flags = SSTEP_ENABLE;
+
+#if defined KVM_CAP_SET_GUEST_DEBUG2
+        int guest_debug_flags =
+            kvm_check_extension(s, KVM_CAP_SET_GUEST_DEBUG2);
+
+        if (guest_debug_flags & KVM_GUESTDBG_BLOCKIRQ) {
+            kvm_sstep_flags |= SSTEP_NOIRQ;
+        }
+#endif
     }
 
     kvm_state = s;
@@ -3205,6 +3218,10 @@ int kvm_update_guest_debug(CPUState *cpu, unsigned long reinject_trap)
 
     if (cpu->singlestep_enabled) {
         data.dbg.control |= KVM_GUESTDBG_ENABLE | KVM_GUESTDBG_SINGLESTEP;
+
+        if (cpu->singlestep_enabled & SSTEP_NOIRQ) {
+            data.dbg.control |= KVM_GUESTDBG_BLOCKIRQ;
+        }
     }
     kvm_arch_update_guest_debug(cpu, &data.dbg);
 
-- 
2.33.1



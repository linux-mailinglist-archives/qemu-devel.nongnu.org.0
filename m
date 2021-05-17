Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 910A2382B03
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 13:28:20 +0200 (CEST)
Received: from localhost ([::1]:39094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libQ3-0008NK-Jl
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 07:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1libIP-00067U-D5
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:20:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1libIL-0006PF-Dw
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:20:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621250420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DZL5Hgf4+hT0uj3Ih/LD0z1NCPiKgYSS9FkWfXv1AHs=;
 b=DK25LKfyG/V8uWZQwShUgBMqaTCrvuOnbb46V4UxCdcMFId/oB4oV5kW5dmqTQetmxxgsG
 Ndn8rzsQF4Ks5YvLmcRYYToYtn8eZ2GIeO/EphzEdm6OpCFAcz8Rjwc2Z83JCgKPLXLIjf
 Gigz+tnjOcnV8BqVkEOUAlADpBOZSns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-NK6kYnIuP5yCAUF4C5MHiA-1; Mon, 17 May 2021 07:20:19 -0400
X-MC-Unique: NK6kYnIuP5yCAUF4C5MHiA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A9248189C5
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 11:20:18 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66BA95E278
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 11:20:18 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/20] KVM: do not allow setting properties at runtime
Date: Mon, 17 May 2021 07:19:51 -0400
Message-Id: <20210517112001.2564006-11-pbonzini@redhat.com>
In-Reply-To: <20210517112001.2564006-1-pbonzini@redhat.com>
References: <20210517112001.2564006-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only allow accelerator properties to be set when the
accelerator is being created.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 4e0168e88b..54c0860979 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2017,7 +2017,6 @@ static int kvm_init(MachineState *ms)
     QTAILQ_INIT(&s->kvm_sw_breakpoints);
 #endif
     QLIST_INIT(&s->kvm_parked_vcpus);
-    s->vmfd = -1;
     s->fd = qemu_open_old("/dev/kvm", O_RDWR);
     if (s->fd == -1) {
         fprintf(stderr, "Could not access KVM kernel module: %m\n");
@@ -3112,6 +3111,11 @@ static void kvm_set_kvm_shadow_mem(Object *obj, Visitor *v,
     KVMState *s = KVM_STATE(obj);
     int64_t value;
 
+    if (s->fd != -1) {
+        error_setg(errp, "Cannot set properties after the accelerator has been initialized");
+        return;
+    }
+
     if (!visit_type_int(v, name, &value, errp)) {
         return;
     }
@@ -3126,6 +3130,11 @@ static void kvm_set_kernel_irqchip(Object *obj, Visitor *v,
     KVMState *s = KVM_STATE(obj);
     OnOffSplit mode;
 
+    if (s->fd != -1) {
+        error_setg(errp, "Cannot set properties after the accelerator has been initialized");
+        return;
+    }
+
     if (!visit_type_OnOffSplit(v, name, &mode, errp)) {
         return;
     }
@@ -3172,6 +3181,8 @@ static void kvm_accel_instance_init(Object *obj)
 {
     KVMState *s = KVM_STATE(obj);
 
+    s->fd = -1;
+    s->vmfd = -1;
     s->kvm_shadow_mem = -1;
     s->kernel_irqchip_allowed = true;
     s->kernel_irqchip_split = ON_OFF_AUTO_AUTO;
-- 
2.27.0




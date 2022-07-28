Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58829584203
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 16:42:40 +0200 (CEST)
Received: from localhost ([::1]:57556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH4ij-0006a0-6v
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 10:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oH4Rn-0007EQ-Ev
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 10:25:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oH4Rg-00024c-Mm
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 10:25:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659018298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fglnNCosP9QgBJWtrBjvGJmWv4b9V9TVGXzTPP4S5WY=;
 b=iRrZyL8T/iCE6BNR0g6FHEpOwFKwhV1cMCUEMUcWVrwzhom0f5u+/sLw8oek0ZUtIN0FDc
 iaZFzcvpWmQ2WLXkEIZ/ZSKD8o/yzTciIIeUySJlOekYwMMm9CNJz5387hWvYhLCSEgYkp
 kFxtfyj5Vkq5pbNfc49Qjs37YTWhuHo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-q5mOU6PBO_aqT1DD5oCukQ-1; Thu, 28 Jul 2022 10:24:57 -0400
X-MC-Unique: q5mOU6PBO_aqT1DD5oCukQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C9941019C8E;
 Thu, 28 Jul 2022 14:24:56 +0000 (UTC)
Received: from gondolin.fritz.box (unknown [10.39.193.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C73418EB7;
 Thu, 28 Jul 2022 14:24:53 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH for-7.1?] kvm: don't use perror() without useful errno
Date: Thu, 28 Jul 2022 16:24:46 +0200
Message-Id: <20220728142446.438177-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

perror() is designed to append the decoded errno value to a
string. This, however, only makes sense if we called something that
actually sets errno prior to that.

For the callers that check for split irqchip support that is not the
case, and we end up with confusing error messages that end in
"success". Use error_report() instead.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---

Not sure if that is still 7.1 material; on the one hand, it's a small
fix; on the other hand, it has been like that forever...

I've kept the Arm-specific message in place, although it might be redundant.

---
 accel/kvm/kvm-all.c | 2 +-
 target/arm/kvm.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 99aede73b7cb..6955c0b23a22 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2265,7 +2265,7 @@ static void kvm_irqchip_create(KVMState *s)
     ret = kvm_arch_irqchip_create(s);
     if (ret == 0) {
         if (s->kernel_irqchip_split == ON_OFF_AUTO_ON) {
-            perror("Split IRQ chip mode not supported.");
+            error_report("Split IRQ chip mode not supported.");
             exit(1);
         } else {
             ret = kvm_vm_ioctl(s, KVM_CREATE_IRQCHIP);
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 4339e1cd6e08..e5c1bd50d29b 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -959,7 +959,7 @@ void kvm_arch_init_irq_routing(KVMState *s)
 int kvm_arch_irqchip_create(KVMState *s)
 {
     if (kvm_kernel_irqchip_split()) {
-        perror("-machine kernel_irqchip=split is not supported on ARM.");
+        error_report("-machine kernel_irqchip=split is not supported on ARM.");
         exit(1);
     }
 
-- 
2.35.3



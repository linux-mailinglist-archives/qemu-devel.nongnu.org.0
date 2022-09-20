Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA975BECC0
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 20:26:17 +0200 (CEST)
Received: from localhost ([::1]:39290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oahwj-00065k-HN
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 14:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1oaeQQ-0008Uk-IV
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:40:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1oaeQN-0008Q8-7q
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:40:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663684833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WRKE9GwciU3Lm1vK7T0mJUi+DG1hCjul8hYQkKsmN+Q=;
 b=ANUD1GfTFOIB28Gl0kh/SEbSGTZCVRi1UZDOp/iPgvJY/Fc3w5tqFakzZbqbEzpR6NyaPx
 uX+Sq1jh46DO3OmsFY04I6JDwDE/o35M2VGcEAGfiPJV/Icx7DNWTRw1fO38AAw8aCGvRR
 uDV2vTREKwQBlTjizwrvV7LqpUyJ128=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-YcWVuJSFMuCrWmHHe5O4KQ-1; Tue, 20 Sep 2022 10:40:32 -0400
X-MC-Unique: YcWVuJSFMuCrWmHHe5O4KQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8C5C29AA2E9;
 Tue, 20 Sep 2022 14:40:31 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.194.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FD1C1759F;
 Tue, 20 Sep 2022 14:40:30 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>, Oliver Upton <oupton@google.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Subject: [PATCH] i386: Fix KVM_CAP_ADJUST_CLOCK capability check
Date: Tue, 20 Sep 2022 16:40:24 +0200
Message-Id: <20220920144024.3559708-1-vkuznets@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

KVM commit c68dc1b577ea ("KVM: x86: Report host tsc and realtime values in
KVM_GET_CLOCK") broke migration of certain workloads, e.g. Win11 + WSL2
guest reboots immediately after migration. KVM, however, is not to
blame this time. When KVM_CAP_ADJUST_CLOCK capability is checked, the
result is all supported flags (which the above mentioned KVM commit
enhanced) but kvm_has_adjust_clock_stable() wants it to be
KVM_CLOCK_TSC_STABLE precisely. The result is that 'clock_is_reliable'
is not set in vmstate and the saved clock reading is discarded in
kvmclock_vm_state_change().

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/kvm/kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index a1fd1f53791d..c33192a87dcb 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -157,7 +157,7 @@ bool kvm_has_adjust_clock_stable(void)
 {
     int ret = kvm_check_extension(kvm_state, KVM_CAP_ADJUST_CLOCK);
 
-    return (ret == KVM_CLOCK_TSC_STABLE);
+    return ret & KVM_CLOCK_TSC_STABLE;
 }
 
 bool kvm_has_adjust_clock(void)
-- 
2.37.3



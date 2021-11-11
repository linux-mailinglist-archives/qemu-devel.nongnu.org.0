Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F00A244D5B1
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 12:18:48 +0100 (CET)
Received: from localhost ([::1]:54284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml86S-000714-0v
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 06:18:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ml7uq-0004kA-Iy
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:06:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ml7uo-0001hj-Jg
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:06:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636628806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DNTCmMkPuLy8gM2yg7dD8iVap0lRERO+wFXg+J7zFtA=;
 b=OE8OB+LohuKTS00C2nwGTNW1sM7fxwPCafKqTZsrV+MGz3OAxVK9FEq2AC9qnZamrAVGch
 ia3estmNT6zBOypYoceiNCE1o7thXcVQ8EbTjDqGBV5PUSs0pSP/O+Tm5QSI3MlmL3/9qn
 PfTFZV0Pjov1Gz9tFNdj6pW8ghNiV4U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-pJCbYsDtOCKyuTDHAB7HPA-1; Thu, 11 Nov 2021 06:06:42 -0500
X-MC-Unique: pJCbYsDtOCKyuTDHAB7HPA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C74E418D6A25;
 Thu, 11 Nov 2021 11:06:41 +0000 (UTC)
Received: from avogadro.lan (unknown [10.39.194.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B9D310074E0;
 Thu, 11 Nov 2021 11:06:40 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] gdbstub, kvm: let KVM report supported singlestep flags
Date: Thu, 11 Nov 2021 12:06:03 +0100
Message-Id: <20211111110604.207376-5-pbonzini@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: cohuck@redhat.com, mst@redhat.com, alex.bennee@linaro.org,
 mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Maxim Levitsky <mlevitsk@redhat.com>

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
[Extracted from Maxim's patch into a separate commit. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c  | 12 ++++++++++++
 gdbstub.c            | 10 +++++++++-
 include/sysemu/kvm.h | 15 +++++++++++++++
 3 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index eecd8031cf..2f5597572a 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -168,6 +168,8 @@ bool kvm_vm_attributes_allowed;
 bool kvm_direct_msi_allowed;
 bool kvm_ioeventfd_any_length_allowed;
 bool kvm_msi_use_devid;
+bool kvm_has_guest_debug;
+int kvm_sstep_flags;
 static bool kvm_immediate_exit;
 static hwaddr kvm_max_slot_size = ~0;
 
@@ -2564,6 +2566,16 @@ static int kvm_init(MachineState *ms)
     kvm_ioeventfd_any_length_allowed =
         (kvm_check_extension(s, KVM_CAP_IOEVENTFD_ANY_LENGTH) > 0);
 
+#ifdef KVM_CAP_SET_GUEST_DEBUG
+    kvm_has_guest_debug =
+        (kvm_check_extension(s, KVM_CAP_SET_GUEST_DEBUG) > 0);
+#endif
+
+    kvm_sstep_flags = 0;
+    if (kvm_has_guest_debug) {
+        kvm_sstep_flags = SSTEP_ENABLE;
+    }
+
     kvm_state = s;
 
     ret = kvm_arch_init(ms, s);
diff --git a/gdbstub.c b/gdbstub.c
index 960b9fbcd0..f961d68e16 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -389,6 +389,8 @@ static void init_gdbserver_state(void)
      */
     if (replay_mode != REPLAY_MODE_NONE) {
         gdbserver_state.supported_sstep_flags = SSTEP_ENABLE;
+    } else if (kvm_enabled()) {
+        gdbserver_state.supported_sstep_flags = kvm_get_supported_sstep_flags();
     } else {
         gdbserver_state.supported_sstep_flags =
             SSTEP_ENABLE | SSTEP_NOIRQ | SSTEP_NOTIMER;
@@ -398,7 +400,8 @@ static void init_gdbserver_state(void)
      * By default use no IRQs and no timers while single stepping so as to
      * make single stepping like an ICE HW step.
      */
-    gdbserver_state.sstep_flags = gdbserver_state.supported_sstep_flags;
+    gdbserver_state.sstep_flags = SSTEP_ENABLE | SSTEP_NOIRQ | SSTEP_NOTIMER;
+    gdbserver_state.sstep_flags &= gdbserver_state.supported_sstep_flags;
 
 }
 
@@ -3518,6 +3521,11 @@ int gdbserver_start(const char *device)
         return -1;
     }
 
+    if (kvm_enabled() && !kvm_supports_guest_debug()) {
+        error_report("gdbstub: KVM doesn't support guest debugging");
+        return -1;
+    }
+
     if (!device)
         return -1;
     if (strcmp(device, "none") != 0) {
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 7b22aeb6ae..6eb39a088b 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -46,6 +46,8 @@ extern bool kvm_readonly_mem_allowed;
 extern bool kvm_direct_msi_allowed;
 extern bool kvm_ioeventfd_any_length_allowed;
 extern bool kvm_msi_use_devid;
+extern bool kvm_has_guest_debug;
+extern int kvm_sstep_flags;
 
 #define kvm_enabled()           (kvm_allowed)
 /**
@@ -167,6 +169,17 @@ extern bool kvm_msi_use_devid;
  */
 #define kvm_msi_devid_required() (kvm_msi_use_devid)
 
+/*
+ * Does KVM support guest debugging
+ */
+#define kvm_supports_guest_debug() (kvm_has_guest_debug)
+
+/*
+ * kvm_supported_sstep_flags
+ * Returns: SSTEP_* flags that KVM supports for guest debug
+ */
+#define kvm_get_supported_sstep_flags() (kvm_sstep_flags)
+
 #else
 
 #define kvm_enabled()           (0)
@@ -184,6 +197,8 @@ extern bool kvm_msi_use_devid;
 #define kvm_direct_msi_enabled() (false)
 #define kvm_ioeventfd_any_length_enabled() (false)
 #define kvm_msi_devid_required() (false)
+#define kvm_supports_guest_debug() (false)
+#define kvm_get_supported_sstep_flags() (0)
 
 #endif  /* CONFIG_KVM_IS_POSSIBLE */
 
-- 
2.33.1




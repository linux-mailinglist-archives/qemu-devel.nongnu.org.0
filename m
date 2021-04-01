Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0133515B4
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 16:45:04 +0200 (CEST)
Received: from localhost ([::1]:33456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRyZD-0000ze-M8
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 10:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1lRyWS-00005I-Ts
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 10:42:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1lRyWM-000786-Vy
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 10:42:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617288125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8e4Bei7nicGbpDHe18wJ0ubAsMrHPj23eP+6cLOjdQU=;
 b=C/eZ1MtD7Lb3CVzEOI16zlLHsxmrxL5OztAy2SJM5vq4tOGfnzH6euiZP/iLqoZQrvvm8U
 BxSpFE0B+a0EXIFbHxF5r/VP5eKIf7BNJ0noGGYI+T+48EG4MbRs7e1YTUKw+y8Sy0pzGQ
 UdthcAPf8TQkNoJUGLG5aRmMZKuMEFs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-6E2G0mzBPKilfDw9EZDSIg-1; Thu, 01 Apr 2021 10:42:03 -0400
X-MC-Unique: 6E2G0mzBPKilfDw9EZDSIg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C51B1072420;
 Thu,  1 Apr 2021 14:42:00 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A49D5D6B1;
 Thu,  1 Apr 2021 14:41:58 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] gdbstub: implement NOIRQ support for single step on KVM,
 when kvm's KVM_GUESTDBG_BLOCKIRQ debug flag is supported.
Date: Thu,  1 Apr 2021 17:41:52 +0300
Message-Id: <20210401144152.1031282-3-mlevitsk@redhat.com>
In-Reply-To: <20210401144152.1031282-1-mlevitsk@redhat.com>
References: <20210401144152.1031282-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 accel/kvm/kvm-all.c  | 25 +++++++++++++++++++
 gdbstub.c            | 59 ++++++++++++++++++++++++++++++++++++--------
 include/sysemu/kvm.h | 13 ++++++++++
 3 files changed, 87 insertions(+), 10 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index b6d9f92f15..bc7955fb19 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -147,6 +147,8 @@ bool kvm_vm_attributes_allowed;
 bool kvm_direct_msi_allowed;
 bool kvm_ioeventfd_any_length_allowed;
 bool kvm_msi_use_devid;
+bool kvm_has_guest_debug;
+int kvm_sstep_flags;
 static bool kvm_immediate_exit;
 static hwaddr kvm_max_slot_size = ~0;
 
@@ -2186,6 +2188,25 @@ static int kvm_init(MachineState *ms)
     kvm_ioeventfd_any_length_allowed =
         (kvm_check_extension(s, KVM_CAP_IOEVENTFD_ANY_LENGTH) > 0);
 
+    kvm_has_guest_debug =
+        (kvm_check_extension(s, KVM_CAP_SET_GUEST_DEBUG) > 0);
+
+    kvm_sstep_flags = 0;
+
+    if (kvm_has_guest_debug) {
+        /* Assume that single stepping is supported */
+        kvm_sstep_flags = SSTEP_ENABLE;
+
+        int guest_debug_flags =
+            kvm_check_extension(s, KVM_CAP_SET_GUEST_DEBUG2);
+
+        if (guest_debug_flags > 0) {
+            if (guest_debug_flags & KVM_GUESTDBG_BLOCKIRQ) {
+                kvm_sstep_flags |= SSTEP_NOIRQ;
+            }
+        }
+    }
+
     kvm_state = s;
 
     ret = kvm_arch_init(ms, s);
@@ -2796,6 +2817,10 @@ int kvm_update_guest_debug(CPUState *cpu, unsigned long reinject_trap)
 
     if (cpu->singlestep_enabled) {
         data.dbg.control |= KVM_GUESTDBG_ENABLE | KVM_GUESTDBG_SINGLESTEP;
+
+        if (cpu->singlestep_enabled & SSTEP_NOIRQ) {
+            data.dbg.control |= KVM_GUESTDBG_BLOCKIRQ;
+        }
     }
     kvm_arch_update_guest_debug(cpu, &data.dbg);
 
diff --git a/gdbstub.c b/gdbstub.c
index 054665e93e..f789ded99d 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -369,12 +369,11 @@ typedef struct GDBState {
     gdb_syscall_complete_cb current_syscall_cb;
     GString *str_buf;
     GByteArray *mem_buf;
+    int sstep_flags;
+    int supported_sstep_flags;
 } GDBState;
 
-/* By default use no IRQs and no timers while single stepping so as to
- * make single stepping like an ICE HW step.
- */
-static int sstep_flags = SSTEP_ENABLE|SSTEP_NOIRQ|SSTEP_NOTIMER;
+static GDBState gdbserver_state;
 
 /* Retrieves flags for single step mode. */
 static int get_sstep_flags(void)
@@ -386,11 +385,10 @@ static int get_sstep_flags(void)
     if (replay_mode != REPLAY_MODE_NONE) {
         return SSTEP_ENABLE;
     } else {
-        return sstep_flags;
+        return gdbserver_state.sstep_flags;
     }
 }
 
-static GDBState gdbserver_state;
 
 static void init_gdbserver_state(void)
 {
@@ -400,6 +398,23 @@ static void init_gdbserver_state(void)
     gdbserver_state.str_buf = g_string_new(NULL);
     gdbserver_state.mem_buf = g_byte_array_sized_new(MAX_PACKET_LENGTH);
     gdbserver_state.last_packet = g_byte_array_sized_new(MAX_PACKET_LENGTH + 4);
+
+
+    if (kvm_enabled()) {
+        gdbserver_state.supported_sstep_flags = kvm_get_supported_sstep_flags();
+    } else {
+        gdbserver_state.supported_sstep_flags =
+            SSTEP_ENABLE | SSTEP_NOIRQ | SSTEP_NOTIMER;
+    }
+
+    /*
+     * By default use no IRQs and no timers while single stepping so as to
+     * make single stepping like an ICE HW step.
+     */
+
+    gdbserver_state.sstep_flags = SSTEP_ENABLE | SSTEP_NOIRQ | SSTEP_NOTIMER;
+    gdbserver_state.sstep_flags &= gdbserver_state.supported_sstep_flags;
+
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -2023,24 +2038,43 @@ static void handle_v_commands(GdbCmdContext *gdb_ctx, void *user_ctx)
 
 static void handle_query_qemu_sstepbits(GdbCmdContext *gdb_ctx, void *user_ctx)
 {
-    g_string_printf(gdbserver_state.str_buf, "ENABLE=%x,NOIRQ=%x,NOTIMER=%x",
-                    SSTEP_ENABLE, SSTEP_NOIRQ, SSTEP_NOTIMER);
+    g_string_printf(gdbserver_state.str_buf, "ENABLE=%x", SSTEP_ENABLE);
+
+    if (gdbserver_state.supported_sstep_flags & SSTEP_NOIRQ) {
+        g_string_append_printf(gdbserver_state.str_buf, ",NOIRQ=%x",
+                               SSTEP_NOIRQ);
+    }
+
+    if (gdbserver_state.supported_sstep_flags & SSTEP_NOTIMER) {
+        g_string_append_printf(gdbserver_state.str_buf, ",NOTIMER=%x",
+                               SSTEP_NOTIMER);
+    }
+
     put_strbuf();
 }
 
 static void handle_set_qemu_sstep(GdbCmdContext *gdb_ctx, void *user_ctx)
 {
+    int new_sstep_flags;
     if (!gdb_ctx->num_params) {
         return;
     }
 
-    sstep_flags = gdb_ctx->params[0].val_ul;
+    new_sstep_flags = gdb_ctx->params[0].val_ul;
+
+    if (new_sstep_flags  & ~gdbserver_state.supported_sstep_flags) {
+        put_packet("E22");
+        return;
+    }
+
+    gdbserver_state.sstep_flags = new_sstep_flags;
     put_packet("OK");
 }
 
 static void handle_query_qemu_sstep(GdbCmdContext *gdb_ctx, void *user_ctx)
 {
-    g_string_printf(gdbserver_state.str_buf, "0x%x", sstep_flags);
+    g_string_printf(gdbserver_state.str_buf, "0x%x",
+                    gdbserver_state.sstep_flags);
     put_strbuf();
 }
 
@@ -3499,6 +3533,11 @@ int gdbserver_start(const char *device)
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
index a1ab1ee12d..42f9ce6344 100644
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
-- 
2.26.2



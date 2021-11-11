Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 864BD44D5AC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 12:17:07 +0100 (CET)
Received: from localhost ([::1]:49846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml84o-00041i-MS
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 06:17:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ml7un-0004i4-FF
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:06:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ml7uk-0001hM-Na
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:06:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636628802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EtXZQzHkYnJ7V2Lx5Bxgs92ZNrsLI4S7ap0I/bMsknw=;
 b=IyIGzec2mRHonwpFGaCkq/InxEyOSy1LXJNa2o/sQQUcKy42UIJ/3ZziHm8IdNx/haCkCb
 Kpg6eKXX3pvv7+ydN68NziNTn7sm2jzvqap43quJnUd8eEdA1I8wlOZcQ5nXZq/8b4DUjs
 YLk03KCXgNoOTPaUiXv/gc8coWud/sQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-cedi2cUvMBOKLbhvwBwOQQ-1; Thu, 11 Nov 2021 06:06:40 -0500
X-MC-Unique: cedi2cUvMBOKLbhvwBwOQQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCF5318D6A2E;
 Thu, 11 Nov 2021 11:06:39 +0000 (UTC)
Received: from avogadro.lan (unknown [10.39.194.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29DAB10074E0;
 Thu, 11 Nov 2021 11:06:37 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] gdbstub: reject unsupported flags in handle_set_qemu_sstep
Date: Thu, 11 Nov 2021 12:06:02 +0100
Message-Id: <20211111110604.207376-4-pbonzini@redhat.com>
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

handle_query_qemu_sstepbits is reporting NOIRQ and NOTIMER bits
even if they are not supported (as is the case with record/replay).
Instead, store the supported singlestep flags and reject
any unsupported bits in handle_set_qemu_sstep.  This removes
the need for the get_sstep_flags() wrapper.

While at it, move the variables in GDBState, instead of using
global variables.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
[Extracted from Maxim's patch into a separate commit. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 gdbstub.c | 73 +++++++++++++++++++++++++++++++++++--------------------
 1 file changed, 47 insertions(+), 26 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 23baaef40e..960b9fbcd0 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -368,27 +368,10 @@ typedef struct GDBState {
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
-
-/* Retrieves flags for single step mode. */
-static int get_sstep_flags(void)
-{
-    /*
-     * In replay mode all events written into the log should be replayed.
-     * That is why NOIRQ flag is removed in this mode.
-     */
-    if (replay_mode != REPLAY_MODE_NONE) {
-        return SSTEP_ENABLE;
-    } else {
-        return sstep_flags;
-    }
-}
-
 static GDBState gdbserver_state;
 
 static void init_gdbserver_state(void)
@@ -399,6 +382,24 @@ static void init_gdbserver_state(void)
     gdbserver_state.str_buf = g_string_new(NULL);
     gdbserver_state.mem_buf = g_byte_array_sized_new(MAX_PACKET_LENGTH);
     gdbserver_state.last_packet = g_byte_array_sized_new(MAX_PACKET_LENGTH + 4);
+
+    /*
+     * In replay mode all events written into the log should be replayed.
+     * That is why NOIRQ flag is removed in this mode.
+     */
+    if (replay_mode != REPLAY_MODE_NONE) {
+        gdbserver_state.supported_sstep_flags = SSTEP_ENABLE;
+    } else {
+        gdbserver_state.supported_sstep_flags =
+            SSTEP_ENABLE | SSTEP_NOIRQ | SSTEP_NOTIMER;
+    }
+
+    /*
+     * By default use no IRQs and no timers while single stepping so as to
+     * make single stepping like an ICE HW step.
+     */
+    gdbserver_state.sstep_flags = gdbserver_state.supported_sstep_flags;
+
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -505,7 +506,7 @@ static int gdb_continue_partial(char *newstates)
     CPU_FOREACH(cpu) {
         if (newstates[cpu->cpu_index] == 's') {
             trace_gdbstub_op_stepping(cpu->cpu_index);
-            cpu_single_step(cpu, sstep_flags);
+            cpu_single_step(cpu, gdbserver_state.sstep_flags);
         }
     }
     gdbserver_state.running_state = 1;
@@ -524,7 +525,7 @@ static int gdb_continue_partial(char *newstates)
                 break; /* nothing to do here */
             case 's':
                 trace_gdbstub_op_stepping(cpu->cpu_index);
-                cpu_single_step(cpu, get_sstep_flags());
+                cpu_single_step(cpu, gdbserver_state.sstep_flags);
                 cpu_resume(cpu);
                 flag = 1;
                 break;
@@ -1883,7 +1884,7 @@ static void handle_step(GArray *params, void *user_ctx)
         gdb_set_cpu_pc((target_ulong)get_param(params, 0)->val_ull);
     }
 
-    cpu_single_step(gdbserver_state.c_cpu, get_sstep_flags());
+    cpu_single_step(gdbserver_state.c_cpu, gdbserver_state.sstep_flags);
     gdb_continue();
 }
 
@@ -2017,24 +2018,44 @@ static void handle_v_commands(GArray *params, void *user_ctx)
 
 static void handle_query_qemu_sstepbits(GArray *params, void *user_ctx)
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
 
 static void handle_set_qemu_sstep(GArray *params, void *user_ctx)
 {
+    int new_sstep_flags;
+
     if (!params->len) {
         return;
     }
 
-    sstep_flags = get_param(params, 0)->val_ul;
+    new_sstep_flags = get_param(params, 0)->val_ul;
+
+    if (new_sstep_flags  & ~gdbserver_state.supported_sstep_flags) {
+        put_packet("E22");
+        return;
+    }
+
+    gdbserver_state.sstep_flags = new_sstep_flags;
     put_packet("OK");
 }
 
 static void handle_query_qemu_sstep(GArray *params, void *user_ctx)
 {
-    g_string_printf(gdbserver_state.str_buf, "0x%x", sstep_flags);
+    g_string_printf(gdbserver_state.str_buf, "0x%x",
+                    gdbserver_state.sstep_flags);
     put_strbuf();
 }
 
-- 
2.33.1




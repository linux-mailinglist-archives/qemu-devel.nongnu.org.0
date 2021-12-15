Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE20A476349
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 21:28:35 +0100 (CET)
Received: from localhost ([::1]:59844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxat8-0006oZ-SQ
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 15:28:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxaq5-0003tT-47
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:25:26 -0500
Received: from [2a00:1450:4864:20::32a] (port=38591
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxaq3-0004ER-2b
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:25:24 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso156995wms.3
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 12:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I3y862zoRHN1T4kVrw1MVvH57TGIFnzeTb+VnBs+XRw=;
 b=cuxvvX9ZWR9aix6uEuOfzVmn/7hb6MSijNWvFKda4fyHI1nGcQIbfjQvrGAzp3UYuC
 C4BiphbYTcR0+qSwCQu5kcJ+KLSHMiFPrmC5BnYeNGqHk4PktuKJsUKBuyosbgzFyFy7
 2op4Mn5iq9zlLo558RQIK/YoCMtpRG4ixhQ2Qgyv7JVf18EsR9D9oX5JsAeF4XXXsRo1
 g9mFm1RlbJKWWRzEtg+IT2HyZBbQfzX85fjb/nuqejCYc01/GL1nuLB7enKAuwuJ9z7w
 GVsilR61+/Cvyq1iGKH03OBH6TS6SCtG+JYKYVJv3NIVyFBytKOhMdpSZ4JZQjStVPGr
 H3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=I3y862zoRHN1T4kVrw1MVvH57TGIFnzeTb+VnBs+XRw=;
 b=10vKFXD6yHnHzeS/5XnSrreli1Lb62DSdLPoDV3Qbw+Dkk6YdWuSF5azgkwbhyBhZc
 UVyQfXwo+ToIcI3TmMoezfxqx1GWjPuBhoEFRoSKSr6z806xU8NdEEZDfxBdIwJqF5mZ
 6d4MjsZbEQUokKdtFhiyJ6qxEkHwqB/Z/OMWy5d0iHEh+XDsP8jLaErubapsqkxNYvwK
 bWuuDTtavEkV7WkfOlRx8d7qlI4rdMPybC+QTriJp5CMpToFO0/QhR2sCDzNb9Lp/SgP
 f3edgSDA9eu/hwenNAcGrdyIxb5WKRJfW+nnZhtzJ4jGffHoq7SQwCDO2HWm4siwBc07
 3SSw==
X-Gm-Message-State: AOAM532JPWtqZOIYgPu6FBuisPy6qd8uZKchCFYnxYZIxcCGbmiLhvUw
 9CamPmd66irNSH1IaN13IOzILHZkje4=
X-Google-Smtp-Source: ABdhPJxRKUOzPuWqVjN3g/BVE+Mm4IALNGReGVVpY+lK5QLCj25kjgHMYIodBpCerLHxHz4TNJuMUQ==
X-Received: by 2002:a7b:ce8c:: with SMTP id q12mr1841643wmj.91.1639599921652; 
 Wed, 15 Dec 2021 12:25:21 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id y11sm3794708wry.70.2021.12.15.12.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 12:25:21 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/13] gdbstub: reject unsupported flags in
 handle_set_qemu_sstep
Date: Wed, 15 Dec 2021 21:25:09 +0100
Message-Id: <20211215202515.91586-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215202515.91586-1-pbonzini@redhat.com>
References: <20211215202515.91586-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Maxim Levitsky <mlevitsk@redhat.com>
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
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211111110604.207376-4-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 gdbstub.c | 75 ++++++++++++++++++++++++++++++++++++-------------------
 1 file changed, 49 insertions(+), 26 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 141d7bc4ec..a955175fd4 100644
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
@@ -399,6 +382,26 @@ static void init_gdbserver_state(void)
     gdbserver_state.str_buf = g_string_new(NULL);
     gdbserver_state.mem_buf = g_byte_array_sized_new(MAX_PACKET_LENGTH);
     gdbserver_state.last_packet = g_byte_array_sized_new(MAX_PACKET_LENGTH + 4);
+
+    /*
+     * In replay mode all events will come from the log and can't be
+     * suppressed otherwise we would break determinism. However as those
+     * events are tied to the number of executed instructions we won't see
+     * them occurring every time we single step.
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
@@ -505,7 +508,7 @@ static int gdb_continue_partial(char *newstates)
     CPU_FOREACH(cpu) {
         if (newstates[cpu->cpu_index] == 's') {
             trace_gdbstub_op_stepping(cpu->cpu_index);
-            cpu_single_step(cpu, sstep_flags);
+            cpu_single_step(cpu, gdbserver_state.sstep_flags);
         }
     }
     gdbserver_state.running_state = 1;
@@ -524,7 +527,7 @@ static int gdb_continue_partial(char *newstates)
                 break; /* nothing to do here */
             case 's':
                 trace_gdbstub_op_stepping(cpu->cpu_index);
-                cpu_single_step(cpu, get_sstep_flags());
+                cpu_single_step(cpu, gdbserver_state.sstep_flags);
                 cpu_resume(cpu);
                 flag = 1;
                 break;
@@ -1883,7 +1886,7 @@ static void handle_step(GArray *params, void *user_ctx)
         gdb_set_cpu_pc((target_ulong)get_param(params, 0)->val_ull);
     }
 
-    cpu_single_step(gdbserver_state.c_cpu, get_sstep_flags());
+    cpu_single_step(gdbserver_state.c_cpu, gdbserver_state.sstep_flags);
     gdb_continue();
 }
 
@@ -2017,24 +2020,44 @@ static void handle_v_commands(GArray *params, void *user_ctx)
 
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




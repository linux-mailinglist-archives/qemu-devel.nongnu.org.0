Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AA131D034
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 19:28:29 +0100 (CET)
Received: from localhost ([::1]:52708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC55I-0004Rx-P8
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 13:28:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lC53C-00035t-7J
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 13:26:18 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:35388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lC539-0007Mj-KY
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 13:26:18 -0500
Received: by mail-wr1-x42b.google.com with SMTP id l12so14429397wry.2
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 10:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yqsbTHTTOa7rHNBF4QGybpcyGyE8zlRS5Tnaearu2tA=;
 b=LcyWiigUNcNhu7AVGVj/L03+FcVhOmk9nIGivD1ioc9rRPgEDAbDZBtflxYseVxF2Q
 cnAeCBq3+GPny8KxxxcrerEXuG5+Q1ifeM+uFHkTuc4jy3JJvDCihBf0ssJQwC+6kueA
 nQ5LntiVidSisorWL9EmG9i0ramI6povdEBqrVoX5fgD/BRhbKdKyY//4IGC+Y1mKtYm
 ZWTVePaIc1HBfLmB88z0rriovjsmGLUig667arKgao57JRWXSlwoD3OxLkCifiBypzBn
 cQPwZUlHNi4TYeivOi568+o8WtfQVqf0UqRso656cFqH7+N1PNviXJzWRcxrbJ4MUYS0
 UOtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yqsbTHTTOa7rHNBF4QGybpcyGyE8zlRS5Tnaearu2tA=;
 b=M4b7WHU/NaEA71FZvF6DGaoKHTpQ3jYaHSxaeVBNebPfWfVKIxGOlcyTRESXvErz5Q
 qQH9Ib75uUDi6CuinBReQ1PjekB354Wa16xJ6fMjM673wDgj+qepagfW/zpjMOWrYsuf
 XpnsXbttDUF+WBXpWhR8UHEV4aAIBxP6o2tBkA03PJ/mwzQWAH3OY75FGBFZoWORQ5aM
 BQPcJzKMuTqgJy8DCEWtfMLTQJKOuD3iP4UVZ6kzXXsNT4cGq1eBjy2Fr9p4eFaMoDK9
 lzPDz/IBGZgMy+2ngVmXkbOFp7fXAGGnQeXmkJc0LWy8lZGDtDDpq8z131ZdQXCYO1pO
 NlXw==
X-Gm-Message-State: AOAM530YZe4n0RuY7YAV7vbKkBsmsx+EVSUjj3KiHXzcvL7/z8CQLhlL
 a2toOu1L3EVDB9nEDJHQ2/EnjZPEndM=
X-Google-Smtp-Source: ABdhPJxQPNHHXK8IAUSfftkkY0DKbXWs3W346ZKRaewvRqtDV71+OCgULEzBnwTqwkwiwmRIY8F7yg==
X-Received: by 2002:adf:b1cd:: with SMTP id r13mr25055489wra.157.1613499974387; 
 Tue, 16 Feb 2021 10:26:14 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i10sm39394601wrp.0.2021.02.16.10.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 10:26:14 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/21] replay: fix icount request when replaying clock access
Date: Tue, 16 Feb 2021 19:26:11 +0100
Message-Id: <20210216182611.139813-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210216182611.139813-1-pbonzini@redhat.com>
References: <20210216182611.139813-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.19,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

Record/replay provides REPLAY_CLOCK_LOCKED macro to access
the clock when vm_clock_seqlock is locked. This macro is
needed because replay internals operate icount. In locked case
replay use icount_get_raw_locked for icount request, which prevents
excess locking which leads to deadlock. But previously only
record code used *_locked function and replay did not.
Therefore sometimes clock access lead to deadlocks.
This patch fixes clock access for replay too and uses *_locked
icount access function.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Message-Id: <161347990483.1313189.8371838968343494161.stgit@pasha-ThinkPad-X280>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/sysemu/replay.h  | 14 ++++++++------
 replay/replay-internal.c | 29 +++++++++++++++++++++++++----
 replay/replay-time.c     |  4 ++--
 replay/replay.c          | 23 +----------------------
 stubs/replay-tools.c     |  2 +-
 5 files changed, 37 insertions(+), 35 deletions(-)

diff --git a/include/sysemu/replay.h b/include/sysemu/replay.h
index 56c0c17c30..0f3b0f7eac 100644
--- a/include/sysemu/replay.h
+++ b/include/sysemu/replay.h
@@ -128,18 +128,20 @@ bool replay_has_interrupt(void);
 int64_t replay_save_clock(ReplayClockKind kind, int64_t clock,
                           int64_t raw_icount);
 /*! Read the specified clock from the log or return cached data */
-int64_t replay_read_clock(ReplayClockKind kind);
+int64_t replay_read_clock(ReplayClockKind kind, int64_t raw_icount);
 /*! Saves or reads the clock depending on the current replay mode. */
 #define REPLAY_CLOCK(clock, value)                                      \
-    (replay_mode == REPLAY_MODE_PLAY ? replay_read_clock((clock))       \
+    (replay_mode == REPLAY_MODE_PLAY                                    \
+        ? replay_read_clock((clock), icount_get_raw())                  \
         : replay_mode == REPLAY_MODE_RECORD                             \
-            ? replay_save_clock((clock), (value), icount_get_raw()) \
-        : (value))
+            ? replay_save_clock((clock), (value), icount_get_raw())     \
+            : (value))
 #define REPLAY_CLOCK_LOCKED(clock, value)                               \
-    (replay_mode == REPLAY_MODE_PLAY ? replay_read_clock((clock))       \
+    (replay_mode == REPLAY_MODE_PLAY                                    \
+        ? replay_read_clock((clock), icount_get_raw_locked())           \
         : replay_mode == REPLAY_MODE_RECORD                             \
             ? replay_save_clock((clock), (value), icount_get_raw_locked()) \
-        : (value))
+            : (value))
 
 /* Processing data from random generators */
 
diff --git a/replay/replay-internal.c b/replay/replay-internal.c
index 2e8a3e947a..77d0c82327 100644
--- a/replay/replay-internal.c
+++ b/replay/replay-internal.c
@@ -247,10 +247,31 @@ void replay_advance_current_icount(uint64_t current_icount)
     /* Time can only go forward */
     assert(diff >= 0);
 
-    if (diff > 0) {
-        replay_put_event(EVENT_INSTRUCTION);
-        replay_put_dword(diff);
-        replay_state.current_icount += diff;
+    if (replay_mode == REPLAY_MODE_RECORD) {
+        if (diff > 0) {
+            replay_put_event(EVENT_INSTRUCTION);
+            replay_put_dword(diff);
+            replay_state.current_icount += diff;
+        }
+    } else if (replay_mode == REPLAY_MODE_PLAY) {
+        if (diff > 0) {
+            replay_state.instruction_count -= diff;
+            replay_state.current_icount += diff;
+            if (replay_state.instruction_count == 0) {
+                assert(replay_state.data_kind == EVENT_INSTRUCTION);
+                replay_finish_event();
+                /* Wake up iothread. This is required because
+                    timers will not expire until clock counters
+                    will be read from the log. */
+                qemu_notify_event();
+            }
+        }
+        /* Execution reached the break step */
+        if (replay_break_icount == replay_state.current_icount) {
+            /* Cannot make callback directly from the vCPU thread */
+            timer_mod_ns(replay_break_timer,
+                qemu_clock_get_ns(QEMU_CLOCK_REALTIME));
+        }
     }
 }
 
diff --git a/replay/replay-time.c b/replay/replay-time.c
index 43357c9f24..00ebcb7a49 100644
--- a/replay/replay-time.c
+++ b/replay/replay-time.c
@@ -46,12 +46,12 @@ void replay_read_next_clock(ReplayClockKind kind)
 }
 
 /*! Reads next clock event from the input. */
-int64_t replay_read_clock(ReplayClockKind kind)
+int64_t replay_read_clock(ReplayClockKind kind, int64_t raw_icount)
 {
     int64_t ret;
     g_assert(replay_file && replay_mutex_locked());
 
-    replay_account_executed_instructions();
+    replay_advance_current_icount(raw_icount);
 
     if (replay_next_event_is(EVENT_CLOCK + kind)) {
         replay_read_next_clock(kind);
diff --git a/replay/replay.c b/replay/replay.c
index d4c228ab28..c806fec69a 100644
--- a/replay/replay.c
+++ b/replay/replay.c
@@ -94,28 +94,7 @@ void replay_account_executed_instructions(void)
     if (replay_mode == REPLAY_MODE_PLAY) {
         g_assert(replay_mutex_locked());
         if (replay_state.instruction_count > 0) {
-            int count = (int)(replay_get_current_icount()
-                              - replay_state.current_icount);
-
-            /* Time can only go forward */
-            assert(count >= 0);
-
-            replay_state.instruction_count -= count;
-            replay_state.current_icount += count;
-            if (replay_state.instruction_count == 0) {
-                assert(replay_state.data_kind == EVENT_INSTRUCTION);
-                replay_finish_event();
-                /* Wake up iothread. This is required because
-                   timers will not expire until clock counters
-                   will be read from the log. */
-                qemu_notify_event();
-            }
-            /* Execution reached the break step */
-            if (replay_break_icount == replay_state.current_icount) {
-                /* Cannot make callback directly from the vCPU thread */
-                timer_mod_ns(replay_break_timer,
-                    qemu_clock_get_ns(QEMU_CLOCK_REALTIME));
-            }
+            replay_advance_current_icount(replay_get_current_icount());
         }
     }
 }
diff --git a/stubs/replay-tools.c b/stubs/replay-tools.c
index c06b360e22..43296b3d4e 100644
--- a/stubs/replay-tools.c
+++ b/stubs/replay-tools.c
@@ -13,7 +13,7 @@ int64_t replay_save_clock(unsigned int kind, int64_t clock, int64_t raw_icount)
     return 0;
 }
 
-int64_t replay_read_clock(unsigned int kind)
+int64_t replay_read_clock(unsigned int kind, int64_t raw_icount)
 {
     abort();
     return 0;
-- 
2.29.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A46460B427
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 19:31:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on16z-0000SD-LQ; Mon, 24 Oct 2022 13:19:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1on16w-0000P6-0f
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 13:19:38 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1on16p-0002hB-HP
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 13:19:37 -0400
Received: by mail-wr1-x42d.google.com with SMTP id bs21so1407457wrb.4
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 10:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zN8eZ3sDF0JepmaSWchVQLpqUqMskvP9M8txyDY11sU=;
 b=p8ly8nBv72YRXwQONRvPscRhbaEFHfFfEmKj6i8yKvfn85g2AlWGnI28cVK07V5bKb
 nqw2uxLS9RFPw74uJZMyRhg330yAGQvO+C4+ZgMPfJIiWJfEfMCoVAoz2ErkpLvo5og4
 R0X56dNyt4u+oLqa6GqxRGggol5CtNSwY6E0QGMeG/xwUHIJ+Leg5YiTX8zGT2hpgnwd
 Oh0n85zDgJrCiwqGAB246Bdt3ir1acCKz3NC8hL3+SPlMcfvurtChO6K9g+rNwssz1p0
 e3nNGruW7n//r6dofXUCZK0e+cj6uCOZ0b1/qHv1rDAgo0M2iaoUt+Tf5re8lym5bXmM
 UdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zN8eZ3sDF0JepmaSWchVQLpqUqMskvP9M8txyDY11sU=;
 b=uhscIe7EzcloijVN2H00E3lCfcj8blbhpS8ZnVAnz4ZvjuxAAOm4dDsSLAt3odyGix
 yRoM+3nC5oaGE0LO66geDWjeFvmGTq65u9bwXpK6n1iC6TGuo/tvYnJU6IMvHD1QTVmi
 YVReNXIY9RIpytLvPhI44yiNfp6ZNwukm1WskJXXbIEuPL09gQvRqfWvs+gZ6TD5pmmJ
 CZvDoQS2YooAZWEQFzKtbQNgo2e6h0INpXovhYkf8od5UcLUdfLAWHnsg+XNfCIeoZ1j
 WMk3FyXh9c/nrv0xFLmfyR+U3vBGMV12pKJGXgviQkVnD/YXzbc/PeL1+L9QX0jrA4HM
 FmTA==
X-Gm-Message-State: ACrzQf1nxoJU2f/C+Wqjg5fmG8qXqNHFeq83+EzVvJyL7CLPOEgpolGQ
 lEipkRYSRxolXVJyu91TcsFJWU2Q7nCsCw==
X-Google-Smtp-Source: AMsMyM7sGomxnnsI+8dUUfmcBTFtdGlbUq39o0rE8xRyCajX8QPB/bdyZwFyV3SLFbdFe/zyBOnmDA==
X-Received: by 2002:a05:6000:15c8:b0:22f:c428:2493 with SMTP id
 y8-20020a05600015c800b0022fc4282493mr21711724wry.83.1666631957617; 
 Mon, 24 Oct 2022 10:19:17 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a05600c0a0300b003a682354f63sm9706442wmp.11.2022.10.24.10.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 10:19:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 980661FFB7;
 Mon, 24 Oct 2022 18:19:16 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [RFC PATCH] main-loop: introduce WITH_QEMU_IOTHREAD_LOCK
Date: Mon, 24 Oct 2022 18:19:09 +0100
Message-Id: <20221024171909.434818-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This helper intends to ape our other auto-unlocking helpers with
WITH_QEMU_LOCK_GUARD. The principle difference is the iothread lock
is often nested needs a little extra book keeping to ensure we don't
double lock or unlock a lock taken higher up the call chain.

Convert some of the common routines that follow this pattern to use
the new wrapper.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/main-loop.h | 41 ++++++++++++++++++++++++++++++++++++++++
 hw/core/cpu-common.c     | 10 ++--------
 util/rcu.c               | 40 ++++++++++++++++-----------------------
 ui/cocoa.m               | 18 ++++--------------
 4 files changed, 63 insertions(+), 46 deletions(-)

diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index aac707d073..604e1823da 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -341,6 +341,47 @@ void qemu_mutex_lock_iothread_impl(const char *file, int line);
  */
 void qemu_mutex_unlock_iothread(void);
 
+/**
+ * WITH_QEMU_IOTHREAD_LOCK - nested lock of iothread
+ *
+ * This is a specialised form of WITH_QEMU_LOCK_GUARD which is used to
+ * safely encapsulate code that needs the BQL. The main difference is
+ * the BQL is often nested so we need to save the state of it on entry
+ * so we know if we need to free it once we leave the scope of the gaurd.
+ */
+
+typedef struct {
+    bool taken;
+} IoThreadLocked;
+
+static inline IoThreadLocked * qemu_iothread_auto_lock(IoThreadLocked *x)
+{
+    bool locked = qemu_mutex_iothread_locked();
+    if (!locked) {
+        qemu_mutex_lock_iothread();
+        x->taken = true;
+    }
+    return x;
+}
+
+static inline void qemu_iothread_auto_unlock(IoThreadLocked *x)
+{
+    if (x->taken) {
+        qemu_mutex_unlock_iothread();
+    }
+}
+
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(IoThreadLocked, qemu_iothread_auto_unlock)
+
+#define WITH_QEMU_IOTHREAD_LOCK_(var) \
+    for (g_autoptr(IoThreadLocked) var = \
+             qemu_iothread_auto_lock(&(IoThreadLocked) {}); \
+         var; \
+         qemu_iothread_auto_unlock(var), var = NULL)
+
+#define WITH_QEMU_IOTHREAD_LOCK \
+    WITH_QEMU_IOTHREAD_LOCK_(glue(qemu_lockable_auto, __COUNTER__))
+
 /*
  * qemu_cond_wait_iothread: Wait on condition for the main loop mutex
  *
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index f9fdd46b9d..0a60f916a9 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -70,14 +70,8 @@ CPUState *cpu_create(const char *typename)
  * BQL here if we need to.  cpu_interrupt assumes it is held.*/
 void cpu_reset_interrupt(CPUState *cpu, int mask)
 {
-    bool need_lock = !qemu_mutex_iothread_locked();
-
-    if (need_lock) {
-        qemu_mutex_lock_iothread();
-    }
-    cpu->interrupt_request &= ~mask;
-    if (need_lock) {
-        qemu_mutex_unlock_iothread();
+    WITH_QEMU_IOTHREAD_LOCK {
+        cpu->interrupt_request &= ~mask;
     }
 }
 
diff --git a/util/rcu.c b/util/rcu.c
index b6d6c71cff..02e7491de1 100644
--- a/util/rcu.c
+++ b/util/rcu.c
@@ -320,35 +320,27 @@ static void drain_rcu_callback(struct rcu_head *node)
 void drain_call_rcu(void)
 {
     struct rcu_drain rcu_drain;
-    bool locked = qemu_mutex_iothread_locked();
 
     memset(&rcu_drain, 0, sizeof(struct rcu_drain));
     qemu_event_init(&rcu_drain.drain_complete_event, false);
 
-    if (locked) {
-        qemu_mutex_unlock_iothread();
-    }
-
-
-    /*
-     * RCU callbacks are invoked in the same order as in which they
-     * are registered, thus we can be sure that when 'drain_rcu_callback'
-     * is called, all RCU callbacks that were registered on this thread
-     * prior to calling this function are completed.
-     *
-     * Note that since we have only one global queue of the RCU callbacks,
-     * we also end up waiting for most of RCU callbacks that were registered
-     * on the other threads, but this is a side effect that shoudn't be
-     * assumed.
-     */
-
-    qatomic_inc(&in_drain_call_rcu);
-    call_rcu1(&rcu_drain.rcu, drain_rcu_callback);
-    qemu_event_wait(&rcu_drain.drain_complete_event);
-    qatomic_dec(&in_drain_call_rcu);
+    WITH_QEMU_IOTHREAD_LOCK {
+        /*
+         * RCU callbacks are invoked in the same order as in which they
+         * are registered, thus we can be sure that when 'drain_rcu_callback'
+         * is called, all RCU callbacks that were registered on this thread
+         * prior to calling this function are completed.
+         *
+         * Note that since we have only one global queue of the RCU callbacks,
+         * we also end up waiting for most of RCU callbacks that were registered
+         * on the other threads, but this is a side effect that shoudn't be
+         * assumed.
+         */
 
-    if (locked) {
-        qemu_mutex_lock_iothread();
+        qatomic_inc(&in_drain_call_rcu);
+        call_rcu1(&rcu_drain.rcu, drain_rcu_callback);
+        qemu_event_wait(&rcu_drain.drain_complete_event);
+        qatomic_dec(&in_drain_call_rcu);
     }
 
 }
diff --git a/ui/cocoa.m b/ui/cocoa.m
index 660d3e0935..f8bd315bdd 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -115,27 +115,17 @@ static void cocoa_switch(DisplayChangeListener *dcl,
 
 static void with_iothread_lock(CodeBlock block)
 {
-    bool locked = qemu_mutex_iothread_locked();
-    if (!locked) {
-        qemu_mutex_lock_iothread();
-    }
-    block();
-    if (!locked) {
-        qemu_mutex_unlock_iothread();
+    WITH_QEMU_IOTHREAD_LOCK {
+        block();
     }
 }
 
 static bool bool_with_iothread_lock(BoolCodeBlock block)
 {
-    bool locked = qemu_mutex_iothread_locked();
     bool val;
 
-    if (!locked) {
-        qemu_mutex_lock_iothread();
-    }
-    val = block();
-    if (!locked) {
-        qemu_mutex_unlock_iothread();
+    WITH_QEMU_IOTHREAD_LOCK {
+      val = block();
     }
     return val;
 }
-- 
2.34.1



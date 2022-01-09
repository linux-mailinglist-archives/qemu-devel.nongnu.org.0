Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1CD488AAC
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 17:50:52 +0100 (CET)
Received: from localhost ([::1]:57864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6bP9-0008Fb-Qw
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 11:50:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6avE-00064y-9q
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:57 -0500
Received: from [2607:f8b0:4864:20::d2e] (port=33414
 helo=mail-io1-xd2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6avC-0007AB-Iq
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:55 -0500
Received: by mail-io1-xd2e.google.com with SMTP id s6so14447648ioj.0
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 08:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x/chF1pI+UgVoNqn57r2leNeMHFRdDwZrT3qt9wYBRc=;
 b=U2f4+tYn7j8TbXZhW5JgUR3l8g4Tej4KxnLr3w9xUo2d7oETsWahY9CraBeG/KK/y7
 fybI8w6X3lOP0BBeM10KOlMx+PCe6zG4BTVvpceGHPfsDZ/lhMfkuvXoo3gL7C1znle3
 IrpVEmB4YVSXBjHDeEPVZTtXTAdVg8BQGuobReDi0g0R8/usIwUlVzQSB8oxH7oNKd5U
 ImBuSigg2burAiOAkkpX+EjOeewxzB0BOLwLaYeM8UnW91+BAXzLXiUfkHFkw9+h6vBj
 ekMPHapL8KVZ22bAXumXk1NP4SCvNUKoYZMxbojpNYyVjndSDdV3l9ZCrJnQQXyA9+mi
 3Ntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x/chF1pI+UgVoNqn57r2leNeMHFRdDwZrT3qt9wYBRc=;
 b=jryJhwBD5HOHZrX0HOUW2ORlijo6NhoGvCUST3vsV24i3zRXJt5Bxj/c9wD2WOZntA
 iF2NSyULUZHzuOpOoenvohdUhrNQccSKO51rKy1g4+YoHepR91Cf1LpnpB0UshS/rc5W
 0PouGFDhU94BwCw3vnK/xvccssBnBqwh1YXQV7w2G+25/332mbIOsAhfwrNTRcbbjbNR
 PkgatSfPZ8DKCclPNhcWDYeW8/qp7TDao9fAdWNPfcO0UUVbjbxamdZPgrRrC7aOnBRs
 LfaUScIG9Mpao8rrsmtz//6RGHtdXADPjowxBpIl8UGnYDH2onRQx99KvKVzaEnfv9Tj
 Oycg==
X-Gm-Message-State: AOAM530RoNmYITmB7IV/fWzojDAXRjReQUyZYxMJeX9jo/2A/d8ouzyC
 jxFmCPGjixXMAwwDsf48uzLf+SDNTrQyfmWl
X-Google-Smtp-Source: ABdhPJxGbjopkOv2UiFTEe0MQFf3W6Dnvm22aQ2nhjrc1lUgf5e3M4W7YwcYu5VAFqlky2DfUnhTug==
X-Received: by 2002:a05:6602:2f09:: with SMTP id
 q9mr6676893iow.55.1641745193062; 
 Sun, 09 Jan 2022 08:19:53 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm2683386ilq.76.2022.01.09.08.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 08:19:52 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/30] bsd-user/signal.c: Fill in queue_signal
Date: Sun,  9 Jan 2022 09:19:15 -0700
Message-Id: <20220109161923.85683-23-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109161923.85683-1-imp@bsdimp.com>
References: <20220109161923.85683-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fill in queue signal implementation, as well as routines allocate and
delete elements of the signal queue.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/signal.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 97f42f9c45e..93c3b3c5033 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -109,6 +109,29 @@ static int core_dump_signal(int sig)
     }
 }
 
+/* Signal queue handling. */
+static inline struct qemu_sigqueue *alloc_sigqueue(CPUArchState *env)
+{
+    CPUState *cpu = env_cpu(env);
+    TaskState *ts = cpu->opaque;
+    struct qemu_sigqueue *q = ts->first_free;
+
+    if (!q) {
+        return NULL;
+    }
+    ts->first_free = q->next;
+    return q;
+}
+
+static inline void free_sigqueue(CPUArchState *env, struct qemu_sigqueue *q)
+{
+
+    CPUState *cpu = env_cpu(env);
+    TaskState *ts = cpu->opaque;
+    q->next = ts->first_free;
+    ts->first_free = q;
+}
+
 /* Abort execution with signal. */
 void QEMU_NORETURN force_sig(int target_sig)
 {
@@ -174,7 +197,54 @@ void QEMU_NORETURN force_sig(int target_sig)
  */
 void queue_signal(CPUArchState *env, int sig, target_siginfo_t *info)
 {
-    qemu_log_mask(LOG_UNIMP, "No signal queueing, dropping signal %d\n", sig);
+    CPUState *cpu = env_cpu(env);
+    TaskState *ts = cpu->opaque;
+    struct emulated_sigtable *k;
+    struct qemu_sigqueue *q, **pq;
+
+    k = &ts->sigtab[sig - 1];
+    trace_user_queue_signal(env, sig); /* We called this in the caller? XXX */
+    /*
+     * XXX does the segv changes make this go away? -- I think so
+     */
+    if (sig == TARGET_SIGSEGV && sigismember(&ts->signal_mask, SIGSEGV)) {
+        /*
+         * Guest has blocked SIGSEGV but we got one anyway. Assume this is a
+         * forced SIGSEGV (ie one the kernel handles via force_sig_info because
+         * it got a real MMU fault). A blocked SIGSEGV in that situation is
+         * treated as if using the default handler. This is not correct if some
+         * other process has randomly sent us a SIGSEGV via kill(), but that is
+         * not easy to distinguish at this point, so we assume it doesn't
+         * happen.
+         */
+        force_sig(sig);
+    }
+
+    pq = &k->first;
+
+    /*
+     * FreeBSD signals are always queued.  Linux only queues real time signals.
+     * XXX this code is not thread safe.  "What lock protects ts->sigtab?"
+     */
+    if (!k->pending) {
+        /* first signal */
+        q = &k->info;
+    } else {
+        q = alloc_sigqueue(env);
+        if (!q) {
+            return; /* XXX WHAT TO DO */
+        }
+        while (*pq != NULL) {
+            pq = &(*pq)->next;
+        }
+    }
+    *pq = q;
+    q->info = *info;
+    q->next = NULL;
+    k->pending = 1;
+    /* Signal that a new signal is pending. */
+    ts->signal_pending = 1;
+    return;
 }
 
 static int fatal_signal(int sig)
-- 
2.33.1



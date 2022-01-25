Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE67549A3F8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 03:04:52 +0100 (CET)
Received: from localhost ([::1]:52318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCBCV-00059P-VG
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 21:04:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfH-0002Hv-9s
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:34 -0500
Received: from [2607:f8b0:4864:20::134] (port=40795
 helo=mail-il1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfA-0001da-SL
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:27 -0500
Received: by mail-il1-x134.google.com with SMTP id s1so273598ilj.7
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8FxIJphu/joXYzE9rIY/0LH6iwnQR3a3YB/Ccc+Adhs=;
 b=RuwJiihe10VBTC/8M6zls7IOcehc4cOF5z6lk63GIdE9TkywEPKbzT+B6Nm7Jv04Ex
 Zy51XUb+wkKMnzIeBCloAeDTa6uNv8DFgUSgBKtmMVbqR+ukvE+ZcFYv57zSG1f6EDum
 PxVqNM3PUln4Dh9+9s+KaXRF2dO9A8QwbwddQSO284jCLrT5plNMDj3DhSNJAcN5zpyx
 FPWEHz3teF0r55JhMuImNvKySwngp3Cc1jhE8acFZoGMO9ZPAhmwdKa+zb0R+1Y9faOp
 oqXG8brC0QIwsNd0Oypm5UTyS//qTgpH6+uHgPNzE8URtKvjuN9vHAqkUiAHPVB/bD9Z
 l5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8FxIJphu/joXYzE9rIY/0LH6iwnQR3a3YB/Ccc+Adhs=;
 b=3MUhHV/z760oU4lnqleIgqdZbiIFGKo8ADVq/XdhAtm5nqXd+PgvRa08/amDxGakvc
 3T1odB+hzM6LP0LbR+ikFN/P0O0mD0nxvoFn/1vUNbrfTJCnGVCV6jDnAd4ciUXNqGiE
 zs7/TzZ42iIcrSuhIRi5mDUJgX5JVlGXt0UFdMQYG4BXJwuZHyPSKbEcQOuGRVt0xI4c
 HsIenu7zRz+qobvUU9qmMSJIw8S9/0ho6swRHcd6mNJXYD6GzAJ75J6iijXKTp/I/BaK
 j89RgfYcNQnqpgq0gqmzuVvV+r1zkrAVxYi8zV742s0cygdlFLkqr1wMEQcXQBXw3+Oi
 qIMA==
X-Gm-Message-State: AOAM53203aYA4WNnc66pB/ze0p2RP6bUWd9mfsouAkepbCu57pYbu6LT
 vHPZmV7jfDOhbqkEbKoLRn7LjYnuYlqiEg==
X-Google-Smtp-Source: ABdhPJxuStuqnmLvR0BFl1t6HL8kCh6AULecDvxGNj4MI71PDGTAq03+I5rZC8Khu6vaVB4rAEFQsA==
X-Received: by 2002:a05:6e02:1707:: with SMTP id
 u7mr10603033ill.92.1643074217186; 
 Mon, 24 Jan 2022 17:30:17 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:30:16 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/40] bsd-user/signal.c: host_to_target_siginfo_noswap
Date: Mon, 24 Jan 2022 18:29:31 -0700
Message-Id: <20220125012947.14974-25-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::134
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::134;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x134.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement conversion of host to target siginfo.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/signal.c | 113 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index cb0036acb61..db8cf0a08f1 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -48,6 +48,119 @@ int target_to_host_signal(int sig)
     return sig;
 }
 
+static bool has_trapno(int tsig)
+{
+    return tsig == TARGET_SIGILL ||
+        tsig == TARGET_SIGFPE ||
+        tsig == TARGET_SIGSEGV ||
+        tsig == TARGET_SIGBUS ||
+        tsig == TARGET_SIGTRAP;
+}
+
+
+/* Siginfo conversion. */
+
+/*
+ * Populate tinfo w/o swapping based on guessing which fields are valid.
+ */
+static inline void host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
+        const siginfo_t *info)
+{
+    int sig = host_to_target_signal(info->si_signo);
+    int si_code = info->si_code;
+    int si_type;
+
+    /*
+     * Make sure we that the variable portion of the target siginfo is zeroed
+     * out so we don't leak anything into that.
+     */
+    memset(&tinfo->_reason, 0, sizeof(tinfo->_reason));
+
+    /*
+     * This is awkward, because we have to use a combination of the si_code and
+     * si_signo to figure out which of the union's members are valid.o We
+     * therefore make our best guess.
+     *
+     * Once we have made our guess, we record it in the top 16 bits of
+     * the si_code, so that tswap_siginfo() later can use it.
+     * tswap_siginfo() will strip these top bits out before writing
+     * si_code to the guest (sign-extending the lower bits).
+     */
+    tinfo->si_signo = sig;
+    tinfo->si_errno = info->si_errno;
+    tinfo->si_code = info->si_code;
+    tinfo->si_pid = info->si_pid;
+    tinfo->si_uid = info->si_uid;
+    tinfo->si_status = info->si_status;
+    tinfo->si_addr = (abi_ulong)(unsigned long)info->si_addr;
+    /*
+     * si_value is opaque to kernel. On all FreeBSD platforms,
+     * sizeof(sival_ptr) >= sizeof(sival_int) so the following
+     * always will copy the larger element.
+     */
+    tinfo->si_value.sival_ptr =
+        (abi_ulong)(unsigned long)info->si_value.sival_ptr;
+
+    switch (si_code) {
+        /*
+         * All the SI_xxx codes that are defined here are global to
+         * all the signals (they have values that none of the other,
+         * more specific signal info will set).
+         */
+    case SI_USER:
+    case SI_LWP:
+    case SI_KERNEL:
+    case SI_QUEUE:
+    case SI_ASYNCIO:
+        /*
+         * Only the fixed parts are valid (though FreeBSD doesn't always
+         * set all the fields to non-zero values.
+         */
+        si_type = QEMU_SI_NOINFO;
+        break;
+    case SI_TIMER:
+        tinfo->_reason._timer._timerid = info->_reason._timer._timerid;
+        tinfo->_reason._timer._overrun = info->_reason._timer._overrun;
+        si_type = QEMU_SI_TIMER;
+        break;
+    case SI_MESGQ:
+        tinfo->_reason._mesgq._mqd = info->_reason._mesgq._mqd;
+        si_type = QEMU_SI_MESGQ;
+        break;
+    default:
+        /*
+         * We have to go based on the signal number now to figure out
+         * what's valid.
+         */
+        if (has_trapno(sig)) {
+            tinfo->_reason._fault._trapno = info->_reason._fault._trapno;
+            si_type = QEMU_SI_FAULT;
+        }
+#ifdef TARGET_SIGPOLL
+        /*
+         * FreeBSD never had SIGPOLL, but emulates it for Linux so there's
+         * a chance it may popup in the future.
+         */
+        if (sig == TARGET_SIGPOLL) {
+            tinfo->_reason._poll._band = info->_reason._poll._band;
+            si_type = QEMU_SI_POLL;
+        }
+#endif
+        /*
+         * Unsure that this can actually be generated, and our support for
+         * capsicum is somewhere between weak and non-existant, but if we get
+         * one, then we know what to save.
+         */
+        if (sig == TARGET_SIGTRAP) {
+            tinfo->_reason._capsicum._syscall =
+                info->_reason._capsicum._syscall;
+            si_type = QEMU_SI_CAPSICUM;
+        }
+        break;
+    }
+    tinfo->si_code = deposit32(si_code, 24, 8, si_type);
+}
+
 /*
  * Queue a signal so that it will be send to the virtual CPU as soon as
  * possible.
-- 
2.33.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 840974A5076
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:46:55 +0100 (CET)
Received: from localhost ([::1]:42976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdZe-00050E-LP
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:46:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnl-000547-3U
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:25 -0500
Received: from [2607:f8b0:4864:20::d2e] (port=35656
 helo=mail-io1-xd2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnb-0002es-Pm
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:24 -0500
Received: by mail-io1-xd2e.google.com with SMTP id 9so18465552iou.2
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zR/nS77HGi58NxQ6lCjkdyeychDCjgXBLWsqt7gXmDg=;
 b=wF1KMNpdBoINrX9NNqMySMwJJr1OOwiktoo0sPDGe+bsNNX5cXODVywDtKi0e8KkoJ
 zwoeOGFRxxeuS35D1CY5ijcKfAMDkYmyJyz9TRABgo1iY7hwLDfcKV+jlQJeABJjcxIt
 SlkGwn8F30ldj4639GiPkhKigXkHQqIFoTNFx2fh3u9uVLVbURzyqdZBeLuwjoMJ9GBZ
 x1XyDEjZC/3N1C3MyRp6lmQUg46g8FN4+Ced+Q2TWmIIJusQoTeU2TDX0vAraTrhipDj
 cyXoFtfE06H0DLnUnYcBKW6BkIWVWtVeuuXym1AHfG2SU3OEbh6JGJ4Wd+dWXBLJWENp
 Woxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zR/nS77HGi58NxQ6lCjkdyeychDCjgXBLWsqt7gXmDg=;
 b=adhpEVjkOVerkJz+BFO9XoNco1/+/dFWr/ahCTSejcW/DJdMD+1oUhbGg35QvvXu2T
 z3Vhx/o84XZxhMiWQBE34L+fInpVo6VJT1i8U3XTwP/njnNwaOFHCXOCLGOeycz6ghs7
 HtiVHpjUujCmRG3ogODL9+v6EbFWj1CDU3n8g0AhYizegRqShaoJlqoZ1DVdVIosPlRH
 8A7Lj8tmb1GAfNh30ni6Y1mhyTH7x+o7RfN1HBhGUXcbLXdtcoDyuZ22Fd5Qe/uR3T3L
 k6BBaGndce5DyMsSTsMXDqR1qDoicz8l0D0tH6mViHAcQE5EtTjRlSzp45qHNyCf2UNn
 1ABA==
X-Gm-Message-State: AOAM532lz8cxtYmhzn4v+Oiy8+8n/0u2jlgg9upQ5kwYoZ8+XwTyMAWi
 91WbdiMZ7j26Rh9ABegnkp3fTQ+TU7fidQ==
X-Google-Smtp-Source: ABdhPJztQb605PAHH3vEaGKJa5BiPVKQTBmBl3th3DvQDY58rYgdR7M3V8eS6fKTDphFI9TGEyVhiQ==
X-Received: by 2002:a5d:9151:: with SMTP id y17mr11702211ioq.38.1643659014023; 
 Mon, 31 Jan 2022 11:56:54 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:56:53 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/40] bsd-user/signal.c: host_to_target_siginfo_noswap
Date: Mon, 31 Jan 2022 12:56:20 -0700
Message-Id: <20220131195636.31991-25-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
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
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E14064A0485
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 00:48:35 +0100 (CET)
Received: from localhost ([::1]:37908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDayp-0007s5-0g
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 18:48:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafm-0000fs-DQ
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:54 -0500
Received: from [2607:f8b0:4864:20::d2c] (port=38584
 helo=mail-io1-xd2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafg-0001as-Mq
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:53 -0500
Received: by mail-io1-xd2c.google.com with SMTP id w7so9703558ioj.5
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zR/nS77HGi58NxQ6lCjkdyeychDCjgXBLWsqt7gXmDg=;
 b=N+tAUsyONZ3fqjywYXCm/S8hbwMB3pAEwDQ7uex1ACcy+8/5hsW4WMwwPHBZIQZzCu
 5UJILroKztfxFbP+neXLpGuk21wJpMxa2GWRZkigJIAVa8McpffctaeTqu7MvABc1LkG
 I9K11637T7mfK47ohREMpxrb/H/o5BN7kdBDm4LpLHYyX1WHsu7GVvvC9FHSHFBZl7a6
 7JzpQOV2Ax9sF+nP0A4YBVK0rI5s99BKLq6L+31b8xge3XN8PSvbb/AbRkCCFkRW1DmE
 x8EuEg6p7qakWvmcec8HRz1f7CKY2YknK1FzwW3iGjZ1ZEyCYzrx3Jl2cj0lBG4cfjqj
 dDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zR/nS77HGi58NxQ6lCjkdyeychDCjgXBLWsqt7gXmDg=;
 b=WTVdFkDLQW9QZYlchYJ5rPr+PS4dR+3R5yXkxZVZ8pkU4uM8aPPKInD7ZLCmh5OC9h
 XoxyGE+/o8CDh5UhmiVveTzkroGccRFeeivZu+JOaNsV3kH9Bf6FvkfhGS/S0nE7kiBC
 m64blrbpTMMxVbpHnwEBRlj9MdH9c8uZsYrx85C14PO9lnbYvm/8GaLkNRHyMXnvCEUM
 T/ZqDdjKx0lMpEjzaqVYIHTidDFVs7RuLyvXVPPJC5TtWx9ABfR6AkhpUZlWTaBT5ty5
 OYhM8GhF9T/7wX7qtih8AZM48U6HHgRhYcSkfCn60OWKXyjY2iY5L9eGhUipDU3AScjx
 WeJA==
X-Gm-Message-State: AOAM530pKgbipRSkukolS+q3KLcNvFWCty5jY3q+hvg6H1L3gJBnu7Bd
 Gb2QTiV1cWaHNlLIfOqtt/JXSf2NSHtyJA==
X-Google-Smtp-Source: ABdhPJxdn2BGwztF/+RiHK93gbItC13+6tVycPT59BJ0yJnzf5DcbNung78eLT/snFpODtoL40/hcA==
X-Received: by 2002:a05:6602:1547:: with SMTP id
 h7mr599628iow.46.1643412508708; 
 Fri, 28 Jan 2022 15:28:28 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:28 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 24/40] bsd-user/signal.c: host_to_target_siginfo_noswap
Date: Fri, 28 Jan 2022 16:27:49 -0700
Message-Id: <20220128232805.86191-25-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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



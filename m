Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBB649A227
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 02:52:56 +0100 (CET)
Received: from localhost ([::1]:52506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCB0x-000386-56
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 20:52:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAf4-000292-6z
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:19 -0500
Received: from [2607:f8b0:4864:20::12d] (port=41932
 helo=mail-il1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAf0-0001Zi-Br
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:17 -0500
Received: by mail-il1-x12d.google.com with SMTP id 15so1248350ilg.8
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GIrKzMc5jPXfhdAYwt0g5AuLCXCZz7PvOJlt6bMXYhA=;
 b=0YcQbTJTpfzQ+GUYYecg5AY2a2P4xfABKSwLMMCF2hitFsqzqNvYPelQen1E4ZhOv/
 ky8CQDjS3wzjYhH/xCGH3jlR8372pvpScNM0Hb8zl8PsgLNRvHmZ26fR8Q9NT6LrkAOg
 Bi4VsalhKAbzHCDzWqUSJT3yIRRIsJontqMwuPe3Lg96wtcv/LncuJwsaYMav9FRxKJL
 ejgZCbRWqaU0rj3kffxAh4uHiO78rDggOlo276NgPhwBm8VQof7GYsFxXIHETb9fWsTn
 YXKtsWS5VpH+firm/0pcEAopCF36q/ciNeE7SpTLU7gCIkGPoNqxTw59vq1ZQht6du5/
 bzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GIrKzMc5jPXfhdAYwt0g5AuLCXCZz7PvOJlt6bMXYhA=;
 b=bVtrTHsvnzuI9bGAhIfYSVDU7HYCSAON4Jsv9fljATZljuEH/zsvMZhEJl7zfK/NaY
 QEJ4Lp1myxOwlmMHz6KnOpX80zg8OBqYaLOsh/4WPRXZhHEddwlQ/yS3BsRKF7sSvaJ6
 Prl0qKUuu6kj8+Xmqs2wEuqYP5JLLZncBRkyVgkhiNzdlW6eQpJHEnyuXDojIlie6IjI
 wXbsg5FniAZsW9peyqkiIeb5Ny7G5aCXGlNMcCMK432f7ALHCzH5Gm5cWN9bnaWacGvn
 On50eoiPIEJoySEkNWD71V3iQQP+erWx/A7Ql7LEeTXLgqAKTOjr9s0TkpZ1+hw8Bd0D
 +7Yw==
X-Gm-Message-State: AOAM530Cb+YAnHglGmRRUwi/80X6mXvp5zskeMpryj0CG41eA5VLicrf
 c+iW1cXksRclaouc0N3XbnaeIc8ZDmqhgg==
X-Google-Smtp-Source: ABdhPJx9B+4gc9/+AdvSyYZfsoBnXUsiA/O01MMRPmbiH/7cXvoF8/SgiPA/bZzwuFqQJOwpiyT/dQ==
X-Received: by 2002:a92:d7cf:: with SMTP id g15mr10540549ilq.46.1643074211345; 
 Mon, 24 Jan 2022 17:30:11 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:30:10 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/40] bsd-user/signal.c: Add si_type argument to
 queue_signal
Date: Mon, 24 Jan 2022 18:29:25 -0700
Message-Id: <20220125012947.14974-19-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12d;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mirror the linux-user practice and add a si_type argument to queue
signal. This will be transported as the upper 8 bits in the si_type
element of siginfo so that we know what bits of the structure are valid
and so we can properly implement host_to_target_siginfo_noswap and
tswap_siginfo. Adapt the one caller of queue_signal to the new
interface.  Use all the same names as Linux (except _RT which we don't
treat differently, unlike Linux), though some are unused. Place this
into signal-common.h since that's a better place given bsd-user's
structure. Move prototype of queue_signal to signal-common.h to mirror
linux-user's location.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/signal-common.h | 26 +++++++++++++++++++++++++-
 bsd-user/signal.c        |  5 +++--
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/bsd-user/signal-common.h b/bsd-user/signal-common.h
index efed23d9efb..80e9503238a 100644
--- a/bsd-user/signal-common.h
+++ b/bsd-user/signal-common.h
@@ -15,8 +15,32 @@ long do_sigreturn(CPUArchState *env);
 void force_sig_fault(int sig, int code, abi_ulong addr);
 int host_to_target_signal(int sig);
 void process_pending_signals(CPUArchState *env);
-void queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
+void queue_signal(CPUArchState *env, int sig, int si_type,
+                  target_siginfo_t *info);
 void signal_init(void);
 int target_to_host_signal(int sig);
 
+/*
+ * Within QEMU the top 8 bits of si_code indicate which of the parts of the
+ * union in target_siginfo is valid. This only applies between
+ * host_to_target_siginfo_noswap() and tswap_siginfo(); it does not appear
+ * either within host siginfo_t or in target_siginfo structures which we get
+ * from the guest userspace program. Linux kenrels use this internally, but BSD
+ * kernels don't do this, but its a useful abstraction.
+ *
+ * The linux-user version of this uses the top 16 bits, but FreeBSD's SI_USER
+ * and other signal indepenent SI_ codes have bit 16 set, so we only use the top
+ * byte instead.
+ *
+ * For FreeBSD, we have si_pid, si_uid, si_status, and si_addr always. Linux and
+ * {Open,Net}BSD have a different approach (where their reason field is larger,
+ * but whose siginfo has fewer fields always).
+ */
+#define QEMU_SI_NOINFO   0      /* nothing other than si_signo valid */
+#define QEMU_SI_FAULT    1      /* _fault is valid in _reason */
+#define QEMU_SI_TIMER    2      /* _timer is valid in _reason */
+#define QEMU_SI_MESGQ    3      /* _mesgq is valid in _reason */
+#define QEMU_SI_POLL     4      /* _poll is valid in _reason */
+#define QEMU_SI_CAPSICUM 5      /* _capsicum is valid in _reason */
+
 #endif
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 3ef7cf5e23c..ad8437a8bfb 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -50,7 +50,8 @@ int target_to_host_signal(int sig)
  * Queue a signal so that it will be send to the virtual CPU as soon as
  * possible.
  */
-void queue_signal(CPUArchState *env, int sig, target_siginfo_t *info)
+void queue_signal(CPUArchState *env, int sig, int si_type,
+                  target_siginfo_t *info)
 {
     qemu_log_mask(LOG_UNIMP, "No signal queueing, dropping signal %d\n", sig);
 }
@@ -91,7 +92,7 @@ void force_sig_fault(int sig, int code, abi_ulong addr)
     info.si_errno = 0;
     info.si_code = code;
     info.si_addr = addr;
-    queue_signal(env, sig, &info);
+    queue_signal(env, sig, QEMU_SI_FAULT, &info);
 }
 
 static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
-- 
2.33.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 598504A50B6
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 22:02:31 +0100 (CET)
Received: from localhost ([::1]:49410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdok-0002yZ-7a
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 16:02:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcni-00052x-Q2
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:23 -0500
Received: from [2607:f8b0:4864:20::12c] (port=47046
 helo=mail-il1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnb-0002eO-NQ
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:22 -0500
Received: by mail-il1-x12c.google.com with SMTP id e8so12375450ilm.13
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wqlbtS2VUgC/Bp8lefRD+Zfc/A3KiIGoEh621L0tTtg=;
 b=DbVZWF1EXOUFLrE9J3qIn43sjinR351YF6C7wgp7+GXw4WkwcZas3aiy6Ch0sohMXt
 rNhX9lJQ5GXtIhPjRIZ3jLy41caynPLQay2I7yOT344Xk+qtLIF/Or4ZAmnsCqAVFujQ
 Ixrwdai/Xc++Zfdj844xVTLLu2E8Ps66O2NNw04rOCFjuNaf2qQhhqSGyuBoUwnA2+Sw
 zJyzIjZ68qoERFdtveAzxtsFOOyfvNg6yVjK7XvFOOnvy9hd2vxkbI2XS3ZK0V7eflzm
 fDG3phZtKgOKAhWGUFLL2mA90ofdl1/4prIQP0Syn3NqXR78gN+dcjTZxuBdab/wYV2h
 DrxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wqlbtS2VUgC/Bp8lefRD+Zfc/A3KiIGoEh621L0tTtg=;
 b=f1vMEanHs1m2o1y3ii4zTiJhh8dtuEJQLf8wCeGcS2N6jWAUL+UTljJz+CihGAT+mK
 lvzXuxxr9L0TSPG0lE741SFcFE49PmiP99T08JJJ08wmbuI5j2S6ljsWqV95TEIJREc0
 At/P8Dv7iOsexMlksaPBHVKdQwHEb89gpmRQMc9cHlHTkE5OFM4yOJKAYxecFG/phFyo
 C97KCQYD6BIbpPf/H3x3/5lY4O2VBV8hQm0FOwGJikC8xi/U8CCu2V0bmKEeHn3dTly2
 FiPow7i77D3be/lNCnE+6UThGLJ662EA4uC9X+ei/upTXC24yrsTVXA4JNZwhkU16Zjh
 QJBg==
X-Gm-Message-State: AOAM531vNHkkaJb6y+rMHMRHGTAlAmZbc5Gc84vohGlP2k7iCtXUFbQD
 l14mw+j3HrXz/HH7VqNtaoRZ2Q4rAHLBqA==
X-Google-Smtp-Source: ABdhPJxeD1j0/5j6pfHjsLpYpSzrbP/qZ/Ni9r9/39O7kTuxODXevBUVoew1eW35VnZt6SG5m1EsqQ==
X-Received: by 2002:a05:6e02:1488:: with SMTP id
 n8mr12323253ilk.12.1643659008422; 
 Mon, 31 Jan 2022 11:56:48 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:56:47 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/40] bsd-user/signal.c: Add si_type argument to queue_signal
Date: Mon, 31 Jan 2022 12:56:14 -0700
Message-Id: <20220131195636.31991-19-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12c;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12c.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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



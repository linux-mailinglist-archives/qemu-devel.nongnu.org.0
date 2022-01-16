Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CEA48FEDF
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Jan 2022 21:47:02 +0100 (CET)
Received: from localhost ([::1]:52384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9CQX-0005kj-Em
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 15:47:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n9COD-0004EG-Aj
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 15:44:40 -0500
Received: from [2607:f8b0:4864:20::d32] (port=43707
 helo=mail-io1-xd32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n9COA-00040P-IC
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 15:44:37 -0500
Received: by mail-io1-xd32.google.com with SMTP id v1so19022329ioj.10
 for <qemu-devel@nongnu.org>; Sun, 16 Jan 2022 12:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vDQZ0PXIomnLoT+iGVONVPM+Jb4GerOhMgut13TgKsQ=;
 b=Hatj9mLiqGjScrx8N7BWNXdlGUjMdr6PcB7y8UYSn/jTnyRsgzYnAJyf/GEc4SuYgc
 geSETyDGmk9T2Orb9Q7Z/9C6PHoPEdhD3PpW5NQk3gXDLb0OOHL6LYhVL7TvRFdNYwV7
 H8Cn/010vOljpsN8toH/z7XpUxR7Rww0gIXXS4MRlhlId7PV05xKbrqWR2g+ePheifnr
 XEoNvDvhYZl1UVcxoCbsVOLTWZMV2KQlw0P0Xx+m4QPBBgJTyt/8Hd6n3xg0zKa4H1Cp
 fB1nRzl86Zc9CLjUbzOj+TnqKzacpnqFd/iwDhgjCi1VYdhU6mVrlStY54RZt9oXtJHv
 UBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vDQZ0PXIomnLoT+iGVONVPM+Jb4GerOhMgut13TgKsQ=;
 b=fNnprTJWK2vYJIU6FYv7g7fwuzBJkeFRNxiw3Vp9XuowZjS51MMljZn5jNzs7UPFZw
 XD6kEITrDPeaNFCnawmBSqcyq8FPdOGLsBctovBDE6SmMdqXD6M1L6rATPIBWDpKg8mV
 BY4eprIuc7icvUw1LaKxCcW9uiInBTKe4pNfKLW1zz0xAcMhVntGvfenPHUeUs41jTMF
 0N6jS5TfIFOsTHVgsSYGOkaT7wWkm8z2KJUm3aiY6eHJbams3qTBqrafC7iSUSVeGw2P
 EQtgZmWA+qA5nUepD2IxeklVRdLLRhCA/EaEDryUzH0JpNKsDEbyHjBYT9AT0UUV6fqe
 3wmg==
X-Gm-Message-State: AOAM532XqCtDFdYU0voxkPUBJcFyoSe9Kg2FvbMOED4JgYhOmRvpmWMM
 +5Zm6foFruvUCDqg0JGMHZlkLhRqvFFJ50tM
X-Google-Smtp-Source: ABdhPJyWzHwosCPnbYBS0B/QoiT+fGDkufUISUeWCys9IvXX0BWpoELdO2dI5UMj/cXvvsI+2I5MdA==
X-Received: by 2002:a02:a30d:: with SMTP id q13mr1082815jai.268.1642365873219; 
 Sun, 16 Jan 2022 12:44:33 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id s6sm8275018ild.5.2022.01.16.12.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 12:44:32 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] linxu-user: Change return type of queue_signal to void
Date: Sun, 16 Jan 2022 13:44:23 -0700
Message-Id: <20220116204423.16133-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220116204423.16133-1-imp@bsdimp.com>
References: <20220116204423.16133-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d32
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, richard.henderson@linaro.org,
 f4bug@amsat.org, Warner Losh <imp@bsdimp.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

queue_signal always returns 1, and nobody checks it. This is better
expressed as a void function return type.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 linux-user/signal-common.h | 4 ++--
 linux-user/signal.c        | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
index 42aa479080b..2113165a758 100644
--- a/linux-user/signal-common.h
+++ b/linux-user/signal-common.h
@@ -59,8 +59,8 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
 void process_pending_signals(CPUArchState *cpu_env);
 void signal_init(void);
-int queue_signal(CPUArchState *env, int sig, int si_type,
-                 target_siginfo_t *info);
+void queue_signal(CPUArchState *env, int sig, int si_type,
+                  target_siginfo_t *info);
 void host_to_target_siginfo(target_siginfo_t *tinfo, const siginfo_t *info);
 void target_to_host_siginfo(siginfo_t *info, const target_siginfo_t *tinfo);
 int target_to_host_signal(int sig);
diff --git a/linux-user/signal.c b/linux-user/signal.c
index f813b4f18e4..eddc95e87df 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -780,8 +780,8 @@ static void QEMU_NORETURN dump_core_and_abort(int target_sig)
 
 /* queue a signal so that it will be send to the virtual CPU as soon
    as possible */
-int queue_signal(CPUArchState *env, int sig, int si_type,
-                 target_siginfo_t *info)
+void queue_signal(CPUArchState *env, int sig, int si_type,
+                  target_siginfo_t *info)
 {
     CPUState *cpu = env_cpu(env);
     TaskState *ts = cpu->opaque;
@@ -794,7 +794,6 @@ int queue_signal(CPUArchState *env, int sig, int si_type,
     ts->sync_signal.pending = sig;
     /* signal that a new signal is pending */
     qatomic_set(&ts->signal_pending, 1);
-    return 1; /* indicates that the signal was queued */
 }
 
 
-- 
2.33.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B834A500D
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:22:56 +0100 (CET)
Received: from localhost ([::1]:48366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdCR-0003Vo-Bb
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:22:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnf-0004v4-3B
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:19 -0500
Received: from [2607:f8b0:4864:20::134] (port=47055
 helo=mail-il1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnb-0002fT-CJ
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:18 -0500
Received: by mail-il1-x134.google.com with SMTP id e8so12375849ilm.13
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MVWZUYxrpCifraNDGYSj461HH4N52sJPo6Fc3sNZUKk=;
 b=X/BhydrfXIDLK8VV/LWNjp9DUyMbsAH0cNJqmpFlZ4Uq5DVLgo+o8lnOKT8oyVEBLW
 wAJuVHAsYSKzsZp2fxPP7FHSTrGJdXDSP95SB+KMoQAULwAxsXfOv5ulrGls3vGVA2om
 NOH9kT8WF+t8TnG5kX1u2nS5LQqhwGgMvyY+vFi/Elx+3Xl9huNhIE06MS0VPyvbUjv2
 eoqyQHbAT+UDZxI90zBEHIogBca6gWLUQpc2El+OTVw12sQibgVnhxE3ds4ICF706ToL
 m5mDC7FAIpNYeopfAav21nXLLSGz84228BqJ4UVY4+5N3ck1q7DeJ8MDF5N0D15ptbmD
 SDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MVWZUYxrpCifraNDGYSj461HH4N52sJPo6Fc3sNZUKk=;
 b=KSM+V498pmc3rRo9SVj04rD4A5j++QT3RMVzmNvUXJFpGwR9yiCEwrhgZ3Dc3hSNNy
 B661USTcZVDQSyQbxBFsla96tLvdbguQjU6eXJAkHit1EgX4iqIhXYGkdPJHUMrqsNng
 bXrHvXtSnr/u41Clax6vXCKO5Rd/C89jhKzYnp+Pq5kkX8phpgMGFTJ0dvGy1LXNbCt7
 OM/Zjh9HkAa8/HpW/eWtuTuBaIbqWklGNoqXaYucHySDXGjmOsDCDJ7lAH5sghgCPXQv
 3a9fB3uZl8y2SspFY7mUABcxctccAeH96oakXVsqT5JEnf917n0DWp/4UwTiitM8hApH
 frfA==
X-Gm-Message-State: AOAM533UCKy/E2k95SKufCHVJSImoAKdeFrjFqRPv12vCKWFA9/r78jv
 KrWE+CLhewUhmY6uWeIkbJ1qFB+kH0MEqA==
X-Google-Smtp-Source: ABdhPJxstx98rtVCcAkApxnnHmpivBG8BKfinJYDBq2aKJBTMxX6fXL+MRne6W0aDY6bstk2ut51Zg==
X-Received: by 2002:a05:6e02:1a4d:: with SMTP id
 u13mr2114394ilv.136.1643659019357; 
 Mon, 31 Jan 2022 11:56:59 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:56:58 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/40] bsd-user/signal.c: Fill in queue_signal
Date: Mon, 31 Jan 2022 12:56:25 -0700
Message-Id: <20220131195636.31991-30-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
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

Fill in queue signal implementation, as well as routines allocate and
delete elements of the signal queue.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/qemu.h   |  5 +++++
 bsd-user/signal.c | 13 ++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index a7964776fdb..1648a509b9c 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -85,6 +85,11 @@ typedef struct TaskState {
     struct bsd_binprm *bprm;
     struct image_info *info;
 
+    struct emulated_sigtable sync_signal;
+    /*
+     * TODO: Since we block all signals while returning to the main CPU
+     * loop, this needn't be an array
+     */
     struct emulated_sigtable sigtab[TARGET_NSIG];
     /*
      * Nonzero if process_pending_signals() needs to do something (either
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index ccda7adbeef..34663f7a28a 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -255,7 +255,18 @@ static void QEMU_NORETURN dump_core_and_abort(int target_sig)
 void queue_signal(CPUArchState *env, int sig, int si_type,
                   target_siginfo_t *info)
 {
-    qemu_log_mask(LOG_UNIMP, "No signal queueing, dropping signal %d\n", sig);
+    CPUState *cpu = env_cpu(env);
+    TaskState *ts = cpu->opaque;
+
+    trace_user_queue_signal(env, sig);
+
+    info->si_code = deposit32(info->si_code, 24, 8, si_type);
+
+    ts->sync_signal.info = *info;
+    ts->sync_signal.pending = sig;
+    /* Signal that a new signal is pending. */
+    qatomic_set(&ts->signal_pending, 1);
+    return;
 }
 
 static int fatal_signal(int sig)
-- 
2.33.1



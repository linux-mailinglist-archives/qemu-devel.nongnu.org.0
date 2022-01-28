Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 929D14A0498
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 00:51:21 +0100 (CET)
Received: from localhost ([::1]:42622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDb1U-0002sW-Kv
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 18:51:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafw-0000oB-Ro
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:29:04 -0500
Received: from [2607:f8b0:4864:20::d32] (port=34805
 helo=mail-io1-xd32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafi-0001bD-FD
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:29:04 -0500
Received: by mail-io1-xd32.google.com with SMTP id i62so9720936ioa.1
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MVWZUYxrpCifraNDGYSj461HH4N52sJPo6Fc3sNZUKk=;
 b=SKNLiLJx7kUYdSiGyFtGWagPIFJIAeW38/JzLx72XtDQlKwQyN4bwcfvMYUqXwafFz
 6PmYNpqsVdh8EEgT0f7XsJM7Y/+wRKffcSsp3iofzqvHxRR3dTcQa+B/Zq1+HKULRJXg
 NPNSlxNDwtO+R+XzL7zVm7nS6/AokLudiKY4BiH5sesftsu3C4L+zuo3PqtrZGfhmuS0
 ASBsFXs0svV5hxbO7dc5KHXIW/LEWqCmd9LGgEkYgykmXeaO66p6szfa7bYi1q6gjdtE
 biJ0OiffYuJBYFnKA/6oG4TnA0oW7Kk+OtcaQy81MPHw6R/eAXj4Jd+wAFGf19Sk+YgS
 RbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MVWZUYxrpCifraNDGYSj461HH4N52sJPo6Fc3sNZUKk=;
 b=f/ll18NMDrVmjEsQeTk2y/HhyFYCZAWS0lh5HaRLLkulyzeFsjPn8e4/WYo4s4q943
 KQsxVoyykV+WU99+fsQ0j/CS3gf+zvUQBtmN0NLUSSzqN4LnfesuzgnjDT4kfdIEqqZS
 zDbIQZMU/fCoNmjcZIozqhToqJgA3ibZO8Z+cv4bGd5rUt1DyqkGipBcKoE+mDwcKYW/
 908es1OcNU9cg1b9F93IsLOv4LIXlUAetApbygs1Rq8pnl24kUg2jcXAWr3sXyf4QVyK
 JZEeVz2ORz35fpb5Wx7qGNzZO3889joZgpDU7SpjHX7gOPSFdNKbYY6v1Sll5fcY3RuH
 bFiw==
X-Gm-Message-State: AOAM531wkih8BIowsUowpeTUekGPcnXeotHV89EFfrwoOce0skLiiHFU
 l+B8D/UqEUwZ4BObqt0lSqTdsYbjQRpqPA==
X-Google-Smtp-Source: ABdhPJy9YFodkovJdgOKjHAYuUSbpQmle9sofC4sfw2ARORPVMZDqV6hG7WLUilcClaGuDkIErEN0g==
X-Received: by 2002:a05:6602:2e90:: with SMTP id
 m16mr6703387iow.74.1643412514732; 
 Fri, 28 Jan 2022 15:28:34 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:34 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 29/40] bsd-user/signal.c: Fill in queue_signal
Date: Fri, 28 Jan 2022 16:27:54 -0700
Message-Id: <20220128232805.86191-30-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d32
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
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



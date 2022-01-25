Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C0349A21A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 02:46:53 +0100 (CET)
Received: from localhost ([::1]:35220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCAv6-0008BQ-9p
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 20:46:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAem-0001p4-Tz
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:00 -0500
Received: from [2607:f8b0:4864:20::12b] (port=46964
 helo=mail-il1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAel-0001Kx-B6
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:00 -0500
Received: by mail-il1-x12b.google.com with SMTP id e8so15515355ilm.13
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4d3e+/an8YON2HYoyz+uLjT/Co+WU68pc6DpMLzJ0cI=;
 b=EVIGIR/yt4CI+w9D5jYNdFLjHhzMn+KQj6/wX729OGOf7b9x3VEjPlxeDGYhetFnz9
 rvP03V6N1xN0l+yIE9FQvXdW+PGGAVIKFKnjbGnUWKAGfzeB2ty0g7HdS1s0b51kcugs
 i+dDyCD02H7I1q0i5cleNAN0CFTtWZfhLC2nHd7m4I8FVKnZkGjxvhjqaVTbWNRwjAvz
 AoFQ8NekvhvdwtzVnmYk9EdT/vd1KFJWjL0jSZsXS52ozeBktb2FVF2YM5+F0jFuWC2T
 w7mRORgPyzqsThNYGAtG7ZC3/9OQVDtxNP/RN6Xo58om75thUi3wX/T4/VSJX7duUnzn
 DqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4d3e+/an8YON2HYoyz+uLjT/Co+WU68pc6DpMLzJ0cI=;
 b=C2a3QrYH/icRcmoOUqz3rkIZrliWRAa7kwoyB86Xcipxu1JPS8+bBoRdd3K+zY/lYH
 idziC/0uubOhaz0ys46e1gTvdElRZklnlu3CJn1auGC/33OCzD/Rbk8cnRomXH5uKZZZ
 DG3iargKZAC2EkgKk1urBCuo05q7VCRY2q9sury6cCRCuCsf3Y2isztLuQ9HpJgWYEhD
 oH0QVP+yte+zli0J/x4qCi5kYAxI+HW56Xc4Z4UUz1NJK1eByj2wksilRYYJ6XaeOu/s
 vI+PXNT3vxS0R9FEwufyVw4HkRmERkQl5xi6g5hAJSa4FisalcYkSEixsKhyGWu3IRYd
 Zs3A==
X-Gm-Message-State: AOAM530llQL97W4fTQV1mVIXyiK5CJJqPuiSZ/QZTdIo70QuhstQRDbm
 RNrD3RP/ZDjo8zlUK9rW/14ZQP8atAMR5A==
X-Google-Smtp-Source: ABdhPJzmK3840VwvSN6fq98AolvPsIuSa1oxfcP8/4a5oICA6vhNZQIDyeAWpa34ygj6dnSIAyWXHg==
X-Received: by 2002:a05:6e02:b44:: with SMTP id
 f4mr9993254ilu.125.1643074197800; 
 Mon, 24 Jan 2022 17:29:57 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:29:57 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/40] bsd-user: Remove vestiges of signal queueing code
Date: Mon, 24 Jan 2022 18:29:12 -0700
Message-Id: <20220125012947.14974-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
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

bsd-user was copied from linux-user at a time when it queued
signals. Remove those vestiges of thse code. Retain the init function,
even though it's now empty since other stuff will likely be added
there. Make it static since it's not called from outside of main.c

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c |  9 +--------
 bsd-user/qemu.h | 13 +------------
 2 files changed, 2 insertions(+), 20 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index cb5ea402361..29cf4e15693 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -215,15 +215,8 @@ void qemu_cpu_kick(CPUState *cpu)
 }
 
 /* Assumes contents are already zeroed.  */
-void init_task_state(TaskState *ts)
+static void init_task_state(TaskState *ts)
 {
-    int i;
-
-    ts->first_free = ts->sigqueue_table;
-    for (i = 0; i < MAX_SIGQUEUE_SIZE - 1; i++) {
-        ts->sigqueue_table[i].next = &ts->sigqueue_table[i + 1];
-    }
-    ts->sigqueue_table[i].next = NULL;
 }
 
 void gemu_log(const char *fmt, ...)
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 1b3b974afe9..4dd209e402d 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -70,17 +70,9 @@ struct image_info {
     uint32_t  elf_flags;
 };
 
-#define MAX_SIGQUEUE_SIZE 1024
-
-struct qemu_sigqueue {
-    struct qemu_sigqueue *next;
-    target_siginfo_t info;
-};
-
 struct emulated_sigtable {
     int pending; /* true if signal is pending */
-    struct qemu_sigqueue *first;
-    struct qemu_sigqueue info;  /* Put first signal info here */
+    target_siginfo_t info;
 };
 
 /*
@@ -94,14 +86,11 @@ typedef struct TaskState {
     struct image_info *info;
 
     struct emulated_sigtable sigtab[TARGET_NSIG];
-    struct qemu_sigqueue sigqueue_table[MAX_SIGQUEUE_SIZE]; /* siginfo queue */
-    struct qemu_sigqueue *first_free; /* first free siginfo queue entry */
     int signal_pending; /* non zero if a signal may be pending */
 
     uint8_t stack[];
 } __attribute__((aligned(16))) TaskState;
 
-void init_task_state(TaskState *ts);
 void stop_all_tasks(void);
 extern const char *qemu_uname_release;
 
-- 
2.33.1



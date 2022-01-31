Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8284A4FE1
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:11:47 +0100 (CET)
Received: from localhost ([::1]:59258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEd1f-00080f-0U
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:11:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnZ-0004jv-N5
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:14 -0500
Received: from [2607:f8b0:4864:20::12b] (port=40850
 helo=mail-il1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcmy-0002ba-RK
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:56:39 -0500
Received: by mail-il1-x12b.google.com with SMTP id s1so12394149ilj.7
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tyuB/O2WEXIGgHuAFX6b2tzEg4QPq9MhpbLYs5ZniS4=;
 b=F2wTc5A9ra6+wEqJJLgT6qVQxgUcJUVPNx8Ma4kv03i8cAuJJctbNl8hrqW8uJTYAt
 /FONGXLms2Heu1DbVid77XPgYl/1YiJYHcztYIbkFjMxnwSWKx86AANS5IVrw3HwNUWG
 HB14z3Csg6aW1ymVyEKEoFGyk3i/32j75LXZPk+ZGPnI9DYMFwjZyh03O3FvGuQnLjFW
 LyXhSaiuzoM4JZlPVDCTP2BsEnkHnj3es3aDK9Jm8TDz7njU2KtdQ6eahZxv4NxLbXih
 njUnEUDgyjnSM9vWkYwe/MJ+vR55AgEyfFCo1XnXkm1cs67tbwwRhYb4ojOAYNQvvot1
 gxDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tyuB/O2WEXIGgHuAFX6b2tzEg4QPq9MhpbLYs5ZniS4=;
 b=4Lif7VlXSLcRTjAW+2WRumew3LKdbpoO3RzKeKqq6RF3me5wPjIKbhco3Q+VhkwOSi
 uAS2wKO1mXP7ZcZpHYvS+Aiwnym9G7TzDhVkSy7dhnUgi+ArnMT7AD3udbmIj0Cspzk2
 eydPhNm3nXQHAm3pc0py6wNrXdMnDf82Qfh/5PAR4AlTrfTieRTLmWKh0UqQGAxBVXF9
 EdsD8YrGiGDKyXUnjPVtEz1XhhlpbiJ1tKtekfER5Fg/Xh6JyE94dz88NtL/q4qqK09Z
 7vkojM3BIY+C8gIz7FldvUXUOByj6Ft3/I8RBLsw/gNipDa3jPQdve3v1A93re0bRYR4
 pIKA==
X-Gm-Message-State: AOAM530B+k+tsftq/dpGZd6rnUR6QE05QHUK6E0NjMo8Drum0AvEmv/4
 kJFsbrHQ4f3B3gDA6yp9cZTRsrhi2J8b6g==
X-Google-Smtp-Source: ABdhPJzEBT2Vc07J17S7MG8qZRHFK+0RzKK0EefkN0EUur8bcbWm8yPye61bA9MJSQAAszFacaRfMg==
X-Received: by 2002:a05:6e02:1e04:: with SMTP id
 g4mr4096161ila.188.1643658995377; 
 Mon, 31 Jan 2022 11:56:35 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:56:34 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/40] bsd-user: Remove vestiges of signal queueing code
Date: Mon, 31 Jan 2022 12:56:01 -0700
Message-Id: <20220131195636.31991-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
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

bsd-user was copied from linux-user at a time when it queued
signals. Remove those vestiges of thse code. Retain the init function,
even though it's now empty since other stuff will likely be added
there. Make it static since it's not called from outside of main.c

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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



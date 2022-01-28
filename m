Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4CA4A0442
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 00:34:40 +0100 (CET)
Received: from localhost ([::1]:36514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDalK-0003ew-6w
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 18:34:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDaf3-00005U-10
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:09 -0500
Received: from [2607:f8b0:4864:20::135] (port=42584
 helo=mail-il1-x135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDaf1-0001Xl-Do
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:08 -0500
Received: by mail-il1-x135.google.com with SMTP id u5so6739964ilq.9
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tyuB/O2WEXIGgHuAFX6b2tzEg4QPq9MhpbLYs5ZniS4=;
 b=AFftqhkz1iOb7ASFN5GjhxkYVaMeRpV9vUGz25DxPr7hrsupVIyj3Acvql3WL9mav9
 HprGSwryoGntT3Bu+hgWyY/f3ukYZ4d/xGcodzoVMmJ+GyHDM61NLlk0THU0cagQ5wCj
 KeJCRm1V7vDqML3JHPQr6IBCVhgyCISW0aI+YVWMQhxkcDl1BOX/+H5GuuUbhcFkay3l
 ztm6R4Ujs263eUyQC1F+h7ZjivAX6qgPj9NgnUWMaL28p6LaVyOfEFuN3hlJVDfLpWkQ
 HPl1gUXzOzTO+Afcg5fq9DWwDz1HAo2oFFkj5TwWL47F3uOIdvmN1VrWBvOtkRvZ2N/9
 SEXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tyuB/O2WEXIGgHuAFX6b2tzEg4QPq9MhpbLYs5ZniS4=;
 b=XAx817P+OlBKdOyPbsMX07s2yozqKS+w1x3P404FIeBXAJx5T4nfoeLjK4dygQTUIj
 sJkHaDuOfsNkTRy9p5CMo+0uH20PrvKr6/aPHAhyFf+2MDDVq/GAEc+mv3tnvWgk8G/c
 3g/8u1/mFTVr+pne3zr20cnxdLP5bO+677rwgaz+eQMs6ZJXxDC19Ga7WrU3iDigwJpC
 WYZINbbWkac4HFL05WJoUQdQZl4QZm/8W7gosWvF7uwurmlTBlhoWwkPXQ7BB1ISZc3E
 rmV43flU7o56VKG6JjCsCzegn3FChlnRLh+L2kLyj79MPiLIXf/CU7Pvgdz1gq23XpYA
 BBBw==
X-Gm-Message-State: AOAM531qs4iyij5JeDh9rl2B4m37m2j5gPgE3FfWpjgbNrb3l6gC1UrZ
 DyV1ua8KyOzXkixyg3XpM4B2GGd+lWg2iQ==
X-Google-Smtp-Source: ABdhPJyf57dh9lbtELbXTeC6v1qevipTk4Tpwe3D2VO7nQNHVKxdH+9l0Ji1My4pxAlRtwdku2EE2Q==
X-Received: by 2002:a92:dc09:: with SMTP id t9mr6937498iln.94.1643412486134;
 Fri, 28 Jan 2022 15:28:06 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:05 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/40] bsd-user: Remove vestiges of signal queueing code
Date: Fri, 28 Jan 2022 16:27:30 -0700
Message-Id: <20220128232805.86191-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::135
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::135;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x135.google.com
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



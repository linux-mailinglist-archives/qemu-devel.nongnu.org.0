Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 357B7427428
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 01:24:59 +0200 (CEST)
Received: from localhost ([::1]:40882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYzEY-0001lX-7L
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 19:24:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYz5W-0000HR-Kf
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 19:15:40 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:43727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYz5Q-0006o0-3b
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 19:15:37 -0400
Received: by mail-il1-x136.google.com with SMTP id h11so3757473ila.10
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 16:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VlZFGEcJ9mFJTqjW2+vGMQhKRbnVgW4Kcl7j68uvzJM=;
 b=Z8ercKG5/yEUUIvjZEBZoHF9V6lZWtrZv3C+CqN3TrC62SLMIFX4xNlwZiw2qriqCI
 J2SruZvtF2jDxHtCs2w+S7vfxquxQWkfeM37RQPGEGZn9wC+8QKTTTdkwSBtgrUCQGub
 w2+8VAmZCS+NNqvjUgVwwjvLyocqDAGoGwvFp9cXon2T59ML94TiAnOoriIpvgZpng8U
 E0Z+f2ojwoAlHf8Vc0MDLODwTV0QWyfOm/sd8j/IILPxiFgxbUZv707aBOg0DPT+QE08
 56TD2ueIkuNwD4Pm6eQ/m+qKwfdicGCyFpBSGCW+3VJAr82S+8ptK8WlG2l8dl6N3o0V
 Aomg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VlZFGEcJ9mFJTqjW2+vGMQhKRbnVgW4Kcl7j68uvzJM=;
 b=Yi5UaUNkvGXOvw0mtZvdGs43tDw+El1FdTgKSKeYJlUk0Wp3uvsK8NCrzFJRzY1PGV
 qdkgWSXHYbX5uySaLv8nlZz0xnwWS9BABmXBlXginyDDxu+o+CdrhVtj7LXBC1GMw1HE
 IzYjh5R3pyL3ZtHamMSrbPKMs8MtnwFo/zArMNscmRUgz/RuVOwXpT4XSfxd1ZODrbaf
 ivu30uqlz4K9VOXSs/aKTsuPRSz9QwZZH+xvUXBg8eWJZyIbL4dzeXb9URka104yb/Ye
 vEXzPaQ2GOd89WUnvVeJEHZgBwH4mmtykEiFqpvarPePt5Zj2XwCZy1tGFmLg5IePSuj
 aTXA==
X-Gm-Message-State: AOAM532PReWdykaYk9XL/icTEMbkbhpmFwwyVng12UCaGhXeo33Pa1gc
 /yaKAd4Sym5SPWgFPfners9pzc7KdvWf6Q==
X-Google-Smtp-Source: ABdhPJzS9sPXv5zgsHzNCVfS3UV3qOchQtg3j7BzQqM8Ly7W7U7HlMZKbydC+ViNAQTR+QFiprxsJQ==
X-Received: by 2002:a05:6e02:178f:: with SMTP id
 y15mr10320026ilu.175.1633734929794; 
 Fri, 08 Oct 2021 16:15:29 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id b15sm293628ion.8.2021.10.08.16.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 16:15:29 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/15] bsd-user: Add stop_all_tasks
Date: Fri,  8 Oct 2021 17:15:02 -0600
Message-Id: <20211008231506.17471-12-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211008231506.17471-1-imp@bsdimp.com>
References: <20211008231506.17471-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Stacey Son <sson@FreeBSD.org>, Kyle Evans <kevans@freebsd.org>,
 richard.henderson@linaro.org, Laurent Vivier <laurent@vivier.eu>,
 f4bug@amsat.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similar to the same function in linux-user: this stops all the current tasks.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c | 9 +++++++++
 bsd-user/qemu.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index ee84554854..cb5ea40236 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -195,6 +195,15 @@ static void usage(void)
 
 __thread CPUState *thread_cpu;
 
+void stop_all_tasks(void)
+{
+    /*
+     * We trust when using NPTL (pthreads) start_exclusive() handles thread
+     * stopping correctly.
+     */
+    start_exclusive();
+}
+
 bool qemu_cpu_is_self(CPUState *cpu)
 {
     return thread_cpu == cpu;
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index c1170f14d9..cdb85140f4 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -103,6 +103,7 @@ typedef struct TaskState {
 } __attribute__((aligned(16))) TaskState;
 
 void init_task_state(TaskState *ts);
+void stop_all_tasks(void);
 extern const char *qemu_uname_release;
 
 /*
-- 
2.32.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 403A04141EA
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 08:32:11 +0200 (CEST)
Received: from localhost ([::1]:39830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSvne-0006vb-92
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 02:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSvWv-0001My-9K
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 02:14:53 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:41594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSvWt-0007YY-Ty
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 02:14:53 -0400
Received: by mail-il1-x130.google.com with SMTP id d11so1547309ilc.8
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 23:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tTYEl08M4St6iVesKv7dwzZY/X4yBWzxZk2xR7dqYNI=;
 b=Q7x9A9mgG0iHiLtvbrWYUnwpMYuOymJ5zpBK4efasx+FLaZVMWd6dOfw3eClmbXKNF
 eGbgp7tMoUOvm4UPqc6Piozpppxn8PBZhgWpyf3Bqeb2bcKSvm/g/vF9OPBiMPHEbC4k
 /ErjcqHa5U5zr1ig4pbCwzw6qPhcTx8zNKIOHDLKKY2fWmY3aBYnOmZ+5d39aN7qc042
 yQQMLERth/0W17VMG3tfstBP/MdenoVcUWg6LYxbnumEIDOHVwpUGwGBpyQHaH30QNIA
 9W3k68fLePxg4DXE1lIebolswTcvaSHCpDHfJU4itHGZDNVO1ECf/A0M9ayPzzOidxfv
 9JYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tTYEl08M4St6iVesKv7dwzZY/X4yBWzxZk2xR7dqYNI=;
 b=ou4wEBxD4zKHb2cYoAJuODdLxOguOPAOubg0jLup7+dBb2N6Ou+mL6j1096Jwim2J8
 4V2NgYbcSV7YD0QKDrlKuGDlvQ/FEjTu0+5VNKdgoUNRxz1AaeTmGdtYQvQa9vu1S3CB
 oWyAUhMMI3uU9oRWizYyO+qytdD3sBhJVXko+z0sl2Ay3KTY9LXbdUkOlGA3Nx7r/ueg
 PRWL7kvKBsqGpl4O65FMjlaCosnq0EW/GHQVSVwFvsYObZuVN10mkzTTHMCN1AKQ3vC4
 Skiq4lwMmZn2jbrCEvE4abSnnDNBG/YP1EzIglF66hy5vixyEGa3rGEXxnHIM9Q3cHSs
 vLZw==
X-Gm-Message-State: AOAM531DADfGdAucrWHpivUdDUJKrtA//tcHKTB5ATffiXlSNoyws4BU
 gO5Z3giiyfgV6M1thJJrZuSp7OXkzuk0EwTad90=
X-Google-Smtp-Source: ABdhPJz3xhKNQkVQOhzBxQz8ZiincNZTGBZhwirv9MmNMgwOfHqBqlBVMd4/l/PA07w36T8dsTylsQ==
X-Received: by 2002:a92:d0d2:: with SMTP id y18mr24847327ila.80.1632291289544; 
 Tue, 21 Sep 2021 23:14:49 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a25sm540817ioq.46.2021.09.21.23.14.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 23:14:49 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/14] bsd-user: Add stop_all_tasks
Date: Wed, 22 Sep 2021 00:14:34 -0600
Message-Id: <20210922061438.27645-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210922061438.27645-1-imp@bsdimp.com>
References: <20210922061438.27645-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 f4bug@amsat.org, Warner Losh <imp@bsdimp.com>, Stacey Son <sson@FreeBSD.org>
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
index 431c5cfc03..4ee57b91f0 100644
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



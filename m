Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A10432788
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 21:26:00 +0200 (CEST)
Received: from localhost ([::1]:42754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcYGl-0000qa-EI
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 15:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtf-0008Qk-Cm
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:02:08 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:37743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtd-0001yM-32
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:02:06 -0400
Received: by mail-il1-x12a.google.com with SMTP id x1so15977584ilv.4
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 12:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gOB7gGX/i+XSfRneCtiATYoM7MpsErjYQkyIib0hZP8=;
 b=663SJcFMTOTKwHKIfFAXsFP0UsQcj5WO4YnnL6vTxkByWulZHLAtBMbMz5K5z4N0+a
 LhQAIU8TYivoGGJhLAA6YrxvB+FzZrl/iqkXdLwYNGqRfjSQeMcLpOcxF9Kcb/EbTUGh
 9Qe+cm1c2fWYmg8TQ1Nvpq1a9rXo3MxBRd7a5URQJ4HRxdPNpYYplFE/Gn1145Qam+Id
 QL1flDQkkfoWfz0QQBl261kQr92VWOjavWLIYEF0yap4sfoTu1BdtOCdQRTArJ7/2ZIT
 rQFFIwsMYERNYHn4hdE35Y+wZv+gmEPGhyMUH4uflTP/HNeNUXWAzM+OtLcsOUXXtVGz
 6Amw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gOB7gGX/i+XSfRneCtiATYoM7MpsErjYQkyIib0hZP8=;
 b=B8klNYjBddKWH5y7BvLOEi+FKorkTS5tf2BXN77qtLMWvtJQ5lvSRmL4UPUIYZftC5
 6RqE2kaqGSet6kOV1ivJdziGGnxOxZR1mF6cUlWl99JvVz0h+I2clzR0XgAwJdiIohY2
 /SSccUHaVsXPb46ZMmOYJhdD3pdSov5St1qbuoQCpqQn2azz+hpI4d1KAzfePaYDs/wL
 gXFEBrR7jCr6rk9TRkg9UB1JXOYLd+rUJaT+tpkpn4FgANQmvlQcjVa05hhgFPniyLMJ
 mk8OCi1UUQaKD+/8YVb/ifWjuoxqoHi80ksikaJFTGZYa7PPo0sKNo0+atyZFHVUYRZf
 1KRw==
X-Gm-Message-State: AOAM532S4DlE0tlF1iEMU6HMx7VAnYS3Oid/FUEIsEyMnGVV646QgI/+
 zNY3chI8mbzDpi9eboQ96Q9fUz000j6iqw==
X-Google-Smtp-Source: ABdhPJyv5FShyUJTBOtYeSIX+d757pUmDm7QHJKwyCI6JU0Lt5749Rl8PAFC4fM4Zxvugg1eiuS7CQ==
X-Received: by 2002:a05:6e02:1a8e:: with SMTP id
 k14mr15124708ilv.77.1634583723787; 
 Mon, 18 Oct 2021 12:02:03 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a8sm6945151ilh.5.2021.10.18.12.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 12:02:02 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 20/23] bsd-user: Add stop_all_tasks
Date: Mon, 18 Oct 2021 13:01:12 -0600
Message-Id: <20211018190115.5365-21-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018190115.5365-1-imp@bsdimp.com>
References: <20211018190115.5365-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12a;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12a.google.com
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
Cc: Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stacey Son <sson@FreeBSD.org>, Laurent Vivier <laurent@vivier.eu>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similar to the same function in linux-user: this stops all the current tasks.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
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



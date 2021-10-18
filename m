Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8597A4323BF
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 18:23:08 +0200 (CEST)
Received: from localhost ([::1]:53248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcVPn-0008Bj-Jk
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 12:23:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV96-0007ku-4y
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:55 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:41534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8y-00085y-P5
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:51 -0400
Received: by mail-io1-xd32.google.com with SMTP id b188so11987275iof.8
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 09:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gOB7gGX/i+XSfRneCtiATYoM7MpsErjYQkyIib0hZP8=;
 b=NOHg2L8DC0wSGPd5hhB3LkwfdNSTo19SQ9w33yULShgyqC3CcHHIcQ0TZLlevP9kKl
 r58qIBxrP1rM5IKtFommlfnmDOGUdDSwftZzN8huACK06qJu598Ee3xAGmvOrOzOUHdz
 XZ/WC5zPClb9k/lbqyC+R75d0QdV0r8YSFQ0OPqDbGmEBhxLJPPUWcmWAR/jxvJdQP3V
 neflVupBS9lW5MVEom07aCG3I6hLVVm+OOVqsE1dy/hjDO7Dxi21f2i2vGsnyIJRJlG8
 GjM3x1EX2HSbFFNDLLdaNkE9KhLczNOcR1482ifQ9vZ9ADxMP7ax7LvhO9vZlb1JoAXE
 BZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gOB7gGX/i+XSfRneCtiATYoM7MpsErjYQkyIib0hZP8=;
 b=AKK9AoYdYZlfOetQu6y9+23ufY//qN/B3aYsgzJlWCsPO6de5pGEuDnxm8X6Jgbxrx
 UTbzbriK7p7LicLUihB91TMwCYr0fEKxn6PTLdKdSxgi2ZRQP7qp318AAroNMNuhJTUd
 Pe0n9tHyx5hlhV2wWeRbMJ3ndM45vYDMJkzxC7ocoTuhNfDvFPGl8DOma6C5HzYHLJSs
 0X0AhChXfRWsdsks4bEG5EOGVJoujHAW8AYVtl+rnJlakY6ud5TU8jTT7+4JUEshRHDO
 ItLUeewcSwbdPr7saV//eKRqX0kj136iovOt3IQT8qx2vWHBeF6v5/sMo1Ybny3rxfsw
 PXeg==
X-Gm-Message-State: AOAM532o3F566kjiKJpVS1VnntLgjG5Jq62S0rmG07Eyqv12bwxGG90D
 w4xxKk5TnAKomvqIlax17hSbisXzzxiFcw==
X-Google-Smtp-Source: ABdhPJwLLS4YmZ1wNgE/mnsaqYRM4HkJsnpQdOSEdypGNzozornVl3ayu5hHC2Xh5AhtU5dT/mOYVQ==
X-Received: by 2002:a05:6602:3417:: with SMTP id
 n23mr14917168ioz.205.1634573134255; 
 Mon, 18 Oct 2021 09:05:34 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a4sm7240936ild.52.2021.10.18.09.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 09:05:33 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/23] bsd-user: Add stop_all_tasks
Date: Mon, 18 Oct 2021 10:04:55 -0600
Message-Id: <20211018160458.1976-21-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018160458.1976-1-imp@bsdimp.com>
References: <20211018160458.1976-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
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



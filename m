Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F8049A406
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 03:08:24 +0100 (CET)
Received: from localhost ([::1]:57534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCBFv-0000Iy-5p
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 21:08:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfG-0002Hr-OA
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:34 -0500
Received: from [2607:f8b0:4864:20::d2e] (port=39494
 helo=mail-io1-xd2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfA-0001df-Ly
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:27 -0500
Received: by mail-io1-xd2e.google.com with SMTP id p20so225267iod.6
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2cxVzUGQfUKapU6iJyRCNz3mEY37Sx777/SzAWGZs48=;
 b=QeoZcB2SrI8ufWWf3DZzZ0xsjEr1U64zl14kFyK8sVfCMEaAJA/N85plhyLvx/6Vq2
 8UjvGZqp0mYvoHKLBz3QCJvXDKXHIGis92liOkAjbmxYpbFf88JQ1o8UTNXG7rRDs8eI
 MghTgrEavV5HdfGZwCVHujb+KatTHI2dfCzofbVfrHD0RlnsqwpCAFMAJCSozPqdnVew
 2AMsqp2hW2aP3nqH9wOhdpXsfROsDtn/IvI+9RQTbvYqpyWunwRHLFBQJJggcXMROSD6
 VQBIDeKnRvmZD13cUkUCFotssQJR4dfOJkptW0vpbUgWfPWkZ8xEZrAL4ImMN+MTAWZ0
 P+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2cxVzUGQfUKapU6iJyRCNz3mEY37Sx777/SzAWGZs48=;
 b=JaEERsfzklHxg/remjJYtOjR/U6q9VdXvWPq9Qjd2iSq8s8l7r3Msih1PhuKafI8YU
 NkjwXFgX/meRDLonwO4c1Cvq8RvV4bf6SPRiax40feKH0XTcCsbGel69D06xrM0nEFog
 ZCIZH/BwnGTjvxfHLMyZbe0aKBlHvdB26NnMTNnr2GiyB8VYh9wnWWyrGbCUZnY5kxYM
 ir8OlYUMcgJF0sAtRR1/Xiu1PVMNsnDr/Ctu+GuaIpW7ARjRTtptGn5cUfBSE4SdyeU+
 pEOsGEboN6H0v/nGcxm5AYhAZ8Q42KmLikHBkUUaJHcD9FfhFhmGfuL68Ef2LKqQpFLG
 ceVQ==
X-Gm-Message-State: AOAM5307Vw5LaAmrLwgAquGVMKAiXVphApC4qpD9pi4q/gdxapF/vEB8
 yG7GTzE6uyTeiDXxOOI/6INsdvXqZ42GLw==
X-Google-Smtp-Source: ABdhPJxxLHZNWD25YapPtetfECozPVR6nTGbWB1oWVWjYimsqM1klcKgUmQf+zgbKYakDXZV+FAKKw==
X-Received: by 2002:a02:7159:: with SMTP id n25mr7700493jaf.29.1643074217803; 
 Mon, 24 Jan 2022 17:30:17 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:30:17 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 25/40] bsd-user/signal.c: Implement
 rewind_if_in_safe_syscall
Date: Mon, 24 Jan 2022 18:29:32 -0700
Message-Id: <20220125012947.14974-26-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
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

Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/qemu.h   |  2 ++
 bsd-user/signal.c | 13 ++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 49f01932a53..8ed1bfbca89 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -446,4 +446,6 @@ static inline void *lock_user_string(abi_ulong guest_addr)
 
 #include <pthread.h>
 
+#include "user/safe-syscall.h"
+
 #endif /* QEMU_H */
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index db8cf0a08f1..454aef2993e 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -48,6 +48,18 @@ int target_to_host_signal(int sig)
     return sig;
 }
 
+/* Adjust the signal context to rewind out of safe-syscall if we're in it */
+static inline void rewind_if_in_safe_syscall(void *puc)
+{
+    ucontext_t *uc = (ucontext_t *)puc;
+    uintptr_t pcreg = host_signal_pc(uc);
+
+    if (pcreg > (uintptr_t)safe_syscall_start
+        && pcreg < (uintptr_t)safe_syscall_end) {
+        host_signal_set_pc(uc, (uintptr_t)safe_syscall_start);
+    }
+}
+
 static bool has_trapno(int tsig)
 {
     return tsig == TARGET_SIGILL ||
@@ -57,7 +69,6 @@ static bool has_trapno(int tsig)
         tsig == TARGET_SIGTRAP;
 }
 
-
 /* Siginfo conversion. */
 
 /*
-- 
2.33.1



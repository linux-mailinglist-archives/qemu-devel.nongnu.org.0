Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B74D64A0500
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 01:04:57 +0100 (CET)
Received: from localhost ([::1]:40474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDbEe-00058n-J6
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 19:04:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafm-0000fr-CU
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:54 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=43744
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafg-0001aE-N9
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:53 -0500
Received: by mail-io1-xd2a.google.com with SMTP id z199so9685251iof.10
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kcZ/fxJZTdiXxs5uHcd2Nm1OFR/CKnoGxaFeU6jvAsI=;
 b=pzci1BDorZmXncrG5UQtZ5vYbjjeDRaxAQlUQRryeUX7/s3mq8cWpWFbWOJjTmJ5OK
 amAfZpHlq3vK+/pHnzy8rW+HdE6QNybh94xPbLkbKB7q9G4xP1LGA9dexE/v4Yy43Mxz
 O2k91j5sWmPbZKwvbV23Dvs+uGrzYo+WVPAr9Lg5Ng9nyH152Qfk/mzGw1obt1aK7vLl
 EyNGOapSe4h7FzKTdJfJo97AeXZoLAdQaCcdjXlhLT7TBnq5plVwaKCANPFLc6n6dw03
 F1Tjdd5LZqUWIOpBXyk8AzicHXoNS5tEuez6UCizlsGiTLy9KbVJVx9HdgNSNKB67pPt
 lF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kcZ/fxJZTdiXxs5uHcd2Nm1OFR/CKnoGxaFeU6jvAsI=;
 b=OgJVkcduY3z+vCp+EahBzYBo9HZKksyunwAW9RPYIKfCjJbLexUVYF+IWAvcPTI4cs
 wHE6ma8n8AQcyR7axUoRQmcfwc6z/clWt1XPStKdG494Hih4qGB6O9YhZ8oD8ddYjSFt
 L+xGO2VGUmrP0xYkzd9w7DhNvrVKH0KQR0ZOOdBks7J9r4X1aIvrCt/1MU3cdRMB4l7s
 YjGid/ApAttZNry4bfQE9JTIulGGq6TdSqgqySLYRzQtlY1QF/wyJLvGTRk4odM9d59f
 ZmXxGXtADfiy+sTTe1mLGJiittlunC8my/uXarYdlGsXFYr1WD347UOGdpq6kr6tArWs
 RP3w==
X-Gm-Message-State: AOAM530UVxSaWG6Bnpd5OHGgoloB98g/ME3BSt0B2TZYpDFOKcTeiqc7
 gCYxqmi7n88AmA10xeShcef4lxnHW0MhgA==
X-Google-Smtp-Source: ABdhPJyIJOfZOlxhQOseFDDUe+DSC+SUk+dadvFGAo9IC0ay18eEcTVyx7L/B85FwpRy97ClH+zl5A==
X-Received: by 2002:a02:23c5:: with SMTP id u188mr2356809jau.55.1643412498812; 
 Fri, 28 Jan 2022 15:28:18 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:18 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/40] bsd-user/signal.c: implement abstract target / host
 signal translation
Date: Fri, 28 Jan 2022 16:27:41 -0700
Message-Id: <20220128232805.86191-17-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
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

Implement host_to_target_signal and target_to_host_signal.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/signal-common.h |  2 ++
 bsd-user/signal.c        | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/bsd-user/signal-common.h b/bsd-user/signal-common.h
index f9a9d1e01aa..efed23d9efb 100644
--- a/bsd-user/signal-common.h
+++ b/bsd-user/signal-common.h
@@ -13,8 +13,10 @@ long do_rt_sigreturn(CPUArchState *env);
 abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
 long do_sigreturn(CPUArchState *env);
 void force_sig_fault(int sig, int code, abi_ulong addr);
+int host_to_target_signal(int sig);
 void process_pending_signals(CPUArchState *env);
 void queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
 void signal_init(void);
+int target_to_host_signal(int sig);
 
 #endif
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 844dfa19095..1313baec96a 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -2,6 +2,7 @@
  *  Emulation of BSD signals
  *
  *  Copyright (c) 2003 - 2008 Fabrice Bellard
+ *  Copyright (c) 2013 Stacey Son
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
@@ -27,6 +28,21 @@
  * fork.
  */
 
+/*
+ * The BSD ABIs use the same singal numbers across all the CPU architectures, so
+ * (unlike Linux) these functions are just the identity mapping. This might not
+ * be true for XyzBSD running on AbcBSD, which doesn't currently work.
+ */
+int host_to_target_signal(int sig)
+{
+    return sig;
+}
+
+int target_to_host_signal(int sig)
+{
+    return sig;
+}
+
 /*
  * Queue a signal so that it will be send to the virtual CPU as soon as
  * possible.
-- 
2.33.1



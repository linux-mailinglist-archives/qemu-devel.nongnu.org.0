Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDA14438D8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 23:56:57 +0100 (CET)
Received: from localhost ([::1]:53924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi2i8-0005Yp-KW
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 18:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2ek-0006M5-9G
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:26 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:37396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2ef-0002l3-PM
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:26 -0400
Received: by mail-io1-xd2c.google.com with SMTP id y73so593243iof.4
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 15:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A3xeQseg7XCe/PHz62qvWhdyf1FsVU4bvG/P2lXDf50=;
 b=U9EAgY2UWzBeUi1+xQbYvftzEOyEAWQOsxTWaLcTdCeXdoEM15G8UQ/U53gemHS0TB
 DfVKFDHGJDBkH1J73sSLWM0Y7oAyklu+AsJK/htnpFnMMp7c52SWaokOJlWwCQD6rh/2
 ky/e1D/7APDbLXPx4E0LeIzmo06DGn+M2HKni7eYmpKWz2+JdlptaTXqMbnOTOmqQzKr
 NxXx/XEYuPhZB51NIff1k7C9bDfQY6s+l51+fszsDDWi1+BjJkN1HoDVMmWVsQZSeS2y
 n1D8+hmdIx7ZA2WYxaXrp789yATsrvtRCvX7sQci4PyvkCd3PPP0NQzi/D7XCWKmBcW2
 qi6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A3xeQseg7XCe/PHz62qvWhdyf1FsVU4bvG/P2lXDf50=;
 b=HBDzk5cGSqIGcLRWXwjBNWYpSgdT9lZiWNyec4+DBSw4c/VQDzXYadJZnfN0ggS94o
 QGoPhwxQS124n9hk+xOFmIjIFj2+Yw8dVZtrQby2KV3O8nvHVKkADv/MCAGI6PdJzjCv
 xxgdLT8+rXJPyae5hlLjAatrLbdCfFLCBLjZNC3Rfp1fqacwswzkkWjies5PukCKMPil
 Hla/99XI/RSOxpXuP4goUo91EqG8kfDg4YHSOaIlzgLf6YSbI9XR9pYteSZna2JI5c+a
 cphJuYtF8FCSCEMKfnx+N9C7vEhPVR4o9i7ISU/6CHMANyR40hT7IpfteaGLEA7bHCIL
 i6jg==
X-Gm-Message-State: AOAM531j8dza8RnFdJw9OVzZO7W8rllkYbGdc748lbwcOlqGCuTQ0wXi
 rPaMCJUdrWEWvXXCkCyOHUWjITjv8xsBAw==
X-Google-Smtp-Source: ABdhPJxrOzTswHuhehWPfP+wiSFkMle9PJ8pGFAkQt1fkaYfw+5GOLBfyeGFR9ciwT6gj9fp5Y7fig==
X-Received: by 2002:a5e:cb0b:: with SMTP id p11mr28233000iom.41.1635893600372; 
 Tue, 02 Nov 2021 15:53:20 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:20 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/30] bsd-user: Add stubs for new signal routines
Date: Tue,  2 Nov 2021 16:52:19 -0600
Message-Id: <20211102225248.52999-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Until the signal support is merged from the bsd-user fork, we need stubs
for cpu_loop_exit_sigsegv and cpu_loop_exit_sigbus to link. These call
abort after logging a message. Since singals aren't supported here
yet, this is sufficient.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/signal.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 0c1093deb1..05b277c642 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -20,6 +20,11 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 
+/*
+ * Stubbed out routines until we merge signal support from bsd-user
+ * fork.
+ */
+
 /*
  * Queue a signal so that it will be send to the virtual CPU as soon as
  * possible.
@@ -36,3 +41,19 @@ void signal_init(void)
 void process_pending_signals(CPUArchState *cpu_env)
 {
 }
+
+void cpu_loop_exit_sigsegv(CPUState *cpu, target_ulong addr,
+                           MMUAccessType access_type, bool maperr, uintptr_t ra)
+{
+    qemu_log_mask(LOG_UNIMP, "No signal support for SIGSEGV\n");
+    /* unreachable */
+    abort();
+}
+
+void cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr,
+                          MMUAccessType access_type, uintptr_t ra)
+{
+    qemu_log_mask(LOG_UNIMP, "No signal support for SIGBUS\n");
+    /* unreachable */
+    abort();
+}
-- 
2.33.0



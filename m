Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5856DE205
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 19:12:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmHWO-00043r-6M; Tue, 11 Apr 2023 13:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pmHW3-0003sl-1y
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:10:47 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pmHVx-0006A6-KC
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:10:46 -0400
Received: by mail-io1-xd2b.google.com with SMTP id bh15so14127939iob.9
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 10:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681233038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eKTshgyJue2IZsMB5Fao8NJgZMXSVIaxyIPYq4hYHh0=;
 b=fmCvsr1fbrFru3gdgpNzIiygf61Z6ULbZ8qmcK9gCBdK3dw1697dQZCRUSelfqUr7I
 5stfv+rquKbC+Moi4iLEfvyO70HjBCY+3koBMarUKpWLg/zEvYFhKaWETg/EyTbGtdVc
 6vM9/jnJ5EZVDmrgGKQdNJ7+kLzOO26R0vvQBApVRm7TPSMvdwhSVtuqbjaWgXaZIC98
 G+CoIi11kME9LmyGOVOgY18XcGsO+zmKg0ZZdgaIx0hFdugOQb7b2TsRTwTR0v0/KEX7
 NanecCDqfy8KRewymTB4QKiCv7SmzVJcR7Du8rSUvHS7WBlw2iyYJaWriACRyURPgfOW
 btmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681233038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eKTshgyJue2IZsMB5Fao8NJgZMXSVIaxyIPYq4hYHh0=;
 b=g2DNVAjaYAR42xbnpqsngSh7R/OwpoyEBd3Qzegf+wFd86EEoqHXUYUksIzTgavgrW
 gWgGPdH6sqil2BWXFQGVCsHBkMvXt1H7HnZXBHmbhrHZQhCCq/2d7k1XFGouui6poR/g
 gbR7kKq/Co7kvCQkMRa6ftLxhnV7jIJBTLc3BNRsra/HQADx9NCUkiJYL+YAtDpKPF5q
 c8yGjR9d7VV4+qrDIS8HWr9okAMZeJoudnlP1fZldor6TvLuu9IlewdsTxhdeQmyDCio
 oP6AC7ju2qPPUKyI57HubESX/Ka03okOK54kXlakLuVr73/pJRX7lnDKiXA61Td4rsp2
 N6cA==
X-Gm-Message-State: AAQBX9esn8qj/KH87HQAuneSlRE9o8iFizRk/nDL7jxTPdeBjEtv2eDd
 46/ptrqaLewcjocS84iYWor7i6Txsvhs1m0yQjM=
X-Google-Smtp-Source: AKy350aZyGUwGM+ESfCZTBEi89fApHLEWJ+zhCsK7uBFBdCNUKMBJlqqiRfX78ntnWfDAxtLj6fEcw==
X-Received: by 2002:a6b:c413:0:b0:758:7abd:959f with SMTP id
 y19-20020a6bc413000000b007587abd959fmr7826486ioa.18.1681233037741; 
 Tue, 11 Apr 2023 10:10:37 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 d36-20020a0285a7000000b0040b11b7ef54sm4140942jai.39.2023.04.11.10.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 10:10:37 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: ryoon@netbsd.org, kevans@freebsd.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, riastradh@netbsd.org, brad@comstyle.com,
 reinoud@netbsd.org, jrtc27@jrtc27.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 15/20] bsd-user: Add SIGSYS to core dump signals.
Date: Tue, 11 Apr 2023 11:09:50 -0600
Message-Id: <20230411170955.17358-16-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230411170955.17358-1-imp@bsdimp.com>
References: <20230411170955.17358-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

SIGSYS creates a core by default if uncaught. Follow that here. Sort
with the same order as is in the kernel.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/signal.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index f4e078ee1da..4301595cc2f 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -330,17 +330,22 @@ int block_signals(void)
     return qatomic_xchg(&ts->signal_pending, 1);
 }
 
-/* Returns 1 if given signal should dump core if not handled. */
+/*
+ * Returns 1 if given signal should dump core if not handled.
+ * Compare with kern_sig.c sigproptbl[].
+ */
 static int core_dump_signal(int sig)
 {
     switch (sig) {
+    case TARGET_SIGQUIT:
+    case TARGET_SIGILL:
+    case TARGET_SIGTRAP:
     case TARGET_SIGABRT:
+    case TARGET_SIGEMT:
     case TARGET_SIGFPE:
-    case TARGET_SIGILL:
-    case TARGET_SIGQUIT:
     case TARGET_SIGSEGV:
-    case TARGET_SIGTRAP:
     case TARGET_SIGBUS:
+    case TARGET_SIGSYS:
         return 1;
     default:
         return 0;
-- 
2.40.0



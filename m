Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA04433D72
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 19:26:13 +0200 (CEST)
Received: from localhost ([::1]:36930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcssO-0004hT-8l
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 13:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEt-00006Y-1u
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:23 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:45654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEj-0000HI-NY
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:22 -0400
Received: by mail-io1-xd35.google.com with SMTP id 188so21074170iou.12
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 09:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NAOR1xdlj+WVz0/eC/F+PLm/lzyts9sAm9QAoPvWdyM=;
 b=UmfUbmTN/kWpXarVj+lgqIYHQFjgTVhZDp8yCriXUny78jIUjxW7n6SRXhOn6g6ytQ
 DnYrge95kExwb7A6lN2vU6IB+TAEevPY/aDzk/OneW5mexnaZflWzHlHfkF5P1AiInaJ
 I2QeridW7ZDFcBEWuOvYcyAWqrZ31/+7PF+LQ5S3IWkbcte+2fA+HD6/RGgJmlgwG5Gd
 HcU+pMHdWGzkPB/jrq04wxnxGWC2+3SJmDBjBzPx9wG2uSGb0SHv0W9kqiM4pFvq5fxb
 4XpHDjakc3/CxccMUwpwoWw8aSUfUY3rfDOt9RFujln4CY+67ECnqpybxlf7st6YZDCx
 VOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NAOR1xdlj+WVz0/eC/F+PLm/lzyts9sAm9QAoPvWdyM=;
 b=kpaisVISh7O7HR3KawleIhD4KxPFoB2kI3x/lerX+YKk4dy2GMkzCB1ifcKKPpXygU
 GRWYirEKPO3ipkr9RLAAWiggCXMzEjIQi3VZFP/ysnGqpawWp8uVl/30OL6iGY9XeqtN
 CE7Utvpqi2cBhh+5Lpo51QX9gH4PMYUGTBEhtEyjzFIjYAA/FdMbWFtsJhmk1JW+AkBX
 M4Dvy+JBQAY/JjrwyLDRC9wuK9V56S6msfhMGAyIp4hI77KySUphznedrvbRF1BUzmGm
 LWKQUUTJAhR0sdW8xIH54ULKXJlU4YviiVCfnLl8tUhAAJIdniL+yJIwt7jGhF6pK19a
 dOaA==
X-Gm-Message-State: AOAM530NQ/+YfoCCSvmmuLCXbqtkzlOq6S95iJhXW9BKbFvu/gMiJYHY
 4PRbStbPUqQNK8SuTPq49Ybvp780oL72Jw==
X-Google-Smtp-Source: ABdhPJwdOgj3ldNBvNQKiV8FTNhaGdD8q3y0izLOb8laN3RIjsiRpcgB47nJG+vZ9mwGafsi2MKwuA==
X-Received: by 2002:a05:6602:2b8f:: with SMTP id
 r15mr19697380iov.93.1634661912360; 
 Tue, 19 Oct 2021 09:45:12 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:11 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/24] bsd-user/arm/target_arch_cpu.h: Dummy target_cpu_loop
 implementation
Date: Tue, 19 Oct 2021 10:44:29 -0600
Message-Id: <20211019164447.16359-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Sean Bruno <sbruno@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a boiler plate CPU loop that does nothing except return an error for
all traps.

Signed-off-by: Sean Bruno <sbruno@FreeBSD.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_cpu.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index c71ec000b3..94c9109c3f 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -35,6 +35,28 @@ static inline void target_cpu_init(CPUARMState *env,
     }
 }
 
+static inline void target_cpu_loop(CPUARMState *env)
+{
+    int trapnr;
+    target_siginfo_t info;
+    CPUState *cs = env_cpu(env);
+
+    for (;;) {
+        cpu_exec_start(cs);
+        trapnr = cpu_exec(cs);
+        cpu_exec_end(cs);
+        process_queued_cpu_work(cs);
+        switch (trapnr) {
+        default:
+            fprintf(stderr, "qemu: unhandled CPU exception 0x%x - aborting\n",
+                    trapnr);
+            cpu_dump_state(cs, stderr, 0);
+            abort();
+        } /* switch() */
+        process_pending_signals(env);
+    } /* for (;;) */
+}
+
 static inline void target_cpu_clone_regs(CPUARMState *env, target_ulong newsp)
 {
     if (newsp) {
-- 
2.32.0



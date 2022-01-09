Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85532488A86
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 17:26:15 +0100 (CET)
Received: from localhost ([::1]:35050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6b1K-0005ab-Jd
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 11:26:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6aus-0005ME-Gy
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:34 -0500
Received: from [2607:f8b0:4864:20::d30] (port=40681
 helo=mail-io1-xd30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6aur-00075j-1K
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:34 -0500
Received: by mail-io1-xd30.google.com with SMTP id q5so14351951ioj.7
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 08:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q1qZC5vNCCsIJYSakIBaD2nrV2Zz0bBAsRBqPjX58yY=;
 b=oB2WgEMXJBs9il3FzijYpkTGxzvbcWIhDRvtkZRF9cDK1Evhs5B46givztN89Yhy8O
 5mAdCzMtCFKohV5ZY5oN3f1FwK0xMeLVoGNIkRuQX07K1MYdI9SwmU5fAWn/I1nkQnmL
 cVLLcCRQbr9TnK7OGe7q9qF2fB9WwvAfitka4t+G1MfGyQlIldXuyfDi73Bud9Rv+6Ga
 DAKcVgyVXAe2noedQvkcgxlKh4SZZKVZ35T0rs+6+3OMcTPxuLpK/t0Df5E7cb1XP2z3
 RT6CE9wCrkjDqc6AZClTq0va6403/Wl/t1kg3ir6iUmVk2aiBl0vK722+ItCsEoP6TCT
 aFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q1qZC5vNCCsIJYSakIBaD2nrV2Zz0bBAsRBqPjX58yY=;
 b=sNkI0DnHZPhKxOn1Bdbu4ITiEV+67QvkeNcnBS7/P8cTSuWO6TRZ2xjtDrWj/ltkbo
 5TVcTxLHYsNTwfv2qTkOoxS0ynUGC1+GlZQsusTLjWg0zHJkuFTVuqNAXIwRDHofnVqd
 SjxQTkqUstu9uDf5PlZout26M3dHl6sHnNQ+WwjzAOj/cIMrW3iFdff0+DY3NIIvWUoT
 A8Fw03IyCIxgXDyuetpaw3I0ozdfl9CBpbx9RG92rgwTOxmZofDvpzrje71s4zSS3W05
 DqYCv8IyC7wNtYpmZV9NiXofQFH+MjIWi7xhOGv4hWULyi3u2h/dUTZutTZfMJkQ7pIq
 RrNQ==
X-Gm-Message-State: AOAM533tFVfeox31daNdyWsOIt7N39eBmQccJ0lfB49kLEXM1dOGcHfC
 ire/N2UDy34s+WFawftwR39quISLr5msWJUp
X-Google-Smtp-Source: ABdhPJz9J0p8t9Iub1LfZWE31sgsvKTpJ5BOCaDUisTLq2jj1TQE3tkIjG5/3j2LyPkBrBBHQ6UlMA==
X-Received: by 2002:a05:6602:1484:: with SMTP id
 a4mr3213539iow.112.1641745171768; 
 Sun, 09 Jan 2022 08:19:31 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm2683386ilq.76.2022.01.09.08.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 08:19:31 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/30] bsd-user/signal.c: implement cpu_loop_exit_sigbus
Date: Sun,  9 Jan 2022 09:18:57 -0700
Message-Id: <20220109161923.85683-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109161923.85683-1-imp@bsdimp.com>
References: <20220109161923.85683-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d30
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

First attempt at implementing cpu_loop_exit_sigbus, mostly copied from
linux-user version of this function.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/signal.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 12de0e2dea4..844dfa19095 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -80,7 +80,13 @@ void cpu_loop_exit_sigsegv(CPUState *cpu, target_ulong addr,
 void cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr,
                           MMUAccessType access_type, uintptr_t ra)
 {
-    qemu_log_mask(LOG_UNIMP, "No signal support for SIGBUS\n");
-    /* unreachable */
-    abort();
+    const struct TCGCPUOps *tcg_ops = CPU_GET_CLASS(cpu)->tcg_ops;
+
+    if (tcg_ops->record_sigbus) {
+        tcg_ops->record_sigbus(cpu, addr, access_type, ra);
+    }
+
+    force_sig_fault(TARGET_SIGBUS, TARGET_BUS_ADRALN, addr);
+    cpu->exception_index = EXCP_INTERRUPT;
+    cpu_loop_exit_restore(cpu, ra);
 }
-- 
2.33.1



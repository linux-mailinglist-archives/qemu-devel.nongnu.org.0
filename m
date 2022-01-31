Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6964A5092
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:53:14 +0100 (CET)
Received: from localhost ([::1]:60526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdfl-0007uT-40
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:53:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnl-00054B-5z
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:25 -0500
Received: from [2607:f8b0:4864:20::d2d] (port=35653
 helo=mail-io1-xd2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnb-0002dg-SF
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:24 -0500
Received: by mail-io1-xd2d.google.com with SMTP id 9so18464814iou.2
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WzkIKVsgbL3BkTFsfAwelEbf+OyNiGDSqNoHVUm1RWE=;
 b=BgGg6kln7oKQ6M96TqFFD0Uhe1+tLpZtQ95+L31nbWLmJ8u/W0F8qIroOboJw6wgE9
 dKIdImf8UdnUIDLqozRJeFpi1lJjTgMlPtyRXyB9FvYp0AeikDm+0LGknCC6+RIF1IP3
 Iga1iBeq0QQhUpRLQrH5IIKWOwcfRfrHmP4Rpo7f2xs6Y3DKOkJdol1tGPuYciDt8Xwf
 bYOdA2xXFG1g3aRPt5mJp9m3LdrbSz4vxbo9z/7y/Hce+++qEv9548XT4+CzwfU27/xx
 zl/vJ0sAJu5mssri3nUlPBH4t2RrxhPHN/2axYnhmU0r4V5s1G8WYtkJ8TdmAPuzY9Kf
 zTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WzkIKVsgbL3BkTFsfAwelEbf+OyNiGDSqNoHVUm1RWE=;
 b=m10GCTu/KilaLpM6zjTlUMWdilmbenv7RD1OlfhCMp0Rz+lIyStVjDskNT4JiQydXF
 0AlHPU/JHVSCCcsooHLdzdzmv53CY2A+T5SvZpKtkEGXPzoAUdBb1BqupVNzUwD57hvS
 KSusEk4SVbXUK9d3om7mAVUjrYnyW8FdhbanE3r8WrCh5T+wQLzhkajq6X0rYi6ot6f2
 D/lwVunuSN0a6Yf8Df6LX+q7QZ4JsIdn5C5p+CTdPo5oDWa+iDLUhvTCWpm2lTArDE1G
 tc863nBH9Xr7iryPxoEpUuvVMA3McK14gVek1FqtCBPKcl4aqzkkxef58HYn7ND7haGE
 veeQ==
X-Gm-Message-State: AOAM532T4TiD75a+IxpdMUaAg4QhzECLZi7UpeZvLE4B2aTRZp1c+AJw
 pM+7MJX3bxfbTe2LWZqkXQjT6YWHZo93hg==
X-Google-Smtp-Source: ABdhPJwMpOfZ+7jkhA3MaP7nR+GTHZh/UXr3ndEsgDxGf0TqvD2gxK9+Xaslcfe32ytoyqpJs9cUYA==
X-Received: by 2002:a02:2208:: with SMTP id o8mr7844047jao.72.1643659000990;
 Mon, 31 Jan 2022 11:56:40 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:56:40 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/40] bsd-user/signal.c: implement cpu_loop_exit_sigbus
Date: Mon, 31 Jan 2022 12:56:07 -0700
Message-Id: <20220131195636.31991-12-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

First attempt at implementing cpu_loop_exit_sigbus, mostly copied from
linux-user version of this function.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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



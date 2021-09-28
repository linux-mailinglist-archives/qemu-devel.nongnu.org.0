Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E219A41A52E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 04:15:42 +0200 (CEST)
Received: from localhost ([::1]:44196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV2ej-0006lv-Vl
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 22:15:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2QR-0004aL-Bn
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:00:55 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:37661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2QO-0005i3-9a
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:00:55 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id o15so45064qvq.4
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 19:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9uDmWChPs4lp5UI8b6weWaZXX8zbdz4czXb1drnckGg=;
 b=Y7MyHPqd0zxKUoYZH3onKJDxhHXNCeQs+ORL1n7MWgm43lZLlattGstOihEANNIMop
 JGy7mSI+34LQrNaI30Uec9NCuwrMC1rCzpuZiZcg5AuaEx9xrZ88+FVCrZ6WT5oybavI
 xbT7oSKCzuJ37okPSaQFu8Rgj402L+AKokg4bSSOBRFCDeOx0saXs30+3ZloHdZdow70
 fM3LVqypVNZkmIFvdS0rRqbGTYQ+CiCO9cOq7+bX2i8oGFcwDINYbp63gBNusD/1z9KA
 uZ3XUW6fhB3CuHTdJNauOBYT1zCdmY27b/y7Ets3Hth1Jps2sw/i/aVIjbvFSpOrtvLZ
 m87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9uDmWChPs4lp5UI8b6weWaZXX8zbdz4czXb1drnckGg=;
 b=35b5h/p5wQyYbXS/Iqr5cn6/cvbTXrPdAhCuYhuygtetQr5sWW93x+McLQ9LXdIhra
 50gFKvnSdXJsjEZZByp/hiB6jC9sAXIUy1NAQyq64/FvkMpTrg67mJnWEesAjDjKzAYS
 2gGffBYQ7D5oWrNl5TOj+Zk6pYIJAkuhYMKbkukpNpsbVmiU4ckzfihYrRObqJDtSx+Y
 SAGzhULo8e8P0ZoArKzTG5sv8k2usVFZh+jXB2/OJ7Ea9RI2s6YhPozlGfY4yyiMdWNg
 ZGx+R1ZsBt/ixLXA25NNynvOmdgykQS3WDakIhZ5sPwrTGnP1C50P9XKcgd9oUyB9P7+
 fDow==
X-Gm-Message-State: AOAM532uicwX91EgJSKnZzZSlh1VrJCj73dLk/RPiSXNbcvkK7kndCOs
 qc8aLKwMro0ryb3SHwM6+MIoS8oARwnVeg==
X-Google-Smtp-Source: ABdhPJw0yM1WWRRDpKaLGlb09oeVQFdVkfFtlbDFjTL6MkM9WjqPgTDTl0KUSgq4mg56vNKCiPwb2w==
X-Received: by 2002:ad4:4a93:: with SMTP id h19mr3358510qvx.41.1632794449535; 
 Mon, 27 Sep 2021 19:00:49 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id g12sm12530370qtm.59.2021.09.27.19.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 19:00:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/25] linux-user/hppa: Document non-use of setup_sigtramp
Date: Mon, 27 Sep 2021 22:00:23 -0400
Message-Id: <20210928020039.184412-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928020039.184412-1-richard.henderson@linaro.org>
References: <20210928020039.184412-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We cannot use a raw sigtramp page for hppa,
but must wait for full vdso support.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/hppa/target_signal.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/linux-user/hppa/target_signal.h b/linux-user/hppa/target_signal.h
index 7f525362e9..d558119ee7 100644
--- a/linux-user/hppa/target_signal.h
+++ b/linux-user/hppa/target_signal.h
@@ -71,4 +71,18 @@ typedef struct target_sigaltstack {
 /* mask for all SS_xxx flags */
 #define TARGET_SS_FLAG_BITS  TARGET_SS_AUTODISARM
 
+/*
+ * We cannot use a bare sigtramp page for hppa-linux.
+ *
+ * Unlike other guests where we use the instructions at PC to validate
+ * an offset from SP, the hppa libgcc signal frame fallback unwinding uses
+ * the PC address itself to find the frame.  This is due to the fact that
+ * the hppa grows the stack upward, and the frame is of unknown size.
+ *
+ * TODO: We should be able to use a VDSO to address this, by providing
+ * proper unwind info for the sigtramp code, at which point the fallback
+ * unwinder will not be used.
+ */
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
+
 #endif /* HPPA_TARGET_SIGNAL_H */
-- 
2.25.1



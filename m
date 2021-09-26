Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65932418CF6
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 01:03:01 +0200 (CEST)
Received: from localhost ([::1]:43626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUdAi-00084Y-FP
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 19:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcfE-0006ZR-Lw
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:30:31 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcfD-0007Vx-BQ
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:30:28 -0400
Received: by mail-wr1-x429.google.com with SMTP id c21so16817321wrb.13
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L6ntqmXS7ifceLSpB74XEWOrQdhQXzlIYsRxqC94HM4=;
 b=UB1ZuHAEDwCOnYBJMXx5GsGLkCbYLg49aVp58+G3pqAKA2esQVSRgnBAvUuIb0+pkG
 fuLqDQB+qJRgmasVjKmx5cGyxqQvy+qGoA59A+9v1hvvPseTabM3pcDohu2RFE1zNDSo
 ysAa1NQyN1RxOADyBCWho5XegOTCuFxCxQkCufYJf6+3NdUpGpxSlNbFhJ5JaGt/zF3P
 G0zxbhh1/XIkXIbs/CIdH9FxAlt6M+YG5yU3w4QJu4gLOXLnEtQnJIQpQ7m6jV55urQc
 NqyqZNN1vDgpBywnj52pxlxz7h53LBQkspnzYVtu83OP6oB0+VC3GG+1++g8f5lO46zf
 ixgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=L6ntqmXS7ifceLSpB74XEWOrQdhQXzlIYsRxqC94HM4=;
 b=OClTJjQCL3oYPu1y2X2MRYqn7M/tWkDvse4DNjxeSFEZ2w3NN3LLebRlRCsK1A47e9
 56PVm7BNPbzUznWrIdxvVWR7txv6hG7aTChAhJ/zCmN8D+yB8PfO7T/e+uclEqgBVxUR
 +wg3NYbrGx/wWye/MwcsihVX14c1pde01KJ6dzw/SfPh1sBZw7/xWCpfy9+6/VWzlfML
 TehN4TJU6V6vCLkRdltLiESC1wrbF/gzhgd8T3D+ibaaTsdWQLg2IZLa49B+MY5ezWiT
 f33NkP69Pcz5qw7ETuGrakQbofrGOdjjnCWlAUNPGaPeIMyOYdr6u5UfBtTceO8BAVCl
 MwpA==
X-Gm-Message-State: AOAM532syjzHhAFNDYdR/habxXhKSbIEGsOAgA4aU9hv92LmdCsQ7RcE
 Faa0dC2tjF80Pf+j4Ig/U6NDfGB7NpE=
X-Google-Smtp-Source: ABdhPJwuprpBjTMgomoIinkBrGSQGzDEbyHdGIoi7a5I0stqV299IOSKI3PP7LgwVgKwg1yuAqmvrA==
X-Received: by 2002:a05:600c:b47:: with SMTP id
 k7mr12796837wmr.103.1632695425998; 
 Sun, 26 Sep 2021 15:30:25 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 u5sm15967283wrg.57.2021.09.26.15.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:30:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 40/40] accel/tcg: Simplify tcg_cpu_has_work()
Date: Mon, 27 Sep 2021 00:27:16 +0200
Message-Id: <20210926222716.1732932-41-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All TCG targets implement the TCGCPUOps::has_work() handler.
We can remove the non-NULL handler check in tcg_cpu_has_work().

Add an assertion in tcg_exec_realizefn() for future TCG targets.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/tcg/cpu-exec.c      | 6 ++++++
 accel/tcg/tcg-accel-ops.c | 5 +----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 5fd1ed34222..d577a65237c 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -993,6 +993,12 @@ void tcg_exec_realizefn(CPUState *cpu, Error **errp)
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
     if (!tcg_target_initialized) {
+        /* Mandatory non-NULL handlers */
+        g_assert(cc->tcg_ops->initialize);
+#ifndef CONFIG_USER_ONLY
+        g_assert(cc->tcg_ops->has_work);
+#endif /* !CONFIG_USER_ONLY */
+
         cc->tcg_ops->initialize();
         tcg_target_initialized = true;
     }
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 3c75ed2cccc..6cd32f04cb9 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -78,10 +78,7 @@ static bool tcg_cpu_has_work(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->tcg_ops->has_work) {
-        return cc->tcg_ops->has_work(cpu);
-    }
-    return false;
+    return cc->tcg_ops->has_work(cpu);
 }
 
 /* mask must never be zero, except for A20 change call */
-- 
2.31.1



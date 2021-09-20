Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3A24128AC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:11:33 +0200 (CEST)
Received: from localhost ([::1]:39260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRVc-0002fw-G7
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR5v-0002lJ-3I
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:44:59 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR5s-0001MS-3n
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:44:57 -0400
Received: by mail-wr1-x432.google.com with SMTP id t18so33640340wrb.0
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ivfGIZqZ1ZvPdpMYGTfuFnTfxbUSRyPHF1Kx1zahwoM=;
 b=OhCXDllVisL8GEsZVg/cYtStDQhvJvLUwRW8key5hWsaTk4cziSUBJzI06Bj4DKXBw
 m2fGoi3T/1d1RK982fqbM0ItMm2m+KyTIrwZuOKGSI/os1aR2wX2hV53lTVekmqNym9k
 tBG1tGyBOnodIohE9pKmMuYJRJdvwsRwFJ+/KHRefnvkN7M0cEuBaK3wi/RLvjUV5cPO
 pM3ZfTK7A7TLpfE2wTRDBfqrY6cBiVbc0ziNXXM+9AhFMe7GV6bRXWjqnqzEDK2miP/9
 plbBjV9psXLfzt7k+WDr6RbEZtWRe9+z+HU/Uu7bWVreL2oJIg825avUB8Vfk4pb6ej2
 8OJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ivfGIZqZ1ZvPdpMYGTfuFnTfxbUSRyPHF1Kx1zahwoM=;
 b=yFRS9xGDgkPMAJ2Fu2aZn81ll0gJIoryOQ8j+ypzYpE7xsFW6uYYAH2InAY+Ne9dok
 lc8betnWw3du9plDt8BSm1CkixMAMDww1eAuB91Ygak7xiunah946PXFnBZ5VIeyWEDR
 8EOdMnJAue/e6bTSUc8Yk+G8jFtkXPZiMJ5lqW+6aUEcxlgcvUc8m6AL1ZKZHAC7n0/w
 CM2AB4reOfIo15/MdkYz91GmWQ16Rs9kCjva9f4FjG/+eCsuVaZLKxf+uE8EQadSuiA6
 ITCVgGL/HuTgiHCqJeU0qmxZnShPrDuSs6R4DccQ6BBOkC9/qKcldo0RuJlp0eeGbj5j
 zXyQ==
X-Gm-Message-State: AOAM5339lUq+3FbikJuciUnDT5VFj+T9Aq9i9iCoBXhMLmV7IZV5CurU
 hCNZgn5vWnYe1UnJ+VlIr/FRo9nRmn0=
X-Google-Smtp-Source: ABdhPJyPTzthXAmn2GXZhy03qHrJ3/gKBZwQz8KH3OfAB19h9df2YhVDnlo0fSDzknnwCbguAv/60A==
X-Received: by 2002:a05:600c:3790:: with SMTP id
 o16mr1087348wmr.157.1632174294094; 
 Mon, 20 Sep 2021 14:44:54 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 f19sm702529wmf.11.2021.09.20.14.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 14:44:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/31] target/arm: Implement arm_v7m_cpu_has_work()
Date: Mon, 20 Sep 2021 23:44:17 +0200
Message-Id: <20210920214447.2998623-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920214447.2998623-1-f4bug@amsat.org>
References: <20210920214447.2998623-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Michael Davidsaver <mdavidsaver@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement SysemuCPUOps::has_work() handler for the ARM v7M CPU.

See the comments added in commit 7ecdaa4a963 ("armv7m: Fix
condition check for taking exceptions") which eventually
forgot to implement this has_work() handler:

  * ARMv7-M interrupt masking works differently than -A or -R.
  * There is no FIQ/IRQ distinction.

The NVIC signal any pending interrupt by raising ARM_CPU_IRQ
(see commit 56b7c66f498: "armv7m: QOMify the armv7m container")
which ends setting the CPU_INTERRUPT_HARD bit in interrupt_request.

Thus arm_v7m_cpu_has_work() implementation is thus quite trivial,
we simply need to check for this bit.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Michael Davidsaver <mdavidsaver@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/cpu_tcg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 0d5adccf1a7..da348938407 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -23,6 +23,11 @@
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
 
 #if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
+static bool arm_v7m_cpu_has_work(CPUState *cs)
+{
+    return cs->interrupt_request & CPU_INTERRUPT_HARD;
+}
+
 static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     CPUClass *cc = CPU_GET_CLASS(cs);
@@ -920,6 +925,7 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
 
     acc->info = data;
 #ifdef CONFIG_TCG
+    cc->has_work = arm_v7m_cpu_has_work;
     cc->tcg_ops = &arm_v7m_tcg_ops;
 #endif /* CONFIG_TCG */
 
-- 
2.31.1



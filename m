Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D5362F0EC
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:20:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxWy-0001HY-8w; Fri, 18 Nov 2022 04:19:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxWr-00019T-EV
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:19:21 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxWp-0005vw-On
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:19:21 -0500
Received: by mail-pg1-x533.google.com with SMTP id v3so4508298pgh.4
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 01:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GkJjrCQQJwPeH4gDLby1aBlAc88p7sFhkRIPIWXnOA8=;
 b=al5f4wZmJVQkrZ9d7PV6xuoJ2zITXsE+V+X/SNZoWioCN0zsnOt0VgFO2xjbmgY5h1
 yspRKTqbMuKAKnBPyiyl2keDGMExR5K8sNevTzb5i7Ay25ROCA8I+rTaDYJV0X6setFP
 558rFG9Gu+eR7yb8FWevVwlNYkaItprRpv3WEQp96z7b8piC9IBliZvtnkr8oh+lK7tY
 9J5P4TraGMY8KzPH5HfbuThnzwh0sjc1WSX57U+db469/G6NK9bKhCt6qRVtSrwIYkBQ
 4gSRTcRXvgdAcTRPw81OqRb3fni6aRSD3pi+iLJi4EXtpO/g0epelk3wwIX5qJS9KCz1
 JAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GkJjrCQQJwPeH4gDLby1aBlAc88p7sFhkRIPIWXnOA8=;
 b=Q8xwK4Tqh8+nWnYDWtna/8flR/q33NHIvBzXiWjjALApZL2xCrQ04Z2nWH88apa24j
 q1jprfVIwMUEuc99UkX/6VhX0A9eAM7vND8Eb+wqcReIEnVgUa1SpAfrAr/hsKvA/8JK
 Y9lZdrMYrtOdjPHwFkxK56iMV7xnnplhSMsqLS7+/iPlkj6ZagNE886WYF4OH2z90Sbp
 pMlXrTvZgt08/eoX63A3PcgXpOS2e2+r/NAAVBLvIZ+Rk6je59WWrMcWW5TwCHSj1VSN
 Y6/FmI/Y0GgvAJ+bCgxeLPZVrhhNq3KAkBWyXtjrrth/86zH5Ros0NA2J3u+j327LzI6
 PAew==
X-Gm-Message-State: ANoB5pkPnTC0qiOfRVpe7TBz1FPqBHmG2QDK7/x4qNLbc6y0qBBD6pw9
 3FWfg8pRDeWs7UZml7jnI2G0VBsGYN/Uog==
X-Google-Smtp-Source: AA0mqf7w9+dc5WuqZVmragBi1DDHommy8HoaDZiICY2rMAyoCugOStRh/pPLEzmOLAqWg2G03rFMnQ==
X-Received: by 2002:a63:7143:0:b0:46f:918e:7338 with SMTP id
 b3-20020a637143000000b0046f918e7338mr5937213pgn.8.1668763144801; 
 Fri, 18 Nov 2022 01:19:04 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 a27-20020aa794bb000000b0056e8eb09d57sm2672305pfl.63.2022.11.18.01.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 01:19:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH for-8.0 2/7] hw/mips: Use QEMU_IOTHREAD_LOCK_GUARD in
 cpu_mips_irq_request
Date: Fri, 18 Nov 2022 01:18:53 -0800
Message-Id: <20221118091858.242569-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118091858.242569-1-richard.henderson@linaro.org>
References: <20221118091858.242569-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/mips/mips_int.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/hw/mips/mips_int.c b/hw/mips/mips_int.c
index 2db5e10fe0..73437cd90f 100644
--- a/hw/mips/mips_int.c
+++ b/hw/mips/mips_int.c
@@ -32,17 +32,12 @@ static void cpu_mips_irq_request(void *opaque, int irq, int level)
     MIPSCPU *cpu = opaque;
     CPUMIPSState *env = &cpu->env;
     CPUState *cs = CPU(cpu);
-    bool locked = false;
 
     if (irq < 0 || irq > 7) {
         return;
     }
 
-    /* Make sure locking works even if BQL is already held by the caller */
-    if (!qemu_mutex_iothread_locked()) {
-        locked = true;
-        qemu_mutex_lock_iothread();
-    }
+    QEMU_IOTHREAD_LOCK_GUARD();
 
     if (level) {
         env->CP0_Cause |= 1 << (irq + CP0Ca_IP);
@@ -59,10 +54,6 @@ static void cpu_mips_irq_request(void *opaque, int irq, int level)
     } else {
         cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
     }
-
-    if (locked) {
-        qemu_mutex_unlock_iothread();
-    }
 }
 
 void cpu_mips_irq_init_cpu(MIPSCPU *cpu)
-- 
2.34.1



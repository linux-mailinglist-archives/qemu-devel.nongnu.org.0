Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC60E655BF8
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 01:14:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9EOV-0002Id-NG; Sat, 24 Dec 2022 18:57:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOT-0002Hw-Tw
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:33 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOR-0006Ge-L5
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:33 -0500
Received: by mail-pl1-x62d.google.com with SMTP id 19so1057972plo.12
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 15:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=plDIoOrc/jMHxHch1a/joN0jkJOzT26vJ1hDyyzmh0Q=;
 b=SVJR9OLWTPY0kvUpYdGN8umjNIccKQiPrX9sSCj8WfQ+pkdML+NAgj2fvTzqjqXw6e
 NyM8/quHvzzf1YgGFmdlMtVsFtxrbD+2cUnq4t0KgSR0iZ6x76Yf8IsIveG1W9hCwgv+
 VZVuaBGgl/ROXlEKXgxKxSdugHb8EViOuUZ4lpaEgKAs5sdbVrqizJibvEPVPHgXt80w
 wydAfL7GpZdx8GfWMjMRjEpEa8d2jNPYD2raTuPzJH4Kze2XWpyWgB/FwkaQQL1l7oRR
 VmgjIeCnUy9+FjNw7ba2iHKQjHiujPb8x/O+dFVijanoa4vAiASNwxEScFz3SzINEQiq
 GkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=plDIoOrc/jMHxHch1a/joN0jkJOzT26vJ1hDyyzmh0Q=;
 b=leVu2j3ZDf0Me8Q+oqwWN1UELOouLonvJDmu5yLfu1KqZHmSmvGuGskbJe6F/fwqyY
 Ko6besTHXfJh+kfngKNrDWyDfLLo/3omePe9ivw4h75SHPE3D3Ly2ayeoq0+AggL/N2b
 AU0donsiALk46x8TQkR8lIRittwpE8AseaZxn+i8H+GhmQ1ZXuGcD05AY7X8GQWACHpq
 3iF1lmBi+gu8s0jEN8LtIqI8mA17yCssl3OPqNRBl0T/H6rhWR/UMg8LlJXxhZHiY/hC
 XKjDN5m6XmJ9bwFdEdfxxe6Glw5Lpj5PyEgQ9HV2udkC6l9kRWaNoL7JEajzcvME6tin
 S/ug==
X-Gm-Message-State: AFqh2koCZx0bye6Pek/rzDcr0I9S2ryc7KdpVajYHr03qeAD0rIx6Hah
 zcjv+z5ojBBKGRBMFVfL3ucuNt1yB3o44HJ5
X-Google-Smtp-Source: AMrXdXv1DqNBOBA6RBi5Yh57AcnO1bqtAG6nDhIPzL0jte13V3ibj4qEPN6nxzY2+ZgQm9nLCIqpZQ==
X-Received: by 2002:a17:902:e3d5:b0:192:6a20:3cb1 with SMTP id
 r21-20020a170902e3d500b001926a203cb1mr2945222ple.51.1671926250677; 
 Sat, 24 Dec 2022 15:57:30 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 cp12-20020a170902e78c00b00187022627d7sm4599716plb.36.2022.12.24.15.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 15:57:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, philmd@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v5 08/43] target/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in
 cpu_interrupt_exittb
Date: Sat, 24 Dec 2022 15:56:45 -0800
Message-Id: <20221224235720.842093-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224235720.842093-1-richard.henderson@linaro.org>
References: <20221224235720.842093-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

In addition, use tcg_enabled instead of !kvm_enabled.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/helper_regs.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index c0aee5855b..779e7db513 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -22,6 +22,7 @@
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
 #include "sysemu/kvm.h"
+#include "sysemu/tcg.h"
 #include "helper_regs.h"
 #include "power8-pmu.h"
 #include "cpu-models.h"
@@ -203,17 +204,10 @@ void cpu_interrupt_exittb(CPUState *cs)
 {
     /*
      * We don't need to worry about translation blocks
-     * when running with KVM.
+     * unless running with TCG.
      */
-    if (kvm_enabled()) {
-        return;
-    }
-
-    if (!qemu_mutex_iothread_locked()) {
-        qemu_mutex_lock_iothread();
-        cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
-        qemu_mutex_unlock_iothread();
-    } else {
+    if (tcg_enabled()) {
+        QEMU_IOTHREAD_LOCK_GUARD();
         cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
     }
 }
-- 
2.34.1



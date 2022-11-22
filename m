Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6372B6348E2
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 22:00:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxaL5-0007Nx-Hu; Tue, 22 Nov 2022 15:57:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxaL1-0007Ld-IT
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 15:57:51 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxaKw-0003UR-W6
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 15:57:51 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso47680pjt.0
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 12:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=07L+bW1+qVSK6zT9bLcsy4Js7Ua88w35lmwPvUxZKNk=;
 b=Mho/Os4WLtY2b00ZEgDrv8i7nd047aSibqXu8XG7+WgQ8SqDVmeL1Mt8EC3KuK40FB
 hWbEHc8RylPdFIxJdNiz+TEEAhGXmsYBZsR3Ku088YrUZclqpZYw62gA0z8ZN+ViNX8T
 3AbwttU6fVVkZx63rZE2PqoWSMG34USvVOuyLaZr+dK7KTahJehdlIubCiMVXRcUlDrP
 SHxZEwgAhNSwdZOKnmiXmnEggiH0quAm4JY0tcv/S3r7QljD/jKIIpF8HxB8Ma6vFiTy
 7WXRhMjiCbm9ZBoD+N5Vrdk89BJVb9GymfgZpPxyE61TJKwZerVXEIbhW7gV4vA2dBM7
 wTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=07L+bW1+qVSK6zT9bLcsy4Js7Ua88w35lmwPvUxZKNk=;
 b=1+WdlCuqvGuwQ33DurC/OcGF6gi7QIU+GTH60/UPx5BXkUvZe3AI3OKUJMfGUYXXO1
 xqfepPIeU0AUb0lw0mGPWawdA/Yp0Pu9oxRYRpUeNIRYATmnwsWHRyoS6b+qCMXGPQgk
 9R7y+0O+qzqvA71ibi/UxZ1mY/BwGBvWDugK6dJlov+kaubc2HdNo7TwSiIDB5Opk703
 iMZPVlCluAZqskh6hJOcTjeaXfcpK1A14ctKGB+YfcLtXEf9hw5yFPyTI3B4pYzvlITx
 L8MH4Rf9XXVgHFrbGF8fVTuu18aIYn+sGrtRc0EqmAknU1J519ok33f4woELfaolzcXS
 7CCw==
X-Gm-Message-State: ANoB5pk2YCpqgts9S4JC4uChbX00ZtEMG9djtljHgSOYnj2i/P8yWvni
 X20SexOl5u1rzP+H6+WZPlSfYwdq8QnvRA==
X-Google-Smtp-Source: AA0mqf52uLxFBH1RWuHoMrSaDoaNEkKD/RLpm7pqQfDF8yGqgdvwK6yju2wMU9iBJMn9Bv/DSqX/kQ==
X-Received: by 2002:a17:902:6505:b0:189:30f:64d8 with SMTP id
 b5-20020a170902650500b00189030f64d8mr8574190plk.39.1669150665410; 
 Tue, 22 Nov 2022 12:57:45 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90f5:6f8b:e78a:4a0])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a170903209300b00186fa988a13sm12383807plc.166.2022.11.22.12.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 12:57:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, philmd@linaro.org, alex.bennee@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 4/7] target/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in
 cpu_interrupt_exittb
Date: Tue, 22 Nov 2022 12:57:36 -0800
Message-Id: <20221122205739.603510-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221122205739.603510-1-richard.henderson@linaro.org>
References: <20221122205739.603510-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
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



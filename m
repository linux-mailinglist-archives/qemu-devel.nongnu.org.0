Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD973A8452
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 17:48:01 +0200 (CEST)
Received: from localhost ([::1]:45630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBIF-0000Ql-TO
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 11:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBEo-0005nL-Gy
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:26 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBEa-0000ua-G4
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:26 -0400
Received: by mail-wr1-x42a.google.com with SMTP id c5so18842530wrq.9
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 08:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+s0Ios+D5dkrEfPv6sCqiAVhIA46kg1nWpoPxlRpszc=;
 b=hRnf08qKBWZYucbD1lq+pjk8QlyhDXeYi02ErSkhdhu8lcnnLL4EC3Fo/+JZzz3go2
 3G/o76s8i+j9i8clV5qjiZ8rd0GLpX4FTyqBt1YUfzad8uVpZwLDsNuJW52qYw4rIona
 ze2rGvrwPmKB/vHzQrXghLroEvY9WbKk9d5mHalOcA+bKEdfslu0DPp3vAJ08Z5FFMIv
 AWNX2EmMaX8wAtyMmuUo/E8lM2++S8cDiDR/dznIKy0TiGPG8VxkHu5GoY7srV+TlBJx
 uFiNfr1aYmm9bUKIhI+oPdwK58M0jg56Nt0hYaQ+IaethxkRR/nJj3onnNl0U7nLzPwV
 RJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+s0Ios+D5dkrEfPv6sCqiAVhIA46kg1nWpoPxlRpszc=;
 b=EkzzN8QxjWG4kiJrMAWNnx91muG7mB7rQum57z1bwcfsY4SnZO5lhhO/2y9MH8TIvy
 islvLvqwgdvcZtEJqeTxDHdPb/XVfisBZgLnqfZO4DRo4TjKjDfWyljBwBi+1BCc9oYW
 iF7nuIq2gfXpzOgBRHJDG8PI/rnWqtjzNr9d7bPpErJyWMvku66syImJ0fEzVCLbWob6
 RMuI0kJbUDOLlB/N2b57hxAfPtLwZ0aHqdqEgn+7UyOppsakVy/hjZHf/Kvx7SKZWd8X
 fyX3GoFmcSgnmYvM+ZaqO+j5k1ClXm7VxcnWOU61IKJ3CS0b9jBgBbKsYLe17JQBcPC0
 SV9Q==
X-Gm-Message-State: AOAM530KrJoAkjsignn5cUAK13oQvMrXFzZgpJqRHkeA5rm8s7xe16/C
 Zxvu3EWlxyfSHnTuSXIIxiX7gHFardU9Jg==
X-Google-Smtp-Source: ABdhPJz3NpYZCA0aA8fH8bWf7ZCtDpauv1qp9hbbHw+EUEZmFNu6BtKLHz+21LKpWFAO3gq4lRnw2Q==
X-Received: by 2002:a5d:4f05:: with SMTP id c5mr25863073wru.341.1623771849593; 
 Tue, 15 Jun 2021 08:44:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d15sm18985662wri.58.2021.06.15.08.44.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 08:44:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/28] hw/intc/arm_gicv3_cpuif: Tolerate spurious EOIR writes
Date: Tue, 15 Jun 2021 16:43:38 +0100
Message-Id: <20210615154405.21399-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615154405.21399-1-peter.maydell@linaro.org>
References: <20210615154405.21399-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Commit 382c7160d1cd ("hw/intc/arm_gicv3_cpuif: Fix EOIR write access
check logic") added an assert_not_reached() if the guest writes the EOIR
register while no interrupt is active.

It turns out some software does this: EDK2, in
GicV3ExitBootServicesEvent(), unconditionally write EOIR for all
interrupts that it manages. This now causes QEMU to abort when running
UEFI on a VM with GICv3. Although it is UNPREDICTABLE behavior and EDK2
does need fixing, the punishment seems a little harsh, especially since
icc_eoir_write() already tolerates writes of nonexistent interrupt
numbers. Display a guest error and tolerate spurious EOIR writes.

Fixes: 382c7160d1cd ("hw/intc/arm_gicv3_cpuif: Fix EOIR write access check logic")
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20210604130352.1887560-1-jean-philippe@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 81f94c7f4ad..3e0641aff97 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -14,6 +14,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/bitops.h"
+#include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "trace.h"
 #include "gicv3_internal.h"
@@ -1357,7 +1358,9 @@ static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
         }
         break;
     default:
-        g_assert_not_reached();
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: IRQ %d isn't active\n", __func__, irq);
+        return;
     }
 
     icc_drop_prio(cs, grp);
-- 
2.20.1



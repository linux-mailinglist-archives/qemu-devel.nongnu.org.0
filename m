Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB46339B983
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 15:08:22 +0200 (CEST)
Received: from localhost ([::1]:47192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp9Yj-0000GC-TN
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 09:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1lp9Xn-00078u-Mb
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 09:07:23 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:47014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1lp9Xk-0004sg-GZ
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 09:07:23 -0400
Received: by mail-ej1-x62e.google.com with SMTP id b9so14347125ejc.13
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 06:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G0RLPIkH7hpCKHh0hBYO5x2ioarQya+jGRF5wm/ztP0=;
 b=Z0Sg1muU83prq88JKS2honOVtVv0h1sc3Z7Xe1Hx2WsfB4EzgADqC0QgOOej5bMHoV
 jstXy2U1WoxoAEn5jAPL6fHyAaQp+n+xFS/kcgcFXFGnlgfuEDT/viWEG/xzScKWvo75
 E0K4pXDOAS+/4diL8hCu321IECn7UN1pEtPBwpgWLpYc+fEBCCrVimj8QCZkE8lLrenk
 dnmjZzKKlNuRcOTEc9UWPxA0WrIAeJ4wXQAQoqrf+uIMiDwhrhL+SIapQ0ioogRHCy/J
 vgAma/1fs9JaL+och3cc7fqg7pyAe4youb8u+w5vZeTntAOWdPrrOEhSjCM/xyQnfxxG
 fL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G0RLPIkH7hpCKHh0hBYO5x2ioarQya+jGRF5wm/ztP0=;
 b=AirCOLAaAbsnsAmqoAhy7F8FYy2WHTs+oBxaoZLrNpfV85I4E44BQ5au9a5oWza4I9
 voDf35X6GF9oCZmlaGv/WIL8gANhg+XZyBrJfV0UpUndGVet/cslu5qzJgUSKoak9UK7
 kUKKhP66/WvyR7Sr8brcYV3Kv+i2lodyq31Pk2fblBPN8ckvd69fob+Qi9w3ne74IOaf
 tv+qE3rK1SFqv7P8O1/QOawWjhFDaDW3sDP3lTfCCFKOEYaAfosK3RvVMGYEnFFUQHSS
 QTgULeneD5/WRhVuIk/QVhtm23liw18y9pfcLqv1gcYm9Iw5rLD1n1VoFrEbEvUevO9A
 MnzA==
X-Gm-Message-State: AOAM533HCOlpK5PuP4VSV0bEcEdQUVsfdBZkK9CWxPUS5MJX5z1QmTPF
 yZv3LZXIQFjXD4cIffBBeGEpcQ==
X-Google-Smtp-Source: ABdhPJzNYB5i8o/cc1z1HNgBGdf8vxdnd+dnpgHEblZ7pSA6LrwHU1lSkdLHFd1tC5Ih9mqMiO6wvQ==
X-Received: by 2002:a17:906:509:: with SMTP id
 j9mr1601327eja.149.1622812037488; 
 Fri, 04 Jun 2021 06:07:17 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-111-173.adslplus.ch.
 [84.226.111.173])
 by smtp.gmail.com with ESMTPSA id p9sm3189265edh.61.2021.06.04.06.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 06:07:17 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Subject: [PATCH v2] hw/intc/arm_gicv3_cpuif: Tolerate spurious EOIR writes
Date: Fri,  4 Jun 2021 15:03:53 +0200
Message-Id: <20210604130352.1887560-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=jean-philippe@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, shashi.mallela@linaro.org,
 qemu-arm@nongnu.org, philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
v2: Added qemu_log_mask() (so I didn't keep the Reviewed-by tag)
v1: https://lore.kernel.org/qemu-devel/20210603110012.1182530-1-jean-philippe@linaro.org/

---
 hw/intc/arm_gicv3_cpuif.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 81f94c7f4a..3e0641aff9 100644
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
2.31.1



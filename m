Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07821399F6F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 13:02:30 +0200 (CEST)
Received: from localhost ([::1]:60504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lol7L-00012B-JC
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 07:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1lol6K-00008d-9c
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 07:01:24 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:34623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1lol6I-0003iU-0J
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 07:01:24 -0400
Received: by mail-ej1-x632.google.com with SMTP id g8so8635584ejx.1
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 04:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gycSz+LrCPwHp/tuXa4oFID4bRu6diM6F7pjskolva0=;
 b=pmtFCOvDWPchwUemN3tNn5CCQeKuOlHlz6ssCPJH86BozMTuyrfnnuWL4UDjHjvPUD
 cgX2LCav9ZP+tSgFvfzaIwRZh9vxQ34OFrOeHxQf7mi2j+Cf4D+5Gqvd8SpmAEdiRY1l
 fm7IirAEZs+kutVx5twHEzGpvmzxVI2ppVVWgiEj1IgJ0Dh408ZtkojHRoOsOwtzfg5c
 0S3lNBUjR7YZlmBB0gW/atY/hkhwgyVc4/wBnds2Wy7g/iumXbH0YMPhB63WpJ+QLOiN
 o652KO5brNDVwFmtFlDH10KXgSVycd5VPIynMJHQNy5Xl+soz8LfIbhqFEwUcanHTm67
 uvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gycSz+LrCPwHp/tuXa4oFID4bRu6diM6F7pjskolva0=;
 b=O1L7S0PZ/sEpvPbJ3AGF2UscAmWH4Nz6DxUs2nFPkiRzgZw+CFSqwuICxnux8lcUv5
 67Qd8P7DttWB3EevulSNxRmjMZWM2cQ6uTMQbx9IBBmRGamlWin3ZA68mr0MsOV0d9zg
 K9zDydEHRCxaaJgJTGOgOF6G0AobjTE+P/QzAh5oSOt36IRV7DB0D/6vmh/ps9Ow91I0
 PvxMJBOqzaTv8C4yH7cYETutxpDSwnNL2UmgINrTjYsSKRLw7WnXmnShgsudfzj8a2/a
 FDBt5yXWYJcyiTAdfDIGO1t6ShE7dfVDaHLjjIgdLEkcOZRYEEPgtjGKOyOVrAF55zyL
 C4uQ==
X-Gm-Message-State: AOAM532GTCaXeq8nKMz7IpSN9kZNk4HHi/jfw5nxykxO3aZjyWiu7ucF
 eaIl4Gd2WXqLsR8L8k9TTIFOFg==
X-Google-Smtp-Source: ABdhPJwRg5xnj6dbHpvxLTw8AB+fj91OCpA2VAjmhDx7GHI/wao0vQGQe11hQ60DX1iWSTo+sVdtwg==
X-Received: by 2002:a17:907:c1c:: with SMTP id
 ga28mr39855552ejc.320.1622718079034; 
 Thu, 03 Jun 2021 04:01:19 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-111-173.adslplus.ch.
 [84.226.111.173])
 by smtp.gmail.com with ESMTPSA id c7sm1388145ejs.26.2021.06.03.04.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 04:01:18 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Subject: [PATCH] hw/intc/arm_gicv3_cpuif: Tolerate spurious EOIR writes
Date: Thu,  3 Jun 2021 13:00:13 +0200
Message-Id: <20210603110012.1182530-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=jean-philippe@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 382c7160d1cd ("hw/intc/arm_gicv3_cpuif: Fix EOIR write access
check logic") added an assert_not_reached() if the guest writes the EOIR
register while no interrupt is active.

It turns out some software does this: EDK2, in GicV3ExitBootServicesEvent(),
unconditionally write EOIR for all interrupts that it manages. This now
causes QEMU to abort when running UEFI on a VM with GICv3. Although it
is UNPREDICTABLE behavior and EDK2 does need fixing, the punishment
seems a little harsh, especially since icc_eoir_write() already
tolerates writes of nonexistent interrupt numbers. Simply ignore
spurious EOIR writes.

Fixes: 382c7160d1cd ("hw/intc/arm_gicv3_cpuif: Fix EOIR write access check logic")
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 81f94c7f4a..1d0964c9bf 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -1357,7 +1357,8 @@ static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
         }
         break;
     default:
-        g_assert_not_reached();
+        /* No interrupt was active, this is UNPREDICTABLE. Ignore it. */
+        return;
     }
 
     icc_drop_prio(cs, grp);
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 077A560D1F4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:51:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMzc-00074C-4Y; Tue, 25 Oct 2022 12:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMz1-0006eW-Ae
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:55 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyg-0001bE-OT
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:52 -0400
Received: by mail-wr1-x42a.google.com with SMTP id o4so13850778wrq.6
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3kQR/k4FXpFM00JdMuTW5fGm+HZ5nsSbJYa2cV1JqRI=;
 b=X3RfrRGeIkWpfflrZ0sIMkKcB4wDVLQxAr/iThYJrdWmo35yY66HRL3ap4NpsBHbdP
 /ci0ikT9tuDf3ODmGZDPpKekrTs4+JJVk1hbJxFyXpM4+ROCqHRYTMTvp7vSHMEBGs6Y
 blj6pCjBkVjA/X+L12nJvB+jAeKyaWUcgIoC6Tf5ho56ZGyPnI1co8iP+NGCcmMWrxKc
 NyVu1J8J+NY1CMF+9Ce++DLFlhbVKqBZru8N5jYa3sDxTYNJlP6nXhAvNuGD4NauX4LB
 VhMxMaluW0pArKIVBLAGjcp7VxynkYMiFZ66xSqGCR+SkTlfU/4E8hd6fwnldHjS6tnk
 KEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3kQR/k4FXpFM00JdMuTW5fGm+HZ5nsSbJYa2cV1JqRI=;
 b=Nf0VzHy7GNjlwHyAdCJ71MjpdLqPOu/Kty7clsx+aAJ+KmCyWc5KHIKR4aRWRHHNcp
 mm6JA8VxqY8Gvb5Hm9lquW6DzpjWOqH9nehW065SpyQzyXdEodMD3dlHGJooyHYoKIAq
 VtnJLEDoiEzo27gl/UDHokb0EE6WXLgrDgEXBSQwTeEx2K/6cIp3Afkkkx/gObFXinaD
 hz+7B0yCuCiunjCoJ1nBgHLfcVvH9J6nXl7JsaociPu45V7IP9dTeZcpopqV2xyNXS4+
 miJbOElioRDatMiqGiOoYK0E0W4hSiu+ril5a4HOtXWQ3nuXyS226rRpO5CCOLP0cOQl
 Q1jw==
X-Gm-Message-State: ACrzQf3fnWDAHjXR7lmThzb/D6Es5yJ3wpKtSjYXO2gPN7XtVLResqW9
 2tM1JN4JG2SV7a8h88KOMMa+0rI4Po99Aw==
X-Google-Smtp-Source: AMsMyM4hGf3NF9d6G5BB4CR1UpyfsCDVHotZIyYP0owrkaYqHuGGFQW09MU3qx859kfWMqgKcpBt8Q==
X-Received: by 2002:a05:6000:156e:b0:22e:6bf3:79d0 with SMTP id
 14-20020a056000156e00b0022e6bf379d0mr26621512wrz.456.1666716026739; 
 Tue, 25 Oct 2022 09:40:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c220c00b003cd9c26a0basm2971084wml.40.2022.10.25.09.40.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:40:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/30] mips/boston: re-randomize rng-seed on reboot
Date: Tue, 25 Oct 2022 17:39:50 +0100
Message-Id: <20221025163952.4131046-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025163952.4131046-1-peter.maydell@linaro.org>
References: <20221025163952.4131046-1-peter.maydell@linaro.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

When the system reboots, the rng-seed that the FDT has should be
re-randomized, so that the new boot gets a new seed. Since the FDT is in
the ROM region at this point, we add a hook right after the ROM has been
added, so that we have a pointer to that copy of the FDT.

Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Message-id: 20221025004327.568476-9-Jason@zx2c4.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/mips/boston.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index d2ab9da1a01..cab63f43bf4 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -41,6 +41,7 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/qtest.h"
 #include "sysemu/runstate.h"
+#include "sysemu/reset.h"
 
 #include <libfdt.h>
 #include "qom/object.h"
@@ -810,6 +811,8 @@ static void boston_mach_init(MachineState *machine)
             /* Calculate real fdt size after filter */
             dt_size = fdt_totalsize(dtb_load_data);
             rom_add_blob_fixed("dtb", dtb_load_data, dt_size, dtb_paddr);
+            qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
+                                rom_ptr(dtb_paddr, dt_size));
         } else {
             /* Try to load file as FIT */
             fit_err = load_fit(&boston_fit_loader, machine->kernel_filename, s);
-- 
2.25.1



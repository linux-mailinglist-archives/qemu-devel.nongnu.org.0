Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4261660D1DF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:49:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMzd-0007Ej-2J; Tue, 25 Oct 2022 12:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMz1-0006eR-Af
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:55 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyf-0001mm-MC
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:49 -0400
Received: by mail-wr1-x435.google.com with SMTP id h9so10988674wrt.0
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EfFP1EGP8gYjL/D4+J6htl9+GvO5ycQd6kECe/O49pA=;
 b=jFwDElESAdGA7Auu2l9zgMmefRi6z/t020oKPU6Vsbvd/ZkMHFiMCZmacD6unIcpHo
 ENbU9265iMdlQZ3JkCfz6y1QR24z+KmKiTCObsUlooiRuyipIVRBzrwBMKwYIxUzqt17
 yYyRbKpUUUw/tpfgOTAJk+IKqgIiHX67gBdHJHZMFHluN/tfHR2gZpR7LWZdVPMKjsev
 qwi5yy4h3XaXGUh1duxLN9HM5UgTrRevYIEpGeYrM2CMzOyZ0+D4LHe5qJrKQ+vMevDX
 5m4DcFZ73daNSFxn7sUDK8TeWwI5c3P18uYlDaeJ95qJHPip3d7SyN/4IH+pcC6GolNb
 /gLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EfFP1EGP8gYjL/D4+J6htl9+GvO5ycQd6kECe/O49pA=;
 b=Zju8tQP/D9Mrfgchi2B7lxEjpvdDDyoy9dCmNaXBcHoYZ5NzcAxy4jZ08VREmsJ7kl
 bl06+bsZxYUMfkWCr6RWTihClGK4483VvJIcJ4f78YIslyRhkZ2EpxTxy/fZrW6YsgPg
 1ksjKmLuWzmxPg1AEJe7UQrJpb/PTWpDHHkgPxQtJ2ulqVzTHUN7uhes7EHd3Z6T0YvZ
 AxoyaHa3YDrFFB0MdTSk0H9ammAwc/rdraNDHUmEJAhbYvO+8xT0amvyixKkKgz5lj+t
 MLpv0sIhptc79662ACk5t/uakqQVf75P5F6JHXx0qCY6O2DlF2WzYD7+uYgQEvg+anZL
 2gFA==
X-Gm-Message-State: ACrzQf1yFgMdD7qUrm1jiLwhiw36wWeZMxV0H9Zggo3qFa/HzUVHNwNI
 e3ICEVFwxsmyNU0kRNBX26U4NfLRLhwfFw==
X-Google-Smtp-Source: AMsMyM7nEnO+eEc3ORjtgjkOjdjCDg4GeT63gTCqwGIbREn5yuBgvrFXxxqxf4xXu7/yqW2pr2aMRg==
X-Received: by 2002:a05:6000:1a8e:b0:230:848c:416d with SMTP id
 f14-20020a0560001a8e00b00230848c416dmr26631550wry.264.1666716029045; 
 Tue, 25 Oct 2022 09:40:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c220c00b003cd9c26a0basm2971084wml.40.2022.10.25.09.40.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:40:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/30] rx: re-randomize rng-seed on reboot
Date: Tue, 25 Oct 2022 17:39:52 +0100
Message-Id: <20221025163952.4131046-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025163952.4131046-1-peter.maydell@linaro.org>
References: <20221025163952.4131046-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Message-id: 20221025004327.568476-12-Jason@zx2c4.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/rx/rx-gdbsim.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
index 8ffe1b8035c..47c17026c73 100644
--- a/hw/rx/rx-gdbsim.c
+++ b/hw/rx/rx-gdbsim.c
@@ -25,6 +25,7 @@
 #include "hw/rx/rx62n.h"
 #include "sysemu/qtest.h"
 #include "sysemu/device_tree.h"
+#include "sysemu/reset.h"
 #include "hw/boards.h"
 #include "qom/object.h"
 
@@ -148,6 +149,8 @@ static void rx_gdbsim_init(MachineState *machine)
             dtb_offset = ROUND_DOWN(machine->ram_size - dtb_size, 16);
             rom_add_blob_fixed("dtb", dtb, dtb_size,
                                SDRAM_BASE + dtb_offset);
+            qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
+                                rom_ptr(SDRAM_BASE + dtb_offset, dtb_size));
             /* Set dtb address to R1 */
             RX_CPU(first_cpu)->env.regs[1] = SDRAM_BASE + dtb_offset;
         }
-- 
2.25.1



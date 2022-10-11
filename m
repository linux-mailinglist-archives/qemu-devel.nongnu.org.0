Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E655FBC90
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 22:58:50 +0200 (CEST)
Received: from localhost ([::1]:33432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiMKw-0004U6-2m
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 16:58:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=aME8=2M=zx2c4.com=Jason@kernel.org>)
 id 1oiM9s-0004hS-8a
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:47:24 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:34444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=aME8=2M=zx2c4.com=Jason@kernel.org>)
 id 1oiM9q-0001Rw-Jc
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:47:23 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 61DEFB816A4;
 Tue, 11 Oct 2022 20:47:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 620C6C433D6;
 Tue, 11 Oct 2022 20:47:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="AcEOrxgF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1665521238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1MhP1iEDR+8kGn7gSFVtgDwHMVdwP9J3Rm1XMWdjMgQ=;
 b=AcEOrxgFuWmMsSS6QQ64+Wo5iuRo7Q4v6d7aHD/7r8bJBlIfVzXESyPKezUz4pvfay9eXF
 qqJ4mTZu3NcOgs+dh+RKuBmpZiKwUtdcP4kW/l2jqq4XKWnWh3tbfLgwru8N26HIoTVKaW
 OWw7g2jngJwEBPHhztpXz0zBekS5Z40=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f1827fd9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 11 Oct 2022 20:47:17 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: peter.maydell@linaro.org,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 6/8] mips: re-randomize rng-seed on reboot
Date: Tue, 11 Oct 2022 14:46:43 -0600
Message-Id: <20221011204645.1160916-7-Jason@zx2c4.com>
In-Reply-To: <20221011204645.1160916-1-Jason@zx2c4.com>
References: <20221011204645.1160916-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=aME8=2M=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the system reboots, the rng-seed that the FDT has should be
re-randomized, so that the new boot gets a new seed. Since the FDT is in
the ROM region at this point, we add a hook right after the ROM has been
added, so that we have a pointer to that copy of the FDT.

Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/mips/boston.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index d2ab9da1a0..a560ce0324 100644
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
+            qemu_register_reset(qemu_fdt_randomize_seeds,
+                                rom_ptr(dtb_paddr, dt_size));
         } else {
             /* Try to load file as FIT */
             fit_err = load_fit(&boston_fit_loader, machine->kernel_filename, s);
-- 
2.37.3



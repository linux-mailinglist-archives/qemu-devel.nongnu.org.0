Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 712C65FE6ED
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 04:22:55 +0200 (CEST)
Received: from localhost ([::1]:38306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojALe-00047Q-HE
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 22:22:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=NTzD=2P=zx2c4.com=Jason@kernel.org>)
 id 1ojAGD-0000Wg-Nh
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 22:17:18 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:50516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=NTzD=2P=zx2c4.com=Jason@kernel.org>)
 id 1ojAGC-0001gb-8m
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 22:17:17 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CDC77B821B2;
 Fri, 14 Oct 2022 02:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F16B3C43470;
 Fri, 14 Oct 2022 02:17:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="egaHVLGF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1665713832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M+FszvdNnH4iamVR01u60XDQPAu0IkOPGBrVxYDRhSY=;
 b=egaHVLGFS/lRyCU+Iej7C87RbI4xJfDEA782UdvH20/P8b5yTFL8Jxz1kXcr6JGN1LfVXl
 itNzWv0SU3OKRlpJrG0DL6bcakLGomVsQiOI4gKwAMv+AfxSf6QuoSv4BJOlahj33gFNLc
 8U/P8oxx7f3yCdCCgIucbFbJyRVoTO8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6335524d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Fri, 14 Oct 2022 02:17:11 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: peter.maydell@linaro.org, pbonzini@redhat.com, qemu-devel@nongnu.org,
 richard.henderson@linaro.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Stafford Horne <shorne@gmail.com>
Subject: [PATCH v3 6/8] openrisc: re-randomize rng-seed on reboot
Date: Thu, 13 Oct 2022 20:16:51 -0600
Message-Id: <20221014021653.1461512-7-Jason@zx2c4.com>
In-Reply-To: <20221014021653.1461512-1-Jason@zx2c4.com>
References: <20221014021653.1461512-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=NTzD=2P=zx2c4.com=Jason@kernel.org;
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

Cc: Stafford Horne <shorne@gmail.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/openrisc/boot.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/openrisc/boot.c b/hw/openrisc/boot.c
index 128ccbcba2..007e80cd5a 100644
--- a/hw/openrisc/boot.c
+++ b/hw/openrisc/boot.c
@@ -14,6 +14,7 @@
 #include "hw/openrisc/boot.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/qtest.h"
+#include "sysemu/reset.h"
 
 #include <libfdt.h>
 
@@ -111,6 +112,8 @@ uint32_t openrisc_load_fdt(void *fdt, hwaddr load_start,
 
     rom_add_blob_fixed_as("fdt", fdt, fdtsize, fdt_addr,
                           &address_space_memory);
+    qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
+                        rom_ptr_for_as(&address_space_memory, fdt_addr, fdtsize));
 
     return fdt_addr;
 }
-- 
2.37.3



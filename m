Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A73E45FE6E9
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 04:22:26 +0200 (CEST)
Received: from localhost ([::1]:43650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojALB-0002zq-Pq
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 22:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=NTzD=2P=zx2c4.com=Jason@kernel.org>)
 id 1ojAGA-0000Sj-6V; Thu, 13 Oct 2022 22:17:14 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:50472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=NTzD=2P=zx2c4.com=Jason@kernel.org>)
 id 1ojAG7-0001g0-RB; Thu, 13 Oct 2022 22:17:13 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 13DE9B81E62;
 Fri, 14 Oct 2022 02:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38A76C433C1;
 Fri, 14 Oct 2022 02:17:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="DMEGeeOI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1665713827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E2tG8cg6i15BnKVQ+qgoskEv5SSmzm+WVuAWGWXUmbE=;
 b=DMEGeeOIy7G075FvU1Cc3icWBzfRZNIuEXefHqoTU/aLG4JdfvZEYjxtILn8TAYDHy/0Qm
 4N0/02lmr8/g96Rbbi9kqQIIB9RIkjvFX32Qr1EKmBHJ11/2677HLmOVDVC4P9wILDpLrn
 3iE7Djst5GUiODYjSsX2386wQIINAxU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 84f6c79b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Fri, 14 Oct 2022 02:17:06 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: peter.maydell@linaro.org, pbonzini@redhat.com, qemu-devel@nongnu.org,
 richard.henderson@linaro.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
	qemu-arm@nongnu.org
Subject: [PATCH v3 4/8] arm: re-randomize rng-seed on reboot
Date: Thu, 13 Oct 2022 20:16:49 -0600
Message-Id: <20221014021653.1461512-5-Jason@zx2c4.com>
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

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/arm/boot.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index ada2717f76..511f7b22b1 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -683,6 +683,8 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
      * the DTB is copied again upon reset, even if addr points into RAM.
      */
     rom_add_blob_fixed_as("dtb", fdt, size, addr, as);
+    qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
+                                       rom_ptr_for_as(as, addr, size));
 
     g_free(fdt);
 
-- 
2.37.3



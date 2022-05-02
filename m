Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E9D517ACB
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 01:29:10 +0200 (CEST)
Received: from localhost ([::1]:50724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlfTZ-0003CB-QS
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 19:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=8Tv5=VK=zx2c4.com=Jason@kernel.org>)
 id 1nlfSb-0002Xe-GC
 for qemu-devel@nongnu.org; Mon, 02 May 2022 19:28:09 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:45332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=8Tv5=VK=zx2c4.com=Jason@kernel.org>)
 id 1nlfSZ-0000QC-U2
 for qemu-devel@nongnu.org; Mon, 02 May 2022 19:28:09 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C5AD9B81AE8;
 Mon,  2 May 2022 23:28:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295BEC385AC;
 Mon,  2 May 2022 23:28:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="ZadJ6MOl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1651534082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=TY3V9cWsgB3DfKT2TM6FJDKc21DnhZRW8iveuh3Ne84=;
 b=ZadJ6MOl3S0vjgkJyKOoxySxIlO5mQrjtUA0VbCXWrR03yIWR4LVhq00M5xf3muKAfPvZh
 lj0OxaZwgB457z9xy3taD8EsyUOoyYlZnkKb9E5tnLl2AEIem9JTQnGNHUVFKXUTkHwMsB
 uwXuqnoNUaEJ3NVUI8ZYDwRSrj97bAc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 354b7bef
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Mon, 2 May 2022 23:28:02 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-devel@nongnu.org,
	openrisc@lists.librecores.org,
	shorne@gmail.com
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH] hw/openrisc: use right OMPIC size variable
Date: Tue,  3 May 2022 01:28:00 +0200
Message-Id: <20220502232800.259036-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=8Tv5=VK=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This appears to be a copy and paste error. The UART size was used
instead of the much smaller OMPIC size.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/openrisc/openrisc_sim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index 99b14940f4..bf434e9737 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -410,7 +410,7 @@ static void openrisc_sim_init(MachineState *machine)
 
     if (smp_cpus > 1) {
         openrisc_sim_ompic_init(state, or1ksim_memmap[OR1KSIM_OMPIC].base,
-                                or1ksim_memmap[OR1KSIM_UART].size,
+                                or1ksim_memmap[OR1KSIM_OMPIC].size,
                                 smp_cpus, cpus, OR1KSIM_OMPIC_IRQ);
     }
 
-- 
2.35.1



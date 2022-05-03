Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2532D5181A0
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 11:48:45 +0200 (CEST)
Received: from localhost ([::1]:59918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlp9A-0007P9-5z
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 05:48:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=EuPl=VL=zx2c4.com=Jason@kernel.org>)
 id 1nlp6E-0005HM-Oa
 for qemu-devel@nongnu.org; Tue, 03 May 2022 05:45:43 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:40936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=EuPl=VL=zx2c4.com=Jason@kernel.org>)
 id 1nlp6C-0004xl-QJ
 for qemu-devel@nongnu.org; Tue, 03 May 2022 05:45:42 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C51FC6146C;
 Tue,  3 May 2022 09:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFB99C385A9;
 Tue,  3 May 2022 09:45:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="FeSLEXto"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1651571136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cDqyYBTb2VLcJLG8q4FQnCZ2mbz3xpLWhjf3FPvWSIM=;
 b=FeSLEXtoldoeZ6kYqLDcXK3dWsb+kaT17e4IhwSJlfOPQIlkw9QB7+gt0JwGIu1DudrZ2J
 QnKpG3OBTBwnBResPOYgMVeAnuF16p0lldKLaz3pAyQdbbiRJHhgcyRKscctdl8hfE/q12
 wsItlpu40Pkljb02AEjH/mZ+/Rgm4so=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 61cb67cd
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 3 May 2022 09:45:35 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-devel@nongnu.org, openrisc@lists.librecores.org, shorne@gmail.com,
 richard.henderson@linaro.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH v2] hw/openrisc: use right OMPIC size variable
Date: Tue,  3 May 2022 11:45:33 +0200
Message-Id: <20220503094533.402157-1-Jason@zx2c4.com>
In-Reply-To: <20220502232800.259036-1-Jason@zx2c4.com>
References: <20220502232800.259036-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=EuPl=VL=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
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
instead of the much smaller OMPIC size. But actually that smaller OMPIC
size is wrong too and doesn't allow the IPI to work in Linux. So set it
to the old value.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/openrisc/openrisc_sim.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index 99b14940f4..3218db6656 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -78,7 +78,7 @@ static const struct MemmapEntry {
     [OR1KSIM_DRAM] =      { 0x00000000,          0 },
     [OR1KSIM_UART] =      { 0x90000000,      0x100 },
     [OR1KSIM_ETHOC] =     { 0x92000000,      0x800 },
-    [OR1KSIM_OMPIC] =     { 0x98000000,         16 },
+    [OR1KSIM_OMPIC] =     { 0x98000000,      0x100 },
 };
 
 static struct openrisc_boot_info {
@@ -410,7 +410,7 @@ static void openrisc_sim_init(MachineState *machine)
 
     if (smp_cpus > 1) {
         openrisc_sim_ompic_init(state, or1ksim_memmap[OR1KSIM_OMPIC].base,
-                                or1ksim_memmap[OR1KSIM_UART].size,
+                                or1ksim_memmap[OR1KSIM_OMPIC].size,
                                 smp_cpus, cpus, OR1KSIM_OMPIC_IRQ);
     }
 
-- 
2.35.1



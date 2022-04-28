Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3122251320D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:06:36 +0200 (CEST)
Received: from localhost ([::1]:50756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk1yl-00065S-7N
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=yuO2=VG=zx2c4.com=Jason@kernel.org>)
 id 1nk1Ud-0006Fu-En
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:35:31 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:57272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=yuO2=VG=zx2c4.com=Jason@kernel.org>)
 id 1nk1Ub-00004s-22
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:35:26 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C411961DD9;
 Thu, 28 Apr 2022 10:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7885EC385A9;
 Thu, 28 Apr 2022 10:35:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="bXy/j2fr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1651142120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=nJ6RTU4RXAUTOLu2hrurvGS4AlaBGyTTAdMHn68hABo=;
 b=bXy/j2frlXL7J8n6rYUK3ACQ/yEKzsrjW6DMMk0Zn7ZB6MHWyQ+Ivk1m7IUpahx0g2sp7v
 MuAXE7v2vm32Ckju1H4xEYtnRLfVzCOM+VSYS8wS4wlqB5DjVooTK6FgkM2BzhdWgQcyvf
 twGCw2hYw0pp20aGLWOoL3zq1BOafmA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2cc36e21
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 28 Apr 2022 10:35:20 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: openrisc@lists.librecores.org,
	qemu-devel@nongnu.org,
	shorne@gmail.com
Subject: [PATCH] hw/openrisc: page-align FDT address
Date: Thu, 28 Apr 2022 12:35:16 +0200
Message-Id: <20220428103516.1149436-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=yuO2=VG=zx2c4.com=Jason@kernel.org;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU-provided FDT was only being recognized by the kernel when it
was used in conjunction with -initrd. Without it, the magic bytes
wouldn't be there and the kernel couldn't load it. This patch fixes the
issue by page aligning the provided FDT.

Cc: Stafford Horne <shorne@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/openrisc/openrisc_sim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index 8184caa60b..99b14940f4 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -356,7 +356,7 @@ static uint32_t openrisc_load_fdt(Or1ksimState *state, hwaddr load_start,
     }
 
     /* We put fdt right after the kernel and/or initrd. */
-    fdt_addr = ROUND_UP(load_start, 4);
+    fdt_addr = TARGET_PAGE_ALIGN(load_start);
 
     ret = fdt_pack(fdt);
     /* Should only fail if we've built a corrupted tree */
-- 
2.35.1



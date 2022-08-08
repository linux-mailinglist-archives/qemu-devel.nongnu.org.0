Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F058758C766
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 13:17:34 +0200 (CEST)
Received: from localhost ([::1]:42558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL0lJ-0002GH-Hk
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 07:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=c6th=YM=kaod.org=clg@ozlabs.org>)
 id 1oL003-00069Q-SK; Mon, 08 Aug 2022 06:28:43 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:52093
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=c6th=YM=kaod.org=clg@ozlabs.org>)
 id 1oL002-0001XT-8X; Mon, 08 Aug 2022 06:28:43 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4M1XVH2sP9z4xVR;
 Mon,  8 Aug 2022 20:28:39 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4M1XVF2HW1z4xVB;
 Mon,  8 Aug 2022 20:28:37 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v3 22/22] ppc/ppc4xx: Fix sdram trace events
Date: Mon,  8 Aug 2022 12:27:34 +0200
Message-Id: <20220808102734.133084-23-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808102734.133084-1-clg@kaod.org>
References: <20220808102734.133084-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=c6th=YM=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc4xx_devs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index 3cb6d0e66eff..5d5626c0506d 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -175,7 +175,7 @@ static void sdram_set_bcr(ppc4xx_sdram_t *sdram, int i,
     }
     sdram->bcr[i] = bcr & 0xFFDEE001;
     if (enabled && (bcr & 0x00000001)) {
-        trace_ppc4xx_sdram_unmap(sdram_base(bcr), sdram_size(bcr));
+        trace_ppc4xx_sdram_map(sdram_base(bcr), sdram_size(bcr));
         memory_region_init(&sdram->containers[i], NULL, "sdram-containers",
                            sdram_size(bcr));
         memory_region_add_subregion(&sdram->containers[i], 0,
-- 
2.37.1



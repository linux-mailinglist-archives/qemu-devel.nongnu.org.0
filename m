Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 612E037259F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 07:56:41 +0200 (CEST)
Received: from localhost ([::1]:50058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldo2x-00076y-UA
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 01:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldnzp-00057h-8n; Tue, 04 May 2021 01:53:25 -0400
Received: from ozlabs.org ([203.11.71.1]:56761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldnzm-0004Zz-57; Tue, 04 May 2021 01:53:25 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CJ2Tvxz9sVt; Tue,  4 May 2021 15:53:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107596;
 bh=c+Av/lwhQMLGG0GJaCIeD3vUOc2wvGqxh/adBaWljAk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pTqF1+8ZeGf+62Z/AZScXQBqsePDe8KLJ3t6SbKNES1pgux/TlZ6qG+Ppt43ECLX0
 wEcvkETo4TZ4oiJznyX+v69t7I7ZXDwWcawpD3wDb+l5dx6hiQcfmLk8oiCkdhFUq+
 k9Ayc+uYDVdk1i/JEImv11GxS6IMrJo3PQzn+2Xo=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 01/46] hw/ppc/mac_newworld: Restrict RAM to 2 GiB
Date: Tue,  4 May 2021 15:52:27 +1000
Message-Id: <20210504055312.306823-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?H=C3=A5vard=20Eidnes?= <he@NetBSD.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

On Mac99 and newer machines, the Uninorth PCI host bridge maps
the PCI hole region at 2GiB, so the RAM area beside 2GiB is not
accessible by the CPU. Restrict the memory to 2GiB to avoid
problems such the one reported in the buglink.

Buglink: https://bugs.launchpad.net/qemu/+bug/1922391
Reported-by: Håvard Eidnes <he@NetBSD.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210406084842.2859664-1-f4bug@amsat.org>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/mac_newworld.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 2175962846..d88b38e925 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -157,6 +157,10 @@ static void ppc_core99_init(MachineState *machine)
     }
 
     /* allocate RAM */
+    if (machine->ram_size > 2 * GiB) {
+        error_report("RAM size more than 2 GiB is not supported");
+        exit(1);
+    }
     memory_region_add_subregion(get_system_memory(), 0, machine->ram);
 
     /* allocate and load firmware ROM */
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3779315F85
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 07:34:55 +0100 (CET)
Received: from localhost ([::1]:53080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9j5S-00048q-Pn
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 01:34:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ipY-0002OQ-EM; Wed, 10 Feb 2021 01:18:28 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:35129 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ipU-0000RN-23; Wed, 10 Feb 2021 01:18:28 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Db8gq0L1Yz9sWg; Wed, 10 Feb 2021 17:17:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612937863;
 bh=UeYSz0mf0MAchzxsL+q7zeJPqhuh6UMU7D7JXGGsX+E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=owjCm9Bb+WqMcLophuf3RE2MFTwd0wh7KNEg4gU+5uHRiLsZOI/b7oVww5C5tuxvp
 ckzVyRm6Wh00ULgRwZxneg5yPbj0fWRgQNBVaDiWtrw/lpE/bx5zmpINX/ETyKV2H4
 PkXnBv1pk5ATFVzPGRppbJL+ksToOf9Hc0z183V0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 17/19] hw/ppc: e500: Fill in correct <clock-frequency> for the
 serial nodes
Date: Wed, 10 Feb 2021 17:17:33 +1100
Message-Id: <20210210061735.304384-18-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210061735.304384-1-david@gibson.dropbear.id.au>
References: <20210210061735.304384-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

At present the <clock-frequency> property of the serial node is
populated with value zero. U-Boot's ns16550 driver is not happy
about this, so let's fill in a meaningful value.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Message-Id: <1612362288-22216-2-git-send-email-bmeng.cn@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/e500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index c795276668..01517a6c6c 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -126,7 +126,7 @@ static void dt_serial_create(void *fdt, unsigned long long offset,
     qemu_fdt_setprop_string(fdt, ser, "compatible", "ns16550");
     qemu_fdt_setprop_cells(fdt, ser, "reg", offset, 0x100);
     qemu_fdt_setprop_cell(fdt, ser, "cell-index", idx);
-    qemu_fdt_setprop_cell(fdt, ser, "clock-frequency", 0);
+    qemu_fdt_setprop_cell(fdt, ser, "clock-frequency", PLATFORM_CLK_FREQ_HZ);
     qemu_fdt_setprop_cells(fdt, ser, "interrupts", 42, 2);
     qemu_fdt_setprop_phandle(fdt, ser, "interrupt-parent", mpic);
     qemu_fdt_setprop_string(fdt, "/aliases", alias, ser);
-- 
2.29.2



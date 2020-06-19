Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F2E20195E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 19:25:51 +0200 (CEST)
Received: from localhost ([::1]:49374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmKly-0007F6-DO
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 13:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4324eb4de=alistair.francis@wdc.com>)
 id 1jmKUT-00010s-Ib
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 13:07:45 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:19131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4324eb4de=alistair.francis@wdc.com>)
 id 1jmKUR-0004PZ-Q1
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 13:07:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1592586463; x=1624122463;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LYV/HV2oePnGMNLANWSHYTsEansGO/O7noO72QkqJrU=;
 b=MTUYepk/0VECDFE2+UpnPNiG07MsMyACpl9sgJPbomJ3vVa4BIGXVu/t
 mEqssXB6m/l0Yhu774WESOxVMTKZf641cgQDjIwvCX/Sjhb9479qL6CwG
 tDLnoFPVbFCEA3ZpNq8p/x/P5L4ZJLwFiL3IReUKgrPQaVql4yZNT9sJ2
 beZtkXONvyjf20YXBdl6ZECjkYxr9JKZx3hwoA2+BofQ3u1hZ4uFMZJti
 Equwxc9ia2NTlZEYsxCrhEBg5smnlLzGha0xoX4CRpOh7fdhv+FGBgdnM
 /o8d2K5HgspIRNhbS3wJ71Klo2PXnrkN4pMJZZq/AIHiAWjoqtDuDkam8 Q==;
IronPort-SDR: lw4KtMantPBd+u1Dl7MkQJJH+S3DwcPDBObDqqg0XpjOSJRBDaoGzeAitufFC3i63Z8wx6959e
 /ajTt1xvRBzna9RAMoL7uHkAoX3OSsjhICGIlzUz7rIkr+TnD8U9ddV+TS1tY161tgs8+LKQL4
 /eojnexo+9iy0ABpKgMBGySc1G33kX/jixFkL+OeSpExY+j7+BUSSaYRDqmc+azDYubtkO6yaX
 enYrWMY34pBLjxReRHmZdtAJHiAeF4zMSqOO2jxo4aHVEoI0gj1H+OqmbosKuHkSOCCQNcFTgx
 Noo=
X-IronPort-AV: E=Sophos;i="5.75,256,1589212800"; d="scan'208";a="144763328"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jun 2020 01:07:23 +0800
IronPort-SDR: xDMss9n4YtkJA8QGE0ntQS9l5dbZcZV0Drx8eppqFoL8cyNQVx7oi5U54GIBVktv2XLZTNG5PB
 VIDSXtoPpBYZmqCnw8WohGA45/4wGMe7s=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2020 09:56:01 -0700
IronPort-SDR: /I5VQBK97zQ7pOb2dRLGRR7MSpg5z0wjEHAkzpEbNCBV6HprzV3iQQzVdfy9vfZbnyDyR7hxWI
 OUjU3mLjBEZw==
WDCIronportException: Internal
Received: from unknown (HELO risc6-mainframe.hgst.com) ([10.86.58.142])
 by uls-op-cesaip02.wdc.com with ESMTP; 19 Jun 2020 10:07:24 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL v2 11/32] riscv/opentitan: Fix the ROM size
Date: Fri, 19 Jun 2020 09:57:56 -0700
Message-Id: <20200619165817.4144200-12-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200619165817.4144200-1-alistair.francis@wdc.com>
References: <20200619165817.4144200-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=4324eb4de=alistair.francis@wdc.com;
 helo=esa3.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 13:07:21
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, alistair23@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reported-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/riscv/opentitan.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index f6776da8e9..011e4f7ee2 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -25,12 +25,13 @@
 #include "hw/misc/unimp.h"
 #include "hw/riscv/boot.h"
 #include "exec/address-spaces.h"
+#include "qemu/units.h"
 
 static const struct MemmapEntry {
     hwaddr base;
     hwaddr size;
 } ibex_memmap[] = {
-    [IBEX_ROM] =            {  0x00008000,   0xc000 },
+    [IBEX_ROM] =            {  0x00008000, 16 * KiB },
     [IBEX_RAM] =            {  0x10000000,  0x10000 },
     [IBEX_FLASH] =          {  0x20000000,  0x80000 },
     [IBEX_UART] =           {  0x40000000,  0x10000 },
-- 
2.27.0



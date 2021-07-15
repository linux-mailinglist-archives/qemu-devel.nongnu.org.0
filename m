Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C469F3C998A
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 09:19:47 +0200 (CEST)
Received: from localhost ([::1]:39846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3ves-00011n-QT
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 03:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8230c157d=alistair.francis@wdc.com>)
 id 1m3vc3-0005RU-Cu
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 03:16:51 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:27200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8230c157d=alistair.francis@wdc.com>)
 id 1m3vc0-0003UP-RI
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 03:16:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1626333409; x=1657869409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cmebsk2YrhvouJOpHNJ/nTGaasT8su7IGqhbza6bBr8=;
 b=lQNE4YSIzPcoLYSl3QWIrWvhCjEkPu9fwAN8M+sJ96kYO86dGccaMlhk
 1CUhdJUSiQNe4E/VaTNAqCclfNDF7RVMD2czRyV1ut2eendfb43Uva6qp
 ShWl/U/Mi1A/pu9OUXCFGsIz7JLsIE+X1zBnweu3c+lRU9uWV0z1slg5A
 srPU9AJJ1t6+vh1cLQ/QaZefDMLNb4zH6gJnejXUPiWzYZEARiVAFJD5h
 ylH0PUWLtbAGwPbAZM1EfBlzoHqXBlaBCWkUvyTZs9/94FG8Hr2rFtS/B
 F6fayH56+KPgiqeQW2Ij40cvdS5h4BGBkN287WyE15d48JihSAOQsrSs5 g==;
IronPort-SDR: NN2jRsEiwb81o4MyCoe4WYdrPisgSf4G6607yGeviUZMlhdSSauq0h/VC3WJMHUhnLMrihMKHK
 fGC7iWduIPIaXqApILp46rYl+8vAqRpFRsDolIJF9/H+V0xLqYHeno8UdXx4EPn/OBlfWGCXRx
 y3tpjuzzgfaiS140X54L7qN0zHZ96PVvrZYp19z+b6nbsPmX28dTQGC9lywj/C7+kFDVlg5lVK
 qiIVg0v1l17ewhixjNE+bKIVZOLYZUMaMu23DDiAeypb6hpu7yG3ZPSWpyv7g+n4xDYS7khlBk
 SUs=
X-IronPort-AV: E=Sophos;i="5.84,240,1620662400"; d="scan'208";a="175212301"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jul 2021 15:16:42 +0800
IronPort-SDR: TZrm2CxpcRPuV4a++d4YH2WJoD4ixB++HbrS1Zm4Yd9UZ/93TRAs6P2Q1HfaqEXyWyWeA6jhgx
 SAHhRimxpZGXnjpiXRfyySuUzQPsT4uVMh5VuVnPvoOM+O8DGslH+lRUtZaZ684CxLfGIO7r22
 8nh6HCTsvsFDSQcg2G7LR0Ec8NmwUSTCTZbNAutmBwX+mLv+7egr0xrrDEVbN4uCm2YngF4f0R
 58BvGCs8Sbk3OhufzLimzBwE8rX2TCTcURfhe/WTTaxpupeg7igOGWdKr5Zlp2LP3/Em5wRO9k
 B95tTRjEly6TfQIyQByl0PxH
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 23:54:44 -0700
IronPort-SDR: 8vaNBE1C3RPrL25Qt3aVtMzVKIoq1CacmIJX+4h3SlMOF737qCtzmeKCV8k/gc1DkEwINu3i2g
 u5P1oTXZQThYTg5QGJFWordrkJmDS8uI3YRxN2nfJ85PXJ5hV8ze6cpJ3FORnwOupRXkYDtfwZ
 Jn/V+ISisEum59Qa2ugtj/o6Gvo4VSvHiU1DCCnQnzQBctfHslH5OzWKCbWxVw4xDSpJq2oqiE
 tJAAlIXGFq3r725o1HEzjMjF4+CJk+q9GQ5xHklM73+Z2/rcMz6MIPtRLhOMEzBU7o7B68+d1F
 I0Y=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.248])
 by uls-op-cesaip02.wdc.com with ESMTP; 15 Jul 2021 00:16:43 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL v2 03/12] docs/system: riscv: Fix CLINT name in the sifive_u doc
Date: Thu, 15 Jul 2021 00:16:31 -0700
Message-Id: <20210715071640.232070-4-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210715071640.232070-1-alistair.francis@wdc.com>
References: <20210715071640.232070-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=8230c157d=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

It's Core *Local* Interruptor, not 'Level'.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210627142816.19789-1-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/riscv/sifive_u.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/riscv/sifive_u.rst b/docs/system/riscv/sifive_u.rst
index 32d0a1b85d..01108b5ecc 100644
--- a/docs/system/riscv/sifive_u.rst
+++ b/docs/system/riscv/sifive_u.rst
@@ -11,7 +11,7 @@ The ``sifive_u`` machine supports the following devices:
 
 * 1 E51 / E31 core
 * Up to 4 U54 / U34 cores
-* Core Level Interruptor (CLINT)
+* Core Local Interruptor (CLINT)
 * Platform-Level Interrupt Controller (PLIC)
 * Power, Reset, Clock, Interrupt (PRCI)
 * L2 Loosely Integrated Memory (L2-LIM)
-- 
2.31.1



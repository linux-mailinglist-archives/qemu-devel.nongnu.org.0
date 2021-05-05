Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E45374C0A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:41:36 +0200 (CEST)
Received: from localhost ([::1]:44014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leR95-0006tw-EZ
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQsp-0000c0-Cu
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:24:47 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:33229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQsl-0000cg-Qr
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:24:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257083; x=1651793083;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eY64W9JB7jnGvaakjv5BADNjhl2X/P3bfdlkpxmil/8=;
 b=RZopp+gpLSvvOHwQctBFO5SB64ZxBEXKGYUwqSG9jyo/4HQjtlzBadd7
 MJJyQzAVL9+oQnmmLCAWqYVDtmkoFAqydr6JKZsnaZrVjGTW4yqX5Xf2T
 M5FGoqT49klB9UkAhGUud9YBzaJJqV+Mfmo9f3odiJuA14ExVCNtjPIN8
 J0xXVfciVXyGnZTrzjkX/xig8py71UtNS6zeJtXYekbY1duYnNiFcMQjq
 LPWpTCJDqCtq00gI4sRyfaJ/e6K3cW+DsxqikliC29H8+MUJCRex4zaFm
 LmeKVJzn6090dskuVf8wyrobFy9B5aaTg5ULeesn6kEkKN03v4avmeoWH g==;
IronPort-SDR: TKyfPm5wmJm0MMAe9QB5ycaDzHMQajiJE1mscEdI+ce1PjtoKh7p2pZ7TkuCWGlbKHx20XrWw1
 X3cNh5+p4ZVAGu31csOt0XRQv3CFgCMz6U7wdzyFbliQdOTIMoC5VHc70uIa/pgzs7dfWP1hBr
 +1hvkEnJnpRHoTDXZwqrLlKkQNslHGzV0+Y8L23wv9i2WsL2v787TCTAwtteUERl1rHWrsC6Qx
 G/H8HfA7Syc7AK3jnGFB0yv79Bye84q0drz9Hwa3dg8Om4BOAUg3d3FPknFnRC1F1I8+MTuw1r
 4PM=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="166585960"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:24:43 +0800
IronPort-SDR: XnbPUsaSXaH7oDyu77+SMVNBPxBWbm6KLSJLY+Yy77NpJBzudYoUqye7cGaRjaw+bpCOsEPq0G
 9W014o42IcAfUcBUo3N7s6f2ga17pfza/gTnclodDLexNA/4cVPEJSqGGjJgEj+I/Og/gRoJJS
 Bs3qYx/LLhiGmKIoSWmdBr07uDxCWKcYuyJ01M3uSJDguNIci+Xil0NceFgxqY0mU3QTN/BgXK
 ftLnslWeDkD3DDcHE94PJwdFvKMBLj4dN34bppT32+REWnPOL4/dHg4V2wQrWApSmJb50wUyMj
 PVQ/jiNukTQVRi9V2XyuAMXo
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:03:23 -0700
IronPort-SDR: 4OTi7nFc3Kdcv0iDbC8J2lPnKLrdjoUyCpYLkDTNIHUWS1EEiYrtafU1RF+z/z1Vb98/0NW/qa
 VhO9lXuqWJbKIew/MC/i+JjQxloXz1Nvkft+bD5PpsbFxGg/uQ3o+ff4grQ3ul+w/lt+wySB6q
 a4vo98RzW3pDvJsWQrGpQnBYJAKl/KyvKMk+qHcbSQ9jfhwv//CXaJr6VrP4qd0fnvhWg8o5eZ
 3jqFxlaFda4m2Kw5dHftzGBnOFlJNbhAIaiKCnGb/qPH9v4v5j49Wpv4GH4B++BXSBpkcgEtHy
 WEc=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:24:40 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 25/42] target/riscv: Add a config option for ePMP
Date: Thu,  6 May 2021 09:22:55 +1000
Message-Id: <20210505232312.4175486-26-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505232312.4175486-1-alistair.francis@wdc.com>
References: <20210505232312.4175486-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=752564754=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Hou Weiying <weiying_hou@outlook.com>, qemu-devel@nongnu.org,
 Hongzheng-Li <Ethan.Lee.QNL@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com,
 Bin Meng <bmeng.cn@gmail.com>, Myriad-Dreamin <camiyoru@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hou Weiying <weiying_hou@outlook.com>

Add a config option to enable experimental support for ePMP. This
is disabled by default and can be enabled with 'x-epmp=true'.

Signed-off-by: Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
Signed-off-by: Hou Weiying <weiying_hou@outlook.com>
Signed-off-by: Myriad-Dreamin <camiyoru@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: a22ccdaf9314078bc735d3b323f966623f8af020.1618812899.git.alistair.francis@wdc.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu.h |  1 +
 target/riscv/cpu.c | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 83b315e0b2..add734bbbd 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -304,6 +304,7 @@ struct RISCVCPU {
         uint16_t elen;
         bool mmu;
         bool pmp;
+        bool epmp;
         uint64_t resetvec;
     } cfg;
 };
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e530df9385..66787d019c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -412,6 +412,14 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 
     if (cpu->cfg.pmp) {
         set_feature(env, RISCV_FEATURE_PMP);
+
+        /*
+         * Enhanced PMP should only be available
+         * on harts with PMP support
+         */
+        if (cpu->cfg.epmp) {
+            set_feature(env, RISCV_FEATURE_EPMP);
+        }
     }
 
     set_resetvec(env, cpu->cfg.resetvec);
@@ -554,6 +562,8 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
+    DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
+
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
     DEFINE_PROP_END_OF_LIST(),
 };
-- 
2.31.1



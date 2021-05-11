Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCC737A560
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:59:21 +0200 (CEST)
Received: from localhost ([::1]:46312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgQ6i-0002mh-1I
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPXB-0002ZQ-Nz
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:22:37 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPX2-0006V6-7g
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:22:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728546; x=1652264546;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wh2ave+DSkoE9jb+Ncy1LkaCoi2qwdskqhXQshjT/NI=;
 b=fcF5jathcN2EhPFQl9UZM0zHjnHF2aL2IjDTZJROV0TaLontdDzLYXZs
 /xDruK6A3kYniwQFXANMxADrJgOf1YbbCLjI1px0v4rHrmQ5tTVCQlqQV
 9emj52F0K7IFqdbb7fgoBIPDBzIGTBIVrVa4wCGeW815iKvxDM7MY2Hrg
 XxFW9qaCeTyK+Ytwz1IbCQXXD2K6rxoNxoLsKhVks2jglfqOrhyYpp4Yk
 0Sqd8wO89i+U2l5oShYMoUqsEYEwB3QcskBnb+aIvMZn2zMgGa1DxwbFn
 PmfeiCvoZNpUqF2g6V7R/ZVnLnwCLtOPFWSZP3MzgNuPnfpyWaM2EdBde A==;
IronPort-SDR: A23HbeZUSxClf+T/SbnfA3GXDAlt+SMIi73vmuwaq4YQef/GtuScxh5e21kzBXTX9sT3VA5slp
 vHCSgWc+swnMu9iZ/RuZ167AY34lA8t4lZm4xmKqMqZr0dEi17kADH7jCYc3HbgUDfQTj7u3HO
 EOWonrU7hxnvQ7/G5L1ZWU6U4zaoQVPb4ekiJslDAZIdnFlR7Orc9C2qluoXMMxHcB4AO2bXCu
 jzBxkYU8cLQEZqWQh3c5Hhii0F4Z8XXJq9+/d+eb3RPOf/z++PMupC7SqOkvLLsv09DAyOEkJ4
 iZY=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735477"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:21:39 +0800
IronPort-SDR: BNvU/vQJLBveFF0bsa7u4mmE81QjCDVDQlEy134zRYnEniCfmwUvEqfByWikadMiee6NlriC5U
 jhYeSDzUpUvXGHuP2B0vFvWihyglA/Af/k7WGAiDt/ZRtucswPey6SMO2C223KEcfQlgG42Oy9
 ZSGaOp+cn9mzpnFutOczbVrZrpmGDTViE1KI6hI+7+3S/lT4FYkRdBVNBY+Z7UycvegeOlPoPe
 nipnDMjPfGGNnpUhkLEMHYu0R2xbhwZT8bTKP6w6k5Z0onhzkR+cqd+eAACvAkitloHXM9cwKv
 SkaBHy6FJI+bnirm+X448JFm
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:01:39 -0700
IronPort-SDR: xK3PCtQQ1XJI3nNP2dbH41eRuwzSO0TW3j/WVJFHg4mZW7yO8k1Q8UUG6ZoRGl119VxzZE9i9l
 OWgHgPzrRsFMce+ner/jdLrJOlWLzwxEzMhbif+n9rT20G77x00GE6sAnmj6pa+vloZkY2PT5I
 fWh0ALua6Ck4Jay377mFdl6+ifrqLKm2RIXbCI4lB+L5ij5i5vpx5ien+ixZY89gPT4TsyIsA+
 Tv0FGgTlprbvMiSUWfqo5ITqmFDRgFWFCqB56TREW1+P7cvF/PlUuY8GaJPgOEZSQAC9+m6z2F
 tLw=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:21:39 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 30/42] hw/riscv: Fix OT IBEX reset vector
Date: Tue, 11 May 2021 20:19:39 +1000
Message-Id: <20210511101951.165287-31-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511101951.165287-1-alistair.francis@wdc.com>
References: <20210511101951.165287-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7584e029c=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org, Alexander Wagner <alexander.wagner@ulal.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Wagner <alexander.wagner@ulal.de>

The IBEX documentation [1] specifies the reset vector to be "the most
significant 3 bytes of the boot address and the reset value (0x80) as
the least significant byte".

[1] https://github.com/lowRISC/ibex/blob/master/doc/03_reference/exception_interrupts.rst

Signed-off-by: Alexander Wagner <alexander.wagner@ulal.de>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210420080008.119798-1-alexander.wagner@ulal.de
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/opentitan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 557d73726b..7545dcda9c 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -119,7 +119,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
                             &error_abort);
     object_property_set_int(OBJECT(&s->cpus), "num-harts", ms->smp.cpus,
                             &error_abort);
-    object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x8090, &error_abort);
+    object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x8080, &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_abort);
 
     /* Boot ROM */
-- 
2.31.1



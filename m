Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3433537A4CE
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:43:38 +0200 (CEST)
Received: from localhost ([::1]:60516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPrV-0006tz-52
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPWr-00028b-P2
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:22:18 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPWl-0006V6-Tw
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:22:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728529; x=1652264529;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F35Wlg7ThlZkm1vRHn1Yuy4izpGJ5nEtQpXZGyOoRmY=;
 b=Ze+1IbgZjp9ljrIJCby+1QDxclBwGBFVBJoZRFwDZwtIJQ1nptmC19nb
 TsuJBsX7lKUrPCKisUfLOuz3egsvec67GGqSgzopoO6XU8f+loKBaw6I1
 wga3RJi3SWzQHTEx+zv/5DFG9mv2tgej75zS/0SeeAXhXZTtV0zBI7at6
 7mlHofGGp+GYc6ZbdHotQ7d1CpldeNq1S8hlb4uO42pCvysTurrKflmK/
 Vp4v6Xu5Rs94oVR+g9B5C05aJoNeS0KWq3YVVNmpRldtccsSfLA0XA52j
 PGG7db2iV7FVCi8slj+QFsRZlg9ZCVZJeBJHdtRoqsYCaYAPGuZoaSlEm Q==;
IronPort-SDR: Pb/FFiHv3qGd6+CilncN59oVDr6hSd6WLv9/4r9CVmAe/r8/00T39uZPlyTvPN9I92Da3vsMYJ
 lBtwBVsCJXdLRUMYOedhUB8cp8ILsQ+lOs5GxMrFn9vD/QBIsKd2rB0lD1XNTbnuSPYjvgOCDH
 U+Y2SKIYgSs3Qrod7WSb9FhVXWhrNLoFevHrMGWN728Ina727b7qnFRc81AblyUdFwcaCjd6cb
 qu5FtdeN8YR6jsSmCm/OwZk+Pf+31IGoWaru6KoDlQ/AczDiDe7lrrJY7mPEnwsnRMeY2uvqCu
 9Sg=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735458"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:21:31 +0800
IronPort-SDR: XCTANfp8H6SFimSowxLvJemXatdxBk8H23VeoxOsWBuIH8d5FMFQWWVAfCvq3rTGxlAyWhAZGB
 s9DcBhQnd647aq7Nt5TmuJE8X5hbH57soV5cfdWHBwPo/6Tq/1JWoHffbyBk+3FhPTlB1wqN95
 cpY5HWT8PhVPNsIdKVIlFdVW1BOjjTiEf5KJGDgsqVU6F+Z2g5VPezllE39USvt0iNus+DtuCN
 BK6jyZdBEA01zYLwEACjj6e7yUnk0fzbzcId1JNB/pf2d9FMCfh9aRI6NVWDbM0y6xL5XaQSxI
 vfcbQktZifhCN26fU8KxSDKY
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:01:30 -0700
IronPort-SDR: 63A/ddUPBuQfptyNrUXr4j5D/anK080GobMfL3sTV51yHKyi0MoMXzp5FWOPVT6ivsPeg9TtC1
 wRh5BiaGZxvVr4r7+OKXUwnHpDHvnzDnCTN5iJMfQBEWFjyM4/eJ6WCgAaNfX0+AZ0Dt/lc2Th
 w+yU2RwRBiPSbg39Kj7WNn8gmIjvzFye3BEvQVuXhsCllaGUPB5Jh9kO6yIYTli7lEzFscKmGs
 e80vyAszK4rkzyJtjrvHqGYOqXiCNhDadcV5JUBhnFY5qEC5SVhUek9EeM2WdhDWdAOTUB7KY4
 WeE=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:21:30 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 27/42] target/riscv: Add ePMP support for the Ibex CPU
Date: Tue, 11 May 2021 20:19:36 +1000
Message-Id: <20210511101951.165287-28-alistair.francis@wdc.com>
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
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The physical Ibex CPU has ePMP support and it's enabled for the
OpenTitan machine so let's enable ePMP support for the Ibex CPU in QEMU.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: d426baabab0c9361ed2e989dbe416e417a551fd1.1618812899.git.alistair.francis@wdc.com
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 66787d019c..4bf6a00636 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -202,6 +202,7 @@ static void rv32_ibex_cpu_init(Object *obj)
     set_misa(env, RV32 | RVI | RVM | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
+    qdev_prop_set_bit(DEVICE(obj), "x-epmp", true);
 }
 
 static void rv32_imafcu_nommu_cpu_init(Object *obj)
-- 
2.31.1



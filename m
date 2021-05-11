Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A159037A4A6
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:34:19 +0200 (CEST)
Received: from localhost ([::1]:37198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPiU-0007a5-JO
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:34:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPVu-0000j0-TI
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:21:19 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPVt-0006V6-7O
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:21:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728476; x=1652264476;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=otQOSwcYVr7RAj/nWvFHEWoMMJh10b7Yi4YNSpL0/3M=;
 b=jQJvsyzQdkOEhBfV64Qkr7LaymZ8IajNoBfmFef8pb/uQ4KA+Aijpyzg
 T9o3WY8ZUCdGTf3do6d1/iaxQdALVQluMA0x38dRTYCYWVXGv86oqwTBq
 4jMma9oWdAZc9e0MEesUMrJ1y/yJ/CTZH7FxXYdaQebs70N3SnHsyupmD
 qj2g5nIhqHRg3U/guU2s32UpA4pWE6sC3SJwCD4XTKI63WSfY1rTQqWMN
 GXInL6LBOy3Kq1FBrnwU6N9ioATG0BlLnrLc0hhlCwF5ICBA0olDF1JWZ
 qMqonWuZvl5z7mqwY+cHw6OhrXcVl9ukVqGmm+tz6UfY4WRKvIyR84sv0 Q==;
IronPort-SDR: u2aI8KtZdjQ7K/OgRhXkwqKPNc4m0Xu93zwgutUou5OUi72I01oNwCFQmt7s0Fipppgqyre352
 xsXuOhHucLCmHE8gYDljc+TIzkWt346yaQb6azO+BKek9Pu6CXLE5NwZGC3Fo2duN4JqnZJ9PM
 S0HR9cEwTG0TMDSNzL5mf8RxrTb/aLvc6gsWsAP1ADOMEi/nyOSc/vLtNQnwboH3zpBzqF5W3B
 nk0A7rQP4CEUSadq9E4xCbr5Vgq0odjvcg+wF3QnBlWzdUT7qeqwudih8KARXyt47A62r+NyGN
 pWA=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735393"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:20:54 +0800
IronPort-SDR: efO8vcwkrs8SNk8uWXk0H9hjVku1htzBL3hfK6A7DfcRVKDqFpOsCyE2nCzVXUQO5GwlJuR+SW
 5s4rR58T9q3DbzJnyIrobpst2g3PtlA2MXJzAmStwHkryP0wuua128wrUIN7Awd2jsGLeOI9Dv
 i7HVQ3BeJcyEDrX0AtIZFdp9ctMC8YD6bdMyfWT0ihbsJ0ToytzLqMYnWYPG1peK7Whc/VZp5d
 eaUMpruUxrp4JyadwKmsi4qTJh5CaVh3rt+ARziU7bEr139cMOCjDdFR7ZMypDwjS3HUcPaS7N
 bZEVhIvYCpoQMWT8+MVXLcrV
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:00:53 -0700
IronPort-SDR: 3JFu3rzpO7lEo4R9wKNRsHVXYPewsY1YzFdn5fPi8WUGXTsDsL+AgCwj3MiynF+j271bBIYmqB
 e9KfLJVIrRR4f+KpJ3sRuozxBLbZpz0Rr27DsFVo1SeiWvw6b9j1apkuPsrohjbPcV7YIdPMYB
 Vv58MQOWpFbpVHniBGwTIpuYi3jyf8ANszIrKGv2Rl+xFO1NWX+D58ganTKbEUDc384Zma+EB4
 yK+CfegCwVE9KybhQTXqpbEhbXpPulBRxoIIG9TV84Kupjjx/DhIz6MLSlRJcJalzUgsGxttbJ
 iB8=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:20:52 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 16/42] hw/riscv: Enable VIRTIO_VGA for RISC-V virt machine
Date: Tue, 11 May 2021 20:19:25 +1000
Message-Id: <20210511101951.165287-17-alistair.francis@wdc.com>
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

imply VIRTIO_VGA for the virt machine, this fixes the following error
when specifying `-vga virtio` as a command line argument:

qemu-system-riscv64: Virtio VGA not available

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 7ac26fafee8bd59d2a0640f3233f8ad1ab270e1e.1617367317.git.alistair.francis@wdc.com
---
 hw/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index a0225716b5..86957ec7b0 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -32,6 +32,7 @@ config SHAKTI_C
 config RISCV_VIRT
     bool
     imply PCI_DEVICES
+    imply VIRTIO_VGA
     imply TEST_DEVICES
     select GOLDFISH_RTC
     select MSI_NONBROKEN
-- 
2.31.1



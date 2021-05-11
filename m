Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E7937A4CF
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:44:10 +0200 (CEST)
Received: from localhost ([::1]:33734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPs1-0007tD-Og
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPW8-0000xw-3C
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:21:32 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPW5-0006V6-BV
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:21:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728488; x=1652264488;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wAdLscB027NRqcQ0ba/KeWpvwnrXo8RKVmBCua1qbhw=;
 b=UnX+JeyxI18nEzAyh6YluSkHh443lmzUSILPZw4TsEd4ROotyDu8kWYL
 drJS+ge9DfBzyGbCl6zJ0hR7loIPWsTKvsCQeekyXYCFb6IaKPHcs5IaA
 79CmuqYWayy9wAVT+sVYa6vdflOeWENHuqTpPjSuTESWwMc5QstlfQxGL
 mFFpysZXrVYniWtANjnWUqmFiNxxoytD5yTEQVhSV0/4inC28qnGE4oOw
 98NCfdYrUmXkmZ0tR6rt+hdDGAYloj0SYn0Q4mDOGkUxqSH9X9y2rLjX7
 nV/0UBCQZKre0tr88m2W/gJhwRJRAdJGX3cdkFafNQ0Tq/bnVO6cye+il Q==;
IronPort-SDR: 88W68D1BtFr4wcFOAbc5Dr/2mjP0BHjWJNoeH1616qe2+sRxzJdReA6HCJxDjeKLorFxroV+R8
 joOYQQ/hPoudI61n1RTbuaxHL1niaWQoxPDbQpi5/F5M3URCVcYDjvk5R3qIvGE9Zo3wv+8Jdr
 0NJ4TuxpxMd1Tu4DQQq9EdVSRQjl5ZgQdP23HrlSCkJjaPkcCN2MjxGNMt/scXfcaAuVtMtUJB
 0wr5T23h3is7euacDOAqK+ffwBfh/tGqBL5sLrVkrC0TsP8ywbXkfv+HA69ILEGyihSR3eZ1MK
 X9Y=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735406"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:21:02 +0800
IronPort-SDR: Vp0DvXhLuZyGtghWltTHxKS6pfxzFXasRWPGET5rxEgbzMx6za9zj/6/1leQ/L5QruV8fGYqH0
 KzDLwSURaeO9xmAymX7SWCPVo3C1uOchIPiXV7g76+r6FTw3BYCFA/4PXbe18PxHxSkrnc9mIY
 HQeYmoPtmfMdB05kWcLNk20gRed/wNOWaqt4zgTQQRc+rRug93WmYoGgurr07ZsG91LgHlnrFg
 Gwi37qlkYM+vC1+bWn6BfGE7jpKvWoBUFV7uilcPj2hAeIvhJwks0dEo9UiJ1kpSWxTycCJgGP
 lW8/3tjIIWpf8sSVd5Oqi3z2
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:01:02 -0700
IronPort-SDR: MjSh96011M9ZMz8TVvDL9h/BnUbeQjMyiNVFjioaKaHpU5p4MhRebIBAv2YnK3vt/N1PJvUIL0
 U/0gFRF8WEIs+u8JTWEgOJDyf8Djza6kssUtIKTAUxOBde8OifcnzFz9cVADmgdOdjLpc/WEAO
 NOluKwZT+Y/bxqS6RA86TVpaIaBRsyLgix8utxk7u5fel4cKkVEDGTMHVkd5pMx3UGtiNQWu2j
 DF9rpIT1m1bwFKLiopl2IQgg0+0tCie2Yttmc09HKM6kRikO8f+t3xE9nNAvrFmREb3W93LC9T
 Gfg=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:21:01 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 19/42] docs: Add documentation for shakti_c machine
Date: Tue, 11 May 2021 20:19:28 +1000
Message-Id: <20210511101951.165287-20-alistair.francis@wdc.com>
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
Cc: Vijai Kumar K <vijai@behindbytes.com>, alistair23@gmail.com,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vijai Kumar K <vijai@behindbytes.com>

Add documentation for Shakti C reference platform.

Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210412174248.8668-1-vijai@behindbytes.com
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
[ Changes from Bin Meng:
 - Add missing TOC
 Message-id: 20210430070534.1487242-1-bmeng.cn@gmail.com
]
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/riscv/shakti-c.rst | 82 ++++++++++++++++++++++++++++++++++
 docs/system/target-riscv.rst   |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 docs/system/riscv/shakti-c.rst

diff --git a/docs/system/riscv/shakti-c.rst b/docs/system/riscv/shakti-c.rst
new file mode 100644
index 0000000000..a6035d42b0
--- /dev/null
+++ b/docs/system/riscv/shakti-c.rst
@@ -0,0 +1,82 @@
+Shakti C Reference Platform (``shakti_c``)
+==========================================
+
+Shakti C Reference Platform is a reference platform based on arty a7 100t
+for the Shakti SoC.
+
+Shakti SoC is a SoC based on the Shakti C-class processor core. Shakti C
+is a 64bit RV64GCSUN processor core.
+
+For more details on Shakti SoC, please see:
+https://gitlab.com/shaktiproject/cores/shakti-soc/-/blob/master/fpga/boards/artya7-100t/c-class/README.rst
+
+For more info on the Shakti C-class core, please see:
+https://c-class.readthedocs.io/en/latest/
+
+Supported devices
+-----------------
+
+The ``shakti_c`` machine supports the following devices:
+
+ * 1 C-class core
+ * Core Level Interruptor (CLINT)
+ * Platform-Level Interrupt Controller (PLIC)
+ * 1 UART
+
+Boot options
+------------
+
+The ``shakti_c`` machine can start using the standard -bios
+functionality for loading the baremetal application or opensbi.
+
+Boot the machine
+----------------
+
+Shakti SDK
+~~~~~~~~~~
+Shakti SDK can be used to generate the baremetal example UART applications.
+
+.. code-block:: bash
+
+   $ git clone https://gitlab.com/behindbytes/shakti-sdk.git
+   $ cd shakti-sdk
+   $ make software PROGRAM=loopback TARGET=artix7_100t
+
+Binary would be generated in:
+  software/examples/uart_applns/loopback/output/loopback.shakti
+
+You could also download the precompiled example applicatons using below
+commands.
+
+.. code-block:: bash
+
+   $ wget -c https://gitlab.com/behindbytes/shakti-binaries/-/raw/master/sdk/shakti_sdk_qemu.zip
+   $ unzip shakti_sdk_qemu.zip
+
+Then we can run the UART example using:
+
+.. code-block:: bash
+
+   $ qemu-system-riscv64 -M shakti_c -nographic \
+      -bios path/to/shakti_sdk_qemu/loopback.shakti
+
+OpenSBI
+~~~~~~~
+We can also run OpenSBI with Test Payload.
+
+.. code-block:: bash
+
+   $ git clone https://github.com/riscv/opensbi.git -b v0.9
+   $ cd opensbi
+   $ wget -c https://gitlab.com/behindbytes/shakti-binaries/-/raw/master/dts/shakti.dtb
+   $ export CROSS_COMPILE=riscv64-unknown-elf-
+   $ export FW_FDT_PATH=./shakti.dtb
+   $ make PLATFORM=generic
+
+fw_payload.elf would be generated in build/platform/generic/firmware/fw_payload.elf.
+Boot it using the below qemu command.
+
+.. code-block:: bash
+
+   $ qemu-system-riscv64 -M shakti_c -nographic \
+      -bios path/to/fw_payload.elf
diff --git a/docs/system/target-riscv.rst b/docs/system/target-riscv.rst
index 8d5946fbbb..4b3c78382c 100644
--- a/docs/system/target-riscv.rst
+++ b/docs/system/target-riscv.rst
@@ -67,6 +67,7 @@ undocumented; you can get a complete list by running
    :maxdepth: 1
 
    riscv/microchip-icicle-kit
+   riscv/shakti-c
    riscv/sifive_u
 
 RISC-V CPU features
-- 
2.31.1



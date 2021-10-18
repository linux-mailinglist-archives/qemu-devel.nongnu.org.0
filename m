Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A84AE431C4A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 15:38:52 +0200 (CEST)
Received: from localhost ([::1]:33840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcSqp-0005IG-QP
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 09:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mcSeg-0002uh-6a
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 09:26:19 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:55629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mcSec-0006BD-Qq
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 09:26:17 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.252])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 6D08AC5612F8;
 Mon, 18 Oct 2021 15:26:11 +0200 (CEST)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 18 Oct
 2021 15:26:10 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0012a4832d6-a55c-4b98-942b-0fdd0e9ce36f,
 F07B6F3C357710E32BAB16EB0BBFA04B60198819) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 0/5] aspeed/smc: Improve support for the alternate boot
 function
Date: Mon, 18 Oct 2021 15:26:04 +0200
Message-ID: <20211018132609.160008-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d9398f34-3763-46d6-b254-b05ae8708909
X-Ovh-Tracer-Id: 8499136925199272809
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvtddgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedvuedtvdeikeekuefhkedujeejgffggffhtefglefgveevfeeghfdvgedtleevnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

The Aspeed SoCs have a dual boot function for firmware fail-over
recovery. The system auto-reboots from the second flash if the main
flash does not boot successfully within a certain amount of time. This
function is called alternate boot (ABR) in the FMC controllers.

On the AST2600, the ABR registers controlling the 2nd watchdog timer
were moved from the watchdog register to the FMC controller. To
control WDT2 through the FMC model register set, this series creates a
local address space on top of WDT2 memory region.

To test on the fuji-bmc machine, run :

    devmem 0x1e620064
    devmem 0x1e78504C 

    devmem 0x1e620064 32 0xffffffff
    devmem 0x1e620064
    devmem 0x1e78504C
    
Thanks

C.

Changes since v2:

 - introduce a container region for the WDT2 register address space
 - introduce a container region for the flash mmio address space

Cédric Le Goater (5):
  aspeed/wdt: Introduce a container for the MMIO region
  aspeed: Initialize the watchdog device models before the FMC models
  aspeed/smc: Improve support for the alternate boot function
  aspeed/smc: Use a container for the flash mmio address space
  speed/sdhci: Add trace events

 include/hw/ssi/aspeed_smc.h      |  5 +-
 include/hw/watchdog/wdt_aspeed.h |  1 +
 hw/arm/aspeed_ast2600.c          | 38 +++++++-------
 hw/arm/aspeed_soc.c              | 36 ++++++-------
 hw/sd/aspeed_sdhci.c             |  5 ++
 hw/ssi/aspeed_smc.c              | 89 +++++++++++++++++++++++++++++---
 hw/watchdog/wdt_aspeed.c         |  6 ++-
 hw/sd/trace-events               |  4 ++
 hw/ssi/trace-events              |  1 +
 9 files changed, 141 insertions(+), 44 deletions(-)

-- 
2.31.1



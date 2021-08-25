Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700D83F75A0
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:09:45 +0200 (CEST)
Received: from localhost ([::1]:35024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIsf2-0007Dp-He
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chunming_li1234@163.com>)
 id 1mIoDN-000414-GW; Wed, 25 Aug 2021 04:24:53 -0400
Received: from m12-13.163.com ([220.181.12.13]:48192)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chunming_li1234@163.com>)
 id 1mIoDL-00042F-Ab; Wed, 25 Aug 2021 04:24:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=A4ons/D72mOTb9PTXT
 mdADsOkLkh1zX6jxX2rLQrLCA=; b=BJTOHhH2kwLYQHb9ZOg1EVq4HQ69QngDjE
 2ledAeLuyKCwe0nCYxiL9dre59E8AWRt7cI/0ZYPt1N+XK6AijWPPtG2gSY/WUlV
 JHkBs5TS7dfzMyx2EmM8ZR4dijQ4Fcr5Zhe+k734oGcY3j35E6UOc5atK0G9nmPq
 L7m9daH8w=
Received: from localhost.localdomain (unknown [180.169.130.89])
 by smtp9 (Coremail) with SMTP id DcCowABnCwWL+iVhtO7SAQ--.38418S3;
 Wed, 25 Aug 2021 16:08:50 +0800 (CST)
From: chunming <chunming_li1234@163.com>
To: eric.auger@redhat.com,
	peter.maydell@linaro.org
Subject: [PATCH v5 0/4] hw/arm/smmuv3: Support non PCI/PCIe devices
Date: Wed, 25 Aug 2021 16:08:38 +0800
Message-Id: <1629878922-173270-1-git-send-email-chunming_li1234@163.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: DcCowABnCwWL+iVhtO7SAQ--.38418S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw1DCr48Wr4kGryrAr15XFb_yoW8GrW8pF
 yYgrs8K39xCry3ur13Za1xWFZ8Ja93GFyqyrsrKrWfCr1DtFWUXr4Utw1rK3yUZFy8Zr47
 ZrW2qF1Sgw1UZw7anT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bOD73UUUUU=
X-Originating-IP: [180.169.130.89]
X-CM-SenderInfo: xfkx0zplqjszjlrsjki6rwjhhfrp/xtbBrRL5dl75bWj18AABsW
Received-SPF: pass client-ip=220.181.12.13;
 envelope-from=chunming_li1234@163.com; helo=m12-13.163.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 25 Aug 2021 09:00:24 -0400
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
Cc: renwei.liu@verisilicon.com, qemu-arm@nongnu.org,
 jianxian.wen@verisilicon.com, qemu-devel@nongnu.org,
 chunming <chunming.li@verisilicon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: chunming <chunming.li@verisilicon.com>

The current SMMU v3 model only support PCI/PCIe devices, so we update it for 
non-PCI/PCIe devices.
  . Add independent IOMMU memory regions for non-PCI/PCIe devices
  . Add SID value property setting for non-PCI/PCIe devices
  . Add PL330 DMA controller into "virt" machine and connect with SMMU v3
  . Test PL330 DMA controller and PCIe e1000 network with SMMU v3 enabled

Notes:
  You need apply PL330 memory region patch before compile "virt" machine:
  https://patchew.org/QEMU/4C23C17B8E87E74E906A25A3254A03F4FA1FEC31@SHASXM03.verisilicon.com/

  The old PL330 model cannot configure its memory region manually. 
  So we update it and provide path.
  The patch was reviewed and will be merged in target-arm.next for 6.2.


chunming (4):
  hw/arm/smmuv3: Support non PCI/PCIe device connect with SMMU v3
  hw/arm/smmuv3: Update implementation of CFGI commands based on device
    SID
  hw/arm/virt: Update SMMU v3 creation to support non PCI/PCIe device
    connection
  hw/arm/virt: Add PL330 DMA controller and connect with SMMU v3

 hw/arm/smmuv3.c              |  81 ++++++++++++++++++--------
 hw/arm/virt.c                | 108 ++++++++++++++++++++++++++++++++++-
 include/hw/arm/smmu-common.h |  12 +++-
 include/hw/arm/smmuv3.h      |   2 +
 include/hw/arm/virt.h        |   3 +
 5 files changed, 178 insertions(+), 28 deletions(-)

-- 
2.30.2




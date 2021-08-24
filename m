Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B18733F5E6E
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 14:56:54 +0200 (CEST)
Received: from localhost ([::1]:38454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIVz3-0003Wt-2p
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 08:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lik008@sina.com>) id 1mILqu-00007p-BT
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 22:07:48 -0400
Received: from mail115-100.sinamail.sina.com.cn ([218.30.115.100]:46022)
 by eggs.gnu.org with smtp (Exim 4.90_1)
 (envelope-from <lik008@sina.com>) id 1mILqo-0007fI-82
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 22:07:46 -0400
Received: from unknown (HELO CNCD0918-New.verisilicon.com)([139.204.140.40])
 by sina.com (10.69.2.194) with ESMTP
 id 6124520E0000705F; Tue, 24 Aug 2021 09:57:57 +0800 (CST)
X-Sender: lik008@sina.com
X-Auth-ID: lik008@sina.com
X-SMAIL-MID: 96359225954119
From: lik008@sina.com
To: eric.auger@redhat.com,
	peter.maydell@linaro.org
Subject: [PATCH v3 0/4] hw/arm/smmuv3: Support non PCI/PCIe devices
Date: Tue, 24 Aug 2021 09:57:30 +0800
Message-Id: <20210824015732.1810-1-lik008@sina.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=218.30.115.100; envelope-from=lik008@sina.com;
 helo=mail115-100.sinamail.sina.com.cn
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 24 Aug 2021 08:54:37 -0400
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
 LCM <chunming.li@verisilicon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: LCM <chunming.li@verisilicon.com>

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

LCM (4):
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




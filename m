Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28545547F76
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 08:23:12 +0200 (CEST)
Received: from localhost ([::1]:52774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0dTg-0002l1-Sx
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 02:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o0dOD-0000O9-Tb
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 02:17:35 -0400
Received: from mga03.intel.com ([134.134.136.65]:32799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o0dO7-0005Vh-Ce
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 02:17:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655101043; x=1686637043;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QrGvnJgzTKHVHNGhbBlk951DFZ4ayG6Kq4nk4HIMyS4=;
 b=ZwMDSl2GmVPVmhfbUNYF+xNHDuyAxlxyn2QOEBbOoEXFwbEgepP0yX0o
 1wlj50Ga16zeQwk1fYMJbjaNY8gdwpHjIWB+jDkEdz3K8cfC4SDYeFwUw
 vDEuTFWOmus0aFuaIgZAjgXIVciriXQ9WqVpEUPRIX3gW7N4FxBIcgWcj
 HnUEC0UEUzDYrEXPCUK59gNUyk7ZpOL1JYZcotM9c4sCWohNgBR8Twkqp
 5e67S5mfx/MdlDdbvZ53NjZTBrHQxeOCfyz++GCgpbKbc0DYOVJPJZcMK
 mamqb1jdb4OdoRBRzHjYfrDtIVLhEfQ+l/zZx1fDd2IrB4CzeouVNpNXo g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10376"; a="279229888"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="279229888"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2022 23:17:13 -0700
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="910205003"
Received: from duan-server-s2600bt.bj.intel.com ([10.240.192.123])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2022 23:17:11 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: eric.auger@redhat.com
Cc: qemu-devel@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 pbonzini@redhat.com, yu.c.zhang@intel.com, chuanxiao.dong@intel.com,
 tina.zhang@intel.com
Subject: [PATCH 0/3] Add bypass mode support to assigned device
Date: Mon, 13 Jun 2022 14:10:07 +0800
Message-Id: <20220613061010.2674054-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=zhenzhong.duan@intel.com; helo=mga03.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently virtio-iommu's logic to support bypass mode works only for
emulated device. For assigned device, no GPA -> HPA mapping is setup
in IOMMU page table.

Host report below error:
[3713481.750944] dmar_fault: 191 callbacks suppressed
[3713481.750953] DMAR: DRHD: handling fault status reg 302
[3713481.750962] DMAR: [DMA Read NO_PASID] Request device [2f:00.1] fault addr 0x7ebb0000 [fault reason 0x06] PTE Read access is not set
[3713481.751003] DMAR: DRHD: handling fault status reg 402
[3713481.751007] DMAR: [DMA Read NO_PASID] Request device [2f:00.1] fault addr 0x7ebb0000 [fault reason 0x06] PTE Read access is not set
[3713481.751023] DMAR: DRHD: handling fault status reg 502
[3713481.751026] DMAR: [DMA Write NO_PASID] Request device [2f:00.1] fault addr 0x7ebb0000 [fault reason 0x05] PTE Write access is not set
[3713481.751072] DMAR: DRHD: handling fault status reg 602

Guest kernel report below error:
[    3.461716] i40e: Intel(R) Ethernet Connection XL710 Network Driver
[    3.462605] i40e: Copyright (c) 2013 - 2019 Intel Corporation.
[    3.464630] i40e 0000:00:04.0: Adding to iommu group 5
[    3.482093] i40e 0000:00:04.0: fw 0.0.00000 api 0.0 nvm 0.00 0x176953ce 28.50.1 [8086:37d3] [8086:35d0]
[    3.484295] i40e 0000:00:04.0: eeprom check failed (-62), Tx/Rx traffic disabled
[    3.487268] i40e 0000:00:04.0: configure_lan_hmc failed: -49
[    3.489066] i40e: probe of 0000:00:04.0 failed with error -2

Fix it by adding switch beween bypass and iommu address space just like
the virtual VT-d implementation, so that in bypass mode, vfio mapping
is setup.

Tested with four combination of qemu's virtio-iommu.boot-bypass=true/false
with guest kernel's iommu=pt/nopt on x86_64 platform.

Zhenzhong Duan (3):
  virtio-iommu: Add bypass mode support to assigned device
  virtio-iommu: Use recursive lock to avoid deadlock
  virtio-iommu: Add an assert check in translate routine

 hw/virtio/trace-events           |   1 +
 hw/virtio/virtio-iommu.c         | 135 ++++++++++++++++++++++++++++---
 include/hw/virtio/virtio-iommu.h |   4 +-
 3 files changed, 130 insertions(+), 10 deletions(-)

-- 
2.25.1



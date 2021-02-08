Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 496933144E8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 01:28:48 +0100 (CET)
Received: from localhost ([::1]:40106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Gtb-0000VK-CS
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 19:28:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1l9GBP-0001DW-JW
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 18:43:07 -0500
Received: from mga06.intel.com ([134.134.136.31]:53603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1l9GBM-0002m2-RI
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 18:43:07 -0500
IronPort-SDR: zKaQV/sfAk5cdXpaNAVJObmsWs8et+oQnNtA19xJCxmcXlRA3QZZfRmKMVrUUErrrIBhK33NRY
 Lr3kMRRhaWrw==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="243298079"
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="243298079"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 15:42:59 -0800
IronPort-SDR: wc05qIErhe95OoW1OjerjNVKYpbVc1a9IvlRci1vqpYsJ00phFpTG6QP3h03KUBH2QkSNZ+OJP
 PsnazRwvYQKQ==
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="585858967"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 15:42:59 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC 0/1] vhost-vdmabuf: Add virtio based Dmabuf device
Date: Mon,  8 Feb 2021 15:32:24 -0800
Message-Id: <20210208233225.2084469-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=vivek.kasireddy@intel.com; helo=mga06.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>, kraxel@redhat.com,
 dongwon.kim@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Virtio based Dmabuf (Vdmabuf) device provides a way to transfer a
dmabuf created in the Guest to the Host. This patch is still a WIP but
is still posted to the ML to provide additional details and context for
the discussion associated with the vhost-vdmabuf and virtio-vdmabuf
kernel drivers here:

https://lists.linuxfoundation.org/pipermail/virtualization/2021-February/052233.html

Vivek Kasireddy (1):
  vhost-vdmabuf: Add virtio based Dmabuf device

 configure                                   |   8 +
 hw/virtio/meson.build                       |   1 +
 hw/virtio/vhost-backend.c                   |  10 +
 hw/virtio/vhost-vdmabuf.c                   | 526 ++++++++++++++++++++
 include/hw/pci/pci.h                        |   1 +
 include/hw/virtio/vhost-backend.h           |   2 +
 include/hw/virtio/vhost-vdmabuf.h           |  76 +++
 include/standard-headers/linux/virtio_ids.h |   1 +
 include/ui/console.h                        |   1 +
 linux-headers/linux/vhost.h                 |   3 +
 meson.build                                 |   1 +
 ui/console.c                                |   7 +
 12 files changed, 637 insertions(+)
 create mode 100644 hw/virtio/vhost-vdmabuf.c
 create mode 100644 include/hw/virtio/vhost-vdmabuf.h

-- 
2.26.2



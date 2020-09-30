Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9758A27F4CF
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Oct 2020 00:06:32 +0200 (CEST)
Received: from localhost ([::1]:44480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNkF5-00072M-LG
	for lists+qemu-devel@lfdr.de; Wed, 30 Sep 2020 18:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kNkD7-0005TO-I1; Wed, 30 Sep 2020 18:04:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:50502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kNkD4-0007vs-L2; Wed, 30 Sep 2020 18:04:29 -0400
Received: from dhcp-10-100-145-180.wdl.wdc.com (unknown [199.255.45.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 91F9D20C09;
 Wed, 30 Sep 2020 22:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601503465;
 bh=80ZjOCIc2WjjQPb7N7sA3OGjEt0PtsQvDwhUpEhRQ/I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UHKc6J6srpIuk+2aVNKF/fcY80JnrVdlyqvKfq5RV1HyF6ixsLXPCOMtgF0Ml8w34
 GqbkO82mpe9EizrE6BJAz2+/03/cRg/QkLyFbWRU3JYFb7+dW87PRTUBXcqXe0P3uq
 vo67wKPioyfv1DbGWRIk8AFW5LE2GCuCwc+Uagak=
From: Keith Busch <kbusch@kernel.org>
To: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH 5/9] hw/block/nvme: support for admin-only command set
Date: Wed, 30 Sep 2020 15:04:10 -0700
Message-Id: <20200930220414.562527-6-kbusch@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200930220414.562527-1-kbusch@kernel.org>
References: <20200930220414.562527-1-kbusch@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 18:04:21
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Niklas Cassel <Niklas.Cassel@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.c      | 1 +
 include/block/nvme.h | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 6c582e6874..ec7363ea40 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2755,6 +2755,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     NVME_CAP_SET_CQR(n->bar.cap, 1);
     NVME_CAP_SET_TO(n->bar.cap, 0xf);
     NVME_CAP_SET_CSS(n->bar.cap, NVME_CAP_CSS_NVM);
+    NVME_CAP_SET_CSS(n->bar.cap, NVME_CAP_CSS_ADMIN_ONLY);
     NVME_CAP_SET_MPSMAX(n->bar.cap, 4);
 
     n->bar.vs = NVME_SPEC_VER;
diff --git a/include/block/nvme.h b/include/block/nvme.h
index bc20a2ba5e..521533fd2a 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -83,7 +83,8 @@ enum NvmeCapMask {
                                                             << CAP_PMR_SHIFT)
 
 enum NvmeCapCss {
-    NVME_CAP_CSS_NVM = 1 << 0,
+    NVME_CAP_CSS_NVM        = 1 << 0,
+    NVME_CAP_CSS_ADMIN_ONLY = 1 << 7,
 };
 
 enum NvmeCcShift {
-- 
2.24.1



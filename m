Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9114EA864
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 09:16:42 +0200 (CEST)
Received: from localhost ([::1]:37810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ65p-0007RX-7J
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 03:16:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1nZ5yM-0003YD-JH
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 03:08:59 -0400
Received: from mga02.intel.com ([134.134.136.20]:60309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1nZ5yL-0001Pq-0v
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 03:08:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648537737; x=1680073737;
 h=from:to:cc:subject:date:message-id;
 bh=S7t0H8mFW4lvXP8sollcwDUOOlFva6ZkAuGtCmLT1YI=;
 b=gt1kvMAlQIYC+P4w+Au0A03TdWB/SDgt3aHw7G+X9cHGtealzHNQii1y
 tPLjLR8txr8ol1MkHxVLaX/f2nblAphOq9rcmYzP22dHh/rz3CY1oZalw
 6//dJFQ2p6VRJ9/pN9PgnqfA3ngz6qEy60M+9SweByILwXVWtCzFh3IQu
 DkNCgCYRAQHANXo2v8U7Nr+aEI3IN3q6lUEyrbwVyShO5IPynoLhIZg2P
 1mbAkMj4a7GJMuHxsJSJH6Pl1E5xU8Xz5ZR1Q3cEkL7kDbpOTQEQPZy5B
 foTZSl6b27mRoTicuYDUFLXc74pkbNueDxWqjJZlHF7E/CgAQSHZnQxdW A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="246669454"
X-IronPort-AV: E=Sophos;i="5.90,219,1643702400"; d="scan'208";a="246669454"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 00:07:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,219,1643702400"; d="scan'208";a="502789408"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by orsmga003.jf.intel.com with ESMTP; 29 Mar 2022 00:07:50 -0700
From: Robert Hoo <robert.hu@linux.intel.com>
To: xiaoguangrong.eric@gmail.com, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, qemu-devel@nongnu.org
Subject: [PATCH 0/2] Init vNVDIMM LSA if applicable
Date: Tue, 29 Mar 2022 15:07:41 +0800
Message-Id: <1648537663-126032-1-git-send-email-robert.hu@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=robert.hu@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: jingqi.liu@intel.com, dan.j.williams@intel.com,
 Robert Hoo <robert.hu@linux.intel.com>, robert.hu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU option "-device nvdimm,...,label-size=" designates a vNVDIMM with
Label Storage Area (LSA), where stores the namespace labels and conforms to
some format and rules defined by NVDIMM label protocol[1].

Recent guest Kernel, will by validating LSA to determine if the NVDIMM is
label-capable. So without initialization, guest Kernel will judge it
label-less, though it actually support label.

This patch set, is to init vNVDIMM's LSA, so that guest Kernel can
correctly identify and use it.

[1]:
https://uefi.org/sites/default/files/resources/ACPI_Spec_6_4_Jan22.pdf,
Section 13.19.

Robert Hoo (2):
  NVDIMM: rename NVDIMM::label_size to NVDIMM::lsa_size
  NVDIMM: Init vNVDIMM's LSA index block if it hasn't been

 docs/nvdimm.txt         |   4 +-
 hw/acpi/nvdimm.c        |  14 +-
 hw/mem/nvdimm.c         | 381 ++++++++++++++++++++++++++++++++++++++--
 include/hw/mem/nvdimm.h | 108 +++++++++++-
 4 files changed, 485 insertions(+), 22 deletions(-)


base-commit: 27fc9f365d6f60ff86c2e2be57289bb47a2be882
-- 
2.31.1



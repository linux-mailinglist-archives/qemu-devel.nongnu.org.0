Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 133A04FD1BA
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 09:00:45 +0200 (CEST)
Received: from localhost ([::1]:41686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neAW2-0005H9-5y
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 03:00:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1neATa-0004Zy-TV
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 02:58:11 -0400
Received: from mga09.intel.com ([134.134.136.24]:30151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1neATY-0002lx-1U
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 02:58:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649746688; x=1681282688;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gFGsPlFXxcmrpjPgg5f9Ip/4f4oh4MaDo2z4gPxqxio=;
 b=ckGT38WwfJFDapT5JPoEVYV1HC0EvEuG8oyuCVI/4XkWa5M0AzEuYWi7
 14iVLEbZ9Pk7uxUQ3JopooBDA8+Dj2xOeTPI8bWFLiY7UdTz4BFMI8Qnf
 8VWc5KZlekKz92+u+EMXcWZb9IHqgYKThaSBKzD7lBTkMXKHctDmQ2T9g
 VKw0J+p3kiV0akUsq+YVNKtIw0HqFa/0YelQtouP9KrwPeWVW0+f8a33d
 ARIZI5dKzhsO5gPNW8J0E+kdo13fEN/L7d5kdM0UpwhkC+W25h8ai0Qwt
 QJaFNZEu46R2AkADAkmzKMWvgQ5tuaCeA9XRixgJEx3f+c9PsyJgN7bgM Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="261731596"
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="261731596"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 23:58:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="660365017"
Received: from sqa-gate.sh.intel.com (HELO robert-clx2.tsp.org)
 ([10.239.48.212])
 by orsmga004.jf.intel.com with ESMTP; 11 Apr 2022 23:58:02 -0700
From: Robert Hoo <robert.hu@linux.intel.com>
To: xiaoguangrong.eric@gmail.com, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, qemu-devel@nongnu.org
Subject: [RESEND][PATCH 0/2] acpi/nvdimm: support NVDIMM _LS{I,R,W} methods
Date: Tue, 12 Apr 2022 14:57:51 +0800
Message-Id: <20220412065753.3216538-1-robert.hu@linux.intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=robert.hu@linux.intel.com; helo=mga09.intel.com
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

The original NVDIMM _DSM functions (index 4~6) for label operations have
been deprecated by new ACPI methods _LS{I,R,W}[1][2].

Patch 1 implements the new _LS{I,R,W} methods, on top of old _DSM
implementation.

Patch 2 fixes some typo of logical and/or with bitwise and/or, though
functionally they haven't causing trouble.

[1] https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/index.html, 6.5.10 NVDIMM Label Methods
[2] https://pmem.io/documents/IntelOptanePMem_DSM_Interface-V2.0.pdf, 3.10 Deprecated Functions

---
Resend for previous failed delivery to "qemu-devel@nongnu.org" due to
550-'Message headers fail syntax check'. 

Robert Hoo (2):
  acpi/nvdimm: Create _LS{I,R,W} method for NVDIMM device
  acpi/nvdimm: Fix aml_or() and aml_and() in if clause

 hw/acpi/nvdimm.c | 60 +++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 54 insertions(+), 6 deletions(-)


base-commit: 95a3fcc7487e5bef262e1f937ed8636986764c4e
-- 
2.31.1



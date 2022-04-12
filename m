Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4574FCF0D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 07:45:38 +0200 (CEST)
Received: from localhost ([::1]:56264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne9LM-00078i-H7
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 01:45:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1ne9IA-0005mQ-38
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 01:42:19 -0400
Received: from mga04.intel.com ([192.55.52.120]:46183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1ne9I6-0008P4-6W
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 01:42:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649742134; x=1681278134;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1G4SyKmE5/0HJHr91paCGC+D7UhtFNev2nN57FvQcPw=;
 b=MYZ+evxbRPLN/SYx+gaYiEJcfdqtJz+LWl4asgulr/2JMibdJKFwGzBN
 NGmwzurtm+QL773TmkHvHWngmtQTYJgrsnNyy/7rAwqaB+c1yOb+qgSSO
 Ytnt6cPFDxdnYmtmx1sV4HpGCMR1uvTowW5PL9lb4dc0Th+QQjMSOGWoG
 3exP3sY4pn9YnhXNk1cpNrHrYBXQNs8aLL3VE+1IA5LhdhuHRhlcglvd2
 VGqeFTFn8qPWtwI1CbjieHKzh4wzsEIz9GBhMbb8dc+MEgOafJYfXPsmz
 14ZjvBE4C30vG4o1o1U0j04BklXyEM59ZLsEKoLmmeYlFU3Sc1dVmqsH3 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="261129413"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="261129413"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 22:42:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="854212530"
Received: from sqa-gate.sh.intel.com (HELO robert-clx2.tsp.org)
 ([10.239.48.212])
 by fmsmga005.fm.intel.com with ESMTP; 11 Apr 2022 22:42:06 -0700
From: Robert Hoo <robert.hu@linux.intel.com>
To: xiaoguangrong.eric@gmail.com, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, qemu-devel@nongnu.org
Subject: [PATCH 0/2] acpi/nvdimm: support NVDIMM _LS{I,R,W} methods
Date: Tue, 12 Apr 2022 13:41:59 +0800
Message-Id: <20220412054201.3212090-1-robert.hu@linux.intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.120;
 envelope-from=robert.hu@linux.intel.com; helo=mga04.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

Robert Hoo (2):
  acpi/nvdimm: Create _LS{I,R,W} method for NVDIMM device
  acpi/nvdimm: Fix aml_or() and aml_and() in if clause

 hw/acpi/nvdimm.c | 60 +++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 54 insertions(+), 6 deletions(-)


base-commit: 95a3fcc7487e5bef262e1f937ed8636986764c4e
-- 
2.31.1



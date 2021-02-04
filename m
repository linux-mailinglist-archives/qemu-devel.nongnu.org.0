Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48ED330EDFE
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 09:07:57 +0100 (CET)
Received: from localhost ([::1]:57844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7ZgB-0001G2-PM
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 03:07:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1l7ZeJ-0008Tz-M6
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 03:05:59 -0500
Received: from mga05.intel.com ([192.55.52.43]:43412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1l7ZeH-0007VQ-CG
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 03:05:58 -0500
IronPort-SDR: 1sA82tzO6hftdVPwWQFAxMNXjP43TRY21Ua1pnbJZct5pYLWfwHkuoRaxB1ChHSu9XvbUaeUA6
 1s2zhsKzLeUQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="266025478"
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; d="scan'208";a="266025478"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 00:05:44 -0800
IronPort-SDR: bWyIdsW/xfU3zSm8GOf/yxDcdKOyk5Xw3vS69zbE7H8E3s86cZHZmASy2B5mBbnf1IwGzuTknw
 TDKPZ3k/31YA==
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; d="scan'208";a="372302423"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 00:05:44 -0800
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, imammedo@redhat.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com
Subject: [PATCH 0/4] ACPI related fixes
Date: Thu,  4 Feb 2021 00:04:07 -0800
Message-Id: <cover.1612424814.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=192.55.52.43;
 envelope-from=isaku.yamahata@intel.com; helo=mga05.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NML_ADSP_CUSTOM_MED=0.9,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

Miscellaneous bug fixes related to ACPI to play nice with guest BIOSes/OSes
by conforming to ACPI spec better.

Isaku Yamahata (3):
  acpi/core: always set SCI_EN when SMM isn't supported
  acpi: set fadt.smi_cmd to zero when SMM is not supported
  hw/i386: declare ACPI mother board resource for MMCONFIG region

Sean Christopherson (1):
  i386: acpi: Don't build HPET ACPI entry if HPET is disabled

 hw/acpi/core.c         |  11 ++-
 hw/acpi/ich9.c         |   2 +-
 hw/acpi/piix4.c        |   3 +-
 hw/i386/acpi-build.c   | 188 +++++++++++++++++++++++++++++++++++++++--
 hw/isa/vt82c686.c      |   2 +-
 include/hw/acpi/acpi.h |   4 +-
 6 files changed, 200 insertions(+), 10 deletions(-)

-- 
2.17.1



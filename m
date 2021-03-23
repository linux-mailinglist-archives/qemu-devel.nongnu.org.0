Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B90346A82
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 21:57:14 +0100 (CET)
Received: from localhost ([::1]:35126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOo5R-0003sW-5s
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 16:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lOo2t-0001pF-Dn
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:54:35 -0400
Received: from mga05.intel.com ([192.55.52.43]:57340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lOo2n-00008G-Qr
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:54:34 -0400
IronPort-SDR: xdsTDOY87kCE410MIco6+/zZ53GQhbHIqO+copR049AMP46i77DrkzKkXr/Tm5KKE3La+K7Txb
 5kiKtl46KDyg==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="275663661"
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="275663661"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 13:54:26 -0700
IronPort-SDR: FaBHLutJ4iDMyuabjwumf8H0ZO8Xz4lqNSLEgDwwpgSiDagYgGsBp2ok4p9F2vWG0OnVLej5pA
 +B3fvG/jDovg==
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="415156183"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 13:54:25 -0700
From: Isaku Yamahata <isaku.yamahata@intel.com>
To: qemu-devel@nongnu.org, mst@redhat.com, peter.maydell@linaro.org,
 imammedo@redhat.com, f4bug@amsat.org
Subject: [PATCH v3 0/4] Reinitialize ACPI PM device on reset
Date: Tue, 23 Mar 2021 13:52:23 -0700
Message-Id: <cover.1616532563.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43;
 envelope-from=isaku.yamahata@intel.com; helo=mga05.intel.com
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
Cc: isaku.yamahata@intel.com, isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reinitialize ACPI PM device on reset to get preper device state.
Oppertunistically add assert on PCI interrupt pin logic to detect device model
issues and workaround for found one.

Changes from v2:
- reorder patches
- split piix4 and v582c686 changes
- drop redundant assert in pcic

Changes from v1:
- bug work around hw/isa/vt82c686.c
- add assert in hw/pci/pci.c when setting/raising PCI interrupt

Isaku Yamahata (4):
  acpi/piix4: reinitialize acpi PM device on reset
  vt82c686.c: don't raise SCI when PCI_INTERRUPT_PIN isn't setup
  isa/v582c686: Reinitialize ACPI PM device on reset
  pci: sprinkle assert in PCI pin number

 hw/acpi/piix4.c   |  7 +++++++
 hw/isa/vt82c686.c | 18 +++++++++++++++++-
 hw/pci/pci.c      |  3 +++
 3 files changed, 27 insertions(+), 1 deletion(-)

-- 
2.25.1



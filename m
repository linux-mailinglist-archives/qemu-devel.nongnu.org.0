Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAF1346A8B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 21:59:47 +0100 (CET)
Received: from localhost ([::1]:45250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOo7u-0001oO-T5
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 16:59:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lOo2y-00024I-Id
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:54:40 -0400
Received: from mga11.intel.com ([192.55.52.93]:35899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lOo2w-00008L-R3
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:54:40 -0400
IronPort-SDR: LHyjM2WyfY7F5YZDCJgVxYdouFpnqgG0dnLyQUpApK7OlpKi3wjVZbBZo359RosXR51S0lNYxg
 NQ7dSuXd+lRQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="187248557"
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="187248557"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 13:54:28 -0700
IronPort-SDR: Kwld6cM6bqvSOx1gEjgGsaqpBU+YVakRrGJWOhK2NUT0nqYi++93uhyb54P7Ka+wFx34Nl75AY
 cNKbU6oLxm0A==
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="607869576"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 13:54:26 -0700
From: Isaku Yamahata <isaku.yamahata@intel.com>
To: qemu-devel@nongnu.org, mst@redhat.com, peter.maydell@linaro.org,
 imammedo@redhat.com, f4bug@amsat.org
Subject: [PATCH v3 3/4] isa/v582c686: Reinitialize ACPI PM device on reset
Date: Tue, 23 Mar 2021 13:52:26 -0700
Message-Id: <0a3fe998525552860919a690ce83dab8f663ab99.1616532563.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616532563.git.isaku.yamahata@intel.com>
References: <cover.1616532563.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93;
 envelope-from=isaku.yamahata@intel.com; helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Cc: isaku.yamahata@intel.com, Huacai Chen <chenhuacai@kernel.org>,
 isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 6be8cf56bc8b made sure that SCI is enabled in PM1.CNT
on reset in acpi_only mode by modifying acpi_pm1_cnt_reset() and
that worked for q35 as expected.

This patch adds reset ACPI PM related registers on vt82c686 reset time
and de-assert sci.
via_pm_realize() initializes acpi pm tmr, evt, cnt and gpe.
Reset them on device reset.

Cc: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 hw/isa/vt82c686.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index f0fb309f12..98325bb32b 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -178,6 +178,11 @@ static void via_pm_reset(DeviceState *d)
     /* SMBus IO base */
     pci_set_long(s->dev.config + 0x90, 1);
 
+    acpi_pm1_evt_reset(&s->ar);
+    acpi_pm1_cnt_reset(&s->ar);
+    acpi_pm_tmr_reset(&s->ar);
+    pm_update_sci(s);
+
     pm_io_space_update(s);
     smb_io_space_update(s);
 }
-- 
2.25.1



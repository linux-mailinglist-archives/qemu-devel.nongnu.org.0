Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C713467B1
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:33:25 +0100 (CET)
Received: from localhost ([::1]:34866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOlqG-0000Mr-M8
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lOknp-000485-O4
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:26:49 -0400
Received: from mga18.intel.com ([134.134.136.126]:35204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lOknn-0003iU-Fk
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:26:49 -0400
IronPort-SDR: w/iOpTsF4qtBgwVwRb+aQzw5jaWsCVWM1314JaTSZumbhRclP4V1m/Hu/NOc7Cp4yVYyY8Mf/+
 bx+KSeoDp09w==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="178093237"
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="178093237"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 10:26:37 -0700
IronPort-SDR: Pvlpk4uRKG75CcrVdQfYjX3DfhmwdQs/jpX+iRMRE+ryuDl5+qGz7adGTMYyODfrKQKnzTO+9G
 Y+zICt6QZTVQ==
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="607801297"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 10:26:36 -0700
From: Isaku Yamahata <isaku.yamahata@intel.com>
To: qemu-devel@nongnu.org, mst@redhat.com, peter.maydell@linaro.org,
 imammedo@redhat.com, f4bug@amsat.org
Subject: [PATCH v2 1/3] vt82c686.c: don't raise SCI when PCI_INTERRUPT_PIN
 isn't setup
Date: Tue, 23 Mar 2021 10:24:29 -0700
Message-Id: <00c07067c1c8700bea48407cbec6d854e87de742.1616519655.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616519655.git.isaku.yamahata@intel.com>
References: <cover.1616519655.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=isaku.yamahata@intel.com; helo=mga18.intel.com
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
Cc: isaku.yamahata@intel.com, Peter Maydell <Peter.maydel@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without this patch, the following patch will triger clan runtime
sanitizer warnings as follows. This patch proactively works around it.
I let v582c686.c maintainer address a correct fix as I'm not sure
about fuloong2e device model.

> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_IMG=./qemu-img
> G_TEST_DBUS_DAEMON=/home/petmay01/linaro/qemu-for-merges/tests/dbus-vmstate-daemon.sh
> QTEST_QEMU_BINARY=./qemu-system-mips64el tests/qtest/qom-test --tap -k
> PASS 1 qtest-mips64el/qom-test /mips64el/qom/loongson3-virt
> PASS 2 qtest-mips64el/qom-test /mips64el/qom/none
> PASS 3 qtest-mips64el/qom-test /mips64el/qom/magnum
> PASS 4 qtest-mips64el/qom-test /mips64el/qom/mipssim
> PASS 5 qtest-mips64el/qom-test /mips64el/qom/malta
> ../../hw/pci/pci.c:252:30: runtime error: shift exponent -1 is negative
> PASS 6 qtest-mips64el/qom-test /mips64el/qom/fuloong2e
> PASS 7 qtest-mips64el/qom-test /mips64el/qom/boston
> PASS 8 qtest-mips64el/qom-test /mips64el/qom/pica61
>
> and similarly for eg
>
> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_IMG=./qemu-img
> G_TEST_DBUS_DAEMON=/home/petmay01/linaro/qemu-for-merges/tests/dbus-vmstate-daemon.sh
> QTEST_QEMU_BINARY=./qemu-system-mips64el tests/qtest/endianness-test
> --tap -k
> ../../hw/pci/pci.c:252:30: runtime error: shift exponent -1 is negative
> PASS 1 qtest-mips64el/endianness-test /mips64el/endianness/fuloong2e
> ../../hw/pci/pci.c:252:30: runtime error: shift exponent -1 is negative
> PASS 2 qtest-mips64el/endianness-test /mips64el/endianness/split/fuloong2e
> ../../hw/pci/pci.c:252:30: runtime error: shift exponent -1 is negative
> PASS 3 qtest-mips64el/endianness-test /mips64el/endianness/combine/fuloong2e

Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reported-by: Peter Maydell <Peter.maydel@linaro.org>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 hw/isa/vt82c686.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 05d084f698..f0fb309f12 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -144,7 +144,18 @@ static void pm_update_sci(ViaPMState *s)
                    ACPI_BITMASK_POWER_BUTTON_ENABLE |
                    ACPI_BITMASK_GLOBAL_LOCK_ENABLE |
                    ACPI_BITMASK_TIMER_ENABLE)) != 0);
-    pci_set_irq(&s->dev, sci_level);
+    if (pci_get_byte(s->dev.config + PCI_INTERRUPT_PIN)) {
+        /*
+         * FIXME:
+         * Fix device model that realizes this PM device and remove
+         * this work around.
+         * The device model should wire SCI and setup
+         * PCI_INTERRUPT_PIN properly.
+         * If PIN# = 0(interrupt pin isn't used), don't raise SCI as
+         * work around.
+         */
+        pci_set_irq(&s->dev, sci_level);
+    }
     /* schedule a timer interruption if needed */
     acpi_pm_tmr_update(&s->ar, (s->ar.pm1.evt.en & ACPI_BITMASK_TIMER_ENABLE) &&
                        !(pmsts & ACPI_BITMASK_TIMER_STATUS));
-- 
2.25.1



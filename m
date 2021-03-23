Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB5C346A84
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 21:58:04 +0100 (CET)
Received: from localhost ([::1]:39450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOo6F-0006mV-Fn
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 16:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lOo2w-0001xG-EK
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:54:38 -0400
Received: from mga11.intel.com ([192.55.52.93]:35899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lOo2u-00008L-Ej
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:54:38 -0400
IronPort-SDR: +Dky8TxVKM5isR/GXfUvxF57PfnjpQjTg1n1KWgwHEzXx7S0oW8aPHzmTMKsu62Yf7wgSkGsoK
 I4uwMaZ7l07w==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="187248556"
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="187248556"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 13:54:28 -0700
IronPort-SDR: NpZ6QtKd4oIxPT6gIMler5CXZ5bweMMxxxjhOFvohhIuxeCkq4L9ZSEGqHrKMy56UyeRNkmEFM
 IDcZAC2CZX9w==
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="607869572"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 13:54:26 -0700
From: Isaku Yamahata <isaku.yamahata@intel.com>
To: qemu-devel@nongnu.org, mst@redhat.com, peter.maydell@linaro.org,
 imammedo@redhat.com, f4bug@amsat.org
Subject: [PATCH v3 2/4] vt82c686.c: don't raise SCI when PCI_INTERRUPT_PIN
 isn't setup
Date: Tue, 23 Mar 2021 13:52:25 -0700
Message-Id: <62a5fc69e453fb848bfd4794bae1852a75af73c5.1616532563.git.isaku.yamahata@intel.com>
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

Without this patch, the following patch will triger clan runtime
sanitizer warnings as follows. This patch proactively works around it.
I leave a correct fix to v582c686.c maintainerfix as I'm not sure
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

Cc: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reported-by: Peter Maydell <peter.maydell@linaro.org>
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



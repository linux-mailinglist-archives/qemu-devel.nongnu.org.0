Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5867E654DE4
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 09:52:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8dly-0007Sh-Hj; Fri, 23 Dec 2022 03:51:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1p8dle-0007LZ-9W; Fri, 23 Dec 2022 03:51:02 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1p8dlc-00046r-NI; Fri, 23 Dec 2022 03:51:02 -0500
Received: from localhost.localdomain
 (dynamic-095-118-065-151.95.118.pool.telefonica.de [95.118.65.151])
 by csgraf.de (Postfix) with ESMTPSA id 747226080975;
 Fri, 23 Dec 2022 09:50:49 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 Eric Auger <eric.auger@redhat.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/2] hw/intc/arm_gicv3: Bump ITT entry size to 16
Date: Fri, 23 Dec 2022 09:50:47 +0100
Message-Id: <20221223085047.94832-3-agraf@csgraf.de>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20221223085047.94832-1-agraf@csgraf.de>
References: <20221223085047.94832-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Some Operating Systems (like Windows) can only deal with ITT entry sizes
that are a power of 2. While the spec allows arbitrarily sized ITT entry
sizes, in practice all hardware will use power of 2 because that
simplifies offset calculation and ensures that a power of 2 sized region
can hold a set of entries without gap at the end.

So let's just bump the entry size to 16. That gives us enough space for
the 12 bytes of data that we want to have in each ITT entry and makes
QEMU look a bit more like real hardware.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 hw/core/machine.c       | 4 +++-
 hw/intc/arm_gicv3_its.c | 3 +--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index f589b92909..d9a3f01ed9 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -40,7 +40,9 @@
 #include "hw/virtio/virtio-pci.h"
 #include "qom/object_interfaces.h"
 
-GlobalProperty hw_compat_7_2[] = {};
+GlobalProperty hw_compat_7_2[] = {
+    { "arm-gicv3-its", "itt-entry-size", "12" },
+};
 const size_t hw_compat_7_2_len = G_N_ELEMENTS(hw_compat_7_2);
 
 GlobalProperty hw_compat_7_1[] = {
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index e7cabeb46c..6754523321 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -2014,8 +2014,7 @@ static void gicv3_its_post_load(GICv3ITSState *s)
 static Property gicv3_its_props[] = {
     DEFINE_PROP_LINK("parent-gicv3", GICv3ITSState, gicv3, "arm-gicv3",
                      GICv3State *),
-    DEFINE_PROP_UINT8("itt-entry-size", GICv3ITSState, itt_entry_size,
-                      MIN_ITS_ITT_ENTRY_SIZE),
+    DEFINE_PROP_UINT8("itt-entry-size", GICv3ITSState, itt_entry_size, 16),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.37.1 (Apple Git-137.1)



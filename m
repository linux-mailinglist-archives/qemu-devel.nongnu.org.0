Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C8B575230
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 17:49:17 +0200 (CEST)
Received: from localhost ([::1]:39236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC15Y-0003LJ-E4
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 11:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC11f-0005FC-N9; Thu, 14 Jul 2022 11:45:17 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:34941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC11d-0000WH-6k; Thu, 14 Jul 2022 11:45:14 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LkJj25W9fz4xj5;
 Fri, 15 Jul 2022 01:45:10 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LkJj05R6Gz4yTH;
 Fri, 15 Jul 2022 01:45:08 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Delevoryas <pdel@fb.com>,
 Titus Rwantare <titusr@google.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 03/19] hw/sensor: Add IC_DEVICE_ID to ISL voltage regulators
Date: Thu, 14 Jul 2022 17:44:40 +0200
Message-Id: <20220714154456.2565189-4-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220714154456.2565189-1-clg@kaod.org>
References: <20220714154456.2565189-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=QWOl=XT=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Delevoryas <pdel@fb.com>

This commit adds a passthrough for PMBUS_IC_DEVICE_ID to allow Renesas
voltage regulators to return the integrated circuit device ID if they
would like to.

The behavior is very device specific, so it hasn't been added to the
general PMBUS model. Additionally, if the device ID hasn't been set,
then the voltage regulator will respond with the error byte value.  The
guest error message will change slightly for IC_DEVICE_ID with this
commit.

Signed-off-by: Peter Delevoryas <pdel@fb.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
Message-Id: <20220701000626.77395-3-me@pjd.dev>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/sensor/isl_pmbus_vr.h |  5 +++++
 hw/sensor/isl_pmbus_vr.c         | 12 ++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/hw/sensor/isl_pmbus_vr.h b/include/hw/sensor/isl_pmbus_vr.h
index 3e47ff7e48d8..aa2c2767df90 100644
--- a/include/hw/sensor/isl_pmbus_vr.h
+++ b/include/hw/sensor/isl_pmbus_vr.h
@@ -12,12 +12,17 @@
 #include "hw/i2c/pmbus_device.h"
 #include "qom/object.h"
 
+#define TYPE_ISL69259   "isl69259"
 #define TYPE_ISL69260   "isl69260"
 #define TYPE_RAA228000  "raa228000"
 #define TYPE_RAA229004  "raa229004"
+#define ISL_MAX_IC_DEVICE_ID_LEN 16
 
 struct ISLState {
     PMBusDevice parent;
+
+    uint8_t ic_device_id[ISL_MAX_IC_DEVICE_ID_LEN];
+    uint8_t ic_device_id_len;
 };
 
 OBJECT_DECLARE_SIMPLE_TYPE(ISLState, ISL69260)
diff --git a/hw/sensor/isl_pmbus_vr.c b/hw/sensor/isl_pmbus_vr.c
index e11e0288840d..799ea9d89edb 100644
--- a/hw/sensor/isl_pmbus_vr.c
+++ b/hw/sensor/isl_pmbus_vr.c
@@ -15,6 +15,18 @@
 
 static uint8_t isl_pmbus_vr_read_byte(PMBusDevice *pmdev)
 {
+    ISLState *s = ISL69260(pmdev);
+
+    switch (pmdev->code) {
+    case PMBUS_IC_DEVICE_ID:
+        if (!s->ic_device_id_len) {
+            break;
+        }
+        pmbus_send(pmdev, s->ic_device_id, s->ic_device_id_len);
+        pmbus_idle(pmdev);
+        return 0;
+    }
+
     qemu_log_mask(LOG_GUEST_ERROR,
                   "%s: reading from unsupported register: 0x%02x\n",
                   __func__, pmdev->code);
-- 
2.35.3



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 615BF4021BD
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 03:03:31 +0200 (CEST)
Received: from localhost ([::1]:51372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNPWM-00037v-Dy
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 21:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mNPHp-0002dQ-26; Mon, 06 Sep 2021 20:48:29 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:45732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mNPHm-0003vt-A8; Mon, 06 Sep 2021 20:48:28 -0400
Received: by mail-qv1-xf34.google.com with SMTP id bn14so4840661qvb.12;
 Mon, 06 Sep 2021 17:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EgW8Hbfj94ViuTMJoNQ2Pnl4i/3lLVhvBSmCDF91yq0=;
 b=RlD41plFhfA9CX19r0GM1Iy+T5iak2rBViZjVXCc9yIW59E4+AHIRhREduODI1BS5a
 UW+G4yJZcCnhuTv7G7Zsb13xRZl+FyknSkQM+8EkBBjwh6x8E5g42d+5C9kHfVYMk715
 F0/y75gAW1LJg4cpF5CgA34G7KYJhp/br3tMCYffKNbT/LfGQ+d98Z60wpXe1+VArvT2
 UIna42v1qQvxklWS8RXwxHU8Ga4oIPxpnIU0D4CcvDRp3qa3LihSbcdyROmpp6jWLE90
 SZqbs7oXgeDejgUVKdrfIjhMG7Eg26SVo+lLOZO4jHLPLMPScHk3UAtoAltMFShhIIx6
 3RGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EgW8Hbfj94ViuTMJoNQ2Pnl4i/3lLVhvBSmCDF91yq0=;
 b=arnyZPo5BfnDzH4gnllQJpUItf48AzHRqTLIz9pcuw8dP9NYYN2JLqx6simL7feWoR
 BRIh7LhyNvfrly6MrZB46CWjrqwG4HVOU2OHUmNBm+ZM+opaZ4RgLDT0nwPmUoiSukS0
 PGfCUSEbQ2MsC3YVdplyZCIhvVcekt+tDboVbcZD04I2Ga1wywQ/e5Kn0G8ic/b2YqFT
 1Jblg7ck+AubAR7CRK6Kb4i8sLi2pjkkj7iusCvZ75rnKEL8hgxbq5mYtgqBs8ctOiCx
 UlNpftp6d5XsNZtPz0m5t6d3/UmtQ0wUsWLF+ZgALvCV5eAnkpa7QUJUgnX59KmH5d7S
 TPVw==
X-Gm-Message-State: AOAM531GoX1v0U8z65BV/mELseZvC0PxAtHWWJA6bHnWcU9w8NQOEoss
 4wL7BN9oXyyE9iv+3g/geDSYaZzf5RE=
X-Google-Smtp-Source: ABdhPJxG8d6YZuEIb88pWdb/LMaJ+MZpBFCA0Rk/equG+1MabnuQkZL0+VoQbvUg31WE24mTaCqmCw==
X-Received: by 2002:ad4:46f0:: with SMTP id h16mr14666084qvw.0.1630975704660; 
 Mon, 06 Sep 2021 17:48:24 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.136.122])
 by smtp.gmail.com with ESMTPSA id x83sm7799538qkb.118.2021.09.06.17.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 17:48:24 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 7/7] memory_hotplug.c: send DEVICE_UNPLUG_GUEST_ERROR in
 acpi_memory_hotplug_write()
Date: Mon,  6 Sep 2021 21:47:55 -0300
Message-Id: <20210907004755.424931-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907004755.424931-1-danielhb413@gmail.com>
References: <20210907004755.424931-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf34.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, groug@kaod.org,
 Markus Armbruster <armbru@redhat.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MEM_UNPLUG_ERROR is deprecated since the introduction of
DEVICE_UNPLUG_GUEST_ERROR. Keep emitting both while the deprecation of
MEM_UNPLUG_ERROR is pending.

CC: Michael S. Tsirkin <mst@redhat.com>
CC: Igor Mammedov <imammedo@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/acpi/memory_hotplug.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index 6a71de408b..d0fffcf787 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -8,6 +8,7 @@
 #include "qapi/error.h"
 #include "qapi/qapi-events-acpi.h"
 #include "qapi/qapi-events-machine.h"
+#include "qapi/qapi-events-qdev.h"
 
 #define MEMORY_SLOTS_NUMBER          "MDNR"
 #define MEMORY_HOTPLUG_IO_REGION     "HPMR"
@@ -178,8 +179,16 @@ static void acpi_memory_hotplug_write(void *opaque, hwaddr addr, uint64_t data,
             hotplug_handler_unplug(hotplug_ctrl, dev, &local_err);
             if (local_err) {
                 trace_mhp_acpi_pc_dimm_delete_failed(mem_st->selector);
+
+                /*
+                 * Send both MEM_UNPLUG_ERROR and DEVICE_UNPLUG_GUEST_ERROR
+                 * while the deprecation of MEM_UNPLUG_ERROR is
+                 * pending.
+                 */
                 qapi_event_send_mem_unplug_error(dev->id ? : "",
                                                  error_get_pretty(local_err));
+                qapi_event_send_device_unplug_guest_error(!!dev->id, dev->id,
+                                                          dev->canonical_path);
                 error_free(local_err);
                 break;
             }
-- 
2.31.1



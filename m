Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C80A69976D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:30:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSfGL-0006Ca-If; Thu, 16 Feb 2023 09:29:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSfGH-0006BH-V7
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:29:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSfGF-00018I-8O
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:29:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676557761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=NuGcz7UvG3kUxfW3zrHa2a+zSs661yz2THSIVxkHVFY=;
 b=GUZEs7p2hN/2UpvLgGFN1W9NyhCp2NXeHY3TToAmg+/uWSx6VLdP+9ctvCNAV6q5pvxmmc
 jHhdKwmavTU7ILDq6zVhCShUh288orSkv9xKgmegHTJQ7UCqEVZ+hTw1nRC5/BMparzaug
 4RvdHuR8wfaQcp4HLNZpw8NzvC4i7BU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-284-Q7MNVhiIPF-y_sz2bg9dMg-1; Thu, 16 Feb 2023 09:29:18 -0500
X-MC-Unique: Q7MNVhiIPF-y_sz2bg9dMg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E14221C09048;
 Thu, 16 Feb 2023 14:29:17 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A0752026D4B;
 Thu, 16 Feb 2023 14:29:17 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2] Do not include hw/hw.h if it is not necessary
Date: Thu, 16 Feb 2023 15:29:15 +0100
Message-Id: <20230216142915.304481-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

hw.h only contains the protoype of one function nowadays, hw_error(),
so all files that do not use this function anymore also do not need
to include this header anymore.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2:
 - Add .c files, too (thanks to Philippe for the hint)
 - Changed the subject of the patch (was: "Do not include hw.h from headers")

 include/hw/ssi/ibex_spi_host.h          | 1 -
 include/hw/tricore/tricore_testdevice.h | 1 -
 hw/pci-host/mv64361.c                   | 1 -
 hw/ppc/pegasos2.c                       | 1 -
 hw/sensor/dps310.c                      | 1 -
 5 files changed, 5 deletions(-)

diff --git a/include/hw/ssi/ibex_spi_host.h b/include/hw/ssi/ibex_spi_host.h
index 8089cc1c31..5bd5557b9a 100644
--- a/include/hw/ssi/ibex_spi_host.h
+++ b/include/hw/ssi/ibex_spi_host.h
@@ -28,7 +28,6 @@
 #define IBEX_SPI_HOST_H
 
 #include "hw/sysbus.h"
-#include "hw/hw.h"
 #include "hw/ssi/ssi.h"
 #include "qemu/fifo8.h"
 #include "qom/object.h"
diff --git a/include/hw/tricore/tricore_testdevice.h b/include/hw/tricore/tricore_testdevice.h
index 1e2b8942ac..8b4fe15f24 100644
--- a/include/hw/tricore/tricore_testdevice.h
+++ b/include/hw/tricore/tricore_testdevice.h
@@ -19,7 +19,6 @@
 #define HW_TRICORE_TESTDEVICE_H
 
 #include "hw/sysbus.h"
-#include "hw/hw.h"
 
 #define TYPE_TRICORE_TESTDEVICE "tricore_testdevice"
 #define TRICORE_TESTDEVICE(obj) \
diff --git a/hw/pci-host/mv64361.c b/hw/pci-host/mv64361.c
index f43f33fbd9..298564f1f5 100644
--- a/hw/pci-host/mv64361.c
+++ b/hw/pci-host/mv64361.c
@@ -11,7 +11,6 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
-#include "hw/hw.h"
 #include "hw/sysbus.h"
 #include "hw/pci/pci_device.h"
 #include "hw/pci/pci_host.h"
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index a9563f4fb2..7cc375df05 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -10,7 +10,6 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
-#include "hw/hw.h"
 #include "hw/ppc/ppc.h"
 #include "hw/sysbus.h"
 #include "hw/pci/pci_host.h"
diff --git a/hw/sensor/dps310.c b/hw/sensor/dps310.c
index d60a18ac41..addee99b19 100644
--- a/hw/sensor/dps310.c
+++ b/hw/sensor/dps310.c
@@ -9,7 +9,6 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
-#include "hw/hw.h"
 #include "hw/i2c/i2c.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
-- 
2.31.1



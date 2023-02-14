Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3FB69624F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 12:23:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRtNz-0007DV-UX; Tue, 14 Feb 2023 06:22:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRtNy-0007Cp-3f
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:22:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRtNw-0002Kb-KS
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:22:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676373727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QrRtWePS7b0xMP3zFwMNJl7ZLRWjh+FljSDiz8DP5/w=;
 b=TZLi7oa1MyXRI6kOKFEYVkcUhZwqx27fDgIRicUsECH5pyx/6h6LhTfsun8OsCP+amuZ9N
 Nt5x3QAowKZSGjvwz1E1lb1gNy9jlt1TFZ4aKIq2oDXJaC4on+O9DPCQVMtUb85z5i1CcS
 m1GUkk32q4o/IUek1ZSg3bo39uZNnaI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-NCR_LoHbOae4yOP5J6uuTQ-1; Tue, 14 Feb 2023 06:22:01 -0500
X-MC-Unique: NCR_LoHbOae4yOP5J6uuTQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 722C61C06ECA;
 Tue, 14 Feb 2023 11:22:00 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23E8240CE2A7;
 Tue, 14 Feb 2023 11:21:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 07/22] include/hw: Do not include "hw/registerfields.h" in
 headers that don't need it
Date: Tue, 14 Feb 2023 12:21:33 +0100
Message-Id: <20230214112148.646077-8-thuth@redhat.com>
In-Reply-To: <20230214112148.646077-1-thuth@redhat.com>
References: <20230214112148.646077-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Include "hw/registerfields.h" in the .c files instead (if needed).

Message-Id: <20230210112315.1116966-1-thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/arm/smmuv3.h        | 1 -
 include/hw/char/ibex_uart.h    | 1 -
 include/hw/ssi/ibex_spi_host.h | 1 -
 hw/char/ibex_uart.c            | 1 +
 hw/ssi/ibex_spi_host.c         | 1 +
 5 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
index f1921fdf9e..b6dd087526 100644
--- a/include/hw/arm/smmuv3.h
+++ b/include/hw/arm/smmuv3.h
@@ -20,7 +20,6 @@
 #define HW_ARM_SMMUV3_H
 
 #include "hw/arm/smmu-common.h"
-#include "hw/registerfields.h"
 #include "qom/object.h"
 
 #define TYPE_SMMUV3_IOMMU_MEMORY_REGION "smmuv3-iommu-memory-region"
diff --git a/include/hw/char/ibex_uart.h b/include/hw/char/ibex_uart.h
index a39985516a..9deadf223b 100644
--- a/include/hw/char/ibex_uart.h
+++ b/include/hw/char/ibex_uart.h
@@ -26,7 +26,6 @@
 #define HW_IBEX_UART_H
 
 #include "hw/sysbus.h"
-#include "hw/registerfields.h"
 #include "chardev/char-fe.h"
 #include "qemu/timer.h"
 #include "qom/object.h"
diff --git a/include/hw/ssi/ibex_spi_host.h b/include/hw/ssi/ibex_spi_host.h
index 1f6d077766..8089cc1c31 100644
--- a/include/hw/ssi/ibex_spi_host.h
+++ b/include/hw/ssi/ibex_spi_host.h
@@ -32,7 +32,6 @@
 #include "hw/ssi/ssi.h"
 #include "qemu/fifo8.h"
 #include "qom/object.h"
-#include "hw/registerfields.h"
 #include "qemu/timer.h"
 
 #define TYPE_IBEX_SPI_HOST "ibex-spi"
diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
index e58181fcf4..f70adb5308 100644
--- a/hw/char/ibex_uart.c
+++ b/hw/char/ibex_uart.c
@@ -31,6 +31,7 @@
 #include "hw/qdev-clock.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
+#include "hw/registerfields.h"
 #include "migration/vmstate.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
index 57df462e3c..1ee7d88c22 100644
--- a/hw/ssi/ibex_spi_host.c
+++ b/hw/ssi/ibex_spi_host.c
@@ -26,6 +26,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "hw/registerfields.h"
 #include "hw/ssi/ibex_spi_host.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
-- 
2.31.1



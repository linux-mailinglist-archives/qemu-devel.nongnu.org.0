Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F244C481760
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 23:54:40 +0100 (CET)
Received: from localhost ([::1]:43240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2hqC-0006XI-2b
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 17:54:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2hnv-0004S8-DK
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 17:52:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2hns-0000QW-W8
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 17:52:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640818336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e5+ddy+WSkN1x0e4CgeIS+1g9hRe1FYGtrRjE7UXe3I=;
 b=Yig5lCIO8xeOWiVphT+lMWlauP14mmtRQ0FREklZuTm3rR4j6ADAWAUP7okqZT2y33FDNm
 H5jYeV09QwQZWq0o6yw5UnG/aKe2pZzkohNrhT8wZpavK6YShTJF0Kq/d3QG0IpgUKTqpm
 FFhaFhkSzoz8nrAFX9gUiRnH10WGPJk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-BCPHrGTNPrabjLXn6erLpQ-1; Wed, 29 Dec 2021 17:52:15 -0500
X-MC-Unique: BCPHrGTNPrabjLXn6erLpQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 p1-20020adfba81000000b001a25b07ff53so5443786wrg.22
 for <qemu-devel@nongnu.org>; Wed, 29 Dec 2021 14:52:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e5+ddy+WSkN1x0e4CgeIS+1g9hRe1FYGtrRjE7UXe3I=;
 b=rxZkUGiTY3PIZ5mHLXCkpfPouavHE4XIe5/i4TN/FNqQ4FJsmHqk0B0ev77CUb5H4w
 syn2pj19gbTpfgepRqz4zG7tpOQeONeR6wIs+Prmk/9ZsamnxNIM6V4LXZ6EDxhQlvdw
 +nRRpq0ZG/WDrClSD2BUOL7XTVFD38C8/XlhJ44Nxt9xIGQGzn0TQOuhNp6BOYVd43jP
 2QBn+FMxbcImQXFVoWgYUJ3dQfN3xHyZby4uZXGwgKEw8u3IF/KZi3xQQDeTYHNvzdvA
 1pYGNOvGQTkugZtROxaxW9UzWNb6qcWjZV9ngM7TPD6PbGukv2xoCeOHn9RbuMVyP/XV
 GPQQ==
X-Gm-Message-State: AOAM530ml8ekgmyP1HZGuYM7t/TMX2UVFpqKkWDuO6/qshTuLgqz4aLt
 5u6PXdqNcY30ANPbvo/1oSSvhV3n3bSq6gB+WdMvVRYDKUphWFskLC9Pek0sIkpr9MC84JUjYKB
 bA5N34pbL8O1dE6blXDaxZOsGqVo44oPNHoyuUI5EADDHN+TlZCrvSzn/+pmWuwTe
X-Received: by 2002:a7b:c30e:: with SMTP id k14mr23423874wmj.156.1640818333514; 
 Wed, 29 Dec 2021 14:52:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGgAj5wI9V2CIC5uSc/9zp/z8ESmizqvkVWkzXGtpfuURnXDCNlDWP97EWJdLWZ6dxdSjIfg==
X-Received: by 2002:a7b:c30e:: with SMTP id k14mr23423858wmj.156.1640818333323; 
 Wed, 29 Dec 2021 14:52:13 -0800 (PST)
Received: from x1w.. (26.red-83-50-86.dynamicip.rima-tde.net. [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id y3sm21962630wrq.12.2021.12.29.14.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 14:52:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/qdev: Restrict qdev_get_gpio_out_connector() to
 qdev-internal.h
Date: Wed, 29 Dec 2021 23:52:04 +0100
Message-Id: <20211229225206.171882-2-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211229225206.171882-1-philmd@redhat.com>
References: <20211229225206.171882-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qdev_get_gpio_out_connector() is called by sysbus_get_connected_irq()
which is only used by platform-bus.c; restrict it to hw/core/ by
adding a local "qdev-internal.h" header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/core/qdev-internal.h | 15 +++++++++++++++
 include/hw/qdev-core.h  | 18 ------------------
 hw/core/gpio.c          |  1 +
 hw/core/sysbus.c        |  1 +
 4 files changed, 17 insertions(+), 18 deletions(-)
 create mode 100644 hw/core/qdev-internal.h

diff --git a/hw/core/qdev-internal.h b/hw/core/qdev-internal.h
new file mode 100644
index 00000000000..6ec17d0ea70
--- /dev/null
+++ b/hw/core/qdev-internal.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * qdev internal helpers
+ *
+ * Copyright (c) 2009-2021 QEMU contributors
+ */
+#ifndef HW_CORE_QDEV_INTERNAL_H
+#define HW_CORE_QDEV_INTERNAL_H
+
+#include "hw/qdev-core.h"
+
+/* Following functions are only used by the platform-bus subsystem */
+qemu_irq qdev_get_gpio_out_connector(DeviceState *dev, const char *name, int n);
+
+#endif /* HW_CORE_QDEV_INTERNAL_H */
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index d19c9417520..655899654bb 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -532,24 +532,6 @@ void qdev_connect_gpio_out(DeviceState *dev, int n, qemu_irq pin);
 void qdev_connect_gpio_out_named(DeviceState *dev, const char *name, int n,
                                  qemu_irq input_pin);
 
-/**
- * qdev_get_gpio_out_connector: Get the qemu_irq connected to an output GPIO
- * @dev: Device whose output GPIO we are interested in
- * @name: Name of the output GPIO array
- * @n: Number of the output GPIO line within that array
- *
- * Returns whatever qemu_irq is currently connected to the specified
- * output GPIO line of @dev. This will be NULL if the output GPIO line
- * has never been wired up to the anything.  Note that the qemu_irq
- * returned does not belong to @dev -- it will be the input GPIO or
- * IRQ of whichever device the board code has connected up to @dev's
- * output GPIO.
- *
- * You probably don't need to use this function -- it is used only
- * by the platform-bus subsystem.
- */
-qemu_irq qdev_get_gpio_out_connector(DeviceState *dev, const char *name, int n);
-
 /**
  * qdev_intercept_gpio_out: Intercept an existing GPIO connection
  * @dev: Device to intercept the outbound GPIO line from
diff --git a/hw/core/gpio.c b/hw/core/gpio.c
index 80d07a6ec99..513ccbd1062 100644
--- a/hw/core/gpio.c
+++ b/hw/core/gpio.c
@@ -21,6 +21,7 @@
 #include "hw/qdev-core.h"
 #include "hw/irq.h"
 #include "qapi/error.h"
+#include "qdev-internal.h"
 
 static NamedGPIOList *qdev_get_named_gpio_list(DeviceState *dev,
                                                const char *name)
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 05c1da3d311..0e6773c8df7 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -23,6 +23,7 @@
 #include "hw/sysbus.h"
 #include "monitor/monitor.h"
 #include "exec/address-spaces.h"
+#include "qdev-internal.h"
 
 static void sysbus_dev_print(Monitor *mon, DeviceState *dev, int indent);
 static char *sysbus_get_fw_dev_path(DeviceState *dev);
-- 
2.33.1



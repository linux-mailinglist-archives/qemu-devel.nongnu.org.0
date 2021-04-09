Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3381359578
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 08:28:25 +0200 (CEST)
Received: from localhost ([::1]:34468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUkcy-0007el-Ly
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 02:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUkZX-0004me-CK; Fri, 09 Apr 2021 02:24:51 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:44935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUkZT-0001hJ-PY; Fri, 09 Apr 2021 02:24:50 -0400
Received: by mail-ej1-x62d.google.com with SMTP id e14so6828213ejz.11;
 Thu, 08 Apr 2021 23:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nDFbUJf+zSiSog/LYin0LAf7wyvK1G5JKV9wmLaTU9M=;
 b=uuS4Pk/VAJDOp6Pwxln8iW/mJ4KnaTDRn50NXb+1N5XW12GifvULQ/vjj0op//bMN7
 LkAj7c+hNguynBubJgAGCMtSqcXeqwzU8Lmv/GvTxql7KWHFodLx6pLXHBGM2+1PPuZR
 bfp/fDE5JrTqZ4cznaVDktC2aFy763BbFLvHcOWIMY29k+RvphJ3OEO5fDrfUJsvmMHm
 /I/IlUxBd8J6ts3c2rxPitHPTCXyogm2DpZ7HKnnQpI9PT1iI/T9d+iwsFtWI9bdU5aV
 0kDhAi9dMXLgqAFr03CWuSNjEy2us7nTo42cd+/iYlWT/3AD2MVabsaqyxhyxKfeKB/w
 714Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nDFbUJf+zSiSog/LYin0LAf7wyvK1G5JKV9wmLaTU9M=;
 b=PqQYJzJnhidbsAxLEU+0f3LK/MDUTk1VE/xCX+PM0lhIL+5roZZT4vgsPZHTxup+m+
 FBbZEkoMoGE1841F0eos7G5vncCKCh26S5kFzhZ4VWAtwPz22EnsRp4VvZ3uID5tAUnP
 VJ+Dk34sVS0WkGLvK3GO7tI1fejtkWEXCtwdJ//W0fG+AXGk+tErhM+9ApRlSJTESQtz
 q3MKMIZ0SP3AA17DKdzUq3PvyAnawQOoQxnkq3NI18fvgHE51sl5q0TAVk9egNLuV30h
 BbtFbGtLpYQ8e0hVVvrmWa3FtJoIcfxw1z3dIXJ5QnsWQ6q5jOHw/fPFBbr5VQTgUqZy
 o5VQ==
X-Gm-Message-State: AOAM53053BwLNk2dwH8ZXyASsjZzDwcmH1nUuxJzaOX2hXCDjEB9ncVr
 Hewi1oqQiRZkrHHPHvqn6S/dyswYwCW9Gw==
X-Google-Smtp-Source: ABdhPJxo+77+8B6ZlCyBZlhyE6lnabwzE/4mu9v6/6AQ6+Trohef5kPe/Q2tCvpfrpxcUzPkBATJUg==
X-Received: by 2002:a17:906:e0b:: with SMTP id
 l11mr14989236eji.111.1617949485397; 
 Thu, 08 Apr 2021 23:24:45 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id b21sm711872ejz.123.2021.04.08.23.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 23:24:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-6.1 8/9] hw/clock: Declare clock_new() internally
Date: Fri,  9 Apr 2021 08:24:00 +0200
Message-Id: <20210409062401.2350436-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210409062401.2350436-1-f4bug@amsat.org>
References: <20210409062401.2350436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To enforce correct API usage, restrict the clock creation to
hw/core/. The only possible ways to create a clock are:

- Constant clock at the board level
  Using machine_create_constant_clock() in machine_init()

- Propagated clock in QDev
  Using qdev_init_clock_in() or qdev_init_clock_out() in
  TYPE_DEVICE instance_init().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/clock-internal.h | 32 ++++++++++++++++++++++++++++++++
 include/hw/clock.h       | 13 -------------
 hw/core/clock.c          |  1 +
 hw/core/machine.c        |  1 +
 hw/core/qdev-clock.c     |  1 +
 MAINTAINERS              |  1 +
 6 files changed, 36 insertions(+), 13 deletions(-)
 create mode 100644 hw/core/clock-internal.h

diff --git a/hw/core/clock-internal.h b/hw/core/clock-internal.h
new file mode 100644
index 00000000000..2207be74c0f
--- /dev/null
+++ b/hw/core/clock-internal.h
@@ -0,0 +1,32 @@
+/*
+ * Hardware Clocks
+ *
+ * Copyright GreenSocs 2016-2020
+ *
+ * Authors:
+ *  Frederic Konrad
+ *  Damien Hedde
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef QEMU_HW_CLOCK_INTERNAL_H
+#define QEMU_HW_CLOCK_INTERNAL_H
+
+#include "hw/clock.h"
+
+/**
+ * clock_new:
+ * @parent: the clock parent
+ * @name: the clock object name
+ *
+ * Helper function to create a new clock and parent it to @parent. There is no
+ * need to call clock_setup_canonical_path on the returned clock as it is done
+ * by this function.
+ *
+ * @return the newly created clock
+ */
+Clock *clock_new(Object *parent, const char *name);
+
+#endif
diff --git a/include/hw/clock.h b/include/hw/clock.h
index a7187eab95e..47cb65edb32 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -109,19 +109,6 @@ extern const VMStateDescription vmstate_clock;
  */
 void clock_setup_canonical_path(Clock *clk);
 
-/**
- * clock_new:
- * @parent: the clock parent
- * @name: the clock object name
- *
- * Helper function to create a new clock and parent it to @parent. There is no
- * need to call clock_setup_canonical_path on the returned clock as it is done
- * by this function.
- *
- * @return the newly created clock
- */
-Clock *clock_new(Object *parent, const char *name);
-
 /**
  * clock_set_callback:
  * @clk: the clock to register the callback into
diff --git a/hw/core/clock.c b/hw/core/clock.c
index a42dc3c3d29..bfa54ca0a93 100644
--- a/hw/core/clock.c
+++ b/hw/core/clock.c
@@ -14,6 +14,7 @@
 #include "qemu/osdep.h"
 #include "qemu/cutils.h"
 #include "hw/clock.h"
+#include "clock-internal.h"
 #include "trace.h"
 
 #define CLOCK_PATH(_clk) (_clk->canonical_path)
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 41baf80559d..e8bdcd10854 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -35,6 +35,7 @@
 #include "exec/confidential-guest-support.h"
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"
+#include "clock-internal.h"
 
 GlobalProperty hw_compat_5_2[] = {
     { "ICH9-LPC", "smm-compat", "on"},
diff --git a/hw/core/qdev-clock.c b/hw/core/qdev-clock.c
index a46384a84b7..09e14009fcd 100644
--- a/hw/core/qdev-clock.c
+++ b/hw/core/qdev-clock.c
@@ -16,6 +16,7 @@
 #include "hw/qdev-clock.h"
 #include "hw/qdev-core.h"
 #include "qapi/error.h"
+#include "clock-internal.h"
 
 /*
  * qdev_init_clocklist:
diff --git a/MAINTAINERS b/MAINTAINERS
index 58f342108e9..2b10744169c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2925,6 +2925,7 @@ S: Maintained
 F: include/hw/clock.h
 F: include/hw/qdev-clock.h
 F: hw/core/clock.c
+F: hw/core/clock-internal.h
 F: hw/core/clock-vmstate.c
 F: hw/core/qdev-clock.c
 F: docs/devel/clocks.rst
-- 
2.26.3



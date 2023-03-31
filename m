Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6756D1495
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 03:02:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi39D-0003B8-45; Thu, 30 Mar 2023 21:01:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <37zAmZAcKChI26436v0y66y3w.u648w4C-vwDw3565y5C.69y@flex--komlodi.bounces.google.com>)
 id 1pi39A-0003Ag-PO
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 21:01:40 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <37zAmZAcKChI26436v0y66y3w.u648w4C-vwDw3565y5C.69y@flex--komlodi.bounces.google.com>)
 id 1pi398-0006Zv-5n
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 21:01:40 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 z31-20020a25a122000000b00b38d2b9a2e9so20306310ybh.3
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 18:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680224495;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=FwjqfUNaxStAr97zk6xPM5MCnKIclcyU4ODUMMQVp9o=;
 b=TkdWcjl1J+Yhutu9B4aGOjpSgKqgq1Dxk8rh51b+gly3BzMwbAxWBXyMWIpqSgnb7K
 xC9FwBIpze+eDuLLWSqoi8xABulA4L5eWkM+lyZIEP19uRKX/qX+b0esbNtM9TSq+L0i
 8v1F+IIevakjCIXE7Npwr4MZyKVP0F36buxLffR1mkNnx5niUQpI3d7YOqUuLNkkLXNJ
 nV3djME6A3qaP2kkPaSOqayW+RNwlCsBUwjWXkvEJV5eD5HFCpuAh61hAuAiIDLs1tkz
 aoUJun5EvtpYAWnxExDIDTjeYoZ8nzX2K+hFkrrYyCArgqGGuFIjnUL1CKW4p3bWWU0z
 H5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680224495;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FwjqfUNaxStAr97zk6xPM5MCnKIclcyU4ODUMMQVp9o=;
 b=c3kkaGoGV4D7U2e0K7oBLVojUHzILH7ACuCnGzGfNPH9RdeMmDJW5SSOUbQJkCkV4w
 fK7uQIMyj2CAnZBmC4oAXhB6cNl6VAiR8vg8WXLo5e6iSLUKqowCskZt/hZ7UZfsP2Qf
 55VBTLKxzIjGALhpG8PCG/F5pHaDYzRRWE5l+sSoO0xYHQ3rvN1wdwzah4Xu2v7NI/iB
 9C6M3qY8KXIbxzlqZIxB2iXn1fQ8/2mCR/2UroE8cgWzinKHkSCOkiQcU3ucegFeRICZ
 HpNKeAOxTTfB0nmImggMep7BInR7x7AUX0iGnhdVxn/nW1HQP5tCtLVgPGEgLrTGNjd+
 j2iQ==
X-Gm-Message-State: AAQBX9eYdtcxE2aNzrhovOmjlwfti9wGx0j0Y5/bBFG5STZJWXPHwaMI
 LCYrH6AZxOFsc4/9QkGtcNLA8pkJ+Q3r4wqaFfh2vDDoqG1/ktuXzyCuxY4N0VwHyiukoCY8ATn
 PATdgGq/Jn/iSrbLoZ4A6LLub7OG74F7Ji+6FLUxa4sc1FtSuQ1kKgdVRcVSozdQ=
X-Google-Smtp-Source: AKy350ZM9kPx7dtglnLgHuN0DnqorK5wNQoVguGoyXo3G/7YsuuAx3u20BlsLFw7QByydcytejDAgwtrzsHk
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a05:6902:a8e:b0:b7c:1144:a729 with SMTP id
 cd14-20020a0569020a8e00b00b7c1144a729mr8255690ybb.9.1680224495151; Thu, 30
 Mar 2023 18:01:35 -0700 (PDT)
Date: Fri, 31 Mar 2023 01:01:16 +0000
In-Reply-To: <20230331010131.1412571-1-komlodi@google.com>
Mime-Version: 1.0
References: <20230331010131.1412571-1-komlodi@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230331010131.1412571-2-komlodi@google.com>
Subject: [PATCH 01/16] hw/misc/aspeed_i3c: Move to i3c directory
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: venture@google.com, komlodi@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=37zAmZAcKChI26436v0y66y3w.u648w4C-vwDw3565y5C.69y@flex--komlodi.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

Moves the Aspeed I3C model and traces into hw/i3c and create I3C build
files.

Signed-off-by: Joe Komlodi <komlodi@google.com>

Reviewed-by: Patrick Venture <venture@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
---
 hw/Kconfig                            | 1 +
 hw/arm/Kconfig                        | 1 +
 hw/i3c/Kconfig                        | 2 ++
 hw/{misc => i3c}/aspeed_i3c.c         | 2 +-
 hw/i3c/meson.build                    | 3 +++
 hw/i3c/trace-events                   | 7 +++++++
 hw/i3c/trace.h                        | 1 +
 hw/meson.build                        | 1 +
 hw/misc/meson.build                   | 1 -
 hw/misc/trace-events                  | 6 ------
 include/hw/arm/aspeed_soc.h           | 2 +-
 include/hw/{misc => i3c}/aspeed_i3c.h | 0
 meson.build                           | 1 +
 13 files changed, 19 insertions(+), 9 deletions(-)
 create mode 100644 hw/i3c/Kconfig
 rename hw/{misc => i3c}/aspeed_i3c.c (99%)
 create mode 100644 hw/i3c/meson.build
 create mode 100644 hw/i3c/trace-events
 create mode 100644 hw/i3c/trace.h
 rename include/hw/{misc => i3c}/aspeed_i3c.h (100%)

diff --git a/hw/Kconfig b/hw/Kconfig
index ba62ff6417..b7c8c24bfd 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -12,6 +12,7 @@ source dma/Kconfig
 source gpio/Kconfig
 source hyperv/Kconfig
 source i2c/Kconfig
+source i3c/Kconfig
 source ide/Kconfig
 source input/Kconfig
 source intc/Kconfig
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index b5aed4aff5..a6ca5a9c55 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -454,6 +454,7 @@ config ASPEED_SOC
     select DS1338
     select FTGMAC100
     select I2C
+    select I3C
     select DPS310
     select PCA9552
     select SERIAL
diff --git a/hw/i3c/Kconfig b/hw/i3c/Kconfig
new file mode 100644
index 0000000000..e07fe445c6
--- /dev/null
+++ b/hw/i3c/Kconfig
@@ -0,0 +1,2 @@
+config I3C
+    bool
diff --git a/hw/misc/aspeed_i3c.c b/hw/i3c/aspeed_i3c.c
similarity index 99%
rename from hw/misc/aspeed_i3c.c
rename to hw/i3c/aspeed_i3c.c
index f54f5da522..999978fb7d 100644
--- a/hw/misc/aspeed_i3c.c
+++ b/hw/i3c/aspeed_i3c.c
@@ -10,7 +10,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "qemu/error-report.h"
-#include "hw/misc/aspeed_i3c.h"
+#include "hw/i3c/aspeed_i3c.h"
 #include "hw/registerfields.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
diff --git a/hw/i3c/meson.build b/hw/i3c/meson.build
new file mode 100644
index 0000000000..c0c38b4c12
--- /dev/null
+++ b/hw/i3c/meson.build
@@ -0,0 +1,3 @@
+i3c_ss = ss.source_set()
+i3c_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_i3c.c'))
+softmmu_ss.add_all(when: 'CONFIG_I3C', if_true: i3c_ss)
diff --git a/hw/i3c/trace-events b/hw/i3c/trace-events
new file mode 100644
index 0000000000..3ead84eb45
--- /dev/null
+++ b/hw/i3c/trace-events
@@ -0,0 +1,7 @@
+# See docs/devel/tracing.rst for syntax documentation.
+
+# aspeed_i3c.c
+aspeed_i3c_read(uint64_t offset, uint64_t data) "I3C read: offset 0x%" PRIx64 " data 0x%" PRIx64
+aspeed_i3c_write(uint64_t offset, uint64_t data) "I3C write: offset 0x%" PRIx64 " data 0x%" PRIx64
+aspeed_i3c_device_read(uint32_t deviceid, uint64_t offset, uint64_t data) "I3C Dev[%u] read: offset 0x%" PRIx64 " data 0x%" PRIx64
+aspeed_i3c_device_write(uint32_t deviceid, uint64_t offset, uint64_t data) "I3C Dev[%u] write: offset 0x%" PRIx64 " data 0x%" PRIx64
diff --git a/hw/i3c/trace.h b/hw/i3c/trace.h
new file mode 100644
index 0000000000..9d4a082e19
--- /dev/null
+++ b/hw/i3c/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-hw_i3c.h"
diff --git a/hw/meson.build b/hw/meson.build
index c7ac7d3d75..b3225de5f9 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -12,6 +12,7 @@ subdir('dma')
 subdir('gpio')
 subdir('hyperv')
 subdir('i2c')
+subdir('i3c')
 subdir('ide')
 subdir('input')
 subdir('intc')
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index a40245ad44..f87c56fb87 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -115,7 +115,6 @@ softmmu_ss.add(when: 'CONFIG_PVPANIC_PCI', if_true: files('pvpanic-pci.c'))
 softmmu_ss.add(when: 'CONFIG_AUX', if_true: files('auxbus.c'))
 softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed_hace.c',
-  'aspeed_i3c.c',
   'aspeed_lpc.c',
   'aspeed_scu.c',
   'aspeed_sbc.c',
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index c47876a902..cc335fc89d 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -205,12 +205,6 @@ armsse_mhu_write(uint64_t offset, uint64_t data, unsigned size) "SSE-200 MHU wri
 # aspeed_xdma.c
 aspeed_xdma_write(uint64_t offset, uint64_t data) "XDMA write: offset 0x%" PRIx64 " data 0x%" PRIx64
 
-# aspeed_i3c.c
-aspeed_i3c_read(uint64_t offset, uint64_t data) "I3C read: offset 0x%" PRIx64 " data 0x%" PRIx64
-aspeed_i3c_write(uint64_t offset, uint64_t data) "I3C write: offset 0x%" PRIx64 " data 0x%" PRIx64
-aspeed_i3c_device_read(uint32_t deviceid, uint64_t offset, uint64_t data) "I3C Dev[%u] read: offset 0x%" PRIx64 " data 0x%" PRIx64
-aspeed_i3c_device_write(uint32_t deviceid, uint64_t offset, uint64_t data) "I3C Dev[%u] write: offset 0x%" PRIx64 " data 0x%" PRIx64
-
 # aspeed_sdmc.c
 aspeed_sdmc_write(uint64_t reg, uint64_t data) "reg @0x%" PRIx64 " data: 0x%" PRIx64
 aspeed_sdmc_read(uint64_t reg, uint64_t data) "reg @0x%" PRIx64 " data: 0x%" PRIx64
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 8adff70072..603cebe5b3 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -22,7 +22,7 @@
 #include "hw/timer/aspeed_timer.h"
 #include "hw/rtc/aspeed_rtc.h"
 #include "hw/i2c/aspeed_i2c.h"
-#include "hw/misc/aspeed_i3c.h"
+#include "hw/i3c/aspeed_i3c.h"
 #include "hw/ssi/aspeed_smc.h"
 #include "hw/misc/aspeed_hace.h"
 #include "hw/misc/aspeed_sbc.h"
diff --git a/include/hw/misc/aspeed_i3c.h b/include/hw/i3c/aspeed_i3c.h
similarity index 100%
rename from include/hw/misc/aspeed_i3c.h
rename to include/hw/i3c/aspeed_i3c.h
diff --git a/meson.build b/meson.build
index 29f8644d6d..91f9b4bbe7 100644
--- a/meson.build
+++ b/meson.build
@@ -2979,6 +2979,7 @@ if have_system
     'hw/dma',
     'hw/hyperv',
     'hw/i2c',
+    'hw/i3c',
     'hw/i386',
     'hw/i386/xen',
     'hw/i386/kvm',
-- 
2.40.0.348.gf938b09366-goog



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2003E382C09
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 14:24:56 +0200 (CEST)
Received: from localhost ([::1]:49522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1licIp-00041S-6J
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 08:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libqW-0003QW-Vw
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:55:41 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:52089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libqV-0002ln-DX
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:55:40 -0400
Received: by mail-wm1-x336.google.com with SMTP id u133so3416262wmg.1
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/43ScFgw6ZoJnoZI0Vs8YRgCLUW4OQusCylPD74zESI=;
 b=j2xCWv/1CETSHLahgnOaCoShSULx9VwLwo/hgTfZVq0WyW2GsJHYpuUjqi7616Khis
 sKFi0vdc9lCUgBPTanRSEkLpAcu6bIUjS6ViwYVVqEnF2RTxnE8Ule6p82beWImfCgLj
 rqjTfar6oE0zpHF34N+502yOiYO4NrWgXOlTTleCBtK0wZYw9btNq1IMe0UIh239yhfX
 zqc4vXBiHJoxN5BEs0FMwEVfM/yCpq5a5ZTUntcGIIziAi8Y773ZMfXa2FXUVwFnYNpk
 Dxzuh+xdYdhb9U7S9/jbJla0Q6cgbYlGAHKhh+XZ6Oscc7u+egiQS+zBlh6o5LMZgA6d
 a1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/43ScFgw6ZoJnoZI0Vs8YRgCLUW4OQusCylPD74zESI=;
 b=V2KrQBsTjeBE1V6ApOMZpTWCbAWglcL7L5XniUlnpYy1V+etWktosxoCTo3ErYLCUs
 VIS+K3/EHfjMmIuIg/niwDALk/QtBK0urdrN8AksMuygX3Hi7P3BDumDN1/88b7YXv8h
 Ep8gTjtz7KS3kFMh3X9VSN0i5tVbTFHXY0j0d66vuJWiGorxDYFnLy4Rf0q0FKPLqosN
 U3H+tjnYzpbulMEWTN7N+7uAvQr3m7ykjx1Z4Z8al5Mv562jQoEl07RgKvRbdnRZJ664
 t44nLeRcWasXjHrysWyBb6kd8SeRcBly418KrvvY63UAenKyNda3y6VsvX/krHvJYK0z
 rSTA==
X-Gm-Message-State: AOAM533ml0G09xnPqChWwsecxaH0TwoTR0S8f6g/C85crbFYYjnMyzCy
 2rJILKEI5Hp9G2s9BTdefRMgrUEX+XvrBA==
X-Google-Smtp-Source: ABdhPJwYzSCnmC3dp/mCradg3viEp9719htCpOz3Zrv5zKkPIuo6OPi+6zPam7iaDhGHyQpqZ0Iihw==
X-Received: by 2002:a1c:750b:: with SMTP id o11mr23175382wmc.188.1621252537759; 
 Mon, 17 May 2021 04:55:37 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id o1sm20512016wmc.6.2021.05.17.04.55.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 04:55:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 02/15] accel/whpx: Simplify #ifdef'ry
Date: Mon, 17 May 2021 13:55:12 +0200
Message-Id: <20210517115525.1088693-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517115525.1088693-1-f4bug@amsat.org>
References: <20210517115525.1088693-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

whpx_apic_in_platform() is called from:

- pic_irq_request() in hw/i386/x86.c
- cpu_thread_is_idle() softmmu/cpus.c
- apic_get_class() in target/i386/cpu-sysemu.c

whpx_enabled() is called from:

- cpu_report_tpr_access() in target/i386/helper.c

By converting macros to a function, we can remove the
NEED_CPU_H dependency and build softmmu/cpus.c once
for all targets.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/whpx.h       | 15 +--------------
 accel/stubs/whpx-stub.c     | 21 +++++++++++++++++++++
 target/i386/whpx/whpx-all.c |  2 +-
 MAINTAINERS                 |  1 +
 accel/stubs/meson.build     |  1 +
 5 files changed, 25 insertions(+), 15 deletions(-)
 create mode 100644 accel/stubs/whpx-stub.c

diff --git a/include/sysemu/whpx.h b/include/sysemu/whpx.h
index 2889fa2278b..b32f46f9ebf 100644
--- a/include/sysemu/whpx.h
+++ b/include/sysemu/whpx.h
@@ -13,20 +13,7 @@
 #ifndef QEMU_WHPX_H
 #define QEMU_WHPX_H
 
-#ifdef NEED_CPU_H
-
-#ifdef CONFIG_WHPX
-
-int whpx_enabled(void);
+bool whpx_enabled(void);
 bool whpx_apic_in_platform(void);
 
-#else /* CONFIG_WHPX */
-
-#define whpx_enabled() (0)
-#define whpx_apic_in_platform() (0)
-
-#endif /* CONFIG_WHPX */
-
-#endif /* NEED_CPU_H */
-
 #endif /* QEMU_WHPX_H */
diff --git a/accel/stubs/whpx-stub.c b/accel/stubs/whpx-stub.c
new file mode 100644
index 00000000000..794a992acc6
--- /dev/null
+++ b/accel/stubs/whpx-stub.c
@@ -0,0 +1,21 @@
+/*
+ * QEMU WHPX stub
+ *
+ * Copyright (c) 2019 Philippe Mathieu-Daudé <f4bug@amsat.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "sysemu/whpx.h"
+
+bool whpx_enabled(void)
+{
+    return false;
+}
+
+bool whpx_apic_in_platform(void)
+{
+    return false;
+}
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index f832f286ac3..6709a89f8f0 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -1862,7 +1862,7 @@ error:
     return ret;
 }
 
-int whpx_enabled(void)
+bool whpx_enabled(void)
 {
     return whpx_allowed;
 }
diff --git a/MAINTAINERS b/MAINTAINERS
index 78561a223f9..7877710e372 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -439,6 +439,7 @@ F: include/sysemu/hvf.h
 WHPX CPUs
 M: Sunil Muthuswamy <sunilmut@microsoft.com>
 S: Supported
+F: accel/stubs/whpx-stub.c
 F: target/i386/whpx/
 F: include/sysemu/whpx.h
 
diff --git a/accel/stubs/meson.build b/accel/stubs/meson.build
index 12dd1539afa..3fbe34e5bb3 100644
--- a/accel/stubs/meson.build
+++ b/accel/stubs/meson.build
@@ -2,3 +2,4 @@
 specific_ss.add(when: 'CONFIG_XEN', if_false: files('xen-stub.c'))
 specific_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
 specific_ss.add(when: 'CONFIG_TCG', if_false: files('tcg-stub.c'))
+specific_ss.add(when: 'CONFIG_WHPX', if_false: files('whpx-stub.c'))
-- 
2.26.3



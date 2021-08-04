Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C5F3DFB9F
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 08:53:31 +0200 (CEST)
Received: from localhost ([::1]:41588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBAmQ-0001KG-DG
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 02:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1mBAlG-0000Ou-Nu; Wed, 04 Aug 2021 02:52:18 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:45827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1mBAlE-0008EG-T3; Wed, 04 Aug 2021 02:52:18 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 m10-20020a17090a34cab0290176b52c60ddso2201151pjf.4; 
 Tue, 03 Aug 2021 23:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ICQPFUHpt3OQEXGF5qKqe3+0tFqkM++RM5NjSAhEKHU=;
 b=U4+KrHK3wVz8lkFOIIrRdTyHVFY+J3VNbekkeezePWQQmuSc6t2SOZccazHAj3g0jy
 VP1FVjLxyH+wAUseoll9h8WYM9UJfI5N6vdLnjhHp/DfFiPGK4hUGTobKuaMRe7ehVMi
 kNOTtNQrXhIC3MvXEBMmzllX0MhZ0XFlPPQcWEGR7yTnQ7+4ZkYnRhZAnP5Etly65R1P
 8lYRIwcDDJxjhxhxfi5J5InEFs04Wo/O/Un0kDtsyqZE+HXiZldY+T7Go+YaKeHyoc/t
 iCDcFbyVCTi8XIXatdx+wFFcv+Eq7mTiwf4HG7JYQbUJ8cS4xq9KZTnOWbFv9vZqVR0x
 1MGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ICQPFUHpt3OQEXGF5qKqe3+0tFqkM++RM5NjSAhEKHU=;
 b=NjAl/6b8kSKyelPVAiJnzH4Lykbm4XrSGVH0/0qABMsaKsbUYIjCxgIM25fTKGaIzU
 F3sc0wesPRhZ+2NRy4TRK9xaYVDQusrKbRxa2mjWeYSO/w24fnBfdUo5gLR9h9ML+uAO
 1DpFRjTZzX2COGzCNHJ3h1RjXOXrEyzRfgtHNL4y+KmcRnkBc1Pa6lZfsR6sZykkDfrU
 qV+n7K77nbe571dEC7rRR4VTo8ezR+6ZKgt4mNBbLjXN5EgruutDCGDa+WguZGubhbr1
 CAyj6V6p0Hby64HKYzmtFXu9TM9b3IxcKBifF4NAsHqTlfc6dLV5bSOQdV8T8/b54PAS
 llfg==
X-Gm-Message-State: AOAM533A3SK5DQSeGi/4Ai06/xh/ZDtGCnq0Fft1W9P8iuVWL6WJc4DU
 dlBzgvX84E+gnzaFF95rFfs=
X-Google-Smtp-Source: ABdhPJzq6b4xH5tqLiXaOeUo1RdcTjEvrcf61h7jEP7bynaGIb/TKSjBhZi5cjcuA8VpyJs49UmqSQ==
X-Received: by 2002:a65:5c48:: with SMTP id v8mr448064pgr.411.1628059934277;
 Tue, 03 Aug 2021 23:52:14 -0700 (PDT)
Received: from localhost ([193.111.30.82])
 by smtp.gmail.com with ESMTPSA id s36sm1664747pgk.64.2021.08.03.23.52.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Aug 2021 23:52:13 -0700 (PDT)
From: Qiang Liu <cyruscyliu@gmail.com>
To: 
Subject: [PATCH v2] hw/display/xlnx_dp: fix an out-of-bounds read in
 xlnx_dp_read
Date: Wed,  4 Aug 2021 14:51:50 +0800
Message-Id: <1628059910-12060-1-git-send-email-cyruscyliu@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=cyruscyliu@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Qiang Liu <cyruscyliu@gmail.com>, Alistair Francis <alistair@alistair23.me>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

xlnx_dp_read allows an out-of-bounds read at its default branch because
of an improper index.

According to
https://www.xilinx.com/html_docs/registers/ug1087/ug1087-zynq-ultrascale-registers.html
(DP Module), registers 0x3A4/0x3A4/0x3AC are allowed.

DP_INT_MASK     0x000003A4      32      mixed   0xFFFFF03F      Interrupt Mask Register for intrN.
DP_INT_EN       0x000003A8      32      mixed   0x00000000      Interrupt Enable Register.
DP_INT_DS       0x000003AC      32      mixed   0x00000000      Interrupt Disable Register.

In xlnx_dp_write, when the offset is 0x3A8 and 0x3AC, the virtual device
will write s->core_registers[0x3A4
>> 2]. That is to say, the maxize of s->core_registers could be ((0x3A4
>> 2) + 1). However, the current size of s->core_registers is (0x3AF >>
>> 2), that is ((0x3A4 >> 2) + 2), which is out of the range.
In xlxn_dp_read, the access to offset 0x3A8 or 0x3AC will be directed to
the offset 0x3A8 (incorrect functionality) or 0x3AC (out-of-bounds read)
rather than 0x3A4.

This patch enforces the read access to offset 0x3A8 and 0x3AC to 0x3A4,
but does not adjust the size of s->core_registers to avoid breaking
migration.

Fixes: 58ac482a66de ("introduce xlnx-dp")
Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
---
v2:
  - not change DP_CORE_REG_ARRAY_SIZE
  - add a qtest reproducer
  - update the code style

I have a question about the QTest reproducer. Before patching xlnx-dp,
(0x3ac >> 2) will exceed the right bound of s->core_registers.  However,
this is allowed by the assertion. There is no warning and this
reproducer will pass. Is the reprodocer OK?

 hw/display/xlnx_dp.c            |  6 +++++-
 tests/qtest/fuzz-xlnx-dp-test.c | 33 +++++++++++++++++++++++++++++++++
 tests/qtest/meson.build         |  1 +
 3 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 tests/qtest/fuzz-xlnx-dp-test.c

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index 7bcbb13..747df6e 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -714,7 +714,11 @@ static uint64_t xlnx_dp_read(void *opaque, hwaddr offset, unsigned size)
         break;
     default:
         assert(offset <= (0x3AC >> 2));
-        ret = s->core_registers[offset];
+        if (offset == (0x3A8 >> 2) || offset == (0x3AC >> 2)) {
+            ret = s->core_registers[DP_INT_MASK];
+        } else {
+            ret = s->core_registers[offset];
+        }
         break;
     }
 
diff --git a/tests/qtest/fuzz-xlnx-dp-test.c b/tests/qtest/fuzz-xlnx-dp-test.c
new file mode 100644
index 0000000..69eb6c0
--- /dev/null
+++ b/tests/qtest/fuzz-xlnx-dp-test.c
@@ -0,0 +1,33 @@
+/*
+ * QTest fuzzer-generated testcase for xlnx-dp display device
+ *
+ * Copyright (c) 2021 Qiang Liu <cyruscyliu@gmail.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "libqos/libqtest.h"
+
+/*
+ * This used to trigger the out-of-bounds read in xlnx_dp_read
+ */
+static void test_fuzz_xlnx_dp_0x3ac(void)
+{
+    QTestState *s = qtest_init("-M xlnx-zcu102 -display none ");
+    qtest_readl(s, 0xfd4a03ac);
+    qtest_quit(s);
+}
+
+int main(int argc, char **argv)
+{
+    const char *arch = qtest_get_arch();
+
+    g_test_init(&argc, &argv, NULL);
+
+   if (strcmp(arch, "aarch64") == 0) {
+        qtest_add_func("fuzz/test_fuzz_xlnx_dp/3ac", test_fuzz_xlnx_dp_0x3ac);
+   }
+
+   return g_test_run();
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 83ad237..6fd6b0e 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -185,6 +185,7 @@ qtests_aarch64 = \
    'numa-test',
    'boot-serial-test',
    'xlnx-can-test',
+   'fuzz-xlnx-dp-test',
    'migration-test']
 
 qtests_s390x = \
-- 
2.7.4



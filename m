Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D52128F38F
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Oct 2020 15:44:56 +0200 (CEST)
Received: from localhost ([::1]:52962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kT3Yt-0001Wn-BH
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 09:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kT3WG-0007T8-Rx
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 09:42:13 -0400
Received: from mail-eopbgr750112.outbound.protection.outlook.com
 ([40.107.75.112]:30180 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kT3WE-0000kr-Bg
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 09:42:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DSw1Lc83IYzO9cnyES9FAZsmg1TJKwujrMfWWEW0bwJPGoiZJT4f8yE1BfzyAoy83WeKdTuGpgdbWDpkfwil4RyhSxoYtClFHcJOSxbQt+TaOqMGQm4wHi1MoF8Q7OZFptXEdePB0jv+6zFS2UroFB/vIRoxYm7K7dXwVp7kjHntnXqzCmBxF0A/0cA14K1pzFzZuyvBEdWbsIyFvlMXnnCEr6UrPGjERHGN4/NHwxVm+O5tEdlOMXLwGTWZar6JNGfJwv4KpoKH4YvgrsaKgo2DRhYFHdM8osXiGgKkSi1rqsLcFXcPy0mFtgC+cWBK1umkt1JXtatYOAW8p4hvxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNwuoSZCN1xDIfurTHUFmWI5gkkjYhsBm9XcERWfx2U=;
 b=io4b7sL+lOYtbPhK6qartl4rg/uM6gHfhTNK0mVw/AR2v/fF80BXh0UUVQe9PeDLuZsR+Q0lByvCg4Dt7hjXG4+QmXz4HAzexoCSiqMHZL6HeEW4GfsAWBPQGmaZaPdUSsBF5yTGDuRpnYMRaCaj9+o4BRp6txhaSIg75vfWs/u4WQkXiNJaBhg2PifDJMTuB626wXUrIUKqfHlQdT0KnGofCt4Xoiy5x/DLo3Lg8MIMxC6RZnb6NQR+Eyw73FDOZd1MpQpu9IUtp/a10Hqo5ib9OqrS1aa3xtyqPQ7OCtblb0ZP3orWAo6RwRQwuZXwO3pVA2Rz/9t9lZ+sWMAFVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNwuoSZCN1xDIfurTHUFmWI5gkkjYhsBm9XcERWfx2U=;
 b=HvbiCD9hxQvTiwrXU9ytxYqoWdcxM7cDVSya8QUimWxbzYdrJ/ZqG7XIHBwNUBwh1KrFBQHUAUrLmlwS/4s9FXHf30ca2CnNwt6Xv8PnCOD5+X5Fu9t0SnuBuSaXksFPcJPciPPxooDc+zzS73dy/yikrDxKDyV596i85MS8Ads=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5465.namprd03.prod.outlook.com (2603:10b6:806:b5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Thu, 15 Oct
 2020 13:41:53 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::61ae:93a8:b26c:77b8]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::61ae:93a8:b26c:77b8%4]) with mapi id 15.20.3455.031; Thu, 15 Oct 2020
 13:41:53 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/16] fuzz: Add general virtual-device fuzzer
Date: Thu, 15 Oct 2020 09:41:22 -0400
Message-Id: <20201015134137.205958-3-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015134137.205958-1-alxndr@bu.edu>
References: <20201015134137.205958-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.93.72.163]
X-ClientProxiedBy: BL1PR13CA0055.namprd13.prod.outlook.com
 (2603:10b6:208:257::30) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.93.72.163) by
 BL1PR13CA0055.namprd13.prod.outlook.com (2603:10b6:208:257::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.8 via Frontend
 Transport; Thu, 15 Oct 2020 13:41:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02e542bb-1198-4b38-a616-08d871101331
X-MS-TrafficTypeDiagnostic: SA0PR03MB5465:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB54653FCBAA2D4655AA30EE15BA020@SA0PR03MB5465.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w/dDIer8m9JjcWGppz680ENHu3hH6y8jKZ6bsFebJaCUAxE6K4XZ/XxbJz6pQUmdaLDaTAJ8biT/kOuPoHc54dVbuyXJIK/eHhlruFieHZbYEQfc9O6W4AqyPDbN8E6ElK/mm6iMkbITZj5TURw56FxhlE+OwQ5nQYpHB9SskNN/q0XETr+x8c2KOCz+epHnrM+Anwu7O2pT1Iar1nLmsIxDZXxRspuhWKqx9iD+2BrUMB6Z1sOz0rmEgb5Y1TgzBjWX5VNDRga40XBTzuVcTaiDjCjqH4LnxMAPSRtaw55JQPibvz/HxnGxhAHfZtjnNM1fwmzcvV7qR4cVxoiLqIm9aQlkDSBC8jLgrRMlfMHwmCwXC0LnW5McrPGAzAID
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(30864003)(5660300002)(54906003)(2616005)(8936002)(34490700002)(1076003)(66476007)(66946007)(6666004)(83380400001)(956004)(4326008)(6512007)(6486002)(8676002)(75432002)(6506007)(26005)(6916009)(52116002)(2906002)(86362001)(186003)(16526019)(786003)(316002)(66556008)(478600001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: IB4dAjtTDd2xTKIfapAT9U4djcqGD9SlP6ddLedjOAchRczZXPBHN4ZnmJXYfE8Gisr9mJ0+AQd+wqGpAWMOqmXv/LPkTtawzYfE+njWOwOiZnFZxH+SRuD2FWKj9+1D/ZzEKI5meIo9gZmvwVP6rW5NhFrwK+utlIBtagHyz3aC0HlRTnWI2GFcNHLrCKAWKKTak6Ls51oA5qxsjSiNFz/t9i2DjJ+7cGN1QtotXLPaV2a+EskqrJVTbkWrCRbiR9AVXl1yv3ZVTJnjmqFVoiAVFO9tjS+CfBl4UY1bpz+LkyKreWG9I2EIKJkYaMuqbd0bd1CIRHYJTrCCHWDj14R9OnZSW16fqzrpodYofsORK2tQ4lmBRWNKOed7HPEjnLjGU/thEFAHhNsspvQ9SYYKYgKLWG9AoFdSy00dlRvh2vWdWekR3+VedVQVUOB+UcWuCDmYMtv92sTDzlq21291fBNQR+zONW1VLl1UxOWAmbSKSkVmXYSebl5H21L+iHchIM+1OYV/1T0Ck9+W/urzuuWaZnZFN4+w9yoe1e6VE0DGP1IJbA7M/h1IGE7WH3Dj15uP6xBxR0eeXRo91sDWpJCnjIWGi+puXzVxQDTMi2f6S41RGwDQ6HTEiwq0fgRiBBoYLP/rRvklC6QjZQ==
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e542bb-1198-4b38-a616-08d871101331
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2020 13:41:53.2109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJ0bMUQmjScbkmjorpBCN7p3uceS0Yy0vqilFIKaAotO3ERVCE3m1ins8VuObzOY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5465
Received-SPF: pass client-ip=40.107.75.112; envelope-from=alxndr@bu.edu;
 helo=NAM02-BL2-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 09:42:04
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.998,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, f4bug@amsat.org, darren.kenny@oracle.com,
 bsd@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 dimastep@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a generic fuzzer designed to fuzz a virtual device's
MemoryRegions, as long as they exist within the Memory or Port IO (if it
exists) AddressSpaces. The fuzzer's input is interpreted into a sequence
of qtest commands (outb, readw, etc). The interpreted commands are
separated by a magic seaparator, which should be easy for the fuzzer to
guess. Without ASan, the separator can be specified as a "dictionary
value" using the -dict argument (see libFuzzer documentation).

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 tests/qtest/fuzz/general_fuzz.c | 509 ++++++++++++++++++++++++++++++++
 tests/qtest/fuzz/meson.build    |   1 +
 2 files changed, 510 insertions(+)
 create mode 100644 tests/qtest/fuzz/general_fuzz.c

diff --git a/tests/qtest/fuzz/general_fuzz.c b/tests/qtest/fuzz/general_fuzz.c
new file mode 100644
index 0000000000..c1c6dd3ba6
--- /dev/null
+++ b/tests/qtest/fuzz/general_fuzz.c
@@ -0,0 +1,509 @@
+/*
+ * General Virtual-Device Fuzzing Target
+ *
+ * Copyright Red Hat Inc., 2020
+ *
+ * Authors:
+ *  Alexander Bulekov   <alxndr@bu.edu>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include <wordexp.h>
+
+#include "hw/core/cpu.h"
+#include "tests/qtest/libqos/libqtest.h"
+#include "fuzz.h"
+#include "fork_fuzz.h"
+#include "exec/address-spaces.h"
+#include "string.h"
+#include "exec/memory.h"
+#include "exec/ramblock.h"
+#include "exec/address-spaces.h"
+#include "hw/qdev-core.h"
+
+/*
+ * SEPARATOR is used to separate "operations" in the fuzz input
+ */
+#define SEPARATOR "FUZZ"
+
+enum cmds {
+    OP_IN,
+    OP_OUT,
+    OP_READ,
+    OP_WRITE,
+    OP_CLOCK_STEP,
+};
+
+#define DEFAULT_TIMEOUT_US 100000
+#define USEC_IN_SEC 100000000
+
+typedef struct {
+    ram_addr_t addr;
+    ram_addr_t size; /* The number of bytes until the end of the I/O region */
+} address_range;
+
+static useconds_t timeout = 100000;
+
+static bool qtest_log_enabled;
+
+/*
+ * List of memory regions that are children of QOM objects specified by the
+ * user for fuzzing.
+ */
+static GHashTable *fuzzable_memoryregions;
+
+struct get_io_cb_info {
+    int index;
+    int found;
+    address_range result;
+};
+
+static int get_io_address_cb(ram_addr_t start, ram_addr_t size,
+                          const MemoryRegion *mr, void *opaque) {
+    struct get_io_cb_info *info = opaque;
+    if (g_hash_table_lookup(fuzzable_memoryregions, mr)) {
+        if (info->index == 0) {
+            info->result.addr = start;
+            info->result.size = size;
+            info->found = 1;
+            return 1;
+        }
+        info->index--;
+    }
+    return 0;
+}
+
+/*
+ * Here we want to convert a fuzzer-provided [io-region-index, offset] to
+ * a physical address. To do this, we iterate over all of the matched
+ * MemoryRegions. Check whether each region exists within the particular io
+ * space. Return the absolute address of the offset within the index'th region
+ * that is a subregion of the io_space and the distance until the end of the
+ * memory region.
+ */
+static bool get_io_address(address_range *result, AddressSpace *as,
+                            uint8_t index,
+                            uint32_t offset) {
+    FlatView *view;
+    view = as->current_map;
+    g_assert(view);
+    struct get_io_cb_info cb_info = {};
+
+    cb_info.index = index;
+
+    /*
+     * Loop around the FlatView until we match "index" number of
+     * fuzzable_memoryregions, or until we know that there are no matching
+     * memory_regions.
+     */
+    do {
+        flatview_for_each_range(view, get_io_address_cb , &cb_info);
+    } while (cb_info.index != index && !cb_info.found);
+
+    *result = cb_info.result;
+    return cb_info.found;
+}
+static bool get_pio_address(address_range *result,
+                            uint8_t index, uint16_t offset)
+{
+    /*
+     * PIO BARs can be set past the maximum port address (0xFFFF). Thus, result
+     * can contain an addr that extends past the PIO space. When we pass this
+     * address to qtest_in/qtest_out, it is cast to a uint16_t, so we might end
+     * up fuzzing a completely different MemoryRegion/Device. Therefore, check
+     * that the address here is within the PIO space limits.
+     */
+    bool found = get_io_address(result, &address_space_io, index, offset);
+    return result->addr <= 0xFFFF ? found : false;
+}
+static bool get_mmio_address(address_range *result,
+                             uint8_t index, uint32_t offset)
+{
+    return get_io_address(result, &address_space_memory, index, offset);
+}
+
+static void op_in(QTestState *s, const unsigned char * data, size_t len)
+{
+    enum Sizes {Byte, Word, Long, end_sizes};
+    struct {
+        uint8_t size;
+        uint8_t base;
+        uint16_t offset;
+    } a;
+    address_range abs;
+
+    if (len < sizeof(a)) {
+        return;
+    }
+    memcpy(&a, data, sizeof(a));
+    if (get_pio_address(&abs, a.base, a.offset) == 0) {
+        return;
+    }
+
+    switch (a.size %= end_sizes) {
+    case Byte:
+        qtest_inb(s, abs.addr);
+        break;
+    case Word:
+        if (abs.size >= 2) {
+            qtest_inw(s, abs.addr);
+        }
+        break;
+    case Long:
+        if (abs.size >= 4) {
+            qtest_inl(s, abs.addr);
+        }
+        break;
+    }
+}
+
+static void op_out(QTestState *s, const unsigned char * data, size_t len)
+{
+    enum Sizes {Byte, Word, Long, end_sizes};
+    struct {
+        uint8_t size;
+        uint8_t base;
+        uint16_t offset;
+        uint32_t value;
+    } a;
+    address_range abs;
+
+    if (len < sizeof(a)) {
+        return;
+    }
+    memcpy(&a, data, sizeof(a));
+
+    if (get_pio_address(&abs, a.base, a.offset) == 0) {
+        return;
+    }
+
+    switch (a.size %= end_sizes) {
+    case Byte:
+        qtest_outb(s, abs.addr, a.value & 0xFF);
+        break;
+    case Word:
+        if (abs.size >= 2) {
+            qtest_outw(s, abs.addr, a.value & 0xFFFF);
+        }
+        break;
+    case Long:
+        if (abs.size >= 4) {
+            qtest_outl(s, abs.addr, a.value);
+        }
+        break;
+    }
+}
+
+static void op_read(QTestState *s, const unsigned char * data, size_t len)
+{
+    enum Sizes {Byte, Word, Long, Quad, end_sizes};
+    struct {
+        uint8_t size;
+        uint8_t base;
+        uint32_t offset;
+    } a;
+    address_range abs;
+
+    if (len < sizeof(a)) {
+        return;
+    }
+    memcpy(&a, data, sizeof(a));
+
+    if (get_mmio_address(&abs, a.base, a.offset) == 0) {
+        return;
+    }
+
+    switch (a.size %= end_sizes) {
+    case Byte:
+        qtest_readb(s, abs.addr);
+        break;
+    case Word:
+        if (abs.size >= 2) {
+            qtest_readw(s, abs.addr);
+        }
+        break;
+    case Long:
+        if (abs.size >= 4) {
+            qtest_readl(s, abs.addr);
+        }
+        break;
+    case Quad:
+        if (abs.size >= 8) {
+            qtest_readq(s, abs.addr);
+        }
+        break;
+    }
+}
+
+static void op_write(QTestState *s, const unsigned char * data, size_t len)
+{
+    enum Sizes {Byte, Word, Long, Quad, end_sizes};
+    struct {
+        uint8_t size;
+        uint8_t base;
+        uint32_t offset;
+        uint64_t value;
+    } a;
+    address_range abs;
+
+    if (len < sizeof(a)) {
+        return;
+    }
+    memcpy(&a, data, sizeof(a));
+
+    if (get_mmio_address(&abs, a.base, a.offset) == 0) {
+        return;
+    }
+
+    switch (a.size %= end_sizes) {
+    case Byte:
+            qtest_writeb(s, abs.addr, a.value & 0xFF);
+        break;
+    case Word:
+        if (abs.size >= 2) {
+            qtest_writew(s, abs.addr, a.value & 0xFFFF);
+        }
+        break;
+    case Long:
+        if (abs.size >= 4) {
+            qtest_writel(s, abs.addr, a.value & 0xFFFFFFFF);
+        }
+        break;
+    case Quad:
+        if (abs.size >= 8) {
+            qtest_writeq(s, abs.addr, a.value);
+        }
+        break;
+    }
+}
+static void op_clock_step(QTestState *s, const unsigned char *data, size_t len)
+{
+    qtest_clock_step_next(s);
+}
+
+static void handle_timeout(int sig)
+{
+    if (qtest_log_enabled) {
+        fprintf(stderr, "[Timeout]\n");
+        fflush(stderr);
+    }
+    _Exit(0);
+}
+
+/*
+ * Here, we interpret random bytes from the fuzzer, as a sequence of commands.
+ * Some commands can be variable-width, so we use a separator, SEPARATOR, to specify
+ * the boundaries between commands. SEPARATOR is used to separate "operations"
+ * in the fuzz input. Why use a separator, instead of just using the operations'
+ * length to identify operation boundaries?
+ *   1. This is a simple way to support variable-length operations
+ *   2. This adds "stability" to the input.
+ *      For example take the input "AbBcgDefg", where there is no separator and
+ *      Opcodes are capitalized.
+ *      Simply, by removing the first byte, we end up with a very different sequence:
+ *      BbcGdefg...
+ *      By adding a separator, we avoid this problem:
+ *      Ab SEP Bcg SEP Defg -> B SEP Bcg SEP Defg
+ *      Since B uses two additional bytes as operands, the first "B" will be
+ *      ignored. The fuzzer actively tries to reduce inputs, so such unused
+ *      bytes are likely to be pruned, eventually.
+ *
+ *  SEPARATOR is trivial for the fuzzer to discover when using ASan. Optionally,
+ *  SEPARATOR can be manually specified as a dictionary value (see libfuzzer's
+ *  -dict), though this should not be necessary.
+ *
+ * As a result, the stream of bytes is converted into a sequence of commands.
+ * In a simplified example where SEPARATOR is 0xFF:
+ * 00 01 02 FF 03 04 05 06 FF 01 FF ...
+ * becomes this sequence of commands:
+ * 00 01 02    -> op00 (0102)   -> in (0102, 2)
+ * 03 04 05 06 -> op03 (040506) -> write (040506, 3)
+ * 01          -> op01 (-,0)    -> out (-,0)
+ * ...
+ *
+ * Note here that it is the job of the individual opcode functions to check
+ * that enough data was provided. I.e. in the last command out (,0), out needs
+ * to check that there is not enough data provided to select an address/value
+ * for the operation.
+ */
+static void general_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
+{
+    void (*ops[]) (QTestState *s, const unsigned char* , size_t) = {
+        [OP_IN]                 = op_in,
+        [OP_OUT]                = op_out,
+        [OP_READ]               = op_read,
+        [OP_WRITE]              = op_write,
+        [OP_CLOCK_STEP]         = op_clock_step,
+    };
+    const unsigned char *cmd = Data;
+    const unsigned char *nextcmd;
+    size_t cmd_len;
+    uint8_t op;
+
+    if (fork() == 0) {
+        /*
+         * Sometimes the fuzzer will find inputs that take quite a long time to
+         * process. Often times, these inputs do not result in new coverage.
+         * Even if these inputs might be interesting, they can slow down the
+         * fuzzer, overall. Set a timeout to avoid hurting performance, too much
+         */
+        if (timeout) {
+            struct sigaction sact;
+            struct itimerval timer;
+
+            sigemptyset(&sact.sa_mask);
+            sact.sa_flags   = SA_NODEFER;
+            sact.sa_handler = handle_timeout;
+            sigaction(SIGALRM, &sact, NULL);
+
+            memset(&timer, 0, sizeof(timer));
+            timer.it_value.tv_sec = timeout / USEC_IN_SEC;
+            timer.it_value.tv_usec = timeout % USEC_IN_SEC;
+            setitimer(ITIMER_VIRTUAL, &timer, NULL);
+        }
+
+        while (cmd && Size) {
+            /* Get the length until the next command or end of input */
+            nextcmd = memmem(cmd, Size, SEPARATOR, strlen(SEPARATOR));
+            cmd_len = nextcmd ? nextcmd - cmd : Size;
+
+            if (cmd_len > 0) {
+                /* Interpret the first byte of the command as an opcode */
+                op = *cmd % (sizeof(ops) / sizeof((ops)[0]));
+                ops[op](s, cmd + 1, cmd_len - 1);
+
+                /* Run the main loop */
+                flush_events(s);
+            }
+            /* Advance to the next command */
+            cmd = nextcmd ? nextcmd + sizeof(SEPARATOR) - 1 : nextcmd;
+            Size = Size - (cmd_len + sizeof(SEPARATOR) - 1);
+        }
+        _Exit(0);
+    } else {
+        flush_events(s);
+        wait(0);
+    }
+}
+
+static void usage(void)
+{
+    printf("Please specify the following environment variables:\n");
+    printf("QEMU_FUZZ_ARGS= the command line arguments passed to qemu\n");
+    printf("QEMU_FUZZ_OBJECTS= "
+            "a space separated list of QOM type names for objects to fuzz\n");
+    printf("Optionally: QEMU_FUZZ_TIMEOUT= Specify a custom timeout (us). "
+            "0 to disable. %d by default\n", timeout);
+    exit(0);
+}
+
+static int locate_fuzz_memory_regions(Object *child, void *opaque)
+{
+    const char *name;
+    MemoryRegion *mr;
+    if (object_dynamic_cast(child, TYPE_MEMORY_REGION)) {
+        mr = MEMORY_REGION(child);
+        if ((memory_region_is_ram(mr) ||
+            memory_region_is_ram_device(mr) ||
+            memory_region_is_rom(mr)) == false) {
+            name = object_get_canonical_path_component(child);
+            /*
+             * We don't want duplicate pointers to the same MemoryRegion, so
+             * try to remove copies of the pointer, before adding it.
+             */
+            g_hash_table_insert(fuzzable_memoryregions, mr, (gpointer)true);
+        }
+    }
+    return 0;
+}
+static int locate_fuzz_objects(Object *child, void *opaque)
+{
+    char *pattern = opaque;
+    if (g_pattern_match_simple(pattern, object_get_typename(child))) {
+        /* Find and save ptrs to any child MemoryRegions */
+        object_child_foreach_recursive(child, locate_fuzz_memory_regions, NULL);
+
+    } else if (object_dynamic_cast(OBJECT(child), TYPE_MEMORY_REGION)) {
+        if (g_pattern_match_simple(pattern,
+            object_get_canonical_path_component(child))) {
+            MemoryRegion *mr;
+            mr = MEMORY_REGION(child);
+            if ((memory_region_is_ram(mr) ||
+                 memory_region_is_ram_device(mr) ||
+                 memory_region_is_rom(mr)) == false) {
+                g_hash_table_insert(fuzzable_memoryregions, mr, (gpointer)true);
+            }
+        }
+    }
+    return 0;
+}
+
+static void general_pre_fuzz(QTestState *s)
+{
+    GHashTableIter iter;
+    MemoryRegion *mr;
+    char **result;
+
+    if (!getenv("QEMU_FUZZ_OBJECTS")) {
+        usage();
+    }
+    if (getenv("QTEST_LOG")) {
+        qtest_log_enabled = 1;
+    }
+    if (getenv("QEMU_FUZZ_TIMEOUT")) {
+        timeout = g_ascii_strtoll(getenv("QEMU_FUZZ_TIMEOUT"), NULL, 0);
+    }
+
+    fuzzable_memoryregions = g_hash_table_new(NULL, NULL);
+
+    result = g_strsplit(getenv("QEMU_FUZZ_OBJECTS"), " ", -1);
+    for (int i = 0; result[i] != NULL; i++) {
+        printf("Matching objects by name %s\n", result[i]);
+        object_child_foreach_recursive(qdev_get_machine(),
+                                    locate_fuzz_objects,
+                                    result[i]);
+    }
+    g_strfreev(result);
+    printf("This process will try to fuzz the following MemoryRegions:\n");
+
+    g_hash_table_iter_init(&iter, fuzzable_memoryregions);
+    while (g_hash_table_iter_next(&iter, (gpointer)&mr, NULL)) {
+        printf("  * %s (size %lx)\n",
+               object_get_canonical_path_component(&(mr->parent_obj)),
+               mr->addr);
+    }
+
+    if (!g_hash_table_size(fuzzable_memoryregions)) {
+        printf("No fuzzable memory regions found...\n");
+        exit(1);
+    }
+
+    counter_shm_init();
+}
+static GString *general_fuzz_cmdline(FuzzTarget *t)
+{
+    GString *cmd_line = g_string_new(TARGET_NAME);
+    if (!getenv("QEMU_FUZZ_ARGS")) {
+        usage();
+    }
+    g_string_append_printf(cmd_line, " -display none \
+                                      -machine accel=qtest, \
+                                      -m 64 %s ", getenv("QEMU_FUZZ_ARGS"));
+    return cmd_line;
+}
+
+static void register_general_fuzz_targets(void)
+{
+    fuzz_add_target(&(FuzzTarget){
+            .name = "general-fuzz",
+            .description = "Fuzz based on any qemu command-line args. ",
+            .get_init_cmdline = general_fuzz_cmdline,
+            .pre_fuzz = general_pre_fuzz,
+            .fuzz = general_fuzz});
+}
+
+fuzz_target_init(register_general_fuzz_targets);
diff --git a/tests/qtest/fuzz/meson.build b/tests/qtest/fuzz/meson.build
index b31ace7d5a..a59de6aa8c 100644
--- a/tests/qtest/fuzz/meson.build
+++ b/tests/qtest/fuzz/meson.build
@@ -5,6 +5,7 @@ specific_fuzz_ss.add(files('fuzz.c', 'fork_fuzz.c', 'qos_fuzz.c',
 specific_fuzz_ss.add(when: 'CONFIG_I440FX', if_true: files('i440fx_fuzz.c'))
 specific_fuzz_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('virtio_net_fuzz.c'))
 specific_fuzz_ss.add(when: 'CONFIG_VIRTIO_SCSI', if_true: files('virtio_scsi_fuzz.c'))
+specific_fuzz_ss.add(files('general_fuzz.c'))
 
 fork_fuzz = declare_dependency(
   link_args: config_host['FUZZ_EXE_LDFLAGS'].split() +
-- 
2.28.0



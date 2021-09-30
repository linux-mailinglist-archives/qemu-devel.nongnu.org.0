Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AD641DD6D
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:28:10 +0200 (CEST)
Received: from localhost ([::1]:59340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVxyj-0007Qx-9u
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:28:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjN-0000FP-KM
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:17 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjH-0003xt-3b
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:16 -0400
Received: by mail-wr1-x433.google.com with SMTP id h15so9052681wrc.3
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 08:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=XLebwh8ygRsd0Pf9EoW0+q/5vT4Ko+x+7OO6En4P6kU=;
 b=OBfgKPxoepN8Ur58uq0IwGQzi/UtFGNMFzSAdjebrbPUiDr/qRHveYxCbsHqbdL9rH
 Zzh1qVdhDS+xAglnhhZiqB0TSK4ixPvD1djY3TpwwmjadhJJ9VoPXHUTytusbE/9v+JQ
 z5plU3VBWatkJox0AUONCrXkFCvJDr+eahJqmbNCZmYYEOlSwx10qJVaoSWkicLx+jpa
 YSuDTFIrQrJdJsVHGFIcgRZ3IaVld+AGLtX0WYjiNKXd4+0Ne2l1EGRqVTGXwxqdd57H
 99eY1CO2V+dAiqEcFh/DkVZL5c2hcWKwHVHO9FOkC2nBCP1FKQxqvLmoZpXzZsZkvgVt
 hkdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XLebwh8ygRsd0Pf9EoW0+q/5vT4Ko+x+7OO6En4P6kU=;
 b=LdFkHJua30vQYmF5w3/ukw278Uy5rCGfLr5dQQtsHh1CXk1tbRg9BHY/hRsl1JYKxU
 tT/cQ7ivnalY82a5ETyAITiLFTmu0hzTQMrZ9t//gRqtn7lqD2nW9+haEgIQydYtrKm/
 LcqWj7vnuYEOJc1nxdhE5d3Us/kc2wni6JBTb/r0kselr52QjbVGt4m79d1KMWbgItLT
 oqOak9h0PeyM3mlJTsS9e3VxAazCiYHX8gMaf+adhwZgm4jR4/IcBRldzeBVOurW8Kvd
 tgAVPUrAw6Er0/HgDNfxHgpAgC+59EXq4YsebxnptzLETImL1yMRzqVF+NS84mX0o6GL
 /xFg==
X-Gm-Message-State: AOAM530bcFGfdZuFMyKSNkR45U6dEdXhcFoUoebHxePMfwlT5vIJDd7/
 zdeUzvFXpS7JVO04fHZx8EVgCXx1Ekt7jw==
X-Google-Smtp-Source: ABdhPJwEXlFqiuljwiZpG81+8lbvS48u9eD5+kV8ISL+FE9TQwkcqT5LqIti+o7KgJvpLktw+qYn/Q==
X-Received: by 2002:adf:f481:: with SMTP id l1mr6702236wro.411.1633014729707; 
 Thu, 30 Sep 2021 08:12:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g8sm1952098wrm.46.2021.09.30.08.12.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 08:12:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/22] hw/nvram: Introduce Xilinx battery-backed ram
Date: Thu, 30 Sep 2021 16:11:45 +0100
Message-Id: <20210930151201.9407-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210930151201.9407-1-peter.maydell@linaro.org>
References: <20210930151201.9407-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tong Ho <tong.ho@xilinx.com>

This device is present in Versal and ZynqMP product
families to store a 256-bit encryption key.

Co-authored-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Co-authored-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Tong Ho <tong.ho@xilinx.com>
Message-id: 20210917052400.1249094-5-tong.ho@xilinx.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/nvram/xlnx-bbram.h |  54 ++++
 hw/nvram/xlnx-bbram.c         | 545 ++++++++++++++++++++++++++++++++++
 hw/nvram/Kconfig              |   4 +
 hw/nvram/meson.build          |   1 +
 4 files changed, 604 insertions(+)
 create mode 100644 include/hw/nvram/xlnx-bbram.h
 create mode 100644 hw/nvram/xlnx-bbram.c

diff --git a/include/hw/nvram/xlnx-bbram.h b/include/hw/nvram/xlnx-bbram.h
new file mode 100644
index 00000000000..87d59ef3c0c
--- /dev/null
+++ b/include/hw/nvram/xlnx-bbram.h
@@ -0,0 +1,54 @@
+/*
+ * QEMU model of the Xilinx BBRAM Battery Backed RAM
+ *
+ * Copyright (c) 2015-2021 Xilinx Inc.
+ *
+ * Written by Edgar E. Iglesias <edgari@xilinx.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+#ifndef XLNX_BBRAM_H
+#define XLNX_BBRAM_H
+
+#include "sysemu/block-backend.h"
+#include "hw/qdev-core.h"
+#include "hw/irq.h"
+#include "hw/sysbus.h"
+#include "hw/register.h"
+
+#define RMAX_XLNX_BBRAM ((0x4c / 4) + 1)
+
+#define TYPE_XLNX_BBRAM "xlnx,bbram-ctrl"
+OBJECT_DECLARE_SIMPLE_TYPE(XlnxBBRam, XLNX_BBRAM);
+
+struct XlnxBBRam {
+    SysBusDevice parent_obj;
+    qemu_irq irq_bbram;
+
+    BlockBackend *blk;
+
+    uint32_t crc_zpads;
+    bool bbram8_wo;
+    bool blk_ro;
+
+    uint32_t regs[RMAX_XLNX_BBRAM];
+    RegisterInfo regs_info[RMAX_XLNX_BBRAM];
+};
+
+#endif
diff --git a/hw/nvram/xlnx-bbram.c b/hw/nvram/xlnx-bbram.c
new file mode 100644
index 00000000000..b70828e5bf1
--- /dev/null
+++ b/hw/nvram/xlnx-bbram.c
@@ -0,0 +1,545 @@
+/*
+ * QEMU model of the Xilinx BBRAM Battery Backed RAM
+ *
+ * Copyright (c) 2014-2021 Xilinx Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/nvram/xlnx-bbram.h"
+
+#include "qemu/error-report.h"
+#include "qemu/log.h"
+#include "qapi/error.h"
+#include "sysemu/blockdev.h"
+#include "migration/vmstate.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
+#include "hw/nvram/xlnx-efuse.h"
+
+#ifndef XLNX_BBRAM_ERR_DEBUG
+#define XLNX_BBRAM_ERR_DEBUG 0
+#endif
+
+REG32(BBRAM_STATUS, 0x0)
+    FIELD(BBRAM_STATUS, AES_CRC_PASS, 9, 1)
+    FIELD(BBRAM_STATUS, AES_CRC_DONE, 8, 1)
+    FIELD(BBRAM_STATUS, BBRAM_ZEROIZED, 4, 1)
+    FIELD(BBRAM_STATUS, PGM_MODE, 0, 1)
+REG32(BBRAM_CTRL, 0x4)
+    FIELD(BBRAM_CTRL, ZEROIZE, 0, 1)
+REG32(PGM_MODE, 0x8)
+REG32(BBRAM_AES_CRC, 0xc)
+REG32(BBRAM_0, 0x10)
+REG32(BBRAM_1, 0x14)
+REG32(BBRAM_2, 0x18)
+REG32(BBRAM_3, 0x1c)
+REG32(BBRAM_4, 0x20)
+REG32(BBRAM_5, 0x24)
+REG32(BBRAM_6, 0x28)
+REG32(BBRAM_7, 0x2c)
+REG32(BBRAM_8, 0x30)
+REG32(BBRAM_SLVERR, 0x34)
+    FIELD(BBRAM_SLVERR, ENABLE, 0, 1)
+REG32(BBRAM_ISR, 0x38)
+    FIELD(BBRAM_ISR, APB_SLVERR, 0, 1)
+REG32(BBRAM_IMR, 0x3c)
+    FIELD(BBRAM_IMR, APB_SLVERR, 0, 1)
+REG32(BBRAM_IER, 0x40)
+    FIELD(BBRAM_IER, APB_SLVERR, 0, 1)
+REG32(BBRAM_IDR, 0x44)
+    FIELD(BBRAM_IDR, APB_SLVERR, 0, 1)
+REG32(BBRAM_MSW_LOCK, 0x4c)
+    FIELD(BBRAM_MSW_LOCK, VAL, 0, 1)
+
+#define R_MAX (R_BBRAM_MSW_LOCK + 1)
+
+#define RAM_MAX (A_BBRAM_8 + 4 - A_BBRAM_0)
+
+#define BBRAM_PGM_MAGIC 0x757bdf0d
+
+QEMU_BUILD_BUG_ON(R_MAX != ARRAY_SIZE(((XlnxBBRam *)0)->regs));
+
+static bool bbram_msw_locked(XlnxBBRam *s)
+{
+    return ARRAY_FIELD_EX32(s->regs, BBRAM_MSW_LOCK, VAL) != 0;
+}
+
+static bool bbram_pgm_enabled(XlnxBBRam *s)
+{
+    return ARRAY_FIELD_EX32(s->regs, BBRAM_STATUS, PGM_MODE) != 0;
+}
+
+static void bbram_bdrv_error(XlnxBBRam *s, int rc, gchar *detail)
+{
+    Error *errp;
+
+    error_setg_errno(&errp, -rc, "%s: BBRAM backstore %s failed.",
+                     blk_name(s->blk), detail);
+    error_report("%s", error_get_pretty(errp));
+    error_free(errp);
+
+    g_free(detail);
+}
+
+static void bbram_bdrv_read(XlnxBBRam *s, Error **errp)
+{
+    uint32_t *ram = &s->regs[R_BBRAM_0];
+    int nr = RAM_MAX;
+
+    if (!s->blk) {
+        return;
+    }
+
+    s->blk_ro = !blk_supports_write_perm(s->blk);
+    if (!s->blk_ro) {
+        int rc;
+
+        rc = blk_set_perm(s->blk,
+                          (BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE),
+                          BLK_PERM_ALL, NULL);
+        if (rc) {
+            s->blk_ro = true;
+        }
+    }
+    if (s->blk_ro) {
+        warn_report("%s: Skip saving updates to read-only BBRAM backstore.",
+                    blk_name(s->blk));
+    }
+
+    if (blk_pread(s->blk, 0, ram, nr) < 0) {
+        error_setg(errp,
+                   "%s: Failed to read %u bytes from BBRAM backstore.",
+                   blk_name(s->blk), nr);
+        return;
+    }
+
+    /* Convert from little-endian backstore for each 32-bit word */
+    nr /= 4;
+    while (nr--) {
+        ram[nr] = le32_to_cpu(ram[nr]);
+    }
+}
+
+static void bbram_bdrv_sync(XlnxBBRam *s, uint64_t hwaddr)
+{
+    uint32_t le32;
+    unsigned offset;
+    int rc;
+
+    assert(A_BBRAM_0 <= hwaddr && hwaddr <= A_BBRAM_8);
+
+    /* Backstore is always in little-endian */
+    le32 = cpu_to_le32(s->regs[hwaddr / 4]);
+
+    /* Update zeroized flag */
+    if (le32 && (hwaddr != A_BBRAM_8 || s->bbram8_wo)) {
+        ARRAY_FIELD_DP32(s->regs, BBRAM_STATUS, BBRAM_ZEROIZED, 0);
+    }
+
+    if (!s->blk || s->blk_ro) {
+        return;
+    }
+
+    offset = hwaddr - A_BBRAM_0;
+    rc = blk_pwrite(s->blk, offset, &le32, 4, 0);
+    if (rc < 0) {
+        bbram_bdrv_error(s, rc, g_strdup_printf("write to offset %u", offset));
+    }
+}
+
+static void bbram_bdrv_zero(XlnxBBRam *s)
+{
+    int rc;
+
+    ARRAY_FIELD_DP32(s->regs, BBRAM_STATUS, BBRAM_ZEROIZED, 1);
+
+    if (!s->blk || s->blk_ro) {
+        return;
+    }
+
+    rc = blk_make_zero(s->blk, 0);
+    if (rc < 0) {
+        bbram_bdrv_error(s, rc, g_strdup("zeroizing"));
+    }
+
+    /* Restore bbram8 if it is non-zero */
+    if (s->regs[R_BBRAM_8]) {
+        bbram_bdrv_sync(s, A_BBRAM_8);
+    }
+}
+
+static void bbram_zeroize(XlnxBBRam *s)
+{
+    int nr = RAM_MAX - (s->bbram8_wo ? 0 : 4); /* only wo bbram8 is cleared */
+
+    memset(&s->regs[R_BBRAM_0], 0, nr);
+    bbram_bdrv_zero(s);
+}
+
+static void bbram_update_irq(XlnxBBRam *s)
+{
+    bool pending = s->regs[R_BBRAM_ISR] & ~s->regs[R_BBRAM_IMR];
+
+    qemu_set_irq(s->irq_bbram, pending);
+}
+
+static void bbram_ctrl_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxBBRam *s = XLNX_BBRAM(reg->opaque);
+    uint32_t val = val64;
+
+    if (val & R_BBRAM_CTRL_ZEROIZE_MASK) {
+        bbram_zeroize(s);
+        /* The bit is self clearing */
+        s->regs[R_BBRAM_CTRL] &= ~R_BBRAM_CTRL_ZEROIZE_MASK;
+    }
+}
+
+static void bbram_pgm_mode_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxBBRam *s = XLNX_BBRAM(reg->opaque);
+    uint32_t val = val64;
+
+    if (val == BBRAM_PGM_MAGIC) {
+        bbram_zeroize(s);
+
+        /* The status bit is cleared only by POR */
+        ARRAY_FIELD_DP32(s->regs, BBRAM_STATUS, PGM_MODE, 1);
+    }
+}
+
+static void bbram_aes_crc_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxBBRam *s = XLNX_BBRAM(reg->opaque);
+    uint32_t calc_crc;
+
+    if (!bbram_pgm_enabled(s)) {
+        /* We are not in programming mode, don't do anything */
+        return;
+    }
+
+    /* Perform the AES integrity check */
+    s->regs[R_BBRAM_STATUS] |= R_BBRAM_STATUS_AES_CRC_DONE_MASK;
+
+    /*
+     * Set check status.
+     *
+     * ZynqMP BBRAM check has a zero-u32 prepended; see:
+     *  https://github.com/Xilinx/embeddedsw/blob/release-2019.2/lib/sw_services/xilskey/src/xilskey_bbramps_zynqmp.c#L311
+     */
+    calc_crc = xlnx_efuse_calc_crc(&s->regs[R_BBRAM_0],
+                                   (R_BBRAM_8 - R_BBRAM_0), s->crc_zpads);
+
+    ARRAY_FIELD_DP32(s->regs, BBRAM_STATUS, AES_CRC_PASS,
+                     (s->regs[R_BBRAM_AES_CRC] == calc_crc));
+}
+
+static uint64_t bbram_key_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxBBRam *s = XLNX_BBRAM(reg->opaque);
+    uint32_t original_data = *(uint32_t *) reg->data;
+
+    if (bbram_pgm_enabled(s)) {
+        return val64;
+    } else {
+        /* We are not in programming mode, don't do anything */
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "Not in programming mode, dropping the write\n");
+        return original_data;
+    }
+}
+
+static void bbram_key_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxBBRam *s = XLNX_BBRAM(reg->opaque);
+
+    bbram_bdrv_sync(s, reg->access->addr);
+}
+
+static uint64_t bbram_wo_postr(RegisterInfo *reg, uint64_t val)
+{
+    return 0;
+}
+
+static uint64_t bbram_r8_postr(RegisterInfo *reg, uint64_t val)
+{
+    XlnxBBRam *s = XLNX_BBRAM(reg->opaque);
+
+    return s->bbram8_wo ? bbram_wo_postr(reg, val) : val;
+}
+
+static bool bbram_r8_readonly(XlnxBBRam *s)
+{
+    return !bbram_pgm_enabled(s) || bbram_msw_locked(s);
+}
+
+static uint64_t bbram_r8_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxBBRam *s = XLNX_BBRAM(reg->opaque);
+
+    if (bbram_r8_readonly(s)) {
+        val64 = *(uint32_t *)reg->data;
+    }
+
+    return val64;
+}
+
+static void bbram_r8_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxBBRam *s = XLNX_BBRAM(reg->opaque);
+
+    if (!bbram_r8_readonly(s)) {
+        bbram_bdrv_sync(s, A_BBRAM_8);
+    }
+}
+
+static uint64_t bbram_msw_lock_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxBBRam *s = XLNX_BBRAM(reg->opaque);
+
+    /* Never lock if bbram8 is wo; and, only POR can clear the lock */
+    if (s->bbram8_wo) {
+        val64 = 0;
+    } else {
+        val64 |= s->regs[R_BBRAM_MSW_LOCK];
+    }
+
+    return val64;
+}
+
+static void bbram_isr_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxBBRam *s = XLNX_BBRAM(reg->opaque);
+
+    bbram_update_irq(s);
+}
+
+static uint64_t bbram_ier_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxBBRam *s = XLNX_BBRAM(reg->opaque);
+    uint32_t val = val64;
+
+    s->regs[R_BBRAM_IMR] &= ~val;
+    bbram_update_irq(s);
+    return 0;
+}
+
+static uint64_t bbram_idr_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxBBRam *s = XLNX_BBRAM(reg->opaque);
+    uint32_t val = val64;
+
+    s->regs[R_BBRAM_IMR] |= val;
+    bbram_update_irq(s);
+    return 0;
+}
+
+static RegisterAccessInfo bbram_ctrl_regs_info[] = {
+    {   .name = "BBRAM_STATUS",  .addr = A_BBRAM_STATUS,
+        .rsvd = 0xee,
+        .ro = 0x3ff,
+    },{ .name = "BBRAM_CTRL",  .addr = A_BBRAM_CTRL,
+        .post_write = bbram_ctrl_postw,
+    },{ .name = "PGM_MODE",  .addr = A_PGM_MODE,
+        .post_write = bbram_pgm_mode_postw,
+    },{ .name = "BBRAM_AES_CRC",  .addr = A_BBRAM_AES_CRC,
+        .post_write = bbram_aes_crc_postw,
+        .post_read = bbram_wo_postr,
+    },{ .name = "BBRAM_0",  .addr = A_BBRAM_0,
+        .pre_write = bbram_key_prew,
+        .post_write = bbram_key_postw,
+        .post_read = bbram_wo_postr,
+    },{ .name = "BBRAM_1",  .addr = A_BBRAM_1,
+        .pre_write = bbram_key_prew,
+        .post_write = bbram_key_postw,
+        .post_read = bbram_wo_postr,
+    },{ .name = "BBRAM_2",  .addr = A_BBRAM_2,
+        .pre_write = bbram_key_prew,
+        .post_write = bbram_key_postw,
+        .post_read = bbram_wo_postr,
+    },{ .name = "BBRAM_3",  .addr = A_BBRAM_3,
+        .pre_write = bbram_key_prew,
+        .post_write = bbram_key_postw,
+        .post_read = bbram_wo_postr,
+    },{ .name = "BBRAM_4",  .addr = A_BBRAM_4,
+        .pre_write = bbram_key_prew,
+        .post_write = bbram_key_postw,
+        .post_read = bbram_wo_postr,
+    },{ .name = "BBRAM_5",  .addr = A_BBRAM_5,
+        .pre_write = bbram_key_prew,
+        .post_write = bbram_key_postw,
+        .post_read = bbram_wo_postr,
+    },{ .name = "BBRAM_6",  .addr = A_BBRAM_6,
+        .pre_write = bbram_key_prew,
+        .post_write = bbram_key_postw,
+        .post_read = bbram_wo_postr,
+    },{ .name = "BBRAM_7",  .addr = A_BBRAM_7,
+        .pre_write = bbram_key_prew,
+        .post_write = bbram_key_postw,
+        .post_read = bbram_wo_postr,
+    },{ .name = "BBRAM_8",  .addr = A_BBRAM_8,
+        .pre_write = bbram_r8_prew,
+        .post_write = bbram_r8_postw,
+        .post_read = bbram_r8_postr,
+    },{ .name = "BBRAM_SLVERR",  .addr = A_BBRAM_SLVERR,
+        .rsvd = ~1,
+    },{ .name = "BBRAM_ISR",  .addr = A_BBRAM_ISR,
+        .w1c = 0x1,
+        .post_write = bbram_isr_postw,
+    },{ .name = "BBRAM_IMR",  .addr = A_BBRAM_IMR,
+        .ro = 0x1,
+    },{ .name = "BBRAM_IER",  .addr = A_BBRAM_IER,
+        .pre_write = bbram_ier_prew,
+    },{ .name = "BBRAM_IDR",  .addr = A_BBRAM_IDR,
+        .pre_write = bbram_idr_prew,
+    },{ .name = "BBRAM_MSW_LOCK",  .addr = A_BBRAM_MSW_LOCK,
+        .pre_write = bbram_msw_lock_prew,
+        .ro = ~R_BBRAM_MSW_LOCK_VAL_MASK,
+    }
+};
+
+static void bbram_ctrl_reset(DeviceState *dev)
+{
+    XlnxBBRam *s = XLNX_BBRAM(dev);
+    unsigned int i;
+
+    for (i = 0; i < ARRAY_SIZE(s->regs_info); ++i) {
+        if (i < R_BBRAM_0 || i > R_BBRAM_8) {
+            register_reset(&s->regs_info[i]);
+        }
+    }
+
+    bbram_update_irq(s);
+}
+
+static const MemoryRegionOps bbram_ctrl_ops = {
+    .read = register_read_memory,
+    .write = register_write_memory,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+static void bbram_ctrl_realize(DeviceState *dev, Error **errp)
+{
+    XlnxBBRam *s = XLNX_BBRAM(dev);
+
+    if (s->crc_zpads) {
+        s->bbram8_wo = true;
+    }
+
+    bbram_bdrv_read(s, errp);
+}
+
+static void bbram_ctrl_init(Object *obj)
+{
+    XlnxBBRam *s = XLNX_BBRAM(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    RegisterInfoArray *reg_array;
+
+    reg_array =
+        register_init_block32(DEVICE(obj), bbram_ctrl_regs_info,
+                              ARRAY_SIZE(bbram_ctrl_regs_info),
+                              s->regs_info, s->regs,
+                              &bbram_ctrl_ops,
+                              XLNX_BBRAM_ERR_DEBUG,
+                              R_MAX * 4);
+
+    sysbus_init_mmio(sbd, &reg_array->mem);
+    sysbus_init_irq(sbd, &s->irq_bbram);
+}
+
+static void bbram_prop_set_drive(Object *obj, Visitor *v, const char *name,
+                                 void *opaque, Error **errp)
+{
+    DeviceState *dev = DEVICE(obj);
+
+    qdev_prop_drive.set(obj, v, name, opaque, errp);
+
+    /* Fill initial data if backend is attached after realized */
+    if (dev->realized) {
+        bbram_bdrv_read(XLNX_BBRAM(obj), errp);
+    }
+}
+
+static void bbram_prop_get_drive(Object *obj, Visitor *v, const char *name,
+                                 void *opaque, Error **errp)
+{
+    qdev_prop_drive.get(obj, v, name, opaque, errp);
+}
+
+static void bbram_prop_release_drive(Object *obj, const char *name,
+                                     void *opaque)
+{
+    qdev_prop_drive.release(obj, name, opaque);
+}
+
+static const PropertyInfo bbram_prop_drive = {
+    .name  = "str",
+    .description = "Node name or ID of a block device to use as BBRAM backend",
+    .realized_set_allowed = true,
+    .get = bbram_prop_get_drive,
+    .set = bbram_prop_set_drive,
+    .release = bbram_prop_release_drive,
+};
+
+static const VMStateDescription vmstate_bbram_ctrl = {
+    .name = TYPE_XLNX_BBRAM,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, XlnxBBRam, R_MAX),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static Property bbram_ctrl_props[] = {
+    DEFINE_PROP("drive", XlnxBBRam, blk, bbram_prop_drive, BlockBackend *),
+    DEFINE_PROP_UINT32("crc-zpads", XlnxBBRam, crc_zpads, 1),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void bbram_ctrl_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = bbram_ctrl_reset;
+    dc->realize = bbram_ctrl_realize;
+    dc->vmsd = &vmstate_bbram_ctrl;
+    device_class_set_props(dc, bbram_ctrl_props);
+}
+
+static const TypeInfo bbram_ctrl_info = {
+    .name          = TYPE_XLNX_BBRAM,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(XlnxBBRam),
+    .class_init    = bbram_ctrl_class_init,
+    .instance_init = bbram_ctrl_init,
+};
+
+static void bbram_ctrl_register_types(void)
+{
+    type_register_static(&bbram_ctrl_info);
+}
+
+type_init(bbram_ctrl_register_types)
diff --git a/hw/nvram/Kconfig b/hw/nvram/Kconfig
index 3059c5dae03..24cfc18f8b1 100644
--- a/hw/nvram/Kconfig
+++ b/hw/nvram/Kconfig
@@ -30,3 +30,7 @@ config XLNX_EFUSE_VERSAL
 config XLNX_EFUSE_ZYNQMP
     bool
     select XLNX_EFUSE
+
+config XLNX_BBRAM
+    bool
+    select XLNX_EFUSE_CRC
diff --git a/hw/nvram/meson.build b/hw/nvram/meson.build
index 6dc54d98734..202a5466e63 100644
--- a/hw/nvram/meson.build
+++ b/hw/nvram/meson.build
@@ -16,5 +16,6 @@ softmmu_ss.add(when: 'CONFIG_XLNX_EFUSE_VERSAL', if_true: files(
                                                    'xlnx-versal-efuse-ctrl.c'))
 softmmu_ss.add(when: 'CONFIG_XLNX_EFUSE_ZYNQMP', if_true: files(
                                                    'xlnx-zynqmp-efuse.c'))
+softmmu_ss.add(when: 'CONFIG_XLNX_BBRAM', if_true: files('xlnx-bbram.c'))
 
 specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('spapr_nvram.c'))
-- 
2.20.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BFC2B9D69
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 23:11:18 +0100 (CET)
Received: from localhost ([::1]:58354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfs97-0002KZ-Df
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 17:11:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrvL-0001AB-HL
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:57:03 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:47074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrv8-0004Gu-V1
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:57:03 -0500
Received: by mail-wr1-x444.google.com with SMTP id d12so7934425wrr.13
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 13:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CpeB0JZIf82ouGJAcXNi10kk5fwgUTHRGskoxQo7vDg=;
 b=tgNXkwZkzO8/NMl+u6brb0gRnqRQ9Zl9qth9CQwq5YqWCNeUOnD6vZzuOV72Wh6IMS
 nFrJVTntqy2y6q9z95NeVtwtnLKR1coHlH69KSh01p9ZlN1BE5WmK5qWtw/vsQZb6sWB
 hE6dn8HMkgnf5RMrtJwGz439OggcRc1CmV9SbPV9NdZi0RGwXuZwQ1PNcf+rfRmwNB+i
 s1nGD0KD4l8S/zfMDzOtuXzPof1wzcFILB4Nn0dvJKLIwpHm1PSwqE6RGmvuzch+gGS2
 pf4J1O6G9c8frSl5SBBzH7gyd9BFzs341zIPCby6ywwA+Tr74YYvSVHtJ2MopTBVJt1q
 la7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CpeB0JZIf82ouGJAcXNi10kk5fwgUTHRGskoxQo7vDg=;
 b=kO/nE3EkXr5GG9wGMnTpV0QqABxQOwbqdaRt8DpP1JuQNfPkl0C/MK+lm2ogtzHoQm
 ia//JkK6+Cx8nxsO1cXEbhyX33llSaAhCnYlu3c6SlX8AYDIsC0JwUjA/kcj2SLB+Uhb
 fkjtP+eEU3QpLnrQHdtJAvuJjAV0Jh7bsx/RMisrw252cgBwIsyvDiELyn9ZZukGBCS5
 eDifDH19XsTdfOdshoXTn+6XTVJ7f0WPCW5g09tlTvVMy/wOy0E2nm+IAVejiATl9Vjs
 sWBplmbDUvglF2ASBO5YbV+QXkZf5EdRdw5FhFHDE2nn78W53YQHmKSH7RBuxU5JDXu4
 ImZQ==
X-Gm-Message-State: AOAM533OwZJJR/nZZWf0dqMNJ+J1wNGNGipmWHS22/JUEfMZNJ71bEwQ
 7xqv0NPa6iVR+rfxGbACXGcGgHeCRJLLSw==
X-Google-Smtp-Source: ABdhPJx7sCOAACqCZbXA+CHbwJtI7rCIQHrufUSImsSy/g7hGs4OTWJdLMPDRVufG3P4Uco+M9VyUg==
X-Received: by 2002:adf:db87:: with SMTP id u7mr12938687wri.334.1605823009436; 
 Thu, 19 Nov 2020 13:56:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 26/28] hw/intc/armv7m_nvic: Implement read/write for RAS
 register block
Date: Thu, 19 Nov 2020 21:56:15 +0000
Message-Id: <20201119215617.29887-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
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

The RAS feature has a block of memory-mapped registers at offset
0x5000 within the PPB.  For a "minimal RAS" implementation we provide
no error records and so the only registers that exist in the block
are ERRIIDR and ERRDEVID.

The "RAZ/WI for privileged, BusFault for nonprivileged" behaviour
of the "nvic-default" region is actually valid for minimal-RAS,
so the main benefit of providing an explicit implementation of
the register block is more accurate LOG_UNIMP messages, and a
framework for where we could add a real RAS implementation later
if necessary.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/intc/armv7m_nvic.h |  1 +
 hw/intc/armv7m_nvic.c         | 56 +++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
index 33b6d8810c7..39c71e15936 100644
--- a/include/hw/intc/armv7m_nvic.h
+++ b/include/hw/intc/armv7m_nvic.h
@@ -83,6 +83,7 @@ struct NVICState {
     MemoryRegion sysreg_ns_mem;
     MemoryRegion systickmem;
     MemoryRegion systick_ns_mem;
+    MemoryRegion ras_mem;
     MemoryRegion container;
     MemoryRegion defaultmem;
 
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index c42b291f881..5ab77a3530c 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -2530,6 +2530,56 @@ static const MemoryRegionOps nvic_systick_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+
+static MemTxResult ras_read(void *opaque, hwaddr addr,
+                            uint64_t *data, unsigned size,
+                            MemTxAttrs attrs)
+{
+    if (attrs.user) {
+        return MEMTX_ERROR;
+    }
+
+    switch (addr) {
+    case 0xe10: /* ERRIIDR */
+        /* architect field = Arm; product/variant/revision 0 */
+        *data = 0x43b;
+        break;
+    case 0xfc8: /* ERRDEVID */
+        /* Minimal RAS: we implement 0 error record indexes */
+        *data = 0;
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "Read RAS register offset 0x%x\n",
+                      (uint32_t)addr);
+        *data = 0;
+        break;
+    }
+    return MEMTX_OK;
+}
+
+static MemTxResult ras_write(void *opaque, hwaddr addr,
+                             uint64_t value, unsigned size,
+                             MemTxAttrs attrs)
+{
+    if (attrs.user) {
+        return MEMTX_ERROR;
+    }
+
+    switch (addr) {
+    default:
+        qemu_log_mask(LOG_UNIMP, "Write to RAS register offset 0x%x\n",
+                      (uint32_t)addr);
+        break;
+    }
+    return MEMTX_OK;
+}
+
+static const MemoryRegionOps ras_ops = {
+    .read_with_attrs = ras_read,
+    .write_with_attrs = ras_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
 /*
  * Unassigned portions of the PPB space are RAZ/WI for privileged
  * accesses, and fault for non-privileged accesses.
@@ -2877,6 +2927,12 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
                                             &s->systick_ns_mem, 1);
     }
 
+    if (cpu_isar_feature(aa32_ras, s->cpu)) {
+        memory_region_init_io(&s->ras_mem, OBJECT(s),
+                              &ras_ops, s, "nvic_ras", 0x1000);
+        memory_region_add_subregion(&s->container, 0x5000, &s->ras_mem);
+    }
+
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->container);
 }
 
-- 
2.20.1



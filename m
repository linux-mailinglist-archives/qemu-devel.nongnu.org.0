Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E90332D5A3F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:18:36 +0100 (CET)
Received: from localhost ([::1]:52514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKu3-00085l-UI
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:18:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKRD-0001nJ-AQ
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:47 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:38389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKR5-0007B2-H8
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:47 -0500
Received: by mail-wm1-x335.google.com with SMTP id g185so4991211wmf.3
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BT772+aj96371qQWOpWUi9jEw0g+4W5E3EvvBQDFiZI=;
 b=CS5t5lnyAEeXji26uTeYmh4frOJNwr01ia1QyhsUjVMCeCJGCdv7ZlTtCGPh7W8jfH
 zzoPrlJJvPr13qKE8isMXqhTZRQfSoVZ107swKJrdeSzo8tbbPfPp4JFqBF4Gb5NtL5c
 QfHgloj1UUOYdCbj0O1OLbVSP7dbq1KRbcbh4r/Ym2rjtkZ4ANP4gOas56JAFipiIAJq
 13ueS90gh7oTK2Z//douUy5FU15TAYMJw+CjwIo2wooPb/ughwRemzNQy+F24nx7i3Ct
 CuKqcEjmZk2Bp32sqFP6ix+OMYh6S0g6tOK9jE7OBIyTvJRM7ILRpcJ61dyXL8z0DCDb
 KzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BT772+aj96371qQWOpWUi9jEw0g+4W5E3EvvBQDFiZI=;
 b=Wh1nm1ZtP2SmfdpuYWesctyR+x2JFT5GXGjeKQ/NKznCDdo1RuONhrIJo5FC2ZSFmN
 jwhm+B/ECi92iSe24meYp/z41PbDYA5gYw6B3WTtdbQu3O8KCQ9k3+S4+H9KIeTKTG9t
 SgoxEqFVFHApbEnpdwMHG1zBjKHD3eiQpgMkwPdZmvYkyRZU6ctSvZQ+UOBasCeebgCa
 /jzYG2QqDCOA79FU3yPFEVaZhbYltxpBF9L9mv7X/I77WSdc+oZWYM2zqXuhxfU9wFT+
 /GL23LhhL8rz/AottKDfo2Se+N5Q5Wop4TXIeIuOyydFlKoJaZyUlijhN+XFOW4j1D+p
 qC3Q==
X-Gm-Message-State: AOAM533ZW+nBJMkllTdTse4t6NKXgLby+GJnFofYGrGWTzy+9KheZ+HF
 BueZovTQF/vR6bh7bB76woP8WZiW7Y7pjQ==
X-Google-Smtp-Source: ABdhPJzgV0sI89+pduqYf3KKy9B9ZbKcIqjEM8LAS82lZc0YBmN+IkuiKoP7/I6CNEoyS9wFRY0Ofg==
X-Received: by 2002:a7b:c843:: with SMTP id c3mr7768746wml.100.1607600918010; 
 Thu, 10 Dec 2020 03:48:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.48.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:48:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/36] hw/intc/armv7m_nvic: Implement read/write for RAS
 register block
Date: Thu, 10 Dec 2020 11:47:55 +0000
Message-Id: <20201210114756.16501-36-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201119215617.29887-27-peter.maydell@linaro.org
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
index 01e331ab1e4..f63aa2d8713 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -2519,6 +2519,56 @@ static const MemoryRegionOps nvic_systick_ops = {
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
@@ -2866,6 +2916,12 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9903F1E11
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 18:38:26 +0200 (CEST)
Received: from localhost ([::1]:42116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGl3h-0000HV-PC
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 12:38:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGl08-0002mR-3k
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:34:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGl06-00060K-B4
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:34:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629390881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zypsqy4bbbHKSJYTV7SCgvLzNsZfKZVVCMytHeZVqM4=;
 b=ZqlA+ED5+kphrIR+MLKQQwoC5Uq+Rn9dyo2BuKOuVf2BgZtf+Ks/w3UCMTr5pX7U/mE4n8
 AOCQd0RviwyNdnY5Fx0QbSar0vj4qVe33DJAxyKWzAcWGH/mI+zU708xg3js+3Iw08p459
 7hK55CY8aR7VuXGPpgn1rVpXyBI/cR4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-eXz0TM5iOGuta7GGGwkeQQ-1; Thu, 19 Aug 2021 12:34:40 -0400
X-MC-Unique: eXz0TM5iOGuta7GGGwkeQQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 10-20020a05600c024a00b002e6bf2ee820so3677213wmj.6
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 09:34:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zypsqy4bbbHKSJYTV7SCgvLzNsZfKZVVCMytHeZVqM4=;
 b=oHoMBQ4u0K945jzxB6SRH5dlXUewi/f7tDt2iDBGdOBwlikQSUhrOzfL//ijBSoPhg
 kymi7fIBuHfGou7vw3USO0p7xLgVmetK4HxsAkl+9FHZyH0orHhE0nelinL0sBxAOL5N
 GxLW1MKQHzqHItEvwKV73JIEcgkVRfGdLXsbk0lrRzOODO/S0sE8pFzCuSn69zDUtlHz
 9OExysjX3I1gTJKRF3csDFWiOMBXOi8zSE94SjwYD+RmWDEonGzC5i6vE4F6Mw+obpF1
 OKUQF193I+KbJOLTC1W6tQa41CG5JHCrh4OMLG490R6C/MiaafFv4sMrGsPJw8uyRZQ8
 NsBQ==
X-Gm-Message-State: AOAM532IrzvzCA83oTTT34nXgfTnfRJu/hg1SeBS1V5mp1IPCWUEsw1P
 yxcjQUh/vYh8/3vLzNyJsgtohCo9n4SL0e75MGBAJxB7wO4X0I8fU/tOl/cEu8NuDEPh8ApD6V9
 LlqD0ZfJdVj3Yrhn8eulTJRClKjuHKFzDAq/TW90Hu6Iiu01Fgdl6ADgzid/LV2VZ
X-Received: by 2002:a7b:c2f0:: with SMTP id e16mr14558486wmk.144.1629390878626; 
 Thu, 19 Aug 2021 09:34:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAGPWSpgOnH0JBICXXHKKK05Tc60a5QFPC80BT4Z+hHxsrm06VfU/mKBdnX2nLXrsyvcnTFg==
X-Received: by 2002:a7b:c2f0:: with SMTP id e16mr14558463wmk.144.1629390878399; 
 Thu, 19 Aug 2021 09:34:38 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 m7sm7733487wmq.29.2021.08.19.09.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 09:34:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] hw/dma/xlnx_csu_dma: Always expect 'dma' link property
 to be set
Date: Thu, 19 Aug 2021 18:34:21 +0200
Message-Id: <20210819163422.2863447-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819163422.2863447-1-philmd@redhat.com>
References: <20210819163422.2863447-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simplify by always passing a MemoryRegion property to the device.
Doing so we can move the AddressSpace field to the device struct,
removing need for heap allocation.

Update the Xilinx ZynqMP SoC model to pass the default system
memory instead of a NULL value.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/dma/xlnx_csu_dma.h |  2 +-
 hw/arm/xlnx-zynqmp.c          |  4 ++++
 hw/dma/xlnx_csu_dma.c         | 21 ++++++++++-----------
 3 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/include/hw/dma/xlnx_csu_dma.h b/include/hw/dma/xlnx_csu_dma.h
index 204d94c6737..9e9dc551e99 100644
--- a/include/hw/dma/xlnx_csu_dma.h
+++ b/include/hw/dma/xlnx_csu_dma.h
@@ -30,7 +30,7 @@ typedef struct XlnxCSUDMA {
     MemoryRegion iomem;
     MemTxAttrs attr;
     MemoryRegion *dma_mr;
-    AddressSpace *dma_as;
+    AddressSpace dma_as;
     qemu_irq irq;
     StreamSink *tx_dev; /* Used as generic StreamSink */
     ptimer_state *src_timer;
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 9724978761b..4344e223f2d 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -620,6 +620,10 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
                            gic_spi[adma_ch_intr[i]]);
     }
 
+    if (!object_property_set_link(OBJECT(&s->qspi_dma), "dma",
+                                  OBJECT(system_memory), errp)) {
+        return;
+    }
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->qspi_dma), errp)) {
         return;
     }
diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
index 2d19f415ef3..896bb3574dd 100644
--- a/hw/dma/xlnx_csu_dma.c
+++ b/hw/dma/xlnx_csu_dma.c
@@ -201,11 +201,11 @@ static uint32_t xlnx_csu_dma_read(XlnxCSUDMA *s, uint8_t *buf, uint32_t len)
         for (i = 0; i < len && (result == MEMTX_OK); i += s->width) {
             uint32_t mlen = MIN(len - i, s->width);
 
-            result = address_space_rw(s->dma_as, addr, s->attr,
+            result = address_space_rw(&s->dma_as, addr, s->attr,
                                       buf + i, mlen, false);
         }
     } else {
-        result = address_space_rw(s->dma_as, addr, s->attr, buf, len, false);
+        result = address_space_rw(&s->dma_as, addr, s->attr, buf, len, false);
     }
 
     if (result == MEMTX_OK) {
@@ -232,12 +232,12 @@ static uint32_t xlnx_csu_dma_write(XlnxCSUDMA *s, uint8_t *buf, uint32_t len)
         for (i = 0; i < len && (result == MEMTX_OK); i += s->width) {
             uint32_t mlen = MIN(len - i, s->width);
 
-            result = address_space_rw(s->dma_as, addr, s->attr,
+            result = address_space_rw(&s->dma_as, addr, s->attr,
                                       buf, mlen, true);
             buf += mlen;
         }
     } else {
-        result = address_space_rw(s->dma_as, addr, s->attr, buf, len, true);
+        result = address_space_rw(&s->dma_as, addr, s->attr, buf, len, true);
     }
 
     if (result != MEMTX_OK) {
@@ -631,6 +631,12 @@ static void xlnx_csu_dma_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (!s->dma_mr) {
+        error_setg(errp, TYPE_XLNX_CSU_DMA " 'dma' link not set");
+        return;
+    }
+    address_space_init(&s->dma_as, s->dma_mr, "csu-dma");
+
     reg_array =
         register_init_block32(dev, xlnx_csu_dma_regs_info[!!s->is_dst],
                               XLNX_CSU_DMA_R_MAX,
@@ -648,13 +654,6 @@ static void xlnx_csu_dma_realize(DeviceState *dev, Error **errp)
     s->src_timer = ptimer_init(xlnx_csu_dma_src_timeout_hit,
                                s, PTIMER_POLICY_DEFAULT);
 
-    if (s->dma_mr) {
-        s->dma_as = g_malloc0(sizeof(AddressSpace));
-        address_space_init(s->dma_as, s->dma_mr, NULL);
-    } else {
-        s->dma_as = &address_space_memory;
-    }
-
     s->attr = MEMTXATTRS_UNSPECIFIED;
 
     s->r_size_last_word = 0;
-- 
2.31.1



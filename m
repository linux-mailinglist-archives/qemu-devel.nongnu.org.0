Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6BA6154FB
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 23:31:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opzlh-0002NK-1S; Tue, 01 Nov 2022 18:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opzlY-0002Kk-M6
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 18:29:52 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opzlV-0007cc-Qs
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 18:29:52 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 b20-20020a05600c4e1400b003cc28585e2fso200699wmq.1
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 15:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YZ4anaZ6hI4HPETot1D4DnNLgiXTFpZCZD/wdUdnR2M=;
 b=hgamiy5Q8oN5QVDRo5J9gcH8vLWZpbWVQq8f50yCf0cEkCpxDxWM/TV/YDMkFhj9dZ
 TRwZyPtvKtaSBPAAKNyg6HtH6nFdPlvK+kNiq8II6tlslCOV/jGzBoY4wUDaiif1ApCY
 y5J4jhv9b4YBge9b6TSO6mAqR8o/qX9wx8MDGj+P7dGWZtVPWJGcluyafO2Ht3dVNB8n
 Ffg12e1rgNhyDvq4iVsh/R8JGUJFB0TAIkJVHehvjVmDZWWcQkXQXBXQSPmb1k5Q6esq
 vLUUrFzFUAusj/a5NuG/HfOk/fUeOl2xnwk4mvcdIPeTR4J0wLMDuF3VQ1aj5Sx9riRI
 5iiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YZ4anaZ6hI4HPETot1D4DnNLgiXTFpZCZD/wdUdnR2M=;
 b=0wzukVD2PqD68mh3vVp7k+FBCERQGY4qZ3NVH1NvPcEsn5t71k8MsSCqZixS7b/gBj
 /XXxt9W4+w0bq6ajEJgV6ywEP9G/pqSpuHkZfYmvxxDWILhSoty+jS5byJU5XCUBkakZ
 xJTIc+HXhPeidLFCUXdn02RHAZIv3pvhYomrCgof9yCSsPsUivAubYxcyUvPEaHWZr6r
 8cyvLmNPssmpPqnDuH3sYNB39tU7AKpYXkEIsqB/m3EumKq5X9jv44kE09wFgMrNrwSj
 TcZBJru8JQUXUFvpujtf2YJiZr5FtxtoDhgm3x3zWQX5zobm7DjmV5iAevDqiixFbtO9
 h4FA==
X-Gm-Message-State: ACrzQf07OZNtv8+V64B/QSfGaLMzr9QxbiD1dtAW3P/At2dVx2dYkSag
 AXiLonVNjlVuQZ0mEwwj89MNyNnOhP2MrA==
X-Google-Smtp-Source: AMsMyM71h7EyWg4id4SL/HfEZDR3uPBdZYbiO8gXws6F4h5sw2Rr+iY7nSMDXo105wFz1r7rjyRDMw==
X-Received: by 2002:a7b:c005:0:b0:3c3:6b2a:33bf with SMTP id
 c5-20020a7bc005000000b003c36b2a33bfmr13185190wmb.167.1667341788100; 
 Tue, 01 Nov 2022 15:29:48 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e12-20020adfe38c000000b0023655e51c14sm11094134wrm.32.2022.11.01.15.29.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Nov 2022 15:29:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org
Subject: [PATCH v6 2/3] hw/sd/sdhci: Support big endian SD host controller
 interfaces
Date: Tue,  1 Nov 2022 23:29:33 +0100
Message-Id: <20221101222934.52444-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101222934.52444-1-philmd@linaro.org>
References: <20221101222934.52444-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Some SDHCI IP can be synthetized in various endianness:
https://github.com/u-boot/u-boot/blob/v2021.04/doc/README.fsl-esdhc

 - CONFIG_SYS_FSL_ESDHC_BE

   ESDHC IP is in big-endian mode. Accessing ESDHC registers can be
   determined by ESDHC IP's endian mode or processor's endian mode.

Our current implementation is little-endian. In order to support
big endianness:

- Rename current MemoryRegionOps as sdhci_mmio_le_ops ('le')
- Add an 'endianness' property to SDHCIState (default little endian)
- Set the 'io_ops' field in realize() after checking the property
- Add the sdhci_mmio_be_ops (big-endian) MemoryRegionOps.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sdhci-internal.h |  1 +
 hw/sd/sdhci.c          | 32 +++++++++++++++++++++++++++++---
 include/hw/sd/sdhci.h  |  1 +
 3 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index 964570f8e8..5f3765f12d 100644
--- a/hw/sd/sdhci-internal.h
+++ b/hw/sd/sdhci-internal.h
@@ -308,6 +308,7 @@ extern const VMStateDescription sdhci_vmstate;
 #define SDHC_CAPAB_REG_DEFAULT 0x057834b4
 
 #define DEFINE_SDHCI_COMMON_PROPERTIES(_state) \
+    DEFINE_PROP_UINT8("endianness", _state, endianness, DEVICE_LITTLE_ENDIAN), \
     DEFINE_PROP_UINT8("sd-spec-version", _state, sd_spec_version, 2), \
     DEFINE_PROP_UINT8("uhs", _state, uhs_mode, UHS_NOT_SUPPORTED), \
     DEFINE_PROP_UINT8("vendor", _state, vendor, SDHCI_VENDOR_NONE), \
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 22c758ad91..289baa879e 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1329,7 +1329,7 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
                        value >> shift, value >> shift);
 }
 
-static const MemoryRegionOps sdhci_mmio_ops = {
+static const MemoryRegionOps sdhci_mmio_le_ops = {
     .read = sdhci_read,
     .write = sdhci_write,
     .impl = {
@@ -1344,6 +1344,21 @@ static const MemoryRegionOps sdhci_mmio_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
+static const MemoryRegionOps sdhci_mmio_be_ops = {
+    .read = sdhci_read,
+    .write = sdhci_write,
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 4,
+        .unaligned = false
+    },
+    .endianness = DEVICE_BIG_ENDIAN,
+};
+
 static void sdhci_init_readonly_registers(SDHCIState *s, Error **errp)
 {
     ERRP_GUARD();
@@ -1371,8 +1386,6 @@ void sdhci_initfn(SDHCIState *s)
 
     s->insert_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_raise_insertion_irq, s);
     s->transfer_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_data_transfer, s);
-
-    s->io_ops = &sdhci_mmio_ops;
 }
 
 void sdhci_uninitfn(SDHCIState *s)
@@ -1388,10 +1401,23 @@ void sdhci_common_realize(SDHCIState *s, Error **errp)
 {
     ERRP_GUARD();
 
+    switch (s->endianness) {
+    case DEVICE_LITTLE_ENDIAN:
+        s->io_ops = &sdhci_mmio_le_ops;
+        break;
+    case DEVICE_BIG_ENDIAN:
+        s->io_ops = &sdhci_mmio_be_ops;
+        break;
+    default:
+        error_setg(errp, "Incorrect endianness");
+        return;
+    }
+
     sdhci_init_readonly_registers(s, errp);
     if (*errp) {
         return;
     }
+
     s->buf_maxsz = sdhci_get_fifolen(s);
     s->fifo_buffer = g_malloc0(s->buf_maxsz);
 
diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 01a64c5442..a989fca3b2 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -96,6 +96,7 @@ struct SDHCIState {
     /* Configurable properties */
     bool pending_insert_quirk; /* Quirk for Raspberry Pi card insert int */
     uint32_t quirks;
+    uint8_t endianness;
     uint8_t sd_spec_version;
     uint8_t uhs_mode;
     uint8_t vendor;        /* For vendor specific functionality */
-- 
2.38.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0CC6E990E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 18:04:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppWl4-00019x-LI; Thu, 20 Apr 2023 12:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppWl3-00018w-0l
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 12:03:41 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppWl1-0002XZ-0g
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 12:03:40 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-2f833bda191so473986f8f.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 09:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682006617; x=1684598617;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=97h3guJIF7ej//rRX4s5bfA+m2o4sn5HcBcQsWFToTE=;
 b=yowsJcbM9cG8yr+51147wWkK+SWlZrnFSBBv+GqP+4TjLLzls1OIl0vLxRIhlTk3Gi
 jTmT3NYZwekqRJif6ioSH7tnB50YZiwSEhKRKdF3wO2ysXuNfP6abJTH1r8+Zz4xAzaw
 7CsS0PbQ0lvEZhzjWCgbhWSzBLZphC6z0PNbuRL9P2LQgEZ6SpBqFulvjPDAVSJ1oVmz
 cdil3AGNTftBuHHRetLv/Zf8tltFXQDbXK2kW4Sxd6OTzlXMb/l18Gf1TqCdf8Lov1T/
 UgF9FIQV0R0PGDYcQ/iIGkzZs9pgLF1PTfFKELJonolAnD19DoVbvhtB9S4Uy97aYzVk
 HTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682006617; x=1684598617;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=97h3guJIF7ej//rRX4s5bfA+m2o4sn5HcBcQsWFToTE=;
 b=GaKenN1oDNKaUPBUWkJ9Xgy1++bNfjGPKD7bajSeIT2gmzHZFkRy078hLhFVGkmHyG
 /J7EmjEF0IQyd2YcgY4d9VLGBMlHMX7MK4dS0r8ITVPfqehG9hMoHVAaBee6bnPrOowQ
 P4/hmM970+prvhGXjzs8/yA8VS1qd2Ed5ZcZ3veidMbC0YNRgG5pxSg9grSYyYLNFuGK
 98aWPkH4925rQ497Eay6yauef5UmheSHKSoLRNGGrhWP8Sa6MU9X24BqdR/FKIci6TjR
 GOBeHvAg0uSvp6SZnlP2YIMruhcn3BwcORwIkAqne6igzPRSLwfP0N/A+kjABUABdEoM
 aVHg==
X-Gm-Message-State: AAQBX9filWRdijsQhKAJ4nYoAMXqKFOq7s15sfMwxFd6+enIF1DBb9cn
 x0LrZgAdFTN8I4Ko4YcpBln6YwTablg4MOy+T+o=
X-Google-Smtp-Source: AKy350Y35ewhu7duLFQQlmYC2uOZSeTlcHwtUdOhwdfesOSqxCef6Msg2v1MoSIDSR42qiZlijfLqw==
X-Received: by 2002:a5d:460c:0:b0:2f5:fbe5:bb1c with SMTP id
 t12-20020a5d460c000000b002f5fbe5bb1cmr1638312wrq.63.1682006617287; 
 Thu, 20 Apr 2023 09:03:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t15-20020adfe44f000000b002f00793bd7asm2310713wrm.27.2023.04.20.09.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 09:03:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 3/3] docs/specs: Convert pci-testdev.txt to rst
Date: Thu, 20 Apr 2023 17:03:34 +0100
Message-Id: <20230420160334.1048224-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420160334.1048224-1-peter.maydell@linaro.org>
References: <20230420160334.1048224-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Convert pci-testdev.txt to reStructuredText. Includes
some minor wordsmithing.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/specs/index.rst       |  1 +
 docs/specs/pci-ids.rst     |  2 +-
 docs/specs/pci-testdev.rst | 39 ++++++++++++++++++++++++++++++++++++++
 docs/specs/pci-testdev.txt | 31 ------------------------------
 4 files changed, 41 insertions(+), 32 deletions(-)
 create mode 100644 docs/specs/pci-testdev.rst
 delete mode 100644 docs/specs/pci-testdev.txt

diff --git a/docs/specs/index.rst b/docs/specs/index.rst
index dfa136073c7..e58be38c41c 100644
--- a/docs/specs/index.rst
+++ b/docs/specs/index.rst
@@ -10,6 +10,7 @@ guest hardware that is specific to QEMU.
 
    pci-ids
    pci-serial
+   pci-testdev
    ppc-xive
    ppc-spapr-xive
    ppc-spapr-numa
diff --git a/docs/specs/pci-ids.rst b/docs/specs/pci-ids.rst
index 7bc7168fb6a..e302bea484e 100644
--- a/docs/specs/pci-ids.rst
+++ b/docs/specs/pci-ids.rst
@@ -69,7 +69,7 @@ PCI devices (other than virtio):
 1b36:0004
   PCI Quad-port 16550A adapter (:doc:`pci-serial`)
 1b36:0005
-  PCI test device (``docs/specs/pci-testdev.txt``)
+  PCI test device (:doc:`pci-testdev`)
 1b36:0006
   PCI Rocker Ethernet switch device
 1b36:0007
diff --git a/docs/specs/pci-testdev.rst b/docs/specs/pci-testdev.rst
new file mode 100644
index 00000000000..4b6d36543b7
--- /dev/null
+++ b/docs/specs/pci-testdev.rst
@@ -0,0 +1,39 @@
+====================
+QEMU PCI test device
+====================
+
+``pci-testdev`` is a device used for testing low level IO.
+
+The device implements up to three BARs: BAR0, BAR1 and BAR2.
+Each of BAR 0+1 can be memory or IO. Guests must detect
+BAR types and act accordingly.
+
+BAR 0+1 size is up to 4K bytes each.
+BAR 0+1 starts with the following header:
+
+.. code-block:: c
+
+  typedef struct PCITestDevHdr {
+      uint8_t test;        /* write-only, starts a given test number */
+      uint8_t width_type;  /*
+                            * read-only, type and width of access for a given test.
+                            * 1,2,4 for byte,word or long write.
+                            * any other value if test not supported on this BAR
+                            */
+      uint8_t pad0[2];
+      uint32_t offset;     /* read-only, offset in this BAR for a given test */
+      uint32_t data;       /* read-only, data to use for a given test */
+      uint32_t count;      /* for debugging. number of writes detected. */
+      uint8_t name[];      /* for debugging. 0-terminated ASCII string. */
+  } PCITestDevHdr;
+
+All registers are little endian.
+
+The device is expected to always implement tests 0 to N on each BAR, and to add new
+tests with higher numbers.  In this way a guest can scan test numbers until it
+detects an access type that it does not support on this BAR, then stop.
+
+BAR2 is a 64bit memory BAR, without backing storage.  It is disabled
+by default and can be enabled using the ``membar=<size>`` property.  This
+can be used to test whether guests handle PCI BARs of a specific
+(possibly quite large) size correctly.
diff --git a/docs/specs/pci-testdev.txt b/docs/specs/pci-testdev.txt
deleted file mode 100644
index 4280a1e73c5..00000000000
--- a/docs/specs/pci-testdev.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-pci-test is a device used for testing low level IO
-
-device implements up to three BARs: BAR0, BAR1 and BAR2.
-Each of BAR 0+1 can be memory or IO. Guests must detect
-BAR types and act accordingly.
-
-BAR 0+1 size is up to 4K bytes each.
-BAR 0+1 starts with the following header:
-
-typedef struct PCITestDevHdr {
-    uint8_t test;  <- write-only, starts a given test number
-    uint8_t width_type; <- read-only, type and width of access for a given test.
-                           1,2,4 for byte,word or long write.
-                           any other value if test not supported on this BAR
-    uint8_t pad0[2];
-    uint32_t offset; <- read-only, offset in this BAR for a given test
-    uint32_t data;    <- read-only, data to use for a given test
-    uint32_t count;  <- for debugging. number of writes detected.
-    uint8_t name[]; <- for debugging. 0-terminated ASCII string.
-} PCITestDevHdr;
-
-All registers are little endian.
-
-device is expected to always implement tests 0 to N on each BAR, and to add new
-tests with higher numbers.  In this way a guest can scan test numbers until it
-detects an access type that it does not support on this BAR, then stop.
-
-BAR2 is a 64bit memory bar, without backing storage.  It is disabled
-by default and can be enabled using the membar=<size> property.  This
-can be used to test whether guests handle pci bars of a specific
-(possibly quite large) size correctly.
-- 
2.34.1



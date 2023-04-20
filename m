Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACD96E990D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 18:04:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppWl5-0001AM-Bl; Thu, 20 Apr 2023 12:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppWl3-00018z-3Y
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 12:03:41 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppWl1-0002XR-8I
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 12:03:40 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2f95231618aso495538f8f.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 09:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682006617; x=1684598617;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MvM/dGz9lk9l3Z7mH1Ow8yocGvGE3ke4HNmnP6n7qD0=;
 b=j77yUYzNmzuxcicwzeO+lU9uTowRkH3meZXipMxBNQ6JsG8/gVUbYx5LHI4Ffncxa7
 V1GSpKdCcpv34Y8r5EqwJbk0hcjoGxucVjOqHffuY0EVbXcZdXzBeKL0H4W/09Julk2T
 wyNmeY+Z/Z4GIGzEDHGT1JnFJCsu0mQCxQ9ACcdKWXWnIQcITHigKA0yFWQ7mzkp8Poe
 lC/Wmi4XEfXpTp1mHoGs2N0okkN6VnnMX4Xy07HPVeJ0jw81qmrykUG/JZeMM75yt0JY
 C2m9VmSNHXk2HCu4QAGMy8ijEz6OLR3+UfouzHdJ/4WGkrmoBg3oFC+qLvRrCX5YaEDj
 Yv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682006617; x=1684598617;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MvM/dGz9lk9l3Z7mH1Ow8yocGvGE3ke4HNmnP6n7qD0=;
 b=b7nkPkGeG2C8YkA7g5L/66pYkjDWHjdV62Qq9IWI8jikBbm1Nwg6o/xgqRzc0KpD8j
 WP0U+R0GQ6SAiyBVAN+dhsXCtgr9fha4upfr1AUHuoC2VeHtSHwc33QHPhhbzOyVhbtO
 THcBLJ7a9GIYdOoEQiNs2bHkkDo3iJpHFHqd9I/MIEiYhcFFK4+1LNXE1vXhCj8d5qEV
 zOQ7LxSWuxvYjU5Sfvo6QtD17k/OvKPAGE2ispXU1x+aevRCR0fCwTsHz5jeGhRVeg4k
 fA0n71nlttci9UJ8REB6vUZ50CIf0i9v5taB1uQgkrjZljaRTifN0lodBV+c0WjAWDz3
 5qUQ==
X-Gm-Message-State: AAQBX9dV37g0gFEJ94/4pwNmeud7wWL7IhmiHA1/DEWBL4uUYWGZYGFZ
 Q3Mcn7g6qkexoXmHElKJ8luuFQ5VSw4FOKLp8X8=
X-Google-Smtp-Source: AKy350YY1J4Z5kJpnPG6vvCQqVmLgx+FxuE8gnzR3Vkedz9r5yxJLTUHWrXjTVIGZfECq4gzQkkaEw==
X-Received: by 2002:a5d:4385:0:b0:2d2:29a4:4457 with SMTP id
 i5-20020a5d4385000000b002d229a44457mr1560972wrq.13.1682006616814; 
 Thu, 20 Apr 2023 09:03:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t15-20020adfe44f000000b002f00793bd7asm2310713wrm.27.2023.04.20.09.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 09:03:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 2/3] docs/specs: Convert pci-serial.txt to rst
Date: Thu, 20 Apr 2023 17:03:33 +0100
Message-Id: <20230420160334.1048224-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420160334.1048224-1-peter.maydell@linaro.org>
References: <20230420160334.1048224-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

Convert pci-serial.txt to reStructuredText. This includes
some wordsmithing, and the correction of the docs to note
that the Windows inf file includes 2x and 4x support
(as it has done since commit dc9528fdf9f61 in 2014).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/specs/index.rst       |  1 +
 docs/specs/pci-ids.rst     |  6 +++---
 docs/specs/pci-serial.rst  | 37 +++++++++++++++++++++++++++++++++++++
 docs/specs/pci-serial.txt  | 34 ----------------------------------
 hw/char/serial-pci-multi.c |  2 +-
 hw/char/serial-pci.c       |  2 +-
 6 files changed, 43 insertions(+), 39 deletions(-)
 create mode 100644 docs/specs/pci-serial.rst
 delete mode 100644 docs/specs/pci-serial.txt

diff --git a/docs/specs/index.rst b/docs/specs/index.rst
index 8aa0fcb77a9..dfa136073c7 100644
--- a/docs/specs/index.rst
+++ b/docs/specs/index.rst
@@ -9,6 +9,7 @@ guest hardware that is specific to QEMU.
    :maxdepth: 2
 
    pci-ids
+   pci-serial
    ppc-xive
    ppc-spapr-xive
    ppc-spapr-numa
diff --git a/docs/specs/pci-ids.rst b/docs/specs/pci-ids.rst
index e1cf022006b..7bc7168fb6a 100644
--- a/docs/specs/pci-ids.rst
+++ b/docs/specs/pci-ids.rst
@@ -63,11 +63,11 @@ PCI devices (other than virtio):
 1b36:0001
   PCI-PCI bridge
 1b36:0002
-  PCI serial port (16550A) adapter (``docs/specs/pci-serial.txt``)
+  PCI serial port (16550A) adapter (:doc:`pci-serial`)
 1b36:0003
-  PCI Dual-port 16550A adapter (``docs/specs/pci-serial.txt``)
+  PCI Dual-port 16550A adapter (:doc:`pci-serial`)
 1b36:0004
-  PCI Quad-port 16550A adapter (``docs/specs/pci-serial.txt``)
+  PCI Quad-port 16550A adapter (:doc:`pci-serial`)
 1b36:0005
   PCI test device (``docs/specs/pci-testdev.txt``)
 1b36:0006
diff --git a/docs/specs/pci-serial.rst b/docs/specs/pci-serial.rst
new file mode 100644
index 00000000000..8d916a36697
--- /dev/null
+++ b/docs/specs/pci-serial.rst
@@ -0,0 +1,37 @@
+=======================
+QEMU PCI serial devices
+=======================
+
+QEMU implements some PCI serial devices which are simple PCI
+wrappers around one or more 16550 UARTs.
+
+There is one single-port variant and two multiport-variants.  Linux
+guests work out-of-the box with all cards.  There is a Windows inf file
+(``docs/qemupciserial.inf``) to set up the cards in Windows guests.
+
+
+Single-port card
+----------------
+
+Name:
+  ``pci-serial``
+PCI ID:
+  1b36:0002
+PCI Region 0:
+   IO bar, 8 bytes long, with the 16550 UART mapped to it.
+Interrupt:
+   Wired to pin A.
+
+
+Multiport cards
+---------------
+
+Name:
+  ``pci-serial-2x``, ``pci-serial-4x``
+PCI ID:
+  1b36:0003 (``-2x``) and 1b36:0004 (``-4x``)
+PCI Region 0:
+   IO bar, with two or four 16550 UARTs mapped after each other.
+   The first is at offset 0, the second at offset 8, and so on.
+Interrupt:
+   Wired to pin A.
diff --git a/docs/specs/pci-serial.txt b/docs/specs/pci-serial.txt
deleted file mode 100644
index 66c761f2b40..00000000000
--- a/docs/specs/pci-serial.txt
+++ /dev/null
@@ -1,34 +0,0 @@
-
-QEMU pci serial devices
-=======================
-
-There is one single-port variant and two muliport-variants.  Linux
-guests out-of-the box with all cards.  There is a Windows inf file
-(docs/qemupciserial.inf) to setup the single-port card in Windows
-guests.
-
-
-single-port card
-----------------
-
-Name:   pci-serial
-PCI ID: 1b36:0002
-
-PCI Region 0:
-   IO bar, 8 bytes long, with the 16550 uart mapped to it.
-   Interrupt is wired to pin A.
-
-
-multiport cards
----------------
-
-Name:   pci-serial-2x
-PCI ID: 1b36:0003
-
-Name:   pci-serial-4x
-PCI ID: 1b36:0004
-
-PCI Region 0:
-   IO bar, with two/four 16550 uart mapped after each other.
-   The first is at offset 0, second at offset 8, ...
-   Interrupt is wired to pin A.
diff --git a/hw/char/serial-pci-multi.c b/hw/char/serial-pci-multi.c
index f18b8dcce5f..5d65c534cb5 100644
--- a/hw/char/serial-pci-multi.c
+++ b/hw/char/serial-pci-multi.c
@@ -25,7 +25,7 @@
  * THE SOFTWARE.
  */
 
-/* see docs/specs/pci-serial.txt */
+/* see docs/specs/pci-serial.rst */
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
index 801b769abab..087da3059a4 100644
--- a/hw/char/serial-pci.c
+++ b/hw/char/serial-pci.c
@@ -23,7 +23,7 @@
  * THE SOFTWARE.
  */
 
-/* see docs/specs/pci-serial.txt */
+/* see docs/specs/pci-serial.rst */
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-- 
2.34.1



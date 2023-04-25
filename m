Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DADF16EDD28
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:50:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDOh-0003Gv-1H; Tue, 25 Apr 2023 03:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDNo-0001q2-Dz
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:46:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDNm-0006uM-DM
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:46:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3YJvIXB4JXgLc+BchY3FYURGQPfXfUe8KWU9L0uhwmc=;
 b=Fq6/QE1t5HgKkTThka1VbgDl3XkGONZjw81O1a4/26tvLOhCCApKTXnYsWU/lrq/u146hp
 mYtZvWqpFXu6sCCnrWhx3bq4bQmtYaEpSUGmBxeVWqT2sy3ZFFPMkfpbSCDfi6sOYb+sBm
 KqThojAEhkE+nVif8kQrifxAPlhoHGs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-bA3gZ2u-OA656rjU5pP5Gw-1; Tue, 25 Apr 2023 03:46:35 -0400
X-MC-Unique: bA3gZ2u-OA656rjU5pP5Gw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-2f92bd71f32so1710361f8f.2
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408793; x=1685000793;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3YJvIXB4JXgLc+BchY3FYURGQPfXfUe8KWU9L0uhwmc=;
 b=kY68X+miE8V9n/maGaCzSenrrUOz3jiAyJ+jChCWDY2cJZqrcaqXxBQKcadJXA4d6u
 BySPJ5lfOAK9eYn2apAaRBe/n5177noWSGqOnikKZ4k07IkaVIoWUg1mk/RwrWxXsewN
 L+N7nzjsaPxOeDOZ8Wj7kARh/rSNqt+sNyPM8m+15QBnMk7Z0Qa4NfA6ElJJgCR/y4vF
 FsuAnLNymDBY+tquZcWIXyxFdwQ2PZqghQFCwZX5JzBoB5Xa4F/SJWRhFStoxoTNb51C
 up5q9+Wi6rZXbgJkG+cMMtBUspbfRImj+aJoUwptKmGn6H2TOC5nbSXw3tDjxFrT77e0
 119A==
X-Gm-Message-State: AAQBX9fIuBLOuryQtXGNAlLJA+/b9dKxeWyotVYfMTH1kMAcsOJIDq6F
 +YgeTVkar07kXeAnj/bv6TsZF8Xjh+ZGECmt0wXJFeWLIK7b33/l2VbQVnM6BExQBM9vmvxEx3I
 tedFZ7fhSXGR25zvu+V2quv1uS/7Z/UHyIdvboiCtMQt+RlzExXw9fJZo0zorhcM+0+LE
X-Received: by 2002:adf:ec46:0:b0:2ce:9fb8:b560 with SMTP id
 w6-20020adfec46000000b002ce9fb8b560mr11849196wrn.8.1682408793264; 
 Tue, 25 Apr 2023 00:46:33 -0700 (PDT)
X-Google-Smtp-Source: AKy350bpT1X4oxRSwMToIgC2x2pjYw/LIlQzmVNGpxxai/wdVS8/GgwXLW7dSjfQKc0lOKEtYEcXkQ==
X-Received: by 2002:adf:ec46:0:b0:2ce:9fb8:b560 with SMTP id
 w6-20020adfec46000000b002ce9fb8b560mr11849172wrn.8.1682408792937; 
 Tue, 25 Apr 2023 00:46:32 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 h18-20020a5d6892000000b002f9bfac5baesm12482772wru.47.2023.04.25.00.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:46:32 -0700 (PDT)
Date: Tue, 25 Apr 2023 03:46:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: [PULL 28/31] docs/specs: Convert pci-serial.txt to rst
Message-ID: <3669b594d88930f9e5d7c83e038d7d9ca5a75378.1682408661.git.mst@redhat.com>
References: <cover.1682408661.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1682408661.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Peter Maydell <peter.maydell@linaro.org>

Convert pci-serial.txt to reStructuredText. This includes
some wordsmithing, and the correction of the docs to note
that the Windows inf file includes 2x and 4x support
(as it has done since commit dc9528fdf9f61 in 2014).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20230420160334.1048224-3-peter.maydell@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/specs/pci-serial.txt  | 34 ----------------------------------
 hw/char/serial-pci-multi.c |  2 +-
 hw/char/serial-pci.c       |  2 +-
 docs/specs/index.rst       |  1 +
 docs/specs/pci-ids.rst     |  6 +++---
 docs/specs/pci-serial.rst  | 37 +++++++++++++++++++++++++++++++++++++
 6 files changed, 43 insertions(+), 39 deletions(-)
 delete mode 100644 docs/specs/pci-serial.txt
 create mode 100644 docs/specs/pci-serial.rst

diff --git a/docs/specs/pci-serial.txt b/docs/specs/pci-serial.txt
deleted file mode 100644
index 66c761f2b4..0000000000
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
index f18b8dcce5..5d65c534cb 100644
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
index 801b769aba..087da3059a 100644
--- a/hw/char/serial-pci.c
+++ b/hw/char/serial-pci.c
@@ -23,7 +23,7 @@
  * THE SOFTWARE.
  */
 
-/* see docs/specs/pci-serial.txt */
+/* see docs/specs/pci-serial.rst */
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
diff --git a/docs/specs/index.rst b/docs/specs/index.rst
index 8aa0fcb77a..dfa136073c 100644
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
index e1cf022006..7bc7168fb6 100644
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
index 0000000000..8d916a3669
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
-- 
MST



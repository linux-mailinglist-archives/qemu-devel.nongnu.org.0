Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C483E624C85
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 22:07:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otEl0-0005bD-S8; Thu, 10 Nov 2022 16:06:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1otEkv-0005Z0-8q
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 16:06:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1otEkt-0005lJ-IT
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 16:06:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668114394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v/+Ib26XYn/cnBad90+Kpxhtppp0fwV/vTeyR3L6z+I=;
 b=XsGaFOqZBuDFkbhv6RyeISrWaYPLo06tsrohCN/Vq+K1XCb7CziRtt2xh0Sag5y0oP/Ppx
 WEGZVzyi6Xmb1W+bZvMaunt+g5xX4yw+nGJAlVK3fWLmF13cZ8rSAh3PB4z1OzkJw1DJyw
 ri8bnZykTxoAI439rQ3l+jVA9Upc3QA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-516-HdA8HyuLPQGHCg1f7VaV_w-1; Thu, 10 Nov 2022 16:06:33 -0500
X-MC-Unique: HdA8HyuLPQGHCg1f7VaV_w-1
Received: by mail-wr1-f71.google.com with SMTP id
 i12-20020adfaacc000000b0023cd08e3b56so650411wrc.12
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 13:06:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v/+Ib26XYn/cnBad90+Kpxhtppp0fwV/vTeyR3L6z+I=;
 b=gDY3w9Dyj3+UNqH6ERBL4xlt5xWFybfVZFYuf0AtqWvNWqtg6wA1dKFFxhHS8dweMY
 H7ArUq0JQ4u8ulaNraT09Bmd/hB1qh6L8bcUdKtjls5gPMQXDAAjHejZ0z6PSMktRLT/
 j1ZRSyKsXLMnADhwtSELFQDuNJhYZK5/kctDGo955BKzIIw0e3Zzwy7sC9NdapDY5T1p
 1n09RnAf0yp1QdXQ7noUvuLI5zNNX5w6llGaj0R6tLfq44Pz8PZcvNdK97t8uHYgs8hK
 G5JzxDFPplwdauyq6mwO9/ADDduajILzPh0x+0sAkFlXt9lPkf4dlxSA1FoyAl2EkkzX
 5+Vg==
X-Gm-Message-State: ACrzQf1sbHOv9yNBHxPogxg0KWrBgfVSZ8O+4HiBO/cHO7/8uIASJePY
 bVOSCEmFfSBgkfpP2clgxg8e88fi2VSDsJak10XE4wX22Oc4aoy7zsgMFvWB6zJmV5T8dKumqss
 9cCvLr+wp6+74MuDAkpffjS/uKjykeGt4aotcz1aJkoL5XIXzOOxwzLjLVziE
X-Received: by 2002:a05:600c:3b9e:b0:3cf:93de:14b1 with SMTP id
 n30-20020a05600c3b9e00b003cf93de14b1mr24136196wms.148.1668114391872; 
 Thu, 10 Nov 2022 13:06:31 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4uk+aCCCIX8fwK8lE3eVLcylfo+aiD6r91Kuf6Bo5ehfw5Pe5ZZ3iIrfg1JFTvvFLXq8QepQ==
X-Received: by 2002:a05:600c:3b9e:b0:3cf:93de:14b1 with SMTP id
 n30-20020a05600c3b9e00b003cf93de14b1mr24136178wms.148.1668114391517; 
 Thu, 10 Nov 2022 13:06:31 -0800 (PST)
Received: from redhat.com ([2.52.3.250]) by smtp.gmail.com with ESMTPSA id
 t17-20020a05600c199100b003b4fdbb6319sm6467096wmq.21.2022.11.10.13.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 13:06:31 -0800 (PST)
Date: Thu, 10 Nov 2022 16:06:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 Frederic Bezies <fredbezies@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL 2/3] display: include dependencies explicitly
Message-ID: <20221110210428.137015-3-mst@redhat.com>
References: <20221110210428.137015-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221110210428.137015-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

acpi-vga-stub.c pulls in vga_int.h
However that currently pulls in ui/console.h which
breaks e.g. on systems without pixman.
It's better to remove ui/console.h from vga_int.h
and directly include it where it's used.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221109222112.74519-1-mst@redhat.com>
Tested-by: Laurent Vivier <lvivier@redhat.com>
Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
Reported-by: Frederic Bezies <fredbezies@gmail.com>
Reported-by: Laurent Vivier <lvivier@redhat.com>
Fixes: cfead31326 ("AcpiDevAmlIf interface to build VGA device descs")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/display/vga_int.h        | 1 -
 include/qemu/typedefs.h     | 2 ++
 hw/display/ati_2d.c         | 1 +
 hw/display/cirrus_vga.c     | 1 +
 hw/display/cirrus_vga_isa.c | 1 +
 hw/display/vga-isa.c        | 1 +
 hw/display/vga-mmio.c       | 1 +
 hw/display/vga-pci.c        | 1 +
 hw/display/vga.c            | 1 +
 hw/display/vmware_vga.c     | 1 +
 10 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/display/vga_int.h b/hw/display/vga_int.h
index 330406ad9c..7cf0d11201 100644
--- a/hw/display/vga_int.h
+++ b/hw/display/vga_int.h
@@ -27,7 +27,6 @@
 
 #include "exec/ioport.h"
 #include "exec/memory.h"
-#include "ui/console.h"
 
 #include "hw/display/bochs-vbe.h"
 #include "hw/acpi/acpi_aml_interface.h"
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 6d4e6d9708..688408e048 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -132,6 +132,8 @@ typedef struct Visitor Visitor;
 typedef struct VMChangeStateEntry VMChangeStateEntry;
 typedef struct VMStateDescription VMStateDescription;
 typedef struct DumpState DumpState;
+typedef struct GraphicHwOps GraphicHwOps;
+typedef struct QEMUCursor QEMUCursor;
 
 /*
  * Pointer types
diff --git a/hw/display/ati_2d.c b/hw/display/ati_2d.c
index 692bec91de..7d786653e8 100644
--- a/hw/display/ati_2d.c
+++ b/hw/display/ati_2d.c
@@ -12,6 +12,7 @@
 #include "ati_regs.h"
 #include "qemu/log.h"
 #include "ui/pixel_ops.h"
+#include "ui/console.h"
 
 /*
  * NOTE:
diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index c1e719a405..6e8c747c46 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -45,6 +45,7 @@
 #include "ui/pixel_ops.h"
 #include "cirrus_vga_internal.h"
 #include "qom/object.h"
+#include "ui/console.h"
 
 /*
  * TODO:
diff --git a/hw/display/cirrus_vga_isa.c b/hw/display/cirrus_vga_isa.c
index 96144bd690..84be51670e 100644
--- a/hw/display/cirrus_vga_isa.c
+++ b/hw/display/cirrus_vga_isa.c
@@ -31,6 +31,7 @@
 #include "hw/isa/isa.h"
 #include "cirrus_vga_internal.h"
 #include "qom/object.h"
+#include "ui/console.h"
 
 #define TYPE_ISA_CIRRUS_VGA "isa-cirrus-vga"
 OBJECT_DECLARE_SIMPLE_TYPE(ISACirrusVGAState, ISA_CIRRUS_VGA)
diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
index 46abbc5653..2a5437d803 100644
--- a/hw/display/vga-isa.c
+++ b/hw/display/vga-isa.c
@@ -32,6 +32,7 @@
 #include "qemu/timer.h"
 #include "hw/loader.h"
 #include "hw/qdev-properties.h"
+#include "ui/console.h"
 #include "qom/object.h"
 
 #define TYPE_ISA_VGA "isa-vga"
diff --git a/hw/display/vga-mmio.c b/hw/display/vga-mmio.c
index 75dfcedea5..cd2c46776d 100644
--- a/hw/display/vga-mmio.c
+++ b/hw/display/vga-mmio.c
@@ -27,6 +27,7 @@
 #include "hw/sysbus.h"
 #include "hw/display/vga.h"
 #include "hw/qdev-properties.h"
+#include "ui/console.h"
 #include "vga_int.h"
 
 /*
diff --git a/hw/display/vga-pci.c b/hw/display/vga-pci.c
index 9a91de7ed1..df23dbf3a0 100644
--- a/hw/display/vga-pci.c
+++ b/hw/display/vga-pci.c
@@ -30,6 +30,7 @@
 #include "migration/vmstate.h"
 #include "vga_int.h"
 #include "ui/pixel_ops.h"
+#include "ui/console.h"
 #include "qemu/module.h"
 #include "qemu/timer.h"
 #include "hw/loader.h"
diff --git a/hw/display/vga.c b/hw/display/vga.c
index 50ecb1ad02..0cb26a791b 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -31,6 +31,7 @@
 #include "vga_int.h"
 #include "vga_regs.h"
 #include "ui/pixel_ops.h"
+#include "ui/console.h"
 #include "qemu/timer.h"
 #include "hw/xen/xen.h"
 #include "migration/vmstate.h"
diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index cedbbde522..53949d2539 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -33,6 +33,7 @@
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "qom/object.h"
+#include "ui/console.h"
 
 #undef VERBOSE
 #define HW_RECT_ACCEL
-- 
MST



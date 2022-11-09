Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F26A623672
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 23:22:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ostRq-0005dD-3P; Wed, 09 Nov 2022 17:21:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ostRo-0005d2-Oy
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 17:21:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ostRn-00024T-5T
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 17:21:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668032486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=0r4Tg5S82MUeEAee817i1gl5swYW+BlFqtWlqhxJ0jQ=;
 b=AwyAXpFTL/N8ClTA9cZnHIk8hM48iqwXRtPnSr+hj0QKo9BkJKDGGNjUNWogb25cGq8qNR
 cIhilNL3ZQwqkgah90Fz24scNlIplZjS2rfpCNPl3dWYghb0lNOXawsXHpk3DBpPMwJnVd
 BQzjchHS0ncI+1wD6z7cBwGf8m+r+6g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-60-o5UrcCyXP7uc8mGrmd8bqw-1; Wed, 09 Nov 2022 17:21:24 -0500
X-MC-Unique: o5UrcCyXP7uc8mGrmd8bqw-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg21-20020a05600c3c9500b003c2acbff422so2242325wmb.0
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 14:21:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0r4Tg5S82MUeEAee817i1gl5swYW+BlFqtWlqhxJ0jQ=;
 b=gkPsfWrnrLgw8nmL6st/Rqr3KpQU+wK2M6zcUlAzOw6q9LZqsc3FcGQSlOnuI0j7ak
 B56LysDIYuzwa3cBNaxr6gA6viCB8swvnGZFyGNDl5vEJSLNP8PLQ//cfRnNXQiDJOtA
 mNXIcrJrAx3g1s/Wdch8a7rNRnVcHTkoE001krHHoLeYaAVYVcckJL4Ths22zdDFc083
 ZlEum6rsLMZ8J8EbDqRkU9gy5rZzSFWWMFgqCI3Xbwvdot8BQCvK7eoBADxd1F0GUU1A
 DitijinlUGuhGPztSEeXApXs70ZM/HGGyPrHoWogko403WidC4rkAcUZbliWl3ni6FrH
 f+wQ==
X-Gm-Message-State: ACrzQf0s2/OaCcyn03PTo0SAhP8t3yKsge3Drvd3PD+O86sFOuRCiUHX
 xNmf3JnN7xg7/kx4WlsXhG8zp2VsfPYOVgVEEZlVExB4I6XF7tFWscAItJ/WPboS7iSXjZ49SLZ
 F0xu+tOOpOs0ppsB1dIrwym+roRK6cI2j6ksmtTkftxoZZlati/KUS6DfsS99
X-Received: by 2002:a1c:c901:0:b0:3cf:6fdb:3367 with SMTP id
 f1-20020a1cc901000000b003cf6fdb3367mr37280044wmb.119.1668032483514; 
 Wed, 09 Nov 2022 14:21:23 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5GShc7mm5HX5qM/2kY2nZTj0xz6x2jJvcTeV4lxZL5Nv1e3uw3wLsIURHKKSs6P0Ja14yzew==
X-Received: by 2002:a1c:c901:0:b0:3cf:6fdb:3367 with SMTP id
 f1-20020a1cc901000000b003cf6fdb3367mr37280029wmb.119.1668032483226; 
 Wed, 09 Nov 2022 14:21:23 -0800 (PST)
Received: from redhat.com ([2.52.23.68]) by smtp.gmail.com with ESMTPSA id
 u2-20020a5d4342000000b0022eafed36ebsm14065518wrr.73.2022.11.09.14.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 14:21:22 -0800 (PST)
Date: Wed, 9 Nov 2022 17:21:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] display: include dependencies explicitly
Message-ID: <20221109222112.74519-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
index 2577005d03..4cc3567c69 100644
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



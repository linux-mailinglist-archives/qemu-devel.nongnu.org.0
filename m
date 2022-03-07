Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0514CFB98
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:40:23 +0100 (CET)
Received: from localhost ([::1]:36252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAms-0000hu-Px
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:40:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRACj-0002DJ-2s
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:03:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRACh-0002pD-Bm
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:03:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k3FB3bferdbl03k+KFKWByjScfRpd+RvVcbGHdUp8Wc=;
 b=Aa4UcxvQzaIAkivpJ8fCgeT6DwFKjgDXQR86pdPuR27foYLgL2UikjGSonyT/vu0efqvNI
 9iUV6x1Z11lNPDxOrpOwRS7/vowzLuCMJzyPk4UnEBxon5LssjcmJkp/3KX1bpp33FhweQ
 KwF1yBvPE1T2wRwbqqjHwBan+t/kpaM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-sAGiyKuFNP64hrzgAwD-Bg-1; Mon, 07 Mar 2022 05:02:57 -0500
X-MC-Unique: sAGiyKuFNP64hrzgAwD-Bg-1
Received: by mail-ej1-f72.google.com with SMTP id
 hx13-20020a170906846d00b006db02e1a307so1673379ejc.2
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:02:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=k3FB3bferdbl03k+KFKWByjScfRpd+RvVcbGHdUp8Wc=;
 b=VuATkBoiir/pc4Q4P1XMzTFhhPkJ/NrJPFEvkfLk0HssYQn8oLbTok5YGztwBLOBle
 5Io6WC72ZaJDJ6NBZ2WsMdInS/io5unNcz+AB3hnS7dVRkPWSzFvNlFWipPlZHFK3/2b
 IO2wpxx8XaEKD8Zi59Ip/HebUZ/Ns7K1WjllYmyswji8sE1KFqitCkbzeaYLEX67czmi
 ghvpqxdLEIeBI0j4VqtxiysXAhMe9jjvWFmIX04uvMbnbzL0oXjh7UWJxRV+LSgJml92
 vYy0toPH7GNHTEB9CWFeQsKLOcE6nLxF+3mgmdKt/BeEXQTUBqvJXsyfgG2OYSwcvjNQ
 vUmQ==
X-Gm-Message-State: AOAM531k3nRv5aM06p5WyuD9KrmVYWWZzASAqJONQvCe6cGc5BkxF1KA
 QVY3hGRcvTtk5Rjp0DDg8SUxlj6bQ3ubiSFVuxNKd6sg5xHc/L1Erw+Ylr/+U9ZLGvg+T/nLXtQ
 1WmrpRarTwZZ3V+Mvgk4/2iDJDWgMGV7h3q2t37QZZTpUhRUVjSDHMdcPihqH
X-Received: by 2002:aa7:cc82:0:b0:410:d2b0:1a07 with SMTP id
 p2-20020aa7cc82000000b00410d2b01a07mr10493322edt.359.1646647375935; 
 Mon, 07 Mar 2022 02:02:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0+kGLiTtefV0KoJhYWcK4hcmXt1foiFStFh3OjV6G5YAfquOHPh+sS/BzM80BbqwR2W798A==
X-Received: by 2002:aa7:cc82:0:b0:410:d2b0:1a07 with SMTP id
 p2-20020aa7cc82000000b00410d2b01a07mr10493291edt.359.1646647375620; 
 Mon, 07 Mar 2022 02:02:55 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 bq23-20020a170906d0d700b006db0372d3a2sm2305642ejb.20.2022.03.07.02.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:02:55 -0800 (PST)
Date: Mon, 7 Mar 2022 05:02:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 31/47] hw/misc/pvpanic: Use standard headers instead
Message-ID: <20220307100058.449628-32-mst@redhat.com>
References: <20220307100058.449628-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307100058.449628-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 zhenwei pi <pizhenwei@bytedance.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: zhenwei pi <pizhenwei@bytedance.com>

QEMU side has already imported pvpanic.h from linux, remove bit
definitions from include/hw/misc/pvpanic.h, and use
include/standard-headers/linux/pvpanic.h instead.
Also minor changes for PVPANIC_CRASHLOADED -> PVPANIC_CRASH_LOADED.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
Message-Id: <20220221122717.1371010-2-pizhenwei@bytedance.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/misc/pvpanic.h | 8 --------
 hw/misc/pvpanic-isa.c     | 4 +++-
 hw/misc/pvpanic-pci.c     | 4 +++-
 hw/misc/pvpanic.c         | 5 +++--
 4 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/include/hw/misc/pvpanic.h b/include/hw/misc/pvpanic.h
index ca3c5bb533..7f16cc9b16 100644
--- a/include/hw/misc/pvpanic.h
+++ b/include/hw/misc/pvpanic.h
@@ -22,14 +22,6 @@
 
 #define PVPANIC_IOPORT_PROP "ioport"
 
-/* The bit of supported pv event, TODO: include uapi header and remove this */
-#define PVPANIC_F_PANICKED      0
-#define PVPANIC_F_CRASHLOADED   1
-
-/* The pv event value */
-#define PVPANIC_PANICKED        (1 << PVPANIC_F_PANICKED)
-#define PVPANIC_CRASHLOADED     (1 << PVPANIC_F_CRASHLOADED)
-
 /*
  * PVPanicState for any device type
  */
diff --git a/hw/misc/pvpanic-isa.c b/hw/misc/pvpanic-isa.c
index a39fcdd1fc..b84d4d458d 100644
--- a/hw/misc/pvpanic-isa.c
+++ b/hw/misc/pvpanic-isa.c
@@ -21,6 +21,7 @@
 #include "hw/misc/pvpanic.h"
 #include "qom/object.h"
 #include "hw/isa/isa.h"
+#include "standard-headers/linux/pvpanic.h"
 
 OBJECT_DECLARE_SIMPLE_TYPE(PVPanicISAState, PVPANIC_ISA_DEVICE)
 
@@ -64,7 +65,8 @@ static void pvpanic_isa_realizefn(DeviceState *dev, Error **errp)
 
 static Property pvpanic_isa_properties[] = {
     DEFINE_PROP_UINT16(PVPANIC_IOPORT_PROP, PVPanicISAState, ioport, 0x505),
-    DEFINE_PROP_UINT8("events", PVPanicISAState, pvpanic.events, PVPANIC_PANICKED | PVPANIC_CRASHLOADED),
+    DEFINE_PROP_UINT8("events", PVPanicISAState, pvpanic.events,
+                      PVPANIC_PANICKED | PVPANIC_CRASH_LOADED),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/misc/pvpanic-pci.c b/hw/misc/pvpanic-pci.c
index 62e1be68c1..99cf7e2041 100644
--- a/hw/misc/pvpanic-pci.c
+++ b/hw/misc/pvpanic-pci.c
@@ -21,6 +21,7 @@
 #include "hw/misc/pvpanic.h"
 #include "qom/object.h"
 #include "hw/pci/pci.h"
+#include "standard-headers/linux/pvpanic.h"
 
 OBJECT_DECLARE_SIMPLE_TYPE(PVPanicPCIState, PVPANIC_PCI_DEVICE)
 
@@ -53,7 +54,8 @@ static void pvpanic_pci_realizefn(PCIDevice *dev, Error **errp)
 }
 
 static Property pvpanic_pci_properties[] = {
-    DEFINE_PROP_UINT8("events", PVPanicPCIState, pvpanic.events, PVPANIC_PANICKED | PVPANIC_CRASHLOADED),
+    DEFINE_PROP_UINT8("events", PVPanicPCIState, pvpanic.events,
+                      PVPANIC_PANICKED | PVPANIC_CRASH_LOADED),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
index e2cb4a5d28..1540e9091a 100644
--- a/hw/misc/pvpanic.c
+++ b/hw/misc/pvpanic.c
@@ -21,12 +21,13 @@
 #include "hw/qdev-properties.h"
 #include "hw/misc/pvpanic.h"
 #include "qom/object.h"
+#include "standard-headers/linux/pvpanic.h"
 
 static void handle_event(int event)
 {
     static bool logged;
 
-    if (event & ~(PVPANIC_PANICKED | PVPANIC_CRASHLOADED) && !logged) {
+    if (event & ~(PVPANIC_PANICKED | PVPANIC_CRASH_LOADED) && !logged) {
         qemu_log_mask(LOG_GUEST_ERROR, "pvpanic: unknown event %#x.\n", event);
         logged = true;
     }
@@ -36,7 +37,7 @@ static void handle_event(int event)
         return;
     }
 
-    if (event & PVPANIC_CRASHLOADED) {
+    if (event & PVPANIC_CRASH_LOADED) {
         qemu_system_guest_crashloaded(NULL);
         return;
     }
-- 
MST



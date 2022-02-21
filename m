Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1AF4BD9E8
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 14:28:10 +0100 (CET)
Received: from localhost ([::1]:41206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM8jZ-0001qp-1u
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 08:28:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nM7oM-0005Fz-Jl
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:29:02 -0500
Received: from [2607:f8b0:4864:20::62c] (port=45780
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nM7oH-00063v-Il
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:28:59 -0500
Received: by mail-pl1-x62c.google.com with SMTP id w20so12765043plq.12
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 04:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dn/NkQvCSUIyCiOwwtlYY/cU5JGggHuyJ5QGhuam6cc=;
 b=Av3hwpyFHsAfagpfosqmrgTHMTl/xIZbxjBlFlBC6Brw+kfR1uJUSMA2iYn3Clzx/K
 0vq3fsnOaRhaYWHIHGW5KDH9ZwWUrmR6fz/6+jO1MG4mJ7djACiJ9jphY7aPq6DSp//g
 3bofO3URJEpIge1appIw1j0EKApjpJ+L38ojVFKkM8SQpgKS3g1+P3V7KAycGO9DUn0u
 nAASwKLykRkRbfSzy09k0lwpowKRPcXcNPmuLoZlMjNo9D3ASr9gz8rcb2yf58TUNnum
 VqvG/XhG4ujG2nnQ/XAkT9x5udWK6l/1mhp6n29zcnmRDTkqlUEzGONgWJSNxwx8LwDR
 fN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dn/NkQvCSUIyCiOwwtlYY/cU5JGggHuyJ5QGhuam6cc=;
 b=nTTfz+JqqGxbSn+ASH1Iurl3qF1sg6Pv7JwfYHHayBiQybFHvOqVGjZ78pSw/OvXcf
 2sCYdJQh7Qeq2q2sXkN9tX/W9d5sNwEwB1LCLgnA1oqKIENRBs0W+8MXewOOTU9Lj59D
 g3bKH9FCSnXPkJWQPHOjmZFBk8a8BqVu/Q1TEsJFkNUUsL7RaEM2JoRly6v17mNYXBXs
 tBHcwyxWgNCnTPRXobb/YDdc1+6FTZjpk0tDh48vHffmLCp4htkwPokQ0Bq9jPCAC6s4
 dfVSX413dv9NCtFY/1q/BiTM+WKG6EaFAh98m/UhPc5P0SkgKtFNDJdZeDWjZkhvAgk6
 WiEg==
X-Gm-Message-State: AOAM532RdfPRlI3VmnfezMXXwIe9wRjJN2VxccA5dsKeizBTFx3v1iJd
 2L5rQYrBAhbAjBOty20qFC4gyYCw/yIr6Q==
X-Google-Smtp-Source: ABdhPJyphW1c1fkL4X+adf5Kk+MMitiyxz1KgJDx6dXB0l8Z9HNgaLRhHUO1/+Sut8fsJ3FcFmq8HA==
X-Received: by 2002:a17:902:6942:b0:14c:b20e:2b1a with SMTP id
 k2-20020a170902694200b0014cb20e2b1amr19231101plt.112.1645446536377; 
 Mon, 21 Feb 2022 04:28:56 -0800 (PST)
Received: from libai.bytedance.net ([61.120.150.72])
 by smtp.gmail.com with ESMTPSA id c20sm4846609pfl.131.2022.02.21.04.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 04:28:55 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: pbonzini@redhat.com,
	mst@redhat.com
Subject: [PATCH 2/2] hw/misc/pvpanic: Use standard headers instead
Date: Mon, 21 Feb 2022 20:27:17 +0800
Message-Id: <20220221122717.1371010-2-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221122717.1371010-1-pizhenwei@bytedance.com>
References: <20220221122717.1371010-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU side has already imported pvpanic.h from linux, remove bit
definitions from include/hw/misc/pvpanic.h, and use
include/standard-headers/linux/pvpanic.h instead.
Also minor changes for PVPANIC_CRASHLOADED -> PVPANIC_CRASH_LOADED.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 hw/misc/pvpanic-isa.c     | 4 +++-
 hw/misc/pvpanic-pci.c     | 4 +++-
 hw/misc/pvpanic.c         | 5 +++--
 include/hw/misc/pvpanic.h | 8 --------
 4 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/hw/misc/pvpanic-isa.c b/hw/misc/pvpanic-isa.c
index 7b66d58acc..36bf04c4a0 100644
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
index af8cbe2830..d8fc38c243 100644
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
-- 
2.25.1



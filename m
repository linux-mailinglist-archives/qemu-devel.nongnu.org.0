Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27356E7DFE
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 17:18:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp9YZ-0002Db-E5; Wed, 19 Apr 2023 11:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pp9YR-0002Bg-MH
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 11:17:07 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pp9YP-0001ro-1o
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 11:17:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=69YWgBkYYZ02iLttMw6v1R/FN+cbYbjRdXS0KAwXIBs=; b=sXZoFQtA9P1BbFAQImxFmUoSAq
 XWK8ob4blm/5Sbv4Way7ktJMzJjeVuue/YV+a1Q+IUB28SyeIt3g60ThOOlArhZRBCHs5STGgAoNu
 29wXEC5/ZblcEWM17VZpJ/NRyvCVjnpRJz923vF/aezakhl3+wlfmk6zJl0+75q+ui6Kq0mE1PUmH
 8tBGnSJ7IEY9/82k/BVrTo68jZ/h1xVd5gavup0NH+G1NdHdNmYO8+mOuLyw1ecLeSRTFg6v7ZUrv
 c1K7sIMkf9xfqZ4hXdWKQPs1AgwyeLiISoO8Le1rkQCAJcH632z6+0R4znRI0kxQcu0iB+ka8A6W+
 qGEvu98dCypQuuqpmwyskysqT1Q9gd1RfQRfN/hRFK/CePvLTjQqcalkspz+a/kVnrZsAyjoEZ3ll
 GjTxWbVk18MuI+T3RW81IEp4ofOFwV8MpxbDVFmASbrwdxTBskCG3CwpA7Nf/L4MG1hAl5uLcMOoH
 Q2e3q+1AeU3fOFKkQHp06BBQm9RFL8GUEPUfXr8T0gnkxCGkwMwR3a4+MrovJYCX8x9S6qjAy/ycp
 obWbq/H31cGBwb2WupJNhtY/7uCxrkGgFjZ0qwZ/dgPWgIZReVYt1InQd3bYAH04adiC742j6CWmn
 RgmMXAQN+xyfPfeo5rFb4TYenDZaUS8vEoxrWB65Y=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pp9XV-00041C-Hk; Wed, 19 Apr 2023 16:16:13 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Wed, 19 Apr 2023 16:16:51 +0100
Message-Id: <20230419151652.362717-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230419151652.362717-1-mark.cave-ayland@ilande.co.uk>
References: <20230419151652.362717-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 2/3] softmmu/ioport.c: QOMify MemoryRegionPortioList
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

The aim of QOMification is so that the lifetime of the MemoryRegionPortioList
structure can be managed using QOM's in-built refcounting instead of having to
handle this manually.

Due to the use of an opaque pointer it isn't possible to model the new
TYPE_MEMORY_REGION_PORTIO_LIST directly using QOM properties, however since
use of the new object is restricted to the portio API we can simply set the
opaque pointer (and the heap-allocated port list) internally.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 softmmu/ioport.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/softmmu/ioport.c b/softmmu/ioport.c
index d0d5b0bcaa..238625a36f 100644
--- a/softmmu/ioport.c
+++ b/softmmu/ioport.c
@@ -32,11 +32,16 @@
 #include "exec/address-spaces.h"
 #include "trace.h"
 
-typedef struct MemoryRegionPortioList {
+struct MemoryRegionPortioList {
+    Object obj;
+
     MemoryRegion mr;
     void *portio_opaque;
     MemoryRegionPortio *ports;
-} MemoryRegionPortioList;
+};
+
+#define TYPE_MEMORY_REGION_PORTIO_LIST "memory-region-portio-list"
+OBJECT_DECLARE_SIMPLE_TYPE(MemoryRegionPortioList, MEMORY_REGION_PORTIO_LIST)
 
 static uint64_t unassigned_io_read(void *opaque, hwaddr addr, unsigned size)
 {
@@ -228,7 +233,8 @@ static void portio_list_add_1(PortioList *piolist,
     unsigned i;
 
     /* Copy the sub-list and null-terminate it.  */
-    mrpio = g_malloc0(sizeof(MemoryRegionPortioList));
+    mrpio = MEMORY_REGION_PORTIO_LIST(
+                object_new(TYPE_MEMORY_REGION_PORTIO_LIST));
     mrpio->portio_opaque = piolist->opaque;
     mrpio->ports = g_malloc0(sizeof(MemoryRegionPortio) * (count + 1));
     memcpy(mrpio->ports, pio_init, sizeof(MemoryRegionPortio) * count);
@@ -298,3 +304,16 @@ void portio_list_del(PortioList *piolist)
         memory_region_del_subregion(piolist->address_space, &mrpio->mr);
     }
 }
+
+static const TypeInfo memory_region_portio_list_info = {
+    .parent             = TYPE_OBJECT,
+    .name               = TYPE_MEMORY_REGION_PORTIO_LIST,
+    .instance_size      = sizeof(MemoryRegionPortioList),
+};
+
+static void ioport_register_types(void)
+{
+    type_register_static(&memory_region_portio_list_info);
+}
+
+type_init(ioport_register_types)
-- 
2.30.2



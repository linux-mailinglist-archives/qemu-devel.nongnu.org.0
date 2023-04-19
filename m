Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD726E7E00
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 17:18:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp9YX-0002Bw-Dj; Wed, 19 Apr 2023 11:17:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pp9YR-0002B0-1w
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 11:17:07 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pp9YO-0001kg-CR
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 11:17:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dXLpAW5xn9aTWVccDDujZdP7T4c7jsbVfrgDBo7ESmo=; b=DDvQdQtZVP/L+YlWmx3yq3Yokv
 Qqe/3Y3mE4yud0/pVDOo+KyZHlRa3XsjF/IY1vUmr7CSMz317kTi3Za5RzmA835ADa7UjKF/kZTP5
 RZLC7w0ByLHbJ0vW4n1/jjTgnnfJujva2eypy6LhNPfMlKePGiPDE8YIKUbIdh7AyYGpntkhqurtq
 4Ojxe07fTME1RFoYTrjTyoCVJwq+NOlbKU32QuTXdt03R0sQLt7OgZco0MAAqoX4OmX8LP4A+7R6o
 jBYtIVYwKDmfSTEwMKhBdHKNZ7ux10c4sYAqOVX1wQOae+DW40Lx7BHEyqwVCWdNonZMqQbCwll5Y
 +LiEG0Uk9XL2i4wJTe3HAhr2XC64qpphXsxVu/EomPltThkHIu1DUDU2LF+Tk3egylHtheo0rNOLE
 UHTzJWqQkRiY8W9T8xAP2L0jdRdap0hH6oajqjH2eSNIZOOh7YNEyUrEhZpaa3xbHqLa0zJ+ifK88
 jxyzrpWoel1XxQ5K7uSKgIzo5mFBCE2wGuJb/1LOnFuSMOP/DW7Y0JDna9fGAOoIIPt9xWtYFRzEa
 slkpFKvD/Ix1vagcv6ORr9FbIzPIGZFc8BpQx3nYnuggSYJAJYzCZ5qjPOIADRv8hKWpIUx89FxNo
 UjYr0am82UiuncRlAGGRAwOMp8mAX9lV8MFfHz2Y0=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pp9XV-00041C-4p; Wed, 19 Apr 2023 16:16:09 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Wed, 19 Apr 2023 16:16:50 +0100
Message-Id: <20230419151652.362717-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230419151652.362717-1-mark.cave-ayland@ilande.co.uk>
References: <20230419151652.362717-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 1/3] softmmu/ioport.c: allocate MemoryRegionPortioList ports
 on the heap
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

In order to facilitate a conversion of MemoryRegionPortioList to a QOM object
move the allocation of MemoryRegionPortioList ports to the heap instead of
using a variable-length member at the end of the MemoryRegionPortioList
structure.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 softmmu/ioport.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/softmmu/ioport.c b/softmmu/ioport.c
index cb8adb0b93..d0d5b0bcaa 100644
--- a/softmmu/ioport.c
+++ b/softmmu/ioport.c
@@ -35,7 +35,7 @@
 typedef struct MemoryRegionPortioList {
     MemoryRegion mr;
     void *portio_opaque;
-    MemoryRegionPortio ports[];
+    MemoryRegionPortio *ports;
 } MemoryRegionPortioList;
 
 static uint64_t unassigned_io_read(void *opaque, hwaddr addr, unsigned size)
@@ -147,6 +147,7 @@ void portio_list_destroy(PortioList *piolist)
     for (i = 0; i < piolist->nr; ++i) {
         mrpio = container_of(piolist->regions[i], MemoryRegionPortioList, mr);
         object_unparent(OBJECT(&mrpio->mr));
+        g_free(mrpio->ports);
         g_free(mrpio);
     }
     g_free(piolist->regions);
@@ -227,9 +228,9 @@ static void portio_list_add_1(PortioList *piolist,
     unsigned i;
 
     /* Copy the sub-list and null-terminate it.  */
-    mrpio = g_malloc0(sizeof(MemoryRegionPortioList) +
-                      sizeof(MemoryRegionPortio) * (count + 1));
+    mrpio = g_malloc0(sizeof(MemoryRegionPortioList));
     mrpio->portio_opaque = piolist->opaque;
+    mrpio->ports = g_malloc0(sizeof(MemoryRegionPortio) * (count + 1));
     memcpy(mrpio->ports, pio_init, sizeof(MemoryRegionPortio) * count);
     memset(mrpio->ports + count, 0, sizeof(MemoryRegionPortio));
 
-- 
2.30.2



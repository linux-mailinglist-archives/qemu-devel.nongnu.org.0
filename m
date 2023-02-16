Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0214E698BE3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:26:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSWlJ-0006In-QV; Thu, 16 Feb 2023 00:24:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pSWlG-0006IR-VS
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:24:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pSWlD-0008SM-4h
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:24:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676525086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XoR1EqS98VfAlVzMxZNoy/1pmw2KIRavs+YTl38ELCA=;
 b=aaoLONAC7Ik1LUgy6AyLFL7EsXc02XseOmKEtzFECm4luBwFrvitTz+n46cE5daGb0agV8
 nytk7qnF22cS6FjB4yHmnjzvEgD9cfN4vM48wSlsF3U2+9fqsfLESdVwSoci7PzyCRyxqD
 F+wJBJYhU/KIP9k4nrJpB007UI1bWIM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36-X-6y4wNUOeezUFjYAfkpAw-1; Thu, 16 Feb 2023 00:24:41 -0500
X-MC-Unique: X-6y4wNUOeezUFjYAfkpAw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC8633C10688;
 Thu, 16 Feb 2023 05:24:40 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-253.pek2.redhat.com
 [10.72.12.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66A55492B15;
 Thu, 16 Feb 2023 05:24:38 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, Qiang Liu <cyruscyliu@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL V2 04/10] hw/net/lan9118: log [read|write]b when mode_16bit is
 enabled rather than abort
Date: Thu, 16 Feb 2023 13:24:18 +0800
Message-Id: <20230216052424.50926-5-jasowang@redhat.com>
In-Reply-To: <20230216052424.50926-1-jasowang@redhat.com>
References: <20230216052424.50926-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

From: Qiang Liu <cyruscyliu@gmail.com>

This patch replaces hw_error to guest error log for [read|write]b
accesses when mode_16bit is enabled. This avoids aborting qemu.

Fixes: 1248f8d4cbc3 ("hw/lan9118: Add basic 16-bit mode support.")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1433
Reported-by: Qiang Liu <cyruscyliu@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/lan9118.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index f1cba55..e5c4af1 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -15,7 +15,6 @@
 #include "migration/vmstate.h"
 #include "net/net.h"
 #include "net/eth.h"
-#include "hw/hw.h"
 #include "hw/irq.h"
 #include "hw/net/lan9118.h"
 #include "hw/ptimer.h"
@@ -32,12 +31,8 @@
 #ifdef DEBUG_LAN9118
 #define DPRINTF(fmt, ...) \
 do { printf("lan9118: " fmt , ## __VA_ARGS__); } while (0)
-#define BADF(fmt, ...) \
-do { hw_error("lan9118: error: " fmt , ## __VA_ARGS__);} while (0)
 #else
 #define DPRINTF(fmt, ...) do {} while(0)
-#define BADF(fmt, ...) \
-do { fprintf(stderr, "lan9118: error: " fmt , ## __VA_ARGS__);} while (0)
 #endif
 
 /* The tx and rx fifo ports are a range of aliased 32-bit registers */
@@ -848,7 +843,8 @@ static uint32_t do_phy_read(lan9118_state *s, int reg)
     case 30: /* Interrupt mask */
         return s->phy_int_mask;
     default:
-        BADF("PHY read reg %d\n", reg);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "do_phy_read: PHY read reg %d\n", reg);
         return 0;
     }
 }
@@ -876,7 +872,8 @@ static void do_phy_write(lan9118_state *s, int reg, uint32_t val)
         phy_update_irq(s);
         break;
     default:
-        BADF("PHY write reg %d = 0x%04x\n", reg, val);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "do_phy_write: PHY write reg %d = 0x%04x\n", reg, val);
     }
 }
 
@@ -1209,7 +1206,8 @@ static void lan9118_16bit_mode_write(void *opaque, hwaddr offset,
         return;
     }
 
-    hw_error("lan9118_write: Bad size 0x%x\n", size);
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "lan9118_16bit_mode_write: Bad size 0x%x\n", size);
 }
 
 static uint64_t lan9118_readl(void *opaque, hwaddr offset,
@@ -1324,7 +1322,8 @@ static uint64_t lan9118_16bit_mode_read(void *opaque, hwaddr offset,
         return lan9118_readl(opaque, offset, size);
     }
 
-    hw_error("lan9118_read: Bad size 0x%x\n", size);
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "lan9118_16bit_mode_read: Bad size 0x%x\n", size);
     return 0;
 }
 
-- 
2.7.4



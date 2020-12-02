Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDBB2CB765
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:43:16 +0100 (CET)
Received: from localhost ([::1]:50038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNjI-0001oB-0y
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:43:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCT-0002zk-2R
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCG-0003gm-8v
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tm7yCEMpC8IvENFSCX1OwJhZl4J8hLCYYB6gZw2aigE=;
 b=L64Hj/ZUjcNSjpb01j/kAICt0hSetVAUc/dUZxiZTvjlKUOML5nyswOaENdZ81KJEzuVwh
 k/HOoFcT4Lp5vIyxpF6ycDNWbqGS9EOVDH5GFKr47DyZL141ouBBSR91+nXbKozh8i/i8p
 wFt6bw5gs/0XbGMxmDkh2K798QER9DQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-RiGFGWE5NZmFNhYKoTWgmQ-1; Wed, 02 Dec 2020 03:09:06 -0500
X-MC-Unique: RiGFGWE5NZmFNhYKoTWgmQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A2991074647
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:05 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB2641346F
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:04 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 040/113] m68k: do not use ram_size global
Date: Wed,  2 Dec 2020 03:07:36 -0500
Message-Id: <20201202080849.4125477-41-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the machine properties instead.

Cc: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/m68k/mcf5206.c       | 4 +++-
 hw/m68k/mcf5208.c       | 3 ++-
 target/m68k/m68k-semi.c | 5 +++--
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/m68k/mcf5206.c b/hw/m68k/mcf5206.c
index 51d2e0da1c..8708aa4480 100644
--- a/hw/m68k/mcf5206.c
+++ b/hw/m68k/mcf5206.c
@@ -10,6 +10,7 @@
 #include "qemu/error-report.h"
 #include "qemu/log.h"
 #include "cpu.h"
+#include "hw/boards.h"
 #include "hw/irq.h"
 #include "hw/m68k/mcf.h"
 #include "qemu/timer.h"
@@ -311,8 +312,9 @@ static uint64_t m5206_mbar_read(m5206_mbar_state *s,
         /* FIXME: currently hardcoded to 128Mb.  */
         {
             uint32_t mask = ~0;
-            while (mask > ram_size)
+            while (mask > current_machine->ram_size) {
                 mask >>= 1;
+            }
             return mask & 0x0ffe0000;
         }
     case 0x5c: return 1; /* DRAM bank 1 empty.  */
diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
index 7c8ca5ddf6..2205145ecc 100644
--- a/hw/m68k/mcf5208.c
+++ b/hw/m68k/mcf5208.c
@@ -157,8 +157,9 @@ static uint64_t m5208_sys_read(void *opaque, hwaddr addr,
         {
             int n;
             for (n = 0; n < 32; n++) {
-                if (ram_size < (2u << n))
+                if (current_machine->ram_size < (2u << n)) {
                     break;
+                }
             }
             return (n - 1)  | 0x40000000;
         }
diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
index 8e5fbfc8fa..27600e0cc0 100644
--- a/target/m68k/m68k-semi.c
+++ b/target/m68k/m68k-semi.c
@@ -26,6 +26,7 @@
 #else
 #include "exec/gdbstub.h"
 #include "exec/softmmu-semi.h"
+#include "hw/boards.h"
 #endif
 #include "qemu/log.h"
 
@@ -455,8 +456,8 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
          * FIXME: This is wrong for boards where RAM does not start at
          * address zero.
          */
-        env->dregs[1] = ram_size;
-        env->aregs[7] = ram_size;
+        env->dregs[1] = current_machine->ram_size;
+        env->aregs[7] = current_machine->ram_size;
 #endif
         return;
     default:
-- 
2.26.2




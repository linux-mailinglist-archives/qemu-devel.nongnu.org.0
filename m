Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A11F2B18F0
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 11:21:51 +0100 (CET)
Received: from localhost ([::1]:33906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdWDG-0004XY-4p
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 05:21:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdW8p-0007oV-K3
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:17:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdW8n-0003pz-2k
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:17:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605262631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z9BFpTmb7+gtYzSFV5fVpYpSdjZtAzA3NZ4nrXXvDUc=;
 b=EVRQ9JLyia9tXKKOigWjFwI8WF1X9i0n248Qwz5j/rHUs+O9VAT5ivjFLXOo8XduPtWAUx
 OWsN7C/GkIsl5+w8B5Z73VBhoHWIzbS9XgmXnEa2L4hQwv4sYiXmre0aMDRcrnq0Z1oNQt
 PboGm8EfgW7C+TkDZPxbnYSYkoS9/gE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-fIEQJuwhPZ6ZF4yIAPAmMA-1; Fri, 13 Nov 2020 05:17:09 -0500
X-MC-Unique: fIEQJuwhPZ6ZF4yIAPAmMA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B2D6108E1B6;
 Fri, 13 Nov 2020 10:17:08 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA5C75577C;
 Fri, 13 Nov 2020 10:17:07 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 006/122] m68k: do not use ram_size global
Date: Fri, 13 Nov 2020 05:15:08 -0500
Message-Id: <20201113101704.1438368-6-pbonzini@redhat.com>
In-Reply-To: <20201113101704.1438368-1-pbonzini@redhat.com>
References: <20201113101704.1438368-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, peter.maydell@linaro.org,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the machine properties instead.

Cc: Laurent Vivier <lvivier@redhat.com>
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



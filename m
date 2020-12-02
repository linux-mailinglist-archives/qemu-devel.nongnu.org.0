Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 245942CB743
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:33:53 +0100 (CET)
Received: from localhost ([::1]:44130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNaC-0004JY-6e
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:33:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCd-0003Al-G0
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCI-0003iE-Ui
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JoTI8HLYNJHmxE2vsvZEe9/42vzmUbuqTpGxhCf7BEs=;
 b=H0q+qG7b+Ng2B1PyRohvWYKBXOfXa7awHoCmvIQYBbPxsvAh0P1/crlwstO9rToGHCe2d4
 mWrVyUSwDcphaYIONGMCu+fZczUNgvisbXSvO4gvJFrLTnZ7zoxwaiAsZmV6IgEXZ/rNIX
 FQAzOuTAtmAjg6XUaV0+ZQzNqf7CVJ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-3uVqQrl4OkS44Y7ZS5_g_Q-1; Wed, 02 Dec 2020 03:09:08 -0500
X-MC-Unique: 3uVqQrl4OkS44Y7ZS5_g_Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84A01185E48B
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:07 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 525A31346F
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:07 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 048/113] sparc64: do not use ram_size global
Date: Wed,  2 Dec 2020 03:07:44 -0500
Message-Id: <20201202080849.4125477-49-pbonzini@redhat.com>
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

Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/sparc64/sparc64.c | 3 ++-
 hw/sparc64/sun4u.c   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/sparc64/sparc64.c b/hw/sparc64/sparc64.c
index 100b2fab17..e3f9219a10 100644
--- a/hw/sparc64/sparc64.c
+++ b/hw/sparc64/sparc64.c
@@ -25,6 +25,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "hw/boards.h"
 #include "hw/char/serial.h"
 #include "hw/sparc/sparc64.h"
 #include "qemu/timer.h"
@@ -180,7 +181,7 @@ static void main_cpu_reset(void *opaque)
     cpu_timer_reset(env->hstick);
 
     env->gregs[1] = 0; /* Memory start */
-    env->gregs[2] = ram_size; /* Memory size */
+    env->gregs[2] = current_machine->ram_size; /* Memory size */
     env->gregs[3] = 0; /* Machine description XXX */
     if (nr_resets++ == 0) {
         /* Power on reset */
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 22896b4c62..8bee7dd2f4 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -690,7 +690,7 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
     initrd_addr = 0;
     kernel_size = sun4u_load_kernel(machine->kernel_filename,
                                     machine->initrd_filename,
-                                    ram_size, &initrd_size, &initrd_addr,
+                                    machine->ram_size, &initrd_size, &initrd_addr,
                                     &kernel_addr, &kernel_entry);
 
     sun4u_NVRAM_set_params(nvram, NVRAM_SIZE, "Sun4u", machine->ram_size,
@@ -713,7 +713,7 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
     fw_cfg = FW_CFG(dev);
     fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)machine->smp.cpus);
     fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)machine->smp.max_cpus);
-    fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)ram_size);
+    fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)machine->ram_size);
     fw_cfg_add_i16(fw_cfg, FW_CFG_MACHINE_ID, hwdef->machine_id);
     fw_cfg_add_i64(fw_cfg, FW_CFG_KERNEL_ADDR, kernel_entry);
     fw_cfg_add_i64(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
-- 
2.26.2




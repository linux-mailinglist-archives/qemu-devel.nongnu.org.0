Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 452242CB745
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:33:56 +0100 (CET)
Received: from localhost ([::1]:44512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNaF-0004UX-Ai
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:33:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCJ-0002rZ-IG
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCC-0003eq-JT
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zj3bcorcFbi3fuWKGyW/m3SOE4QmU2FoZcHULTZm/4A=;
 b=GSVUs5PGuXZo/lrI5IMvtSRomf6mNlICbc+wGKSmugfp/twUvmaaBrdjYCRkm9FqInpCWn
 k5YUSz8td3sNvTclbC9S2n6nPBDQc6qFOz2GrkE+6SYfE6kGX0Avbe4FDjGjqO6fSEqQGp
 1rDncSq8HQ8/CxhbqBW49z+OOFJ8MHo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-z8rrQByuO-atxCa0eg5iAw-1; Wed, 02 Dec 2020 03:09:02 -0500
X-MC-Unique: z8rrQByuO-atxCa0eg5iAw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 855541074642
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:01 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50E7F60855
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:01 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 030/113] rx: move BIOS load from MCU to board
Date: Wed,  2 Dec 2020 03:07:26 -0500
Message-Id: <20201202080849.4125477-31-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

The ROM loader state is global and not part of the MCU, and the
BIOS is in machine->firmware.  So just like the kernel case,
load it in the board.

Due to the ordering between CPU reset and ROM reset, the ROM
has to be registered before the CPU is realized, otherwise
the reset vector is loaded before the ROM is there.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/rx/rx-gdbsim.c | 10 ++++++++++
 hw/rx/rx62n.c     |  9 ---------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
index 285549c79b..b1d7c2488f 100644
--- a/hw/rx/rx-gdbsim.c
+++ b/hw/rx/rx-gdbsim.c
@@ -106,6 +106,16 @@ static void rx_gdbsim_init(MachineState *machine)
                              rxc->xtal_freq_hz, &error_abort);
     object_property_set_bool(OBJECT(&s->mcu), "load-kernel",
                              kernel_filename != NULL, &error_abort);
+
+    if (!kernel_filename) {
+        if (machine->firmware) {
+            rom_add_file_fixed(machine->firmware, RX62N_CFLASH_BASE, 0);
+        } else if (!qtest_enabled()) {
+            error_report("No bios or kernel specified");
+            exit(1);
+        }
+    }
+
     qdev_realize(DEVICE(&s->mcu), NULL, &error_abort);
 
     /* Load kernel and dtb */
diff --git a/hw/rx/rx62n.c b/hw/rx/rx62n.c
index 6eb4eea700..17ec73fc7b 100644
--- a/hw/rx/rx62n.c
+++ b/hw/rx/rx62n.c
@@ -245,15 +245,6 @@ static void rx62n_realize(DeviceState *dev, Error **errp)
                            rxc->rom_flash_size, &error_abort);
     memory_region_add_subregion(s->sysmem, RX62N_CFLASH_BASE, &s->c_flash);
 
-    if (!s->kernel) {
-        if (bios_name) {
-            rom_add_file_fixed(bios_name, RX62N_CFLASH_BASE, 0);
-        }  else if (!qtest_enabled()) {
-            error_report("No bios or kernel specified");
-            exit(1);
-        }
-    }
-
     /* Initialize CPU */
     object_initialize_child(OBJECT(s), "cpu", &s->cpu, TYPE_RX62N_CPU);
     qdev_realize(DEVICE(&s->cpu), NULL, &error_abort);
-- 
2.26.2




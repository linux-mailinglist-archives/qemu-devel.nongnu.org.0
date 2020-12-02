Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8DC2CB705
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:26:27 +0100 (CET)
Received: from localhost ([::1]:55422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNT0-0005VT-Gl
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:26:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCP-0002wz-99
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCF-0003gZ-I2
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DrZZG5jmSiQnnHIn1NqKMicV5UuGzvfg9THg9XdXTqY=;
 b=jQtGCz9dC2lAaGg+iitOdvswmI/LRX49MbvasIz6jDzhoppmWqWR4bDpAcyRiG3wNQOUpB
 4rCVoQjivy1qmuqRBnU6zWFOX4b9+K83gP8hTAcjAayPiWa8VXPpc27II3U251fpv14Iv5
 VDfqJY1pw9bHCMCHJwhyVlLIgp6H7yo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-xExnd77dOUSX6qLoltMklA-1; Wed, 02 Dec 2020 03:09:05 -0500
X-MC-Unique: xExnd77dOUSX6qLoltMklA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24B885708B
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:04 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4FDC60854
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:03 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 038/113] hppa: do not use ram_size global
Date: Wed,  2 Dec 2020 03:07:34 -0500
Message-Id: <20201202080849.4125477-39-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Cc: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/hppa/machine.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 5e745d5ea9..7e41cb2462 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -97,7 +97,7 @@ static FWCfgState *create_fw_cfg(MachineState *ms)
     fw_cfg = fw_cfg_init_mem(FW_CFG_IO_BASE, FW_CFG_IO_BASE + 4);
     fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, ms->smp.cpus);
     fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, HPPA_MAX_CPUS);
-    fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, ram_size);
+    fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, ms->ram_size);
 
     val = cpu_to_le64(MIN_SEABIOS_HPPA_VERSION);
     fw_cfg_add_file(fw_cfg, "/etc/firmware-min-version",
@@ -288,7 +288,7 @@ static void machine_hppa_init(MachineState *machine)
                (1) Due to sign-extension problems and PDC,
                put the initrd no higher than 1G.
                (2) Reserve 64k for stack.  */
-            initrd_base = MIN(ram_size, 1 * GiB);
+            initrd_base = MIN(machine->ram_size, 1 * GiB);
             initrd_base = initrd_base - 64 * KiB;
             initrd_base = (initrd_base - initrd_size) & TARGET_PAGE_MASK;
 
@@ -316,7 +316,7 @@ static void machine_hppa_init(MachineState *machine)
      * various parameters in registers. After firmware initialization,
      * firmware will start the Linux kernel with ramdisk and cmdline.
      */
-    cpu[0]->env.gr[26] = ram_size;
+    cpu[0]->env.gr[26] = machine->ram_size;
     cpu[0]->env.gr[25] = kernel_entry;
 
     /* tell firmware how many SMP CPUs to present in inventory table */
@@ -342,11 +342,11 @@ static void hppa_machine_reset(MachineState *ms)
     }
 
     /* already initialized by machine_hppa_init()? */
-    if (cpu[0]->env.gr[26] == ram_size) {
+    if (cpu[0]->env.gr[26] == ms->ram_size) {
         return;
     }
 
-    cpu[0]->env.gr[26] = ram_size;
+    cpu[0]->env.gr[26] = ms->ram_size;
     cpu[0]->env.gr[25] = 0; /* no firmware boot menu */
     cpu[0]->env.gr[24] = 'c';
     /* gr22/gr23 unused, no initrd while reboot. */
-- 
2.26.2




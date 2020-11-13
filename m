Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1D42B18F3
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 11:22:53 +0100 (CET)
Received: from localhost ([::1]:36016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdWEG-0005PO-5h
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 05:22:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdW8q-0007pb-39
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:17:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdW8n-0003qF-7P
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:17:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605262632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DrZZG5jmSiQnnHIn1NqKMicV5UuGzvfg9THg9XdXTqY=;
 b=a40G1qlmZru6ySG+YOvOc6chY5tdUhoDrncbhYqnsw0Is6RXafQLzAIH70qFY4EmBQ73R0
 21faB4PQzAGIcbf0ePuqFzeiFuI1u2U/9aYnERFfqjn+P6y5PfLNtsR+Lpx40ah2qbuw00
 66vh7G8+cuk77sI7hGxnc8znnud0dkg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-nKeTh2fAPpCV2cD3TeN33w-1; Fri, 13 Nov 2020 05:17:08 -0500
X-MC-Unique: nKeTh2fAPpCV2cD3TeN33w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4817380476D;
 Fri, 13 Nov 2020 10:17:07 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7CBB6266E;
 Fri, 13 Nov 2020 10:17:06 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 004/122] hppa: do not use ram_size global
Date: Fri, 13 Nov 2020 05:15:06 -0500
Message-Id: <20201113101704.1438368-4-pbonzini@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A6D276E40
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 12:09:54 +0200 (CEST)
Received: from localhost ([::1]:44862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLOCH-0008Od-7R
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 06:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kLNUj-0003GQ-D5
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 05:24:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kLNUf-0006Dj-1O
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 05:24:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600939488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2HvvtwzpHTGOzwzadI1RwIMbDs7UrGgpyDO7sMz7WK0=;
 b=Dxf5gb6sBzf/E6dS6HTRNS03UbyEim9uoozFaJHnUiVJ5fa1yFSxe69W7IHNAd651lu46p
 YHTIEwsM1QSdHPF0BIJoaEOdR2j11IrSFXfcqekPYqxai+384Sd+w6RfNUtMafjnFt44it
 gvlvwZBcG/+dBKaIU6rnEmSu+AbwPMo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-Kcoju48jOu6ir8mxElibHw-1; Thu, 24 Sep 2020 05:24:46 -0400
X-MC-Unique: Kcoju48jOu6ir8mxElibHw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F0E61009456
 for <qemu-devel@nongnu.org>; Thu, 24 Sep 2020 09:24:45 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D1775C1C7;
 Thu, 24 Sep 2020 09:24:42 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 75/92] hw/i386/xen: Rename X86/PC specific function as
 xen_hvm_init_pc()
Date: Thu, 24 Sep 2020 05:22:57 -0400
Message-Id: <20200924092314.1722645-76-pbonzini@redhat.com>
In-Reply-To: <20200924092314.1722645-1-pbonzini@redhat.com>
References: <20200924092314.1722645-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/24 01:10:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

xen_hvm_init() is only meanful to initialize a X86/PC machine,
rename it as xen_hvm_init_pc().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200908155530.249806-3-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/stubs/xen-stub.c | 2 +-
 hw/i386/pc_piix.c      | 6 +++---
 hw/i386/xen/xen-hvm.c  | 2 +-
 include/hw/xen/xen.h   | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/accel/stubs/xen-stub.c b/accel/stubs/xen-stub.c
index 8ae658acff..fa3dddbce5 100644
--- a/accel/stubs/xen-stub.c
+++ b/accel/stubs/xen-stub.c
@@ -46,7 +46,7 @@ void xen_register_framebuffer(MemoryRegion *mr)
 {
 }
 
-void xen_hvm_init(PCMachineState *pcms, MemoryRegion **ram_memory)
+void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
 {
 }
 
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 32c5d95762..9eaf8d6e0d 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -117,8 +117,8 @@ static void pc_init1(MachineState *machine,
      *    so legacy non-PAE guests can get as much memory as possible in
      *    the 32bit address space below 4G.
      *
-     *  - Note that Xen has its own ram setp code in xen_ram_init(),
-     *    called via xen_hvm_init().
+     *  - Note that Xen has its own ram setup code in xen_ram_init(),
+     *    called via xen_hvm_init_pc().
      *
      * Examples:
      *    qemu -M pc-1.7 -m 4G    (old default)    -> 3584M low,  512M high
@@ -127,7 +127,7 @@ static void pc_init1(MachineState *machine,
      *    qemu -M pc,max-ram-below-4g=4G -m 3968M  -> 3968M low (=4G-128M)
      */
     if (xen_enabled()) {
-        xen_hvm_init(pcms, &ram_memory);
+        xen_hvm_init_pc(pcms, &ram_memory);
     } else {
         if (!pcms->max_ram_below_4g) {
             pcms->max_ram_below_4g = 0xe0000000; /* default: 3.5G */
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index cde981bad6..49748cda3f 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -1395,7 +1395,7 @@ static int xen_map_ioreq_server(XenIOState *state)
     return 0;
 }
 
-void xen_hvm_init(PCMachineState *pcms, MemoryRegion **ram_memory)
+void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
 {
     MachineState *ms = MACHINE(pcms);
     unsigned int max_cpus = ms->smp.max_cpus;
diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index 771dd447f2..b2b459964c 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -30,7 +30,7 @@ qemu_irq *xen_interrupt_controller_init(void);
 
 void xenstore_store_pv_console_info(int i, struct Chardev *chr);
 
-void xen_hvm_init(PCMachineState *pcms, MemoryRegion **ram_memory);
+void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory);
 
 void xen_register_framebuffer(struct MemoryRegion *mr);
 
-- 
2.26.2




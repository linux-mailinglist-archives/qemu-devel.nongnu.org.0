Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D589C215F89
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 21:40:53 +0200 (CEST)
Received: from localhost ([::1]:46184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsWyy-0007d1-UB
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 15:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jsWoI-00068c-Gx
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 15:29:50 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:45495
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jsWoF-0006qE-70
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 15:29:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594063786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=fIxSxXvqn7ZVW4c1IyVEmq3mBtW2quSHHypeMMBD4fU=;
 b=jSJxqFJ8/9/LsdS4vQ5JMAhUhL2GB9pDypGHELJa5A234d6FkIYJ5c7+sCwvjM+1czT4Rv
 2gpXMrI7Ia14n4B/CLMTmCgGCehYArhMGfiyHQJ4WffOG5sf811GvbrRhgSMPpUR1SWu4J
 4lwNdJkmiYwfCTeUrjteFR0qA8Uu9+E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-Vdos5F9CN3SU0hTKuS2w1w-1; Mon, 06 Jul 2020 15:29:42 -0400
X-MC-Unique: Vdos5F9CN3SU0hTKuS2w1w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12D4A100A8E7;
 Mon,  6 Jul 2020 19:29:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-200.ams2.redhat.com
 [10.36.112.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B74B275E37;
 Mon,  6 Jul 2020 19:29:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7E8C831EBB; Mon,  6 Jul 2020 21:29:22 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/20] pc_basic_device_init: drop no_vmport arg
Date: Mon,  6 Jul 2020 21:29:14 +0200
Message-Id: <20200706192921.1154-14-kraxel@redhat.com>
In-Reply-To: <20200706192921.1154-1-kraxel@redhat.com>
References: <20200706192921.1154-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 15:29:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we pass pcms anyway, we don't need the no_vmport arg any more.
No functional change.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20200702132525.6849-14-kraxel@redhat.com
---
 include/hw/i386/pc.h | 1 -
 hw/i386/pc.c         | 3 +--
 hw/i386/pc_piix.c    | 1 -
 hw/i386/pc_q35.c     | 1 -
 4 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index bd447e380b5e..d7690bf4290f 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -164,7 +164,6 @@ void pc_basic_device_init(struct PCMachineState *pcms,
                           ISABus *isa_bus, qemu_irq *gsi,
                           ISADevice **rtc_state,
                           bool create_fdctrl,
-                          bool no_vmport,
                           uint32_t hpet_irqs);
 void pc_init_ne2k_isa(ISABus *bus, NICInfo *nd);
 void pc_cmos_init(PCMachineState *pcms,
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 9f5153b6f24d..407c782b5d42 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1159,7 +1159,6 @@ void pc_basic_device_init(struct PCMachineState *pcms,
                           ISABus *isa_bus, qemu_irq *gsi,
                           ISADevice **rtc_state,
                           bool create_fdctrl,
-                          bool no_vmport,
                           uint32_t hpet_irqs)
 {
     int i;
@@ -1226,7 +1225,7 @@ void pc_basic_device_init(struct PCMachineState *pcms,
     i8257_dma_init(isa_bus, 0);
 
     /* Super I/O */
-    pc_superio_init(isa_bus, create_fdctrl, no_vmport);
+    pc_superio_init(isa_bus, create_fdctrl, pcms->vmport != ON_OFF_AUTO_ON);
 }
 
 void pc_nic_init(PCMachineClass *pcmc, ISABus *isa_bus, PCIBus *pci_bus)
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 6c1612d0ca45..1ef3f39c55a5 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -236,7 +236,6 @@ static void pc_init1(MachineState *machine,
 
     /* init basic PC hardware */
     pc_basic_device_init(pcms, isa_bus, x86ms->gsi, &rtc_state, true,
-                         (pcms->vmport != ON_OFF_AUTO_ON),
                          0x4);
 
     pc_nic_init(pcmc, isa_bus, pci_bus);
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 6faf4458549a..5f8f21b84093 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -276,7 +276,6 @@ static void pc_q35_init(MachineState *machine)
 
     /* init basic PC hardware */
     pc_basic_device_init(pcms, isa_bus, x86ms->gsi, &rtc_state, !mc->no_floppy,
-                         (pcms->vmport != ON_OFF_AUTO_ON),
                          0xff0104);
 
     /* connect pm stuff to lpc */
-- 
2.18.4



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E5420723A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 13:36:49 +0200 (CEST)
Received: from localhost ([::1]:35320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo3hw-0005ug-HA
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 07:36:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jo3c5-00044M-91
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 07:30:45 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22735
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jo3c1-0007xL-CY
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 07:30:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592998240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=gfBuyfc7G/vlLWwnGPkLgANWNVQeAFkuNQv715t1Kgg=;
 b=NLmDKFUj9sXSLKcvpiC5SLLKdsjZWihm5kmF9ionILT1oh7Zw7ievWE5yciNQ+tMZ3/fKP
 N/72THhfw69YiGvRBHRdsfUL1lGRd2rc9Zj2tKUAL5ezDQcrQfhCH8bMevwqUbHCPRl3gq
 a/iNjazTOfp2tDdgCiva/dtzRyItxVU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-KsTcvY1hNwC-vVCiMyH9oQ-1; Wed, 24 Jun 2020 07:30:39 -0400
X-MC-Unique: KsTcvY1hNwC-vVCiMyH9oQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0596805EE3;
 Wed, 24 Jun 2020 11:30:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68B17512FE;
 Wed, 24 Jun 2020 11:30:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 109D231E3F; Wed, 24 Jun 2020 13:30:27 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/20] pc_basic_device_init: pass PCMachineState
Date: Wed, 24 Jun 2020 13:30:17 +0200
Message-Id: <20200624113026.13343-12-kraxel@redhat.com>
In-Reply-To: <20200624113026.13343-1-kraxel@redhat.com>
References: <20200624113026.13343-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 02:33:25
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
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Need access to pcms for pcspk initialization.
Just preparation, no functional change.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/i386/pc.h | 3 ++-
 hw/i386/pc.c         | 3 ++-
 hw/i386/pc_piix.c    | 2 +-
 hw/i386/pc_q35.c     | 2 +-
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index e6135c34d656..9b94926410c0 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -160,7 +160,8 @@ void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion **ram_memory);
 uint64_t pc_pci_hole64_start(void);
 DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus);
-void pc_basic_device_init(ISABus *isa_bus, qemu_irq *gsi,
+void pc_basic_device_init(struct PCMachineState *pcms,
+                          ISABus *isa_bus, qemu_irq *gsi,
                           ISADevice **rtc_state,
                           bool create_fdctrl,
                           bool no_vmport,
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index d103b8c0ab82..9afb003dfc21 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1176,7 +1176,8 @@ static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl, bool no_vmport)
     g_free(a20_line);
 }
 
-void pc_basic_device_init(ISABus *isa_bus, qemu_irq *gsi,
+void pc_basic_device_init(struct PCMachineState *pcms,
+                          ISABus *isa_bus, qemu_irq *gsi,
                           ISADevice **rtc_state,
                           bool create_fdctrl,
                           bool no_vmport,
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 1497d0e4ae94..605252fe7936 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -235,7 +235,7 @@ static void pc_init1(MachineState *machine,
     }
 
     /* init basic PC hardware */
-    pc_basic_device_init(isa_bus, x86ms->gsi, &rtc_state, true,
+    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, &rtc_state, true,
                          (pcms->vmport != ON_OFF_AUTO_ON), pcms->pit_enabled,
                          0x4);
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 46cd06524c68..e4b15f27227a 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -275,7 +275,7 @@ static void pc_q35_init(MachineState *machine)
     }
 
     /* init basic PC hardware */
-    pc_basic_device_init(isa_bus, x86ms->gsi, &rtc_state, !mc->no_floppy,
+    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, &rtc_state, !mc->no_floppy,
                          (pcms->vmport != ON_OFF_AUTO_ON), pcms->pit_enabled,
                          0xff0104);
 
-- 
2.18.4



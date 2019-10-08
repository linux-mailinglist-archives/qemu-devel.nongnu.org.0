Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFFCCF8AE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Oct 2019 13:40:16 +0200 (CEST)
Received: from localhost ([::1]:54024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHnqh-0008ES-Hl
	for lists+qemu-devel@lfdr.de; Tue, 08 Oct 2019 07:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51645)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iHnkD-0001uX-98
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 07:33:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iHnkC-0001VQ-8V
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 07:33:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58842)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1iHnkC-0001V4-30; Tue, 08 Oct 2019 07:33:32 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 38F873066EAC;
 Tue,  8 Oct 2019 11:33:31 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 955BB60BE0;
 Tue,  8 Oct 2019 11:33:29 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] hppa: drop usage of
 memory_region_allocate_system_memory() for ROM
Date: Tue,  8 Oct 2019 07:33:18 -0400
Message-Id: <20191008113318.7012-4-imammedo@redhat.com>
In-Reply-To: <20191008113318.7012-1-imammedo@redhat.com>
References: <20191008113318.7012-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 08 Oct 2019 11:33:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: deller@gmx.de, mark.cave-ayland@ilande.co.uk, hpoussin@reactos.org,
 qemu-ppc@nongnu.org, rth@twiddle.net, atar4qemu@gmail.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

machine_hppa_init() violates memory_region_allocate_system_memory() contract
by calling it multiple times which could break with -mem-path. Replace
the second usage (for 'rom') with memory_region_init_ram() instead.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/hppa/machine.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 7e23675429..953d454f48 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -161,9 +161,8 @@ static void machine_hppa_init(MachineState *machine)
     g_free(firmware_filename);
 
     rom_region = g_new(MemoryRegion, 1);
-    memory_region_allocate_system_memory(rom_region, OBJECT(machine),
-                                         "firmware",
-                                         (FIRMWARE_END - FIRMWARE_START));
+    memory_region_init_ram(rom_region, NULL, "firmware",
+                           (FIRMWARE_END - FIRMWARE_START), &error_fatal);
     memory_region_add_subregion(addr_space, FIRMWARE_START, rom_region);
 
     /* Load kernel */
-- 
2.18.1



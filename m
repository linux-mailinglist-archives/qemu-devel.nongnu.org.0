Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7ED13C83B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 16:43:34 +0100 (CET)
Received: from localhost ([::1]:56018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irkpQ-00043u-SL
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 10:43:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49405)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkKS-0008NK-5i
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkKQ-00007Q-Vd
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:32 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:37774
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkKQ-00005x-R3
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BodJZ2/t7zg+j82vxZS/xF8BVbdEormj2ANyrNQn15g=;
 b=OIg8KVywIxJd4FJE+3Wqwd1qPt9FuCOLqMji4vpzKISaBcViM6v9KVv9+WEjKAZPKrHW2K
 h1HAjq9GbcbzxPLpw0wnda2gPFg2hsTnSkf+VDEr0VGoaR6pNGTXwShEVfY3LnN7VEhjB1
 5gQsN3zd72YNPajVzAQMfkeB62qAsTc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-WhT6W5dKMrWXL1Y_3wmHxw-1; Wed, 15 Jan 2020 10:11:29 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 645CBCF24C
 for <qemu-devel@nongnu.org>; Wed, 15 Jan 2020 15:11:28 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBDF7194B2
 for <qemu-devel@nongnu.org>; Wed, 15 Jan 2020 15:11:27 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 42/86] hw/hppa/machine: Restrict the total memory size to
 3GB
Date: Wed, 15 Jan 2020 16:06:57 +0100
Message-Id: <1579100861-73692-43-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: WhT6W5dKMrWXL1Y_3wmHxw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

The hardware expects DIMM slots of 1 or 2 GB, allowing up to
4 GB of memory. We want to accept the same amount of memory the
hardware can deal with. DIMMs of 768MB are not available.

However we have to deal with a firmware limitation: currently
SeaBIOS only supports 32-bit, and expects the RAM size in a
32-bit register. When using a 4GB configuration, the 32-bit
register get truncated and we report a size of 0MB to SeaBIOS,
which ends halting the machine:

  $ qemu-system-hppa -m 4g -serial stdio

  SeaBIOS: Machine configured with too little memory (0 MB), minimum is 16 =
MB.

  SeaBIOS wants SYSTEM HALT.

The easiest way is to restrict the machine to 3GB of memory.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Helge Deller <deller@gmx.de>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/hppa/machine.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 6775d87..119ae4d 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -90,12 +90,11 @@ static void machine_hppa_init(MachineState *machine)
         g_free(name);
     }
=20
-    /* Limit main memory. */
-    if (ram_size > FIRMWARE_START) {
-        machine->ram_size =3D ram_size =3D FIRMWARE_START;
-    }
-
     /* Main memory region. */
+    if (machine->ram_size > 3 * GiB) {
+        error_report("RAM size is currently restricted to 3GB");
+        exit(EXIT_FAILURE);
+    }
     ram_region =3D g_new(MemoryRegion, 1);
     memory_region_allocate_system_memory(ram_region, OBJECT(machine),
                                          "ram", ram_size);
--=20
2.7.4



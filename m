Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EED66488CA
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 18:24:09 +0200 (CEST)
Received: from localhost ([::1]:49064 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcuQT-0004yT-6X
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 12:24:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44285)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hcu56-0004Ys-MN
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 12:02:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hcu54-0006lD-KK
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 12:02:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:63750)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hcu4x-0006QS-4l; Mon, 17 Jun 2019 12:01:55 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D98AEF9E85;
 Mon, 17 Jun 2019 16:01:44 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-19.brq.redhat.com [10.40.204.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C03F6A480;
 Mon, 17 Jun 2019 16:01:38 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 17 Jun 2019 18:01:36 +0200
Message-Id: <20190617160136.29930-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Mon, 17 Jun 2019 16:01:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] hw/arm/msf2-som: Exit when the cpu is not the
 expected one
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This machine correctly defines its default_cpu_type to cortex-m3
and report an error if the user requested another cpu_type,
however it does not exit, and this can confuse users trying
to use another core:

  $ qemu-system-arm -M emcraft-sf2 -cpu cortex-m4 -kernel test-m4.elf
  qemu-system-arm: This board can only be used with CPU cortex-m3-arm-cpu
  [output related to M3 core ...]

The CPU is indeed a M3 core:

  (qemu) info qom-tree
  /machine (emcraft-sf2-machine)
    /unattached (container)
      /device[0] (msf2-soc)
        /armv7m (armv7m)
          /cpu (cortex-m3-arm-cpu)

Add the missing exit() call to return to the shell.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/msf2-som.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
index 8c550a8bdd..2c9984bb3b 100644
--- a/hw/arm/msf2-som.c
+++ b/hw/arm/msf2-som.c
@@ -53,6 +53,7 @@ static void emcraft_sf2_s2s010_init(MachineState *machi=
ne)
     if (strcmp(machine->cpu_type, mc->default_cpu_type) !=3D 0) {
         error_report("This board can only be used with CPU %s",
                      mc->default_cpu_type);
+        exit(1);
     }
=20
     memory_region_init_ram(ddr, NULL, "ddr-ram", DDR_SIZE,
--=20
2.20.1



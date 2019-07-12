Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7D267006
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 15:26:44 +0200 (CEST)
Received: from localhost ([::1]:49356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlvZT-0003y8-F7
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 09:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53411)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefan@weilnetz.de>) id 1hlvZG-0003Zv-94
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 09:26:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefan@weilnetz.de>) id 1hlvZA-0000c6-AZ
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 09:26:29 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:40888
 helo=v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefan@weilnetz.de>) id 1hlvZ9-0000O5-U9
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 09:26:24 -0400
Received: from localhost (localhost [127.0.0.1])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id 04B1FDB8610;
 Fri, 12 Jul 2019 15:26:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
 by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id tsKf-iIv6hc1; Fri, 12 Jul 2019 15:26:21 +0200 (CEST)
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id 5D6E9DB8602;
 Fri, 12 Jul 2019 15:26:21 +0200 (CEST)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 3FCF746004F; Fri, 12 Jul 2019 15:26:21 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Fri, 12 Jul 2019 15:26:11 +0200
Message-Id: <20190712132611.20411-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 37.120.169.71
Subject: [Qemu-devel] [PATCH for 4.1] Fix broken build with WHPX enabled
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Like Xu <like.xu@linux.intel.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 target/i386/whpx-all.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/whpx-all.c b/target/i386/whpx-all.c
index 31d47320e4..ed95105eae 100644
--- a/target/i386/whpx-all.c
+++ b/target/i386/whpx-all.c
@@ -1396,7 +1396,7 @@ static int whpx_accel_init(MachineState *ms)
     }
=20
     memset(&prop, 0, sizeof(WHV_PARTITION_PROPERTY));
-    prop.ProcessorCount =3D smp_cpus;
+    prop.ProcessorCount =3D ms->smp.cpus;
     hr =3D whp_dispatch.WHvSetPartitionProperty(
         whpx->partition,
         WHvPartitionPropertyCodeProcessorCount,
@@ -1405,7 +1405,7 @@ static int whpx_accel_init(MachineState *ms)
=20
     if (FAILED(hr)) {
         error_report("WHPX: Failed to set partition core count to %d,"
-                     " hr=3D%08lx", smp_cores, hr);
+                     " hr=3D%08lx", ms->smp.cores, hr);
         ret =3D -EINVAL;
         goto error;
     }
--=20
2.20.1



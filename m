Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBC114EF97
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 16:30:31 +0100 (CET)
Received: from localhost ([::1]:54768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixYFa-0002XW-2g
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 10:30:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39188)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1ixXyH-0004HX-DL
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ixXyG-0003zJ-4R
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:37 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:26740)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1ixXyF-0003yS-VR
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580483555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dLfrLlfqJIOlot/a9eXyuZKuYmHGI1ouzxI1pP9/guI=;
 b=T8L4YQqdB3HiVZN2jPw0kcQG11vU6aVjA4DK6gJVAKAjfEtKbMugT7zhSj/kZ28qBHDWrn
 ltzQambiM5Hhd96m2GwE4CNGvMcbYHWXEpU16vdrCqhhsbqCQ0K4/YjXiytAMNIttl/d5g
 8evKDmSH9XjjiwqZHovNp493bQNEkeo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-dUzDpkunPbe5ENlgSuVYSw-1; Fri, 31 Jan 2020 10:12:31 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 222DD800D54
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 15:12:31 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D11289E85
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 15:12:30 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 18/80] arm/kzm: drop RAM size fixup
Date: Fri, 31 Jan 2020 16:08:48 +0100
Message-Id: <1580483390-131164-19-git-send-email-imammedo@redhat.com>
In-Reply-To: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
References: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: dUzDpkunPbe5ENlgSuVYSw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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

If the user provided too large a RAM size, the code used to
complain and trim it to the max size.  Now that RAM is allocated by
generic code, that's no longer possible, so generate an error and
exit instead.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Peter Chubb <peter.chubb@data61.csiro.au>
---
v3:
 * rephrase commit message in nicer way
   ("Chubb, Peter (Data61, Kensington NSW)" <Peter.Chubb@data61.csiro.au>)
 * reword error message and use size_to_str() to pretty print suggested siz=
e
   ("Chubb, Peter (Data61, Kensington NSW)" <Peter.Chubb@data61.csiro.au>)
---
 hw/arm/kzm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/arm/kzm.c b/hw/arm/kzm.c
index 1d5ef28..94cbac1 100644
--- a/hw/arm/kzm.c
+++ b/hw/arm/kzm.c
@@ -25,6 +25,7 @@
 #include "hw/char/serial.h"
 #include "sysemu/qtest.h"
 #include "sysemu/sysemu.h"
+#include "qemu/cutils.h"
=20
 /* Memory map for Kzm Emulation Baseboard:
  * 0x00000000-0x7fffffff See i.MX31 SOC for support
@@ -78,10 +79,10 @@ static void kzm_init(MachineState *machine)
=20
     /* Check the amount of memory is compatible with the SOC */
     if (machine->ram_size > (FSL_IMX31_SDRAM0_SIZE + FSL_IMX31_SDRAM1_SIZE=
)) {
-        warn_report("RAM size " RAM_ADDR_FMT " above max supported, "
-                    "reduced to %x", machine->ram_size,
-                    FSL_IMX31_SDRAM0_SIZE + FSL_IMX31_SDRAM1_SIZE);
-        machine->ram_size =3D FSL_IMX31_SDRAM0_SIZE + FSL_IMX31_SDRAM1_SIZ=
E;
+        char *sz =3D size_to_str(FSL_IMX31_SDRAM0_SIZE + FSL_IMX31_SDRAM1_=
SIZE);
+        error_report("RAM size more than %s is not supported", sz);
+        g_free(sz);
+        exit(EXIT_FAILURE);
     }
=20
     memory_region_allocate_system_memory(&s->ram, NULL, "kzm.ram",
--=20
2.7.4



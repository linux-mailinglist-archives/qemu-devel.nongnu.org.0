Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE7C187523
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 22:51:52 +0100 (CET)
Received: from localhost ([::1]:49558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDxeJ-0003Oe-4R
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 17:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43286)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jDxIG-0004TX-AO
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 17:29:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1jDxIF-0007au-46
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 17:29:04 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:36037)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1jDxIE-0007Y1-UW
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 17:29:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584394142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jw4q8DfrZQEahnQ+KEAR6m3aXaWL2VdhlvmmQmQERbA=;
 b=WIQF+hJEv1I9+mS6M6ZJxxy3z7ChAQ5QfKvsU6DrRwnQHlKmsfoQ3MbHhGPvwS7JCf8xVY
 a8w7oaN8mgx3H7Wp9TrTszWLYlTVawTYFecjH8lHWkpa3WB78By2y0kB1Tgg8si/vV8DXO
 FEQ8U4z0Dij745Ef34KOhFUmMaQJ5Sc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-ALAXCyJrMnmDQPpX2jm7FQ-1; Mon, 16 Mar 2020 17:29:00 -0400
X-MC-Unique: ALAXCyJrMnmDQPpX2jm7FQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3D02149C0
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 21:28:59 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.110.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C4C519C4F;
 Mon, 16 Mar 2020 21:28:58 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 49/61] hw/sparc: Use memory_region_init_rom() with read-only
 regions
Date: Mon, 16 Mar 2020 22:27:16 +0100
Message-Id: <1584394048-44994-50-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1584394048-44994-1-git-send-email-pbonzini@redhat.com>
References: <1584394048-44994-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

This commit was produced with the Coccinelle script
scripts/coccinelle/memory-region-housekeeping.cocci.

Reviewed-by: KONRAD Frederic <frederic.konrad@adacore.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/sparc/leon3.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index 5fa58aa..8f024da 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -255,8 +255,7 @@ static void leon3_generic_hw_init(MachineState *machine=
)
=20
     /* Allocate BIOS */
     prom_size =3D 8 * MiB;
-    memory_region_init_ram(prom, NULL, "Leon3.bios", prom_size, &error_fat=
al);
-    memory_region_set_readonly(prom, true);
+    memory_region_init_rom(prom, NULL, "Leon3.bios", prom_size, &error_fat=
al);
     memory_region_add_subregion(address_space_mem, LEON3_PROM_OFFSET, prom=
);
=20
     /* Load boot prom */
--=20
1.8.3.1




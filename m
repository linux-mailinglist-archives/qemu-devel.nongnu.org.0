Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 960C1D8DC3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Oct 2019 12:21:26 +0200 (CEST)
Received: from localhost ([::1]:40522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKgQn-00067W-Dk
	for lists+qemu-devel@lfdr.de; Wed, 16 Oct 2019 06:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33534)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slp@redhat.com>) id 1iKgJA-00074z-JZ
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 06:13:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <slp@redhat.com>) id 1iKgJ9-0000by-JD
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 06:13:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34944)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <slp@redhat.com>) id 1iKgJ9-0000bm-Dk
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 06:13:31 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A5FD530860C1;
 Wed, 16 Oct 2019 10:13:30 +0000 (UTC)
Received: from dritchie.redhat.com (unknown [10.33.36.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B230D60852;
 Wed, 16 Oct 2019 10:13:27 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 05/15] hw/i386/pc: avoid an assignment in if condition in
 x86_load_linux()
Date: Wed, 16 Oct 2019 12:12:32 +0200
Message-Id: <20191016101241.24405-6-slp@redhat.com>
In-Reply-To: <20191016101241.24405-1-slp@redhat.com>
References: <20191016101241.24405-1-slp@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Wed, 16 Oct 2019 10:13:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
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
Cc: ehabkost@redhat.com, Sergio Lopez <slp@redhat.com>, mst@redhat.com,
 lersek@redhat.com, groug@kaod.org, kraxel@redhat.com, pbonzini@redhat.com,
 imammedo@redhat.com, sgarzare@redhat.com, philmd@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow checkpatch.pl recommendation and avoid an assignment in if
condition in x86_load_linux().

Signed-off-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/i386/pc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c8608b8007..90c2263a33 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1045,7 +1045,14 @@ static void x86_load_linux(PCMachineState *pcms,
=20
     /* load the kernel header */
     f =3D fopen(kernel_filename, "rb");
-    if (!f || !(kernel_size =3D get_file_size(f)) ||
+    if (!f) {
+        fprintf(stderr, "qemu: could not open kernel file '%s': %s\n",
+                kernel_filename, strerror(errno));
+        exit(1);
+    }
+
+    kernel_size =3D get_file_size(f);
+    if (!kernel_size ||
         fread(header, 1, MIN(ARRAY_SIZE(header), kernel_size), f) !=3D
         MIN(ARRAY_SIZE(header), kernel_size)) {
         fprintf(stderr, "qemu: could not load kernel '%s': %s\n",
--=20
2.21.0



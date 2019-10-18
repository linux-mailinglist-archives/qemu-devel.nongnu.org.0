Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1DDDC370
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 13:01:44 +0200 (CEST)
Received: from localhost ([::1]:37954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLQ0s-00049q-9G
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 07:01:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57680)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slp@redhat.com>) id 1iLPtg-0005AL-0G
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 06:54:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <slp@redhat.com>) id 1iLPte-00014R-TI
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 06:54:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51491)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <slp@redhat.com>) id 1iLPte-00013M-No
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 06:54:14 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EE95479705;
 Fri, 18 Oct 2019 10:54:13 +0000 (UTC)
Received: from dritchie.redhat.com (unknown [10.33.36.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0583A61F21;
 Fri, 18 Oct 2019 10:54:00 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 05/15] hw/i386/pc: avoid an assignment in if condition in
 x86_load_linux()
Date: Fri, 18 Oct 2019 12:53:05 +0200
Message-Id: <20191018105315.27511-6-slp@redhat.com>
In-Reply-To: <20191018105315.27511-1-slp@redhat.com>
References: <20191018105315.27511-1-slp@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 18 Oct 2019 10:54:14 +0000 (UTC)
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
Cc: berrange@redhat.com, ehabkost@redhat.com, Sergio Lopez <slp@redhat.com>,
 mst@redhat.com, lersek@redhat.com, groug@kaod.org, marcandre.lureau@gmail.com,
 kraxel@redhat.com, pbonzini@redhat.com, imammedo@redhat.com,
 sgarzare@redhat.com, philmd@redhat.com, rth@twiddle.net
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



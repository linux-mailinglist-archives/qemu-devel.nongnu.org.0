Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1644459110
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jun 2019 04:22:10 +0200 (CEST)
Received: from localhost ([::1]:55756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hggWb-0002Bq-HC
	for lists+qemu-devel@lfdr.de; Thu, 27 Jun 2019 22:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50060)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hgg8U-0000nZ-Qb
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 21:57:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hgg8O-0000o3-GM
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 21:57:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40492)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hgg8O-0000l5-14
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 21:57:04 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2370F30842A0;
 Fri, 28 Jun 2019 01:57:03 +0000 (UTC)
Received: from localhost (ovpn-116-7.gru2.redhat.com [10.97.116.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91408608A7;
 Fri, 28 Jun 2019 01:57:02 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Thu, 27 Jun 2019 22:55:58 -0300
Message-Id: <20190628015606.32107-22-ehabkost@redhat.com>
In-Reply-To: <20190628015606.32107-1-ehabkost@redhat.com>
References: <20190628015606.32107-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Fri, 28 Jun 2019 01:57:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 21/29] deprecate -mem-path fallback to anonymous
 RAM
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Fallback might affect guest or worse whole host performance
or functionality if backing file were used to share guest RAM
with another process.

Patch deprecates fallback so that we could remove it in future
and ensure that QEMU will provide expected behavior and fail if
it can't use user provided backing file.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20190626074228.11558-1-imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 numa.c               | 6 ++++--
 qemu-deprecated.texi | 9 +++++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/numa.c b/numa.c
index c1f5e84fa5..48fd43ecc6 100644
--- a/numa.c
+++ b/numa.c
@@ -495,8 +495,10 @@ static void allocate_system_memory_nonnuma(MemoryReg=
ion *mr, Object *owner,
             if (mem_prealloc) {
                 exit(1);
             }
-            error_report("falling back to regular RAM allocation.");
-
+            warn_report("falling back to regular RAM allocation");
+            error_printf("This is deprecated. Make sure that -mem-path "
+                         " specified path has sufficient resources to al=
locate"
+                         " -m specified RAM amount");
             /* Legacy behavior: if allocation failed, fall back to
              * regular RAM allocation.
              */
diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
index 2fe9b72121..9cba82d5ec 100644
--- a/qemu-deprecated.texi
+++ b/qemu-deprecated.texi
@@ -112,6 +112,15 @@ QEMU using implicit generic or board specific splitt=
ing rule.
 Use @option{memdev} with @var{memory-backend-ram} backend or @option{mem=
} (if
 it's supported by used machine type) to define mapping explictly instead=
.
=20
+@subsection -mem-path fallback to RAM (since 4.1)
+Currently if guest RAM allocation from file pointed by @option{mem-path}
+fails, QEMU falls back to allocating from RAM, which might result
+in unpredictable behavior since the backing file specified by the user
+is ignored. In the future, users will be responsible for making sure
+the backing storage specified with @option{-mem-path} can actually provi=
de
+the guest RAM configured with @option{-m} and QEMU will fail to start up=
 if
+RAM allocation is unsuccessful.
+
 @section QEMU Machine Protocol (QMP) commands
=20
 @subsection block-dirty-bitmap-add "autoload" parameter (since 2.12.0)
--=20
2.18.0.rc1.1.g3f1ff2140



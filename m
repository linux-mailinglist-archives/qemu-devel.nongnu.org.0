Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F3F51B83
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 21:40:09 +0200 (CEST)
Received: from localhost ([::1]:54230 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfUoy-0005aA-6q
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 15:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50467)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hfUoA-000591-Hz
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 15:39:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hfUo9-0005JT-BI
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 15:39:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60736)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1hfUo9-0005Ij-69
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 15:39:17 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 838F0308FBAF;
 Mon, 24 Jun 2019 19:39:15 +0000 (UTC)
Received: from localhost (ovpn-204-152.brq.redhat.com [10.40.204.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EC3A5C232;
 Mon, 24 Jun 2019 19:39:14 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 24 Jun 2019 21:39:13 +0200
Message-Id: <20190624193913.28343-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Mon, 24 Jun 2019 19:39:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2] i386/kvm: Fix build with -m32
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Marcelo Tosatti <mtosatti@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

find_next_bit() takes a pointer of type "const unsigned long *", but the
first argument passed here is a "uint64_t *".  These types are
incompatible when compiling qemu with -m32.

Just use ctz64() instead.

Fixes: c686193072a47032d83cb4e131dc49ae30f9e5d
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 target/i386/kvm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index e4b4f5756a..31490bf8b5 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -1043,14 +1043,15 @@ static int hv_cpuid_check_and_set(CPUState *cs, s=
truct kvm_cpuid2 *cpuid,
     CPUX86State *env =3D &cpu->env;
     uint32_t r, fw, bits;
     uint64_t deps;
-    int i, dep_feat =3D 0;
+    int i, dep_feat;
=20
     if (!hyperv_feat_enabled(cpu, feature) && !cpu->hyperv_passthrough) =
{
         return 0;
     }
=20
     deps =3D kvm_hyperv_properties[feature].dependencies;
-    while ((dep_feat =3D find_next_bit(&deps, 64, dep_feat)) < 64) {
+    while (deps) {
+        dep_feat =3D ctz64(deps);
         if (!(hyperv_feat_enabled(cpu, dep_feat))) {
                 fprintf(stderr,
                         "Hyper-V %s requires Hyper-V %s\n",
@@ -1058,7 +1059,7 @@ static int hv_cpuid_check_and_set(CPUState *cs, str=
uct kvm_cpuid2 *cpuid,
                         kvm_hyperv_properties[dep_feat].desc);
                 return 1;
         }
-        dep_feat++;
+        deps &=3D ~(1ull << dep_feat);
     }
=20
     for (i =3D 0; i < ARRAY_SIZE(kvm_hyperv_properties[feature].flags); =
i++) {
--=20
2.21.0



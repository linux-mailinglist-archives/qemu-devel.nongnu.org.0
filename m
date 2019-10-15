Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D33ED8259
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 23:43:55 +0200 (CEST)
Received: from localhost ([::1]:60026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKUbh-0003qM-3X
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 17:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60120)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iKUX0-0006hB-1A
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 17:39:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iKUWz-0006xK-1y
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 17:39:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46956)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1iKUWy-0006x8-SQ
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 17:39:01 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1A745308FBB4;
 Tue, 15 Oct 2019 21:39:00 +0000 (UTC)
Received: from localhost (ovpn-116-20.phx2.redhat.com [10.3.116.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD4FC5D70D;
 Tue, 15 Oct 2019 21:38:59 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
 qemu-devel@nongnu.org
Subject: [PULL 18/18] target/i386: Add Snowridge-v2 (no MPX) CPU model
Date: Tue, 15 Oct 2019 18:37:45 -0300
Message-Id: <20191015213745.22174-19-ehabkost@redhat.com>
In-Reply-To: <20191015213745.22174-1-ehabkost@redhat.com>
References: <20191015213745.22174-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Tue, 15 Oct 2019 21:39:00 +0000 (UTC)
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
Cc: Xiaoyao Li <xiaoyao.li@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xiaoyao Li <xiaoyao.li@intel.com>

Add new version of Snowridge CPU model that removes MPX feature.

MPX support is being phased out by Intel. GCC has dropped it, Linux kerne=
l
and KVM are also going to do that in the future.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
Message-Id: <20191012024748.127135-1-xiaoyao.li@intel.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index b821132b6a..47200b40c1 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -2793,6 +2793,18 @@ static X86CPUDefinition builtin_x86_defs[] =3D {
             CPUID_6_EAX_ARAT,
         .xlevel =3D 0x80000008,
         .model_id =3D "Intel Atom Processor (SnowRidge)",
+        .versions =3D (X86CPUVersionDefinition[]) {
+            { .version =3D 1 },
+            {
+                .version =3D 2,
+                .props =3D (PropValue[]) {
+                    { "mpx", "off" },
+                    { "model-id", "Intel Atom Processor (Snowridge, no M=
PX)" },
+                    { /* end of list */ },
+                },
+            },
+            { /* end of list */ },
+        },
     },
     {
         .name =3D "KnightsMill",
--=20
2.21.0



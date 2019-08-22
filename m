Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CD19A34E
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 00:53:34 +0200 (CEST)
Received: from localhost ([::1]:48504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0vxV-0005WW-AK
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 18:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51078)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1i0vwF-00057h-HA
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 18:52:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1i0vwE-0003Xb-4v
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 18:52:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46584)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1i0vwD-0003XM-W6
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 18:52:14 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 173A387633;
 Thu, 22 Aug 2019 22:52:13 +0000 (UTC)
Received: from localhost (ovpn-116-73.gru2.redhat.com [10.97.116.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D6BB600CD;
 Thu, 22 Aug 2019 22:52:12 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Aug 2019 19:52:10 -0300
Message-Id: <20190822225210.32541-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Thu, 22 Aug 2019 22:52:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] i386: Omit all-zeroes entries from KVM CPUID
 table
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
Cc: Yumei Huang <yuhuang@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

KVM has a 80-entry limit at KVM_SET_CPUID2.  With the
introduction of CPUID[0x1F], it is now possible to hit this limit
with unusual CPU configurations, e.g.:

  $ ./x86_64-softmmu/qemu-system-x86_64 \
    -smp 1,dies=3D2,maxcpus=3D2 \
    -cpu EPYC,check=3Doff,enforce=3Doff \
    -machine accel=3Dkvm
  qemu-system-x86_64: kvm_init_vcpu failed: Argument list too long

This happens because QEMU adds a lot of all-zeroes CPUID entries
for unused CPUID leaves.  In the example above, we end up
creating 48 all-zeroes CPUID entries.

KVM already returns all-zeroes when emulating the CPUID
instruction if an entry is missing, so the all-zeroes entries are
redundant.  Skip those entries.  This reduces the CPUID table
size by half while keeping CPUID output unchanged.

Reported-by: Yumei Huang <yuhuang@redhat.com>
Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=3D1741508
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/kvm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 8023c679ea..4e3df2867d 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -1529,6 +1529,13 @@ int kvm_arch_init_vcpu(CPUState *cs)
             c->function =3D i;
             c->flags =3D 0;
             cpu_x86_cpuid(env, i, 0, &c->eax, &c->ebx, &c->ecx, &c->edx)=
;
+            if (!c->eax && !c->ebx && !c->ecx && !c->edx) {
+                /*
+                 * KVM already returns all zeroes if a CPUID entry is mi=
ssing,
+                 * so we can omit it and avoid hitting KVM's 80-entry li=
mit.
+                 */
+                cpuid_i--;
+            }
             break;
         }
     }
@@ -1593,6 +1600,13 @@ int kvm_arch_init_vcpu(CPUState *cs)
             c->function =3D i;
             c->flags =3D 0;
             cpu_x86_cpuid(env, i, 0, &c->eax, &c->ebx, &c->ecx, &c->edx)=
;
+            if (!c->eax && !c->ebx && !c->ecx && !c->edx) {
+                /*
+                 * KVM already returns all zeroes if a CPUID entry is mi=
ssing,
+                 * so we can omit it and avoid hitting KVM's 80-entry li=
mit.
+                 */
+                cpuid_i--;
+            }
             break;
         }
     }
--=20
2.21.0



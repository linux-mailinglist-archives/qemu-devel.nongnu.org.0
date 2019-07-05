Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 222145EEAB
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 23:40:04 +0200 (CEST)
Received: from localhost ([::1]:40902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1himyx-0005XU-9m
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 17:40:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38443)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1himVz-0006XT-47
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 17:10:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1himVw-0007MY-IC
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 17:10:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47372)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1himVr-0007GX-Lb
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 17:10:01 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 39DE2330272;
 Wed,  3 Jul 2019 21:09:48 +0000 (UTC)
Received: from localhost (ovpn-116-30.gru2.redhat.com [10.97.116.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C04815C88D;
 Wed,  3 Jul 2019 21:09:47 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>
Date: Wed,  3 Jul 2019 18:08:11 -0300
Message-Id: <20190703210821.27550-34-ehabkost@redhat.com>
In-Reply-To: <20190703210821.27550-1-ehabkost@redhat.com>
References: <20190703210821.27550-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Wed, 03 Jul 2019 21:09:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v5 33/43] i386: Add x-force-features option for
 testing
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

Add a new option that can be used to disable feature flag
filtering.  This will allow CPU model compatibility test cases to
work without host hardware dependencies.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20190628002844.24894-3-ehabkost@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.h | 6 ++++++
 target/i386/cpu.c | 8 ++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 0a96c78669..4727226a6a 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1417,6 +1417,12 @@ struct X86CPU {
=20
     bool check_cpuid;
     bool enforce_cpuid;
+    /*
+     * Force features to be enabled even if the host doesn't support the=
m.
+     * This is dangerous and should be done only for testing CPUID
+     * compatibility.
+     */
+    bool force_features;
     bool expose_kvm;
     bool expose_tcg;
     bool migratable;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 62043fee54..8852b57c0b 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5250,8 +5250,11 @@ static int x86_cpu_filter_features(X86CPU *cpu)
         uint32_t host_feat =3D
             x86_cpu_get_supported_feature_word(w, false);
         uint32_t requested_features =3D env->features[w];
-        env->features[w] &=3D host_feat;
-        cpu->filtered_features[w] =3D requested_features & ~env->feature=
s[w];
+        uint32_t available_features =3D requested_features & host_feat;
+        if (!cpu->force_features) {
+            env->features[w] =3D available_features;
+        }
+        cpu->filtered_features[w] =3D requested_features & ~available_fe=
atures;
         if (cpu->filtered_features[w]) {
             rv =3D 1;
         }
@@ -5980,6 +5983,7 @@ static Property x86_cpu_properties[] =3D {
=20
     DEFINE_PROP_BOOL("check", X86CPU, check_cpuid, true),
     DEFINE_PROP_BOOL("enforce", X86CPU, enforce_cpuid, false),
+    DEFINE_PROP_BOOL("x-force-features", X86CPU, force_features, false),
     DEFINE_PROP_BOOL("kvm", X86CPU, expose_kvm, true),
     DEFINE_PROP_UINT32("phys-bits", X86CPU, phys_bits, 0),
     DEFINE_PROP_BOOL("host-phys-bits", X86CPU, host_phys_bits, false),
--=20
2.18.0.rc1.1.g3f1ff2140



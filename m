Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 218ACD8C04
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Oct 2019 11:00:09 +0200 (CEST)
Received: from localhost ([::1]:39506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKfA6-0007lO-AD
	for lists+qemu-devel@lfdr.de; Wed, 16 Oct 2019 05:00:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50405)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iKf4r-0002BC-TP
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 04:54:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iKf4q-0006AB-I5
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 04:54:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60422)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1iKf4m-000697-N6; Wed, 16 Oct 2019 04:54:36 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E278730860DA;
 Wed, 16 Oct 2019 08:54:35 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C83325D9CD;
 Wed, 16 Oct 2019 08:54:33 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v6 7/9] target/arm/kvm: scratch vcpu: Preserve input
 kvm_vcpu_init features
Date: Wed, 16 Oct 2019 10:54:06 +0200
Message-Id: <20191016085408.24360-8-drjones@redhat.com>
In-Reply-To: <20191016085408.24360-1-drjones@redhat.com>
References: <20191016085408.24360-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Wed, 16 Oct 2019 08:54:35 +0000 (UTC)
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, armbru@redhat.com,
 eric.auger@redhat.com, imammedo@redhat.com, alex.bennee@linaro.org,
 Dave.Martin@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

kvm_arm_create_scratch_host_vcpu() takes a struct kvm_vcpu_init
parameter. Rather than just using it as an output parameter to
pass back the preferred target, use it also as an input parameter,
allowing a caller to pass a selected target if they wish and to
also pass cpu features. If the caller doesn't want to select a
target they can pass -1 for the target which indicates they want
to use the preferred target and have it passed back like before.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 target/arm/kvm.c   | 20 +++++++++++++++-----
 target/arm/kvm32.c |  6 +++++-
 target/arm/kvm64.c |  6 +++++-
 3 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index f07332bbda30..5b82cefef608 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -66,7 +66,7 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *c=
pus_to_try,
                                       int *fdarray,
                                       struct kvm_vcpu_init *init)
 {
-    int ret, kvmfd =3D -1, vmfd =3D -1, cpufd =3D -1;
+    int ret =3D 0, kvmfd =3D -1, vmfd =3D -1, cpufd =3D -1;
=20
     kvmfd =3D qemu_open("/dev/kvm", O_RDWR);
     if (kvmfd < 0) {
@@ -86,7 +86,14 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *=
cpus_to_try,
         goto finish;
     }
=20
-    ret =3D ioctl(vmfd, KVM_ARM_PREFERRED_TARGET, init);
+    if (init->target =3D=3D -1) {
+        struct kvm_vcpu_init preferred;
+
+        ret =3D ioctl(vmfd, KVM_ARM_PREFERRED_TARGET, &preferred);
+        if (!ret) {
+            init->target =3D preferred.target;
+        }
+    }
     if (ret >=3D 0) {
         ret =3D ioctl(cpufd, KVM_ARM_VCPU_INIT, init);
         if (ret < 0) {
@@ -98,10 +105,12 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t=
 *cpus_to_try,
          * creating one kind of guest CPU which is its preferred
          * CPU type.
          */
+        struct kvm_vcpu_init try;
+
         while (*cpus_to_try !=3D QEMU_KVM_ARM_TARGET_NONE) {
-            init->target =3D *cpus_to_try++;
-            memset(init->features, 0, sizeof(init->features));
-            ret =3D ioctl(cpufd, KVM_ARM_VCPU_INIT, init);
+            try.target =3D *cpus_to_try++;
+            memcpy(try.features, init->features, sizeof(init->features))=
;
+            ret =3D ioctl(cpufd, KVM_ARM_VCPU_INIT, &try);
             if (ret >=3D 0) {
                 break;
             }
@@ -109,6 +118,7 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t =
*cpus_to_try,
         if (ret < 0) {
             goto err;
         }
+        init->target =3D try.target;
     } else {
         /* Treat a NULL cpus_to_try argument the same as an empty
          * list, which means we will fail the call since this must
diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index 2451a2d4bbef..32bf8d6757c4 100644
--- a/target/arm/kvm32.c
+++ b/target/arm/kvm32.c
@@ -53,7 +53,11 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures =
*ahcf)
         QEMU_KVM_ARM_TARGET_CORTEX_A15,
         QEMU_KVM_ARM_TARGET_NONE
     };
-    struct kvm_vcpu_init init;
+    /*
+     * target =3D -1 informs kvm_arm_create_scratch_host_vcpu()
+     * to use the preferred target
+     */
+    struct kvm_vcpu_init init =3D { .target =3D -1, };
=20
     if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) =
{
         return false;
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 850da1b5e6aa..c7ecefbed720 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -502,7 +502,11 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeature=
s *ahcf)
         KVM_ARM_TARGET_CORTEX_A57,
         QEMU_KVM_ARM_TARGET_NONE
     };
-    struct kvm_vcpu_init init;
+    /*
+     * target =3D -1 informs kvm_arm_create_scratch_host_vcpu()
+     * to use the preferred target
+     */
+    struct kvm_vcpu_init init =3D { .target =3D -1, };
=20
     if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) =
{
         return false;
--=20
2.21.0



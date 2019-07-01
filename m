Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 105924ED5E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 18:47:42 +0200 (CEST)
Received: from localhost ([::1]:36792 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heMhO-0002wW-UD
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 12:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44619)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <drjones@redhat.com>) id 1heMVP-0001j1-Su
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 12:35:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1heMVN-0001fB-F8
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 12:35:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36640)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1heMVF-0000ux-Js; Fri, 21 Jun 2019 12:35:05 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9579B3002E1D;
 Fri, 21 Jun 2019 16:34:56 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 615211001DE1;
 Fri, 21 Jun 2019 16:34:50 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri, 21 Jun 2019 18:34:14 +0200
Message-Id: <20190621163422.6127-7-drjones@redhat.com>
In-Reply-To: <20190621163422.6127-1-drjones@redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 21 Jun 2019 16:34:56 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 06/14] target/arm: Allow SVE to be disabled
 via a CPU property
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

Since 97a28b0eeac14 ("target/arm: Allow VFP and Neon to be disabled via
a CPU property") we can disable the 'max' cpu model's VFP and neon
features, but there's no way to disable SVE. Add the 'sve=3Don|off'
property to give it that flexibility. We also rename
cpu_max_get/set_sve_vq to cpu_max_get/set_sve_max_vq in order for them
to follow the typical *_get/set_<property-name> pattern.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/cpu.c         | 10 +++++-
 target/arm/cpu64.c       | 72 ++++++++++++++++++++++++++++++++++------
 target/arm/helper.c      |  8 +++--
 target/arm/monitor.c     |  2 +-
 tests/arm-cpu-features.c |  1 +
 5 files changed, 78 insertions(+), 15 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 858f668d226e..f08e178fc84b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -198,7 +198,7 @@ static void arm_cpu_reset(CPUState *s)
         env->cp15.cpacr_el1 =3D deposit64(env->cp15.cpacr_el1, 16, 2, 3)=
;
         env->cp15.cptr_el[3] |=3D CPTR_EZ;
         /* with maximum vector length */
-        env->vfp.zcr_el[1] =3D cpu->sve_max_vq - 1;
+        env->vfp.zcr_el[1] =3D cpu->sve_max_vq ? cpu->sve_max_vq - 1 : 0=
;
         env->vfp.zcr_el[2] =3D env->vfp.zcr_el[1];
         env->vfp.zcr_el[3] =3D env->vfp.zcr_el[1];
         /*
@@ -1129,6 +1129,14 @@ static void arm_cpu_realizefn(DeviceState *dev, Er=
ror **errp)
         cpu->isar.mvfr0 =3D u;
     }
=20
+    if (!cpu->sve_max_vq) {
+        uint64_t t;
+
+        t =3D cpu->isar.id_aa64pfr0;
+        t =3D FIELD_DP64(t, ID_AA64PFR0, SVE, 0);
+        cpu->isar.id_aa64pfr0 =3D t;
+    }
+
     if (arm_feature(env, ARM_FEATURE_M) && !cpu->has_dsp) {
         uint32_t u;
=20
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 946994838d8a..02ada65f240c 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -257,27 +257,75 @@ static void aarch64_a72_initfn(Object *obj)
     define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
 }
=20
-static void cpu_max_get_sve_vq(Object *obj, Visitor *v, const char *name=
,
-                               void *opaque, Error **errp)
+static void cpu_max_get_sve_max_vq(Object *obj, Visitor *v, const char *=
name,
+                                   void *opaque, Error **errp)
 {
     ARMCPU *cpu =3D ARM_CPU(obj);
     visit_type_uint32(v, name, &cpu->sve_max_vq, errp);
 }
=20
-static void cpu_max_set_sve_vq(Object *obj, Visitor *v, const char *name=
,
-                               void *opaque, Error **errp)
+static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *=
name,
+                                   void *opaque, Error **errp)
 {
     ARMCPU *cpu =3D ARM_CPU(obj);
     Error *err =3D NULL;
+    uint32_t value;
=20
-    visit_type_uint32(v, name, &cpu->sve_max_vq, &err);
+    visit_type_uint32(v, name, &value, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
=20
-    if (!err && (cpu->sve_max_vq =3D=3D 0 || cpu->sve_max_vq > ARM_MAX_V=
Q)) {
-        error_setg(&err, "unsupported SVE vector length");
-        error_append_hint(&err, "Valid sve-max-vq in range [1-%d]\n",
+    if (!cpu->sve_max_vq) {
+        error_setg(errp, "cannot set sve-max-vq");
+        error_append_hint(errp, "SVE has been disabled with sve=3Doff\n"=
);
+        return;
+    }
+
+    cpu->sve_max_vq =3D value;
+
+    if (cpu->sve_max_vq =3D=3D 0 || cpu->sve_max_vq > ARM_MAX_VQ) {
+        error_setg(errp, "unsupported SVE vector length");
+        error_append_hint(errp, "Valid sve-max-vq in range [1-%d]\n",
                           ARM_MAX_VQ);
     }
-    error_propagate(errp, err);
+}
+
+static void cpu_arm_get_sve(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+    bool value =3D !!cpu->sve_max_vq;
+
+    visit_type_bool(v, name, &value, errp);
+}
+
+static void cpu_arm_set_sve(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+    Error *err =3D NULL;
+    bool value;
+
+    visit_type_bool(v, name, &value, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    if (value) {
+        /*
+         * We handle the -cpu <cpu>,sve=3Doff,sve=3Don case by reinitial=
izing,
+         * but otherwise we don't do anything as an sve=3Don could come =
after
+         * a sve-max-vq setting.
+         */
+        if (!cpu->sve_max_vq) {
+            cpu->sve_max_vq =3D ARM_MAX_VQ;
+        }
+    } else {
+        cpu->sve_max_vq =3D 0;
+    }
 }
=20
 /* -cpu max: if KVM is enabled, like -cpu host (best possible with this =
host);
@@ -373,8 +421,10 @@ static void aarch64_max_initfn(Object *obj)
 #endif
=20
         cpu->sve_max_vq =3D ARM_MAX_VQ;
-        object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve=
_vq,
-                            cpu_max_set_sve_vq, NULL, NULL, &error_fatal=
);
+        object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve=
_max_vq,
+                            cpu_max_set_sve_max_vq, NULL, NULL, &error_f=
atal);
+        object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
+                            cpu_arm_set_sve, NULL, NULL, &error_fatal);
     }
 }
=20
diff --git a/target/arm/helper.c b/target/arm/helper.c
index edba94004e0b..f500ccb6d31b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5314,9 +5314,13 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int =
el)
 static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                       uint64_t value)
 {
+    ARMCPU *cpu =3D env_archcpu(env);
     int cur_el =3D arm_current_el(env);
-    int old_len =3D sve_zcr_len_for_el(env, cur_el);
-    int new_len;
+    int old_len, new_len;
+
+    assert(cpu->sve_max_vq);
+
+    old_len =3D sve_zcr_len_for_el(env, cur_el);
=20
     /* Bits other than [3:0] are RAZ/WI.  */
     QEMU_BUILD_BUG_ON(ARM_MAX_VQ > 16);
diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index 19e3120eef95..157c487a1551 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -90,7 +90,7 @@ GICCapabilityList *qmp_query_gic_capabilities(Error **e=
rrp)
 }
=20
 static const char *cpu_model_advertised_features[] =3D {
-    "aarch64", "pmu",
+    "aarch64", "pmu", "sve",
     NULL
 };
=20
diff --git a/tests/arm-cpu-features.c b/tests/arm-cpu-features.c
index 31b1c15bb979..509e458e9c2f 100644
--- a/tests/arm-cpu-features.c
+++ b/tests/arm-cpu-features.c
@@ -158,6 +158,7 @@ static void test_query_cpu_model_expansion(const void=
 *data)
=20
     if (g_str_equal(qtest_get_arch(), "aarch64")) {
         assert_has_feature(qts, "max", "aarch64");
+        assert_has_feature(qts, "max", "sve");
         assert_has_feature(qts, "cortex-a57", "pmu");
         assert_has_feature(qts, "cortex-a57", "aarch64");
=20
--=20
2.20.1



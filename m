Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 522657F6D3
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Aug 2019 14:28:36 +0200 (CEST)
Received: from localhost ([::1]:34400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htWfi-0001oX-Rv
	for lists+qemu-devel@lfdr.de; Fri, 02 Aug 2019 08:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37615)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <drjones@redhat.com>) id 1htWdK-0004lJ-NL
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 08:26:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1htWdI-0001kf-Ko
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 08:26:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:64667)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1htWdD-0001ic-WA; Fri, 02 Aug 2019 08:26:00 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3E015307D88C;
 Fri,  2 Aug 2019 12:25:59 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4D1C5C205;
 Fri,  2 Aug 2019 12:25:55 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri,  2 Aug 2019 14:25:28 +0200
Message-Id: <20190802122540.26385-4-drjones@redhat.com>
In-Reply-To: <20190802122540.26385-1-drjones@redhat.com>
References: <20190802122540.26385-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Fri, 02 Aug 2019 12:25:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 03/15] target/arm/monitor: Introduce
 qmp_query_cpu_model_expansion
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

Add support for the query-cpu-model-expansion QMP command to Arm. We
do this selectively, only exposing CPU properties which represent
optional CPU features which the user may want to enable/disable.
Additionally we restrict the list of queryable cpu models to 'max',
'host', or the current type when KVM is in use. And, finally, we only
implement expansion type 'full', as Arm does not yet have a "base"
CPU type. More details and example queries are described in a new
document (docs/arm-cpu-features.rst).

Note, certainly more features may be added to the list of
advertised features, e.g. 'vfp' and 'neon'. The only requirement
is that their property set accessors fail when invalid
configurations are detected. For vfp we would need something like

 set_vfp()
 {
   if (arm_feature(env, ARM_FEATURE_AARCH64) &&
       cpu->has_vfp !=3D cpu->has_neon)
       error("AArch64 CPUs must have both VFP and Neon or neither")

in its set accessor, and the same for neon, rather than doing that
check at realize time, which isn't executed at qmp query time.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 docs/arm-cpu-features.rst | 137 +++++++++++++++++++++++++++++++++++++
 qapi/machine-target.json  |   6 +-
 target/arm/monitor.c      | 138 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 278 insertions(+), 3 deletions(-)
 create mode 100644 docs/arm-cpu-features.rst

diff --git a/docs/arm-cpu-features.rst b/docs/arm-cpu-features.rst
new file mode 100644
index 000000000000..c79dcffb5556
--- /dev/null
+++ b/docs/arm-cpu-features.rst
@@ -0,0 +1,137 @@
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+ARM CPU Features
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Examples of probing and using ARM CPU features
+
+Introduction
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+CPU features are optional features that a CPU of supporting type may
+choose to implement or not.  In QEMU, optional CPU features have
+corresponding boolean CPU proprieties that, when enabled, indicate
+that the feature is implemented, and, conversely, when disabled,
+indicate that it is not implemented. An example of an ARM CPU feature
+is the Performance Monitoring Unit (PMU).  CPU types such as the
+Cortex-A15 and the Cortex-A57, which respectively implement ARM
+architecture reference manuals ARMv7-A and ARMv8-A, may both optionally
+implement PMUs.  For example, if a user wants to use a Cortex-A15 withou=
t
+a PMU, then the `-cpu` parameter should contain `pmu=3Doff` on the QEMU
+command line, i.e. `-cpu cortex-a15,pmu=3Doff`.
+
+As not all CPU types support all optional CPU features, then whether or
+not a CPU property exists depends on the CPU type.  For example, CPUs
+that implement the ARMv8-A architecture reference manual may optionally
+support the AArch32 CPU feature, which may be enabled by disabling the
+`aarch64` CPU property.  A CPU type such as the Cortex-A15, which does
+not implement ARMv8-A, will not have the `aarch64` CPU property.
+
+QEMU's support may be limited for some CPU features, only partially
+supporting the feature or only supporting the feature under certain
+configurations.  For example, the `aarch64` CPU feature, which, when
+disabled, enables the optional AArch32 CPU feature, is only supported
+when using the KVM accelerator and when running on a host CPU type that
+supports the feature.
+
+CPU Feature Probing
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Determining which CPU features are available and functional for a given
+CPU type is possible with the `query-cpu-model-expansion` QMP command.
+Below are some examples where `scripts/qmp/qmp-shell` (see the top comme=
nt
+block in the script for usage) is used to issue the QMP commands.
+
+(1) Determine which CPU features are available for the `max` CPU type
+    (Note, we started QEMU with qemu-system-aarch64, so `max` is
+     implementing the ARMv8-A reference manual in this case)::
+
+      (QEMU) query-cpu-model-expansion type=3Dfull model=3D{"name":"max"=
}
+      { "return": {
+        "model": { "name": "max", "props": {
+        "pmu": true, "aarch64": true
+      }}}}
+
+We see that the `max` CPU type has the `pmu` and `aarch64` CPU features.
+We also see that the CPU features are enabled, as they are all `true`.
+
+(2) Let's try to disable the PMU::
+
+      (QEMU) query-cpu-model-expansion type=3Dfull model=3D{"name":"max"=
,"props":{"pmu":false}}
+      { "return": {
+        "model": { "name": "max", "props": {
+        "pmu": false, "aarch64": true
+      }}}}
+
+We see it worked, as `pmu` is now `false`.
+
+(3) Let's try to disable `aarch64`, which enables the AArch32 CPU featur=
e::
+
+      (QEMU) query-cpu-model-expansion type=3Dfull model=3D{"name":"max"=
,"props":{"aarch64":false}}
+      {"error": {
+       "class": "GenericError", "desc":
+       "'aarch64' feature cannot be disabled unless KVM is enabled and 3=
2-bit EL1 is supported"
+      }}
+
+It looks like this feature is limited to a configuration we do not
+currently have.
+
+(4) Let's try probing CPU features for the Cortex-A15 CPU type::
+
+      (QEMU) query-cpu-model-expansion type=3Dfull model=3D{"name":"cort=
ex-a15"}
+      {"return": {"model": {"name": "cortex-a15", "props": {"pmu": true}=
}}}
+
+Only the `pmu` CPU feature is available.
+
+A note about CPU feature dependencies
+-------------------------------------
+
+It's possible for features to have dependencies on other features. I.e.
+it may be possible to change one feature at a time without error, but
+when attempting to change all features at once an error could occur
+depending on the order they are processed.  It's also possible changing
+all at once doesn't generate an error, because a feature's dependencies
+are satisfied with other features, but the same feature cannot be change=
d
+independently without error.  For these reasons callers should always
+attempt to make their desired changes all at once in order to ensure the
+collection is valid.
+
+A note about CPU models and KVM
+-------------------------------
+
+Named CPU models generally do not work with KVM.  There are a few cases
+that do work, e.g. using the named CPU model `cortex-a57` with KVM on a
+seattle host, but mostly if KVM is enabled the `host` CPU type must be
+used.  This means the guest is provided all the same CPU features as the
+host CPU type has.  And, for this reason, the `host` CPU type should
+enable all CPU features that the host has by default.  Indeed it's even
+a bit strange to allow disabling CPU features that the host has when usi=
ng
+the `host` CPU type, but in the absence of CPU models it's the best we c=
an
+do if we want to launch guests without all the host's CPU features enabl=
ed.
+
+Enabling KVM also affects the `query-cpu-model-expansion` QMP command.  =
The
+affect is not only limited to specific features, as pointed out in examp=
le
+(3) of "CPU Feature Probing", but also to which CPU types may be expande=
d.
+When KVM is enabled, only the `max`, `host`, and current CPU type may be
+expanded.  This restriction is necessary as it's not possible to know al=
l
+CPU types that may work with KVM, but it does impose a small risk of use=
rs
+experiencing unexpected errors.  For example on a seattle, as mentioned
+above, the `cortex-a57` CPU type is also valid when KVM is enabled.
+Therefore a user could use the `host` CPU type for the current type, but
+then attempt to query `cortex-a57`, however that query will fail with ou=
r
+restrictions.  This shouldn't be an issue though as management layers an=
d
+users have been preferring the `host` CPU type for use with KVM for quit=
e
+some time.  Additionally, if the KVM-enabled QEMU instance running on a
+seattle host is using the `cortex-a57` CPU type, then querying `cortex-a=
57`
+will work.
+
+Using CPU Features
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+After determining which CPU features are available and supported for a
+given CPU type, then they may be selectively enabled or disabled on the
+QEMU command line with that CPU type::
+
+  $ qemu-system-aarch64 -M virt -cpu max,pmu=3Doff
+
+The example above disables the PMU for the `max` CPU type.
+
diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index 55310a6aa226..04623224720d 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -212,7 +212,7 @@
 ##
 { 'struct': 'CpuModelExpansionInfo',
   'data': { 'model': 'CpuModelInfo' },
-  'if': 'defined(TARGET_S390X) || defined(TARGET_I386)' }
+  'if': 'defined(TARGET_S390X) || defined(TARGET_I386) || defined(TARGET=
_ARM)' }
=20
 ##
 # @query-cpu-model-expansion:
@@ -237,7 +237,7 @@
 #   query-cpu-model-expansion while using these is not advised.
 #
 # Some architectures may not support all expansion types. s390x supports
-# "full" and "static".
+# "full" and "static". Arm only supports "full".
 #
 # Returns: a CpuModelExpansionInfo. Returns an error if expanding CPU mo=
dels is
 #          not supported, if the model cannot be expanded, if the model =
contains
@@ -251,7 +251,7 @@
   'data': { 'type': 'CpuModelExpansionType',
             'model': 'CpuModelInfo' },
   'returns': 'CpuModelExpansionInfo',
-  'if': 'defined(TARGET_S390X) || defined(TARGET_I386)' }
+  'if': 'defined(TARGET_S390X) || defined(TARGET_I386) || defined(TARGET=
_ARM)' }
=20
 ##
 # @CpuDefinitionInfo:
diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index 6ec6dd04ac2e..96ada22d9cc7 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -23,7 +23,14 @@
 #include "qemu/osdep.h"
 #include "hw/boards.h"
 #include "kvm_arm.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "qapi/qobject-input-visitor.h"
+#include "qapi/qapi-commands-machine-target.h"
 #include "qapi/qapi-commands-misc-target.h"
+#include "qapi/qmp/qerror.h"
+#include "qapi/qmp/qdict.h"
+#include "qom/qom-qobject.h"
=20
 static GICCapability *gic_cap_new(int version)
 {
@@ -82,3 +89,134 @@ GICCapabilityList *qmp_query_gic_capabilities(Error *=
*errp)
=20
     return head;
 }
+
+static const char *cpu_model_advertised_features[] =3D {
+    "aarch64", "pmu",
+    NULL
+};
+
+CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionTy=
pe type,
+                                                     CpuModelInfo *model=
,
+                                                     Error **errp)
+{
+    CpuModelExpansionInfo *expansion_info;
+    const QDict *qdict_in =3D NULL;
+    QDict *qdict_out;
+    ObjectClass *oc;
+    Object *obj;
+    const char *name;
+    int i;
+
+    if (type !=3D CPU_MODEL_EXPANSION_TYPE_FULL) {
+        error_setg(errp, "The requested expansion type is not supported"=
);
+        return NULL;
+    }
+
+    if (!kvm_enabled() && !strcmp(model->name, "host")) {
+        error_setg(errp, "The CPU type '%s' requires KVM", model->name);
+        return NULL;
+    }
+
+    oc =3D cpu_class_by_name(TYPE_ARM_CPU, model->name);
+    if (!oc) {
+        error_setg(errp, "The CPU type '%s' is not a recognized ARM CPU =
type",
+                   model->name);
+        return NULL;
+    }
+
+    if (kvm_enabled()) {
+        const char *cpu_type =3D current_machine->cpu_type;
+        int len =3D strlen(cpu_type) - strlen(ARM_CPU_TYPE_SUFFIX);
+        bool supported =3D false;
+
+        if (!strcmp(model->name, "host") || !strcmp(model->name, "max"))=
 {
+            /* These are kvmarm's recommended cpu types */
+            supported =3D true;
+        } else if (strlen(model->name) =3D=3D len &&
+                   !strncmp(model->name, cpu_type, len)) {
+            /* KVM is enabled and we're using this type, so it works. */
+            supported =3D true;
+        }
+        if (!supported) {
+            error_setg(errp, "We cannot guarantee the CPU type '%s' work=
s "
+                             "with KVM on this host", model->name);
+            return NULL;
+        }
+    }
+
+    if (model->props) {
+        qdict_in =3D qobject_to(QDict, model->props);
+        if (!qdict_in) {
+            error_setg(errp, QERR_INVALID_PARAMETER_TYPE, "props", "dict=
");
+            return NULL;
+        }
+    }
+
+    obj =3D object_new(object_class_get_name(oc));
+
+    if (qdict_in) {
+        Visitor *visitor;
+        Error *err =3D NULL;
+
+        visitor =3D qobject_input_visitor_new(model->props);
+        visit_start_struct(visitor, NULL, NULL, 0, &err);
+        if (err) {
+            object_unref(obj);
+            error_propagate(errp, err);
+            return NULL;
+        }
+
+        i =3D 0;
+        while ((name =3D cpu_model_advertised_features[i++]) !=3D NULL) =
{
+            if (qdict_get(qdict_in, name)) {
+                object_property_set(obj, visitor, name, &err);
+                if (err) {
+                    break;
+                }
+            }
+        }
+
+        if (!err) {
+            visit_check_struct(visitor, &err);
+        }
+        visit_end_struct(visitor, NULL);
+        visit_free(visitor);
+        if (err) {
+            object_unref(obj);
+            error_propagate(errp, err);
+            return NULL;
+        }
+    }
+
+    expansion_info =3D g_new0(CpuModelExpansionInfo, 1);
+    expansion_info->model =3D g_malloc0(sizeof(*expansion_info->model));
+    expansion_info->model->name =3D g_strdup(model->name);
+
+    qdict_out =3D qdict_new();
+
+    i =3D 0;
+    while ((name =3D cpu_model_advertised_features[i++]) !=3D NULL) {
+        ObjectProperty *prop =3D object_property_find(obj, name, NULL);
+        if (prop) {
+            Error *err =3D NULL;
+            QObject *value;
+
+            assert(prop->get);
+            value =3D object_property_get_qobject(obj, name, &err);
+            assert(!err);
+
+            qdict_put_obj(qdict_out, name, value);
+        }
+    }
+
+    if (!qdict_size(qdict_out)) {
+        qobject_unref(qdict_out);
+    } else {
+        expansion_info->model->props =3D QOBJECT(qdict_out);
+        expansion_info->model->has_props =3D true;
+    }
+
+    object_unref(obj);
+
+    return expansion_info;
+}
--=20
2.20.1



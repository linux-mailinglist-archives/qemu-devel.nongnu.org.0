Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAB1EB333
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Oct 2019 15:52:17 +0100 (CET)
Received: from localhost ([::1]:51058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iQBo7-0004a9-Ge
	for lists+qemu-devel@lfdr.de; Thu, 31 Oct 2019 10:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47797)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iQBTF-0005BG-1D
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 10:30:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iQBTB-0006Ch-IX
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 10:30:39 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28567
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1iQBTB-00066q-7D
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 10:30:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572532236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z248OZv5KZCL4EVjTI1nAfl+Dub+mZ4WY07Uj+ovBXE=;
 b=LR93twNtDYZ+kUVCOX481u5QRQVS/nS87DzsJJmDKM/r4B61p/oubpuss+J3fsw9mi7Eq6
 PWHv6hAg5Wd5KH5CL2yB5pGrzUw7zv2SfgmHXq0uAmr1sn3pfF7BhLO6J0h5h68FBhciJg
 eCM2S9XMX0LdNLGyKrtEF2duBSNZtUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-KGESRZzfMs-05R7Yg3jeRg-1; Thu, 31 Oct 2019 10:30:34 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02A43800C80;
 Thu, 31 Oct 2019 14:30:33 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-117-53.ams2.redhat.com
 [10.36.117.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D580760852;
 Thu, 31 Oct 2019 14:28:59 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v8 1/9] target/arm/monitor: Introduce
 qmp_query_cpu_model_expansion
Date: Thu, 31 Oct 2019 15:27:26 +0100
Message-Id: <20191031142734.8590-2-drjones@redhat.com>
In-Reply-To: <20191031142734.8590-1-drjones@redhat.com>
References: <20191031142734.8590-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: KGESRZzfMs-05R7Yg3jeRg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: m.mizuma@jp.fujitsu.com, beata.michalska@linaro.org,
 richard.henderson@linaro.org, armbru@redhat.com, eric.auger@redhat.com,
 imammedo@redhat.com, alex.bennee@linaro.org, Dave.Martin@arm.com
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

Note, certainly more features may be added to the list of advertised
features, e.g. 'vfp' and 'neon'. The only requirement is that we can
detect invalid configurations and emit failures at QMP query time.
For 'vfp' and 'neon' this will require some refactoring to share a
validation function between the QMP query and the CPU realize
functions.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Beata Michalska <beata.michalska@linaro.org>
---
 docs/arm-cpu-features.rst | 137 +++++++++++++++++++++++++++++++++++
 qapi/machine-target.json  |   6 +-
 target/arm/monitor.c      | 146 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 286 insertions(+), 3 deletions(-)
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
+implement PMUs.  For example, if a user wants to use a Cortex-A15 without
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
+Below are some examples where `scripts/qmp/qmp-shell` (see the top comment
+block in the script for usage) is used to issue the QMP commands.
+
+(1) Determine which CPU features are available for the `max` CPU type
+    (Note, we started QEMU with qemu-system-aarch64, so `max` is
+     implementing the ARMv8-A reference manual in this case)::
+
+      (QEMU) query-cpu-model-expansion type=3Dfull model=3D{"name":"max"}
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
+      (QEMU) query-cpu-model-expansion type=3Dfull model=3D{"name":"max","=
props":{"pmu":false}}
+      { "return": {
+        "model": { "name": "max", "props": {
+        "pmu": false, "aarch64": true
+      }}}}
+
+We see it worked, as `pmu` is now `false`.
+
+(3) Let's try to disable `aarch64`, which enables the AArch32 CPU feature:=
:
+
+      (QEMU) query-cpu-model-expansion type=3Dfull model=3D{"name":"max","=
props":{"aarch64":false}}
+      {"error": {
+       "class": "GenericError", "desc":
+       "'aarch64' feature cannot be disabled unless KVM is enabled and 32-=
bit EL1 is supported"
+      }}
+
+It looks like this feature is limited to a configuration we do not
+currently have.
+
+(4) Let's try probing CPU features for the Cortex-A15 CPU type::
+
+      (QEMU) query-cpu-model-expansion type=3Dfull model=3D{"name":"cortex=
-a15"}
+      {"return": {"model": {"name": "cortex-a15", "props": {"pmu": true}}}=
}
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
+are satisfied with other features, but the same feature cannot be changed
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
+a bit strange to allow disabling CPU features that the host has when using
+the `host` CPU type, but in the absence of CPU models it's the best we can
+do if we want to launch guests without all the host's CPU features enabled=
.
+
+Enabling KVM also affects the `query-cpu-model-expansion` QMP command.  Th=
e
+affect is not only limited to specific features, as pointed out in example
+(3) of "CPU Feature Probing", but also to which CPU types may be expanded.
+When KVM is enabled, only the `max`, `host`, and current CPU type may be
+expanded.  This restriction is necessary as it's not possible to know all
+CPU types that may work with KVM, but it does impose a small risk of users
+experiencing unexpected errors.  For example on a seattle, as mentioned
+above, the `cortex-a57` CPU type is also valid when KVM is enabled.
+Therefore a user could use the `host` CPU type for the current type, but
+then attempt to query `cortex-a57`, however that query will fail with our
+restrictions.  This shouldn't be an issue though as management layers and
+users have been preferring the `host` CPU type for use with KVM for quite
+some time.  Additionally, if the KVM-enabled QEMU instance running on a
+seattle host is using the `cortex-a57` CPU type, then querying `cortex-a57=
`
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
+  'if': 'defined(TARGET_S390X) || defined(TARGET_I386) || defined(TARGET_A=
RM)' }
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
 # Returns: a CpuModelExpansionInfo. Returns an error if expanding CPU mode=
ls is
 #          not supported, if the model cannot be expanded, if the model co=
ntains
@@ -251,7 +251,7 @@
   'data': { 'type': 'CpuModelExpansionType',
             'model': 'CpuModelInfo' },
   'returns': 'CpuModelExpansionInfo',
-  'if': 'defined(TARGET_S390X) || defined(TARGET_I386)' }
+  'if': 'defined(TARGET_S390X) || defined(TARGET_I386) || defined(TARGET_A=
RM)' }
=20
 ##
 # @CpuDefinitionInfo:
diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index 6457c3c87f7c..560970de7f5c 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -21,8 +21,16 @@
  */
=20
 #include "qemu/osdep.h"
+#include "hw/boards.h"
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
@@ -81,3 +89,141 @@ GICCapabilityList *qmp_query_gic_capabilities(Error **e=
rrp)
=20
     return head;
 }
+
+/*
+ * These are cpu model features we want to advertise. The order here
+ * matters as this is the order in which qmp_query_cpu_model_expansion
+ * will attempt to set them. If there are dependencies between features,
+ * then the order that considers those dependencies must be used.
+ */
+static const char *cpu_model_advertised_features[] =3D {
+    "aarch64", "pmu",
+    NULL
+};
+
+CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType=
 type,
+                                                     CpuModelInfo *model,
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
+        error_setg(errp, "The requested expansion type is not supported");
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
+        error_setg(errp, "The CPU type '%s' is not a recognized ARM CPU ty=
pe",
+                   model->name);
+        return NULL;
+    }
+
+    if (kvm_enabled()) {
+        const char *cpu_type =3D current_machine->cpu_type;
+        int len =3D strlen(cpu_type) - strlen(ARM_CPU_TYPE_SUFFIX);
+        bool supported =3D false;
+
+        if (!strcmp(model->name, "host") || !strcmp(model->name, "max")) {
+            /* These are kvmarm's recommended cpu types */
+            supported =3D true;
+        } else if (strlen(model->name) =3D=3D len &&
+                   !strncmp(model->name, cpu_type, len)) {
+            /* KVM is enabled and we're using this type, so it works. */
+            supported =3D true;
+        }
+        if (!supported) {
+            error_setg(errp, "We cannot guarantee the CPU type '%s' works =
"
+                             "with KVM on this host", model->name);
+            return NULL;
+        }
+    }
+
+    if (model->props) {
+        qdict_in =3D qobject_to(QDict, model->props);
+        if (!qdict_in) {
+            error_setg(errp, QERR_INVALID_PARAMETER_TYPE, "props", "dict")=
;
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
+            visit_free(visitor);
+            object_unref(obj);
+            error_propagate(errp, err);
+            return NULL;
+        }
+
+        i =3D 0;
+        while ((name =3D cpu_model_advertised_features[i++]) !=3D NULL) {
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
2.21.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 248F36B6BAC
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 22:08:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbSuA-0000WC-0U; Sun, 12 Mar 2023 17:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pbSu7-0000Vd-RF; Sun, 12 Mar 2023 17:06:55 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pbSu5-0006kz-AN; Sun, 12 Mar 2023 17:06:55 -0400
Received: by mail-qt1-x834.google.com with SMTP id r16so11370697qtx.9;
 Sun, 12 Mar 2023 14:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678655211;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kRmbM9npo3sh3L3bARAvEs6tLmNBnK0JuHhyiaI3nn0=;
 b=M8z5ny3X7H5BnuqUv9Ndz3mnZK7aNAK3hBN4WrRP7lopMl3fbxN1UB1rj6Q2JdIhWg
 GkDXayn0ysss2LQq5+O5CdQ1payedOEsXxCLANijOtIqywm6PLcCi3bnq/fmdGu2uLRr
 kur9rhBlxG/Bwb5/Rz/73NvO1TX/4qQ10ENXmlPtFeM2ZBx/3zJgvV7qoTx961Qd7AhR
 GAWEeFvY0IncEe+/cwWJ0+aumIqJcsjMX9nB6GFcaTdhCAW8GC9INtFYnUTXO73W+s31
 BdJRu+1WLVWKetEk026+oVZM8QbG+lCZ0uZJEHWnLARkmOCmlSEgtk/rklvZWVAoLodN
 eR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678655211;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kRmbM9npo3sh3L3bARAvEs6tLmNBnK0JuHhyiaI3nn0=;
 b=t0Lgi1fUD1Yjr/rqP02X9Z2NKjMhqCi59zbmj6Pwg7oGC8l7xKea/LONS0kpov/NSL
 4IvEvmqvM3eFAf7RJQlAVOqihMPR0lYKDdDs8IxMgYcp5t20BFM+rBdhthJ32bWvSKau
 xJERjIsXDVFu5fHMLIAyELHLh4eG+GQbb4HYZGzpgWY76Eac2zRC2ixuspZ4DyHOyUQ7
 MN+9MPxGPY21aMiYifMpykGHL72SWfH/2n2+I+N3Wj8NY54Bz0LEpp7xsIJu+gYNWWZd
 ygY14dEvPQOSETnwxH4u45922cGgNSSYlNT+E+/C5Y9RAPxWwybw2l+NxPkyZ3PBVwn8
 IdSQ==
X-Gm-Message-State: AO0yUKU7Q46wQDdZ9cA8K7I9cq47f4/hlRN5vjKoLFO7dNSfLFPGCws2
 bzUs1HLqCA2JwRbIOaYAxmkaviNQEOqvkw==
X-Google-Smtp-Source: AK7set8avvxS1kMUBkGTS5Txp4luVSd2s2AtXLfV3ffVlC1LJN8iVJ+Dk8FOZbULkzBLdwe9+sDSnQ==
X-Received: by 2002:ac8:5888:0:b0:3c0:3d56:8c40 with SMTP id
 t8-20020ac85888000000b003c03d568c40mr34683144qta.62.1678655210958; 
 Sun, 12 Mar 2023 14:06:50 -0700 (PDT)
Received: from debian.hsd1.ma.comcast.net ([2601:182:cc00:77b0::675])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a05622a019100b003b86b088755sm4291290qtw.15.2023.03.12.14.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 14:06:50 -0700 (PDT)
From: Dinah Baum <dinahbaum123@gmail.com>
To: qemu-devel@nongnu.org
Cc: Dinah Baum <dinahbaum123@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs)
Subject: [PATCH 1/2] cpu, qapi, target/arm, i386,
 s390x: Refactor query-cpu-model-expansion
Date: Sun, 12 Mar 2023 17:06:23 -0400
Message-Id: <20230312210624.2326264-2-dinahbaum123@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230312210624.2326264-1-dinahbaum123@gmail.com>
References: <20230312210624.2326264-1-dinahbaum123@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=dinahbaum123@gmail.com; helo=mail-qt1-x834.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch enables 'query-cpu-model-expansion' on all
architectures. Only architectures that implement
the command will return results, others will return an
error message as before.

This patch lays the groundwork for parsing a
-cpu cpu,help option as specified in
https://gitlab.com/qemu-project/qemu/-/issues/1480

Signed-off-by: Dinah Baum <dinahbaum123@gmail.com>
---
 MAINTAINERS                      |   1 +
 cpu.c                            |  20 +++++
 include/exec/cpu-common.h        |   8 ++
 qapi/machine-target-common.json  | 129 +++++++++++++++++++++++++++++++
 qapi/machine-target.json         | 129 +------------------------------
 qapi/meson.build                 |   1 +
 target/arm/arm-qmp-cmds.c        |   7 +-
 target/arm/cpu.h                 |   7 +-
 target/i386/cpu-sysemu.c         |   7 +-
 target/i386/cpu.h                |   6 ++
 target/s390x/cpu.h               |   7 ++
 target/s390x/cpu_models_sysemu.c |   6 +-
 12 files changed, 189 insertions(+), 139 deletions(-)
 create mode 100644 qapi/machine-target-common.json

diff --git a/MAINTAINERS b/MAINTAINERS
index 2f2f4de7cc..d025df477e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1750,6 +1750,7 @@ F: hw/core/numa.c
 F: hw/cpu/cluster.c
 F: qapi/machine.json
 F: qapi/machine-target.json
+F: qapi/machine-target-common.json
 F: include/hw/boards.h
 F: include/hw/core/cpu.h
 F: include/hw/cpu/cluster.h
diff --git a/cpu.c b/cpu.c
index 567b23af46..c09edc4556 100644
--- a/cpu.c
+++ b/cpu.c
@@ -291,6 +291,26 @@ void list_cpus(const char *optarg)
 #endif
 }
 
+CpuModelExpansionInfo *get_cpu_model_expansion_info(CpuModelExpansionType type,
+                                                    CpuModelInfo *model,
+                                                    Error **errp)
+{
+    /* XXX: implement cpu_model_expansion for targets that still miss it */
+#if defined(cpu_model_expansion)
+    return cpu_model_expansion(type, model, errp);
+#else
+    error_setg(errp, "Could not query cpu model information");
+    return NULL;
+#endif
+}
+
+CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
+                                                     CpuModelInfo *model,
+                                                     Error **errp)
+{
+    return get_cpu_model_expansion_info(type, model, errp);
+}
+
 #if defined(CONFIG_USER_ONLY)
 void tb_invalidate_phys_addr(target_ulong addr)
 {
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 6feaa40ca7..ec6024dfde 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -7,6 +7,8 @@
 #include "exec/hwaddr.h"
 #endif
 
+#include "qapi/qapi-commands-machine-target-common.h"
+
 /**
  * vaddr:
  * Type wide enough to contain any #target_ulong virtual address.
@@ -166,5 +168,11 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
 extern int singlestep;
 
 void list_cpus(const char *optarg);
+typedef void (*cpu_model_expansion_func)(CpuModelExpansionType type,
+                                         CpuModelInfo *model,
+                                         Error **errp);
+CpuModelExpansionInfo *get_cpu_model_expansion_info(CpuModelExpansionType type,
+                                                    CpuModelInfo *model,
+                                                    Error **errp);
 
 #endif /* CPU_COMMON_H */
diff --git a/qapi/machine-target-common.json b/qapi/machine-target-common.json
new file mode 100644
index 0000000000..e0374c5366
--- /dev/null
+++ b/qapi/machine-target-common.json
@@ -0,0 +1,129 @@
+# -*- Mode: Python -*-
+# vim: filetype=python
+
+##
+# = Common data types for machine target commands
+##
+
+##
+# @CpuModelInfo:
+#
+# Virtual CPU model.
+#
+# A CPU model consists of the name of a CPU definition, to which
+# delta changes are applied (e.g. features added/removed). Most magic values
+# that an architecture might require should be hidden behind the name.
+# However, if required, architectures can expose relevant properties.
+#
+# @name: the name of the CPU definition the model is based on
+# @props: a dictionary of QOM properties to be applied
+#
+# Since: 2.8
+##
+{ 'struct': 'CpuModelInfo',
+'data': { 'name': 'str',
+          '*props': 'any' } }
+
+##
+# @CpuModelExpansionType:
+#
+# An enumeration of CPU model expansion types.
+#
+# @static: Expand to a static CPU model, a combination of a static base
+#          model name and property delta changes. As the static base model will
+#          never change, the expanded CPU model will be the same, independent of
+#          QEMU version, machine type, machine options, and accelerator options.
+#          Therefore, the resulting model can be used by tooling without having
+#          to specify a compatibility machine - e.g. when displaying the "host"
+#          model. The @static CPU models are migration-safe.
+
+# @full: Expand all properties. The produced model is not guaranteed to be
+#        migration-safe, but allows tooling to get an insight and work with
+#        model details.
+#
+# Note: When a non-migration-safe CPU model is expanded in static mode, some
+#       features enabled by the CPU model may be omitted, because they can't be
+#       implemented by a static CPU model definition (e.g. cache info passthrough and
+#       PMU passthrough in x86). If you need an accurate representation of the
+#       features enabled by a non-migration-safe CPU model, use @full. If you need a
+#       static representation that will keep ABI compatibility even when changing QEMU
+#       version or machine-type, use @static (but keep in mind that some features may
+#       be omitted).
+#
+# Since: 2.8
+##
+{ 'enum': 'CpuModelExpansionType',
+  'data': [ 'static', 'full' ] }
+
+##
+# @CpuModelCompareResult:
+#
+# An enumeration of CPU model comparison results. The result is usually
+# calculated using e.g. CPU features or CPU generations.
+#
+# @incompatible: If model A is incompatible to model B, model A is not
+#                guaranteed to run where model B runs and the other way around.
+#
+# @identical: If model A is identical to model B, model A is guaranteed to run
+#             where model B runs and the other way around.
+#
+# @superset: If model A is a superset of model B, model B is guaranteed to run
+#            where model A runs. There are no guarantees about the other way.
+#
+# @subset: If model A is a subset of model B, model A is guaranteed to run
+#          where model B runs. There are no guarantees about the other way.
+#
+# Since: 2.8
+##
+{ 'enum': 'CpuModelCompareResult',
+  'data': [ 'incompatible', 'identical', 'superset', 'subset' ] }
+
+##
+# @CpuModelExpansionInfo:
+#
+# The result of a cpu model expansion.
+#
+# @model: the expanded CpuModelInfo.
+#
+# Since: 2.8
+##
+{ 'struct': 'CpuModelExpansionInfo',
+  'data': { 'model': 'CpuModelInfo' } }
+
+##
+# @query-cpu-model-expansion:
+#
+# Expands a given CPU model (or a combination of CPU model + additional options)
+# to different granularities, allowing tooling to get an understanding what a
+# specific CPU model looks like in QEMU under a certain configuration.
+#
+# This interface can be used to query the "host" CPU model.
+#
+# The data returned by this command may be affected by:
+#
+# * QEMU version: CPU models may look different depending on the QEMU version.
+#   (Except for CPU models reported as "static" in query-cpu-definitions.)
+# * machine-type: CPU model  may look different depending on the machine-type.
+#   (Except for CPU models reported as "static" in query-cpu-definitions.)
+# * machine options (including accelerator): in some architectures, CPU models
+#   may look different depending on machine and accelerator options. (Except for
+#   CPU models reported as "static" in query-cpu-definitions.)
+# * "-cpu" arguments and global properties: arguments to the -cpu option and
+#   global properties may affect expansion of CPU models. Using
+#   query-cpu-model-expansion while using these is not advised.
+#
+# Some architectures may not support all expansion types. s390x supports
+# "full" and "static". Arm only supports "full".
+#
+# Returns: a CpuModelExpansionInfo. Returns an error if expanding CPU models is
+#          not supported, if the model cannot be expanded, if the model contains
+#          an unknown CPU definition name, unknown properties or properties
+#          with a wrong type. Also returns an error if an expansion type is
+#          not supported.
+#
+# Since: 2.8
+##
+{ 'command': 'query-cpu-model-expansion',
+  'data': { 'type': 'CpuModelExpansionType',
+  'model': 'CpuModelInfo' },
+  'returns': 'CpuModelExpansionInfo' }
diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index 2e267fa458..cfc8b0c7f8 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -4,78 +4,7 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or later.
 # See the COPYING file in the top-level directory.
 
-##
-# @CpuModelInfo:
-#
-# Virtual CPU model.
-#
-# A CPU model consists of the name of a CPU definition, to which
-# delta changes are applied (e.g. features added/removed). Most magic values
-# that an architecture might require should be hidden behind the name.
-# However, if required, architectures can expose relevant properties.
-#
-# @name: the name of the CPU definition the model is based on
-# @props: a dictionary of QOM properties to be applied
-#
-# Since: 2.8
-##
-{ 'struct': 'CpuModelInfo',
-  'data': { 'name': 'str',
-            '*props': 'any' } }
-
-##
-# @CpuModelExpansionType:
-#
-# An enumeration of CPU model expansion types.
-#
-# @static: Expand to a static CPU model, a combination of a static base
-#          model name and property delta changes. As the static base model will
-#          never change, the expanded CPU model will be the same, independent of
-#          QEMU version, machine type, machine options, and accelerator options.
-#          Therefore, the resulting model can be used by tooling without having
-#          to specify a compatibility machine - e.g. when displaying the "host"
-#          model. The @static CPU models are migration-safe.
-
-# @full: Expand all properties. The produced model is not guaranteed to be
-#        migration-safe, but allows tooling to get an insight and work with
-#        model details.
-#
-# Note: When a non-migration-safe CPU model is expanded in static mode, some
-#       features enabled by the CPU model may be omitted, because they can't be
-#       implemented by a static CPU model definition (e.g. cache info passthrough and
-#       PMU passthrough in x86). If you need an accurate representation of the
-#       features enabled by a non-migration-safe CPU model, use @full. If you need a
-#       static representation that will keep ABI compatibility even when changing QEMU
-#       version or machine-type, use @static (but keep in mind that some features may
-#       be omitted).
-#
-# Since: 2.8
-##
-{ 'enum': 'CpuModelExpansionType',
-  'data': [ 'static', 'full' ] }
-
-##
-# @CpuModelCompareResult:
-#
-# An enumeration of CPU model comparison results. The result is usually
-# calculated using e.g. CPU features or CPU generations.
-#
-# @incompatible: If model A is incompatible to model B, model A is not
-#                guaranteed to run where model B runs and the other way around.
-#
-# @identical: If model A is identical to model B, model A is guaranteed to run
-#             where model B runs and the other way around.
-#
-# @superset: If model A is a superset of model B, model B is guaranteed to run
-#            where model A runs. There are no guarantees about the other way.
-#
-# @subset: If model A is a subset of model B, model A is guaranteed to run
-#          where model B runs. There are no guarantees about the other way.
-#
-# Since: 2.8
-##
-{ 'enum': 'CpuModelCompareResult',
-  'data': [ 'incompatible', 'identical', 'superset', 'subset' ] }
+{ 'include': 'machine-target-common.json' }
 
 ##
 # @CpuModelBaselineInfo:
@@ -201,62 +130,6 @@
   'returns': 'CpuModelBaselineInfo',
   'if': 'TARGET_S390X' }
 
-##
-# @CpuModelExpansionInfo:
-#
-# The result of a cpu model expansion.
-#
-# @model: the expanded CpuModelInfo.
-#
-# Since: 2.8
-##
-{ 'struct': 'CpuModelExpansionInfo',
-  'data': { 'model': 'CpuModelInfo' },
-  'if': { 'any': [ 'TARGET_S390X',
-                   'TARGET_I386',
-                   'TARGET_ARM' ] } }
-
-##
-# @query-cpu-model-expansion:
-#
-# Expands a given CPU model (or a combination of CPU model + additional options)
-# to different granularities, allowing tooling to get an understanding what a
-# specific CPU model looks like in QEMU under a certain configuration.
-#
-# This interface can be used to query the "host" CPU model.
-#
-# The data returned by this command may be affected by:
-#
-# * QEMU version: CPU models may look different depending on the QEMU version.
-#   (Except for CPU models reported as "static" in query-cpu-definitions.)
-# * machine-type: CPU model  may look different depending on the machine-type.
-#   (Except for CPU models reported as "static" in query-cpu-definitions.)
-# * machine options (including accelerator): in some architectures, CPU models
-#   may look different depending on machine and accelerator options. (Except for
-#   CPU models reported as "static" in query-cpu-definitions.)
-# * "-cpu" arguments and global properties: arguments to the -cpu option and
-#   global properties may affect expansion of CPU models. Using
-#   query-cpu-model-expansion while using these is not advised.
-#
-# Some architectures may not support all expansion types. s390x supports
-# "full" and "static". Arm only supports "full".
-#
-# Returns: a CpuModelExpansionInfo. Returns an error if expanding CPU models is
-#          not supported, if the model cannot be expanded, if the model contains
-#          an unknown CPU definition name, unknown properties or properties
-#          with a wrong type. Also returns an error if an expansion type is
-#          not supported.
-#
-# Since: 2.8
-##
-{ 'command': 'query-cpu-model-expansion',
-  'data': { 'type': 'CpuModelExpansionType',
-            'model': 'CpuModelInfo' },
-  'returns': 'CpuModelExpansionInfo',
-  'if': { 'any': [ 'TARGET_S390X',
-                   'TARGET_I386',
-                   'TARGET_ARM' ] } }
-
 ##
 # @CpuDefinitionInfo:
 #
diff --git a/qapi/meson.build b/qapi/meson.build
index 9fd480c4d8..48be47170f 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -38,6 +38,7 @@ qapi_all_modules = [
   'job',
   'machine',
   'machine-target',
+  'machine-target-common',
   'migration',
   'misc',
   'misc-target',
diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
index c8fa524002..e591e7c362 100644
--- a/target/arm/arm-qmp-cmds.c
+++ b/target/arm/arm-qmp-cmds.c
@@ -21,6 +21,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "cpu.h"
 #include "hw/boards.h"
 #include "kvm_arm.h"
 #include "qapi/error.h"
@@ -99,9 +100,9 @@ static const char *cpu_model_advertised_features[] = {
     NULL
 };
 
-CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
-                                                     CpuModelInfo *model,
-                                                     Error **errp)
+CpuModelExpansionInfo *get_cpu_model_expansion(CpuModelExpansionType type,
+                                               CpuModelInfo *model,
+                                               Error **errp)
 {
     CpuModelExpansionInfo *expansion_info;
     const QDict *qdict_in = NULL;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c097cae988..d5dcc2ef11 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2660,7 +2660,12 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
 #define TYPE_ARM_HOST_CPU "host-" TYPE_ARM_CPU
 
 #define cpu_list arm_cpu_list
-
+#ifdef CONFIG_SOFTMMU
+CpuModelExpansionInfo *get_cpu_model_expansion(CpuModelExpansionType type,
+                                               CpuModelInfo *model,
+                                               Error **errp);
+#define cpu_model_expansion get_cpu_model_expansion
+#endif
 /* ARM has the following "translation regimes" (as the ARM ARM calls them):
  *
  * If EL3 is 64-bit:
diff --git a/target/i386/cpu-sysemu.c b/target/i386/cpu-sysemu.c
index 28115edf44..c01c85839c 100644
--- a/target/i386/cpu-sysemu.c
+++ b/target/i386/cpu-sysemu.c
@@ -176,10 +176,9 @@ out:
     return xc;
 }
 
-CpuModelExpansionInfo *
-qmp_query_cpu_model_expansion(CpuModelExpansionType type,
-                                                      CpuModelInfo *model,
-                                                      Error **errp)
+CpuModelExpansionInfo *get_cpu_model_expansion(CpuModelExpansionType type,
+                                               CpuModelInfo *model,
+                                               Error **errp)
 {
     X86CPU *xc = NULL;
     Error *err = NULL;
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d243e290d3..7ab633c642 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2209,6 +2209,12 @@ uint64_t cpu_get_tsc(CPUX86State *env);
 #endif
 
 #define cpu_list x86_cpu_list
+#ifdef CONFIG_SOFTMMU
+CpuModelExpansionInfo *get_cpu_model_expansion(CpuModelExpansionType type,
+                                               CpuModelInfo *model,
+                                               Error **errp);
+#define cpu_model_expansion get_cpu_model_expansion
+#endif
 
 /* MMU modes definitions */
 #define MMU_KSMAP_IDX   0
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 7d6d01325b..e67a2b386e 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -799,6 +799,13 @@ void s390_cpu_list(void);
 void s390_set_qemu_cpu_model(uint16_t type, uint8_t gen, uint8_t ec_ga,
                              const S390FeatInit feat_init);
 
+#ifdef CONFIG_SOFTMMU
+/* cpu_models-sysemu.c */
+CpuModelExpansionInfo *get_cpu_model_expansion(CpuModelExpansionType type,
+                                               CpuModelInfo *model,
+                                               Error **errp);
+#define cpu_model_expansion get_cpu_model_expansion
+#endif
 
 /* helper.c */
 #define S390_CPU_TYPE_SUFFIX "-" TYPE_S390_CPU
diff --git a/target/s390x/cpu_models_sysemu.c b/target/s390x/cpu_models_sysemu.c
index 63981bf36b..ef3845f11c 100644
--- a/target/s390x/cpu_models_sysemu.c
+++ b/target/s390x/cpu_models_sysemu.c
@@ -213,9 +213,9 @@ static void cpu_info_from_model(CpuModelInfo *info, const S390CPUModel *model,
     }
 }
 
-CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
-                                                      CpuModelInfo *model,
-                                                      Error **errp)
+CpuModelExpansionInfo *get_cpu_model_expansion(CpuModelExpansionType type,
+                                               CpuModelInfo *model,
+                                               Error **errp)
 {
     Error *err = NULL;
     CpuModelExpansionInfo *expansion_info = NULL;
-- 
2.30.2



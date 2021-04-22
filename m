Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A861436801A
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 14:14:51 +0200 (CEST)
Received: from localhost ([::1]:53658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZYEM-00065v-G2
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 08:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lZXvI-0006sG-BT; Thu, 22 Apr 2021 07:55:08 -0400
Received: from mx2.suse.de ([195.135.220.15]:40386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lZXv9-00023V-Lu; Thu, 22 Apr 2021 07:55:08 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D9130B152;
 Thu, 22 Apr 2021 11:54:37 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v3 12/13] target/s390x: split sysemu part of cpu models
Date: Thu, 22 Apr 2021 13:54:29 +0200
Message-Id: <20210422115430.15078-13-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210422115430.15078-1-cfontana@suse.de>
References: <20210422115430.15078-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

also create a tiny _user.c with just the (at least for now),
empty implementation of apply_cpu_model.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/s390x/s390x-internal.h    |   2 +
 target/s390x/cpu_models.c        | 417 +-----------------------------
 target/s390x/cpu_models_sysemu.c | 426 +++++++++++++++++++++++++++++++
 target/s390x/cpu_models_user.c   |  20 ++
 target/s390x/meson.build         |   4 +
 5 files changed, 453 insertions(+), 416 deletions(-)
 create mode 100644 target/s390x/cpu_models_sysemu.c
 create mode 100644 target/s390x/cpu_models_user.c

diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index 171ecd59fb..e4ec5e55bb 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -265,6 +265,8 @@ static inline void s390_cpu_unhalt(S390CPU *cpu)
 /* cpu_models.c */
 void s390_cpu_model_class_register_props(ObjectClass *oc);
 void s390_realize_cpu_model(CPUState *cs, Error **errp);
+S390CPUModel *get_max_cpu_model(Error **errp);
+void apply_cpu_model(const S390CPUModel *model, Error **errp);
 ObjectClass *s390_cpu_class_by_name(const char *name);
 
 
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 0ed1c23774..30a192590d 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -18,18 +18,11 @@
 #include "sysemu/tcg.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
-#include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qemu/qemu-print.h"
-#include "qapi/qmp/qerror.h"
-#include "qapi/qobject-input-visitor.h"
-#include "qapi/qmp/qdict.h"
 #ifndef CONFIG_USER_ONLY
-#include "sysemu/arch_init.h"
 #include "sysemu/sysemu.h"
-#include "hw/pci/pci.h"
 #endif
-#include "qapi/qapi-commands-machine-target.h"
 #include "hw/s390x/pv.h"
 
 #define CPUDEF_INIT(_type, _gen, _ec_ga, _mha_pow, _hmfai, _name, _desc) \
@@ -414,381 +407,6 @@ void s390_cpu_list(void)
     }
 }
 
-static S390CPUModel *get_max_cpu_model(Error **errp);
-
-#ifndef CONFIG_USER_ONLY
-static void list_add_feat(const char *name, void *opaque);
-
-static void check_unavailable_features(const S390CPUModel *max_model,
-                                       const S390CPUModel *model,
-                                       strList **unavailable)
-{
-    S390FeatBitmap missing;
-
-    /* check general model compatibility */
-    if (max_model->def->gen < model->def->gen ||
-        (max_model->def->gen == model->def->gen &&
-         max_model->def->ec_ga < model->def->ec_ga)) {
-        list_add_feat("type", unavailable);
-    }
-
-    /* detect missing features if any to properly report them */
-    bitmap_andnot(missing, model->features, max_model->features,
-                  S390_FEAT_MAX);
-    if (!bitmap_empty(missing, S390_FEAT_MAX)) {
-        s390_feat_bitmap_to_ascii(missing, unavailable, list_add_feat);
-    }
-}
-
-struct CpuDefinitionInfoListData {
-    CpuDefinitionInfoList *list;
-    S390CPUModel *model;
-};
-
-static void create_cpu_model_list(ObjectClass *klass, void *opaque)
-{
-    struct CpuDefinitionInfoListData *cpu_list_data = opaque;
-    CpuDefinitionInfoList **cpu_list = &cpu_list_data->list;
-    CpuDefinitionInfo *info;
-    char *name = g_strdup(object_class_get_name(klass));
-    S390CPUClass *scc = S390_CPU_CLASS(klass);
-
-    /* strip off the -s390x-cpu */
-    g_strrstr(name, "-" TYPE_S390_CPU)[0] = 0;
-    info = g_new0(CpuDefinitionInfo, 1);
-    info->name = name;
-    info->has_migration_safe = true;
-    info->migration_safe = scc->is_migration_safe;
-    info->q_static = scc->is_static;
-    info->q_typename = g_strdup(object_class_get_name(klass));
-    /* check for unavailable features */
-    if (cpu_list_data->model) {
-        Object *obj;
-        S390CPU *sc;
-        obj = object_new_with_class(klass);
-        sc = S390_CPU(obj);
-        if (sc->model) {
-            info->has_unavailable_features = true;
-            check_unavailable_features(cpu_list_data->model, sc->model,
-                                       &info->unavailable_features);
-        }
-        object_unref(obj);
-    }
-
-    QAPI_LIST_PREPEND(*cpu_list, info);
-}
-
-CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
-{
-    struct CpuDefinitionInfoListData list_data = {
-        .list = NULL,
-    };
-
-    list_data.model = get_max_cpu_model(NULL);
-
-    object_class_foreach(create_cpu_model_list, TYPE_S390_CPU, false,
-                         &list_data);
-
-    return list_data.list;
-}
-
-static void cpu_model_from_info(S390CPUModel *model, const CpuModelInfo *info,
-                                Error **errp)
-{
-    Error *err = NULL;
-    const QDict *qdict = NULL;
-    const QDictEntry *e;
-    Visitor *visitor;
-    ObjectClass *oc;
-    S390CPU *cpu;
-    Object *obj;
-
-    if (info->props) {
-        qdict = qobject_to(QDict, info->props);
-        if (!qdict) {
-            error_setg(errp, QERR_INVALID_PARAMETER_TYPE, "props", "dict");
-            return;
-        }
-    }
-
-    oc = cpu_class_by_name(TYPE_S390_CPU, info->name);
-    if (!oc) {
-        error_setg(errp, "The CPU definition \'%s\' is unknown.", info->name);
-        return;
-    }
-    if (S390_CPU_CLASS(oc)->kvm_required && !kvm_enabled()) {
-        error_setg(errp, "The CPU definition '%s' requires KVM", info->name);
-        return;
-    }
-    obj = object_new_with_class(oc);
-    cpu = S390_CPU(obj);
-
-    if (!cpu->model) {
-        error_setg(errp, "Details about the host CPU model are not available, "
-                         "it cannot be used.");
-        object_unref(obj);
-        return;
-    }
-
-    if (qdict) {
-        visitor = qobject_input_visitor_new(info->props);
-        if (!visit_start_struct(visitor, NULL, NULL, 0, errp)) {
-            visit_free(visitor);
-            object_unref(obj);
-            return;
-        }
-        for (e = qdict_first(qdict); e; e = qdict_next(qdict, e)) {
-            if (!object_property_set(obj, e->key, visitor, &err)) {
-                break;
-            }
-        }
-        if (!err) {
-            visit_check_struct(visitor, &err);
-        }
-        visit_end_struct(visitor, NULL);
-        visit_free(visitor);
-        if (err) {
-            error_propagate(errp, err);
-            object_unref(obj);
-            return;
-        }
-    }
-
-    /* copy the model and throw the cpu away */
-    memcpy(model, cpu->model, sizeof(*model));
-    object_unref(obj);
-}
-
-static void qdict_add_disabled_feat(const char *name, void *opaque)
-{
-    qdict_put_bool(opaque, name, false);
-}
-
-static void qdict_add_enabled_feat(const char *name, void *opaque)
-{
-    qdict_put_bool(opaque, name, true);
-}
-
-/* convert S390CPUDef into a static CpuModelInfo */
-static void cpu_info_from_model(CpuModelInfo *info, const S390CPUModel *model,
-                                bool delta_changes)
-{
-    QDict *qdict = qdict_new();
-    S390FeatBitmap bitmap;
-
-    /* always fallback to the static base model */
-    info->name = g_strdup_printf("%s-base", model->def->name);
-
-    if (delta_changes) {
-        /* features deleted from the base feature set */
-        bitmap_andnot(bitmap, model->def->base_feat, model->features,
-                      S390_FEAT_MAX);
-        if (!bitmap_empty(bitmap, S390_FEAT_MAX)) {
-            s390_feat_bitmap_to_ascii(bitmap, qdict, qdict_add_disabled_feat);
-        }
-
-        /* features added to the base feature set */
-        bitmap_andnot(bitmap, model->features, model->def->base_feat,
-                      S390_FEAT_MAX);
-        if (!bitmap_empty(bitmap, S390_FEAT_MAX)) {
-            s390_feat_bitmap_to_ascii(bitmap, qdict, qdict_add_enabled_feat);
-        }
-    } else {
-        /* expand all features */
-        s390_feat_bitmap_to_ascii(model->features, qdict,
-                                  qdict_add_enabled_feat);
-        bitmap_complement(bitmap, model->features, S390_FEAT_MAX);
-        s390_feat_bitmap_to_ascii(bitmap, qdict, qdict_add_disabled_feat);
-    }
-
-    if (!qdict_size(qdict)) {
-        qobject_unref(qdict);
-    } else {
-        info->props = QOBJECT(qdict);
-        info->has_props = true;
-    }
-}
-
-CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
-                                                      CpuModelInfo *model,
-                                                      Error **errp)
-{
-    Error *err = NULL;
-    CpuModelExpansionInfo *expansion_info = NULL;
-    S390CPUModel s390_model;
-    bool delta_changes = false;
-
-    /* convert it to our internal representation */
-    cpu_model_from_info(&s390_model, model, &err);
-    if (err) {
-        error_propagate(errp, err);
-        return NULL;
-    }
-
-    if (type == CPU_MODEL_EXPANSION_TYPE_STATIC) {
-        delta_changes = true;
-    } else if (type != CPU_MODEL_EXPANSION_TYPE_FULL) {
-        error_setg(errp, "The requested expansion type is not supported.");
-        return NULL;
-    }
-
-    /* convert it back to a static representation */
-    expansion_info = g_new0(CpuModelExpansionInfo, 1);
-    expansion_info->model = g_malloc0(sizeof(*expansion_info->model));
-    cpu_info_from_model(expansion_info->model, &s390_model, delta_changes);
-    return expansion_info;
-}
-
-static void list_add_feat(const char *name, void *opaque)
-{
-    strList **last = (strList **) opaque;
-
-    QAPI_LIST_PREPEND(*last, g_strdup(name));
-}
-
-CpuModelCompareInfo *qmp_query_cpu_model_comparison(CpuModelInfo *infoa,
-                                                     CpuModelInfo *infob,
-                                                     Error **errp)
-{
-    Error *err = NULL;
-    CpuModelCompareResult feat_result, gen_result;
-    CpuModelCompareInfo *compare_info;
-    S390FeatBitmap missing, added;
-    S390CPUModel modela, modelb;
-
-    /* convert both models to our internal representation */
-    cpu_model_from_info(&modela, infoa, &err);
-    if (err) {
-        error_propagate(errp, err);
-        return NULL;
-    }
-    cpu_model_from_info(&modelb, infob, &err);
-    if (err) {
-        error_propagate(errp, err);
-        return NULL;
-    }
-    compare_info = g_new0(CpuModelCompareInfo, 1);
-
-    /* check the cpu generation and ga level */
-    if (modela.def->gen == modelb.def->gen) {
-        if (modela.def->ec_ga == modelb.def->ec_ga) {
-            /* ec and corresponding bc are identical */
-            gen_result = CPU_MODEL_COMPARE_RESULT_IDENTICAL;
-        } else if (modela.def->ec_ga < modelb.def->ec_ga) {
-            gen_result = CPU_MODEL_COMPARE_RESULT_SUBSET;
-        } else {
-            gen_result = CPU_MODEL_COMPARE_RESULT_SUPERSET;
-        }
-    } else if (modela.def->gen < modelb.def->gen) {
-        gen_result = CPU_MODEL_COMPARE_RESULT_SUBSET;
-    } else {
-        gen_result = CPU_MODEL_COMPARE_RESULT_SUPERSET;
-    }
-    if (gen_result != CPU_MODEL_COMPARE_RESULT_IDENTICAL) {
-        /* both models cannot be made identical */
-        list_add_feat("type", &compare_info->responsible_properties);
-    }
-
-    /* check the feature set */
-    if (bitmap_equal(modela.features, modelb.features, S390_FEAT_MAX)) {
-        feat_result = CPU_MODEL_COMPARE_RESULT_IDENTICAL;
-    } else {
-        bitmap_andnot(missing, modela.features, modelb.features, S390_FEAT_MAX);
-        s390_feat_bitmap_to_ascii(missing,
-                                  &compare_info->responsible_properties,
-                                  list_add_feat);
-        bitmap_andnot(added, modelb.features, modela.features, S390_FEAT_MAX);
-        s390_feat_bitmap_to_ascii(added, &compare_info->responsible_properties,
-                                  list_add_feat);
-        if (bitmap_empty(missing, S390_FEAT_MAX)) {
-            feat_result = CPU_MODEL_COMPARE_RESULT_SUBSET;
-        } else if (bitmap_empty(added, S390_FEAT_MAX)) {
-            feat_result = CPU_MODEL_COMPARE_RESULT_SUPERSET;
-        } else {
-            feat_result = CPU_MODEL_COMPARE_RESULT_INCOMPATIBLE;
-        }
-    }
-
-    /* combine the results */
-    if (gen_result == feat_result) {
-        compare_info->result = gen_result;
-    } else if (feat_result == CPU_MODEL_COMPARE_RESULT_IDENTICAL) {
-        compare_info->result = gen_result;
-    } else if (gen_result == CPU_MODEL_COMPARE_RESULT_IDENTICAL) {
-        compare_info->result = feat_result;
-    } else {
-        compare_info->result = CPU_MODEL_COMPARE_RESULT_INCOMPATIBLE;
-    }
-    return compare_info;
-}
-
-CpuModelBaselineInfo *qmp_query_cpu_model_baseline(CpuModelInfo *infoa,
-                                                    CpuModelInfo *infob,
-                                                    Error **errp)
-{
-    Error *err = NULL;
-    CpuModelBaselineInfo *baseline_info;
-    S390CPUModel modela, modelb, model;
-    uint16_t cpu_type;
-    uint8_t max_gen_ga;
-    uint8_t max_gen;
-
-    /* convert both models to our internal representation */
-    cpu_model_from_info(&modela, infoa, &err);
-    if (err) {
-        error_propagate(errp, err);
-        return NULL;
-    }
-
-    cpu_model_from_info(&modelb, infob, &err);
-    if (err) {
-        error_propagate(errp, err);
-        return NULL;
-    }
-
-    /* features both models support */
-    bitmap_and(model.features, modela.features, modelb.features, S390_FEAT_MAX);
-
-    /* detect the maximum model not regarding features */
-    if (modela.def->gen == modelb.def->gen) {
-        if (modela.def->type == modelb.def->type) {
-            cpu_type = modela.def->type;
-        } else {
-            cpu_type = 0;
-        }
-        max_gen = modela.def->gen;
-        max_gen_ga = MIN(modela.def->ec_ga, modelb.def->ec_ga);
-    } else if (modela.def->gen > modelb.def->gen) {
-        cpu_type = modelb.def->type;
-        max_gen = modelb.def->gen;
-        max_gen_ga = modelb.def->ec_ga;
-    } else {
-        cpu_type = modela.def->type;
-        max_gen = modela.def->gen;
-        max_gen_ga = modela.def->ec_ga;
-    }
-
-    model.def = s390_find_cpu_def(cpu_type, max_gen, max_gen_ga,
-                                  model.features);
-
-    /* models without early base features (esan3) are bad */
-    if (!model.def) {
-        error_setg(errp, "No compatible CPU model could be created as"
-                   " important base features are disabled");
-        return NULL;
-    }
-
-    /* strip off features not part of the max model */
-    bitmap_and(model.features, model.features, model.def->full_feat,
-               S390_FEAT_MAX);
-
-    baseline_info = g_new0(CpuModelBaselineInfo, 1);
-    baseline_info->model = g_malloc0(sizeof(*baseline_info->model));
-    cpu_info_from_model(baseline_info->model, &model, true);
-    return baseline_info;
-}
-#endif
-
 static void check_consistency(const S390CPUModel *model)
 {
     static int dep[][2] = {
@@ -900,7 +518,7 @@ static void check_compatibility(const S390CPUModel *max_model,
                   "available in the configuration: ");
 }
 
-static S390CPUModel *get_max_cpu_model(Error **errp)
+S390CPUModel *get_max_cpu_model(Error **errp)
 {
     Error *err = NULL;
     static S390CPUModel max_model;
@@ -925,39 +543,6 @@ static S390CPUModel *get_max_cpu_model(Error **errp)
     return &max_model;
 }
 
-static inline void apply_cpu_model(const S390CPUModel *model, Error **errp)
-{
-#ifndef CONFIG_USER_ONLY
-    Error *err = NULL;
-    static S390CPUModel applied_model;
-    static bool applied;
-
-    /*
-     * We have the same model for all VCPUs. KVM can only be configured before
-     * any VCPUs are defined in KVM.
-     */
-    if (applied) {
-        if (model && memcmp(&applied_model, model, sizeof(S390CPUModel))) {
-            error_setg(errp, "Mixed CPU models are not supported on s390x.");
-        }
-        return;
-    }
-
-    if (kvm_enabled()) {
-        kvm_s390_apply_cpu_model(model, &err);
-        if (err) {
-            error_propagate(errp, err);
-            return;
-        }
-    }
-
-    applied = true;
-    if (model) {
-        applied_model = *model;
-    }
-#endif
-}
-
 void s390_realize_cpu_model(CPUState *cs, Error **errp)
 {
     Error *err = NULL;
diff --git a/target/s390x/cpu_models_sysemu.c b/target/s390x/cpu_models_sysemu.c
new file mode 100644
index 0000000000..05c3ccaaff
--- /dev/null
+++ b/target/s390x/cpu_models_sysemu.c
@@ -0,0 +1,426 @@
+/*
+ * CPU models for s390x - System Emulation-only
+ *
+ * Copyright 2016 IBM Corp.
+ *
+ * Author(s): David Hildenbrand <dahi@linux.vnet.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or (at
+ * your option) any later version. See the COPYING file in the top-level
+ * directory.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "s390x-internal.h"
+#include "kvm/kvm_s390x.h"
+#include "sysemu/kvm.h"
+#include "sysemu/tcg.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "qapi/qmp/qerror.h"
+#include "qapi/qobject-input-visitor.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qapi-commands-machine-target.h"
+
+static void list_add_feat(const char *name, void *opaque);
+
+static void check_unavailable_features(const S390CPUModel *max_model,
+                                       const S390CPUModel *model,
+                                       strList **unavailable)
+{
+    S390FeatBitmap missing;
+
+    /* check general model compatibility */
+    if (max_model->def->gen < model->def->gen ||
+        (max_model->def->gen == model->def->gen &&
+         max_model->def->ec_ga < model->def->ec_ga)) {
+        list_add_feat("type", unavailable);
+    }
+
+    /* detect missing features if any to properly report them */
+    bitmap_andnot(missing, model->features, max_model->features,
+                  S390_FEAT_MAX);
+    if (!bitmap_empty(missing, S390_FEAT_MAX)) {
+        s390_feat_bitmap_to_ascii(missing, unavailable, list_add_feat);
+    }
+}
+
+struct CpuDefinitionInfoListData {
+    CpuDefinitionInfoList *list;
+    S390CPUModel *model;
+};
+
+static void create_cpu_model_list(ObjectClass *klass, void *opaque)
+{
+    struct CpuDefinitionInfoListData *cpu_list_data = opaque;
+    CpuDefinitionInfoList **cpu_list = &cpu_list_data->list;
+    CpuDefinitionInfo *info;
+    char *name = g_strdup(object_class_get_name(klass));
+    S390CPUClass *scc = S390_CPU_CLASS(klass);
+
+    /* strip off the -s390x-cpu */
+    g_strrstr(name, "-" TYPE_S390_CPU)[0] = 0;
+    info = g_new0(CpuDefinitionInfo, 1);
+    info->name = name;
+    info->has_migration_safe = true;
+    info->migration_safe = scc->is_migration_safe;
+    info->q_static = scc->is_static;
+    info->q_typename = g_strdup(object_class_get_name(klass));
+    /* check for unavailable features */
+    if (cpu_list_data->model) {
+        Object *obj;
+        S390CPU *sc;
+        obj = object_new_with_class(klass);
+        sc = S390_CPU(obj);
+        if (sc->model) {
+            info->has_unavailable_features = true;
+            check_unavailable_features(cpu_list_data->model, sc->model,
+                                       &info->unavailable_features);
+        }
+        object_unref(obj);
+    }
+
+    QAPI_LIST_PREPEND(*cpu_list, info);
+}
+
+CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
+{
+    struct CpuDefinitionInfoListData list_data = {
+        .list = NULL,
+    };
+
+    list_data.model = get_max_cpu_model(NULL);
+
+    object_class_foreach(create_cpu_model_list, TYPE_S390_CPU, false,
+                         &list_data);
+
+    return list_data.list;
+}
+
+static void cpu_model_from_info(S390CPUModel *model, const CpuModelInfo *info,
+                                Error **errp)
+{
+    Error *err = NULL;
+    const QDict *qdict = NULL;
+    const QDictEntry *e;
+    Visitor *visitor;
+    ObjectClass *oc;
+    S390CPU *cpu;
+    Object *obj;
+
+    if (info->props) {
+        qdict = qobject_to(QDict, info->props);
+        if (!qdict) {
+            error_setg(errp, QERR_INVALID_PARAMETER_TYPE, "props", "dict");
+            return;
+        }
+    }
+
+    oc = cpu_class_by_name(TYPE_S390_CPU, info->name);
+    if (!oc) {
+        error_setg(errp, "The CPU definition \'%s\' is unknown.", info->name);
+        return;
+    }
+    if (S390_CPU_CLASS(oc)->kvm_required && !kvm_enabled()) {
+        error_setg(errp, "The CPU definition '%s' requires KVM", info->name);
+        return;
+    }
+    obj = object_new_with_class(oc);
+    cpu = S390_CPU(obj);
+
+    if (!cpu->model) {
+        error_setg(errp, "Details about the host CPU model are not available, "
+                         "it cannot be used.");
+        object_unref(obj);
+        return;
+    }
+
+    if (qdict) {
+        visitor = qobject_input_visitor_new(info->props);
+        if (!visit_start_struct(visitor, NULL, NULL, 0, errp)) {
+            visit_free(visitor);
+            object_unref(obj);
+            return;
+        }
+        for (e = qdict_first(qdict); e; e = qdict_next(qdict, e)) {
+            if (!object_property_set(obj, e->key, visitor, &err)) {
+                break;
+            }
+        }
+        if (!err) {
+            visit_check_struct(visitor, &err);
+        }
+        visit_end_struct(visitor, NULL);
+        visit_free(visitor);
+        if (err) {
+            error_propagate(errp, err);
+            object_unref(obj);
+            return;
+        }
+    }
+
+    /* copy the model and throw the cpu away */
+    memcpy(model, cpu->model, sizeof(*model));
+    object_unref(obj);
+}
+
+static void qdict_add_disabled_feat(const char *name, void *opaque)
+{
+    qdict_put_bool(opaque, name, false);
+}
+
+static void qdict_add_enabled_feat(const char *name, void *opaque)
+{
+    qdict_put_bool(opaque, name, true);
+}
+
+/* convert S390CPUDef into a static CpuModelInfo */
+static void cpu_info_from_model(CpuModelInfo *info, const S390CPUModel *model,
+                                bool delta_changes)
+{
+    QDict *qdict = qdict_new();
+    S390FeatBitmap bitmap;
+
+    /* always fallback to the static base model */
+    info->name = g_strdup_printf("%s-base", model->def->name);
+
+    if (delta_changes) {
+        /* features deleted from the base feature set */
+        bitmap_andnot(bitmap, model->def->base_feat, model->features,
+                      S390_FEAT_MAX);
+        if (!bitmap_empty(bitmap, S390_FEAT_MAX)) {
+            s390_feat_bitmap_to_ascii(bitmap, qdict, qdict_add_disabled_feat);
+        }
+
+        /* features added to the base feature set */
+        bitmap_andnot(bitmap, model->features, model->def->base_feat,
+                      S390_FEAT_MAX);
+        if (!bitmap_empty(bitmap, S390_FEAT_MAX)) {
+            s390_feat_bitmap_to_ascii(bitmap, qdict, qdict_add_enabled_feat);
+        }
+    } else {
+        /* expand all features */
+        s390_feat_bitmap_to_ascii(model->features, qdict,
+                                  qdict_add_enabled_feat);
+        bitmap_complement(bitmap, model->features, S390_FEAT_MAX);
+        s390_feat_bitmap_to_ascii(bitmap, qdict, qdict_add_disabled_feat);
+    }
+
+    if (!qdict_size(qdict)) {
+        qobject_unref(qdict);
+    } else {
+        info->props = QOBJECT(qdict);
+        info->has_props = true;
+    }
+}
+
+CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
+                                                      CpuModelInfo *model,
+                                                      Error **errp)
+{
+    Error *err = NULL;
+    CpuModelExpansionInfo *expansion_info = NULL;
+    S390CPUModel s390_model;
+    bool delta_changes = false;
+
+    /* convert it to our internal representation */
+    cpu_model_from_info(&s390_model, model, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return NULL;
+    }
+
+    if (type == CPU_MODEL_EXPANSION_TYPE_STATIC) {
+        delta_changes = true;
+    } else if (type != CPU_MODEL_EXPANSION_TYPE_FULL) {
+        error_setg(errp, "The requested expansion type is not supported.");
+        return NULL;
+    }
+
+    /* convert it back to a static representation */
+    expansion_info = g_new0(CpuModelExpansionInfo, 1);
+    expansion_info->model = g_malloc0(sizeof(*expansion_info->model));
+    cpu_info_from_model(expansion_info->model, &s390_model, delta_changes);
+    return expansion_info;
+}
+
+static void list_add_feat(const char *name, void *opaque)
+{
+    strList **last = (strList **) opaque;
+
+    QAPI_LIST_PREPEND(*last, g_strdup(name));
+}
+
+CpuModelCompareInfo *qmp_query_cpu_model_comparison(CpuModelInfo *infoa,
+                                                     CpuModelInfo *infob,
+                                                     Error **errp)
+{
+    Error *err = NULL;
+    CpuModelCompareResult feat_result, gen_result;
+    CpuModelCompareInfo *compare_info;
+    S390FeatBitmap missing, added;
+    S390CPUModel modela, modelb;
+
+    /* convert both models to our internal representation */
+    cpu_model_from_info(&modela, infoa, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return NULL;
+    }
+    cpu_model_from_info(&modelb, infob, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return NULL;
+    }
+    compare_info = g_new0(CpuModelCompareInfo, 1);
+
+    /* check the cpu generation and ga level */
+    if (modela.def->gen == modelb.def->gen) {
+        if (modela.def->ec_ga == modelb.def->ec_ga) {
+            /* ec and corresponding bc are identical */
+            gen_result = CPU_MODEL_COMPARE_RESULT_IDENTICAL;
+        } else if (modela.def->ec_ga < modelb.def->ec_ga) {
+            gen_result = CPU_MODEL_COMPARE_RESULT_SUBSET;
+        } else {
+            gen_result = CPU_MODEL_COMPARE_RESULT_SUPERSET;
+        }
+    } else if (modela.def->gen < modelb.def->gen) {
+        gen_result = CPU_MODEL_COMPARE_RESULT_SUBSET;
+    } else {
+        gen_result = CPU_MODEL_COMPARE_RESULT_SUPERSET;
+    }
+    if (gen_result != CPU_MODEL_COMPARE_RESULT_IDENTICAL) {
+        /* both models cannot be made identical */
+        list_add_feat("type", &compare_info->responsible_properties);
+    }
+
+    /* check the feature set */
+    if (bitmap_equal(modela.features, modelb.features, S390_FEAT_MAX)) {
+        feat_result = CPU_MODEL_COMPARE_RESULT_IDENTICAL;
+    } else {
+        bitmap_andnot(missing, modela.features, modelb.features, S390_FEAT_MAX);
+        s390_feat_bitmap_to_ascii(missing,
+                                  &compare_info->responsible_properties,
+                                  list_add_feat);
+        bitmap_andnot(added, modelb.features, modela.features, S390_FEAT_MAX);
+        s390_feat_bitmap_to_ascii(added, &compare_info->responsible_properties,
+                                  list_add_feat);
+        if (bitmap_empty(missing, S390_FEAT_MAX)) {
+            feat_result = CPU_MODEL_COMPARE_RESULT_SUBSET;
+        } else if (bitmap_empty(added, S390_FEAT_MAX)) {
+            feat_result = CPU_MODEL_COMPARE_RESULT_SUPERSET;
+        } else {
+            feat_result = CPU_MODEL_COMPARE_RESULT_INCOMPATIBLE;
+        }
+    }
+
+    /* combine the results */
+    if (gen_result == feat_result) {
+        compare_info->result = gen_result;
+    } else if (feat_result == CPU_MODEL_COMPARE_RESULT_IDENTICAL) {
+        compare_info->result = gen_result;
+    } else if (gen_result == CPU_MODEL_COMPARE_RESULT_IDENTICAL) {
+        compare_info->result = feat_result;
+    } else {
+        compare_info->result = CPU_MODEL_COMPARE_RESULT_INCOMPATIBLE;
+    }
+    return compare_info;
+}
+
+CpuModelBaselineInfo *qmp_query_cpu_model_baseline(CpuModelInfo *infoa,
+                                                    CpuModelInfo *infob,
+                                                    Error **errp)
+{
+    Error *err = NULL;
+    CpuModelBaselineInfo *baseline_info;
+    S390CPUModel modela, modelb, model;
+    uint16_t cpu_type;
+    uint8_t max_gen_ga;
+    uint8_t max_gen;
+
+    /* convert both models to our internal representation */
+    cpu_model_from_info(&modela, infoa, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return NULL;
+    }
+
+    cpu_model_from_info(&modelb, infob, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return NULL;
+    }
+
+    /* features both models support */
+    bitmap_and(model.features, modela.features, modelb.features, S390_FEAT_MAX);
+
+    /* detect the maximum model not regarding features */
+    if (modela.def->gen == modelb.def->gen) {
+        if (modela.def->type == modelb.def->type) {
+            cpu_type = modela.def->type;
+        } else {
+            cpu_type = 0;
+        }
+        max_gen = modela.def->gen;
+        max_gen_ga = MIN(modela.def->ec_ga, modelb.def->ec_ga);
+    } else if (modela.def->gen > modelb.def->gen) {
+        cpu_type = modelb.def->type;
+        max_gen = modelb.def->gen;
+        max_gen_ga = modelb.def->ec_ga;
+    } else {
+        cpu_type = modela.def->type;
+        max_gen = modela.def->gen;
+        max_gen_ga = modela.def->ec_ga;
+    }
+
+    model.def = s390_find_cpu_def(cpu_type, max_gen, max_gen_ga,
+                                  model.features);
+
+    /* models without early base features (esan3) are bad */
+    if (!model.def) {
+        error_setg(errp, "No compatible CPU model could be created as"
+                   " important base features are disabled");
+        return NULL;
+    }
+
+    /* strip off features not part of the max model */
+    bitmap_and(model.features, model.features, model.def->full_feat,
+               S390_FEAT_MAX);
+
+    baseline_info = g_new0(CpuModelBaselineInfo, 1);
+    baseline_info->model = g_malloc0(sizeof(*baseline_info->model));
+    cpu_info_from_model(baseline_info->model, &model, true);
+    return baseline_info;
+}
+
+void apply_cpu_model(const S390CPUModel *model, Error **errp)
+{
+    Error *err = NULL;
+    static S390CPUModel applied_model;
+    static bool applied;
+
+    /*
+     * We have the same model for all VCPUs. KVM can only be configured before
+     * any VCPUs are defined in KVM.
+     */
+    if (applied) {
+        if (model && memcmp(&applied_model, model, sizeof(S390CPUModel))) {
+            error_setg(errp, "Mixed CPU models are not supported on s390x.");
+        }
+        return;
+    }
+
+    if (kvm_enabled()) {
+        kvm_s390_apply_cpu_model(model, &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
+    }
+
+    applied = true;
+    if (model) {
+        applied_model = *model;
+    }
+}
diff --git a/target/s390x/cpu_models_user.c b/target/s390x/cpu_models_user.c
new file mode 100644
index 0000000000..df24d12d9e
--- /dev/null
+++ b/target/s390x/cpu_models_user.c
@@ -0,0 +1,20 @@
+/*
+ * CPU models for s390x - User-mode
+ *
+ * Copyright 2016 IBM Corp.
+ *
+ * Author(s): David Hildenbrand <dahi@linux.vnet.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or (at
+ * your option) any later version. See the COPYING file in the top-level
+ * directory.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "s390x-internal.h"
+#include "qapi/error.h"
+
+void apply_cpu_model(const S390CPUModel *model, Error **errp)
+{
+}
diff --git a/target/s390x/meson.build b/target/s390x/meson.build
index ec73bed524..84c1402a6a 100644
--- a/target/s390x/meson.build
+++ b/target/s390x/meson.build
@@ -28,9 +28,13 @@ s390x_softmmu_ss.add(files(
   'mmu_helper.c',
   'sigp.c',
   'cpu-sysemu.c',
+  'cpu_models_sysemu.c',
 ))
 
 s390x_user_ss = ss.source_set()
+s390x_user_ss.add(files(
+  'cpu_models_user.c',
+))
 
 subdir('tcg')
 subdir('kvm')
-- 
2.26.2



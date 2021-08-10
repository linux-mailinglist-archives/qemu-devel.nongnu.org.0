Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A343E5AE4
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 15:18:04 +0200 (CEST)
Received: from localhost ([::1]:39956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDRdq-0005QN-Hv
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 09:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mDRcS-0004eK-7B
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 09:16:36 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:38780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mDRcQ-0006ew-Gr
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 09:16:35 -0400
Received: by mail-ed1-x52e.google.com with SMTP id y7so30177518eda.5
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 06:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wMGuF8Uwd5O5Dq/Cg79i1PrFzIYUFnQFZIVkrVyi4mU=;
 b=Nz0esK+87/8HQs47XANBZxL6v5bW7njag5+9EwTx3J37/r5G5rGDiTH749Tba17SNF
 Bixh031FF97BewGNpKSxAu5AnK1t509aK2QxzFXDZPPqBQe4Vdj6ir6ocM/IrloCgK9Y
 ZdRLFtYM03tC6dos+NSkU7pG3/UBGLc69oY21msa8w5cyBt+kxEC9aaVrdd5tFmoHbVv
 IBQsyTHlDeZivILDnXL44QeMC1MbodWGxxlWhBVZVA/qhchaM3UXdQyc4bYoDqJaQ0bY
 +2OMvUe9dRVW6PtWI0gSUIUIlUl7ZxLr9ESJe0625L5nJiQOrAQb43pGUlqM68khnlwm
 DHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wMGuF8Uwd5O5Dq/Cg79i1PrFzIYUFnQFZIVkrVyi4mU=;
 b=g+An/zfaVTtqjWO/5eqL1HG980UqdF0qGklNvkDxxFTT1euwQ2L3q/TejQ8zI5obTv
 xFtmQBs9NRvmI8nNwnU97WqNjsdFWTVl7TjUN2COwY9+KUEmoxXxNHVXfDpNeGpwI7pt
 k/D+bohf4wQrtXiR6hd2pRuyU5QwuhSkChcdkg55YqEG0nwrKGMynO0xYQPmPM4qNC5K
 cTzxyJYV1w0FNfS59jjxQbm0dC4a/sfsB/KNUDPaaMscfsmDueNXW9FRblcV6X0ieopb
 HzABay73erpWkFZDkEcPvstiXNiutsa2dOxRNJHd8euX7/iZlqS93RrDJbppZ9BxmvHA
 Jw5w==
X-Gm-Message-State: AOAM532A2YTt81i8ZAkm6bmQ0J8OwuV4mcDA7U2wBcPmIGJ0UV6/1xDV
 0BxB9vsReGeCl3lq5wo20zEcHw==
X-Google-Smtp-Source: ABdhPJxMmGAXPZXrcmDGg7f6AsDCihURJETd/l98YlF/3hG3w94cMM4arDU55SNKrNrTmZwk7mX/ug==
X-Received: by 2002:a05:6402:4245:: with SMTP id
 g5mr4958885edb.222.1628601392670; 
 Tue, 10 Aug 2021 06:16:32 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-111-173.adslplus.ch.
 [84.226.111.173])
 by smtp.gmail.com with ESMTPSA id u9sm6358687edt.60.2021.08.10.06.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 06:16:32 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: pbonzini@redhat.com
Subject: [PATCH] vl: fix machine option containing underscores
Date: Tue, 10 Aug 2021 15:12:31 +0200
Message-Id: <20210810131228.2332728-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=jean-philippe@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit d8fb7d0969d5 ("vl: switch -M parsing to keyval"),
keyval_dashify() replaces all underscores with dashes in machine
options. As a result the machine option "default_bus_bypass_iommu",
which was introduced in the same release (c9e96b04fc19 6d7a85483a06), is
not recognized:

$ qemu-system-aarch64 -M virt,default_bus_bypass_iommu=on
qemu-system-aarch64: Property 'virt-6.1-machine.default-bus-bypass-iommu' not found

Before that commit, dashification was only applied temporarily within
machine_set_property() to check the legacy options. Restore that
behavior by explicitly checking for aliases of these options instead of
transforming all machine options.

Fixes: d8fb7d0969d5 ("vl: switch -M parsing to keyval")
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
My first take was renaming default_bus_bypass_iommu, since it's the only
machine option with underscores, but then we'd want to rename
bypass_iommu as well for consistency and update all the docs. I prefer
this but don't mind either way.
---
 softmmu/vl.c | 56 +++++++++++++++++++---------------------------------
 1 file changed, 20 insertions(+), 36 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 5ca11e7469..3d3aa35279 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1660,41 +1660,25 @@ static int object_parse_property_opt(Object *obj,
     return 0;
 }
 
-/* *Non*recursively replace underscores with dashes in QDict keys.  */
-static void keyval_dashify(QDict *qdict, Error **errp)
+static const char *find_option_alias(QDict *qdict, const char *key,
+                                     const char *alias, const char **value)
 {
-    const QDictEntry *ent, *next;
-    char *p;
-
-    for (ent = qdict_first(qdict); ent; ent = next) {
-        g_autofree char *new_key = NULL;
-
-        next = qdict_next(qdict, ent);
-        if (!strchr(ent->key, '_')) {
-            continue;
-        }
-        new_key = g_strdup(ent->key);
-        for (p = new_key; *p; p++) {
-            if (*p == '_') {
-                *p = '-';
-            }
-        }
-        if (qdict_haskey(qdict, new_key)) {
-            error_setg(errp, "Conflict between '%s' and '%s'", ent->key, new_key);
-            return;
-        }
-        qobject_ref(ent->value);
-        qdict_put_obj(qdict, new_key, ent->value);
-        qdict_del(qdict, ent->key);
+    *value = qdict_get_try_str(qdict, key);
+    if (*value) {
+        return key;
+    }
+    *value = qdict_get_try_str(qdict, alias);
+    if (*value) {
+        return alias;
     }
+    return NULL;
 }
 
 static void qemu_apply_legacy_machine_options(QDict *qdict)
 {
+    const char *key;
     const char *value;
 
-    keyval_dashify(qdict, &error_fatal);
-
     /* Legacy options do not correspond to MachineState properties.  */
     value = qdict_get_try_str(qdict, "accel");
     if (value) {
@@ -1702,27 +1686,27 @@ static void qemu_apply_legacy_machine_options(QDict *qdict)
         qdict_del(qdict, "accel");
     }
 
-    value = qdict_get_try_str(qdict, "igd-passthru");
-    if (value) {
+    key = find_option_alias(qdict, "igd-passthru", "igd_passthru", &value);
+    if (key) {
         object_register_sugar_prop(ACCEL_CLASS_NAME("xen"), "igd-passthru", value,
                                    false);
-        qdict_del(qdict, "igd-passthru");
+        qdict_del(qdict, key);
     }
 
-    value = qdict_get_try_str(qdict, "kvm-shadow-mem");
-    if (value) {
+    key = find_option_alias(qdict, "kvm-shadow-mem", "kvm_shadow_mem", &value);
+    if (key) {
         object_register_sugar_prop(ACCEL_CLASS_NAME("kvm"), "kvm-shadow-mem", value,
                                    false);
-        qdict_del(qdict, "kvm-shadow-mem");
+        qdict_del(qdict, key);
     }
 
-    value = qdict_get_try_str(qdict, "kernel-irqchip");
-    if (value) {
+    key = find_option_alias(qdict, "kernel-irqchip", "kernel_irqchip", &value);
+    if (key) {
         object_register_sugar_prop(ACCEL_CLASS_NAME("kvm"), "kernel-irqchip", value,
                                    false);
         object_register_sugar_prop(ACCEL_CLASS_NAME("whpx"), "kernel-irqchip", value,
                                    false);
-        qdict_del(qdict, "kernel-irqchip");
+        qdict_del(qdict, key);
     }
 }
 
-- 
2.32.0



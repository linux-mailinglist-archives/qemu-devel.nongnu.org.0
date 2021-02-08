Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E56FE312B61
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 09:02:46 +0100 (CET)
Received: from localhost ([::1]:34568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l91VM-0002gE-Eu
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 03:02:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l8zgP-0007hE-Nd; Mon, 08 Feb 2021 01:06:01 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:51367 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l8zgL-0005mo-NI; Mon, 08 Feb 2021 01:06:01 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DYwVs0Tvmz9sVs; Mon,  8 Feb 2021 17:05:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612764341;
 bh=uMV7Stmyuv13sOhlodiLYMsOXgTeJ6kZaiH7Z9qlkfI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dUeovss7hC4U+8JILXsXFPv3T/Z89gVRJlc9gZzLIGfEk3ZB2wJxr1mmDuAqbN6Va
 ma30jsPcZXwrO96/9IlU849t6FgcJQnOWyrGDLQ5YECGcI4suC0kAq3m0KZabhs1zu
 FG+AuC7xJkbrJuYb4+Cr/eBDKxXiJN6y5w3AmpUc=
From: David Gibson <david@gibson.dropbear.id.au>
To: pasic@linux.ibm.com, dgilbert@redhat.com, pair@us.ibm.com,
 qemu-devel@nongnu.org, brijesh.singh@amd.com
Subject: [PULL v9 01/13] qom: Allow optional sugar props
Date: Mon,  8 Feb 2021 17:05:26 +1100
Message-Id: <20210208060538.39276-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208060538.39276-1-david@gibson.dropbear.id.au>
References: <20210208060538.39276-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: mtosatti@redhat.com, kvm@vger.kernel.org, mst@redhat.com,
 frankja@linux.ibm.com, pragyansri.pathi@intel.com,
 David Hildenbrand <david@redhat.com>, mdroth@linux.vnet.ibm.com,
 borntraeger@de.ibm.com, andi.kleen@intel.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, ehabkost@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, jun.nakajima@intel.com,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 cohuck@redhat.com, qemu-ppc@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Global properties have an @optional field, which allows to apply a given
property to a given type even if one of its subclasses doesn't support
it. This is especially used in the compat code when dealing with the
"disable-modern" and "disable-legacy" properties and the "virtio-pci"
type.

Allow object_register_sugar_prop() to set this field as well.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <159738953558.377274.16617742952571083440.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/qom/object.h |  3 ++-
 qom/object.c         |  4 +++-
 softmmu/rtc.c        |  3 ++-
 softmmu/vl.c         | 17 +++++++++++------
 4 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index d378f13a11..6721cd312e 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -638,7 +638,8 @@ bool object_apply_global_props(Object *obj, const GPtrArray *props,
                                Error **errp);
 void object_set_machine_compat_props(GPtrArray *compat_props);
 void object_set_accelerator_compat_props(GPtrArray *compat_props);
-void object_register_sugar_prop(const char *driver, const char *prop, const char *value);
+void object_register_sugar_prop(const char *driver, const char *prop,
+                                const char *value, bool optional);
 void object_apply_compat_props(Object *obj);
 
 /**
diff --git a/qom/object.c b/qom/object.c
index 2fa0119647..491823db4a 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -442,7 +442,8 @@ static GPtrArray *object_compat_props[3];
  * other than "-global".  These are generally used for syntactic
  * sugar and legacy command line options.
  */
-void object_register_sugar_prop(const char *driver, const char *prop, const char *value)
+void object_register_sugar_prop(const char *driver, const char *prop,
+                                const char *value, bool optional)
 {
     GlobalProperty *g;
     if (!object_compat_props[2]) {
@@ -452,6 +453,7 @@ void object_register_sugar_prop(const char *driver, const char *prop, const char
     g->driver = g_strdup(driver);
     g->property = g_strdup(prop);
     g->value = g_strdup(value);
+    g->optional = optional;
     g_ptr_array_add(object_compat_props[2], g);
 }
 
diff --git a/softmmu/rtc.c b/softmmu/rtc.c
index e1e15ef613..5632684fc9 100644
--- a/softmmu/rtc.c
+++ b/softmmu/rtc.c
@@ -179,7 +179,8 @@ void configure_rtc(QemuOpts *opts)
         if (!strcmp(value, "slew")) {
             object_register_sugar_prop("mc146818rtc",
                                        "lost_tick_policy",
-                                       "slew");
+                                       "slew",
+                                       false);
         } else if (!strcmp(value, "none")) {
             /* discard is default */
         } else {
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 2bf94ece9c..0d934844ff 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1663,16 +1663,20 @@ static int machine_set_property(void *opaque,
         return 0;
     }
     if (g_str_equal(qom_name, "igd-passthru")) {
-        object_register_sugar_prop(ACCEL_CLASS_NAME("xen"), qom_name, value);
+        object_register_sugar_prop(ACCEL_CLASS_NAME("xen"), qom_name, value,
+                                   false);
         return 0;
     }
     if (g_str_equal(qom_name, "kvm-shadow-mem")) {
-        object_register_sugar_prop(ACCEL_CLASS_NAME("kvm"), qom_name, value);
+        object_register_sugar_prop(ACCEL_CLASS_NAME("kvm"), qom_name, value,
+                                   false);
         return 0;
     }
     if (g_str_equal(qom_name, "kernel-irqchip")) {
-        object_register_sugar_prop(ACCEL_CLASS_NAME("kvm"), qom_name, value);
-        object_register_sugar_prop(ACCEL_CLASS_NAME("whpx"), qom_name, value);
+        object_register_sugar_prop(ACCEL_CLASS_NAME("kvm"), qom_name, value,
+                                   false);
+        object_register_sugar_prop(ACCEL_CLASS_NAME("whpx"), qom_name, value,
+                                   false);
         return 0;
     }
 
@@ -2298,9 +2302,10 @@ static void qemu_process_sugar_options(void)
 
         val = g_strdup_printf("%d",
                  (uint32_t) qemu_opt_get_number(qemu_find_opts_singleton("smp-opts"), "cpus", 1));
-        object_register_sugar_prop("memory-backend", "prealloc-threads", val);
+        object_register_sugar_prop("memory-backend", "prealloc-threads", val,
+                                   false);
         g_free(val);
-        object_register_sugar_prop("memory-backend", "prealloc", "on");
+        object_register_sugar_prop("memory-backend", "prealloc", "on", false);
     }
 
     if (watchdog) {
-- 
2.29.2



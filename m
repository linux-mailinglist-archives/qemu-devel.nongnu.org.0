Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F0D2CE7C8
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 06:48:54 +0100 (CET)
Received: from localhost ([::1]:41770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl3xd-000171-Mr
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 00:48:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kl3tN-0003rD-1R; Fri, 04 Dec 2020 00:44:29 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:40267 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kl3tJ-0008Tl-4X; Fri, 04 Dec 2020 00:44:27 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CnM8f6LNcz9sSs; Fri,  4 Dec 2020 16:44:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607060658;
 bh=TI0InttZ4cpldxy+Is/TnhjLzGIsGHaeLN81S9U7Zsg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D2OoZAh2yLriCG90unCBwKyMskSc/APR+ROuvB7A5a/UzSm3GKMPtumVEk+EN8dF9
 1N41Mi1ebQNPsiZtXIIjgDar2WWHr27OOQW+E/ox29F+dxRDxo7hORY+JZp+Vtkh7d
 bot4qHvcnMbfOtshTQnIjVYFywa38eiC5mOK9V7I=
From: David Gibson <david@gibson.dropbear.id.au>
To: pair@us.ibm.com, pbonzini@redhat.com, frankja@linux.ibm.com,
 brijesh.singh@amd.com, dgilbert@redhat.com, qemu-devel@nongnu.org
Subject: [for-6.0 v5 01/13] qom: Allow optional sugar props
Date: Fri,  4 Dec 2020 16:44:03 +1100
Message-Id: <20201204054415.579042-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201204054415.579042-1-david@gibson.dropbear.id.au>
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: thuth@redhat.com, cohuck@redhat.com, berrange@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, david@redhat.com,
 mdroth@linux.vnet.ibm.com, Greg Kurz <groug@kaod.org>, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, rth@twiddle.net
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
---
 include/qom/object.h |  3 ++-
 qom/object.c         |  4 +++-
 softmmu/vl.c         | 16 ++++++++++------
 3 files changed, 15 insertions(+), 8 deletions(-)

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
index 1065355233..62218bb17d 100644
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
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index e6e0ad5a92..cf4a9dc198 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -884,7 +884,7 @@ static void configure_rtc(QemuOpts *opts)
         if (!strcmp(value, "slew")) {
             object_register_sugar_prop("mc146818rtc",
                                        "lost_tick_policy",
-                                       "slew");
+                                       "slew", false);
         } else if (!strcmp(value, "none")) {
             /* discard is default */
         } else {
@@ -2498,12 +2498,14 @@ static int machine_set_property(void *opaque,
         return 0;
     }
     if (g_str_equal(qom_name, "igd-passthru")) {
-        object_register_sugar_prop(ACCEL_CLASS_NAME("xen"), qom_name, value);
+        object_register_sugar_prop(ACCEL_CLASS_NAME("xen"), qom_name, value,
+                                   false);
         return 0;
     }
     if (g_str_equal(qom_name, "kvm-shadow-mem") ||
         g_str_equal(qom_name, "kernel-irqchip")) {
-        object_register_sugar_prop(ACCEL_CLASS_NAME("kvm"), qom_name, value);
+        object_register_sugar_prop(ACCEL_CLASS_NAME("kvm"), qom_name, value,
+                                   false);
         return 0;
     }
 
@@ -3645,7 +3647,8 @@ void qemu_init(int argc, char **argv, char **envp)
                 exit(1);
 #endif
                 warn_report("The -tb-size option is deprecated, use -accel tcg,tb-size instead");
-                object_register_sugar_prop(ACCEL_CLASS_NAME("tcg"), "tb-size", optarg);
+                object_register_sugar_prop(ACCEL_CLASS_NAME("tcg"), "tb-size",
+                                           optarg, false);
                 break;
             case QEMU_OPTION_icount:
                 icount_opts = qemu_opts_parse_noisily(qemu_find_opts("icount"),
@@ -3996,9 +3999,10 @@ void qemu_init(int argc, char **argv, char **envp)
         char *val;
 
         val = g_strdup_printf("%d", current_machine->smp.cpus);
-        object_register_sugar_prop("memory-backend", "prealloc-threads", val);
+        object_register_sugar_prop("memory-backend", "prealloc-threads", val,
+                                   false);
         g_free(val);
-        object_register_sugar_prop("memory-backend", "prealloc", "on");
+        object_register_sugar_prop("memory-backend", "prealloc", "on", false);
     }
 
     /*
-- 
2.28.0



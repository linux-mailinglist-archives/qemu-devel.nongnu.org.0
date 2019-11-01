Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84022EBC1E
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Nov 2019 03:58:31 +0100 (CET)
Received: from localhost ([::1]:55518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iQN8w-0006ax-BX
	for lists+qemu-devel@lfdr.de; Thu, 31 Oct 2019 22:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56503)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chen.zhang@intel.com>) id 1iQN6R-0004vs-2V
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 22:55:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chen.zhang@intel.com>) id 1iQN6M-00012f-UC
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 22:55:53 -0400
Received: from mga09.intel.com ([134.134.136.24]:16106)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <chen.zhang@intel.com>)
 id 1iQN6M-0000ZE-KG
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 22:55:50 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Oct 2019 19:55:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,253,1569308400"; d="scan'208";a="199216662"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga008.fm.intel.com with ESMTP; 31 Oct 2019 19:55:41 -0700
From: Zhang Chen <chen.zhang@intel.com >
To: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>
Subject: [PATCH V2 1/4] net/awd.c: Introduce Advanced Watch Dog module
 framework
Date: Fri,  1 Nov 2019 10:48:47 +0800
Message-Id: <20191101024850.20808-2-chen.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191101024850.20808-1-chen.zhang@intel.com>
References: <20191101024850.20808-1-chen.zhang@intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.24
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
Cc: Zhang Chen <chen.zhang@intel.com>, Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Chen <chen.zhang@intel.com>

This patch introduce a new module named Advanced Watch Dog,
and defined the input and output parameter. AWD use standard chardev
as the way of communicationg with the outside world.
If you want to use it, please add "--enable-awd" when configure qemu.

Demo command:
-object advanced-watchdog,id=heart1,server=on,awd_node=h1,notification_node=heartbeat0,opt_script=opt_script_path,iothread=iothread1,pulse_interval=1000,timeout=5000

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 configure         |   9 ++
 net/Makefile.objs |   1 +
 net/awd.c         | 261 ++++++++++++++++++++++++++++++++++++++++++++++
 qemu-options.hx   |   6 ++
 4 files changed, 277 insertions(+)
 create mode 100644 net/awd.c

diff --git a/configure b/configure
index 72553f98ea..a857a8c2d7 100755
--- a/configure
+++ b/configure
@@ -383,6 +383,7 @@ vhost_scsi=""
 vhost_vsock=""
 vhost_user=""
 vhost_user_fs=""
+awd="no"
 kvm="no"
 hax="no"
 hvf="no"
@@ -1303,6 +1304,10 @@ for opt do
   ;;
   --enable-vhost-user-fs) vhost_user_fs="yes"
   ;;
+  --disable-awd) awd="no"
+  ;;
+  --enable-awd) awd="yes"
+  ;;
   --disable-opengl) opengl="no"
   ;;
   --enable-opengl) opengl="yes"
@@ -1779,6 +1784,7 @@ disabled with --disable-FEATURE, default is enabled if available:
   vhost-crypto    vhost-user-crypto backend support
   vhost-kernel    vhost kernel backend support
   vhost-user      vhost-user backend support
+  awd             Advanced Watch Dog support
   spice           spice
   rbd             rados block device (rbd)
   libiscsi        iscsi support
@@ -7002,6 +7008,9 @@ fi
 if test "$vhost_user" = "yes" ; then
   echo "CONFIG_VHOST_USER=y" >> $config_host_mak
 fi
+if test "$awd" = "yes" ; then
+  echo "CONFIG_AWD=y" >> $config_host_mak
+fi
 if test "$vhost_user_fs" = "yes" ; then
   echo "CONFIG_VHOST_USER_FS=y" >> $config_host_mak
 fi
diff --git a/net/Makefile.objs b/net/Makefile.objs
index c5d076d19c..187e655443 100644
--- a/net/Makefile.objs
+++ b/net/Makefile.objs
@@ -19,6 +19,7 @@ common-obj-y += colo-compare.o
 common-obj-y += colo.o
 common-obj-y += filter-rewriter.o
 common-obj-y += filter-replay.o
+common-obj-$(CONFIG_AWD) += awd.o
 
 tap-obj-$(CONFIG_LINUX) = tap-linux.o
 tap-obj-$(CONFIG_BSD) = tap-bsd.o
diff --git a/net/awd.c b/net/awd.c
new file mode 100644
index 0000000000..d42b4a7372
--- /dev/null
+++ b/net/awd.c
@@ -0,0 +1,261 @@
+/*
+ * Advanced Watch Dog
+ *
+ * COarse-grain LOck-stepping Virtual Machines for Non-stop Service (COLO)
+ * (a.k.a. Fault Tolerance or Continuous Replication)
+ *
+ * Copyright (c) 2019 Intel Corporation
+ *
+ * Author: Zhang Chen <chen.zhang@intel.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later.  See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "trace.h"
+#include "qemu-common.h"
+#include "qapi/error.h"
+#include "net/net.h"
+#include "qom/object_interfaces.h"
+#include "qom/object.h"
+#include "chardev/char-fe.h"
+#include "qemu/sockets.h"
+#include "sysemu/iothread.h"
+
+#define TYPE_AWD  "advanced-watchdog"
+#define AWD(obj)  OBJECT_CHECK(AwdState, (obj), TYPE_AWD)
+
+#define AWD_READ_LEN_MAX NET_BUFSIZE
+/* Default advanced watchdog pulse interval */
+#define AWD_PULSE_INTERVAL_DEFAULT 5000
+/* Default advanced watchdog timeout */
+#define AWD_TIMEOUT_DEFAULT 2000
+
+typedef struct AwdState {
+    Object parent;
+
+    bool server;
+    char *awd_node;
+    char *notification_node;
+    char *opt_script;
+    uint32_t pulse_interval;
+    uint32_t timeout;
+    IOThread *iothread;
+} AwdState;
+
+typedef struct AwdClass {
+    ObjectClass parent_class;
+} AwdClass;
+
+static char *awd_get_node(Object *obj, Error **errp)
+{
+    AwdState *s = AWD(obj);
+
+    return g_strdup(s->awd_node);
+}
+
+static void awd_set_node(Object *obj, const char *value, Error **errp)
+{
+    AwdState *s = AWD(obj);
+
+    g_free(s->awd_node);
+    s->awd_node = g_strdup(value);
+}
+
+static char *noti_get_node(Object *obj, Error **errp)
+{
+    AwdState *s = AWD(obj);
+
+    return g_strdup(s->notification_node);
+}
+
+static void noti_set_node(Object *obj, const char *value, Error **errp)
+{
+    AwdState *s = AWD(obj);
+
+    g_free(s->notification_node);
+    s->notification_node = g_strdup(value);
+}
+
+static char *opt_script_get_node(Object *obj, Error **errp)
+{
+    AwdState *s = AWD(obj);
+
+    return g_strdup(s->opt_script);
+}
+
+static void opt_script_set_node(Object *obj, const char *value, Error **errp)
+{
+    AwdState *s = AWD(obj);
+
+    g_free(s->opt_script);
+    s->opt_script = g_strdup(value);
+}
+
+static bool awd_get_server(Object *obj, Error **errp)
+{
+    AwdState *s = AWD(obj);
+
+    return s->server;
+}
+
+static void awd_set_server(Object *obj, bool value, Error **errp)
+{
+    AwdState *s = AWD(obj);
+
+    s->server = value;
+}
+
+static void awd_get_interval(Object *obj, Visitor *v,
+                                   const char *name, void *opaque,
+                                   Error **errp)
+{
+    AwdState *s = AWD(obj);
+    uint32_t value = s->pulse_interval;
+
+    visit_type_uint32(v, name, &value, errp);
+}
+
+static void awd_set_interval(Object *obj, Visitor *v,
+                                   const char *name, void *opaque,
+                                   Error **errp)
+{
+    AwdState *s = AWD(obj);
+    Error *local_err = NULL;
+    uint32_t value;
+
+    visit_type_uint32(v, name, &value, &local_err);
+    if (local_err) {
+        goto out;
+    }
+    if (!value) {
+        error_setg(&local_err, "Property '%s.%s' requires a positive value",
+                   object_get_typename(obj), name);
+        goto out;
+    }
+    s->pulse_interval = value;
+
+out:
+    error_propagate(errp, local_err);
+}
+
+static void awd_get_timeout(Object *obj, Visitor *v,
+                            const char *name, void *opaque,
+                            Error **errp)
+{
+    AwdState *s = AWD(obj);
+    uint32_t value = s->timeout;
+
+    visit_type_uint32(v, name, &value, errp);
+}
+
+static void awd_set_timeout(Object *obj, Visitor *v,
+                            const char *name, void *opaque,
+                            Error **errp)
+{
+    AwdState *s = AWD(obj);
+    Error *local_err = NULL;
+    uint32_t value;
+
+    visit_type_uint32(v, name, &value, &local_err);
+    if (local_err) {
+        goto out;
+    }
+
+    if (!value) {
+        error_setg(&local_err, "Property '%s.%s' requires a positive value",
+                   object_get_typename(obj), name);
+        goto out;
+    }
+    s->timeout = value;
+
+out:
+    error_propagate(errp, local_err);
+}
+
+static void awd_complete(UserCreatable *uc, Error **errp)
+{
+    AwdState *s = AWD(uc);
+
+    if (!s->awd_node || !s->iothread ||
+        !s->notification_node || !s->opt_script) {
+        error_setg(errp, "advanced-watchdog needs 'awd_node', "
+                   "'notification_node', 'opt_script' "
+                   "and 'server' property set");
+        return;
+    }
+
+    return;
+}
+
+static void awd_class_init(ObjectClass *oc, void *data)
+{
+    UserCreatableClass *ucc = USER_CREATABLE_CLASS(oc);
+
+    ucc->complete = awd_complete;
+}
+
+static void awd_init(Object *obj)
+{
+    AwdState *s = AWD(obj);
+
+    object_property_add_str(obj, "awd_node",
+                            awd_get_node, awd_set_node,
+                            NULL);
+
+    object_property_add_str(obj, "notification_node",
+                            noti_get_node, noti_set_node,
+                            NULL);
+
+    object_property_add_str(obj, "opt_script",
+                            opt_script_get_node, opt_script_set_node,
+                            NULL);
+
+    object_property_add_bool(obj, "server",
+                             awd_get_server,
+                             awd_set_server, NULL);
+
+    object_property_add(obj, "pulse_interval", "uint32",
+                        awd_get_interval,
+                        awd_set_interval, NULL, NULL, NULL);
+
+    object_property_add(obj, "timeout", "uint32",
+                        awd_get_timeout,
+                        awd_set_timeout, NULL, NULL, NULL);
+
+    object_property_add_link(obj, "iothread", TYPE_IOTHREAD,
+                            (Object **)&s->iothread,
+                            object_property_allow_set_link,
+                            OBJ_PROP_LINK_STRONG, NULL);
+}
+
+static void awd_finalize(Object *obj)
+{
+    AwdState *s = AWD(obj);
+
+    g_free(s->awd_node);
+    g_free(s->notification_node);
+}
+
+static const TypeInfo awd_info = {
+    .name = TYPE_AWD,
+    .parent = TYPE_OBJECT,
+    .instance_size = sizeof(AwdState),
+    .instance_init = awd_init,
+    .instance_finalize = awd_finalize,
+    .class_size = sizeof(AwdClass),
+    .class_init = awd_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_USER_CREATABLE },
+        { }
+    }
+};
+
+static void register_types(void)
+{
+    type_register_static(&awd_info);
+}
+
+type_init(register_types);
diff --git a/qemu-options.hx b/qemu-options.hx
index 1fc2470e2f..032be8372d 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4572,6 +4572,12 @@ Dump the network traffic on netdev @var{dev} to the file specified by
 The file format is libpcap, so it can be analyzed with tools such as tcpdump
 or Wireshark.
 
+@item -object advanced-watchdog,id=@var{id},awd_node=@var{chardevid},notification_node=@var{chardevid},server=@var{server},iothread=@var{id}[,pulse_interval=@var{time_ms},timeout=@var{time_ms}]
+
+Advanced Watch Dog is an universal monitoring module on VMM side, it can be used to detect network down(VMM to guest, VMM to VMM, VMM to another remote server) and do previously set operation.
+for example: send message to admin, notify another VMM, send qmp command to qemu do some operation like restart the VM, build VMM heartbeat system, etc.
+It make user have basic VM/Host network monitoring tools and basic false tolerance and recovery solution.
+
 @item -object colo-compare,id=@var{id},primary_in=@var{chardevid},secondary_in=@var{chardevid},outdev=@var{chardevid},iothread=@var{id}[,vnet_hdr_support][,notify_dev=@var{id}]
 
 Colo-compare gets packet from primary_in@var{chardevid} and secondary_in@var{chardevid}, than compare primary packet with
-- 
2.17.1



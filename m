Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC8A1C8D15
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 15:56:20 +0200 (CEST)
Received: from localhost ([::1]:58392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWh0d-0006CO-Fz
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 09:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1jWgtU-0003z7-9n
 for qemu-devel@nongnu.org; Thu, 07 May 2020 09:48:56 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:38052
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1jWgtS-0003Ip-9i
 for qemu-devel@nongnu.org; Thu, 07 May 2020 09:48:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588859333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u5j+c2TImbGIqhAmcmscAySueDWf9irIaJXboUVTLsM=;
 b=SqKk3jRds74Egn2JP0AkV5WWDIPV9BZXRK8nWlkCxZ2LxFqhDKUTZLEIJhyHE+2u0XtEWg
 +EJdFvN2dp8dswl+lWaCp0wWn3pMcflc9ZJmJWZmXlHSvORxjaq4g1i/c8vsWG2+3IDFEe
 HRhw4UhBL7ZeiQirR9QbozfMBAWL5Ag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-pttp7b5uNduk6AZ8i0lE4w-1; Thu, 07 May 2020 09:48:49 -0400
X-MC-Unique: pttp7b5uNduk6AZ8i0lE4w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 831B3107ACF4;
 Thu,  7 May 2020 13:48:48 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-114-199.ams2.redhat.com
 [10.36.114.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1E7010013BD;
 Thu,  7 May 2020 13:48:25 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: lvivier@redhat.com,
	qemu-devel@nongnu.org
Subject: [RFC v4 1/6] qmp: add QMP command x-debug-query-virtio
Date: Thu,  7 May 2020 15:47:55 +0200
Message-Id: <20200507134800.10837-2-lvivier@redhat.com>
In-Reply-To: <20200507134800.10837-1-lvivier@redhat.com>
References: <20200507134800.10837-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 02:00:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 qemu-block@nongnu.org, Amit Shah <amit@kernel.org>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This new command lists all the instances of VirtIODevice with
their path and virtio type

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/virtio/Makefile.objs    |  2 ++
 hw/virtio/virtio-stub.c    | 14 ++++++++
 hw/virtio/virtio.c         | 28 ++++++++++++++++
 include/hw/virtio/virtio.h |  1 +
 qapi/Makefile.objs         |  2 +-
 qapi/qapi-schema.json      |  1 +
 qapi/virtio.json           | 68 ++++++++++++++++++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c |  1 +
 8 files changed, 116 insertions(+), 1 deletion(-)
 create mode 100644 hw/virtio/virtio-stub.c
 create mode 100644 qapi/virtio.json

diff --git a/hw/virtio/Makefile.objs b/hw/virtio/Makefile.objs
index 4e4d39a0a48f..0b649f120044 100644
--- a/hw/virtio/Makefile.objs
+++ b/hw/virtio/Makefile.objs
@@ -38,6 +38,8 @@ obj-$(CONFIG_VIRTIO_SERIAL) +=3D virtio-serial-pci.o
 endif
 else
 common-obj-y +=3D vhost-stub.o
+common-obj-y +=3D virtio-stub.o
 endif
=20
 common-obj-$(CONFIG_ALL) +=3D vhost-stub.o
+common-obj-$(CONFIG_ALL) +=3D virtio-stub.o
diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
new file mode 100644
index 000000000000..d4a88f5753a9
--- /dev/null
+++ b/hw/virtio/virtio-stub.c
@@ -0,0 +1,14 @@
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-virtio.h"
+
+static void *qmp_virtio_unsupported(Error **errp)
+{
+    error_setg(errp, "Virtio is disabled");
+    return NULL;
+}
+
+VirtioInfoList *qmp_x_debug_query_virtio(Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index b6c8ef5bc025..05b640bcc267 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -13,6 +13,8 @@
=20
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-commands-virtio.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "cpu.h"
 #include "trace.h"
 #include "exec/address-spaces.h"
@@ -28,6 +30,8 @@
 #include "sysemu/dma.h"
 #include "sysemu/runstate.h"
=20
+static QTAILQ_HEAD(, VirtIODevice) virtio_list;
+
 /*
  * The alignment to use between consumer and producer parts of vring.
  * x86 pagesize again. This is the default, used by transports like PCI
@@ -3628,6 +3632,7 @@ static void virtio_device_realize(DeviceState *dev, E=
rror **errp)
=20
     vdev->listener.commit =3D virtio_memory_listener_commit;
     memory_listener_register(&vdev->listener, vdev->dma_as);
+    QTAILQ_INSERT_TAIL(&virtio_list, vdev, next);
 }
=20
 static void virtio_device_unrealize(DeviceState *dev, Error **errp)
@@ -3646,6 +3651,7 @@ static void virtio_device_unrealize(DeviceState *dev,=
 Error **errp)
         }
     }
=20
+    QTAILQ_REMOVE(&virtio_list, vdev, next);
     g_free(vdev->bus_name);
     vdev->bus_name =3D NULL;
 }
@@ -3802,6 +3808,8 @@ static void virtio_device_class_init(ObjectClass *kla=
ss, void *data)
     vdc->stop_ioeventfd =3D virtio_device_stop_ioeventfd_impl;
=20
     vdc->legacy_features |=3D VIRTIO_LEGACY_FEATURES;
+
+    QTAILQ_INIT(&virtio_list);
 }
=20
 bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
@@ -3812,6 +3820,26 @@ bool virtio_device_ioeventfd_enabled(VirtIODevice *v=
dev)
     return virtio_bus_ioeventfd_enabled(vbus);
 }
=20
+VirtioInfoList *qmp_x_debug_query_virtio(Error **errp)
+{
+    VirtioInfoList *list =3D NULL;
+    VirtioInfoList *node;
+    VirtIODevice *vdev;
+
+    QTAILQ_FOREACH(vdev, &virtio_list, next) {
+        DeviceState *dev =3D DEVICE(vdev);
+        node =3D g_new0(VirtioInfoList, 1);
+        node->value =3D g_new(VirtioInfo, 1);
+        node->value->path =3D g_strdup(dev->canonical_path);
+        node->value->type =3D qapi_enum_parse(&VirtioType_lookup, vdev->na=
me,
+                                            VIRTIO_TYPE_UNKNOWN, NULL);
+        node->next =3D list;
+        list =3D node;
+    }
+
+    return list;
+}
+
 static const TypeInfo virtio_device_info =3D {
     .name =3D TYPE_VIRTIO_DEVICE,
     .parent =3D TYPE_DEVICE,
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index b69d51749635..65adce680188 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -111,6 +111,7 @@ struct VirtIODevice
     bool use_guest_notifier_mask;
     AddressSpace *dma_as;
     QLIST_HEAD(, VirtQueue) *vector_queues;
+    QTAILQ_ENTRY(VirtIODevice) next;
 };
=20
 typedef struct VirtioDeviceClass {
diff --git a/qapi/Makefile.objs b/qapi/Makefile.objs
index 4673ab7490df..4fae2e37cfc9 100644
--- a/qapi/Makefile.objs
+++ b/qapi/Makefile.objs
@@ -8,7 +8,7 @@ util-obj-y +=3D qapi-util.o
 QAPI_COMMON_MODULES =3D audio authz block-core block char common control c=
rypto
 QAPI_COMMON_MODULES +=3D dump error introspect job machine migration misc
 QAPI_COMMON_MODULES +=3D net pragma qdev qom rdma rocker run-state sockets=
 tpm
-QAPI_COMMON_MODULES +=3D trace transaction ui
+QAPI_COMMON_MODULES +=3D trace transaction ui virtio
 QAPI_TARGET_MODULES =3D machine-target misc-target
 QAPI_MODULES =3D $(QAPI_COMMON_MODULES) $(QAPI_TARGET_MODULES)
=20
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 43b0ba0dea22..189f5a0a7383 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -84,3 +84,4 @@
 { 'include': 'misc.json' }
 { 'include': 'misc-target.json' }
 { 'include': 'audio.json' }
+{ 'include': 'virtio.json' }
diff --git a/qapi/virtio.json b/qapi/virtio.json
new file mode 100644
index 000000000000..da59a118dbfb
--- /dev/null
+++ b/qapi/virtio.json
@@ -0,0 +1,68 @@
+##
+# =3D Virtio devices
+##
+
+##
+# @VirtioType:
+#
+# An enumeration of Virtio device types.
+#
+# Since: 5.1.0
+##
+{ 'enum': 'VirtioType',
+  'data': [ 'unknown', 'virtio-9p', 'virtio-blk', 'virtio-serial',
+            'virtio-gpu', 'virtio-input', 'virtio-net', 'virtio-scsi',
+            'vhost-user-fs', 'vhost-vsock', 'virtio-balloon', 'virtio-cryp=
to',
+            'virtio-iommu', 'virtio-pmem', 'virtio-rng' ]
+}
+
+##
+# @VirtioInfo:
+#
+# Information about a given VirtIODevice
+#
+# @path: VirtIO device canonical path.
+#
+# @type: VirtIO device type.
+#
+# Since: 5.1
+#
+##
+{ 'struct': 'VirtioInfo',
+  'data': {
+    'path': 'str',
+    'type': 'VirtioType'
+  }
+}
+
+##
+# @x-debug-query-virtio:
+#
+# Return the list of all VirtIO devices
+#
+# Returns: list of @VirtioInfo
+#
+# Since: 5.1
+#
+# Example:
+#
+# -> { "execute": "x-debug-query-virtio" }
+# <- { "return": [
+#        {
+#            "path": "/machine/peripheral-anon/device[3]/virtio-backend",
+#            "type": "virtio-net"
+#        },
+#        {
+#            "path": "/machine/peripheral-anon/device[1]/virtio-backend",
+#            "type": "virtio-serial"
+#        },
+#        {
+#            "path": "/machine/peripheral-anon/device[0]/virtio-backend",
+#            "type": "virtio-blk"
+#        }
+#      ]
+#    }
+#
+##
+
+{ 'command': 'x-debug-query-virtio', 'returns': ['VirtioInfo'] }
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index 9f5228cd9951..a7bf8aab6357 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -92,6 +92,7 @@ static bool query_is_blacklisted(const char *cmd)
         "query-gic-capabilities", /* arm */
         /* Success depends on target-specific build configuration: */
         "query-pci",              /* CONFIG_PCI */
+        "x-debug-query-virtio",   /* CONFIG_VIRTIO */
         /* Success depends on launching SEV guest */
         "query-sev-launch-measure",
         /* Success depends on Host or Hypervisor SEV support */
--=20
2.26.2



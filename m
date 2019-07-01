Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 267291C72C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 12:44:52 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45156 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQUvT-0007EP-9y
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 06:44:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1hQUsr-00067t-Ue
	for qemu-devel@nongnu.org; Tue, 14 May 2019 06:42:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1hQUsp-0001gC-TC
	for qemu-devel@nongnu.org; Tue, 14 May 2019 06:42:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57302)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1hQUsp-0001fA-Lh
	for qemu-devel@nongnu.org; Tue, 14 May 2019 06:42:07 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0C6FE307D976
	for <qemu-devel@nongnu.org>; Tue, 14 May 2019 10:42:07 +0000 (UTC)
Received: from localhost (unknown [10.36.112.10])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 21F3D5D706;
	Tue, 14 May 2019 10:41:57 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 14 May 2019 12:41:26 +0200
Message-Id: <20190514104126.6294-4-marcandre.lureau@redhat.com>
In-Reply-To: <20190514104126.6294-1-marcandre.lureau@redhat.com>
References: <20190514104126.6294-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Tue, 14 May 2019 10:42:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 3/3] contrib: add vhost-user-input
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a vhost-user input backend example, based on virtio-input-host
device. It takes an evdev path as argument, and can be associated with
a vhost-user-input device via a UNIX socket:

$ vhost-user-input -p /dev/input/eventX -s /tmp/vui.sock

$ qemu ... -chardev socket,id=3Dvuic,path=3D/tmp/vui.sock
  -device vhost-user-input-pci,chardev=3Dvuic

This example is intentionally not included in $TOOLS, and not
installed by default.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 contrib/vhost-user-input/main.c        | 393 +++++++++++++++++++++++++
 MAINTAINERS                            |   1 +
 Makefile                               |  11 +
 Makefile.objs                          |   1 +
 contrib/vhost-user-input/Makefile.objs |   1 +
 5 files changed, 407 insertions(+)
 create mode 100644 contrib/vhost-user-input/main.c
 create mode 100644 contrib/vhost-user-input/Makefile.objs

diff --git a/contrib/vhost-user-input/main.c b/contrib/vhost-user-input/m=
ain.c
new file mode 100644
index 0000000000..8d493f598e
--- /dev/null
+++ b/contrib/vhost-user-input/main.c
@@ -0,0 +1,393 @@
+/*
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * (at your option) any later version.  See the COPYING file in the
+ * top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include <glib.h>
+#include <linux/input.h>
+
+#include "qemu/iov.h"
+#include "qemu/bswap.h"
+#include "qemu/sockets.h"
+#include "contrib/libvhost-user/libvhost-user.h"
+#include "contrib/libvhost-user/libvhost-user-glib.h"
+#include "standard-headers/linux/virtio_input.h"
+#include "qapi/error.h"
+
+typedef struct virtio_input_event virtio_input_event;
+typedef struct virtio_input_config virtio_input_config;
+
+typedef struct VuInput {
+    VugDev dev;
+    GSource *evsrc;
+    int evdevfd;
+    GArray *config;
+    virtio_input_config *sel_config;
+    struct {
+        virtio_input_event event;
+        VuVirtqElement *elem;
+    } *queue;
+    uint32_t qindex, qsize;
+} VuInput;
+
+static void vi_input_send(VuInput *vi, struct virtio_input_event *event)
+{
+    VuDev *dev =3D &vi->dev.parent;
+    VuVirtq *vq =3D vu_get_queue(dev, 0);
+    VuVirtqElement *elem;
+    int i, len;
+
+    /* queue up events ... */
+    if (vi->qindex =3D=3D vi->qsize) {
+        vi->qsize++;
+        vi->queue =3D g_realloc_n(vi->queue, vi->qsize, sizeof(vi->queue=
[0]));
+    }
+    vi->queue[vi->qindex++].event =3D *event;
+
+    /* ... until we see a report sync ... */
+    if (event->type !=3D htole16(EV_SYN) ||
+        event->code !=3D htole16(SYN_REPORT)) {
+        return;
+    }
+
+    /* ... then check available space ... */
+    for (i =3D 0; i < vi->qindex; i++) {
+        elem =3D vu_queue_pop(dev, vq, sizeof(VuVirtqElement));
+        if (!elem) {
+            while (--i >=3D 0) {
+                vu_queue_unpop(dev, vq, vi->queue[i].elem, 0);
+            }
+            vi->qindex =3D 0;
+            g_warning("virtio-input queue full");
+            return;
+        }
+        vi->queue[i].elem =3D elem;
+    }
+
+    /* ... and finally pass them to the guest */
+    for (i =3D 0; i < vi->qindex; i++) {
+        elem =3D vi->queue[i].elem;
+        len =3D iov_from_buf(elem->in_sg, elem->in_num,
+                           0, &vi->queue[i].event, sizeof(virtio_input_e=
vent));
+        vu_queue_push(dev, vq, elem, len);
+        g_free(elem);
+    }
+
+    vu_queue_notify(&vi->dev.parent, vq);
+    vi->qindex =3D 0;
+}
+
+static void
+vi_evdev_watch(VuDev *dev, int condition, void *data)
+{
+    VuInput *vi =3D data;
+    int fd =3D vi->evdevfd;
+
+    g_debug("Got evdev condition %x", condition);
+
+    struct virtio_input_event virtio;
+    struct input_event evdev;
+    int rc;
+
+    for (;;) {
+        rc =3D read(fd, &evdev, sizeof(evdev));
+        if (rc !=3D sizeof(evdev)) {
+            break;
+        }
+
+        g_debug("input %d %d %d", evdev.type, evdev.code, evdev.value);
+
+        virtio.type  =3D htole16(evdev.type);
+        virtio.code  =3D htole16(evdev.code);
+        virtio.value =3D htole32(evdev.value);
+        vi_input_send(vi, &virtio);
+    }
+}
+
+
+static void vi_handle_status(VuInput *vi, virtio_input_event *event)
+{
+    struct input_event evdev;
+    int rc;
+
+    if (gettimeofday(&evdev.time, NULL)) {
+        perror("vi_handle_status: gettimeofday");
+        return;
+    }
+
+    evdev.type =3D le16toh(event->type);
+    evdev.code =3D le16toh(event->code);
+    evdev.value =3D le32toh(event->value);
+
+    rc =3D write(vi->evdevfd, &evdev, sizeof(evdev));
+    if (rc =3D=3D -1) {
+        perror("vi_host_handle_status: write");
+    }
+}
+
+static void vi_handle_sts(VuDev *dev, int qidx)
+{
+    VuInput *vi =3D container_of(dev, VuInput, dev.parent);
+    VuVirtq *vq =3D vu_get_queue(dev, qidx);
+    virtio_input_event event;
+    VuVirtqElement *elem;
+    int len;
+
+    g_debug("%s", G_STRFUNC);
+
+    for (;;) {
+        elem =3D vu_queue_pop(dev, vq, sizeof(VuVirtqElement));
+        if (!elem) {
+            break;
+        }
+
+        memset(&event, 0, sizeof(event));
+        len =3D iov_to_buf(elem->out_sg, elem->out_num,
+                         0, &event, sizeof(event));
+        vi_handle_status(vi, &event);
+        vu_queue_push(dev, vq, elem, len);
+        g_free(elem);
+    }
+
+    vu_queue_notify(&vi->dev.parent, vq);
+}
+
+static void
+vi_panic(VuDev *dev, const char *msg)
+{
+    g_critical("%s\n", msg);
+    exit(EXIT_FAILURE);
+}
+
+static void
+vi_queue_set_started(VuDev *dev, int qidx, bool started)
+{
+    VuInput *vi =3D container_of(dev, VuInput, dev.parent);
+    VuVirtq *vq =3D vu_get_queue(dev, qidx);
+
+    g_debug("queue started %d:%d", qidx, started);
+
+    if (qidx =3D=3D 1) {
+        vu_set_queue_handler(dev, vq, started ? vi_handle_sts : NULL);
+    }
+
+    started =3D vu_queue_started(dev, vu_get_queue(dev, 0)) &&
+        vu_queue_started(dev, vu_get_queue(dev, 1));
+
+    if (started && !vi->evsrc) {
+        vi->evsrc =3D vug_source_new(&vi->dev, vi->evdevfd,
+                                   G_IO_IN, vi_evdev_watch, vi);
+    }
+
+    if (!started && vi->evsrc) {
+        g_source_destroy(vi->evsrc);
+        vi->evsrc =3D NULL;
+    }
+}
+
+static virtio_input_config *
+vi_find_config(VuInput *vi, uint8_t select, uint8_t subsel)
+{
+    virtio_input_config *cfg;
+    int i;
+
+    for (i =3D 0; i < vi->config->len; i++) {
+        cfg =3D &g_array_index(vi->config, virtio_input_config, i);
+        if (select =3D=3D cfg->select && subsel =3D=3D cfg->subsel) {
+            return cfg;
+        }
+    }
+
+    return NULL;
+}
+
+static int vi_get_config(VuDev *dev, uint8_t *config, uint32_t len)
+{
+    VuInput *vi =3D container_of(dev, VuInput, dev.parent);
+
+    g_return_val_if_fail(len <=3D sizeof(*vi->sel_config), -1);
+
+    if (vi->sel_config) {
+        memcpy(config, vi->sel_config, len);
+    } else {
+        memset(config, 0, len);
+    }
+
+    return 0;
+}
+
+static int vi_set_config(VuDev *dev, const uint8_t *data,
+                         uint32_t offset, uint32_t size,
+                         uint32_t flags)
+{
+    VuInput *vi =3D container_of(dev, VuInput, dev.parent);
+    virtio_input_config *config =3D (virtio_input_config *)data;
+
+    vi->sel_config =3D vi_find_config(vi, config->select, config->subsel=
);
+
+    return 0;
+}
+
+static const VuDevIface vuiface =3D {
+    .queue_set_started =3D vi_queue_set_started,
+    .get_config =3D vi_get_config,
+    .set_config =3D vi_set_config,
+};
+
+static void
+vi_bits_config(VuInput *vi, int type, int count)
+{
+    virtio_input_config bits;
+    int rc, i, size =3D 0;
+
+    memset(&bits, 0, sizeof(bits));
+    rc =3D ioctl(vi->evdevfd, EVIOCGBIT(type, count / 8), bits.u.bitmap)=
;
+    if (rc < 0) {
+        return;
+    }
+
+    for (i =3D 0; i < count / 8; i++) {
+        if (bits.u.bitmap[i]) {
+            size =3D i + 1;
+        }
+    }
+    if (size =3D=3D 0) {
+        return;
+    }
+
+    bits.select =3D VIRTIO_INPUT_CFG_EV_BITS;
+    bits.subsel =3D type;
+    bits.size   =3D size;
+    g_array_append_val(vi->config, bits);
+}
+
+static char *opt_evdev;
+static int opt_fdnum =3D -1;
+static char *opt_socket_path;
+static gboolean opt_nograb;
+static gboolean opt_print_caps;
+
+static GOptionEntry entries[] =3D {
+    { "print-capabilities", 'c', 0, G_OPTION_ARG_NONE, &opt_print_caps,
+      "Print capabilities", NULL },
+    { "no-grab", 'n', 0, G_OPTION_ARG_NONE, &opt_nograb,
+      "Don't grab device", NULL },
+    { "fd", 'f', 0, G_OPTION_ARG_INT, &opt_fdnum,
+      "Use inherited fd socket", "FDNUM" },
+    { "socket-path", 's', 0, G_OPTION_ARG_FILENAME, &opt_socket_path,
+      "Use UNIX socket path", "PATH" },
+    { "evdev-path", 'p', 0, G_OPTION_ARG_FILENAME, &opt_evdev,
+      "evdev input device path", "PATH" },
+    { NULL, }
+};
+
+int
+main(int argc, char *argv[])
+{
+    GMainLoop *loop =3D NULL;
+    VuInput vi =3D { 0, };
+    int rc, ver, fd;
+    virtio_input_config id;
+    struct input_id ids;
+    GError *error =3D NULL;
+    GOptionContext *context;
+
+    context =3D g_option_context_new(NULL);
+    g_option_context_add_main_entries(context, entries, NULL);
+    if (!g_option_context_parse(context, &argc, &argv, &error)) {
+        g_printerr("Option parsing failed: %s\n", error->message);
+        exit(EXIT_FAILURE);
+    }
+    if (opt_print_caps) {
+        g_print("{\n");
+        g_print("  \"type\": \"input\",\n");
+        g_print("  \"features\": [\n");
+        g_print("    \"evdev-path\",\n");
+        g_print("    \"no-grab\"\n");
+        g_print("  ]\n");
+        g_print("}\n");
+        exit(EXIT_SUCCESS);
+    }
+    if (!opt_evdev) {
+        g_printerr("Please specify an evdev path\n");
+        exit(EXIT_FAILURE);
+    }
+    if ((!!opt_socket_path + (opt_fdnum !=3D -1)) !=3D 1) {
+        g_printerr("Please specify either --fd or --socket-path\n");
+        exit(EXIT_FAILURE);
+    }
+
+    vi.evdevfd =3D open(opt_evdev, O_RDWR);
+    if (vi.evdevfd < 0) {
+        g_printerr("Failed to open evdev: %s\n", g_strerror(errno));
+        exit(EXIT_FAILURE);
+    }
+
+    rc =3D ioctl(vi.evdevfd, EVIOCGVERSION, &ver);
+    if (rc < 0) {
+        g_printerr("%s: is not an evdev device\n", argv[1]);
+        exit(EXIT_FAILURE);
+    }
+
+    if (!opt_nograb) {
+        rc =3D ioctl(vi.evdevfd, EVIOCGRAB, 1);
+        if (rc < 0) {
+            g_printerr("Failed to grab device\n");
+            exit(EXIT_FAILURE);
+        }
+    }
+
+    vi.config =3D g_array_new(false, false, sizeof(virtio_input_config))=
;
+    memset(&id, 0, sizeof(id));
+    ioctl(vi.evdevfd, EVIOCGNAME(sizeof(id.u.string) - 1), id.u.string);
+    id.select =3D VIRTIO_INPUT_CFG_ID_NAME;
+    id.size =3D strlen(id.u.string);
+    g_array_append_val(vi.config, id);
+
+    if (ioctl(vi.evdevfd, EVIOCGID, &ids) =3D=3D 0) {
+        memset(&id, 0, sizeof(id));
+        id.select =3D VIRTIO_INPUT_CFG_ID_DEVIDS;
+        id.size =3D sizeof(struct virtio_input_devids);
+        id.u.ids.bustype =3D cpu_to_le16(ids.bustype);
+        id.u.ids.vendor  =3D cpu_to_le16(ids.vendor);
+        id.u.ids.product =3D cpu_to_le16(ids.product);
+        id.u.ids.version =3D cpu_to_le16(ids.version);
+        g_array_append_val(vi.config, id);
+    }
+
+    vi_bits_config(&vi, EV_KEY, KEY_CNT);
+    vi_bits_config(&vi, EV_REL, REL_CNT);
+    vi_bits_config(&vi, EV_ABS, ABS_CNT);
+    vi_bits_config(&vi, EV_MSC, MSC_CNT);
+    vi_bits_config(&vi, EV_SW,  SW_CNT);
+    g_debug("config length: %u", vi.config->len);
+
+    if (opt_socket_path) {
+        int lsock =3D unix_listen(opt_socket_path, &error_fatal);
+        fd =3D accept(lsock, NULL, NULL);
+        close(lsock);
+    } else {
+        fd =3D opt_fdnum;
+    }
+    if (fd =3D=3D -1) {
+        g_printerr("Invalid socket");
+        exit(EXIT_FAILURE);
+    }
+    vug_init(&vi.dev, fd, vi_panic, &vuiface);
+
+    loop =3D g_main_loop_new(NULL, FALSE);
+    g_main_loop_run(loop);
+    g_main_loop_unref(loop);
+
+    vug_deinit(&vi.dev);
+
+    if (vi.evsrc) {
+        g_source_unref(vi.evsrc);
+    }
+    g_array_free(vi.config, TRUE);
+    g_free(vi.queue);
+    return 0;
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index a73a61a546..8a87bc176d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1531,6 +1531,7 @@ S: Maintained
 F: hw/input/vhost-user-input.c
 F: hw/input/virtio-input*.c
 F: include/hw/virtio/virtio-input.h
+F: contrib/vhost-user-input/*
=20
 virtio-serial
 M: Amit Shah <amit@kernel.org>
diff --git a/Makefile b/Makefile
index 66d5c65156..fe5c02f9a3 100644
--- a/Makefile
+++ b/Makefile
@@ -406,6 +406,7 @@ dummy :=3D $(call unnest-vars,, \
                 libvhost-user-obj-y \
                 vhost-user-scsi-obj-y \
                 vhost-user-blk-obj-y \
+                vhost-user-input-obj-y \
                 qga-vss-dll-obj-y \
                 block-obj-y \
                 block-obj-m \
@@ -615,6 +616,16 @@ rdmacm-mux$(EXESUF): LIBS +=3D "-libumad"
 rdmacm-mux$(EXESUF): $(rdmacm-mux-obj-y) $(COMMON_LDADDS)
 	$(call LINK, $^)
=20
+ifdef CONFIG_VHOST_USER_INPUT
+ifdef CONFIG_LINUX
+vhost-user-input$(EXESUF): $(vhost-user-input-obj-y) libvhost-user.a lib=
qemuutil.a
+	$(call LINK, $^)
+
+# build by default, do not install
+all: vhost-user-input$(EXESUF)
+endif
+endif
+
 module_block.h: $(SRC_PATH)/scripts/modules/module_block.py config-host.=
mak
 	$(call quiet-command,$(PYTHON) $< $@ \
 	$(addprefix $(SRC_PATH)/,$(patsubst %.mo,%.c,$(block-obj-m))), \
diff --git a/Makefile.objs b/Makefile.objs
index cf065de5ed..27502b7df1 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -122,6 +122,7 @@ vhost-user-scsi.o-libs :=3D $(LIBISCSI_LIBS)
 vhost-user-scsi-obj-y =3D contrib/vhost-user-scsi/
 vhost-user-blk-obj-y =3D contrib/vhost-user-blk/
 rdmacm-mux-obj-y =3D contrib/rdmacm-mux/
+vhost-user-input-obj-y =3D contrib/vhost-user-input/
=20
 ######################################################################
 trace-events-subdirs =3D
diff --git a/contrib/vhost-user-input/Makefile.objs b/contrib/vhost-user-=
input/Makefile.objs
new file mode 100644
index 0000000000..b1fad90d51
--- /dev/null
+++ b/contrib/vhost-user-input/Makefile.objs
@@ -0,0 +1 @@
+vhost-user-input-obj-y =3D main.o
--=20
2.21.0.777.g83232e3864



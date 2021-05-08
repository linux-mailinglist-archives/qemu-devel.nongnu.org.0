Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0533B37705E
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 09:24:18 +0200 (CEST)
Received: from localhost ([::1]:49022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfHJx-0000zG-08
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 03:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lfHEx-0007V6-IZ
 for qemu-devel@nongnu.org; Sat, 08 May 2021 03:19:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lfHEr-0003QH-D4
 for qemu-devel@nongnu.org; Sat, 08 May 2021 03:19:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620458340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=VpiT5X4NicxNoEyi7g2/T18Qp8BnEy31oJa8Oc7lbrI=;
 b=QwLXV6L2cbi5Utd1IoE4/qbN6BIDHp9cRpvj6InFh0vW6X/WiQf9v+PBKxb6NKNTT4SGAP
 8ZiBKpbdTskKP9jsxQqS2kvqD+L4TFtAl/zX3Ti1S82gp/tC2+wdhbEj57506tdX4n35ac
 1yCn21kYLCYNyXzJjoffRTAKf5U1c+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-JB-0rSO3PqCMlCMa5G8tLg-1; Sat, 08 May 2021 03:18:58 -0400
X-MC-Unique: JB-0rSO3PqCMlCMa5G8tLg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56F4610066E5;
 Sat,  8 May 2021 07:18:57 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-172.pek2.redhat.com
 [10.72.13.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 299195C5FD;
 Sat,  8 May 2021 07:18:54 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 04/10] ebpf: Added eBPF RSS loader.
Date: Sat,  8 May 2021 15:18:33 +0800
Message-Id: <1620458319-5670-5-git-send-email-jasowang@redhat.com>
In-Reply-To: <1620458319-5670-1-git-send-email-jasowang@redhat.com>
References: <1620458319-5670-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Melnychenko <andrew@daynix.com>

Added function that loads RSS eBPF program.
Added stub functions for RSS eBPF loader.
Added meson and configuration options.

By default, eBPF feature enabled if libbpf is present in the build system.
libbpf checked in configuration shell script and meson script.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 configure               |   8 +-
 ebpf/ebpf_rss-stub.c    |  40 +++++
 ebpf/ebpf_rss.c         | 165 ++++++++++++++++++
 ebpf/ebpf_rss.h         |  44 +++++
 ebpf/meson.build        |   1 +
 ebpf/rss.bpf.skeleton.h | 431 ++++++++++++++++++++++++++++++++++++++++++++++++
 ebpf/trace-events       |   4 +
 ebpf/trace.h            |   1 +
 meson.build             |  23 +++
 meson_options.txt       |   2 +
 10 files changed, 718 insertions(+), 1 deletion(-)
 create mode 100644 ebpf/ebpf_rss-stub.c
 create mode 100644 ebpf/ebpf_rss.c
 create mode 100644 ebpf/ebpf_rss.h
 create mode 100644 ebpf/meson.build
 create mode 100644 ebpf/rss.bpf.skeleton.h
 create mode 100644 ebpf/trace-events
 create mode 100644 ebpf/trace.h

diff --git a/configure b/configure
index 4f374b4..7d9e039 100755
--- a/configure
+++ b/configure
@@ -348,6 +348,7 @@ vhost_vsock="$default_feature"
 vhost_user="no"
 vhost_user_blk_server="auto"
 vhost_user_fs="$default_feature"
+bpf="auto"
 kvm="auto"
 hax="auto"
 hvf="auto"
@@ -1228,6 +1229,10 @@ for opt do
   ;;
   --enable-membarrier) membarrier="yes"
   ;;
+  --disable-bpf) bpf="disabled"
+  ;;
+  --enable-bpf) bpf="enabled"
+  ;;
   --disable-blobs) blobs="false"
   ;;
   --with-pkgversion=*) pkgversion="$optarg"
@@ -1865,6 +1870,7 @@ disabled with --disable-FEATURE, default is enabled if available
   vhost-user      vhost-user backend support
   vhost-user-blk-server    vhost-user-blk server support
   vhost-vdpa      vhost-vdpa kernel backend support
+  bpf             BPF kernel support
   spice           spice
   rbd             rados block device (rbd)
   libiscsi        iscsi support
@@ -6423,7 +6429,7 @@ NINJA=$ninja $meson setup \
         -Dattr=$attr -Ddefault_devices=$default_devices \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server -Dmultiprocess=$multiprocess \
-        -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek -Dguest_agent_msi=$guest_agent_msi \
+        -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek -Dguest_agent_msi=$guest_agent_msi -Dbpf=$bpf\
         $(if test "$default_features" = no; then echo "-Dauto_features=disabled"; fi) \
 	-Dtcg_interpreter=$tcg_interpreter \
         $cross_arg \
diff --git a/ebpf/ebpf_rss-stub.c b/ebpf/ebpf_rss-stub.c
new file mode 100644
index 0000000..e71e2291
--- /dev/null
+++ b/ebpf/ebpf_rss-stub.c
@@ -0,0 +1,40 @@
+/*
+ * eBPF RSS stub file
+ *
+ * Developed by Daynix Computing LTD (http://www.daynix.com)
+ *
+ * Authors:
+ *  Yuri Benditovich <yuri.benditovich@daynix.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "ebpf/ebpf_rss.h"
+
+void ebpf_rss_init(struct EBPFRSSContext *ctx)
+{
+
+}
+
+bool ebpf_rss_is_loaded(struct EBPFRSSContext *ctx)
+{
+    return false;
+}
+
+bool ebpf_rss_load(struct EBPFRSSContext *ctx)
+{
+    return false;
+}
+
+bool ebpf_rss_set_all(struct EBPFRSSContext *ctx, struct EBPFRSSConfig *config,
+                      uint16_t *indirections_table, uint8_t *toeplitz_key)
+{
+    return false;
+}
+
+void ebpf_rss_unload(struct EBPFRSSContext *ctx)
+{
+
+}
diff --git a/ebpf/ebpf_rss.c b/ebpf/ebpf_rss.c
new file mode 100644
index 0000000..118c68d
--- /dev/null
+++ b/ebpf/ebpf_rss.c
@@ -0,0 +1,165 @@
+/*
+ * eBPF RSS loader
+ *
+ * Developed by Daynix Computing LTD (http://www.daynix.com)
+ *
+ * Authors:
+ *  Andrew Melnychenko <andrew@daynix.com>
+ *  Yuri Benditovich <yuri.benditovich@daynix.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+
+#include <bpf/libbpf.h>
+#include <bpf/bpf.h>
+
+#include "hw/virtio/virtio-net.h" /* VIRTIO_NET_RSS_MAX_TABLE_LEN */
+
+#include "ebpf/ebpf_rss.h"
+#include "ebpf/rss.bpf.skeleton.h"
+#include "trace.h"
+
+void ebpf_rss_init(struct EBPFRSSContext *ctx)
+{
+    if (ctx != NULL) {
+        ctx->obj = NULL;
+    }
+}
+
+bool ebpf_rss_is_loaded(struct EBPFRSSContext *ctx)
+{
+    return ctx != NULL && ctx->obj != NULL;
+}
+
+bool ebpf_rss_load(struct EBPFRSSContext *ctx)
+{
+    struct rss_bpf *rss_bpf_ctx;
+
+    if (ctx == NULL) {
+        return false;
+    }
+
+    rss_bpf_ctx = rss_bpf__open();
+    if (rss_bpf_ctx == NULL) {
+        trace_ebpf_error("eBPF RSS", "can not open eBPF RSS object");
+        goto error;
+    }
+
+    bpf_program__set_socket_filter(rss_bpf_ctx->progs.tun_rss_steering_prog);
+
+    if (rss_bpf__load(rss_bpf_ctx)) {
+        trace_ebpf_error("eBPF RSS", "can not load RSS program");
+        goto error;
+    }
+
+    ctx->obj = rss_bpf_ctx;
+    ctx->program_fd = bpf_program__fd(
+            rss_bpf_ctx->progs.tun_rss_steering_prog);
+    ctx->map_configuration = bpf_map__fd(
+            rss_bpf_ctx->maps.tap_rss_map_configurations);
+    ctx->map_indirections_table = bpf_map__fd(
+            rss_bpf_ctx->maps.tap_rss_map_indirection_table);
+    ctx->map_toeplitz_key = bpf_map__fd(
+            rss_bpf_ctx->maps.tap_rss_map_toeplitz_key);
+
+    return true;
+error:
+    rss_bpf__destroy(rss_bpf_ctx);
+    ctx->obj = NULL;
+
+    return false;
+}
+
+static bool ebpf_rss_set_config(struct EBPFRSSContext *ctx,
+                                struct EBPFRSSConfig *config)
+{
+    uint32_t map_key = 0;
+
+    if (!ebpf_rss_is_loaded(ctx)) {
+        return false;
+    }
+    if (bpf_map_update_elem(ctx->map_configuration,
+                            &map_key, config, 0) < 0) {
+        return false;
+    }
+    return true;
+}
+
+static bool ebpf_rss_set_indirections_table(struct EBPFRSSContext *ctx,
+                                            uint16_t *indirections_table,
+                                            size_t len)
+{
+    uint32_t i = 0;
+
+    if (!ebpf_rss_is_loaded(ctx) || indirections_table == NULL ||
+       len > VIRTIO_NET_RSS_MAX_TABLE_LEN) {
+        return false;
+    }
+
+    for (; i < len; ++i) {
+        if (bpf_map_update_elem(ctx->map_indirections_table, &i,
+                                indirections_table + i, 0) < 0) {
+            return false;
+        }
+    }
+    return true;
+}
+
+static bool ebpf_rss_set_toepliz_key(struct EBPFRSSContext *ctx,
+                                     uint8_t *toeplitz_key)
+{
+    uint32_t map_key = 0;
+
+    /* prepare toeplitz key */
+    uint8_t toe[VIRTIO_NET_RSS_MAX_KEY_SIZE] = {};
+
+    if (!ebpf_rss_is_loaded(ctx) || toeplitz_key == NULL) {
+        return false;
+    }
+    memcpy(toe, toeplitz_key, VIRTIO_NET_RSS_MAX_KEY_SIZE);
+    *(uint32_t *)toe = ntohl(*(uint32_t *)toe);
+
+    if (bpf_map_update_elem(ctx->map_toeplitz_key, &map_key, toe,
+                            0) < 0) {
+        return false;
+    }
+    return true;
+}
+
+bool ebpf_rss_set_all(struct EBPFRSSContext *ctx, struct EBPFRSSConfig *config,
+                      uint16_t *indirections_table, uint8_t *toeplitz_key)
+{
+    if (!ebpf_rss_is_loaded(ctx) || config == NULL ||
+        indirections_table == NULL || toeplitz_key == NULL) {
+        return false;
+    }
+
+    if (!ebpf_rss_set_config(ctx, config)) {
+        return false;
+    }
+
+    if (!ebpf_rss_set_indirections_table(ctx, indirections_table,
+                                      config->indirections_len)) {
+        return false;
+    }
+
+    if (!ebpf_rss_set_toepliz_key(ctx, toeplitz_key)) {
+        return false;
+    }
+
+    return true;
+}
+
+void ebpf_rss_unload(struct EBPFRSSContext *ctx)
+{
+    if (!ebpf_rss_is_loaded(ctx)) {
+        return;
+    }
+
+    rss_bpf__destroy(ctx->obj);
+    ctx->obj = NULL;
+}
diff --git a/ebpf/ebpf_rss.h b/ebpf/ebpf_rss.h
new file mode 100644
index 0000000..bf3f257
--- /dev/null
+++ b/ebpf/ebpf_rss.h
@@ -0,0 +1,44 @@
+/*
+ * eBPF RSS header
+ *
+ * Developed by Daynix Computing LTD (http://www.daynix.com)
+ *
+ * Authors:
+ *  Andrew Melnychenko <andrew@daynix.com>
+ *  Yuri Benditovich <yuri.benditovich@daynix.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef QEMU_EBPF_RSS_H
+#define QEMU_EBPF_RSS_H
+
+struct EBPFRSSContext {
+    void *obj;
+    int program_fd;
+    int map_configuration;
+    int map_toeplitz_key;
+    int map_indirections_table;
+};
+
+struct EBPFRSSConfig {
+    uint8_t redirect;
+    uint8_t populate_hash;
+    uint32_t hash_types;
+    uint16_t indirections_len;
+    uint16_t default_queue;
+} __attribute__((packed));
+
+void ebpf_rss_init(struct EBPFRSSContext *ctx);
+
+bool ebpf_rss_is_loaded(struct EBPFRSSContext *ctx);
+
+bool ebpf_rss_load(struct EBPFRSSContext *ctx);
+
+bool ebpf_rss_set_all(struct EBPFRSSContext *ctx, struct EBPFRSSConfig *config,
+                      uint16_t *indirections_table, uint8_t *toeplitz_key);
+
+void ebpf_rss_unload(struct EBPFRSSContext *ctx);
+
+#endif /* QEMU_EBPF_RSS_H */
diff --git a/ebpf/meson.build b/ebpf/meson.build
new file mode 100644
index 0000000..9cd0635
--- /dev/null
+++ b/ebpf/meson.build
@@ -0,0 +1 @@
+common_ss.add(when: libbpf, if_true: files('ebpf_rss.c'), if_false: files('ebpf_rss-stub.c'))
diff --git a/ebpf/rss.bpf.skeleton.h b/ebpf/rss.bpf.skeleton.h
new file mode 100644
index 0000000..126683e
--- /dev/null
+++ b/ebpf/rss.bpf.skeleton.h
@@ -0,0 +1,431 @@
+/* SPDX-License-Identifier: (LGPL-2.1 OR BSD-2-Clause) */
+
+/* THIS FILE IS AUTOGENERATED! */
+#ifndef __RSS_BPF_SKEL_H__
+#define __RSS_BPF_SKEL_H__
+
+#include <stdlib.h>
+#include <bpf/libbpf.h>
+
+struct rss_bpf {
+	struct bpf_object_skeleton *skeleton;
+	struct bpf_object *obj;
+	struct {
+		struct bpf_map *tap_rss_map_configurations;
+		struct bpf_map *tap_rss_map_indirection_table;
+		struct bpf_map *tap_rss_map_toeplitz_key;
+	} maps;
+	struct {
+		struct bpf_program *tun_rss_steering_prog;
+	} progs;
+	struct {
+		struct bpf_link *tun_rss_steering_prog;
+	} links;
+};
+
+static void
+rss_bpf__destroy(struct rss_bpf *obj)
+{
+	if (!obj)
+		return;
+	if (obj->skeleton)
+		bpf_object__destroy_skeleton(obj->skeleton);
+	free(obj);
+}
+
+static inline int
+rss_bpf__create_skeleton(struct rss_bpf *obj);
+
+static inline struct rss_bpf *
+rss_bpf__open_opts(const struct bpf_object_open_opts *opts)
+{
+	struct rss_bpf *obj;
+
+	obj = (struct rss_bpf *)calloc(1, sizeof(*obj));
+	if (!obj)
+		return NULL;
+	if (rss_bpf__create_skeleton(obj))
+		goto err;
+	if (bpf_object__open_skeleton(obj->skeleton, opts))
+		goto err;
+
+	return obj;
+err:
+	rss_bpf__destroy(obj);
+	return NULL;
+}
+
+static inline struct rss_bpf *
+rss_bpf__open(void)
+{
+	return rss_bpf__open_opts(NULL);
+}
+
+static inline int
+rss_bpf__load(struct rss_bpf *obj)
+{
+	return bpf_object__load_skeleton(obj->skeleton);
+}
+
+static inline struct rss_bpf *
+rss_bpf__open_and_load(void)
+{
+	struct rss_bpf *obj;
+
+	obj = rss_bpf__open();
+	if (!obj)
+		return NULL;
+	if (rss_bpf__load(obj)) {
+		rss_bpf__destroy(obj);
+		return NULL;
+	}
+	return obj;
+}
+
+static inline int
+rss_bpf__attach(struct rss_bpf *obj)
+{
+	return bpf_object__attach_skeleton(obj->skeleton);
+}
+
+static inline void
+rss_bpf__detach(struct rss_bpf *obj)
+{
+	return bpf_object__detach_skeleton(obj->skeleton);
+}
+
+static inline int
+rss_bpf__create_skeleton(struct rss_bpf *obj)
+{
+	struct bpf_object_skeleton *s;
+
+	s = (struct bpf_object_skeleton *)calloc(1, sizeof(*s));
+	if (!s)
+		return -1;
+	obj->skeleton = s;
+
+	s->sz = sizeof(*s);
+	s->name = "rss_bpf";
+	s->obj = &obj->obj;
+
+	/* maps */
+	s->map_cnt = 3;
+	s->map_skel_sz = sizeof(*s->maps);
+	s->maps = (struct bpf_map_skeleton *)calloc(s->map_cnt, s->map_skel_sz);
+	if (!s->maps)
+		goto err;
+
+	s->maps[0].name = "tap_rss_map_configurations";
+	s->maps[0].map = &obj->maps.tap_rss_map_configurations;
+
+	s->maps[1].name = "tap_rss_map_indirection_table";
+	s->maps[1].map = &obj->maps.tap_rss_map_indirection_table;
+
+	s->maps[2].name = "tap_rss_map_toeplitz_key";
+	s->maps[2].map = &obj->maps.tap_rss_map_toeplitz_key;
+
+	/* programs */
+	s->prog_cnt = 1;
+	s->prog_skel_sz = sizeof(*s->progs);
+	s->progs = (struct bpf_prog_skeleton *)calloc(s->prog_cnt, s->prog_skel_sz);
+	if (!s->progs)
+		goto err;
+
+	s->progs[0].name = "tun_rss_steering_prog";
+	s->progs[0].prog = &obj->progs.tun_rss_steering_prog;
+	s->progs[0].link = &obj->links.tun_rss_steering_prog;
+
+	s->data_sz = 8088;
+	s->data = (void *)"\
+\x7f\x45\x4c\x46\x02\x01\x01\0\0\0\0\0\0\0\0\0\x01\0\xf7\0\x01\0\0\0\0\0\0\0\0\
+\0\0\0\0\0\0\0\0\0\0\0\x18\x1d\0\0\0\0\0\0\0\0\0\0\x40\0\0\0\0\0\x40\0\x0a\0\
+\x01\0\xbf\x18\0\0\0\0\0\0\xb7\x01\0\0\0\0\0\0\x63\x1a\x4c\xff\0\0\0\0\xbf\xa7\
+\0\0\0\0\0\0\x07\x07\0\0\x4c\xff\xff\xff\x18\x01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
+\xbf\x72\0\0\0\0\0\0\x85\0\0\0\x01\0\0\0\xbf\x06\0\0\0\0\0\0\x18\x01\0\0\0\0\0\
+\0\0\0\0\0\0\0\0\0\xbf\x72\0\0\0\0\0\0\x85\0\0\0\x01\0\0\0\xbf\x07\0\0\0\0\0\0\
+\x18\0\0\0\xff\xff\xff\xff\0\0\0\0\0\0\0\0\x15\x06\x66\x02\0\0\0\0\xbf\x79\0\0\
+\0\0\0\0\x15\x09\x64\x02\0\0\0\0\x71\x61\0\0\0\0\0\0\x55\x01\x01\0\0\0\0\0\x05\
+\0\x5d\x02\0\0\0\0\xb7\x01\0\0\0\0\0\0\x63\x1a\xc0\xff\0\0\0\0\x7b\x1a\xb8\xff\
+\0\0\0\0\x7b\x1a\xb0\xff\0\0\0\0\x7b\x1a\xa8\xff\0\0\0\0\x7b\x1a\xa0\xff\0\0\0\
+\0\x63\x1a\x98\xff\0\0\0\0\x7b\x1a\x90\xff\0\0\0\0\x7b\x1a\x88\xff\0\0\0\0\x7b\
+\x1a\x80\xff\0\0\0\0\x7b\x1a\x78\xff\0\0\0\0\x7b\x1a\x70\xff\0\0\0\0\x7b\x1a\
+\x68\xff\0\0\0\0\x7b\x1a\x60\xff\0\0\0\0\x7b\x1a\x58\xff\0\0\0\0\x7b\x1a\x50\
+\xff\0\0\0\0\x15\x08\x4c\x02\0\0\0\0\x6b\x1a\xd0\xff\0\0\0\0\xbf\xa3\0\0\0\0\0\
+\0\x07\x03\0\0\xd0\xff\xff\xff\xbf\x81\0\0\0\0\0\0\xb7\x02\0\0\x0c\0\0\0\xb7\
+\x04\0\0\x02\0\0\0\xb7\x05\0\0\0\0\0\0\x85\0\0\0\x44\0\0\0\x67\0\0\0\x20\0\0\0\
+\x77\0\0\0\x20\0\0\0\x55\0\x11\0\0\0\0\0\xb7\x02\0\0\x10\0\0\0\x69\xa1\xd0\xff\
+\0\0\0\0\xbf\x13\0\0\0\0\0\0\xdc\x03\0\0\x10\0\0\0\x15\x03\x02\0\0\x81\0\0\x55\
+\x03\x0c\0\xa8\x88\0\0\xb7\x02\0\0\x14\0\0\0\xbf\xa3\0\0\0\0\0\0\x07\x03\0\0\
+\xd0\xff\xff\xff\xbf\x81\0\0\0\0\0\0\xb7\x04\0\0\x02\0\0\0\xb7\x05\0\0\0\0\0\0\
+\x85\0\0\0\x44\0\0\0\x69\xa1\xd0\xff\0\0\0\0\x67\0\0\0\x20\0\0\0\x77\0\0\0\x20\
+\0\0\0\x15\0\x01\0\0\0\0\0\x05\0\x2f\x02\0\0\0\0\x15\x01\x2e\x02\0\0\0\0\x7b\
+\x9a\x30\xff\0\0\0\0\x15\x01\x57\0\x86\xdd\0\0\x55\x01\x3b\0\x08\0\0\0\x7b\x7a\
+\x20\xff\0\0\0\0\xb7\x07\0\0\x01\0\0\0\x73\x7a\x50\xff\0\0\0\0\xb7\x01\0\0\0\0\
+\0\0\x63\x1a\xe0\xff\0\0\0\0\x7b\x1a\xd8\xff\0\0\0\0\x7b\x1a\xd0\xff\0\0\0\0\
+\xbf\xa3\0\0\0\0\0\0\x07\x03\0\0\xd0\xff\xff\xff\xbf\x81\0\0\0\0\0\0\xb7\x02\0\
+\0\0\0\0\0\xb7\x04\0\0\x14\0\0\0\xb7\x05\0\0\x01\0\0\0\x85\0\0\0\x44\0\0\0\x67\
+\0\0\0\x20\0\0\0\x77\0\0\0\x20\0\0\0\x55\0\x1a\x02\0\0\0\0\x69\xa1\xd6\xff\0\0\
+\0\0\x55\x01\x01\0\0\0\0\0\xb7\x07\0\0\0\0\0\0\x61\xa1\xdc\xff\0\0\0\0\x63\x1a\
+\x5c\xff\0\0\0\0\x61\xa1\xe0\xff\0\0\0\0\x63\x1a\x60\xff\0\0\0\0\x73\x7a\x56\
+\xff\0\0\0\0\x71\xa9\xd9\xff\0\0\0\0\x71\xa1\xd0\xff\0\0\0\0\x67\x01\0\0\x02\0\
+\0\0\x57\x01\0\0\x3c\0\0\0\x7b\x1a\x40\xff\0\0\0\0\x79\xa7\x20\xff\0\0\0\0\xbf\
+\x91\0\0\0\0\0\0\x57\x01\0\0\xff\0\0\0\x15\x01\x19\0\0\0\0\0\x71\xa1\x56\xff\0\
+\0\0\0\x55\x01\x17\0\0\0\0\0\x57\x09\0\0\xff\0\0\0\x15\x09\x7a\x01\x11\0\0\0\
+\x55\x09\x14\0\x06\0\0\0\xb7\x01\0\0\x01\0\0\0\x73\x1a\x53\xff\0\0\0\0\xb7\x01\
+\0\0\0\0\0\0\x63\x1a\xe0\xff\0\0\0\0\x7b\x1a\xd8\xff\0\0\0\0\x7b\x1a\xd0\xff\0\
+\0\0\0\xbf\xa3\0\0\0\0\0\0\x07\x03\0\0\xd0\xff\xff\xff\xbf\x81\0\0\0\0\0\0\x79\
+\xa2\x40\xff\0\0\0\0\xb7\x04\0\0\x14\0\0\0\xb7\x05\0\0\x01\0\0\0\x85\0\0\0\x44\
+\0\0\0\x67\0\0\0\x20\0\0\0\x77\0\0\0\x20\0\0\0\x55\0\xf4\x01\0\0\0\0\x69\xa1\
+\xd0\xff\0\0\0\0\x6b\x1a\x58\xff\0\0\0\0\x69\xa1\xd2\xff\0\0\0\0\x6b\x1a\x5a\
+\xff\0\0\0\0\x71\xa1\x50\xff\0\0\0\0\x15\x01\xd4\0\0\0\0\0\x71\x62\x03\0\0\0\0\
+\0\x67\x02\0\0\x08\0\0\0\x71\x61\x02\0\0\0\0\0\x4f\x12\0\0\0\0\0\0\x71\x63\x04\
+\0\0\0\0\0\x71\x61\x05\0\0\0\0\0\x67\x01\0\0\x08\0\0\0\x4f\x31\0\0\0\0\0\0\x67\
+\x01\0\0\x10\0\0\0\x4f\x21\0\0\0\0\0\0\x71\xa2\x53\xff\0\0\0\0\x79\xa0\x30\xff\
+\0\0\0\0\x15\x02\x06\x01\0\0\0\0\xbf\x12\0\0\0\0\0\0\x57\x02\0\0\x02\0\0\0\x15\
+\x02\x03\x01\0\0\0\0\x61\xa1\x5c\xff\0\0\0\0\x63\x1a\xa0\xff\0\0\0\0\x61\xa1\
+\x60\xff\0\0\0\0\x63\x1a\xa4\xff\0\0\0\0\x69\xa1\x58\xff\0\0\0\0\x6b\x1a\xa8\
+\xff\0\0\0\0\x69\xa1\x5a\xff\0\0\0\0\x6b\x1a\xaa\xff\0\0\0\0\x05\0\x65\x01\0\0\
+\0\0\xb7\x01\0\0\x01\0\0\0\x73\x1a\x51\xff\0\0\0\0\xb7\x01\0\0\0\0\0\0\x7b\x1a\
+\xf0\xff\0\0\0\0\x7b\x1a\xe8\xff\0\0\0\0\x7b\x1a\xe0\xff\0\0\0\0\x7b\x1a\xd8\
+\xff\0\0\0\0\x7b\x1a\xd0\xff\0\0\0\0\xbf\xa3\0\0\0\0\0\0\x07\x03\0\0\xd0\xff\
+\xff\xff\xb7\x01\0\0\x28\0\0\0\x7b\x1a\x40\xff\0\0\0\0\xbf\x81\0\0\0\0\0\0\xb7\
+\x02\0\0\0\0\0\0\xb7\x04\0\0\x28\0\0\0\xb7\x05\0\0\x01\0\0\0\x85\0\0\0\x44\0\0\
+\0\x67\0\0\0\x20\0\0\0\x77\0\0\0\x20\0\0\0\x55\0\x10\x01\0\0\0\0\x79\xa1\xe0\
+\xff\0\0\0\0\x63\x1a\x64\xff\0\0\0\0\x77\x01\0\0\x20\0\0\0\x63\x1a\x68\xff\0\0\
+\0\0\x79\xa1\xd8\xff\0\0\0\0\x63\x1a\x5c\xff\0\0\0\0\x77\x01\0\0\x20\0\0\0\x63\
+\x1a\x60\xff\0\0\0\0\x79\xa1\xe8\xff\0\0\0\0\x63\x1a\x6c\xff\0\0\0\0\x77\x01\0\
+\0\x20\0\0\0\x63\x1a\x70\xff\0\0\0\0\x79\xa1\xf0\xff\0\0\0\0\x63\x1a\x74\xff\0\
+\0\0\0\x77\x01\0\0\x20\0\0\0\x63\x1a\x78\xff\0\0\0\0\x71\xa9\xd6\xff\0\0\0\0\
+\x25\x09\xff\0\x3c\0\0\0\xb7\x01\0\0\x01\0\0\0\x6f\x91\0\0\0\0\0\0\x18\x02\0\0\
+\x01\0\0\0\0\0\0\0\0\x18\0\x1c\x5f\x21\0\0\0\0\0\0\x55\x01\x01\0\0\0\0\0\x05\0\
+\xf8\0\0\0\0\0\xb7\x01\0\0\0\0\0\0\x6b\x1a\xfe\xff\0\0\0\0\xb7\x01\0\0\x28\0\0\
+\0\x7b\x1a\x40\xff\0\0\0\0\xbf\xa1\0\0\0\0\0\0\x07\x01\0\0\x8c\xff\xff\xff\x7b\
+\x1a\x18\xff\0\0\0\0\xbf\xa1\0\0\0\0\0\0\x07\x01\0\0\x7c\xff\xff\xff\x7b\x1a\
+\x10\xff\0\0\0\0\xb7\x01\0\0\0\0\0\0\x7b\x1a\x28\xff\0\0\0\0\x7b\x7a\x20\xff\0\
+\0\0\0\xbf\xa3\0\0\0\0\0\0\x07\x03\0\0\xfe\xff\xff\xff\xbf\x81\0\0\0\0\0\0\x79\
+\xa2\x40\xff\0\0\0\0\xb7\x04\0\0\x02\0\0\0\xb7\x05\0\0\x01\0\0\0\x85\0\0\0\x44\
+\0\0\0\x67\0\0\0\x20\0\0\0\x77\0\0\0\x20\0\0\0\x15\0\x01\0\0\0\0\0\x05\0\x90\
+\x01\0\0\0\0\xbf\x91\0\0\0\0\0\0\x15\x01\x23\0\x3c\0\0\0\x15\x01\x59\0\x2c\0\0\
+\0\x55\x01\x5a\0\x2b\0\0\0\xb7\x01\0\0\0\0\0\0\x63\x1a\xf8\xff\0\0\0\0\xbf\xa3\
+\0\0\0\0\0\0\x07\x03\0\0\xf8\xff\xff\xff\xbf\x81\0\0\0\0\0\0\x79\xa2\x40\xff\0\
+\0\0\0\xb7\x04\0\0\x04\0\0\0\xb7\x05\0\0\x01\0\0\0\x85\0\0\0\x44\0\0\0\xbf\x01\
+\0\0\0\0\0\0\x67\x01\0\0\x20\0\0\0\x77\x01\0\0\x20\0\0\0\x55\x01\x03\x01\0\0\0\
+\0\x71\xa1\xfa\xff\0\0\0\0\x55\x01\x4b\0\x02\0\0\0\x71\xa1\xf9\xff\0\0\0\0\x55\
+\x01\x49\0\x02\0\0\0\x71\xa1\xfb\xff\0\0\0\0\x55\x01\x47\0\x01\0\0\0\x79\xa2\
+\x40\xff\0\0\0\0\x07\x02\0\0\x08\0\0\0\xbf\x81\0\0\0\0\0\0\x79\xa3\x18\xff\0\0\
+\0\0\xb7\x04\0\0\x10\0\0\0\xb7\x05\0\0\x01\0\0\0\x85\0\0\0\x44\0\0\0\xbf\x01\0\
+\0\0\0\0\0\x67\x01\0\0\x20\0\0\0\x77\x01\0\0\x20\0\0\0\x55\x01\xf2\0\0\0\0\0\
+\xb7\x01\0\0\x01\0\0\0\x73\x1a\x55\xff\0\0\0\0\x05\0\x39\0\0\0\0\0\xb7\x01\0\0\
+\0\0\0\0\x6b\x1a\xf8\xff\0\0\0\0\xb7\x09\0\0\x02\0\0\0\xb7\x07\0\0\x1e\0\0\0\
+\x05\0\x0e\0\0\0\0\0\x79\xa2\x38\xff\0\0\0\0\x0f\x29\0\0\0\0\0\0\xbf\x92\0\0\0\
+\0\0\0\x07\x02\0\0\x01\0\0\0\x71\xa3\xff\xff\0\0\0\0\x67\x03\0\0\x03\0\0\0\x2d\
+\x23\x02\0\0\0\0\0\x79\xa7\x20\xff\0\0\0\0\x05\0\x2b\0\0\0\0\0\x07\x07\0\0\xff\
+\xff\xff\xff\xbf\x72\0\0\0\0\0\0\x67\x02\0\0\x20\0\0\0\x77\x02\0\0\x20\0\0\0\
+\x15\x02\xf9\xff\0\0\0\0\x7b\x9a\x38\xff\0\0\0\0\x79\xa1\x40\xff\0\0\0\0\x0f\
+\x19\0\0\0\0\0\0\xbf\xa3\0\0\0\0\0\0\x07\x03\0\0\xf8\xff\xff\xff\xbf\x81\0\0\0\
+\0\0\0\xbf\x92\0\0\0\0\0\0\xb7\x04\0\0\x02\0\0\0\xb7\x05\0\0\x01\0\0\0\x85\0\0\
+\0\x44\0\0\0\xbf\x01\0\0\0\0\0\0\x67\x01\0\0\x20\0\0\0\x77\x01\0\0\x20\0\0\0\
+\x55\x01\x94\0\0\0\0\0\x71\xa2\xf8\xff\0\0\0\0\x55\x02\x0f\0\xc9\0\0\0\x07\x09\
+\0\0\x02\0\0\0\xbf\x81\0\0\0\0\0\0\xbf\x92\0\0\0\0\0\0\x79\xa3\x10\xff\0\0\0\0\
+\xb7\x04\0\0\x10\0\0\0\xb7\x05\0\0\x01\0\0\0\x85\0\0\0\x44\0\0\0\xbf\x01\0\0\0\
+\0\0\0\x67\x01\0\0\x20\0\0\0\x77\x01\0\0\x20\0\0\0\x55\x01\x87\0\0\0\0\0\xb7\
+\x01\0\0\x01\0\0\0\x73\x1a\x54\xff\0\0\0\0\x79\xa7\x20\xff\0\0\0\0\x05\0\x07\0\
+\0\0\0\0\xb7\x09\0\0\x01\0\0\0\x15\x02\xd1\xff\0\0\0\0\x71\xa9\xf9\xff\0\0\0\0\
+\x07\x09\0\0\x02\0\0\0\x05\0\xce\xff\0\0\0\0\xb7\x01\0\0\x01\0\0\0\x73\x1a\x56\
+\xff\0\0\0\0\x71\xa1\xff\xff\0\0\0\0\x67\x01\0\0\x03\0\0\0\x79\xa2\x40\xff\0\0\
+\0\0\x0f\x12\0\0\0\0\0\0\x07\x02\0\0\x08\0\0\0\x7b\x2a\x40\xff\0\0\0\0\x71\xa9\
+\xfe\xff\0\0\0\0\x25\x09\x0e\0\x3c\0\0\0\xb7\x01\0\0\x01\0\0\0\x6f\x91\0\0\0\0\
+\0\0\x18\x02\0\0\x01\0\0\0\0\0\0\0\0\x18\0\x1c\x5f\x21\0\0\0\0\0\0\x55\x01\x01\
+\0\0\0\0\0\x05\0\x07\0\0\0\0\0\x79\xa1\x28\xff\0\0\0\0\x07\x01\0\0\x01\0\0\0\
+\x7b\x1a\x28\xff\0\0\0\0\x67\x01\0\0\x20\0\0\0\x77\x01\0\0\x20\0\0\0\x55\x01\
+\x82\xff\x0b\0\0\0\x05\0\x10\xff\0\0\0\0\x15\x09\xf8\xff\x87\0\0\0\x05\0\xfd\
+\xff\0\0\0\0\x71\xa1\x51\xff\0\0\0\0\x79\xa0\x30\xff\0\0\0\0\x15\x01\x17\x01\0\
+\0\0\0\x71\x62\x03\0\0\0\0\0\x67\x02\0\0\x08\0\0\0\x71\x61\x02\0\0\0\0\0\x4f\
+\x12\0\0\0\0\0\0\x71\x63\x04\0\0\0\0\0\x71\x61\x05\0\0\0\0\0\x67\x01\0\0\x08\0\
+\0\0\x4f\x31\0\0\0\0\0\0\x67\x01\0\0\x10\0\0\0\x4f\x21\0\0\0\0\0\0\x71\xa2\x53\
+\xff\0\0\0\0\x15\x02\x3d\0\0\0\0\0\xbf\x12\0\0\0\0\0\0\x57\x02\0\0\x10\0\0\0\
+\x15\x02\x3a\0\0\0\0\0\xbf\xa2\0\0\0\0\0\0\x07\x02\0\0\x5c\xff\xff\xff\x71\xa4\
+\x54\xff\0\0\0\0\xbf\x23\0\0\0\0\0\0\x15\x04\x02\0\0\0\0\0\xbf\xa3\0\0\0\0\0\0\
+\x07\x03\0\0\x7c\xff\xff\xff\x67\x01\0\0\x38\0\0\0\xc7\x01\0\0\x38\0\0\0\x65\
+\x01\x01\0\xff\xff\xff\xff\xbf\x32\0\0\0\0\0\0\xbf\xa3\0\0\0\0\0\0\x07\x03\0\0\
+\x6c\xff\xff\xff\x71\xa5\x55\xff\0\0\0\0\xbf\x34\0\0\0\0\0\0\x15\x05\x02\0\0\0\
+\0\0\xbf\xa4\0\0\0\0\0\0\x07\x04\0\0\x8c\xff\xff\xff\x65\x01\x01\0\xff\xff\xff\
+\xff\xbf\x43\0\0\0\0\0\0\x61\x21\x04\0\0\0\0\0\x67\x01\0\0\x20\0\0\0\x61\x24\0\
+\0\0\0\0\0\x4f\x41\0\0\0\0\0\0\x7b\x1a\xa0\xff\0\0\0\0\x61\x21\x08\0\0\0\0\0\
+\x61\x22\x0c\0\0\0\0\0\x67\x02\0\0\x20\0\0\0\x4f\x12\0\0\0\0\0\0\x7b\x2a\xa8\
+\xff\0\0\0\0\x61\x31\0\0\0\0\0\0\x61\x32\x04\0\0\0\0\0\x61\x34\x08\0\0\0\0\0\
+\x61\x33\x0c\0\0\0\0\0\x69\xa5\x5a\xff\0\0\0\0\x6b\x5a\xc2\xff\0\0\0\0\x69\xa5\
+\x58\xff\0\0\0\0\x6b\x5a\xc0\xff\0\0\0\0\x67\x03\0\0\x20\0\0\0\x4f\x43\0\0\0\0\
+\0\0\x7b\x3a\xb8\xff\0\0\0\0\x67\x02\0\0\x20\0\0\0\x4f\x12\0\0\0\0\0\0\x7b\x2a\
+\xb0\xff\0\0\0\0\x05\0\x6b\0\0\0\0\0\x71\xa2\x52\xff\0\0\0\0\x15\x02\x04\0\0\0\
+\0\0\xbf\x12\0\0\0\0\0\0\x57\x02\0\0\x04\0\0\0\x15\x02\x01\0\0\0\0\0\x05\0\xf7\
+\xfe\0\0\0\0\x57\x01\0\0\x01\0\0\0\x15\x01\xd3\0\0\0\0\0\x61\xa1\x5c\xff\0\0\0\
+\0\x63\x1a\xa0\xff\0\0\0\0\x61\xa1\x60\xff\0\0\0\0\x63\x1a\xa4\xff\0\0\0\0\x05\
+\0\x5e\0\0\0\0\0\x71\xa2\x52\xff\0\0\0\0\x15\x02\x1e\0\0\0\0\0\xbf\x12\0\0\0\0\
+\0\0\x57\x02\0\0\x20\0\0\0\x15\x02\x1b\0\0\0\0\0\xbf\xa2\0\0\0\0\0\0\x07\x02\0\
+\0\x5c\xff\xff\xff\x71\xa4\x54\xff\0\0\0\0\xbf\x23\0\0\0\0\0\0\x15\x04\x02\0\0\
+\0\0\0\xbf\xa3\0\0\0\0\0\0\x07\x03\0\0\x7c\xff\xff\xff\x57\x01\0\0\0\x01\0\0\
+\x15\x01\x01\0\0\0\0\0\xbf\x32\0\0\0\0\0\0\xbf\xa3\0\0\0\0\0\0\x07\x03\0\0\x6c\
+\xff\xff\xff\x71\xa5\x55\xff\0\0\0\0\xbf\x34\0\0\0\0\0\0\x15\x05\x02\0\0\0\0\0\
+\xbf\xa4\0\0\0\0\0\0\x07\x04\0\0\x8c\xff\xff\xff\x15\x01\xc3\xff\0\0\0\0\x05\0\
+\xc1\xff\0\0\0\0\xb7\x09\0\0\x3c\0\0\0\x79\xa7\x20\xff\0\0\0\0\x67\0\0\0\x20\0\
+\0\0\x77\0\0\0\x20\0\0\0\x15\0\xa5\xfe\0\0\0\0\x05\0\xb0\0\0\0\0\0\x15\x09\x07\
+\xff\x87\0\0\0\x05\0\xa2\xfe\0\0\0\0\xbf\x12\0\0\0\0\0\0\x57\x02\0\0\x08\0\0\0\
+\x15\x02\xab\0\0\0\0\0\xbf\xa2\0\0\0\0\0\0\x07\x02\0\0\x5c\xff\xff\xff\x71\xa4\
+\x54\xff\0\0\0\0\xbf\x23\0\0\0\0\0\0\x15\x04\x02\0\0\0\0\0\xbf\xa3\0\0\0\0\0\0\
+\x07\x03\0\0\x7c\xff\xff\xff\x57\x01\0\0\x40\0\0\0\x15\x01\x01\0\0\0\0\0\xbf\
+\x32\0\0\0\0\0\0\x61\x23\x04\0\0\0\0\0\x67\x03\0\0\x20\0\0\0\x61\x24\0\0\0\0\0\
+\0\x4f\x43\0\0\0\0\0\0\x7b\x3a\xa0\xff\0\0\0\0\x61\x23\x08\0\0\0\0\0\x61\x22\
+\x0c\0\0\0\0\0\x67\x02\0\0\x20\0\0\0\x4f\x32\0\0\0\0\0\0\x7b\x2a\xa8\xff\0\0\0\
+\0\x15\x01\x1c\0\0\0\0\0\x71\xa1\x55\xff\0\0\0\0\x15\x01\x1a\0\0\0\0\0\x61\xa1\
+\x98\xff\0\0\0\0\x67\x01\0\0\x20\0\0\0\x61\xa2\x94\xff\0\0\0\0\x4f\x21\0\0\0\0\
+\0\0\x7b\x1a\xb8\xff\0\0\0\0\x61\xa1\x90\xff\0\0\0\0\x67\x01\0\0\x20\0\0\0\x61\
+\xa2\x8c\xff\0\0\0\0\x05\0\x19\0\0\0\0\0\xb7\x01\0\0\x01\0\0\0\x73\x1a\x52\xff\
+\0\0\0\0\xb7\x01\0\0\0\0\0\0\x7b\x1a\xd0\xff\0\0\0\0\xbf\xa3\0\0\0\0\0\0\x07\
+\x03\0\0\xd0\xff\xff\xff\xbf\x81\0\0\0\0\0\0\x79\xa2\x40\xff\0\0\0\0\xb7\x04\0\
+\0\x08\0\0\0\xb7\x05\0\0\x01\0\0\0\x85\0\0\0\x44\0\0\0\x67\0\0\0\x20\0\0\0\x77\
+\0\0\0\x20\0\0\0\x55\0\x7d\0\0\0\0\0\x05\0\x88\xfe\0\0\0\0\xb7\x09\0\0\x2b\0\0\
+\0\x05\0\xc6\xff\0\0\0\0\x61\xa1\x78\xff\0\0\0\0\x67\x01\0\0\x20\0\0\0\x61\xa2\
+\x74\xff\0\0\0\0\x4f\x21\0\0\0\0\0\0\x7b\x1a\xb8\xff\0\0\0\0\x61\xa1\x70\xff\0\
+\0\0\0\x67\x01\0\0\x20\0\0\0\x61\xa2\x6c\xff\0\0\0\0\x4f\x21\0\0\0\0\0\0\x7b\
+\x1a\xb0\xff\0\0\0\0\xb7\x01\0\0\0\0\0\0\x07\x07\0\0\x04\0\0\0\x61\x03\0\0\0\0\
+\0\0\xb7\x05\0\0\0\0\0\0\x05\0\x4e\0\0\0\0\0\xaf\x52\0\0\0\0\0\0\xbf\x75\0\0\0\
+\0\0\0\x0f\x15\0\0\0\0\0\0\x71\x55\0\0\0\0\0\0\x67\x03\0\0\x01\0\0\0\xbf\x50\0\
+\0\0\0\0\0\x77\0\0\0\x07\0\0\0\x4f\x03\0\0\0\0\0\0\xbf\x40\0\0\0\0\0\0\x67\0\0\
+\0\x39\0\0\0\xc7\0\0\0\x3f\0\0\0\x5f\x30\0\0\0\0\0\0\xaf\x02\0\0\0\0\0\0\xbf\
+\x50\0\0\0\0\0\0\x77\0\0\0\x06\0\0\0\x57\0\0\0\x01\0\0\0\x67\x03\0\0\x01\0\0\0\
+\x4f\x03\0\0\0\0\0\0\xbf\x40\0\0\0\0\0\0\x67\0\0\0\x3a\0\0\0\xc7\0\0\0\x3f\0\0\
+\0\x5f\x30\0\0\0\0\0\0\xaf\x02\0\0\0\0\0\0\x67\x03\0\0\x01\0\0\0\xbf\x50\0\0\0\
+\0\0\0\x77\0\0\0\x05\0\0\0\x57\0\0\0\x01\0\0\0\x4f\x03\0\0\0\0\0\0\xbf\x40\0\0\
+\0\0\0\0\x67\0\0\0\x3b\0\0\0\xc7\0\0\0\x3f\0\0\0\x5f\x30\0\0\0\0\0\0\xaf\x02\0\
+\0\0\0\0\0\x67\x03\0\0\x01\0\0\0\xbf\x50\0\0\0\0\0\0\x77\0\0\0\x04\0\0\0\x57\0\
+\0\0\x01\0\0\0\x4f\x03\0\0\0\0\0\0\xbf\x40\0\0\0\0\0\0\x67\0\0\0\x3c\0\0\0\xc7\
+\0\0\0\x3f\0\0\0\x5f\x30\0\0\0\0\0\0\xaf\x02\0\0\0\0\0\0\xbf\x50\0\0\0\0\0\0\
+\x77\0\0\0\x03\0\0\0\x57\0\0\0\x01\0\0\0\x67\x03\0\0\x01\0\0\0\x4f\x03\0\0\0\0\
+\0\0\xbf\x40\0\0\0\0\0\0\x67\0\0\0\x3d\0\0\0\xc7\0\0\0\x3f\0\0\0\x5f\x30\0\0\0\
+\0\0\0\xaf\x02\0\0\0\0\0\0\xbf\x50\0\0\0\0\0\0\x77\0\0\0\x02\0\0\0\x57\0\0\0\
+\x01\0\0\0\x67\x03\0\0\x01\0\0\0\x4f\x03\0\0\0\0\0\0\xbf\x40\0\0\0\0\0\0\x67\0\
+\0\0\x3e\0\0\0\xc7\0\0\0\x3f\0\0\0\x5f\x30\0\0\0\0\0\0\xaf\x02\0\0\0\0\0\0\xbf\
+\x50\0\0\0\0\0\0\x77\0\0\0\x01\0\0\0\x57\0\0\0\x01\0\0\0\x67\x03\0\0\x01\0\0\0\
+\x4f\x03\0\0\0\0\0\0\x57\x04\0\0\x01\0\0\0\x87\x04\0\0\0\0\0\0\x5f\x34\0\0\0\0\
+\0\0\xaf\x42\0\0\0\0\0\0\x57\x05\0\0\x01\0\0\0\x67\x03\0\0\x01\0\0\0\x4f\x53\0\
+\0\0\0\0\0\x07\x01\0\0\x01\0\0\0\xbf\x25\0\0\0\0\0\0\x15\x01\x0b\0\x24\0\0\0\
+\xbf\xa2\0\0\0\0\0\0\x07\x02\0\0\xa0\xff\xff\xff\x0f\x12\0\0\0\0\0\0\x71\x24\0\
+\0\0\0\0\0\xbf\x40\0\0\0\0\0\0\x67\0\0\0\x38\0\0\0\xc7\0\0\0\x38\0\0\0\xb7\x02\
+\0\0\0\0\0\0\x65\0\xa9\xff\xff\xff\xff\xff\xbf\x32\0\0\0\0\0\0\x05\0\xa7\xff\0\
+\0\0\0\xbf\x21\0\0\0\0\0\0\x67\x01\0\0\x20\0\0\0\x77\x01\0\0\x20\0\0\0\x15\x01\
+\x0e\0\0\0\0\0\x71\x63\x06\0\0\0\0\0\x71\x64\x07\0\0\0\0\0\x67\x04\0\0\x08\0\0\
+\0\x4f\x34\0\0\0\0\0\0\x3f\x41\0\0\0\0\0\0\x2f\x41\0\0\0\0\0\0\x1f\x12\0\0\0\0\
+\0\0\x63\x2a\x50\xff\0\0\0\0\xbf\xa2\0\0\0\0\0\0\x07\x02\0\0\x50\xff\xff\xff\
+\x18\x01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x85\0\0\0\x01\0\0\0\x55\0\x05\0\0\0\0\0\
+\x71\x61\x08\0\0\0\0\0\x71\x60\x09\0\0\0\0\0\x67\0\0\0\x08\0\0\0\x4f\x10\0\0\0\
+\0\0\0\x95\0\0\0\0\0\0\0\x69\0\0\0\0\0\0\0\x05\0\xfd\xff\0\0\0\0\x02\0\0\0\x04\
+\0\0\0\x0a\0\0\0\x01\0\0\0\0\0\0\0\x02\0\0\0\x04\0\0\0\x28\0\0\0\x01\0\0\0\0\0\
+\0\0\x02\0\0\0\x04\0\0\0\x02\0\0\0\x80\0\0\0\0\0\0\0\x47\x50\x4c\x20\x76\x32\0\
+\0\0\0\0\0\x10\0\0\0\0\0\0\0\x01\x7a\x52\0\x08\x7c\x0b\x01\x0c\0\0\0\x18\0\0\0\
+\x18\0\0\0\0\0\0\0\0\0\0\0\xd8\x13\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
+\0\0\0\0\0\0\0\0\0\0\0\0\xa0\0\0\0\x04\0\xf1\xff\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
+\0\x60\x02\0\0\0\0\x03\0\x20\x02\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x3f\x02\0\0\0\0\
+\x03\0\xd0\x0f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xed\x01\0\0\0\0\x03\0\x10\x10\0\0\0\
+\0\0\0\0\0\0\0\0\0\0\0\xd4\x01\0\0\0\0\x03\0\x20\x10\0\0\0\0\0\0\0\0\0\0\0\0\0\
+\0\xa3\x01\0\0\0\0\x03\0\xb8\x12\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x63\x01\0\0\0\0\
+\x03\0\x48\x10\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x2a\x01\0\0\0\0\x03\0\x10\x13\0\0\0\
+\0\0\0\0\0\0\0\0\0\0\0\xe1\0\0\0\0\0\x03\0\xa0\x13\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
+\x2e\x02\0\0\0\0\x03\0\x28\x02\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x68\x02\0\0\0\0\x03\
+\0\xc0\x13\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x36\x02\0\0\0\0\x03\0\xc8\x13\0\0\0\0\0\
+\0\0\0\0\0\0\0\0\0\x22\x01\0\0\0\0\x03\0\xe8\x02\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
+\x02\x01\0\0\0\0\x03\0\x40\x03\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xd9\0\0\0\0\0\x03\0\
+\xf8\x04\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x26\x02\0\0\0\0\x03\0\x20\x0e\0\0\0\0\0\0\
+\0\0\0\0\0\0\0\0\xcc\x01\0\0\0\0\x03\0\x60\x06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x9b\
+\x01\0\0\0\0\x03\0\xc8\x06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x5b\x01\0\0\0\0\x03\0\
+\x20\x07\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x7c\x01\0\0\0\0\x03\0\x48\x08\0\0\0\0\0\0\
+\0\0\0\0\0\0\0\0\x53\x01\0\0\0\0\x03\0\xb8\x08\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x1a\
+\x01\0\0\0\0\x03\0\xe0\x08\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x84\x01\0\0\0\0\x03\0\
+\xb8\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x1e\x02\0\0\0\0\x03\0\xd8\x09\0\0\0\0\0\0\0\
+\0\0\0\0\0\0\0\xc4\x01\0\0\0\0\x03\0\x70\x08\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x93\
+\x01\0\0\0\0\x03\0\xa8\x08\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x74\x01\0\0\0\0\x03\0\
+\xf0\x0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x4b\x01\0\0\0\0\x03\0\0\x0a\0\0\0\0\0\0\0\
+\0\0\0\0\0\0\0\x12\x01\0\0\0\0\x03\0\x10\x0a\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xfa\0\
+\0\0\0\0\x03\0\xc0\x0a\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x58\x02\0\0\0\0\x03\0\x88\
+\x0a\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x16\x02\0\0\0\0\x03\0\xb8\x0a\0\0\0\0\0\0\0\0\
+\0\0\0\0\0\0\xe5\x01\0\0\0\0\x03\0\xc0\x0f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xbc\x01\
+\0\0\0\0\x03\0\0\x0e\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x8b\x01\0\0\0\0\x03\0\x18\x0e\
+\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xd1\0\0\0\0\0\x03\0\0\x04\0\0\0\0\0\0\0\0\0\0\0\0\
+\0\0\x50\x02\0\0\0\0\x03\0\x20\x04\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x0e\x02\0\0\0\0\
+\x03\0\x48\x0f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x6c\x01\0\0\0\0\x03\0\xb0\x04\0\0\0\
+\0\0\0\0\0\0\0\0\0\0\0\x43\x01\0\0\0\0\x03\0\xc8\x0c\0\0\0\0\0\0\0\0\0\0\0\0\0\
+\0\xc9\0\0\0\0\0\x03\0\xf8\x0c\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x06\x02\0\0\0\0\x03\
+\0\xd0\x0a\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x3b\x01\0\0\0\0\x03\0\x98\x0b\0\0\0\0\0\
+\0\0\0\0\0\0\0\0\0\xf2\0\0\0\0\0\x03\0\xb8\x0b\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x48\
+\x02\0\0\0\0\x03\0\xf0\x0b\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xfe\x01\0\0\0\0\x03\0\
+\xf8\x0b\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xdd\x01\0\0\0\0\x03\0\0\x0c\0\0\0\0\0\0\0\
+\0\0\0\0\0\0\0\xb4\x01\0\0\0\0\x03\0\x30\x0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x0a\
+\x01\0\0\0\0\x03\0\x90\x0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xc1\0\0\0\0\0\x03\0\xa8\
+\x0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xba\0\0\0\0\0\x03\0\xd0\x01\0\0\0\0\0\0\0\0\0\
+\0\0\0\0\0\xf6\x01\0\0\0\0\x03\0\xe0\x0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xac\x01\0\
+\0\0\0\x03\0\x30\x0e\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x33\x01\0\0\0\0\x03\0\x80\x0e\
+\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xea\0\0\0\0\0\x03\0\x98\x0e\0\0\0\0\0\0\0\0\0\0\0\
+\0\0\0\0\0\0\0\x03\0\x03\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x6b\0\0\0\x11\0\x06\
+\0\0\0\0\0\0\0\0\0\x07\0\0\0\0\0\0\0\x25\0\0\0\x11\0\x05\0\0\0\0\0\0\0\0\0\x14\
+\0\0\0\0\0\0\0\x82\0\0\0\x11\0\x05\0\x28\0\0\0\0\0\0\0\x14\0\0\0\0\0\0\0\x01\0\
+\0\0\x11\0\x05\0\x14\0\0\0\0\0\0\0\x14\0\0\0\0\0\0\0\x40\0\0\0\x12\0\x03\0\0\0\
+\0\0\0\0\0\0\xd8\x13\0\0\0\0\0\0\x28\0\0\0\0\0\0\0\x01\0\0\0\x3a\0\0\0\x50\0\0\
+\0\0\0\0\0\x01\0\0\0\x3c\0\0\0\x80\x13\0\0\0\0\0\0\x01\0\0\0\x3b\0\0\0\x1c\0\0\
+\0\0\0\0\0\x01\0\0\0\x38\0\0\0\0\x74\x61\x70\x5f\x72\x73\x73\x5f\x6d\x61\x70\
+\x5f\x74\x6f\x65\x70\x6c\x69\x74\x7a\x5f\x6b\x65\x79\0\x2e\x74\x65\x78\x74\0\
+\x6d\x61\x70\x73\0\x74\x61\x70\x5f\x72\x73\x73\x5f\x6d\x61\x70\x5f\x63\x6f\x6e\
+\x66\x69\x67\x75\x72\x61\x74\x69\x6f\x6e\x73\0\x74\x75\x6e\x5f\x72\x73\x73\x5f\
+\x73\x74\x65\x65\x72\x69\x6e\x67\x5f\x70\x72\x6f\x67\0\x2e\x72\x65\x6c\x74\x75\
+\x6e\x5f\x72\x73\x73\x5f\x73\x74\x65\x65\x72\x69\x6e\x67\0\x5f\x6c\x69\x63\x65\
+\x6e\x73\x65\0\x2e\x72\x65\x6c\x2e\x65\x68\x5f\x66\x72\x61\x6d\x65\0\x74\x61\
+\x70\x5f\x72\x73\x73\x5f\x6d\x61\x70\x5f\x69\x6e\x64\x69\x72\x65\x63\x74\x69\
+\x6f\x6e\x5f\x74\x61\x62\x6c\x65\0\x72\x73\x73\x2e\x62\x70\x66\x2e\x63\0\x2e\
+\x73\x74\x72\x74\x61\x62\0\x2e\x73\x79\x6d\x74\x61\x62\0\x4c\x42\x42\x30\x5f\
+\x39\0\x4c\x42\x42\x30\x5f\x38\x39\0\x4c\x42\x42\x30\x5f\x36\x39\0\x4c\x42\x42\
+\x30\x5f\x35\x39\0\x4c\x42\x42\x30\x5f\x31\x39\0\x4c\x42\x42\x30\x5f\x31\x30\
+\x39\0\x4c\x42\x42\x30\x5f\x39\x38\0\x4c\x42\x42\x30\x5f\x37\x38\0\x4c\x42\x42\
+\x30\x5f\x34\x38\0\x4c\x42\x42\x30\x5f\x31\x38\0\x4c\x42\x42\x30\x5f\x38\x37\0\
+\x4c\x42\x42\x30\x5f\x34\x37\0\x4c\x42\x42\x30\x5f\x33\x37\0\x4c\x42\x42\x30\
+\x5f\x31\x37\0\x4c\x42\x42\x30\x5f\x31\x30\x37\0\x4c\x42\x42\x30\x5f\x39\x36\0\
+\x4c\x42\x42\x30\x5f\x37\x36\0\x4c\x42\x42\x30\x5f\x36\x36\0\x4c\x42\x42\x30\
+\x5f\x34\x36\0\x4c\x42\x42\x30\x5f\x33\x36\0\x4c\x42\x42\x30\x5f\x32\x36\0\x4c\
+\x42\x42\x30\x5f\x31\x30\x36\0\x4c\x42\x42\x30\x5f\x36\x35\0\x4c\x42\x42\x30\
+\x5f\x34\x35\0\x4c\x42\x42\x30\x5f\x33\x35\0\x4c\x42\x42\x30\x5f\x34\0\x4c\x42\
+\x42\x30\x5f\x35\x34\0\x4c\x42\x42\x30\x5f\x34\x34\0\x4c\x42\x42\x30\x5f\x32\
+\x34\0\x4c\x42\x42\x30\x5f\x31\x30\x34\0\x4c\x42\x42\x30\x5f\x39\x33\0\x4c\x42\
+\x42\x30\x5f\x38\x33\0\x4c\x42\x42\x30\x5f\x35\x33\0\x4c\x42\x42\x30\x5f\x34\
+\x33\0\x4c\x42\x42\x30\x5f\x32\x33\0\x4c\x42\x42\x30\x5f\x31\x30\x33\0\x4c\x42\
+\x42\x30\x5f\x38\x32\0\x4c\x42\x42\x30\x5f\x35\x32\0\x4c\x42\x42\x30\x5f\x31\
+\x30\x32\0\x4c\x42\x42\x30\x5f\x39\x31\0\x4c\x42\x42\x30\x5f\x38\x31\0\x4c\x42\
+\x42\x30\x5f\x37\x31\0\x4c\x42\x42\x30\x5f\x36\x31\0\x4c\x42\x42\x30\x5f\x35\
+\x31\0\x4c\x42\x42\x30\x5f\x34\x31\0\x4c\x42\x42\x30\x5f\x32\x31\0\x4c\x42\x42\
+\x30\x5f\x31\x31\0\x4c\x42\x42\x30\x5f\x31\x31\x31\0\x4c\x42\x42\x30\x5f\x31\
+\x30\x31\0\x4c\x42\x42\x30\x5f\x38\x30\0\x4c\x42\x42\x30\x5f\x36\x30\0\x4c\x42\
+\x42\x30\x5f\x35\x30\0\x4c\x42\x42\x30\x5f\x31\x30\0\x4c\x42\x42\x30\x5f\x31\
+\x31\x30\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
+\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xaa\
+\0\0\0\x03\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xa0\x1a\0\0\0\0\0\0\x71\x02\0\
+\0\0\0\0\0\0\0\0\0\0\0\0\0\x01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x1a\0\0\0\x01\0\0\
+\0\x06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x40\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
+\0\0\0\0\x04\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x5a\0\0\0\x01\0\0\0\x06\0\0\0\0\0\0\
+\0\0\0\0\0\0\0\0\0\x40\0\0\0\0\0\0\0\xd8\x13\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x08\0\
+\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x56\0\0\0\x09\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
+\0\x60\x1a\0\0\0\0\0\0\x30\0\0\0\0\0\0\0\x09\0\0\0\x03\0\0\0\x08\0\0\0\0\0\0\0\
+\x10\0\0\0\0\0\0\0\x20\0\0\0\x01\0\0\0\x03\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x18\
+\x14\0\0\0\0\0\0\x3c\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x04\0\0\0\0\0\0\0\0\0\0\0\0\
+\0\0\0\x6c\0\0\0\x01\0\0\0\x03\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x54\x14\0\0\0\0\0\
+\0\x07\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x78\0\0\
+\0\x01\0\0\0\x02\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x60\x14\0\0\0\0\0\0\x30\0\0\0\0\
+\0\0\0\0\0\0\0\0\0\0\0\x08\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x74\0\0\0\x09\0\0\0\0\
+\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x90\x1a\0\0\0\0\0\0\x10\0\0\0\0\0\0\0\x09\0\0\0\
+\x07\0\0\0\x08\0\0\0\0\0\0\0\x10\0\0\0\0\0\0\0\xb2\0\0\0\x02\0\0\0\0\0\0\0\0\0\
+\0\0\0\0\0\0\0\0\0\0\x90\x14\0\0\0\0\0\0\xd0\x05\0\0\0\0\0\0\x01\0\0\0\x39\0\0\
+\0\x08\0\0\0\0\0\0\0\x18\0\0\0\0\0\0\0";
+
+	return 0;
+err:
+	bpf_object__destroy_skeleton(s);
+	return -1;
+}
+
+#endif /* __RSS_BPF_SKEL_H__ */
diff --git a/ebpf/trace-events b/ebpf/trace-events
new file mode 100644
index 0000000..411b1e2
--- /dev/null
+++ b/ebpf/trace-events
@@ -0,0 +1,4 @@
+# See docs/devel/tracing.txt for syntax documentation.
+
+# ebpf-rss.c
+ebpf_error(const char *s1, const char *s2) "error in %s: %s"
diff --git a/ebpf/trace.h b/ebpf/trace.h
new file mode 100644
index 0000000..abefc46
--- /dev/null
+++ b/ebpf/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-ebpf.h"
diff --git a/meson.build b/meson.build
index 1ffdc9e..56f3dcb 100644
--- a/meson.build
+++ b/meson.build
@@ -1015,6 +1015,23 @@ if not get_option('fuse_lseek').disabled()
   endif
 endif
 
+# libbpf
+libbpf = dependency('libbpf', required: get_option('bpf'))
+if libbpf.found() and not cc.links('''
+   #include <bpf/libbpf.h>
+   int main(void)
+   {
+     bpf_object__destroy_skeleton(NULL);
+     return 0;
+   }''', dependencies: libbpf)
+  libbpf = not_found
+  if get_option('bpf').enabled()
+    error('libbpf skeleton test failed')
+  else
+    warning('libbpf skeleton test failed, disabling')
+  endif
+endif
+
 if get_option('cfi')
   cfi_flags=[]
   # Check for dependency on LTO
@@ -1114,6 +1131,7 @@ endif
 config_host_data.set('CONFIG_GTK', gtk.found())
 config_host_data.set('CONFIG_LIBATTR', have_old_libattr)
 config_host_data.set('CONFIG_LIBCAP_NG', libcap_ng.found())
+config_host_data.set('CONFIG_EBPF', libbpf.found())
 config_host_data.set('CONFIG_LIBISCSI', libiscsi.found())
 config_host_data.set('CONFIG_LIBNFS', libnfs.found())
 config_host_data.set('CONFIG_RBD', rbd.found())
@@ -1785,6 +1803,7 @@ if have_system
     'backends',
     'backends/tpm',
     'chardev',
+    'ebpf',
     'hw/9pfs',
     'hw/acpi',
     'hw/adc',
@@ -1976,6 +1995,9 @@ subdir('accel')
 subdir('plugins')
 subdir('bsd-user')
 subdir('linux-user')
+subdir('ebpf')
+
+common_ss.add(libbpf)
 
 bsd_user_ss.add(files('gdbstub.c'))
 specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
@@ -2685,6 +2707,7 @@ summary_info += {'RDMA support':      config_host.has_key('CONFIG_RDMA')}
 summary_info += {'PVRDMA support':    config_host.has_key('CONFIG_PVRDMA')}
 summary_info += {'fdt support':       fdt_opt == 'disabled' ? false : fdt_opt}
 summary_info += {'libcap-ng support': libcap_ng.found()}
+summary_info += {'bpf support': libbpf.found()}
 # TODO: add back protocol and server version
 summary_info += {'spice support':     config_host.has_key('CONFIG_SPICE')}
 summary_info += {'rbd support':       rbd.found()}
diff --git a/meson_options.txt b/meson_options.txt
index 9734019..58bc80e 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -56,6 +56,8 @@ option('bzip2', type : 'feature', value : 'auto',
        description: 'bzip2 support for DMG images')
 option('cap_ng', type : 'feature', value : 'auto',
        description: 'cap_ng support')
+option('bpf', type : 'feature', value : 'auto',
+        description: 'eBPF support')
 option('cocoa', type : 'feature', value : 'auto',
        description: 'Cocoa user interface (macOS only)')
 option('curl', type : 'feature', value : 'auto',
-- 
2.7.4



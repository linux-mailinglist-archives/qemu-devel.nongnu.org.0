Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AE52B905C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 11:47:29 +0100 (CET)
Received: from localhost ([::1]:36942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfhTM-0006GA-R2
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 05:47:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1kfhNH-0000tr-RL
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:41:11 -0500
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:38576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1kfhN9-0001x4-NX
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:41:11 -0500
Received: by mail-lf1-x143.google.com with SMTP id 74so7535099lfo.5
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 02:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3/tgFCye84LDijleuZW1P4TsmsmFdjk0mFFhMXbbiM4=;
 b=Ynr1vzTEXMPuMVcg1Yh0MmnBeZ29NM8bZFkiqqM3hYBpCF5GNWvh0+v+Kk1Lny7pP9
 xOU2j35SD1aTjgNLBRZN3yR1uacYseJZOXbWQaQIXayMQqXsHgIw4x2pigB56dtZ+AF7
 3hFsKic6d8xshmNIlfcIyIU3ml4HtlbTqn266r6SrrtajBhcaEhfA8ELIfZQT/8TVMsR
 IVgjzoCxYO1rciHuSukQAChJS5Rw5kDeFtObqZolE97cmTYKMKNkn5bZoT+wYPncCJoK
 3TpimWgvOxoU46o6IfFPj/ZtLgG0A43lr9qAwEbfqKmpEXvew2bLycbY2+A0HrBNOQVQ
 HnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3/tgFCye84LDijleuZW1P4TsmsmFdjk0mFFhMXbbiM4=;
 b=slGdqqHNPvo+Bv0zyv+3VfjUsaVTiyld0536kP3ja0Ne3LDZlm9No7aVUzby0ozjIl
 h9tY+ZgKVR2eY9/ouV941xwqzoEmSYyIWkO0/SatM6v2Hsl92AdYB4Y0LBRMh93wxCMJ
 XcmDsXfeTbY8UMy3POGaSp2hyWNt7+1m1Ob8VTWQcysxh+rjommRq6Z92UcjvrdycAAX
 IUrzGcYaDk11Z2DkHnNUnPF8/FKlsrEX/fk08kieLhcqwo7Da8TEIBA8Hzb+FjEB4a1m
 t2MNxNXVpztQrDz1xNMWioROwvh86E6hdUaVigAVBVeczDXnKw44LtUT5rEARuRml27x
 RQbQ==
X-Gm-Message-State: AOAM533hoJfX7mqsBh4uC7+b4tLhFyxBLz9tH5bL9tpdaGIx1rmO6fYV
 L8y4huJf5Uf4935UBu9P8h6cKw==
X-Google-Smtp-Source: ABdhPJxdCwlb7FX5OjidI6FZl6QEnApneKKQN1dp6vVxNXL7OtddhpsmrtBwHNUsvNzpgACRxABMIQ==
X-Received: by 2002:a19:e20c:: with SMTP id z12mr6033548lfg.450.1605782462098; 
 Thu, 19 Nov 2020 02:41:02 -0800 (PST)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id h6sm3912667lfj.108.2020.11.19.02.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 02:41:01 -0800 (PST)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH v2 3/5] ebpf: Added eBPF RSS loader.
Date: Thu, 19 Nov 2020 13:13:03 +0200
Message-Id: <20201119111305.485202-4-andrew@daynix.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119111305.485202-1-andrew@daynix.com>
References: <20201119111305.485202-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::143;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: yan@daynix.com, yuri.benditovich@daynix.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew <andrew@daynix.com>

Added function that loads RSS eBPF program.
Added stub functions for RSS eBPF loader.
Added meson and configuration options.

By default, eBPF feature enabled if libbpf is present in the build system.
libbpf checked in configuration shell script and meson script.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 configure            |  33 ++++++++
 ebpf/ebpf_rss-stub.c |  40 +++++++++
 ebpf/ebpf_rss.c      | 187 +++++++++++++++++++++++++++++++++++++++++++
 ebpf/ebpf_rss.h      |  44 ++++++++++
 ebpf/meson.build     |   1 +
 ebpf/trace-events    |   4 +
 ebpf/trace.h         |   2 +
 meson.build          |  11 +++
 8 files changed, 322 insertions(+)
 create mode 100644 ebpf/ebpf_rss-stub.c
 create mode 100644 ebpf/ebpf_rss.c
 create mode 100644 ebpf/ebpf_rss.h
 create mode 100644 ebpf/meson.build
 create mode 100644 ebpf/trace-events
 create mode 100644 ebpf/trace.h

diff --git a/configure b/configure
index 6df4306c88..97455950f6 100755
--- a/configure
+++ b/configure
@@ -330,6 +330,7 @@ vhost_scsi=""
 vhost_vsock=""
 vhost_user=""
 vhost_user_fs=""
+bpf=""
 kvm="auto"
 hax="auto"
 hvf="auto"
@@ -1210,6 +1211,10 @@ for opt do
   ;;
   --enable-membarrier) membarrier="yes"
   ;;
+  --disable-bpf) bpf="no"
+  ;;
+  --enable-bpf) bpf="yes"
+  ;;
   --disable-blobs) blobs="false"
   ;;
   --with-pkgversion=*) pkgversion="$optarg"
@@ -1792,6 +1797,7 @@ disabled with --disable-FEATURE, default is enabled if available:
   vhost-kernel    vhost kernel backend support
   vhost-user      vhost-user backend support
   vhost-vdpa      vhost-vdpa kernel backend support
+  bpf             BPF kernel support
   spice           spice
   rbd             rados block device (rbd)
   libiscsi        iscsi support
@@ -5347,6 +5353,30 @@ else
     membarrier=no
 fi
 
+##########################################
+# check for usable bpf system call
+if test "$bpf" = ""; then
+    have_bpf=no
+    if test "$linux" = "yes" -a "$bigendian" != "yes"; then
+        cat > $TMPC << EOF
+    #include <stdlib.h>
+    #include <bpf/libbpf.h>
+    int main(void) {
+        struct bpf_object *obj = NULL;
+        bpf_object__load(obj);
+        exit(0);
+    }
+EOF
+        if compile_prog "" "-lbpf" ; then
+            have_bpf=yes
+            bpf=yes
+        fi
+    fi
+    if test "$have_bpf" = "no"; then
+      feature_not_found "bpf" "the libbpf is not available"
+    fi
+fi
+
 ##########################################
 # check if rtnetlink.h exists and is useful
 have_rtnetlink=no
@@ -6279,6 +6309,9 @@ fi
 if test "$membarrier" = "yes" ; then
   echo "CONFIG_MEMBARRIER=y" >> $config_host_mak
 fi
+if test "$bpf" = "yes" -a "$bigendian" != "yes" -a "$linux" = "yes" ; then
+  echo "CONFIG_EBPF=y" >> $config_host_mak
+fi
 if test "$signalfd" = "yes" ; then
   echo "CONFIG_SIGNALFD=y" >> $config_host_mak
 fi
diff --git a/ebpf/ebpf_rss-stub.c b/ebpf/ebpf_rss-stub.c
new file mode 100644
index 0000000000..e71e229190
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
index 0000000000..d07fac6904
--- /dev/null
+++ b/ebpf/ebpf_rss.c
@@ -0,0 +1,187 @@
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
+#include "ebpf/tun_rss_steering.h"
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
+    struct bpf_object *object = NULL;
+    struct bpf_program *prog  = NULL;
+
+    if (ctx == NULL) {
+        return false;
+    }
+
+    object = bpf_object__open_mem(data_tun_rss_steering,
+                                  sizeof(data_tun_rss_steering), NULL);
+    if (object == NULL) {
+        trace_ebpf_error("eBPF RSS", "can not open eBPF object");
+        return false;
+    }
+
+    prog = bpf_object__find_program_by_title(object, "tun_rss_steering");
+    if (prog == NULL) {
+        trace_ebpf_error("eBPF RSS", "can not find RSS program");
+        goto l_issue;
+    }
+
+    bpf_program__set_socket_filter(prog);
+
+    if (bpf_object__load(object)) {
+        trace_ebpf_error("eBPF RSS", "can not load RSS program");
+        goto l_issue;
+    }
+
+    ctx->obj = object;
+    ctx->program_fd = bpf_program__fd(prog);
+
+    ctx->map_configuration =
+            bpf_object__find_map_fd_by_name(object,
+                                            "tap_rss_map_configurations");
+    if (ctx->map_configuration < 0) {
+        trace_ebpf_error("eBPF RSS", "can not find MAP for configurations");
+        goto l_issue;
+    }
+
+    ctx->map_toeplitz_key =
+            bpf_object__find_map_fd_by_name(object,
+                                            "tap_rss_map_toeplitz_key");
+    if (ctx->map_toeplitz_key < 0) {
+        trace_ebpf_error("eBPF RSS", "can not find MAP for toeplitz key");
+        goto l_issue;
+    }
+
+    ctx->map_indirections_table =
+            bpf_object__find_map_fd_by_name(object,
+                                            "tap_rss_map_indirection_table");
+    if (ctx->map_indirections_table < 0) {
+        trace_ebpf_error("eBPF RSS", "can not find MAP for indirections table");
+        goto l_issue;
+    }
+
+    return true;
+
+l_issue:
+    bpf_object__close(object);
+    ctx->obj = NULL;
+    return false;
+}
+
+static bool ebpf_rss_set_config(struct EBPFRSSContext *ctx,
+                                struct EBPFRSSConfig *config)
+{
+    if (!ebpf_rss_is_loaded(ctx)) {
+        return false;
+    }
+    uint32_t map_key = 0;
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
+    if (!ebpf_rss_is_loaded(ctx) || indirections_table == NULL ||
+       len > VIRTIO_NET_RSS_MAX_TABLE_LEN) {
+        return false;
+    }
+    uint32_t i = 0;
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
+    if (!ebpf_rss_is_loaded(ctx) || toeplitz_key == NULL) {
+        return false;
+    }
+    uint32_t map_key = 0;
+
+    /* prepare toeplitz key */
+    uint8_t toe[VIRTIO_NET_RSS_MAX_KEY_SIZE] = {};
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
+    bpf_object__close(ctx->obj);
+    ctx->obj = NULL;
+}
diff --git a/ebpf/ebpf_rss.h b/ebpf/ebpf_rss.h
new file mode 100644
index 0000000000..0fcb4e010f
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
+};
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
index 0000000000..f5bd5a0f01
--- /dev/null
+++ b/ebpf/meson.build
@@ -0,0 +1 @@
+common_ss.add(when: 'CONFIG_EBPF', if_true: files('ebpf_rss.c'), if_false: files('ebpf_rss-stub.c'))
diff --git a/ebpf/trace-events b/ebpf/trace-events
new file mode 100644
index 0000000000..411b1e2be3
--- /dev/null
+++ b/ebpf/trace-events
@@ -0,0 +1,4 @@
+# See docs/devel/tracing.txt for syntax documentation.
+
+# ebpf-rss.c
+ebpf_error(const char *s1, const char *s2) "error in %s: %s"
diff --git a/ebpf/trace.h b/ebpf/trace.h
new file mode 100644
index 0000000000..ad570e6691
--- /dev/null
+++ b/ebpf/trace.h
@@ -0,0 +1,2 @@
+#include "trace/trace-ebpf.h"
+
diff --git a/meson.build b/meson.build
index 47e32e1fcb..374ec88c2e 100644
--- a/meson.build
+++ b/meson.build
@@ -736,6 +736,12 @@ if not has_malloc_trim and get_option('malloc_trim').enabled()
   endif
 endif
 
+# libbpf
+libbpf = not_found
+if 'CONFIG_EBPF' in config_host
+  libbpf = cc.find_library('bpf', required: true)
+endif
+
 #################
 # config-host.h #
 #################
@@ -1368,6 +1374,7 @@ if have_system
     'backends',
     'backends/tpm',
     'chardev',
+    'ebpf',
     'hw/9pfs',
     'hw/acpi',
     'hw/alpha',
@@ -1530,6 +1537,9 @@ subdir('accel')
 subdir('plugins')
 subdir('bsd-user')
 subdir('linux-user')
+subdir('ebpf')
+
+common_ss.add(libbpf)
 
 bsd_user_ss.add(files('gdbstub.c'))
 specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
@@ -2093,6 +2103,7 @@ summary_info += {'vhost-vsock support': config_host.has_key('CONFIG_VHOST_VSOCK'
 summary_info += {'vhost-user support': config_host.has_key('CONFIG_VHOST_KERNEL')}
 summary_info += {'vhost-user-fs support': config_host.has_key('CONFIG_VHOST_USER_FS')}
 summary_info += {'vhost-vdpa support': config_host.has_key('CONFIG_VHOST_VDPA')}
+summary_info += {'bpf support': config_host.has_key('CONFIG_EBPF')}
 summary_info += {'Trace backends':    config_host['TRACE_BACKENDS']}
 if config_host['TRACE_BACKENDS'].split().contains('simple')
   summary_info += {'Trace output file': config_host['CONFIG_TRACE_FILE'] + '-<pid>'}
-- 
2.29.2



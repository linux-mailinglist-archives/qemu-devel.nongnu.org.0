Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C24803C7375
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 17:42:47 +0200 (CEST)
Received: from localhost ([::1]:58828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3KYY-0001Vw-Qt
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 11:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1m3KU8-0001z8-81
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:38:12 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:45000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1m3KU2-0003Lk-20
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:38:11 -0400
Received: by mail-lf1-x130.google.com with SMTP id u13so11794223lfs.11
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 08:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sW2/PYpCToaOj9Gpa8mCCR6YSp5ciencnjJW9oV4xM0=;
 b=X5C6MrJI8U9+vLeGGq18s2VL6coFuvEsCayVuz6Nr7pDNesYGOzsWHvIndmqhYP7EC
 INErZymM4neGtr1hkjwmTue1Dyi/MfU6/FFYqk5tjpyxeBDw3r/GuAxvFTrqRxdr5uzY
 RA35B6j5os89mVrI1q6UztSsDvVKV/t/mFKhUhK0XIKaEgX2F9Me4qKIGU2pJcQEhnRz
 O5uHD5LqFYRbQdtRz1ObzSShUl3DaqnkVVkO+cyPOMlC8DVEuxglHq2si5vXtMcyDg7N
 Hq695pAkheD1KbZiA/7dNH4HQWX1z3wkb1Rsqw8EYue8Ictu2W8Am+kpru1Z9S7+UzK4
 ykJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sW2/PYpCToaOj9Gpa8mCCR6YSp5ciencnjJW9oV4xM0=;
 b=TmcOE1z31mPOO2k5E1SAz2sNZVRddlWwtCDvhExaPim9mjLOGfNlkPYJ88H77n8gC6
 iL8ZPVTAq9ZOi40HQXLmaI+gNu2WcAZOvFo5jlndz6H4CpWYsPUe7OFbSUo+7Cj7lzPl
 DhGNSD+/b0U8iimv7nSvBP7KtBsNsizjbw9lXMdHSFt5YEib6NC76aZeqSCx4I4wOXZZ
 4uA2VTx2msmw8vfZyMDintKlNTbazO/n+yBVZi5Z7xyPCNdHkTC02qmZOQ8hGX7JHkTm
 iWFnLM4GHhFGrWzcBPeNledPACWXfbrUewEhL9JHMFzRsloAEQBivhvtR95PVSNxqgIt
 rU+g==
X-Gm-Message-State: AOAM530vi8LW5ad137mUSuEvTWR8RvG6J351yq/V7flgLgYszNtEotiH
 pfFvL2/wrGec7tZ64JpAZtPpcuyzzueSO7P6
X-Google-Smtp-Source: ABdhPJxk/Qm3Tn7DkQV/AbzW7xWeUYfHSxrs32lL++zd+cxhtY7JNSAkZf3iWN6qgLb8qEV8fOSHjw==
X-Received: by 2002:a05:6512:20a:: with SMTP id
 a10mr1905132lfo.205.1626190683824; 
 Tue, 13 Jul 2021 08:38:03 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id i5sm131447lfv.246.2021.07.13.08.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 08:38:03 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: mst@redhat.com, yuri.benditovich@daynix.com, jasowang@redhat.com,
 armbru@redhat.com, eblake@redhat.com, berrange@redhat.com
Subject: [PATCH 1/5] ebpf: Added eBPF initialization by fds and map update.
Date: Tue, 13 Jul 2021 18:37:54 +0300
Message-Id: <20210713153758.323614-2-andrew@daynix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210713153758.323614-1-andrew@daynix.com>
References: <20210713153758.323614-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::130;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x130.google.com
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
Cc: yan@daynix.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RSS maps are combined into one array map.
Changed eBPF map updates through mmaped array.
eBPF RSS context may be initialized by program fd and map fd.
virtio-net may provide fds passed by libvirt.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 ebpf/ebpf_rss-stub.c    |   6 +
 ebpf/ebpf_rss.c         | 120 +++++----
 ebpf/ebpf_rss.h         |   8 +-
 ebpf/rss.bpf.skeleton.h | 557 +++++++++++++++++++---------------------
 tools/ebpf/rss.bpf.c    |  67 ++---
 5 files changed, 365 insertions(+), 393 deletions(-)

diff --git a/ebpf/ebpf_rss-stub.c b/ebpf/ebpf_rss-stub.c
index e71e229190..8d7fae2ad9 100644
--- a/ebpf/ebpf_rss-stub.c
+++ b/ebpf/ebpf_rss-stub.c
@@ -28,6 +28,12 @@ bool ebpf_rss_load(struct EBPFRSSContext *ctx)
     return false;
 }
 
+bool ebpf_rss_load_fds(struct EBPFRSSContext *ctx, int program_fd,
+                       int config_fd, int toeplitz_fd, int table_fd)
+{
+    return false;
+}
+
 bool ebpf_rss_set_all(struct EBPFRSSContext *ctx, struct EBPFRSSConfig *config,
                       uint16_t *indirections_table, uint8_t *toeplitz_key)
 {
diff --git a/ebpf/ebpf_rss.c b/ebpf/ebpf_rss.c
index 118c68da83..bfed0b446e 100644
--- a/ebpf/ebpf_rss.c
+++ b/ebpf/ebpf_rss.c
@@ -27,19 +27,21 @@ void ebpf_rss_init(struct EBPFRSSContext *ctx)
 {
     if (ctx != NULL) {
         ctx->obj = NULL;
+        ctx->program_fd = -1;
+        ctx->mmap_configuration = NULL;
     }
 }
 
 bool ebpf_rss_is_loaded(struct EBPFRSSContext *ctx)
 {
-    return ctx != NULL && ctx->obj != NULL;
+    return ctx != NULL && (ctx->obj != NULL || ctx->program_fd != -1);
 }
 
 bool ebpf_rss_load(struct EBPFRSSContext *ctx)
 {
     struct rss_bpf *rss_bpf_ctx;
 
-    if (ctx == NULL) {
+    if (ctx == NULL || ebpf_rss_is_loaded(ctx)) {
         return false;
     }
 
@@ -61,72 +63,43 @@ bool ebpf_rss_load(struct EBPFRSSContext *ctx)
             rss_bpf_ctx->progs.tun_rss_steering_prog);
     ctx->map_configuration = bpf_map__fd(
             rss_bpf_ctx->maps.tap_rss_map_configurations);
-    ctx->map_indirections_table = bpf_map__fd(
-            rss_bpf_ctx->maps.tap_rss_map_indirection_table);
-    ctx->map_toeplitz_key = bpf_map__fd(
-            rss_bpf_ctx->maps.tap_rss_map_toeplitz_key);
+
+    ctx->mmap_configuration = mmap(NULL, qemu_real_host_page_size,
+                                   PROT_READ | PROT_WRITE, MAP_SHARED,
+                                   ctx->map_configuration, 0);
+    if (ctx->mmap_configuration == MAP_FAILED) {
+        trace_ebpf_error("eBPF RSS", "can not mmap eBPF configuration array");
+        goto error;
+    }
 
     return true;
 error:
     rss_bpf__destroy(rss_bpf_ctx);
     ctx->obj = NULL;
+    ctx->program_fd = -1;
+    ctx->mmap_configuration = NULL;
 
     return false;
 }
 
-static bool ebpf_rss_set_config(struct EBPFRSSContext *ctx,
-                                struct EBPFRSSConfig *config)
+bool ebpf_rss_load_fds(struct EBPFRSSContext *ctx, int program_fd,
+                       int config_fd, int toeplitz_fd, int table_fd)
 {
-    uint32_t map_key = 0;
-
-    if (!ebpf_rss_is_loaded(ctx)) {
+    if (ctx == NULL || ebpf_rss_is_loaded(ctx)) {
         return false;
     }
-    if (bpf_map_update_elem(ctx->map_configuration,
-                            &map_key, config, 0) < 0) {
-        return false;
-    }
-    return true;
-}
 
-static bool ebpf_rss_set_indirections_table(struct EBPFRSSContext *ctx,
-                                            uint16_t *indirections_table,
-                                            size_t len)
-{
-    uint32_t i = 0;
+    ctx->program_fd = program_fd;
+    ctx->map_configuration = config_fd;
 
-    if (!ebpf_rss_is_loaded(ctx) || indirections_table == NULL ||
-       len > VIRTIO_NET_RSS_MAX_TABLE_LEN) {
+    ctx->mmap_configuration = mmap(NULL, qemu_real_host_page_size,
+                                   PROT_READ | PROT_WRITE, MAP_SHARED,
+                                   ctx->map_configuration, 0);
+    if (ctx->mmap_configuration == MAP_FAILED) {
+        trace_ebpf_error("eBPF RSS", "can not mmap eBPF configuration array");
         return false;
     }
 
-    for (; i < len; ++i) {
-        if (bpf_map_update_elem(ctx->map_indirections_table, &i,
-                                indirections_table + i, 0) < 0) {
-            return false;
-        }
-    }
-    return true;
-}
-
-static bool ebpf_rss_set_toepliz_key(struct EBPFRSSContext *ctx,
-                                     uint8_t *toeplitz_key)
-{
-    uint32_t map_key = 0;
-
-    /* prepare toeplitz key */
-    uint8_t toe[VIRTIO_NET_RSS_MAX_KEY_SIZE] = {};
-
-    if (!ebpf_rss_is_loaded(ctx) || toeplitz_key == NULL) {
-        return false;
-    }
-    memcpy(toe, toeplitz_key, VIRTIO_NET_RSS_MAX_KEY_SIZE);
-    *(uint32_t *)toe = ntohl(*(uint32_t *)toe);
-
-    if (bpf_map_update_elem(ctx->map_toeplitz_key, &map_key, toe,
-                            0) < 0) {
-        return false;
-    }
     return true;
 }
 
@@ -134,21 +107,32 @@ bool ebpf_rss_set_all(struct EBPFRSSContext *ctx, struct EBPFRSSConfig *config,
                       uint16_t *indirections_table, uint8_t *toeplitz_key)
 {
     if (!ebpf_rss_is_loaded(ctx) || config == NULL ||
-        indirections_table == NULL || toeplitz_key == NULL) {
+        indirections_table == NULL || toeplitz_key == NULL ||
+        config->indirections_len > VIRTIO_NET_RSS_MAX_TABLE_LEN) {
         return false;
     }
 
-    if (!ebpf_rss_set_config(ctx, config)) {
-        return false;
-    }
+    struct {
+        struct EBPFRSSConfig config;
+        uint8_t toeplitz_key[VIRTIO_NET_RSS_MAX_KEY_SIZE];
+        uint16_t indirections_table[VIRTIO_NET_RSS_MAX_TABLE_LEN];
+    } __attribute__((packed)) ebpf_config;
 
-    if (!ebpf_rss_set_indirections_table(ctx, indirections_table,
-                                      config->indirections_len)) {
-        return false;
-    }
+    /* Setting up configurations */
+    memcpy(&ebpf_config.config, config, sizeof(*config));
 
-    if (!ebpf_rss_set_toepliz_key(ctx, toeplitz_key)) {
-        return false;
+    /* Setting up toeplitz key data */
+    memcpy(&ebpf_config.toeplitz_key, toeplitz_key,
+           VIRTIO_NET_RSS_MAX_KEY_SIZE);
+    *(uint32_t *)ebpf_config.toeplitz_key =
+            ntohl(*(uint32_t *)ebpf_config.toeplitz_key);
+
+    /* Setting up indirections table */
+    memcpy(&ebpf_config.indirections_table, indirections_table,
+           config->indirections_len * sizeof(*indirections_table));
+
+    if (ctx->mmap_configuration != NULL) {
+        memcpy(ctx->mmap_configuration, &ebpf_config, sizeof(ebpf_config));
     }
 
     return true;
@@ -160,6 +144,18 @@ void ebpf_rss_unload(struct EBPFRSSContext *ctx)
         return;
     }
 
-    rss_bpf__destroy(ctx->obj);
+    if (ctx->mmap_configuration) {
+        munmap(ctx->mmap_configuration, qemu_real_host_page_size);
+    }
+
+    if (ctx->obj != NULL) {
+        rss_bpf__destroy(ctx->obj);
+    } else {
+        close(ctx->program_fd);
+        close(ctx->map_configuration);
+    }
+
     ctx->obj = NULL;
+    ctx->program_fd = -1;
+    ctx->mmap_configuration = NULL;
 }
diff --git a/ebpf/ebpf_rss.h b/ebpf/ebpf_rss.h
index bf3f2572c7..40b1c35d5f 100644
--- a/ebpf/ebpf_rss.h
+++ b/ebpf/ebpf_rss.h
@@ -14,12 +14,13 @@
 #ifndef QEMU_EBPF_RSS_H
 #define QEMU_EBPF_RSS_H
 
+#define EBPF_RSS_MAX_FDS 2
+
 struct EBPFRSSContext {
     void *obj;
     int program_fd;
     int map_configuration;
-    int map_toeplitz_key;
-    int map_indirections_table;
+    void *mmap_configuration;
 };
 
 struct EBPFRSSConfig {
@@ -36,6 +37,9 @@ bool ebpf_rss_is_loaded(struct EBPFRSSContext *ctx);
 
 bool ebpf_rss_load(struct EBPFRSSContext *ctx);
 
+bool ebpf_rss_load_fds(struct EBPFRSSContext *ctx, int program_fd,
+                       int config_fd, int toeplitz_fd, int table_fd);
+
 bool ebpf_rss_set_all(struct EBPFRSSContext *ctx, struct EBPFRSSConfig *config,
                       uint16_t *indirections_table, uint8_t *toeplitz_key);
 
diff --git a/ebpf/rss.bpf.skeleton.h b/ebpf/rss.bpf.skeleton.h
index 126683eb87..52fb49daa8 100644
--- a/ebpf/rss.bpf.skeleton.h
+++ b/ebpf/rss.bpf.skeleton.h
@@ -12,8 +12,6 @@ struct rss_bpf {
 	struct bpf_object *obj;
 	struct {
 		struct bpf_map *tap_rss_map_configurations;
-		struct bpf_map *tap_rss_map_indirection_table;
-		struct bpf_map *tap_rss_map_toeplitz_key;
 	} maps;
 	struct {
 		struct bpf_program *tun_rss_steering_prog;
@@ -109,7 +107,7 @@ rss_bpf__create_skeleton(struct rss_bpf *obj)
 	s->obj = &obj->obj;
 
 	/* maps */
-	s->map_cnt = 3;
+	s->map_cnt = 1;
 	s->map_skel_sz = sizeof(*s->maps);
 	s->maps = (struct bpf_map_skeleton *)calloc(s->map_cnt, s->map_skel_sz);
 	if (!s->maps)
@@ -118,12 +116,6 @@ rss_bpf__create_skeleton(struct rss_bpf *obj)
 	s->maps[0].name = "tap_rss_map_configurations";
 	s->maps[0].map = &obj->maps.tap_rss_map_configurations;
 
-	s->maps[1].name = "tap_rss_map_indirection_table";
-	s->maps[1].map = &obj->maps.tap_rss_map_indirection_table;
-
-	s->maps[2].name = "tap_rss_map_toeplitz_key";
-	s->maps[2].map = &obj->maps.tap_rss_map_toeplitz_key;
-
 	/* programs */
 	s->prog_cnt = 1;
 	s->prog_skel_sz = sizeof(*s->progs);
@@ -135,292 +127,281 @@ rss_bpf__create_skeleton(struct rss_bpf *obj)
 	s->progs[0].prog = &obj->progs.tun_rss_steering_prog;
 	s->progs[0].link = &obj->links.tun_rss_steering_prog;
 
-	s->data_sz = 8088;
+	s->data_sz = 7768;
 	s->data = (void *)"\
 \x7f\x45\x4c\x46\x02\x01\x01\0\0\0\0\0\0\0\0\0\x01\0\xf7\0\x01\0\0\0\0\0\0\0\0\
-\0\0\0\0\0\0\0\0\0\0\0\x18\x1d\0\0\0\0\0\0\0\0\0\0\x40\0\0\0\0\0\x40\0\x0a\0\
-\x01\0\xbf\x18\0\0\0\0\0\0\xb7\x01\0\0\0\0\0\0\x63\x1a\x4c\xff\0\0\0\0\xbf\xa7\
-\0\0\0\0\0\0\x07\x07\0\0\x4c\xff\xff\xff\x18\x01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
-\xbf\x72\0\0\0\0\0\0\x85\0\0\0\x01\0\0\0\xbf\x06\0\0\0\0\0\0\x18\x01\0\0\0\0\0\
-\0\0\0\0\0\0\0\0\0\xbf\x72\0\0\0\0\0\0\x85\0\0\0\x01\0\0\0\xbf\x07\0\0\0\0\0\0\
-\x18\0\0\0\xff\xff\xff\xff\0\0\0\0\0\0\0\0\x15\x06\x66\x02\0\0\0\0\xbf\x79\0\0\
-\0\0\0\0\x15\x09\x64\x02\0\0\0\0\x71\x61\0\0\0\0\0\0\x55\x01\x01\0\0\0\0\0\x05\
-\0\x5d\x02\0\0\0\0\xb7\x01\0\0\0\0\0\0\x63\x1a\xc0\xff\0\0\0\0\x7b\x1a\xb8\xff\
-\0\0\0\0\x7b\x1a\xb0\xff\0\0\0\0\x7b\x1a\xa8\xff\0\0\0\0\x7b\x1a\xa0\xff\0\0\0\
-\0\x63\x1a\x98\xff\0\0\0\0\x7b\x1a\x90\xff\0\0\0\0\x7b\x1a\x88\xff\0\0\0\0\x7b\
-\x1a\x80\xff\0\0\0\0\x7b\x1a\x78\xff\0\0\0\0\x7b\x1a\x70\xff\0\0\0\0\x7b\x1a\
-\x68\xff\0\0\0\0\x7b\x1a\x60\xff\0\0\0\0\x7b\x1a\x58\xff\0\0\0\0\x7b\x1a\x50\
-\xff\0\0\0\0\x15\x08\x4c\x02\0\0\0\0\x6b\x1a\xd0\xff\0\0\0\0\xbf\xa3\0\0\0\0\0\
-\0\x07\x03\0\0\xd0\xff\xff\xff\xbf\x81\0\0\0\0\0\0\xb7\x02\0\0\x0c\0\0\0\xb7\
-\x04\0\0\x02\0\0\0\xb7\x05\0\0\0\0\0\0\x85\0\0\0\x44\0\0\0\x67\0\0\0\x20\0\0\0\
-\x77\0\0\0\x20\0\0\0\x55\0\x11\0\0\0\0\0\xb7\x02\0\0\x10\0\0\0\x69\xa1\xd0\xff\
-\0\0\0\0\xbf\x13\0\0\0\0\0\0\xdc\x03\0\0\x10\0\0\0\x15\x03\x02\0\0\x81\0\0\x55\
-\x03\x0c\0\xa8\x88\0\0\xb7\x02\0\0\x14\0\0\0\xbf\xa3\0\0\0\0\0\0\x07\x03\0\0\
-\xd0\xff\xff\xff\xbf\x81\0\0\0\0\0\0\xb7\x04\0\0\x02\0\0\0\xb7\x05\0\0\0\0\0\0\
-\x85\0\0\0\x44\0\0\0\x69\xa1\xd0\xff\0\0\0\0\x67\0\0\0\x20\0\0\0\x77\0\0\0\x20\
-\0\0\0\x15\0\x01\0\0\0\0\0\x05\0\x2f\x02\0\0\0\0\x15\x01\x2e\x02\0\0\0\0\x7b\
-\x9a\x30\xff\0\0\0\0\x15\x01\x57\0\x86\xdd\0\0\x55\x01\x3b\0\x08\0\0\0\x7b\x7a\
-\x20\xff\0\0\0\0\xb7\x07\0\0\x01\0\0\0\x73\x7a\x50\xff\0\0\0\0\xb7\x01\0\0\0\0\
-\0\0\x63\x1a\xe0\xff\0\0\0\0\x7b\x1a\xd8\xff\0\0\0\0\x7b\x1a\xd0\xff\0\0\0\0\
-\xbf\xa3\0\0\0\0\0\0\x07\x03\0\0\xd0\xff\xff\xff\xbf\x81\0\0\0\0\0\0\xb7\x02\0\
-\0\0\0\0\0\xb7\x04\0\0\x14\0\0\0\xb7\x05\0\0\x01\0\0\0\x85\0\0\0\x44\0\0\0\x67\
-\0\0\0\x20\0\0\0\x77\0\0\0\x20\0\0\0\x55\0\x1a\x02\0\0\0\0\x69\xa1\xd6\xff\0\0\
-\0\0\x55\x01\x01\0\0\0\0\0\xb7\x07\0\0\0\0\0\0\x61\xa1\xdc\xff\0\0\0\0\x63\x1a\
-\x5c\xff\0\0\0\0\x61\xa1\xe0\xff\0\0\0\0\x63\x1a\x60\xff\0\0\0\0\x73\x7a\x56\
-\xff\0\0\0\0\x71\xa9\xd9\xff\0\0\0\0\x71\xa1\xd0\xff\0\0\0\0\x67\x01\0\0\x02\0\
-\0\0\x57\x01\0\0\x3c\0\0\0\x7b\x1a\x40\xff\0\0\0\0\x79\xa7\x20\xff\0\0\0\0\xbf\
+\0\0\0\0\0\0\0\0\0\0\0\xd8\x1b\0\0\0\0\0\0\0\0\0\0\x40\0\0\0\0\0\x40\0\x0a\0\
+\x01\0\xbf\x18\0\0\0\0\0\0\xb7\x01\0\0\0\0\0\0\x63\x1a\x4c\xff\0\0\0\0\xbf\xa2\
+\0\0\0\0\0\0\x07\x02\0\0\x4c\xff\xff\xff\x18\x01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
+\x85\0\0\0\x01\0\0\0\xbf\x06\0\0\0\0\0\0\x18\0\0\0\xff\xff\xff\xff\0\0\0\0\0\0\
+\0\0\x15\x06\x35\0\0\0\0\0\x71\x61\0\0\0\0\0\0\x55\x01\x01\0\0\0\0\0\x05\0\x2d\
+\0\0\0\0\0\xb7\x01\0\0\0\0\0\0\x63\x1a\xc0\xff\0\0\0\0\x7b\x1a\xb8\xff\0\0\0\0\
+\x7b\x1a\xb0\xff\0\0\0\0\x7b\x1a\xa8\xff\0\0\0\0\x7b\x1a\xa0\xff\0\0\0\0\x63\
+\x1a\x98\xff\0\0\0\0\x7b\x1a\x90\xff\0\0\0\0\x7b\x1a\x88\xff\0\0\0\0\x7b\x1a\
+\x80\xff\0\0\0\0\x7b\x1a\x78\xff\0\0\0\0\x7b\x1a\x70\xff\0\0\0\0\x7b\x1a\x68\
+\xff\0\0\0\0\x7b\x1a\x60\xff\0\0\0\0\x7b\x1a\x58\xff\0\0\0\0\x7b\x1a\x50\xff\0\
+\0\0\0\x15\x08\xee\xff\0\0\0\0\x6b\x1a\xd0\xff\0\0\0\0\xbf\xa3\0\0\0\0\0\0\x07\
+\x03\0\0\xd0\xff\xff\xff\xbf\x81\0\0\0\0\0\0\xb7\x02\0\0\x0c\0\0\0\xb7\x04\0\0\
+\x02\0\0\0\xb7\x05\0\0\0\0\0\0\x85\0\0\0\x44\0\0\0\x67\0\0\0\x20\0\0\0\x77\0\0\
+\0\x20\0\0\0\x55\0\x11\0\0\0\0\0\xb7\x02\0\0\x10\0\0\0\x69\xa1\xd0\xff\0\0\0\0\
+\xbf\x13\0\0\0\0\0\0\xdc\x03\0\0\x10\0\0\0\x15\x03\x02\0\0\x81\0\0\x55\x03\x11\
+\0\xa8\x88\0\0\xb7\x02\0\0\x14\0\0\0\xbf\xa3\0\0\0\0\0\0\x07\x03\0\0\xd0\xff\
+\xff\xff\xbf\x81\0\0\0\0\0\0\xb7\x04\0\0\x02\0\0\0\xb7\x05\0\0\0\0\0\0\x85\0\0\
+\0\x44\0\0\0\x69\xa1\xd0\xff\0\0\0\0\x67\0\0\0\x20\0\0\0\x77\0\0\0\x20\0\0\0\
+\x15\0\x06\0\0\0\0\0\x07\x06\0\0\x08\0\0\0\x71\x61\0\0\0\0\0\0\x71\x60\x01\0\0\
+\0\0\0\x67\0\0\0\x08\0\0\0\x4f\x10\0\0\0\0\0\0\x95\0\0\0\0\0\0\0\x15\x01\xcb\
+\xff\0\0\0\0\x15\x01\x53\0\x86\xdd\0\0\x55\x01\x38\0\x08\0\0\0\xb7\x07\0\0\x01\
+\0\0\0\x73\x7a\x50\xff\0\0\0\0\xb7\x01\0\0\0\0\0\0\x63\x1a\xe0\xff\0\0\0\0\x7b\
+\x1a\xd8\xff\0\0\0\0\x7b\x1a\xd0\xff\0\0\0\0\xbf\xa3\0\0\0\0\0\0\x07\x03\0\0\
+\xd0\xff\xff\xff\xbf\x81\0\0\0\0\0\0\xb7\x02\0\0\0\0\0\0\xb7\x04\0\0\x14\0\0\0\
+\xb7\x05\0\0\x01\0\0\0\x85\0\0\0\x44\0\0\0\x67\0\0\0\x20\0\0\0\x77\0\0\0\x20\0\
+\0\0\x55\0\xb9\xff\0\0\0\0\x69\xa1\xd6\xff\0\0\0\0\x55\x01\x01\0\0\0\0\0\xb7\
+\x07\0\0\0\0\0\0\x61\xa1\xdc\xff\0\0\0\0\x63\x1a\x5c\xff\0\0\0\0\x61\xa1\xe0\
+\xff\0\0\0\0\x63\x1a\x60\xff\0\0\0\0\x73\x7a\x56\xff\0\0\0\0\x71\xa9\xd9\xff\0\
+\0\0\0\x71\xa7\xd0\xff\0\0\0\0\x67\x07\0\0\x02\0\0\0\x57\x07\0\0\x3c\0\0\0\xbf\
 \x91\0\0\0\0\0\0\x57\x01\0\0\xff\0\0\0\x15\x01\x19\0\0\0\0\0\x71\xa1\x56\xff\0\
-\0\0\0\x55\x01\x17\0\0\0\0\0\x57\x09\0\0\xff\0\0\0\x15\x09\x7a\x01\x11\0\0\0\
+\0\0\0\x55\x01\x17\0\0\0\0\0\x57\x09\0\0\xff\0\0\0\x15\x09\x76\x01\x11\0\0\0\
 \x55\x09\x14\0\x06\0\0\0\xb7\x01\0\0\x01\0\0\0\x73\x1a\x53\xff\0\0\0\0\xb7\x01\
 \0\0\0\0\0\0\x63\x1a\xe0\xff\0\0\0\0\x7b\x1a\xd8\xff\0\0\0\0\x7b\x1a\xd0\xff\0\
-\0\0\0\xbf\xa3\0\0\0\0\0\0\x07\x03\0\0\xd0\xff\xff\xff\xbf\x81\0\0\0\0\0\0\x79\
-\xa2\x40\xff\0\0\0\0\xb7\x04\0\0\x14\0\0\0\xb7\x05\0\0\x01\0\0\0\x85\0\0\0\x44\
-\0\0\0\x67\0\0\0\x20\0\0\0\x77\0\0\0\x20\0\0\0\x55\0\xf4\x01\0\0\0\0\x69\xa1\
-\xd0\xff\0\0\0\0\x6b\x1a\x58\xff\0\0\0\0\x69\xa1\xd2\xff\0\0\0\0\x6b\x1a\x5a\
-\xff\0\0\0\0\x71\xa1\x50\xff\0\0\0\0\x15\x01\xd4\0\0\0\0\0\x71\x62\x03\0\0\0\0\
-\0\x67\x02\0\0\x08\0\0\0\x71\x61\x02\0\0\0\0\0\x4f\x12\0\0\0\0\0\0\x71\x63\x04\
-\0\0\0\0\0\x71\x61\x05\0\0\0\0\0\x67\x01\0\0\x08\0\0\0\x4f\x31\0\0\0\0\0\0\x67\
-\x01\0\0\x10\0\0\0\x4f\x21\0\0\0\0\0\0\x71\xa2\x53\xff\0\0\0\0\x79\xa0\x30\xff\
-\0\0\0\0\x15\x02\x06\x01\0\0\0\0\xbf\x12\0\0\0\0\0\0\x57\x02\0\0\x02\0\0\0\x15\
-\x02\x03\x01\0\0\0\0\x61\xa1\x5c\xff\0\0\0\0\x63\x1a\xa0\xff\0\0\0\0\x61\xa1\
-\x60\xff\0\0\0\0\x63\x1a\xa4\xff\0\0\0\0\x69\xa1\x58\xff\0\0\0\0\x6b\x1a\xa8\
-\xff\0\0\0\0\x69\xa1\x5a\xff\0\0\0\0\x6b\x1a\xaa\xff\0\0\0\0\x05\0\x65\x01\0\0\
-\0\0\xb7\x01\0\0\x01\0\0\0\x73\x1a\x51\xff\0\0\0\0\xb7\x01\0\0\0\0\0\0\x7b\x1a\
-\xf0\xff\0\0\0\0\x7b\x1a\xe8\xff\0\0\0\0\x7b\x1a\xe0\xff\0\0\0\0\x7b\x1a\xd8\
-\xff\0\0\0\0\x7b\x1a\xd0\xff\0\0\0\0\xbf\xa3\0\0\0\0\0\0\x07\x03\0\0\xd0\xff\
-\xff\xff\xb7\x01\0\0\x28\0\0\0\x7b\x1a\x40\xff\0\0\0\0\xbf\x81\0\0\0\0\0\0\xb7\
-\x02\0\0\0\0\0\0\xb7\x04\0\0\x28\0\0\0\xb7\x05\0\0\x01\0\0\0\x85\0\0\0\x44\0\0\
-\0\x67\0\0\0\x20\0\0\0\x77\0\0\0\x20\0\0\0\x55\0\x10\x01\0\0\0\0\x79\xa1\xe0\
-\xff\0\0\0\0\x63\x1a\x64\xff\0\0\0\0\x77\x01\0\0\x20\0\0\0\x63\x1a\x68\xff\0\0\
-\0\0\x79\xa1\xd8\xff\0\0\0\0\x63\x1a\x5c\xff\0\0\0\0\x77\x01\0\0\x20\0\0\0\x63\
-\x1a\x60\xff\0\0\0\0\x79\xa1\xe8\xff\0\0\0\0\x63\x1a\x6c\xff\0\0\0\0\x77\x01\0\
-\0\x20\0\0\0\x63\x1a\x70\xff\0\0\0\0\x79\xa1\xf0\xff\0\0\0\0\x63\x1a\x74\xff\0\
-\0\0\0\x77\x01\0\0\x20\0\0\0\x63\x1a\x78\xff\0\0\0\0\x71\xa9\xd6\xff\0\0\0\0\
-\x25\x09\xff\0\x3c\0\0\0\xb7\x01\0\0\x01\0\0\0\x6f\x91\0\0\0\0\0\0\x18\x02\0\0\
-\x01\0\0\0\0\0\0\0\0\x18\0\x1c\x5f\x21\0\0\0\0\0\0\x55\x01\x01\0\0\0\0\0\x05\0\
-\xf8\0\0\0\0\0\xb7\x01\0\0\0\0\0\0\x6b\x1a\xfe\xff\0\0\0\0\xb7\x01\0\0\x28\0\0\
-\0\x7b\x1a\x40\xff\0\0\0\0\xbf\xa1\0\0\0\0\0\0\x07\x01\0\0\x8c\xff\xff\xff\x7b\
-\x1a\x18\xff\0\0\0\0\xbf\xa1\0\0\0\0\0\0\x07\x01\0\0\x7c\xff\xff\xff\x7b\x1a\
-\x10\xff\0\0\0\0\xb7\x01\0\0\0\0\0\0\x7b\x1a\x28\xff\0\0\0\0\x7b\x7a\x20\xff\0\
-\0\0\0\xbf\xa3\0\0\0\0\0\0\x07\x03\0\0\xfe\xff\xff\xff\xbf\x81\0\0\0\0\0\0\x79\
-\xa2\x40\xff\0\0\0\0\xb7\x04\0\0\x02\0\0\0\xb7\x05\0\0\x01\0\0\0\x85\0\0\0\x44\
-\0\0\0\x67\0\0\0\x20\0\0\0\x77\0\0\0\x20\0\0\0\x15\0\x01\0\0\0\0\0\x05\0\x90\
-\x01\0\0\0\0\xbf\x91\0\0\0\0\0\0\x15\x01\x23\0\x3c\0\0\0\x15\x01\x59\0\x2c\0\0\
-\0\x55\x01\x5a\0\x2b\0\0\0\xb7\x01\0\0\0\0\0\0\x63\x1a\xf8\xff\0\0\0\0\xbf\xa3\
-\0\0\0\0\0\0\x07\x03\0\0\xf8\xff\xff\xff\xbf\x81\0\0\0\0\0\0\x79\xa2\x40\xff\0\
-\0\0\0\xb7\x04\0\0\x04\0\0\0\xb7\x05\0\0\x01\0\0\0\x85\0\0\0\x44\0\0\0\xbf\x01\
-\0\0\0\0\0\0\x67\x01\0\0\x20\0\0\0\x77\x01\0\0\x20\0\0\0\x55\x01\x03\x01\0\0\0\
-\0\x71\xa1\xfa\xff\0\0\0\0\x55\x01\x4b\0\x02\0\0\0\x71\xa1\xf9\xff\0\0\0\0\x55\
-\x01\x49\0\x02\0\0\0\x71\xa1\xfb\xff\0\0\0\0\x55\x01\x47\0\x01\0\0\0\x79\xa2\
-\x40\xff\0\0\0\0\x07\x02\0\0\x08\0\0\0\xbf\x81\0\0\0\0\0\0\x79\xa3\x18\xff\0\0\
-\0\0\xb7\x04\0\0\x10\0\0\0\xb7\x05\0\0\x01\0\0\0\x85\0\0\0\x44\0\0\0\xbf\x01\0\
-\0\0\0\0\0\x67\x01\0\0\x20\0\0\0\x77\x01\0\0\x20\0\0\0\x55\x01\xf2\0\0\0\0\0\
-\xb7\x01\0\0\x01\0\0\0\x73\x1a\x55\xff\0\0\0\0\x05\0\x39\0\0\0\0\0\xb7\x01\0\0\
-\0\0\0\0\x6b\x1a\xf8\xff\0\0\0\0\xb7\x09\0\0\x02\0\0\0\xb7\x07\0\0\x1e\0\0\0\
-\x05\0\x0e\0\0\0\0\0\x79\xa2\x38\xff\0\0\0\0\x0f\x29\0\0\0\0\0\0\xbf\x92\0\0\0\
-\0\0\0\x07\x02\0\0\x01\0\0\0\x71\xa3\xff\xff\0\0\0\0\x67\x03\0\0\x03\0\0\0\x2d\
-\x23\x02\0\0\0\0\0\x79\xa7\x20\xff\0\0\0\0\x05\0\x2b\0\0\0\0\0\x07\x07\0\0\xff\
-\xff\xff\xff\xbf\x72\0\0\0\0\0\0\x67\x02\0\0\x20\0\0\0\x77\x02\0\0\x20\0\0\0\
-\x15\x02\xf9\xff\0\0\0\0\x7b\x9a\x38\xff\0\0\0\0\x79\xa1\x40\xff\0\0\0\0\x0f\
-\x19\0\0\0\0\0\0\xbf\xa3\0\0\0\0\0\0\x07\x03\0\0\xf8\xff\xff\xff\xbf\x81\0\0\0\
-\0\0\0\xbf\x92\0\0\0\0\0\0\xb7\x04\0\0\x02\0\0\0\xb7\x05\0\0\x01\0\0\0\x85\0\0\
-\0\x44\0\0\0\xbf\x01\0\0\0\0\0\0\x67\x01\0\0\x20\0\0\0\x77\x01\0\0\x20\0\0\0\
-\x55\x01\x94\0\0\0\0\0\x71\xa2\xf8\xff\0\0\0\0\x55\x02\x0f\0\xc9\0\0\0\x07\x09\
-\0\0\x02\0\0\0\xbf\x81\0\0\0\0\0\0\xbf\x92\0\0\0\0\0\0\x79\xa3\x10\xff\0\0\0\0\
-\xb7\x04\0\0\x10\0\0\0\xb7\x05\0\0\x01\0\0\0\x85\0\0\0\x44\0\0\0\xbf\x01\0\0\0\
-\0\0\0\x67\x01\0\0\x20\0\0\0\x77\x01\0\0\x20\0\0\0\x55\x01\x87\0\0\0\0\0\xb7\
-\x01\0\0\x01\0\0\0\x73\x1a\x54\xff\0\0\0\0\x79\xa7\x20\xff\0\0\0\0\x05\0\x07\0\
-\0\0\0\0\xb7\x09\0\0\x01\0\0\0\x15\x02\xd1\xff\0\0\0\0\x71\xa9\xf9\xff\0\0\0\0\
-\x07\x09\0\0\x02\0\0\0\x05\0\xce\xff\0\0\0\0\xb7\x01\0\0\x01\0\0\0\x73\x1a\x56\
-\xff\0\0\0\0\x71\xa1\xff\xff\0\0\0\0\x67\x01\0\0\x03\0\0\0\x79\xa2\x40\xff\0\0\
-\0\0\x0f\x12\0\0\0\0\0\0\x07\x02\0\0\x08\0\0\0\x7b\x2a\x40\xff\0\0\0\0\x71\xa9\
-\xfe\xff\0\0\0\0\x25\x09\x0e\0\x3c\0\0\0\xb7\x01\0\0\x01\0\0\0\x6f\x91\0\0\0\0\
+\0\0\0\xbf\xa3\0\0\0\0\0\0\x07\x03\0\0\xd0\xff\xff\xff\xbf\x81\0\0\0\0\0\0\xbf\
+\x72\0\0\0\0\0\0\xb7\x04\0\0\x14\0\0\0\xb7\x05\0\0\x01\0\0\0\x85\0\0\0\x44\0\0\
+\0\x67\0\0\0\x20\0\0\0\x77\0\0\0\x20\0\0\0\x55\0\x95\xff\0\0\0\0\x69\xa1\xd0\
+\xff\0\0\0\0\x6b\x1a\x58\xff\0\0\0\0\x69\xa1\xd2\xff\0\0\0\0\x6b\x1a\x5a\xff\0\
+\0\0\0\x71\xa1\x50\xff\0\0\0\0\x15\x01\xd0\0\0\0\0\0\x71\x62\x03\0\0\0\0\0\x67\
+\x02\0\0\x08\0\0\0\x71\x61\x02\0\0\0\0\0\x4f\x12\0\0\0\0\0\0\x71\x63\x04\0\0\0\
+\0\0\x71\x61\x05\0\0\0\0\0\x67\x01\0\0\x08\0\0\0\x4f\x31\0\0\0\0\0\0\x67\x01\0\
+\0\x10\0\0\0\x4f\x21\0\0\0\0\0\0\x71\xa2\x53\xff\0\0\0\0\x15\x02\x02\x01\0\0\0\
+\0\xbf\x12\0\0\0\0\0\0\x57\x02\0\0\x02\0\0\0\x15\x02\xff\0\0\0\0\0\x61\xa1\x5c\
+\xff\0\0\0\0\x63\x1a\xa0\xff\0\0\0\0\x61\xa1\x60\xff\0\0\0\0\x63\x1a\xa4\xff\0\
+\0\0\0\x69\xa1\x58\xff\0\0\0\0\x6b\x1a\xa8\xff\0\0\0\0\x69\xa1\x5a\xff\0\0\0\0\
+\x6b\x1a\xaa\xff\0\0\0\0\x05\0\x62\x01\0\0\0\0\xb7\x01\0\0\x01\0\0\0\x73\x1a\
+\x51\xff\0\0\0\0\xb7\x01\0\0\0\0\0\0\x7b\x1a\xf0\xff\0\0\0\0\x7b\x1a\xe8\xff\0\
+\0\0\0\x7b\x1a\xe0\xff\0\0\0\0\x7b\x1a\xd8\xff\0\0\0\0\x7b\x1a\xd0\xff\0\0\0\0\
+\xbf\xa3\0\0\0\0\0\0\x07\x03\0\0\xd0\xff\xff\xff\xb7\x07\0\0\x28\0\0\0\xbf\x81\
+\0\0\0\0\0\0\xb7\x02\0\0\0\0\0\0\xb7\x04\0\0\x28\0\0\0\xb7\x05\0\0\x01\0\0\0\
+\x85\0\0\0\x44\0\0\0\x67\0\0\0\x20\0\0\0\x77\0\0\0\x20\0\0\0\x55\0\x0e\x01\0\0\
+\0\0\x79\xa1\xe0\xff\0\0\0\0\x63\x1a\x64\xff\0\0\0\0\x77\x01\0\0\x20\0\0\0\x63\
+\x1a\x68\xff\0\0\0\0\x79\xa1\xd8\xff\0\0\0\0\x63\x1a\x5c\xff\0\0\0\0\x77\x01\0\
+\0\x20\0\0\0\x63\x1a\x60\xff\0\0\0\0\x79\xa1\xe8\xff\0\0\0\0\x63\x1a\x6c\xff\0\
+\0\0\0\x77\x01\0\0\x20\0\0\0\x63\x1a\x70\xff\0\0\0\0\x79\xa1\xf0\xff\0\0\0\0\
+\x63\x1a\x74\xff\0\0\0\0\x77\x01\0\0\x20\0\0\0\x63\x1a\x78\xff\0\0\0\0\x71\xa9\
+\xd6\xff\0\0\0\0\x25\x09\xfd\0\x3c\0\0\0\xb7\x01\0\0\x01\0\0\0\x6f\x91\0\0\0\0\
 \0\0\x18\x02\0\0\x01\0\0\0\0\0\0\0\0\x18\0\x1c\x5f\x21\0\0\0\0\0\0\x55\x01\x01\
-\0\0\0\0\0\x05\0\x07\0\0\0\0\0\x79\xa1\x28\xff\0\0\0\0\x07\x01\0\0\x01\0\0\0\
-\x7b\x1a\x28\xff\0\0\0\0\x67\x01\0\0\x20\0\0\0\x77\x01\0\0\x20\0\0\0\x55\x01\
-\x82\xff\x0b\0\0\0\x05\0\x10\xff\0\0\0\0\x15\x09\xf8\xff\x87\0\0\0\x05\0\xfd\
-\xff\0\0\0\0\x71\xa1\x51\xff\0\0\0\0\x79\xa0\x30\xff\0\0\0\0\x15\x01\x17\x01\0\
-\0\0\0\x71\x62\x03\0\0\0\0\0\x67\x02\0\0\x08\0\0\0\x71\x61\x02\0\0\0\0\0\x4f\
-\x12\0\0\0\0\0\0\x71\x63\x04\0\0\0\0\0\x71\x61\x05\0\0\0\0\0\x67\x01\0\0\x08\0\
-\0\0\x4f\x31\0\0\0\0\0\0\x67\x01\0\0\x10\0\0\0\x4f\x21\0\0\0\0\0\0\x71\xa2\x53\
-\xff\0\0\0\0\x15\x02\x3d\0\0\0\0\0\xbf\x12\0\0\0\0\0\0\x57\x02\0\0\x10\0\0\0\
-\x15\x02\x3a\0\0\0\0\0\xbf\xa2\0\0\0\0\0\0\x07\x02\0\0\x5c\xff\xff\xff\x71\xa4\
-\x54\xff\0\0\0\0\xbf\x23\0\0\0\0\0\0\x15\x04\x02\0\0\0\0\0\xbf\xa3\0\0\0\0\0\0\
-\x07\x03\0\0\x7c\xff\xff\xff\x67\x01\0\0\x38\0\0\0\xc7\x01\0\0\x38\0\0\0\x65\
-\x01\x01\0\xff\xff\xff\xff\xbf\x32\0\0\0\0\0\0\xbf\xa3\0\0\0\0\0\0\x07\x03\0\0\
-\x6c\xff\xff\xff\x71\xa5\x55\xff\0\0\0\0\xbf\x34\0\0\0\0\0\0\x15\x05\x02\0\0\0\
-\0\0\xbf\xa4\0\0\0\0\0\0\x07\x04\0\0\x8c\xff\xff\xff\x65\x01\x01\0\xff\xff\xff\
-\xff\xbf\x43\0\0\0\0\0\0\x61\x21\x04\0\0\0\0\0\x67\x01\0\0\x20\0\0\0\x61\x24\0\
-\0\0\0\0\0\x4f\x41\0\0\0\0\0\0\x7b\x1a\xa0\xff\0\0\0\0\x61\x21\x08\0\0\0\0\0\
-\x61\x22\x0c\0\0\0\0\0\x67\x02\0\0\x20\0\0\0\x4f\x12\0\0\0\0\0\0\x7b\x2a\xa8\
-\xff\0\0\0\0\x61\x31\0\0\0\0\0\0\x61\x32\x04\0\0\0\0\0\x61\x34\x08\0\0\0\0\0\
-\x61\x33\x0c\0\0\0\0\0\x69\xa5\x5a\xff\0\0\0\0\x6b\x5a\xc2\xff\0\0\0\0\x69\xa5\
-\x58\xff\0\0\0\0\x6b\x5a\xc0\xff\0\0\0\0\x67\x03\0\0\x20\0\0\0\x4f\x43\0\0\0\0\
-\0\0\x7b\x3a\xb8\xff\0\0\0\0\x67\x02\0\0\x20\0\0\0\x4f\x12\0\0\0\0\0\0\x7b\x2a\
-\xb0\xff\0\0\0\0\x05\0\x6b\0\0\0\0\0\x71\xa2\x52\xff\0\0\0\0\x15\x02\x04\0\0\0\
-\0\0\xbf\x12\0\0\0\0\0\0\x57\x02\0\0\x04\0\0\0\x15\x02\x01\0\0\0\0\0\x05\0\xf7\
-\xfe\0\0\0\0\x57\x01\0\0\x01\0\0\0\x15\x01\xd3\0\0\0\0\0\x61\xa1\x5c\xff\0\0\0\
-\0\x63\x1a\xa0\xff\0\0\0\0\x61\xa1\x60\xff\0\0\0\0\x63\x1a\xa4\xff\0\0\0\0\x05\
-\0\x5e\0\0\0\0\0\x71\xa2\x52\xff\0\0\0\0\x15\x02\x1e\0\0\0\0\0\xbf\x12\0\0\0\0\
-\0\0\x57\x02\0\0\x20\0\0\0\x15\x02\x1b\0\0\0\0\0\xbf\xa2\0\0\0\0\0\0\x07\x02\0\
-\0\x5c\xff\xff\xff\x71\xa4\x54\xff\0\0\0\0\xbf\x23\0\0\0\0\0\0\x15\x04\x02\0\0\
-\0\0\0\xbf\xa3\0\0\0\0\0\0\x07\x03\0\0\x7c\xff\xff\xff\x57\x01\0\0\0\x01\0\0\
-\x15\x01\x01\0\0\0\0\0\xbf\x32\0\0\0\0\0\0\xbf\xa3\0\0\0\0\0\0\x07\x03\0\0\x6c\
-\xff\xff\xff\x71\xa5\x55\xff\0\0\0\0\xbf\x34\0\0\0\0\0\0\x15\x05\x02\0\0\0\0\0\
-\xbf\xa4\0\0\0\0\0\0\x07\x04\0\0\x8c\xff\xff\xff\x15\x01\xc3\xff\0\0\0\0\x05\0\
-\xc1\xff\0\0\0\0\xb7\x09\0\0\x3c\0\0\0\x79\xa7\x20\xff\0\0\0\0\x67\0\0\0\x20\0\
-\0\0\x77\0\0\0\x20\0\0\0\x15\0\xa5\xfe\0\0\0\0\x05\0\xb0\0\0\0\0\0\x15\x09\x07\
-\xff\x87\0\0\0\x05\0\xa2\xfe\0\0\0\0\xbf\x12\0\0\0\0\0\0\x57\x02\0\0\x08\0\0\0\
-\x15\x02\xab\0\0\0\0\0\xbf\xa2\0\0\0\0\0\0\x07\x02\0\0\x5c\xff\xff\xff\x71\xa4\
-\x54\xff\0\0\0\0\xbf\x23\0\0\0\0\0\0\x15\x04\x02\0\0\0\0\0\xbf\xa3\0\0\0\0\0\0\
-\x07\x03\0\0\x7c\xff\xff\xff\x57\x01\0\0\x40\0\0\0\x15\x01\x01\0\0\0\0\0\xbf\
-\x32\0\0\0\0\0\0\x61\x23\x04\0\0\0\0\0\x67\x03\0\0\x20\0\0\0\x61\x24\0\0\0\0\0\
-\0\x4f\x43\0\0\0\0\0\0\x7b\x3a\xa0\xff\0\0\0\0\x61\x23\x08\0\0\0\0\0\x61\x22\
-\x0c\0\0\0\0\0\x67\x02\0\0\x20\0\0\0\x4f\x32\0\0\0\0\0\0\x7b\x2a\xa8\xff\0\0\0\
-\0\x15\x01\x1c\0\0\0\0\0\x71\xa1\x55\xff\0\0\0\0\x15\x01\x1a\0\0\0\0\0\x61\xa1\
-\x98\xff\0\0\0\0\x67\x01\0\0\x20\0\0\0\x61\xa2\x94\xff\0\0\0\0\x4f\x21\0\0\0\0\
-\0\0\x7b\x1a\xb8\xff\0\0\0\0\x61\xa1\x90\xff\0\0\0\0\x67\x01\0\0\x20\0\0\0\x61\
-\xa2\x8c\xff\0\0\0\0\x05\0\x19\0\0\0\0\0\xb7\x01\0\0\x01\0\0\0\x73\x1a\x52\xff\
-\0\0\0\0\xb7\x01\0\0\0\0\0\0\x7b\x1a\xd0\xff\0\0\0\0\xbf\xa3\0\0\0\0\0\0\x07\
-\x03\0\0\xd0\xff\xff\xff\xbf\x81\0\0\0\0\0\0\x79\xa2\x40\xff\0\0\0\0\xb7\x04\0\
-\0\x08\0\0\0\xb7\x05\0\0\x01\0\0\0\x85\0\0\0\x44\0\0\0\x67\0\0\0\x20\0\0\0\x77\
-\0\0\0\x20\0\0\0\x55\0\x7d\0\0\0\0\0\x05\0\x88\xfe\0\0\0\0\xb7\x09\0\0\x2b\0\0\
-\0\x05\0\xc6\xff\0\0\0\0\x61\xa1\x78\xff\0\0\0\0\x67\x01\0\0\x20\0\0\0\x61\xa2\
-\x74\xff\0\0\0\0\x4f\x21\0\0\0\0\0\0\x7b\x1a\xb8\xff\0\0\0\0\x61\xa1\x70\xff\0\
-\0\0\0\x67\x01\0\0\x20\0\0\0\x61\xa2\x6c\xff\0\0\0\0\x4f\x21\0\0\0\0\0\0\x7b\
-\x1a\xb0\xff\0\0\0\0\xb7\x01\0\0\0\0\0\0\x07\x07\0\0\x04\0\0\0\x61\x03\0\0\0\0\
-\0\0\xb7\x05\0\0\0\0\0\0\x05\0\x4e\0\0\0\0\0\xaf\x52\0\0\0\0\0\0\xbf\x75\0\0\0\
-\0\0\0\x0f\x15\0\0\0\0\0\0\x71\x55\0\0\0\0\0\0\x67\x03\0\0\x01\0\0\0\xbf\x50\0\
-\0\0\0\0\0\x77\0\0\0\x07\0\0\0\x4f\x03\0\0\0\0\0\0\xbf\x40\0\0\0\0\0\0\x67\0\0\
-\0\x39\0\0\0\xc7\0\0\0\x3f\0\0\0\x5f\x30\0\0\0\0\0\0\xaf\x02\0\0\0\0\0\0\xbf\
-\x50\0\0\0\0\0\0\x77\0\0\0\x06\0\0\0\x57\0\0\0\x01\0\0\0\x67\x03\0\0\x01\0\0\0\
-\x4f\x03\0\0\0\0\0\0\xbf\x40\0\0\0\0\0\0\x67\0\0\0\x3a\0\0\0\xc7\0\0\0\x3f\0\0\
-\0\x5f\x30\0\0\0\0\0\0\xaf\x02\0\0\0\0\0\0\x67\x03\0\0\x01\0\0\0\xbf\x50\0\0\0\
-\0\0\0\x77\0\0\0\x05\0\0\0\x57\0\0\0\x01\0\0\0\x4f\x03\0\0\0\0\0\0\xbf\x40\0\0\
-\0\0\0\0\x67\0\0\0\x3b\0\0\0\xc7\0\0\0\x3f\0\0\0\x5f\x30\0\0\0\0\0\0\xaf\x02\0\
-\0\0\0\0\0\x67\x03\0\0\x01\0\0\0\xbf\x50\0\0\0\0\0\0\x77\0\0\0\x04\0\0\0\x57\0\
-\0\0\x01\0\0\0\x4f\x03\0\0\0\0\0\0\xbf\x40\0\0\0\0\0\0\x67\0\0\0\x3c\0\0\0\xc7\
-\0\0\0\x3f\0\0\0\x5f\x30\0\0\0\0\0\0\xaf\x02\0\0\0\0\0\0\xbf\x50\0\0\0\0\0\0\
-\x77\0\0\0\x03\0\0\0\x57\0\0\0\x01\0\0\0\x67\x03\0\0\x01\0\0\0\x4f\x03\0\0\0\0\
-\0\0\xbf\x40\0\0\0\0\0\0\x67\0\0\0\x3d\0\0\0\xc7\0\0\0\x3f\0\0\0\x5f\x30\0\0\0\
-\0\0\0\xaf\x02\0\0\0\0\0\0\xbf\x50\0\0\0\0\0\0\x77\0\0\0\x02\0\0\0\x57\0\0\0\
-\x01\0\0\0\x67\x03\0\0\x01\0\0\0\x4f\x03\0\0\0\0\0\0\xbf\x40\0\0\0\0\0\0\x67\0\
-\0\0\x3e\0\0\0\xc7\0\0\0\x3f\0\0\0\x5f\x30\0\0\0\0\0\0\xaf\x02\0\0\0\0\0\0\xbf\
-\x50\0\0\0\0\0\0\x77\0\0\0\x01\0\0\0\x57\0\0\0\x01\0\0\0\x67\x03\0\0\x01\0\0\0\
-\x4f\x03\0\0\0\0\0\0\x57\x04\0\0\x01\0\0\0\x87\x04\0\0\0\0\0\0\x5f\x34\0\0\0\0\
-\0\0\xaf\x42\0\0\0\0\0\0\x57\x05\0\0\x01\0\0\0\x67\x03\0\0\x01\0\0\0\x4f\x53\0\
-\0\0\0\0\0\x07\x01\0\0\x01\0\0\0\xbf\x25\0\0\0\0\0\0\x15\x01\x0b\0\x24\0\0\0\
-\xbf\xa2\0\0\0\0\0\0\x07\x02\0\0\xa0\xff\xff\xff\x0f\x12\0\0\0\0\0\0\x71\x24\0\
-\0\0\0\0\0\xbf\x40\0\0\0\0\0\0\x67\0\0\0\x38\0\0\0\xc7\0\0\0\x38\0\0\0\xb7\x02\
-\0\0\0\0\0\0\x65\0\xa9\xff\xff\xff\xff\xff\xbf\x32\0\0\0\0\0\0\x05\0\xa7\xff\0\
-\0\0\0\xbf\x21\0\0\0\0\0\0\x67\x01\0\0\x20\0\0\0\x77\x01\0\0\x20\0\0\0\x15\x01\
-\x0e\0\0\0\0\0\x71\x63\x06\0\0\0\0\0\x71\x64\x07\0\0\0\0\0\x67\x04\0\0\x08\0\0\
-\0\x4f\x34\0\0\0\0\0\0\x3f\x41\0\0\0\0\0\0\x2f\x41\0\0\0\0\0\0\x1f\x12\0\0\0\0\
-\0\0\x63\x2a\x50\xff\0\0\0\0\xbf\xa2\0\0\0\0\0\0\x07\x02\0\0\x50\xff\xff\xff\
-\x18\x01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x85\0\0\0\x01\0\0\0\x55\0\x05\0\0\0\0\0\
-\x71\x61\x08\0\0\0\0\0\x71\x60\x09\0\0\0\0\0\x67\0\0\0\x08\0\0\0\x4f\x10\0\0\0\
-\0\0\0\x95\0\0\0\0\0\0\0\x69\0\0\0\0\0\0\0\x05\0\xfd\xff\0\0\0\0\x02\0\0\0\x04\
-\0\0\0\x0a\0\0\0\x01\0\0\0\0\0\0\0\x02\0\0\0\x04\0\0\0\x28\0\0\0\x01\0\0\0\0\0\
-\0\0\x02\0\0\0\x04\0\0\0\x02\0\0\0\x80\0\0\0\0\0\0\0\x47\x50\x4c\x20\x76\x32\0\
-\0\0\0\0\0\x10\0\0\0\0\0\0\0\x01\x7a\x52\0\x08\x7c\x0b\x01\x0c\0\0\0\x18\0\0\0\
-\x18\0\0\0\0\0\0\0\0\0\0\0\xd8\x13\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
-\0\0\0\0\0\0\0\0\0\0\0\0\xa0\0\0\0\x04\0\xf1\xff\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
-\0\x60\x02\0\0\0\0\x03\0\x20\x02\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x3f\x02\0\0\0\0\
-\x03\0\xd0\x0f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xed\x01\0\0\0\0\x03\0\x10\x10\0\0\0\
-\0\0\0\0\0\0\0\0\0\0\0\xd4\x01\0\0\0\0\x03\0\x20\x10\0\0\0\0\0\0\0\0\0\0\0\0\0\
-\0\xa3\x01\0\0\0\0\x03\0\xb8\x12\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x63\x01\0\0\0\0\
-\x03\0\x48\x10\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x2a\x01\0\0\0\0\x03\0\x10\x13\0\0\0\
-\0\0\0\0\0\0\0\0\0\0\0\xe1\0\0\0\0\0\x03\0\xa0\x13\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
-\x2e\x02\0\0\0\0\x03\0\x28\x02\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x68\x02\0\0\0\0\x03\
-\0\xc0\x13\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x36\x02\0\0\0\0\x03\0\xc8\x13\0\0\0\0\0\
-\0\0\0\0\0\0\0\0\0\x22\x01\0\0\0\0\x03\0\xe8\x02\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
-\x02\x01\0\0\0\0\x03\0\x40\x03\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xd9\0\0\0\0\0\x03\0\
-\xf8\x04\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x26\x02\0\0\0\0\x03\0\x20\x0e\0\0\0\0\0\0\
-\0\0\0\0\0\0\0\0\xcc\x01\0\0\0\0\x03\0\x60\x06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x9b\
-\x01\0\0\0\0\x03\0\xc8\x06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x5b\x01\0\0\0\0\x03\0\
-\x20\x07\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x7c\x01\0\0\0\0\x03\0\x48\x08\0\0\0\0\0\0\
-\0\0\0\0\0\0\0\0\x53\x01\0\0\0\0\x03\0\xb8\x08\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x1a\
-\x01\0\0\0\0\x03\0\xe0\x08\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x84\x01\0\0\0\0\x03\0\
-\xb8\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x1e\x02\0\0\0\0\x03\0\xd8\x09\0\0\0\0\0\0\0\
-\0\0\0\0\0\0\0\xc4\x01\0\0\0\0\x03\0\x70\x08\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x93\
-\x01\0\0\0\0\x03\0\xa8\x08\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x74\x01\0\0\0\0\x03\0\
-\xf0\x0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x4b\x01\0\0\0\0\x03\0\0\x0a\0\0\0\0\0\0\0\
-\0\0\0\0\0\0\0\x12\x01\0\0\0\0\x03\0\x10\x0a\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xfa\0\
-\0\0\0\0\x03\0\xc0\x0a\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x58\x02\0\0\0\0\x03\0\x88\
-\x0a\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x16\x02\0\0\0\0\x03\0\xb8\x0a\0\0\0\0\0\0\0\0\
-\0\0\0\0\0\0\xe5\x01\0\0\0\0\x03\0\xc0\x0f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xbc\x01\
-\0\0\0\0\x03\0\0\x0e\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x8b\x01\0\0\0\0\x03\0\x18\x0e\
-\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xd1\0\0\0\0\0\x03\0\0\x04\0\0\0\0\0\0\0\0\0\0\0\0\
-\0\0\x50\x02\0\0\0\0\x03\0\x20\x04\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x0e\x02\0\0\0\0\
-\x03\0\x48\x0f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x6c\x01\0\0\0\0\x03\0\xb0\x04\0\0\0\
-\0\0\0\0\0\0\0\0\0\0\0\x43\x01\0\0\0\0\x03\0\xc8\x0c\0\0\0\0\0\0\0\0\0\0\0\0\0\
-\0\xc9\0\0\0\0\0\x03\0\xf8\x0c\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x06\x02\0\0\0\0\x03\
-\0\xd0\x0a\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x3b\x01\0\0\0\0\x03\0\x98\x0b\0\0\0\0\0\
-\0\0\0\0\0\0\0\0\0\xf2\0\0\0\0\0\x03\0\xb8\x0b\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x48\
-\x02\0\0\0\0\x03\0\xf0\x0b\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xfe\x01\0\0\0\0\x03\0\
-\xf8\x0b\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xdd\x01\0\0\0\0\x03\0\0\x0c\0\0\0\0\0\0\0\
-\0\0\0\0\0\0\0\xb4\x01\0\0\0\0\x03\0\x30\x0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x0a\
-\x01\0\0\0\0\x03\0\x90\x0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xc1\0\0\0\0\0\x03\0\xa8\
-\x0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xba\0\0\0\0\0\x03\0\xd0\x01\0\0\0\0\0\0\0\0\0\
-\0\0\0\0\0\xf6\x01\0\0\0\0\x03\0\xe0\x0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xac\x01\0\
-\0\0\0\x03\0\x30\x0e\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x33\x01\0\0\0\0\x03\0\x80\x0e\
-\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xea\0\0\0\0\0\x03\0\x98\x0e\0\0\0\0\0\0\0\0\0\0\0\
-\0\0\0\0\0\0\0\x03\0\x03\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x6b\0\0\0\x11\0\x06\
-\0\0\0\0\0\0\0\0\0\x07\0\0\0\0\0\0\0\x25\0\0\0\x11\0\x05\0\0\0\0\0\0\0\0\0\x14\
-\0\0\0\0\0\0\0\x82\0\0\0\x11\0\x05\0\x28\0\0\0\0\0\0\0\x14\0\0\0\0\0\0\0\x01\0\
-\0\0\x11\0\x05\0\x14\0\0\0\0\0\0\0\x14\0\0\0\0\0\0\0\x40\0\0\0\x12\0\x03\0\0\0\
-\0\0\0\0\0\0\xd8\x13\0\0\0\0\0\0\x28\0\0\0\0\0\0\0\x01\0\0\0\x3a\0\0\0\x50\0\0\
-\0\0\0\0\0\x01\0\0\0\x3c\0\0\0\x80\x13\0\0\0\0\0\0\x01\0\0\0\x3b\0\0\0\x1c\0\0\
-\0\0\0\0\0\x01\0\0\0\x38\0\0\0\0\x74\x61\x70\x5f\x72\x73\x73\x5f\x6d\x61\x70\
-\x5f\x74\x6f\x65\x70\x6c\x69\x74\x7a\x5f\x6b\x65\x79\0\x2e\x74\x65\x78\x74\0\
-\x6d\x61\x70\x73\0\x74\x61\x70\x5f\x72\x73\x73\x5f\x6d\x61\x70\x5f\x63\x6f\x6e\
-\x66\x69\x67\x75\x72\x61\x74\x69\x6f\x6e\x73\0\x74\x75\x6e\x5f\x72\x73\x73\x5f\
-\x73\x74\x65\x65\x72\x69\x6e\x67\x5f\x70\x72\x6f\x67\0\x2e\x72\x65\x6c\x74\x75\
-\x6e\x5f\x72\x73\x73\x5f\x73\x74\x65\x65\x72\x69\x6e\x67\0\x5f\x6c\x69\x63\x65\
-\x6e\x73\x65\0\x2e\x72\x65\x6c\x2e\x65\x68\x5f\x66\x72\x61\x6d\x65\0\x74\x61\
-\x70\x5f\x72\x73\x73\x5f\x6d\x61\x70\x5f\x69\x6e\x64\x69\x72\x65\x63\x74\x69\
-\x6f\x6e\x5f\x74\x61\x62\x6c\x65\0\x72\x73\x73\x2e\x62\x70\x66\x2e\x63\0\x2e\
-\x73\x74\x72\x74\x61\x62\0\x2e\x73\x79\x6d\x74\x61\x62\0\x4c\x42\x42\x30\x5f\
-\x39\0\x4c\x42\x42\x30\x5f\x38\x39\0\x4c\x42\x42\x30\x5f\x36\x39\0\x4c\x42\x42\
-\x30\x5f\x35\x39\0\x4c\x42\x42\x30\x5f\x31\x39\0\x4c\x42\x42\x30\x5f\x31\x30\
-\x39\0\x4c\x42\x42\x30\x5f\x39\x38\0\x4c\x42\x42\x30\x5f\x37\x38\0\x4c\x42\x42\
-\x30\x5f\x34\x38\0\x4c\x42\x42\x30\x5f\x31\x38\0\x4c\x42\x42\x30\x5f\x38\x37\0\
-\x4c\x42\x42\x30\x5f\x34\x37\0\x4c\x42\x42\x30\x5f\x33\x37\0\x4c\x42\x42\x30\
-\x5f\x31\x37\0\x4c\x42\x42\x30\x5f\x31\x30\x37\0\x4c\x42\x42\x30\x5f\x39\x36\0\
-\x4c\x42\x42\x30\x5f\x37\x36\0\x4c\x42\x42\x30\x5f\x36\x36\0\x4c\x42\x42\x30\
-\x5f\x34\x36\0\x4c\x42\x42\x30\x5f\x33\x36\0\x4c\x42\x42\x30\x5f\x32\x36\0\x4c\
-\x42\x42\x30\x5f\x31\x30\x36\0\x4c\x42\x42\x30\x5f\x36\x35\0\x4c\x42\x42\x30\
-\x5f\x34\x35\0\x4c\x42\x42\x30\x5f\x33\x35\0\x4c\x42\x42\x30\x5f\x34\0\x4c\x42\
+\0\0\0\0\0\x05\0\xf6\0\0\0\0\0\xb7\x01\0\0\0\0\0\0\x6b\x1a\xfe\xff\0\0\0\0\xb7\
+\x07\0\0\x28\0\0\0\xbf\xa1\0\0\0\0\0\0\x07\x01\0\0\x8c\xff\xff\xff\x7b\x1a\x28\
+\xff\0\0\0\0\xbf\xa1\0\0\0\0\0\0\x07\x01\0\0\x7c\xff\xff\xff\x7b\x1a\x20\xff\0\
+\0\0\0\xb7\x01\0\0\0\0\0\0\x7b\x1a\x30\xff\0\0\0\0\x7b\x8a\x38\xff\0\0\0\0\xbf\
+\xa3\0\0\0\0\0\0\x07\x03\0\0\xfe\xff\xff\xff\xbf\x81\0\0\0\0\0\0\xbf\x72\0\0\0\
+\0\0\0\xb7\x04\0\0\x02\0\0\0\xb7\x05\0\0\x01\0\0\0\x85\0\0\0\x44\0\0\0\x67\0\0\
+\0\x20\0\0\0\x77\0\0\0\x20\0\0\0\x15\0\x01\0\0\0\0\0\x05\0\x62\xff\0\0\0\0\xbf\
+\x91\0\0\0\0\0\0\x15\x01\x23\0\x3c\0\0\0\x15\x01\x5a\0\x2c\0\0\0\x55\x01\x5b\0\
+\x2b\0\0\0\xb7\x01\0\0\0\0\0\0\x63\x1a\xf8\xff\0\0\0\0\xbf\xa3\0\0\0\0\0\0\x07\
+\x03\0\0\xf8\xff\xff\xff\xbf\x81\0\0\0\0\0\0\xbf\x72\0\0\0\0\0\0\xb7\x04\0\0\
+\x04\0\0\0\xb7\x05\0\0\x01\0\0\0\x85\0\0\0\x44\0\0\0\xbf\x01\0\0\0\0\0\0\x67\
+\x01\0\0\x20\0\0\0\x77\x01\0\0\x20\0\0\0\x55\x01\x02\x01\0\0\0\0\x71\xa1\xfa\
+\xff\0\0\0\0\x55\x01\x4c\0\x02\0\0\0\x71\xa1\xf9\xff\0\0\0\0\x55\x01\x4a\0\x02\
+\0\0\0\x71\xa1\xfb\xff\0\0\0\0\x55\x01\x48\0\x01\0\0\0\xbf\x72\0\0\0\0\0\0\x07\
+\x02\0\0\x08\0\0\0\xbf\x81\0\0\0\0\0\0\x79\xa3\x28\xff\0\0\0\0\xb7\x04\0\0\x10\
+\0\0\0\xb7\x05\0\0\x01\0\0\0\x85\0\0\0\x44\0\0\0\xbf\x01\0\0\0\0\0\0\x67\x01\0\
+\0\x20\0\0\0\x77\x01\0\0\x20\0\0\0\x55\x01\xf1\0\0\0\0\0\xb7\x01\0\0\x01\0\0\0\
+\x73\x1a\x55\xff\0\0\0\0\x05\0\x3a\0\0\0\0\0\x7b\x7a\x40\xff\0\0\0\0\xb7\x01\0\
+\0\0\0\0\0\x6b\x1a\xf8\xff\0\0\0\0\xb7\x07\0\0\x02\0\0\0\xb7\x08\0\0\x1e\0\0\0\
+\x05\0\x0f\0\0\0\0\0\x0f\x71\0\0\0\0\0\0\xbf\x12\0\0\0\0\0\0\x07\x02\0\0\x01\0\
+\0\0\x71\xa3\xff\xff\0\0\0\0\x67\x03\0\0\x03\0\0\0\x2d\x23\x03\0\0\0\0\0\x79\
+\xa8\x38\xff\0\0\0\0\x79\xa7\x40\xff\0\0\0\0\x05\0\x2b\0\0\0\0\0\x07\x08\0\0\
+\xff\xff\xff\xff\xbf\x82\0\0\0\0\0\0\x67\x02\0\0\x20\0\0\0\x77\x02\0\0\x20\0\0\
+\0\xbf\x17\0\0\0\0\0\0\x15\x02\xf7\xff\0\0\0\0\xbf\x79\0\0\0\0\0\0\x79\xa1\x40\
+\xff\0\0\0\0\x0f\x19\0\0\0\0\0\0\xbf\xa3\0\0\0\0\0\0\x07\x03\0\0\xf8\xff\xff\
+\xff\x79\xa1\x38\xff\0\0\0\0\xbf\x92\0\0\0\0\0\0\xb7\x04\0\0\x02\0\0\0\xb7\x05\
+\0\0\x01\0\0\0\x85\0\0\0\x44\0\0\0\xbf\x01\0\0\0\0\0\0\x67\x01\0\0\x20\0\0\0\
+\x77\x01\0\0\x20\0\0\0\x55\x01\x90\0\0\0\0\0\x71\xa2\xf8\xff\0\0\0\0\x55\x02\
+\x0e\0\xc9\0\0\0\x07\x09\0\0\x02\0\0\0\x79\xa1\x38\xff\0\0\0\0\xbf\x92\0\0\0\0\
+\0\0\x79\xa3\x20\xff\0\0\0\0\xb7\x04\0\0\x10\0\0\0\xb7\x05\0\0\x01\0\0\0\x85\0\
+\0\0\x44\0\0\0\xbf\x01\0\0\0\0\0\0\x67\x01\0\0\x20\0\0\0\x77\x01\0\0\x20\0\0\0\
+\x55\x01\x83\0\0\0\0\0\xb7\x01\0\0\x01\0\0\0\x73\x1a\x54\xff\0\0\0\0\x05\0\xd9\
+\xff\0\0\0\0\xb7\x01\0\0\x01\0\0\0\x15\x02\xd1\xff\0\0\0\0\x71\xa1\xf9\xff\0\0\
+\0\0\x07\x01\0\0\x02\0\0\0\x05\0\xce\xff\0\0\0\0\xb7\x01\0\0\x01\0\0\0\x73\x1a\
+\x56\xff\0\0\0\0\x71\xa1\xff\xff\0\0\0\0\x67\x01\0\0\x03\0\0\0\x0f\x17\0\0\0\0\
+\0\0\x07\x07\0\0\x08\0\0\0\x71\xa9\xfe\xff\0\0\0\0\x25\x09\x0e\0\x3c\0\0\0\xb7\
+\x01\0\0\x01\0\0\0\x6f\x91\0\0\0\0\0\0\x18\x02\0\0\x01\0\0\0\0\0\0\0\0\x18\0\
+\x1c\x5f\x21\0\0\0\0\0\0\x55\x01\x01\0\0\0\0\0\x05\0\x07\0\0\0\0\0\x79\xa1\x30\
+\xff\0\0\0\0\x07\x01\0\0\x01\0\0\0\x7b\x1a\x30\xff\0\0\0\0\x67\x01\0\0\x20\0\0\
+\0\x77\x01\0\0\x20\0\0\0\x55\x01\x83\xff\x0b\0\0\0\x05\0\x14\xff\0\0\0\0\x15\
+\x09\xf8\xff\x87\0\0\0\x05\0\xfd\xff\0\0\0\0\x71\xa1\x51\xff\0\0\0\0\x15\x01\
+\xbd\xfe\0\0\0\0\x71\x62\x03\0\0\0\0\0\x67\x02\0\0\x08\0\0\0\x71\x61\x02\0\0\0\
+\0\0\x4f\x12\0\0\0\0\0\0\x71\x63\x04\0\0\0\0\0\x71\x61\x05\0\0\0\0\0\x67\x01\0\
+\0\x08\0\0\0\x4f\x31\0\0\0\0\0\0\x67\x01\0\0\x10\0\0\0\x4f\x21\0\0\0\0\0\0\x71\
+\xa2\x53\xff\0\0\0\0\x15\x02\x3d\0\0\0\0\0\xbf\x12\0\0\0\0\0\0\x57\x02\0\0\x10\
+\0\0\0\x15\x02\x3a\0\0\0\0\0\xbf\xa2\0\0\0\0\0\0\x07\x02\0\0\x5c\xff\xff\xff\
+\x71\xa4\x54\xff\0\0\0\0\xbf\x23\0\0\0\0\0\0\x15\x04\x02\0\0\0\0\0\xbf\xa3\0\0\
+\0\0\0\0\x07\x03\0\0\x7c\xff\xff\xff\x67\x01\0\0\x38\0\0\0\xc7\x01\0\0\x38\0\0\
+\0\x65\x01\x01\0\xff\xff\xff\xff\xbf\x32\0\0\0\0\0\0\xbf\xa3\0\0\0\0\0\0\x07\
+\x03\0\0\x6c\xff\xff\xff\x71\xa5\x55\xff\0\0\0\0\xbf\x34\0\0\0\0\0\0\x15\x05\
+\x02\0\0\0\0\0\xbf\xa4\0\0\0\0\0\0\x07\x04\0\0\x8c\xff\xff\xff\x65\x01\x01\0\
+\xff\xff\xff\xff\xbf\x43\0\0\0\0\0\0\x61\x21\x04\0\0\0\0\0\x67\x01\0\0\x20\0\0\
+\0\x61\x24\0\0\0\0\0\0\x4f\x41\0\0\0\0\0\0\x7b\x1a\xa0\xff\0\0\0\0\x61\x21\x08\
+\0\0\0\0\0\x61\x22\x0c\0\0\0\0\0\x67\x02\0\0\x20\0\0\0\x4f\x12\0\0\0\0\0\0\x7b\
+\x2a\xa8\xff\0\0\0\0\x61\x31\0\0\0\0\0\0\x61\x32\x04\0\0\0\0\0\x61\x34\x08\0\0\
+\0\0\0\x61\x33\x0c\0\0\0\0\0\x69\xa5\x5a\xff\0\0\0\0\x6b\x5a\xc2\xff\0\0\0\0\
+\x69\xa5\x58\xff\0\0\0\0\x6b\x5a\xc0\xff\0\0\0\0\x67\x03\0\0\x20\0\0\0\x4f\x43\
+\0\0\0\0\0\0\x7b\x3a\xb8\xff\0\0\0\0\x67\x02\0\0\x20\0\0\0\x4f\x12\0\0\0\0\0\0\
+\x7b\x2a\xb0\xff\0\0\0\0\x05\0\x6c\0\0\0\0\0\x71\xa2\x52\xff\0\0\0\0\x15\x02\
+\x04\0\0\0\0\0\xbf\x12\0\0\0\0\0\0\x57\x02\0\0\x04\0\0\0\x15\x02\x01\0\0\0\0\0\
+\x05\0\xfb\xfe\0\0\0\0\x57\x01\0\0\x01\0\0\0\x15\x01\x79\xfe\0\0\0\0\x61\xa1\
+\x5c\xff\0\0\0\0\x63\x1a\xa0\xff\0\0\0\0\x61\xa1\x60\xff\0\0\0\0\x63\x1a\xa4\
+\xff\0\0\0\0\x05\0\x5f\0\0\0\0\0\x71\xa2\x52\xff\0\0\0\0\x15\x02\x1f\0\0\0\0\0\
+\xbf\x12\0\0\0\0\0\0\x57\x02\0\0\x20\0\0\0\x15\x02\x1c\0\0\0\0\0\xbf\xa2\0\0\0\
+\0\0\0\x07\x02\0\0\x5c\xff\xff\xff\x71\xa4\x54\xff\0\0\0\0\xbf\x23\0\0\0\0\0\0\
+\x15\x04\x02\0\0\0\0\0\xbf\xa3\0\0\0\0\0\0\x07\x03\0\0\x7c\xff\xff\xff\x57\x01\
+\0\0\0\x01\0\0\x15\x01\x01\0\0\0\0\0\xbf\x32\0\0\0\0\0\0\xbf\xa3\0\0\0\0\0\0\
+\x07\x03\0\0\x6c\xff\xff\xff\x71\xa5\x55\xff\0\0\0\0\xbf\x34\0\0\0\0\0\0\x15\
+\x05\x02\0\0\0\0\0\xbf\xa4\0\0\0\0\0\0\x07\x04\0\0\x8c\xff\xff\xff\x15\x01\xc3\
+\xff\0\0\0\0\x05\0\xc1\xff\0\0\0\0\xb7\x09\0\0\x3c\0\0\0\x79\xa8\x38\xff\0\0\0\
+\0\x79\xa7\x40\xff\0\0\0\0\x67\0\0\0\x20\0\0\0\x77\0\0\0\x20\0\0\0\x15\0\xa9\
+\xfe\0\0\0\0\x05\0\x83\xfe\0\0\0\0\x15\x09\x09\xff\x87\0\0\0\x05\0\xa6\xfe\0\0\
+\0\0\xbf\x12\0\0\0\0\0\0\x57\x02\0\0\x08\0\0\0\x15\x02\x50\xfe\0\0\0\0\xbf\xa2\
+\0\0\0\0\0\0\x07\x02\0\0\x5c\xff\xff\xff\x71\xa4\x54\xff\0\0\0\0\xbf\x23\0\0\0\
+\0\0\0\x15\x04\x02\0\0\0\0\0\xbf\xa3\0\0\0\0\0\0\x07\x03\0\0\x7c\xff\xff\xff\
+\x57\x01\0\0\x40\0\0\0\x15\x01\x01\0\0\0\0\0\xbf\x32\0\0\0\0\0\0\x61\x23\x04\0\
+\0\0\0\0\x67\x03\0\0\x20\0\0\0\x61\x24\0\0\0\0\0\0\x4f\x43\0\0\0\0\0\0\x7b\x3a\
+\xa0\xff\0\0\0\0\x61\x23\x08\0\0\0\0\0\x61\x22\x0c\0\0\0\0\0\x67\x02\0\0\x20\0\
+\0\0\x4f\x32\0\0\0\0\0\0\x7b\x2a\xa8\xff\0\0\0\0\x15\x01\x1c\0\0\0\0\0\x71\xa1\
+\x55\xff\0\0\0\0\x15\x01\x1a\0\0\0\0\0\x61\xa1\x98\xff\0\0\0\0\x67\x01\0\0\x20\
+\0\0\0\x61\xa2\x94\xff\0\0\0\0\x4f\x21\0\0\0\0\0\0\x7b\x1a\xb8\xff\0\0\0\0\x61\
+\xa1\x90\xff\0\0\0\0\x67\x01\0\0\x20\0\0\0\x61\xa2\x8c\xff\0\0\0\0\x05\0\x19\0\
+\0\0\0\0\xb7\x01\0\0\x01\0\0\0\x73\x1a\x52\xff\0\0\0\0\xb7\x01\0\0\0\0\0\0\x7b\
+\x1a\xd0\xff\0\0\0\0\xbf\xa3\0\0\0\0\0\0\x07\x03\0\0\xd0\xff\xff\xff\xbf\x81\0\
+\0\0\0\0\0\xbf\x72\0\0\0\0\0\0\xb7\x04\0\0\x08\0\0\0\xb7\x05\0\0\x01\0\0\0\x85\
+\0\0\0\x44\0\0\0\x67\0\0\0\x20\0\0\0\x77\0\0\0\x20\0\0\0\x55\0\x22\xfe\0\0\0\0\
+\x05\0\x8c\xfe\0\0\0\0\xb7\x09\0\0\x2b\0\0\0\x05\0\xc6\xff\0\0\0\0\x61\xa1\x78\
+\xff\0\0\0\0\x67\x01\0\0\x20\0\0\0\x61\xa2\x74\xff\0\0\0\0\x4f\x21\0\0\0\0\0\0\
+\x7b\x1a\xb8\xff\0\0\0\0\x61\xa1\x70\xff\0\0\0\0\x67\x01\0\0\x20\0\0\0\x61\xa2\
+\x6c\xff\0\0\0\0\x4f\x21\0\0\0\0\0\0\x7b\x1a\xb0\xff\0\0\0\0\xb7\x02\0\0\0\0\0\
+\0\xbf\x63\0\0\0\0\0\0\x07\x03\0\0\x0e\0\0\0\x61\x64\x0a\0\0\0\0\0\xb7\0\0\0\0\
+\0\0\0\x05\0\x4e\0\0\0\0\0\xaf\x01\0\0\0\0\0\0\xbf\x30\0\0\0\0\0\0\x0f\x20\0\0\
+\0\0\0\0\x71\0\0\0\0\0\0\0\x67\x04\0\0\x01\0\0\0\xbf\x07\0\0\0\0\0\0\x77\x07\0\
+\0\x07\0\0\0\x4f\x74\0\0\0\0\0\0\xbf\x57\0\0\0\0\0\0\x67\x07\0\0\x39\0\0\0\xc7\
+\x07\0\0\x3f\0\0\0\x5f\x47\0\0\0\0\0\0\xaf\x71\0\0\0\0\0\0\xbf\x07\0\0\0\0\0\0\
+\x77\x07\0\0\x06\0\0\0\x57\x07\0\0\x01\0\0\0\x67\x04\0\0\x01\0\0\0\x4f\x74\0\0\
+\0\0\0\0\xbf\x57\0\0\0\0\0\0\x67\x07\0\0\x3a\0\0\0\xc7\x07\0\0\x3f\0\0\0\x5f\
+\x47\0\0\0\0\0\0\xaf\x71\0\0\0\0\0\0\x67\x04\0\0\x01\0\0\0\xbf\x07\0\0\0\0\0\0\
+\x77\x07\0\0\x05\0\0\0\x57\x07\0\0\x01\0\0\0\x4f\x74\0\0\0\0\0\0\xbf\x57\0\0\0\
+\0\0\0\x67\x07\0\0\x3b\0\0\0\xc7\x07\0\0\x3f\0\0\0\x5f\x47\0\0\0\0\0\0\xaf\x71\
+\0\0\0\0\0\0\x67\x04\0\0\x01\0\0\0\xbf\x07\0\0\0\0\0\0\x77\x07\0\0\x04\0\0\0\
+\x57\x07\0\0\x01\0\0\0\x4f\x74\0\0\0\0\0\0\xbf\x57\0\0\0\0\0\0\x67\x07\0\0\x3c\
+\0\0\0\xc7\x07\0\0\x3f\0\0\0\x5f\x47\0\0\0\0\0\0\xaf\x71\0\0\0\0\0\0\xbf\x07\0\
+\0\0\0\0\0\x77\x07\0\0\x03\0\0\0\x57\x07\0\0\x01\0\0\0\x67\x04\0\0\x01\0\0\0\
+\x4f\x74\0\0\0\0\0\0\xbf\x57\0\0\0\0\0\0\x67\x07\0\0\x3d\0\0\0\xc7\x07\0\0\x3f\
+\0\0\0\x5f\x47\0\0\0\0\0\0\xaf\x71\0\0\0\0\0\0\xbf\x07\0\0\0\0\0\0\x77\x07\0\0\
+\x02\0\0\0\x57\x07\0\0\x01\0\0\0\x67\x04\0\0\x01\0\0\0\x4f\x74\0\0\0\0\0\0\xbf\
+\x57\0\0\0\0\0\0\x67\x07\0\0\x3e\0\0\0\xc7\x07\0\0\x3f\0\0\0\x5f\x47\0\0\0\0\0\
+\0\xaf\x71\0\0\0\0\0\0\xbf\x07\0\0\0\0\0\0\x77\x07\0\0\x01\0\0\0\x57\x07\0\0\
+\x01\0\0\0\x67\x04\0\0\x01\0\0\0\x4f\x74\0\0\0\0\0\0\x57\x05\0\0\x01\0\0\0\x87\
+\x05\0\0\0\0\0\0\x5f\x45\0\0\0\0\0\0\xaf\x51\0\0\0\0\0\0\x57\0\0\0\x01\0\0\0\
+\x67\x04\0\0\x01\0\0\0\x4f\x04\0\0\0\0\0\0\x07\x02\0\0\x01\0\0\0\xbf\x10\0\0\0\
+\0\0\0\x15\x02\x0b\0\x24\0\0\0\xbf\xa1\0\0\0\0\0\0\x07\x01\0\0\xa0\xff\xff\xff\
+\x0f\x21\0\0\0\0\0\0\x71\x15\0\0\0\0\0\0\xbf\x57\0\0\0\0\0\0\x67\x07\0\0\x38\0\
+\0\0\xc7\x07\0\0\x38\0\0\0\xb7\x01\0\0\0\0\0\0\x65\x07\xa9\xff\xff\xff\xff\xff\
+\xbf\x41\0\0\0\0\0\0\x05\0\xa7\xff\0\0\0\0\x67\x01\0\0\x20\0\0\0\x77\x01\0\0\
+\x20\0\0\0\x15\x01\xb3\xfd\0\0\0\0\x71\x62\x06\0\0\0\0\0\x71\x63\x07\0\0\0\0\0\
+\x67\x03\0\0\x08\0\0\0\x4f\x23\0\0\0\0\0\0\xbf\x12\0\0\0\0\0\0\x3f\x32\0\0\0\0\
+\0\0\x2f\x32\0\0\0\0\0\0\x1f\x21\0\0\0\0\0\0\x25\x01\xaa\xfd\x7f\0\0\0\x67\x01\
+\0\0\x20\0\0\0\x77\x01\0\0\x20\0\0\0\x67\x01\0\0\x01\0\0\0\x0f\x16\0\0\0\0\0\0\
+\x07\x06\0\0\x32\0\0\0\x05\0\xd3\xfd\0\0\0\0\x02\0\0\0\x04\0\0\0\x32\x01\0\0\
+\x01\0\0\0\0\x04\0\0\x47\x50\x4c\x20\x76\x32\0\0\0\0\0\0\x10\0\0\0\0\0\0\0\x01\
+\x7a\x52\0\x08\x7c\x0b\x01\x0c\0\0\0\x18\0\0\0\x18\0\0\0\0\0\0\0\0\0\0\0\x50\
+\x13\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x69\0\
+\0\0\x04\0\xf1\xff\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x2e\x02\0\0\0\0\x03\0\xe8\
+\x01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x0d\x02\0\0\0\0\x03\0\x68\x0f\0\0\0\0\0\0\0\0\
+\0\0\0\0\0\0\xe4\x01\0\0\0\0\x03\0\x78\x0f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xb4\x01\
+\0\0\0\0\x03\0\xb8\x0f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x94\x01\0\0\0\0\x03\0\xc8\
+\x0f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x6b\x01\0\0\0\0\x03\0\xf8\x0f\0\0\0\0\0\0\0\0\
+\0\0\0\0\0\0\x2a\x01\0\0\0\0\x03\0\x68\x12\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xe9\0\0\
+\0\0\0\x03\0\xc0\x12\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x05\x02\0\0\0\0\x03\0\x08\x02\
+\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xdc\x01\0\0\0\0\x03\0\x10\x02\0\0\0\0\0\0\0\0\0\0\
+\0\0\0\0\xe1\0\0\0\0\0\x03\0\xc0\x02\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xb2\0\0\0\0\0\
+\x03\0\x08\x03\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xbd\x01\0\0\0\0\x03\0\x70\0\0\0\0\0\
+\0\0\0\0\0\0\0\0\0\0\x8c\x01\0\0\0\0\x03\0\xc8\x03\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
+\x63\x01\0\0\0\0\x03\0\xe8\x03\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xd9\0\0\0\0\0\x03\0\
+\x70\x04\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xaa\0\0\0\0\0\x03\0\xb8\x04\0\0\0\0\0\0\0\
+\0\0\0\0\0\0\0\x9d\x01\0\0\0\0\x03\0\x78\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xd4\x01\
+\0\0\0\0\x03\0\x18\x06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xac\x01\0\0\0\0\x03\0\x78\
+\x06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x5b\x01\0\0\0\0\x03\0\xd0\x06\0\0\0\0\0\0\0\0\
+\0\0\0\0\0\0\x84\x01\0\0\0\0\x03\0\xf8\x07\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x53\x01\
+\0\0\0\0\x03\0\x28\x08\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x22\x01\0\0\0\0\x03\0\x58\
+\x08\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x12\x01\0\0\0\0\x03\0\x70\x08\0\0\0\0\0\0\0\0\
+\0\0\0\0\0\0\xd1\0\0\0\0\0\x03\0\xa0\x08\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xcc\x01\0\
+\0\0\0\x03\0\x90\x09\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x7c\x01\0\0\0\0\x03\0\xb8\x09\
+\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x4b\x01\0\0\0\0\x03\0\xc8\x09\0\0\0\0\0\0\0\0\0\0\
+\0\0\0\0\x0a\x01\0\0\0\0\x03\0\x30\x0a\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xc9\0\0\0\0\
+\0\x03\0\x60\x0a\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xa2\0\0\0\0\0\x03\0\x68\x0a\0\0\0\
+\0\0\0\0\0\0\0\0\0\0\0\x26\x02\0\0\0\0\x03\0\x78\x0a\0\0\0\0\0\0\0\0\0\0\0\0\0\
+\0\x43\x01\0\0\0\0\x03\0\x38\x0b\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x02\x01\0\0\0\0\
+\x03\0\x58\x0b\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x9a\0\0\0\0\0\x03\0\x90\x0b\0\0\0\0\
+\0\0\0\0\0\0\0\0\0\0\x1e\x02\0\0\0\0\x03\0\x98\x0b\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
+\xfd\x01\0\0\0\0\x03\0\xa0\x0b\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xc4\x01\0\0\0\0\x03\
+\0\x68\x0c\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x3b\x01\0\0\0\0\x03\0\x98\x0c\0\0\0\0\0\
+\0\0\0\0\0\0\0\0\0\xfa\0\0\0\0\0\x03\0\xd0\x0c\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xba\
+\0\0\0\0\0\x03\0\x90\x01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xf5\x01\0\0\0\0\x03\0\x30\
+\x0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xa4\x01\0\0\0\0\x03\0\x48\x0d\0\0\0\0\0\0\0\0\
+\0\0\0\0\0\0\x33\x01\0\0\0\0\x03\0\x80\x0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xf2\0\0\
+\0\0\0\x03\0\x90\x0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xc1\0\0\0\0\0\x03\0\xa8\x0d\0\
+\0\0\0\0\0\0\0\0\0\0\0\0\0\x92\0\0\0\0\0\x03\0\xc0\x0d\0\0\0\0\0\0\0\0\0\0\0\0\
+\0\0\x83\0\0\0\0\0\x03\0\xe0\x01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x16\x02\0\0\0\0\
+\x03\0\xc8\x0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xed\x01\0\0\0\0\x03\0\xd8\x0d\0\0\0\
+\0\0\0\0\0\0\0\0\0\0\0\x74\x01\0\0\0\0\x03\0\x28\x0e\0\0\0\0\0\0\0\0\0\0\0\0\0\
+\0\x1a\x01\0\0\0\0\x03\0\x40\x0e\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x8a\0\0\0\0\0\x03\
+\0\xf0\x0e\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x03\0\x03\0\0\0\0\0\0\0\0\0\0\0\
+\0\0\0\0\0\0\x52\0\0\0\x11\0\x06\0\0\0\0\0\0\0\0\0\x07\0\0\0\0\0\0\0\x0c\0\0\0\
+\x11\0\x05\0\0\0\0\0\0\0\0\0\x14\0\0\0\0\0\0\0\x27\0\0\0\x12\0\x03\0\0\0\0\0\0\
+\0\0\0\x50\x13\0\0\0\0\0\0\x28\0\0\0\0\0\0\0\x01\0\0\0\x3a\0\0\0\x1c\0\0\0\0\0\
+\0\0\x01\0\0\0\x38\0\0\0\0\x2e\x74\x65\x78\x74\0\x6d\x61\x70\x73\0\x74\x61\x70\
+\x5f\x72\x73\x73\x5f\x6d\x61\x70\x5f\x63\x6f\x6e\x66\x69\x67\x75\x72\x61\x74\
+\x69\x6f\x6e\x73\0\x74\x75\x6e\x5f\x72\x73\x73\x5f\x73\x74\x65\x65\x72\x69\x6e\
+\x67\x5f\x70\x72\x6f\x67\0\x2e\x72\x65\x6c\x74\x75\x6e\x5f\x72\x73\x73\x5f\x73\
+\x74\x65\x65\x72\x69\x6e\x67\0\x5f\x6c\x69\x63\x65\x6e\x73\x65\0\x2e\x72\x65\
+\x6c\x2e\x65\x68\x5f\x66\x72\x61\x6d\x65\0\x72\x73\x73\x2e\x62\x70\x66\x2e\x63\
+\0\x2e\x73\x74\x72\x74\x61\x62\0\x2e\x73\x79\x6d\x74\x61\x62\0\x4c\x42\x42\x30\
+\x5f\x39\0\x4c\x42\x42\x30\x5f\x39\x39\0\x4c\x42\x42\x30\x5f\x38\x39\0\x4c\x42\
+\x42\x30\x5f\x36\x39\0\x4c\x42\x42\x30\x5f\x35\x39\0\x4c\x42\x42\x30\x5f\x32\
+\x39\0\x4c\x42\x42\x30\x5f\x31\x39\0\x4c\x42\x42\x30\x5f\x38\0\x4c\x42\x42\x30\
+\x5f\x38\x38\0\x4c\x42\x42\x30\x5f\x35\x38\0\x4c\x42\x42\x30\x5f\x34\x38\0\x4c\
+\x42\x42\x30\x5f\x32\x38\0\x4c\x42\x42\x30\x5f\x31\x38\0\x4c\x42\x42\x30\x5f\
+\x31\x30\x38\0\x4c\x42\x42\x30\x5f\x38\x37\0\x4c\x42\x42\x30\x5f\x37\x37\0\x4c\
+\x42\x42\x30\x5f\x36\x37\0\x4c\x42\x42\x30\x5f\x35\x37\0\x4c\x42\x42\x30\x5f\
+\x34\x37\0\x4c\x42\x42\x30\x5f\x39\x36\0\x4c\x42\x42\x30\x5f\x34\x36\0\x4c\x42\
+\x42\x30\x5f\x31\x30\x36\0\x4c\x42\x42\x30\x5f\x38\x35\0\x4c\x42\x42\x30\x5f\
+\x37\x35\0\x4c\x42\x42\x30\x5f\x36\x35\0\x4c\x42\x42\x30\x5f\x35\x35\0\x4c\x42\
+\x42\x30\x5f\x34\x35\0\x4c\x42\x42\x30\x5f\x33\x35\0\x4c\x42\x42\x30\x5f\x32\
+\x35\0\x4c\x42\x42\x30\x5f\x31\x30\x35\0\x4c\x42\x42\x30\x5f\x39\x34\0\x4c\x42\
 \x42\x30\x5f\x35\x34\0\x4c\x42\x42\x30\x5f\x34\x34\0\x4c\x42\x42\x30\x5f\x32\
-\x34\0\x4c\x42\x42\x30\x5f\x31\x30\x34\0\x4c\x42\x42\x30\x5f\x39\x33\0\x4c\x42\
-\x42\x30\x5f\x38\x33\0\x4c\x42\x42\x30\x5f\x35\x33\0\x4c\x42\x42\x30\x5f\x34\
-\x33\0\x4c\x42\x42\x30\x5f\x32\x33\0\x4c\x42\x42\x30\x5f\x31\x30\x33\0\x4c\x42\
-\x42\x30\x5f\x38\x32\0\x4c\x42\x42\x30\x5f\x35\x32\0\x4c\x42\x42\x30\x5f\x31\
-\x30\x32\0\x4c\x42\x42\x30\x5f\x39\x31\0\x4c\x42\x42\x30\x5f\x38\x31\0\x4c\x42\
-\x42\x30\x5f\x37\x31\0\x4c\x42\x42\x30\x5f\x36\x31\0\x4c\x42\x42\x30\x5f\x35\
-\x31\0\x4c\x42\x42\x30\x5f\x34\x31\0\x4c\x42\x42\x30\x5f\x32\x31\0\x4c\x42\x42\
-\x30\x5f\x31\x31\0\x4c\x42\x42\x30\x5f\x31\x31\x31\0\x4c\x42\x42\x30\x5f\x31\
-\x30\x31\0\x4c\x42\x42\x30\x5f\x38\x30\0\x4c\x42\x42\x30\x5f\x36\x30\0\x4c\x42\
-\x42\x30\x5f\x35\x30\0\x4c\x42\x42\x30\x5f\x31\x30\0\x4c\x42\x42\x30\x5f\x31\
-\x31\x30\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
-\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xaa\
-\0\0\0\x03\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xa0\x1a\0\0\0\0\0\0\x71\x02\0\
-\0\0\0\0\0\0\0\0\0\0\0\0\0\x01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x1a\0\0\0\x01\0\0\
-\0\x06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x40\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
-\0\0\0\0\x04\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x5a\0\0\0\x01\0\0\0\x06\0\0\0\0\0\0\
-\0\0\0\0\0\0\0\0\0\x40\0\0\0\0\0\0\0\xd8\x13\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x08\0\
-\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x56\0\0\0\x09\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
-\0\x60\x1a\0\0\0\0\0\0\x30\0\0\0\0\0\0\0\x09\0\0\0\x03\0\0\0\x08\0\0\0\0\0\0\0\
-\x10\0\0\0\0\0\0\0\x20\0\0\0\x01\0\0\0\x03\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x18\
-\x14\0\0\0\0\0\0\x3c\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x04\0\0\0\0\0\0\0\0\0\0\0\0\
-\0\0\0\x6c\0\0\0\x01\0\0\0\x03\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x54\x14\0\0\0\0\0\
-\0\x07\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x78\0\0\
-\0\x01\0\0\0\x02\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x60\x14\0\0\0\0\0\0\x30\0\0\0\0\
-\0\0\0\0\0\0\0\0\0\0\0\x08\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x74\0\0\0\x09\0\0\0\0\
-\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x90\x1a\0\0\0\0\0\0\x10\0\0\0\0\0\0\0\x09\0\0\0\
-\x07\0\0\0\x08\0\0\0\0\0\0\0\x10\0\0\0\0\0\0\0\xb2\0\0\0\x02\0\0\0\0\0\0\0\0\0\
-\0\0\0\0\0\0\0\0\0\0\x90\x14\0\0\0\0\0\0\xd0\x05\0\0\0\0\0\0\x01\0\0\0\x39\0\0\
-\0\x08\0\0\0\0\0\0\0\x18\0\0\0\0\0\0\0";
+\x34\0\x4c\x42\x42\x30\x5f\x31\x30\x34\0\x4c\x42\x42\x30\x5f\x33\0\x4c\x42\x42\
+\x30\x5f\x38\x33\0\x4c\x42\x42\x30\x5f\x33\x33\0\x4c\x42\x42\x30\x5f\x31\x30\
+\x33\0\x4c\x42\x42\x30\x5f\x32\0\x4c\x42\x42\x30\x5f\x37\x32\0\x4c\x42\x42\x30\
+\x5f\x35\x32\0\x4c\x42\x42\x30\x5f\x33\x32\0\x4c\x42\x42\x30\x5f\x31\x32\0\x4c\
+\x42\x42\x30\x5f\x31\x30\x32\0\x4c\x42\x42\x30\x5f\x39\x31\0\x4c\x42\x42\x30\
+\x5f\x38\x31\0\x4c\x42\x42\x30\x5f\x37\x31\0\x4c\x42\x42\x30\x5f\x31\x31\0\x4c\
+\x42\x42\x30\x5f\x31\x30\x31\0\x4c\x42\x42\x30\x5f\x39\x30\0\x4c\x42\x42\x30\
+\x5f\x37\x30\0\x4c\x42\x42\x30\x5f\x36\x30\0\x4c\x42\x42\x30\x5f\x31\x30\0\0\0\
+\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
+\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x73\0\0\0\x03\0\0\0\0\0\0\0\
+\0\0\0\0\0\0\0\0\0\0\0\0\xa0\x19\0\0\0\0\0\0\x36\x02\0\0\0\0\0\0\0\0\0\0\0\0\0\
+\0\x01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x01\0\0\0\x01\0\0\0\x06\0\0\0\0\0\0\0\0\0\
+\0\0\0\0\0\0\x40\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x04\0\0\0\0\0\0\
+\0\0\0\0\0\0\0\0\0\x41\0\0\0\x01\0\0\0\x06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x40\0\
+\0\0\0\0\0\0\x50\x13\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x08\0\0\0\0\0\0\0\0\0\0\0\0\0\
+\0\0\x3d\0\0\0\x09\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x80\x19\0\0\0\0\0\0\
+\x10\0\0\0\0\0\0\0\x09\0\0\0\x03\0\0\0\x08\0\0\0\0\0\0\0\x10\0\0\0\0\0\0\0\x07\
+\0\0\0\x01\0\0\0\x03\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x90\x13\0\0\0\0\0\0\x14\0\0\
+\0\0\0\0\0\0\0\0\0\0\0\0\0\x04\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x53\0\0\0\x01\0\0\
+\0\x03\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xa4\x13\0\0\0\0\0\0\x07\0\0\0\0\0\0\0\0\0\
+\0\0\0\0\0\0\x01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x5f\0\0\0\x01\0\0\0\x02\0\0\0\0\
+\0\0\0\0\0\0\0\0\0\0\0\xb0\x13\0\0\0\0\0\0\x30\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
+\x08\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x5b\0\0\0\x09\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
+\0\0\0\0\x90\x19\0\0\0\0\0\0\x10\0\0\0\0\0\0\0\x09\0\0\0\x07\0\0\0\x08\0\0\0\0\
+\0\0\0\x10\0\0\0\0\0\0\0\x7b\0\0\0\x02\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
+\xe0\x13\0\0\0\0\0\0\xa0\x05\0\0\0\0\0\0\x01\0\0\0\x39\0\0\0\x08\0\0\0\0\0\0\0\
+\x18\0\0\0\0\0\0\0";
 
 	return 0;
 err:
diff --git a/tools/ebpf/rss.bpf.c b/tools/ebpf/rss.bpf.c
index e85ec55f9b..1fed1d074c 100644
--- a/tools/ebpf/rss.bpf.c
+++ b/tools/ebpf/rss.bpf.c
@@ -36,19 +36,6 @@
 #define INDIRECTION_TABLE_SIZE 128
 #define HASH_CALCULATION_BUFFER_SIZE 36
 
-struct rss_config_t {
-    __u8 redirect;
-    __u8 populate_hash;
-    __u32 hash_types;
-    __u16 indirections_len;
-    __u16 default_queue;
-} __attribute__((packed));
-
-struct toeplitz_key_data_t {
-    __u32 leftmost_32_bits;
-    __u8 next_byte[HASH_CALCULATION_BUFFER_SIZE];
-};
-
 struct packet_hash_info_t {
     __u8 is_ipv4;
     __u8 is_ipv6;
@@ -76,28 +63,30 @@ struct packet_hash_info_t {
     };
 };
 
-struct bpf_map_def SEC("maps")
-tap_rss_map_configurations = {
-        .type        = BPF_MAP_TYPE_ARRAY,
-        .key_size    = sizeof(__u32),
-        .value_size  = sizeof(struct rss_config_t),
-        .max_entries = 1,
+struct toeplitz_key_data_t {
+    __u32 leftmost_32_bits;
+    __u8 next_byte[HASH_CALCULATION_BUFFER_SIZE];
 };
 
-struct bpf_map_def SEC("maps")
-tap_rss_map_toeplitz_key = {
-        .type        = BPF_MAP_TYPE_ARRAY,
-        .key_size    = sizeof(__u32),
-        .value_size  = sizeof(struct toeplitz_key_data_t),
-        .max_entries = 1,
-};
+struct rss_config_t {
+    __u8 redirect;
+    __u8 populate_hash;
+    __u32 hash_types;
+    __u16 indirections_len;
+    __u16 default_queue;
+
+    struct toeplitz_key_data_t toeplitz_key;
+
+    __u16 indirections_table[INDIRECTION_TABLE_SIZE];
+} __attribute__((packed));
 
 struct bpf_map_def SEC("maps")
-tap_rss_map_indirection_table = {
+tap_rss_map_configurations = {
         .type        = BPF_MAP_TYPE_ARRAY,
         .key_size    = sizeof(__u32),
-        .value_size  = sizeof(__u16),
-        .max_entries = INDIRECTION_TABLE_SIZE,
+        .value_size  = sizeof(struct rss_config_t),
+        .max_entries = 1,
+        .map_flags = BPF_F_MMAPABLE,
 };
 
 static inline void net_rx_rss_add_chunk(__u8 *rss_input, size_t *bytes_written,
@@ -381,7 +370,7 @@ error:
 }
 
 static inline __u32 calculate_rss_hash(struct __sk_buff *skb,
-        struct rss_config_t *config, struct toeplitz_key_data_t *toe)
+        struct rss_config_t *config)
 {
     __u8 rss_input[HASH_CALCULATION_BUFFER_SIZE] = {};
     size_t bytes_written = 0;
@@ -525,7 +514,8 @@ static inline __u32 calculate_rss_hash(struct __sk_buff *skb,
     }
 
     if (bytes_written) {
-        net_toeplitz_add(&result, rss_input, bytes_written, toe);
+        net_toeplitz_add(&result, rss_input,
+                         bytes_written, &config->toeplitz_key);
     }
 
     return result;
@@ -536,29 +526,24 @@ int tun_rss_steering_prog(struct __sk_buff *skb)
 {
 
     struct rss_config_t *config;
-    struct toeplitz_key_data_t *toe;
 
     __u32 key = 0;
     __u32 hash = 0;
 
     config = bpf_map_lookup_elem(&tap_rss_map_configurations, &key);
-    toe = bpf_map_lookup_elem(&tap_rss_map_toeplitz_key, &key);
 
-    if (config && toe) {
+    if (config) {
         if (!config->redirect) {
             return config->default_queue;
         }
 
-        hash = calculate_rss_hash(skb, config, toe);
+        hash = calculate_rss_hash(skb, config);
         if (hash) {
             __u32 table_idx = hash % config->indirections_len;
-            __u16 *queue = 0;
-
-            queue = bpf_map_lookup_elem(&tap_rss_map_indirection_table,
-                                        &table_idx);
 
-            if (queue) {
-                return *queue;
+            if (table_idx < INDIRECTION_TABLE_SIZE
+                && table_idx < config->indirections_len) {
+                return config->indirections_table[table_idx];
             }
         }
 
-- 
2.31.1



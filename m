Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2526E69C158
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Feb 2023 17:39:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTmhU-0006MD-Pa; Sun, 19 Feb 2023 11:38:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pTmhR-0006Hx-Sa
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 11:38:06 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pTmhQ-0006iK-1s
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 11:38:05 -0500
Received: by mail-ed1-x52c.google.com with SMTP id en26so2741988edb.13
 for <qemu-devel@nongnu.org>; Sun, 19 Feb 2023 08:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LBTMUP17qgO4UCL3k98gY84dhgHwtRh8YSBQCxf5jZQ=;
 b=ZkOP37u8TiMVIi6rHFb/Tr/ZZxl1yoKrF3nW87YQ0QoIjuB/p0NQGVSFKMMsUmpgkn
 2QY/tlI4STcD5JeYwNGWBJWXI5ybI72hAvxlymm4nbMhg4ncxc6wObDvsYK0tkfPx0cg
 Udra5CtP1hTymAypYmE+jLWBkrdYmqWAmRF3xdiXqrJdz6QywvNSBorXpoMgpHyGQhrG
 zqa9k+NUftDMpVFKor2zkdI0dYTM+M50dlYkSgTZS/kqABq9kWIEJktxZQYL0ew5VZY4
 dMCe24LCEOwbARMTfXCr+OG4ivX+vQV8s7la/2gdEbbZmshXR8omwZnqgteS7aaF2nS1
 8eKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LBTMUP17qgO4UCL3k98gY84dhgHwtRh8YSBQCxf5jZQ=;
 b=I+m0i4RKaMjuMktzct/OCmtVDl+Mh5TOx7iH8HdykoKI1XHK39V1ayoMqpazbxrxrb
 1d0HTBmz7C65ghBvTvK2aazU6IXDYY/NH7UGdTnhruYvjFJhWO8xN5KpsjJ0qK4thWnW
 ur7pJO04B7lbOX1chwpkqmTiJVWasNJJf1n5Z/8HQFCt73sMQMYihT3MkQeg9EzJGj59
 8yAjNP9aw468eRg3PLF4PDob+tQ4ZEac9X4VbJ3atsH60rErhrxMFibsHJV7LUsdnmab
 xTyjkD85zdnIJMUIs1GOwjBevlzeQg0Sdu6IdRQ5NrpMascjBuGR+XyFcqVwOrZ+3vCu
 73gw==
X-Gm-Message-State: AO0yUKUzzDscIkG/VsXUSnECwpjH+yP18/EXRdsUz8mRgB4MOH090+h/
 +4feuBu2KgZ+7vLN6q9FSBWdsw==
X-Google-Smtp-Source: AK7set8w8Fz+2D1K2BWo/8tSQaWhizsxzMmjyta44xmKy9XB8bDt7qkGjitJ6LTST71lRLdRkrsnGg==
X-Received: by 2002:a17:906:9416:b0:878:72f7:bd99 with SMTP id
 q22-20020a170906941600b0087872f7bd99mr4609248ejx.6.1676824681692; 
 Sun, 19 Feb 2023 08:38:01 -0800 (PST)
Received: from localhost.localdomain ([193.33.38.48])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a1709066b8d00b008cdb0628991sm647516ejr.57.2023.02.19.08.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 08:38:00 -0800 (PST)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, armbru@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, toke@redhat.com, mprivozn@redhat.com
Cc: yuri.benditovich@daynix.com,
	yan@daynix.com
Subject: [PATCH 1/5] ebpf: Added eBPF initialization by fds and map update.
Date: Sun, 19 Feb 2023 18:20:56 +0200
Message-Id: <20230219162100.174318-2-andrew@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230219162100.174318-1-andrew@daynix.com>
References: <20230219162100.174318-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::52c;
 envelope-from=andrew@daynix.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Changed eBPF map updates through mmaped array.
Mmaped arrays provide direct access to map data.
It should omit using bpf_map_update_elem() call,
which may require capabilities that are not present.
Also, eBPF RSS context may be initialized by file descriptors.
virtio-net may provide fds passed by libvirt.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 ebpf/ebpf_rss-stub.c |   6 +++
 ebpf/ebpf_rss.c      | 120 ++++++++++++++++++++++++++++++++++---------
 ebpf/ebpf_rss.h      |  10 ++++
 3 files changed, 113 insertions(+), 23 deletions(-)

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
index cee658c158..08015fecb1 100644
--- a/ebpf/ebpf_rss.c
+++ b/ebpf/ebpf_rss.c
@@ -27,19 +27,68 @@ void ebpf_rss_init(struct EBPFRSSContext *ctx)
 {
     if (ctx != NULL) {
         ctx->obj = NULL;
+        ctx->program_fd = -1;
     }
 }
 
 bool ebpf_rss_is_loaded(struct EBPFRSSContext *ctx)
 {
-    return ctx != NULL && ctx->obj != NULL;
+    return ctx != NULL && (ctx->obj != NULL || ctx->program_fd != -1);
+}
+
+static bool ebpf_rss_mmap(struct EBPFRSSContext *ctx)
+{
+    if (!ebpf_rss_is_loaded(ctx)) {
+        return false;
+    }
+
+    ctx->mmap_configuration = mmap(NULL, qemu_real_host_page_size(),
+                                   PROT_READ | PROT_WRITE, MAP_SHARED,
+                                   ctx->map_configuration, 0);
+    if (ctx->mmap_configuration == MAP_FAILED) {
+        trace_ebpf_error("eBPF RSS", "can not mmap eBPF configuration array");
+        return false;
+    }
+    ctx->mmap_toeplitz_key = mmap(NULL, qemu_real_host_page_size(),
+                                   PROT_READ | PROT_WRITE, MAP_SHARED,
+                                   ctx->map_toeplitz_key, 0);
+    if (ctx->mmap_toeplitz_key == MAP_FAILED) {
+        trace_ebpf_error("eBPF RSS", "can not mmap eBPF toeplitz key");
+        goto toeplitz_fail;
+    }
+    ctx->mmap_indirections_table = mmap(NULL, qemu_real_host_page_size(),
+                                   PROT_READ | PROT_WRITE, MAP_SHARED,
+                                   ctx->map_indirections_table, 0);
+    if (ctx->mmap_indirections_table == MAP_FAILED) {
+        trace_ebpf_error("eBPF RSS", "can not mmap eBPF indirection table");
+        goto indirection_fail;
+    }
+
+    return true;
+
+indirection_fail:
+    munmap(ctx->mmap_toeplitz_key, qemu_real_host_page_size());
+toeplitz_fail:
+    munmap(ctx->mmap_configuration, qemu_real_host_page_size());
+    return false;
+}
+
+static void ebpf_rss_munmap(struct EBPFRSSContext *ctx)
+{
+    if (!ebpf_rss_is_loaded(ctx)) {
+        return;
+    }
+
+    munmap(ctx->mmap_indirections_table, qemu_real_host_page_size());
+    munmap(ctx->mmap_toeplitz_key, qemu_real_host_page_size());
+    munmap(ctx->mmap_configuration, qemu_real_host_page_size());
 }
 
 bool ebpf_rss_load(struct EBPFRSSContext *ctx)
 {
     struct rss_bpf *rss_bpf_ctx;
 
-    if (ctx == NULL) {
+    if (ctx == NULL || ebpf_rss_is_loaded(ctx)) {
         return false;
     }
 
@@ -66,26 +115,51 @@ bool ebpf_rss_load(struct EBPFRSSContext *ctx)
     ctx->map_toeplitz_key = bpf_map__fd(
             rss_bpf_ctx->maps.tap_rss_map_toeplitz_key);
 
+    if (!ebpf_rss_mmap(ctx)) {
+        goto error;
+    }
+
     return true;
 error:
     rss_bpf__destroy(rss_bpf_ctx);
     ctx->obj = NULL;
+    ctx->program_fd = -1;
 
     return false;
 }
 
-static bool ebpf_rss_set_config(struct EBPFRSSContext *ctx,
-                                struct EBPFRSSConfig *config)
+bool ebpf_rss_load_fds(struct EBPFRSSContext *ctx, int program_fd,
+                       int config_fd, int toeplitz_fd, int table_fd)
 {
-    uint32_t map_key = 0;
+    if (ctx == NULL || ebpf_rss_is_loaded(ctx)) {
+        return false;
+    }
 
-    if (!ebpf_rss_is_loaded(ctx)) {
+    if (program_fd < 0 || config_fd < 0 || toeplitz_fd < 0 || table_fd < 0) {
         return false;
     }
-    if (bpf_map_update_elem(ctx->map_configuration,
-                            &map_key, config, 0) < 0) {
+
+    ctx->program_fd = program_fd;
+    ctx->map_configuration = config_fd;
+    ctx->map_toeplitz_key = toeplitz_fd;
+    ctx->map_indirections_table = table_fd;
+
+    if (!ebpf_rss_mmap(ctx)) {
+        ctx->program_fd = -1;
         return false;
     }
+
+    return true;
+}
+
+static bool ebpf_rss_set_config(struct EBPFRSSContext *ctx,
+                                struct EBPFRSSConfig *config)
+{
+    if (!ebpf_rss_is_loaded(ctx)) {
+        return false;
+    }
+
+    memcpy(ctx->mmap_configuration, config, sizeof(*config));
     return true;
 }
 
@@ -93,27 +167,19 @@ static bool ebpf_rss_set_indirections_table(struct EBPFRSSContext *ctx,
                                             uint16_t *indirections_table,
                                             size_t len)
 {
-    uint32_t i = 0;
-
     if (!ebpf_rss_is_loaded(ctx) || indirections_table == NULL ||
        len > VIRTIO_NET_RSS_MAX_TABLE_LEN) {
         return false;
     }
 
-    for (; i < len; ++i) {
-        if (bpf_map_update_elem(ctx->map_indirections_table, &i,
-                                indirections_table + i, 0) < 0) {
-            return false;
-        }
-    }
+    memcpy(ctx->mmap_indirections_table, indirections_table,
+            sizeof(*indirections_table) * len);
     return true;
 }
 
 static bool ebpf_rss_set_toepliz_key(struct EBPFRSSContext *ctx,
                                      uint8_t *toeplitz_key)
 {
-    uint32_t map_key = 0;
-
     /* prepare toeplitz key */
     uint8_t toe[VIRTIO_NET_RSS_MAX_KEY_SIZE] = {};
 
@@ -123,10 +189,7 @@ static bool ebpf_rss_set_toepliz_key(struct EBPFRSSContext *ctx,
     memcpy(toe, toeplitz_key, VIRTIO_NET_RSS_MAX_KEY_SIZE);
     *(uint32_t *)toe = ntohl(*(uint32_t *)toe);
 
-    if (bpf_map_update_elem(ctx->map_toeplitz_key, &map_key, toe,
-                            0) < 0) {
-        return false;
-    }
+    memcpy(ctx->mmap_toeplitz_key, toe, VIRTIO_NET_RSS_MAX_KEY_SIZE);
     return true;
 }
 
@@ -160,6 +223,17 @@ void ebpf_rss_unload(struct EBPFRSSContext *ctx)
         return;
     }
 
-    rss_bpf__destroy(ctx->obj);
+    ebpf_rss_munmap(ctx);
+
+    if (ctx->obj) {
+        rss_bpf__destroy(ctx->obj);
+    } else {
+        close(ctx->program_fd);
+        close(ctx->map_configuration);
+        close(ctx->map_toeplitz_key);
+        close(ctx->map_indirections_table);
+    }
+
     ctx->obj = NULL;
+    ctx->program_fd = -1;
 }
diff --git a/ebpf/ebpf_rss.h b/ebpf/ebpf_rss.h
index bf3f2572c7..239242b0d2 100644
--- a/ebpf/ebpf_rss.h
+++ b/ebpf/ebpf_rss.h
@@ -14,12 +14,19 @@
 #ifndef QEMU_EBPF_RSS_H
 #define QEMU_EBPF_RSS_H
 
+#define EBPF_RSS_MAX_FDS 4
+
 struct EBPFRSSContext {
     void *obj;
     int program_fd;
     int map_configuration;
     int map_toeplitz_key;
     int map_indirections_table;
+
+    /* mapped eBPF maps for direct access to omit bpf_map_update_elem() */
+    void *mmap_configuration;
+    void *mmap_toeplitz_key;
+    void *mmap_indirections_table;
 };
 
 struct EBPFRSSConfig {
@@ -36,6 +43,9 @@ bool ebpf_rss_is_loaded(struct EBPFRSSContext *ctx);
 
 bool ebpf_rss_load(struct EBPFRSSContext *ctx);
 
+bool ebpf_rss_load_fds(struct EBPFRSSContext *ctx, int program_fd,
+                       int config_fd, int toeplitz_fd, int table_fd);
+
 bool ebpf_rss_set_all(struct EBPFRSSContext *ctx, struct EBPFRSSConfig *config,
                       uint16_t *indirections_table, uint8_t *toeplitz_key);
 
-- 
2.39.1



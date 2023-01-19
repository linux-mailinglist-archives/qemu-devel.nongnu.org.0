Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46299673246
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 08:16:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIP91-0006O4-UA; Thu, 19 Jan 2023 02:15:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pIP8W-0006GD-HD
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:15:00 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pIP8U-0002GV-Le
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:15:00 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 z1-20020a17090a66c100b00226f05b9595so1023857pjl.0
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 23:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zksQYXXIDJBPnsRDJDs+M4hEapPR4KCQMDs5uvODmZs=;
 b=nSLIDHhwfoXOQ5r2W16rg2Qwo+eXzlRu4Lk8oeUIMZ8qE3JUZkUCCKxHJTkF6Yk6ha
 79967aMAkow4RgQc203VFn8JXCoxrv7GVptyO5J1gEPNfl4zplOdRU13ofGOQ7N5G2DK
 1KkfagflfmtEUgHWSC0936TVc3XzSJDfThl/fzS7hWiM0g3i8w5mVBpMG239EDYCyC/I
 JHvrcxM9fJj3lylXSpETGpM0Y5QyiukK0le17ssFIKzweTo6iGJZ5b+OeAZHIbws0R2o
 fW30V9bYfv3N+vdlt0AodT56qxNThpjiKAAZZAbdF888Bg0BzLPsTwe1QNhEBeFEascT
 mQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zksQYXXIDJBPnsRDJDs+M4hEapPR4KCQMDs5uvODmZs=;
 b=Jpjnc/E+EY8afZHUvsFi624sybtcTxNg/XcuRXua0bl/xVhGDXDe9RLhm01SPyaNKN
 GXHfJAzrTQpNTcOI6sWmzt6CY0G3bgOgvXlna5dZ+qcQIFX3vLEGIy3miA5yAh6lSdXv
 8znme+sk3cxFgCzB4o3UQ7HS5jYNf5y9yg2l4uAPgxX4fSgjd3lpaLZnapuCLjY/QqQ5
 kcENSiALgjeC/cs4QAHcF9r7OGUyL+iHJwpsvm6i5nl+zrbnqsXcil1V6aDzmu7iPHku
 EBlY7O/ICvJdNDxzzAgDVBn1K8Pc11ggIM6LunBY+5zmNFz2z0HIedh5D1hu0Pngif44
 un7Q==
X-Gm-Message-State: AFqh2kpjuZsfp6HLWSHIKYmWukTHN3C4DaZM1TAAYJ7vaDBiSUPWBllu
 47VpxoCwMBc4hqNCRouNyQ8lug==
X-Google-Smtp-Source: AMrXdXuv3mUiYxfruK2LHxLGlctoOnJVFiRlFQo2pUukSyHGbcui3TGGtCS1pt/eLGJQEvALPswEhg==
X-Received: by 2002:a17:902:744c:b0:186:a43b:a5 with SMTP id
 e12-20020a170902744c00b00186a43b00a5mr9695171plt.13.1674112497944; 
 Wed, 18 Jan 2023 23:14:57 -0800 (PST)
Received: from always-pc.bytedance.net ([61.213.176.6])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a170902ef4400b0016d72804664sm24266631plx.205.2023.01.18.23.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 23:14:57 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com, mst@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com
Cc: armbru@redhat.com, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v3 10/12] cryptodev: support QoS
Date: Thu, 19 Jan 2023 15:14:17 +0800
Message-Id: <20230119071419.3585771-11-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230119071419.3585771-1-pizhenwei@bytedance.com>
References: <20230119071419.3585771-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add 'throttle-bps' and 'throttle-ops' limitation to set QoS. The
two arguments work with both QEMU command line and QMP command.

Example of QEMU command line:
-object cryptodev-backend-builtin,id=cryptodev1,throttle-bps=1600,\
throttle-ops=100

Example of QMP command:
virsh qemu-monitor-command buster --hmp qom-set /objects/cryptodev1 \
throttle-ops 100

or cancel limitation:
virsh qemu-monitor-command buster --hmp qom-set /objects/cryptodev1 \
throttle-ops 0

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 backends/cryptodev.c       | 138 +++++++++++++++++++++++++++++++++++++
 include/sysemu/cryptodev.h |   7 ++
 qapi/qom.json              |   8 ++-
 3 files changed, 152 insertions(+), 1 deletion(-)

diff --git a/backends/cryptodev.c b/backends/cryptodev.c
index 9c8ba6f29f..c288d5a016 100644
--- a/backends/cryptodev.c
+++ b/backends/cryptodev.c
@@ -28,6 +28,7 @@
 #include "qapi/visitor.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
+#include "qemu/main-loop.h"
 #include "qom/object_interfaces.h"
 #include "hw/virtio/virtio-crypto.h"
 
@@ -203,17 +204,53 @@ static int cryptodev_backend_account(CryptoDevBackend *backend,
     return len;
 }
 
+static void cryptodev_backend_throttle_timer_cb(void *opaque)
+{
+    CryptoDevBackend *backend = (CryptoDevBackend *)opaque;
+    CryptoDevBackendOpInfo *op_info, *tmpop;
+    int ret;
+
+    QTAILQ_FOREACH_SAFE(op_info, &backend->opinfos, next, tmpop) {
+        QTAILQ_REMOVE(&backend->opinfos, op_info, next);
+        ret = cryptodev_backend_account(backend, op_info);
+        if (ret < 0) {
+            op_info->cb(op_info->opaque, ret);
+            continue;
+        }
+
+        throttle_account(&backend->ts, true, ret);
+        cryptodev_backend_operation(backend, op_info);
+        if (throttle_enabled(&backend->tc) &&
+            throttle_schedule_timer(&backend->ts, &backend->tt, true)) {
+            break;
+        }
+    }
+}
+
 int cryptodev_backend_crypto_operation(
                  CryptoDevBackend *backend,
                  CryptoDevBackendOpInfo *op_info)
 {
     int ret;
 
+    if (!throttle_enabled(&backend->tc)) {
+        goto do_account;
+    }
+
+    if (throttle_schedule_timer(&backend->ts, &backend->tt, true) ||
+        !QTAILQ_EMPTY(&backend->opinfos)) {
+        QTAILQ_INSERT_TAIL(&backend->opinfos, op_info, next);
+        return 0;
+    }
+
+do_account:
     ret = cryptodev_backend_account(backend, op_info);
     if (ret < 0) {
         return ret;
     }
 
+    throttle_account(&backend->ts, true, ret);
+
     return cryptodev_backend_operation(backend, op_info);
 }
 
@@ -245,12 +282,98 @@ cryptodev_backend_set_queues(Object *obj, Visitor *v, const char *name,
     backend->conf.peers.queues = value;
 }
 
+static void cryptodev_backend_set_throttle(CryptoDevBackend *backend, int field,
+                                           uint64_t value, Error **errp)
+{
+    uint64_t orig = backend->tc.buckets[field].avg;
+    bool enabled = throttle_enabled(&backend->tc);
+
+    if (orig == value) {
+        return;
+    }
+
+    backend->tc.buckets[field].avg = value;
+    if (!throttle_enabled(&backend->tc)) {
+        throttle_timers_destroy(&backend->tt);
+        cryptodev_backend_throttle_timer_cb(backend); /* drain opinfos */
+        return;
+    }
+
+    if (!throttle_is_valid(&backend->tc, errp)) {
+        backend->tc.buckets[field].avg = orig; /* revert change */
+        return;
+    }
+
+    if (!enabled) {
+        throttle_init(&backend->ts);
+        throttle_timers_init(&backend->tt, qemu_get_aio_context(),
+                         QEMU_CLOCK_REALTIME,
+                         cryptodev_backend_throttle_timer_cb, /* FIXME */
+                         cryptodev_backend_throttle_timer_cb, backend);
+    }
+
+    throttle_config(&backend->ts, QEMU_CLOCK_REALTIME, &backend->tc);
+}
+
+static void cryptodev_backend_get_bps(Object *obj, Visitor *v,
+                                      const char *name, void *opaque,
+                                      Error **errp)
+{
+    CryptoDevBackend *backend = CRYPTODEV_BACKEND(obj);
+    uint64_t value = backend->tc.buckets[THROTTLE_BPS_TOTAL].avg;
+
+    visit_type_uint64(v, name, &value, errp);
+}
+
+static void cryptodev_backend_set_bps(Object *obj, Visitor *v, const char *name,
+                                      void *opaque, Error **errp)
+{
+    CryptoDevBackend *backend = CRYPTODEV_BACKEND(obj);
+    uint64_t value;
+
+    if (!visit_type_uint64(v, name, &value, errp)) {
+        return;
+    }
+
+    cryptodev_backend_set_throttle(backend, THROTTLE_BPS_TOTAL, value, errp);
+}
+
+static void cryptodev_backend_get_ops(Object *obj, Visitor *v, const char *name,
+                                      void *opaque, Error **errp)
+{
+    CryptoDevBackend *backend = CRYPTODEV_BACKEND(obj);
+    uint64_t value = backend->tc.buckets[THROTTLE_OPS_TOTAL].avg;
+
+    visit_type_uint64(v, name, &value, errp);
+}
+
+static void cryptodev_backend_set_ops(Object *obj, Visitor *v,
+                                       const char *name, void *opaque,
+                                       Error **errp)
+{
+    CryptoDevBackend *backend = CRYPTODEV_BACKEND(obj);
+    uint64_t value;
+
+    if (!visit_type_uint64(v, name, &value, errp)) {
+        return;
+    }
+
+    cryptodev_backend_set_throttle(backend, THROTTLE_OPS_TOTAL, value, errp);
+}
+
 static void
 cryptodev_backend_complete(UserCreatable *uc, Error **errp)
 {
     CryptoDevBackend *backend = CRYPTODEV_BACKEND(uc);
     CryptoDevBackendClass *bc = CRYPTODEV_BACKEND_GET_CLASS(uc);
     uint32_t services;
+    uint64_t value;
+
+    QTAILQ_INIT(&backend->opinfos);
+    value = backend->tc.buckets[THROTTLE_OPS_TOTAL].avg;
+    cryptodev_backend_set_throttle(backend, THROTTLE_OPS_TOTAL, value, errp);
+    value = backend->tc.buckets[THROTTLE_BPS_TOTAL].avg;
+    cryptodev_backend_set_throttle(backend, THROTTLE_BPS_TOTAL, value, errp);
 
     if (bc->init) {
         bc->init(backend, errp);
@@ -294,8 +417,12 @@ cryptodev_backend_can_be_deleted(UserCreatable *uc)
 
 static void cryptodev_backend_instance_init(Object *obj)
 {
+    CryptoDevBackend *backend = CRYPTODEV_BACKEND(obj);
+
     /* Initialize devices' queues property to 1 */
     object_property_set_int(obj, "queues", 1, NULL);
+
+    throttle_config_init(&backend->tc);
 }
 
 static void cryptodev_backend_finalize(Object *obj)
@@ -303,6 +430,9 @@ static void cryptodev_backend_finalize(Object *obj)
     CryptoDevBackend *backend = CRYPTODEV_BACKEND(obj);
 
     cryptodev_backend_cleanup(backend, NULL);
+    if (throttle_enabled(&backend->tc)) {
+        throttle_timers_destroy(&backend->tt);
+    }
 }
 
 static void
@@ -318,6 +448,14 @@ cryptodev_backend_class_init(ObjectClass *oc, void *data)
                               cryptodev_backend_get_queues,
                               cryptodev_backend_set_queues,
                               NULL, NULL);
+    object_class_property_add(oc, "throttle-bps", "uint64",
+                              cryptodev_backend_get_bps,
+                              cryptodev_backend_set_bps,
+                              NULL, NULL);
+    object_class_property_add(oc, "throttle-ops", "uint64",
+                              cryptodev_backend_get_ops,
+                              cryptodev_backend_set_ops,
+                              NULL, NULL);
 }
 
 static const TypeInfo cryptodev_backend_info = {
diff --git a/include/sysemu/cryptodev.h b/include/sysemu/cryptodev.h
index 15e8c04dcf..113eec4caf 100644
--- a/include/sysemu/cryptodev.h
+++ b/include/sysemu/cryptodev.h
@@ -24,6 +24,7 @@
 #define CRYPTODEV_H
 
 #include "qemu/queue.h"
+#include "qemu/throttle.h"
 #include "qom/object.h"
 #include "qapi/qapi-types-cryptodev.h"
 
@@ -187,6 +188,7 @@ typedef struct CryptoDevBackendOpInfo {
         CryptoDevBackendSymOpInfo *sym_op_info;
         CryptoDevBackendAsymOpInfo *asym_op_info;
     } u;
+    QTAILQ_ENTRY(CryptoDevBackendOpInfo) next;
 } CryptoDevBackendOpInfo;
 
 struct CryptoDevBackendClass {
@@ -255,6 +257,11 @@ struct CryptoDevBackend {
     CryptoDevBackendConf conf;
     QCryptodevBackendSymStat *sym_stat;
     QCryptodevBackendAsymStat *asym_stat;
+
+    ThrottleState ts;
+    ThrottleTimers tt;
+    ThrottleConfig tc;
+    QTAILQ_HEAD(, CryptoDevBackendOpInfo) opinfos;
 };
 
 #define QCryptodevSymStatInc(be, op, bytes) do { \
diff --git a/qapi/qom.json b/qapi/qom.json
index 30e76653ad..a877b879b9 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -278,10 +278,16 @@
 #          cryptodev-backend and must be 1 for cryptodev-backend-builtin.
 #          (default: 1)
 #
+# @throttle-bps: limit total bytes per second (Since 8.0)
+#
+# @throttle-ops: limit total operations per second (Since 8.0)
+#
 # Since: 2.8
 ##
 { 'struct': 'CryptodevBackendProperties',
-  'data': { '*queues': 'uint32' } }
+  'data': { '*queues': 'uint32',
+            '*throttle-bps': 'uint64',
+            '*throttle-ops': 'uint64' } }
 
 ##
 # @CryptodevVhostUserProperties:
-- 
2.34.1



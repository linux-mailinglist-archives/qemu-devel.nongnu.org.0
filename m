Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2739B633E84
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 15:09:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxTtu-0000Gl-Nz; Tue, 22 Nov 2022 09:05:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oxTtg-00004s-Fo
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:05:13 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oxTte-0006Gr-0P
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:05:12 -0500
Received: by mail-pl1-x62d.google.com with SMTP id j12so13727107plj.5
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 06:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R2pIUNNN/Jr1yOhRff9xNPmA2IUQiWkT9SHme9njJhc=;
 b=y3sjtUrq3rQCSpmpbtOJJu20CB3fUYSQg+EImHCgOth0yfLKTAn/ua2I7QBAmuStBv
 p3GK1RDD7R/OsVb8MNDuDHY0DzgqdDhp1XNpUExUdkZngFmjXK2jDxp6Zf+0VDMTGSX4
 3FR/wLxQwQwrDr1NjSIuYTY/jq11S6Xh+iCbxL9ISFE8Y1fNF5BPHUy8wORfqUg23j8y
 87cWb1IFy2i0c0//+cNKi60aldE/b/WnSLiexSDJrW2F9BijGWVj23Go/t1MIPsQEjyG
 29ETivY7y3gcq0HfejHtcPCXycJgCo94No2rorvAv6uBSDp0q5cfPp4+EhO1CBjCBlVm
 gvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R2pIUNNN/Jr1yOhRff9xNPmA2IUQiWkT9SHme9njJhc=;
 b=XJvdfXg9JpsMNxe8KN+Cu/Lg4fmC2pLWKxOHEv+Tyf36K3agDYuntv0zk6ETqw83rw
 z9oRZR0PZ6v5gLyO0lKYpqMAGORY8QPzRF1gKxFOs+03NpdpbGOLwt//guEdI518VNXj
 Z1Oo34Py81g7PBLz//X5d6St7y3XONUwZX14OExKBDUQ3jXBnyF04E4boSIv8Nxw/qSE
 zAuqYfjGJgXfbZKya864NovBVWEFIDnhEk99BiPwP0t/J9RlKg9CopFN7Y0e5tgFt/ie
 q0vjDP1e6/p8t0qn42MZlHJspx4nqqPgAE8m3bqw4Eh9SswEnocvNdEM46RnzG8eDCuL
 Dv5w==
X-Gm-Message-State: ANoB5plegsl/KaDQ6Sl//h3bAsHohKKCpsBtE/yfCpMY5Kup+Sj7VKRr
 TLkBOG+ukDEUdjVWG1t3FReRmQ==
X-Google-Smtp-Source: AA0mqf7iE5JNEk1UjSkq6DAmTmSblFRUrPfmGj25ZRJHI4doave0hiWkLlD0N8wXm1VuTxeHXYhGYg==
X-Received: by 2002:a17:902:cf08:b0:188:e49e:2657 with SMTP id
 i8-20020a170902cf0800b00188e49e2657mr8468845plg.151.1669125908606; 
 Tue, 22 Nov 2022 06:05:08 -0800 (PST)
Received: from always-T480.www.tendawifi.com ([139.177.225.252])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a170902e74100b00186b280a441sm12097410plf.239.2022.11.22.06.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 06:05:08 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com, mst@redhat.com, dgilbert@redhat.com,
 eblake@redhat.com, armbru@redhat.com, michael.roth@amd.com,
 pbonzini@redhat.com
Cc: qemu-devel@nongnu.org,
	zhenwei pi <pizhenwei@bytedance.com>
Subject: [for-8.0 v2 10/11] cryptodev: support QoS
Date: Tue, 22 Nov 2022 22:07:55 +0800
Message-Id: <20221122140756.686982-11-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221122140756.686982-1-pizhenwei@bytedance.com>
References: <20221122140756.686982-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x62d.google.com
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
 backends/cryptodev.c       | 140 +++++++++++++++++++++++++++++++++++++
 include/sysemu/cryptodev.h |   7 ++
 qapi/qom.json              |   8 ++-
 3 files changed, 154 insertions(+), 1 deletion(-)

diff --git a/backends/cryptodev.c b/backends/cryptodev.c
index 72105df95a..5bbaa6eecc 100644
--- a/backends/cryptodev.c
+++ b/backends/cryptodev.c
@@ -28,6 +28,7 @@
 #include "qapi/visitor.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
+#include "qemu/main-loop.h"
 #include "qom/object_interfaces.h"
 #include "hw/virtio/virtio-crypto.h"
 
@@ -219,16 +220,54 @@ static int cryptodev_backend_account(CryptoDevBackend *backend,
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
+        ret = cryptodev_backend_account(backend, op_info);
+        if (ret < 0) {
+            return ret;
+        }
+        return cryptodev_backend_operation(backend, op_info);
+    }
+
+    if (throttle_schedule_timer(&backend->ts, &backend->tt, true) ||
+        !QTAILQ_EMPTY(&backend->opinfos)) {
+        QTAILQ_INSERT_TAIL(&backend->opinfos, op_info, next);
+        return 0;
+    }
+
     ret = cryptodev_backend_account(backend, op_info);
     if (ret < 0) {
         return ret;
     }
+    throttle_account(&backend->ts, true, ret);
     return cryptodev_backend_operation(backend, op_info);
 }
 
@@ -260,12 +299,98 @@ cryptodev_backend_set_queues(Object *obj, Visitor *v, const char *name,
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
@@ -309,8 +434,12 @@ cryptodev_backend_can_be_deleted(UserCreatable *uc)
 
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
@@ -318,6 +447,9 @@ static void cryptodev_backend_finalize(Object *obj)
     CryptoDevBackend *backend = CRYPTODEV_BACKEND(obj);
 
     cryptodev_backend_cleanup(backend, NULL);
+    if (throttle_enabled(&backend->tc)) {
+        throttle_timers_destroy(&backend->tt);
+    }
 }
 
 static void
@@ -333,6 +465,14 @@ cryptodev_backend_class_init(ObjectClass *oc, void *data)
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
index ffbce1129c..3382b45c1a 100644
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
2.20.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCE467F478
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 04:58:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLcLC-0000RV-St; Fri, 27 Jan 2023 22:57:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLcLB-0000RM-Hg
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 22:57:21 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLcL9-0003pF-Lf
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 22:57:21 -0500
Received: by mail-pl1-x631.google.com with SMTP id jl3so6823715plb.8
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 19:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zksQYXXIDJBPnsRDJDs+M4hEapPR4KCQMDs5uvODmZs=;
 b=JyX3QAa6DGE4N83XrHqTVGjTTE8W+Vr5hzpoNMNxVAKSFllFFht2PF7zsF0H3YNkrC
 YCmrXOyY0J1h63ZFqzkS6JMZK6NajiQmDxX2Cz2RcFGspLlDRtUI+rgAwvnYXjzYj7eS
 LWOrbigL4JpYY1C2fIv6gm8zxmgsaC5WhX2rE7ecyGKFrzi3+885CpL6sLR2j0CDCun6
 PNMVnP0NlSC8vZWmXgGUuzjsSWDNOl770Ujgww/kMq4lLYc9xTcqHACfNBtNJzSd5Mcz
 +6DIYBPUyDTzBtPqiipfGIbTtuMNy11lF7e12IAlYsgntus/AfY5SUYeSxLE7h1t5m8h
 sHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zksQYXXIDJBPnsRDJDs+M4hEapPR4KCQMDs5uvODmZs=;
 b=tchICyw7gFrwgGM5WZ5uBNBPr1u5Bzktmmq2T4/2B15r06ywcYToODzvlZEu//Vorj
 iQhkKOSiFDtdX8VM3xtFTVY9FGzgZjUuR5tsh36bQqovyIxadI9kcuL+Ij2fBaU6BhbT
 hpEof1TzTIUGxylzA3U+DdkvXfgb7RT3WsTh1Jn10NolWj0V5QvyaazMB1b+jN7eTnL/
 4MGyDnU9w1sVZEmIGkBj8p2TBFTb061ZiATZo1OduoWhRBBobqr4lIhIZrwabRd0ieVC
 60zf6fyuCssXXaeFeSYxl3UcU7xn3/Dm5BvuPMxMKSI25OBwUg5p3WbbQtsYEUjhHKTv
 fNoA==
X-Gm-Message-State: AFqh2kplmUILErYNoxrbbkpcM2Fqja23Jo1QIElIPbNn7SkklJBMhUfR
 /L8VlGL2LJbe8xvPQSVUZfpTo8KoKCHmEIR1
X-Google-Smtp-Source: AMrXdXszJUxDP1wvSIAZqHZss3fp4R0t5ge53ZFvIx36+ZN0M9w74s6dZxE6P4sZnQsvWCBSr7m+ZQ==
X-Received: by 2002:a17:903:1355:b0:194:4339:112e with SMTP id
 jl21-20020a170903135500b001944339112emr36261658plb.60.1674878238405; 
 Fri, 27 Jan 2023 19:57:18 -0800 (PST)
Received: from always-pc.bytedance.net ([61.213.176.6])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a170902ed4400b00186c3afb49esm3594662plb.209.2023.01.27.19.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 19:57:17 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com
Cc: dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v3 10/12] cryptodev: support QoS
Date: Sat, 28 Jan 2023 11:56:31 +0800
Message-Id: <20230128035633.2548315-11-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230128035633.2548315-1-pizhenwei@bytedance.com>
References: <20230128035633.2548315-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x631.google.com
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



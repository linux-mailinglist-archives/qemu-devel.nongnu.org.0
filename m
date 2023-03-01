Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE4C6A65C8
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:53:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCZj-00082s-TZ; Tue, 28 Feb 2023 21:52:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXCZc-0007zu-6d
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:52:09 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXCZa-0001d3-35
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:52:07 -0500
Received: by mail-pl1-x634.google.com with SMTP id p6so11712080plf.0
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677639125;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=INrx0BfaOa4IFJ+qXVprp2CmsCQfySfcHiPFFgrxkcs=;
 b=kJgz+KxRsEkDyWWeKqaQFGR7ZEWdrWDpF6W4sQClAG75FaUfAwsdFnK72gDkXeKkTo
 cb1wuCjZqUbII6C3+fVqOEN+l3mdt/foVefoDs+kmIAPv9qzdcgi7xj3dWBi6D4O7tkd
 7aWssaeugcJzE8F/9UenK9zF0QLA+go9S2AQhlT0Uf4DlGHUDBKnALwwCk4bx+Z8C7Xs
 kjdoE9Wqa6E+sGQF8g/j5ZUQUZkRmrKEJpIPj5TP1LwOd3LlEmGHe+6oambEtkA/v3AS
 COtAfEJAfZsZshJO1FRjTCUsa96II42X48KfO/B060XUn2Ss2LGX8bn4pKqtyKhH/1bG
 3ouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677639125;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=INrx0BfaOa4IFJ+qXVprp2CmsCQfySfcHiPFFgrxkcs=;
 b=cyVtLBCDYv3sketv6Rllx4JfnKkA77MxEZXBuQamZl7l6o3PYaTjHNyIzJeCw539oa
 3HxZwCJQsb+PLU0FRZ/ur366TCv7M13r19N8TyQjKJTij9RZEX3kW47QLV9bLycgCuTg
 b6YtfwEvGSIFmnJFtOoyOSN5EGa9YcFvXaQJXXh9pYUKluiK9oKeWe0b+eU/kZa7Q7QM
 R5RMp5VBSWmhtBOukEXeKXliDTio82mhG/pYOpNjdSnl0KCANAHRALml35AB0q1i0Omj
 ygVJVjqDMlEyPIY/mylXWDBD3NYHPqJLwxK9iaUXL0UhptlHWv5w7lj6bbUAxxYbWuPD
 3jAA==
X-Gm-Message-State: AO0yUKXqke8Cp7vS/FHq+qJAhybnt+RpoCEFU7JYgAMqMLWVoTaN/mmw
 Mm3Gnk/WA53KErLY152I3GiGQQ==
X-Google-Smtp-Source: AK7set+8iiCCRDGWOFiRgA2L4wKrsa2gtpAzy2tokjGnvrvxTI6xsS86d6euU4cquNFNY5gbQMlJqg==
X-Received: by 2002:a17:902:e80a:b0:19b:afb:b92e with SMTP id
 u10-20020a170902e80a00b0019b0afbb92emr5767880plg.40.1677639125368; 
 Tue, 28 Feb 2023 18:52:05 -0800 (PST)
Received: from libai.bytedance.net ([61.213.176.5])
 by smtp.gmail.com with ESMTPSA id
 ix1-20020a170902f80100b0019ab58f47a6sm7218743plb.105.2023.02.28.18.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:52:04 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com
Cc: dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org, berrange@redhat.com,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v5 10/12] cryptodev: support QoS
Date: Wed,  1 Mar 2023 10:51:22 +0800
Message-Id: <20230301025124.3605557-11-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025124.3605557-1-pizhenwei@bytedance.com>
References: <20230301025124.3605557-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
index cc824e9665..09ffdd345f 100644
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
+                             QEMU_CLOCK_REALTIME,
+                             cryptodev_backend_throttle_timer_cb, /* FIXME */
+                             cryptodev_backend_throttle_timer_cb, backend);
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



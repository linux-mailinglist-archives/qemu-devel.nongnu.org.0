Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAB567FC82
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 03:59:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLxu7-0004ig-4n; Sat, 28 Jan 2023 21:58:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLxu3-0004VL-Nj
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 21:58:47 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLxtx-0008IP-1U
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 21:58:47 -0500
Received: by mail-pj1-x1029.google.com with SMTP id j5so8237528pjn.5
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 18:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+24bzIGttHzFFhmGvBHhsTPYBFiGmTest0gVIDUW5Dk=;
 b=6g7pm3rHfCKAGwIaX6dooCBhn7HpU8/ifHbE/d2CXJx/nvIsgc9cic4bMj7lm3Var0
 aagfi7SsJxb1/HSxZbqdYmiKrPGNW7mfZWuIrR/kFBuk7QxGQgHut+e3itjUpJa1YYBw
 zqfbqRVdEzMuAjBq0Z/orghrFubvCoBBbdu9Ctsn+dSPw0fBMR4brX5iecipmpsGEHfU
 n5654e/hSbQ8KPXg86kV8hepUkoCDTw0d6Pyiw4CUBK/9EBLs+obisQMh12p1C1ZpmVX
 vLHAif63jDQoq284Y7opBccX18W5Dhi7ktM0D3YwdVMB9kxrax4oC6IvC9XhohYUKuqk
 RHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+24bzIGttHzFFhmGvBHhsTPYBFiGmTest0gVIDUW5Dk=;
 b=zcYK0lWw9dIwjDhneY8fHXRcMhT05jrwVxcyi4PX3Ie+x9zSzi97HNeZqwsN2YKpeB
 sT9k02ZJo/n+u1jncPVDbwqtodl7RnrUw2Ja0nABD3dL0ZMM5lMgXY5fDKbHLwXEtoFB
 m155zPOiFR/n8QyI2hJcpnFyThm84jSiq+ScvNT4asMGL2TNxZVCiVVaDIB52YmwOo+G
 yeCm5mOGpdu6Y47jdTgE2q0k3Y5YbfHxuksbRp6JgH/yYGxijggbkRxDj6xrTpWBUUdg
 EKGOMEHokgDhTCUpb06AH+n7lp/Xd8IE8yemgrDiuVBTj27W+SQjRnCfDGSnIQMI6DPN
 mLfw==
X-Gm-Message-State: AFqh2krtkLwmXszdOp9Nb//ZSrkoCw7na/uGgK36eGLX3OacOqCpsSgN
 P4AL9QlraqHQz9YheqxzvEQweQ==
X-Google-Smtp-Source: AMrXdXskEq02leYuiiiF0TKwp4fvEFESYwSSYrpbsD7zGr87Ik/tp8R96zRCBInXY7rGP9mbsmN2fA==
X-Received: by 2002:a17:902:f542:b0:195:f412:5e6f with SMTP id
 h2-20020a170902f54200b00195f4125e6fmr36663326plf.48.1674961114377; 
 Sat, 28 Jan 2023 18:58:34 -0800 (PST)
Received: from always-pc.bytedance.net ([61.213.176.6])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a170902ea8400b00194c90ca320sm5167084plb.204.2023.01.28.18.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 18:58:33 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com, mst@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com
Cc: armbru@redhat.com, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v4 11/12] cryptodev: Support query-stats QMP command
Date: Sun, 29 Jan 2023 10:57:46 +0800
Message-Id: <20230129025747.682282-12-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230129025747.682282-1-pizhenwei@bytedance.com>
References: <20230129025747.682282-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1029.google.com
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

Now we can use "query-stats" QMP command to query statistics of
crypto devices. (Originally this was designed to show statistics
by '{"execute": "query-cryptodev"}'. Daniel Berrangé suggested that
querying configuration info by "query-cryptodev", and querying
runtime performance info by "query-stats". This makes sense!)

Example:
~# virsh qemu-monitor-command vm '{"execute": "query-stats", \
   "arguments": {"target": "cryptodev"} }' | jq
{
  "return": [
    {
      "provider": "cryptodev",
      "stats": [
        {
          "name": "asym-verify-bytes",
          "value": 7680
        },
        ...
        {
          "name": "asym-decrypt-ops",
          "value": 32
        },
        {
          "name": "asym-encrypt-ops",
          "value": 48
        }
      ],
      "qom-path": "/objects/cryptodev0" # support asym only
    },
    {
      "provider": "cryptodev",
      "stats": [
        {
          "name": "asym-verify-bytes",
          "value": 0
        },
        ...
        {
          "name": "sym-decrypt-bytes",
          "value": 5376
        },
        ...
      ],
      "qom-path": "/objects/cryptodev1" # support asym/sym
    }
  ],
  "id": "libvirt-422"
}

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 backends/cryptodev.c | 141 +++++++++++++++++++++++++++++++++++++++++++
 monitor/hmp-cmds.c   |   5 ++
 monitor/qmp-cmds.c   |   2 +
 qapi/stats.json      |  10 ++-
 4 files changed, 156 insertions(+), 2 deletions(-)

diff --git a/backends/cryptodev.c b/backends/cryptodev.c
index 09ffdd345f..9d52220772 100644
--- a/backends/cryptodev.c
+++ b/backends/cryptodev.c
@@ -22,9 +22,11 @@
  */
 
 #include "qemu/osdep.h"
+#include "monitor/stats.h"
 #include "sysemu/cryptodev.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-cryptodev.h"
+#include "qapi/qapi-types-stats.h"
 #include "qapi/visitor.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
@@ -32,6 +34,14 @@
 #include "qom/object_interfaces.h"
 #include "hw/virtio/virtio-crypto.h"
 
+typedef struct StatsArgs {
+    union StatsResultsType {
+        StatsResultList **stats;
+        StatsSchemaList **schema;
+    } result;
+    strList *names;
+    Error **errp;
+} StatsArgs;
 
 static QTAILQ_HEAD(, CryptoDevBackendClient) crypto_clients;
 
@@ -435,6 +445,134 @@ static void cryptodev_backend_finalize(Object *obj)
     }
 }
 
+static StatsList *cryptodev_backend_stats_add(const char *name, int64_t *val,
+                                              StatsList *stats_list)
+{
+    Stats *stats = g_new0(Stats, 1);
+
+    stats->name = g_strdup(name);
+    stats->value = g_new0(StatsValue, 1);
+    stats->value->type = QTYPE_QNUM;
+    stats->value->u.scalar = *val;
+
+    QAPI_LIST_PREPEND(stats_list, stats);
+    return stats_list;
+}
+
+static int cryptodev_backend_stats_query(Object *obj, void *data)
+{
+    StatsArgs *stats_args = data;
+    StatsResultList **stats_results = stats_args->result.stats;
+    StatsList *stats_list = NULL;
+    StatsResult *entry;
+    CryptoDevBackend *backend;
+    QCryptodevBackendSymStat *sym_stat;
+    QCryptodevBackendAsymStat *asym_stat;
+
+    if (!object_dynamic_cast(obj, TYPE_CRYPTODEV_BACKEND)) {
+        return 0;
+    }
+
+    backend = CRYPTODEV_BACKEND(obj);
+    sym_stat = backend->sym_stat;
+    if (sym_stat) {
+        stats_list = cryptodev_backend_stats_add("sym-encrypt-ops",
+                         &sym_stat->encrypt_ops, stats_list);
+        stats_list = cryptodev_backend_stats_add("sym-decrypt-ops",
+                         &sym_stat->decrypt_ops, stats_list);
+        stats_list = cryptodev_backend_stats_add("sym-encrypt-bytes",
+                         &sym_stat->encrypt_bytes, stats_list);
+        stats_list = cryptodev_backend_stats_add("sym-decrypt-bytes",
+                         &sym_stat->decrypt_bytes, stats_list);
+    }
+
+    asym_stat = backend->asym_stat;
+    if (asym_stat) {
+        stats_list = cryptodev_backend_stats_add("asym-encrypt-ops",
+                         &asym_stat->encrypt_ops, stats_list);
+        stats_list = cryptodev_backend_stats_add("asym-decrypt-ops",
+                         &asym_stat->decrypt_ops, stats_list);
+        stats_list = cryptodev_backend_stats_add("asym-sign-ops",
+                         &asym_stat->sign_ops, stats_list);
+        stats_list = cryptodev_backend_stats_add("asym-verify-ops",
+                         &asym_stat->verify_ops, stats_list);
+        stats_list = cryptodev_backend_stats_add("asym-encrypt-bytes",
+                         &asym_stat->encrypt_bytes, stats_list);
+        stats_list = cryptodev_backend_stats_add("asym-decrypt-bytes",
+                         &asym_stat->decrypt_bytes, stats_list);
+        stats_list = cryptodev_backend_stats_add("asym-sign-bytes",
+                         &asym_stat->sign_bytes, stats_list);
+        stats_list = cryptodev_backend_stats_add("asym-verify-bytes",
+                         &asym_stat->verify_bytes, stats_list);
+    }
+
+    entry = g_new0(StatsResult, 1);
+    entry->provider = STATS_PROVIDER_CRYPTODEV;
+    entry->qom_path = g_strdup(object_get_canonical_path(obj));
+    entry->stats = stats_list;
+    QAPI_LIST_PREPEND(*stats_results, entry);
+
+    return 0;
+}
+
+static void cryptodev_backend_stats_cb(StatsResultList **result,
+                                       StatsTarget target,
+                                       strList *names, strList *targets,
+                                       Error **errp)
+{
+    switch (target) {
+    case STATS_TARGET_CRYPTODEV:
+    {
+        Object *objs = container_get(object_get_root(), "/objects");
+        StatsArgs stats_args;
+        stats_args.result.stats = result;
+        stats_args.names = names;
+        stats_args.errp = errp;
+
+        object_child_foreach(objs, cryptodev_backend_stats_query, &stats_args);
+        break;
+    }
+    default:
+        break;
+    }
+}
+
+static StatsSchemaValueList *cryptodev_backend_schemas_add(const char *name,
+                                 StatsSchemaValueList *list)
+{
+    StatsSchemaValueList *schema_entry = g_new0(StatsSchemaValueList, 1);
+
+    schema_entry->value = g_new0(StatsSchemaValue, 1);
+    schema_entry->value->type = STATS_TYPE_CUMULATIVE;
+    schema_entry->value->name = g_strdup(name);
+    schema_entry->next = list;
+
+    return schema_entry;
+}
+
+static void cryptodev_backend_schemas_cb(StatsSchemaList **result,
+                                         Error **errp)
+{
+    StatsSchemaValueList *stats_list = NULL;
+    const char *sym_stats[] = {"sym-encrypt-ops", "sym-decrypt-ops",
+                               "sym-encrypt-bytes", "sym-decrypt-bytes"};
+    const char *asym_stats[] = {"asym-encrypt-ops", "asym-decrypt-ops",
+                                "asym-sign-ops", "asym-verify-ops",
+                                "asym-encrypt-bytes", "asym-decrypt-bytes",
+                                "asym-sign-bytes", "asym-verify-bytes"};
+
+    for (int i = 0; i < ARRAY_SIZE(sym_stats); i++) {
+        stats_list = cryptodev_backend_schemas_add(sym_stats[i], stats_list);
+    }
+
+    for (int i = 0; i < ARRAY_SIZE(asym_stats); i++) {
+        stats_list = cryptodev_backend_schemas_add(asym_stats[i], stats_list);
+    }
+
+    add_stats_schema(result, STATS_PROVIDER_CRYPTODEV, STATS_TARGET_CRYPTODEV,
+                     stats_list);
+}
+
 static void
 cryptodev_backend_class_init(ObjectClass *oc, void *data)
 {
@@ -456,6 +594,9 @@ cryptodev_backend_class_init(ObjectClass *oc, void *data)
                               cryptodev_backend_get_ops,
                               cryptodev_backend_set_ops,
                               NULL, NULL);
+
+    add_stats_callbacks(STATS_PROVIDER_CRYPTODEV, cryptodev_backend_stats_cb,
+                        cryptodev_backend_schemas_cb);
 }
 
 static const TypeInfo cryptodev_backend_info = {
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index cda52c2526..dda69a1098 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1883,6 +1883,8 @@ static StatsFilter *stats_filter(StatsTarget target, const char *names,
         filter->u.vcpu.vcpus = vcpu_list;
         break;
     }
+    case STATS_TARGET_CRYPTODEV:
+        break;
     default:
         break;
     }
@@ -1954,6 +1956,9 @@ void hmp_info_stats(Monitor *mon, const QDict *qdict)
         int cpu_index = monitor_get_cpu_index(mon);
         filter = stats_filter(target, names, cpu_index, provider);
         break;
+    case STATS_TARGET_CRYPTODEV:
+        filter = stats_filter(target, names, -1, provider);
+        break;
     default:
         abort();
     }
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index bf22a8c5a6..dd31936f6a 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -385,6 +385,8 @@ static bool invoke_stats_cb(StatsCallbacks *entry,
             targets = filter->u.vcpu.vcpus;
         }
         break;
+    case STATS_TARGET_CRYPTODEV:
+        break;
     default:
         abort();
     }
diff --git a/qapi/stats.json b/qapi/stats.json
index 57db5b1c74..f9dec18066 100644
--- a/qapi/stats.json
+++ b/qapi/stats.json
@@ -50,10 +50,14 @@
 #
 # Enumeration of statistics providers.
 #
+# @kvm: since 7.1
+#
+# @cryptodev: since 8.0
+#
 # Since: 7.1
 ##
 { 'enum': 'StatsProvider',
-  'data': [ 'kvm' ] }
+  'data': [ 'kvm', 'cryptodev' ] }
 
 ##
 # @StatsTarget:
@@ -65,10 +69,12 @@
 #
 # @vcpu: statistics that apply to a single virtual CPU.
 #
+# @cryptodev: statistics that apply to a crypto device.
+#
 # Since: 7.1
 ##
 { 'enum': 'StatsTarget',
-  'data': [ 'vm', 'vcpu' ] }
+  'data': [ 'vm', 'vcpu', 'cryptodev' ] }
 
 ##
 # @StatsRequest:
-- 
2.34.1



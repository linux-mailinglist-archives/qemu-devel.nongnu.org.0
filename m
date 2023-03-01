Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE93B6A65CE
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:53:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCZj-00082a-LX; Tue, 28 Feb 2023 21:52:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXCZg-00080G-1E
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:52:12 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXCZe-0001nK-0o
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:52:11 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so11254265pjg.4
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677639129;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GbgEvrqH7D2h3weUsC/mv9R1HaMrDMQO1h7Eqp1HmGU=;
 b=dsR+cdWWemrSMw/8dVA8IiTPoj8oSpfXIOzwqmwNTTZbULj/XejjiDhzkccfbpEa7E
 /w6GezgEPVv+RTKnpyu1RyC6+7oL1YH+G6JtBmlPhsd0QJ4JnfDmGpcNXQH5VUrEk5BD
 EVT9zdpY4/uZkrMowLg7mNY+2BvPErSPHYYTnXaK3g92gEXOnM7EXV79BdvrTrnnMJth
 T+MfN5QNJEiVsw5nnjlzoNdLSa1t6dQIp4JxM+twoIDg+WGzz9IDUJXaHI1z8sRQLFIm
 bSMpCuxdnRbm9iOjcNeZfzG5NIBpDhkawbZjvbgZmzl39Oz47Qvt05EfsdXumcPJUIDq
 atrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677639129;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GbgEvrqH7D2h3weUsC/mv9R1HaMrDMQO1h7Eqp1HmGU=;
 b=hfYrWa0gafcQBoUC5y9DAKJ7iPWxxk80/SHhu0Upxp9tsx5mCxmHKCu9yNPbYgZI0V
 EehKAWxWffpeChaBinNT0PhuU08oj1VMM56yzT9kiZuQbHD5INGI9rB1qYFJevCTBM+w
 WcwK4FehJ4J65zvrKCiKuiLiw8FzgPLzRYjgDSU92Y3wA/stW9NKfS8+eg121GWJV81N
 HLsKSKTaJES8j9BB4FTInK/rpBaSdGJ3Zh2RSL4kiOBdILePcq5ZpQzanmfY4AcEVn4+
 wu3tOluz2dz74cyYaTnWT1HLD/SxrAZqIHjmZWbydMnrj2C0ZUyHWNscig53AMEv53ep
 cyPQ==
X-Gm-Message-State: AO0yUKWHOvUr6pzGlzzGq/H1EarMZmfVWaFMbRoAHQejJTWL8BdXm2kf
 cMqSTPm+UqmLDo3ggZrviDIuEQ==
X-Google-Smtp-Source: AK7set8X79cb5t15NeE/MWXM/3sP3VNmiSTzlSezc8nq937eQuQIetPunFU6/J2jHc2lEMcq8OMm/A==
X-Received: by 2002:a17:902:d488:b0:19e:2e6b:1448 with SMTP id
 c8-20020a170902d48800b0019e2e6b1448mr6294530plg.2.1677639128725; 
 Tue, 28 Feb 2023 18:52:08 -0800 (PST)
Received: from libai.bytedance.net ([61.213.176.5])
 by smtp.gmail.com with ESMTPSA id
 ix1-20020a170902f80100b0019ab58f47a6sm7218743plb.105.2023.02.28.18.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:52:08 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com
Cc: dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org, berrange@redhat.com,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v5 11/12] cryptodev: Support query-stats QMP command
Date: Wed,  1 Mar 2023 10:51:23 +0800
Message-Id: <20230301025124.3605557-12-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025124.3605557-1-pizhenwei@bytedance.com>
References: <20230301025124.3605557-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x102f.google.com
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
 backends/cryptodev.c   | 155 +++++++++++++++++++++++++++++++++++++++++
 qapi/stats.json        |  10 ++-
 stats/stats-hmp-cmds.c |   5 ++
 stats/stats-qmp-cmds.c |   2 +
 4 files changed, 170 insertions(+), 2 deletions(-)

diff --git a/backends/cryptodev.c b/backends/cryptodev.c
index 09ffdd345f..d8a54c0236 100644
--- a/backends/cryptodev.c
+++ b/backends/cryptodev.c
@@ -23,8 +23,10 @@
 
 #include "qemu/osdep.h"
 #include "sysemu/cryptodev.h"
+#include "sysemu/stats.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-cryptodev.h"
+#include "qapi/qapi-types-stats.h"
 #include "qapi/visitor.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
@@ -32,6 +34,28 @@
 #include "qom/object_interfaces.h"
 #include "hw/virtio/virtio-crypto.h"
 
+#define SYM_ENCRYPT_OPS_STR "sym-encrypt-ops"
+#define SYM_DECRYPT_OPS_STR "sym-decrypt-ops"
+#define SYM_ENCRYPT_BYTES_STR "sym-encrypt-bytes"
+#define SYM_DECRYPT_BYTES_STR "sym-decrypt-bytes"
+
+#define ASYM_ENCRYPT_OPS_STR "asym-encrypt-ops"
+#define ASYM_DECRYPT_OPS_STR "asym-decrypt-ops"
+#define ASYM_SIGN_OPS_STR "asym-sign-ops"
+#define ASYM_VERIFY_OPS_STR "asym-verify-ops"
+#define ASYM_ENCRYPT_BYTES_STR "asym-encrypt-bytes"
+#define ASYM_DECRYPT_BYTES_STR "asym-decrypt-bytes"
+#define ASYM_SIGN_BYTES_STR "asym-sign-bytes"
+#define ASYM_VERIFY_BYTES_STR "asym-verify-bytes"
+
+typedef struct StatsArgs {
+    union StatsResultsType {
+        StatsResultList **stats;
+        StatsSchemaList **schema;
+    } result;
+    strList *names;
+    Error **errp;
+} StatsArgs;
 
 static QTAILQ_HEAD(, CryptoDevBackendClient) crypto_clients;
 
@@ -435,6 +459,134 @@ static void cryptodev_backend_finalize(Object *obj)
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
+        stats_list = cryptodev_backend_stats_add(SYM_ENCRYPT_OPS_STR,
+                         &sym_stat->encrypt_ops, stats_list);
+        stats_list = cryptodev_backend_stats_add(SYM_DECRYPT_OPS_STR,
+                         &sym_stat->decrypt_ops, stats_list);
+        stats_list = cryptodev_backend_stats_add(SYM_ENCRYPT_BYTES_STR,
+                         &sym_stat->encrypt_bytes, stats_list);
+        stats_list = cryptodev_backend_stats_add(SYM_DECRYPT_BYTES_STR,
+                         &sym_stat->decrypt_bytes, stats_list);
+    }
+
+    asym_stat = backend->asym_stat;
+    if (asym_stat) {
+        stats_list = cryptodev_backend_stats_add(ASYM_ENCRYPT_OPS_STR,
+                         &asym_stat->encrypt_ops, stats_list);
+        stats_list = cryptodev_backend_stats_add(ASYM_DECRYPT_OPS_STR,
+                         &asym_stat->decrypt_ops, stats_list);
+        stats_list = cryptodev_backend_stats_add(ASYM_SIGN_OPS_STR,
+                         &asym_stat->sign_ops, stats_list);
+        stats_list = cryptodev_backend_stats_add(ASYM_VERIFY_OPS_STR,
+                         &asym_stat->verify_ops, stats_list);
+        stats_list = cryptodev_backend_stats_add(ASYM_ENCRYPT_BYTES_STR,
+                         &asym_stat->encrypt_bytes, stats_list);
+        stats_list = cryptodev_backend_stats_add(ASYM_DECRYPT_BYTES_STR,
+                         &asym_stat->decrypt_bytes, stats_list);
+        stats_list = cryptodev_backend_stats_add(ASYM_SIGN_BYTES_STR,
+                         &asym_stat->sign_bytes, stats_list);
+        stats_list = cryptodev_backend_stats_add(ASYM_VERIFY_BYTES_STR,
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
+    const char *sym_stats[] = { SYM_ENCRYPT_OPS_STR, SYM_DECRYPT_OPS_STR,
+                                SYM_ENCRYPT_BYTES_STR, SYM_DECRYPT_BYTES_STR };
+    const char *asym_stats[] = { ASYM_ENCRYPT_OPS_STR, ASYM_DECRYPT_OPS_STR,
+                                 ASYM_SIGN_OPS_STR, ASYM_VERIFY_OPS_STR,
+                                 ASYM_ENCRYPT_BYTES_STR, ASYM_DECRYPT_BYTES_STR,
+                                 ASYM_SIGN_BYTES_STR, ASYM_VERIFY_BYTES_STR };
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
@@ -456,6 +608,9 @@ cryptodev_backend_class_init(ObjectClass *oc, void *data)
                               cryptodev_backend_get_ops,
                               cryptodev_backend_set_ops,
                               NULL, NULL);
+
+    add_stats_callbacks(STATS_PROVIDER_CRYPTODEV, cryptodev_backend_stats_cb,
+                        cryptodev_backend_schemas_cb);
 }
 
 static const TypeInfo cryptodev_backend_info = {
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
+# @cryptodev: statistics that apply to a crypto device. since 8.0
+#
 # Since: 7.1
 ##
 { 'enum': 'StatsTarget',
-  'data': [ 'vm', 'vcpu' ] }
+  'data': [ 'vm', 'vcpu', 'cryptodev' ] }
 
 ##
 # @StatsRequest:
diff --git a/stats/stats-hmp-cmds.c b/stats/stats-hmp-cmds.c
index 531e35d128..1f91bf8bd5 100644
--- a/stats/stats-hmp-cmds.c
+++ b/stats/stats-hmp-cmds.c
@@ -155,6 +155,8 @@ static StatsFilter *stats_filter(StatsTarget target, const char *names,
         filter->u.vcpu.vcpus = vcpu_list;
         break;
     }
+    case STATS_TARGET_CRYPTODEV:
+        break;
     default:
         break;
     }
@@ -226,6 +228,9 @@ void hmp_info_stats(Monitor *mon, const QDict *qdict)
         int cpu_index = monitor_get_cpu_index(mon);
         filter = stats_filter(target, names, cpu_index, provider);
         break;
+    case STATS_TARGET_CRYPTODEV:
+        filter = stats_filter(target, names, -1, provider);
+        break;
     default:
         abort();
     }
diff --git a/stats/stats-qmp-cmds.c b/stats/stats-qmp-cmds.c
index bc973747fb..e214b964fd 100644
--- a/stats/stats-qmp-cmds.c
+++ b/stats/stats-qmp-cmds.c
@@ -64,6 +64,8 @@ static bool invoke_stats_cb(StatsCallbacks *entry,
             targets = filter->u.vcpu.vcpus;
         }
         break;
+    case STATS_TARGET_CRYPTODEV:
+        break;
     default:
         abort();
     }
-- 
2.34.1



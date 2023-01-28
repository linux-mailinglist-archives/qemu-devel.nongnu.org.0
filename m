Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DDA67F481
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 04:58:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLcKx-0000P5-AU; Fri, 27 Jan 2023 22:57:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLcKv-0000Ox-L2
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 22:57:05 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLcKt-0003nt-Ka
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 22:57:05 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 z1-20020a17090a66c100b00226f05b9595so6522882pjl.0
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 19:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4fD2Ipwpfn+luLoaXelYou1gl0+GAbRSNntBtJbi9rQ=;
 b=ujPhda06GNaTNJ5rjBT11eZljCHmqsN7s3mxx4Dqf0gjA+nYgohCgNjwc6T1J3oBeB
 idpSsIoqSbuR6jDsDhosMrqYaKKR4/qbLqaJoE1dCxJvSM6ZAh4ygmyToT7odrwqHQJP
 sFDN0aXhc9SCDZ8M/if2F8Hg9vb1qdbRlWzNNGPQS20vDYP3JOrgBujhnUWDgytSAZ7H
 dn6bFCzHqcrF+xBTa1RZAk4ND0EcpnyMSl6tz+JuzxqvkHLLYK64g/5+AiM38Zm/9Vl9
 GY1GLotxLD3C+metwXo2OQC66C5kAzDgrkeAEIyUXkELTmF/WQA+M9IeZNYnYxRj0pEM
 IEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4fD2Ipwpfn+luLoaXelYou1gl0+GAbRSNntBtJbi9rQ=;
 b=o88SfbKt+5RSPj15mDnJ5X8KZ3e9drl9tOJhkinlJRAv4usdEXONZCOvdo0zpjTLe6
 Rj/DVlfEq4q7oct0YDSoR0u7wTst62AhhbRVEJw6dNmBEvkLFmcT8ZsmU0W0ug46xRz/
 9iEEjyK3SL5GcfcpFLUff2N2XpcNzg8HLXAD5QEQj6oTnkEDVHWL+dn3AegfbKtmSSPt
 roy+eu7WCaYWt7m9xvBv/fuYTs+ErncHB3EM4L1IdSRfxt+rjuJf+y7HI7v5V+DUoRuH
 0ytyA6D7s9zKZlNiNuxwuswat/MzvXrk3Z44TdnbSbYYqUIP2gsV+4YO0gLlBMQ/2baf
 NpvA==
X-Gm-Message-State: AO0yUKVd3uYGokYKZX3uP1xvb2Y1Apkfz6thc5thkSb5L+Vtei2Iuv4z
 qGerKgHK/s4nwuO2QGr/1qQnnw==
X-Google-Smtp-Source: AK7set/fHV7IPdAY4wHBLQAKXE97NKN4sNWQ7/ptYvHyQjEkFQ9hbR3Y9bF510xjymU020oGOVwrBw==
X-Received: by 2002:a17:902:cecd:b0:196:1512:8e85 with SMTP id
 d13-20020a170902cecd00b0019615128e85mr19661850plg.60.1674878221944; 
 Fri, 27 Jan 2023 19:57:01 -0800 (PST)
Received: from always-pc.bytedance.net ([61.213.176.6])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a170902ed4400b00186c3afb49esm3594662plb.209.2023.01.27.19.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 19:57:01 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com
Cc: dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v3 05/12] cryptodev: Introduce 'query-cryptodev' QMP command
Date: Sat, 28 Jan 2023 11:56:26 +0800
Message-Id: <20230128035633.2548315-6-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230128035633.2548315-1-pizhenwei@bytedance.com>
References: <20230128035633.2548315-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x102d.google.com
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

Now we have a QMP command to query crypto devices:
virsh qemu-monitor-command vm '{"execute": "query-cryptodev"}' | jq
{
  "return": [
    {
      "service": [
        "akcipher",
        "mac",
        "hash",
        "cipher"
      ],
      "id": "cryptodev1",
      "client": [
        {
          "queue": 0,
          "type": "builtin"
        }
      ]
    },
    {
      "service": [
        "akcipher"
      ],
      "id": "cryptodev0",
      "client": [
        {
          "queue": 0,
          "type": "lkcf"
        }
      ]
    }
  ],
  "id": "libvirt-417"
}

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 backends/cryptodev.c | 45 ++++++++++++++++++++++++++++++++++++++++++++
 qapi/cryptodev.json  | 44 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/backends/cryptodev.c b/backends/cryptodev.c
index c2a053db0e..d51eeb5ee4 100644
--- a/backends/cryptodev.c
+++ b/backends/cryptodev.c
@@ -24,6 +24,7 @@
 #include "qemu/osdep.h"
 #include "sysemu/cryptodev.h"
 #include "qapi/error.h"
+#include "qapi/qapi-commands-cryptodev.h"
 #include "qapi/visitor.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
@@ -33,6 +34,50 @@
 
 static QTAILQ_HEAD(, CryptoDevBackendClient) crypto_clients;
 
+static int qmp_query_cryptodev_foreach(Object *obj, void *data)
+{
+    CryptoDevBackend *backend;
+    CryptodevInfoList **infolist = data;
+    uint32_t services, i;
+
+    if (!object_dynamic_cast(obj, TYPE_CRYPTODEV_BACKEND)) {
+        return 0;
+    }
+
+    CryptodevInfo *info = g_new0(CryptodevInfo, 1);
+    info->id = g_strdup(object_get_canonical_path_component(obj));
+
+    backend = CRYPTODEV_BACKEND(obj);
+    services = backend->conf.crypto_services;
+    for (i = 0; i < QCRYPTODEV_BACKEND_SERVICE__MAX; i++) {
+        if (services & (1 << i)) {
+            QAPI_LIST_PREPEND(info->service, i);
+        }
+    }
+
+    for (i = 0; i < backend->conf.peers.queues; i++) {
+        CryptoDevBackendClient *cc = backend->conf.peers.ccs[i];
+        CryptodevBackendClient *client = g_new0(CryptodevBackendClient, 1);
+
+        client->queue = cc->queue_index;
+        client->type = cc->type;
+        QAPI_LIST_PREPEND(info->client, client);
+    }
+
+    QAPI_LIST_PREPEND(*infolist, info);
+
+    return 0;
+}
+
+CryptodevInfoList *qmp_query_cryptodev(Error **errp)
+{
+    CryptodevInfoList *list = NULL;
+    Object *objs = container_get(object_get_root(), "/objects");
+
+    object_child_foreach(objs, qmp_query_cryptodev_foreach, &list);
+
+    return list;
+}
 
 CryptoDevBackendClient *cryptodev_backend_new_client(void)
 {
diff --git a/qapi/cryptodev.json b/qapi/cryptodev.json
index 8732a30524..940078ace0 100644
--- a/qapi/cryptodev.json
+++ b/qapi/cryptodev.json
@@ -43,3 +43,47 @@
 { 'enum': 'QCryptodevBackendType',
   'prefix': 'QCRYPTODEV_BACKEND_TYPE',
   'data': ['builtin', 'vhost-user', 'lkcf']}
+
+##
+# @CryptodevBackendClient:
+#
+# Information about a queue of crypto device.
+#
+# @queue: the queue index of the crypto device
+#
+# @type: the type of the crypto device
+#
+# Since: 8.0
+##
+{ 'struct': 'CryptodevBackendClient',
+  'data': { 'queue': 'uint32',
+            'type': 'QCryptodevBackendType' } }
+
+##
+# @CryptodevInfo:
+#
+# Information about a crypto device.
+#
+# @id: the id of the crypto device
+#
+# @service: supported service types of a crypto device
+#
+# @client: the additional infomation of the crypto device
+#
+# Since: 8.0
+##
+{ 'struct': 'CryptodevInfo',
+  'data': { 'id': 'str',
+            'service': ['QCryptodevBackendServiceType'],
+            'client': ['CryptodevBackendClient'] } }
+
+##
+# @query-cryptodev:
+#
+# Returns information about current crypto devices.
+#
+# Returns: a list of @CryptodevInfo
+#
+# Since: 8.0
+##
+{ 'command': 'query-cryptodev', 'returns': ['CryptodevInfo']}
-- 
2.34.1



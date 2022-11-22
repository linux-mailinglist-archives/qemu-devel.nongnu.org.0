Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A81633E73
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 15:06:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxTtR-0008Tj-SS; Tue, 22 Nov 2022 09:04:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oxTtN-0008TD-Lm
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:04:53 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oxTtL-00063S-Q7
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:04:53 -0500
Received: by mail-pl1-x630.google.com with SMTP id p12so13729944plq.4
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 06:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TlcaU38pdb3CtWEh3sr5SMbpseSZUCKSQHY6AQe8NOY=;
 b=SRbORjOaNpJev9fOFUEoDOrg0qem5ACUxsgC3QN6oLXkFrcapiqoL+3oZSJjDrT/YJ
 hOws4M9hhrz4ERh/w9YncU4HGu2+rQcycogQJeYFUYyn7x5dRLGazAqCaGMpic++cZ8/
 1T4jc16Vs90Eo/bq/T3eZHZ1T4dmOsGvP6cWO7fMCWrpTo90qs4h68NNMmwt6d+EoeDH
 DEc0pVsUjSkaEqEDdsuajjySKxTMoOyE9bKhkDa3y3DO3WjAbfxl+VSOiPVFmDTxeZ3r
 Vh4wHGwadiRYosIdyzUNa1c2R5mtqPdPbVjsAdFKa/hx3ZDPf/y09GFTOsvwXCUB/plf
 E4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TlcaU38pdb3CtWEh3sr5SMbpseSZUCKSQHY6AQe8NOY=;
 b=ybhj1O6zhCF6IvUkfckzNW00DtxcujkdLuepQp7nVgw6aXzoMcad3Vnffwfo+fOpZy
 Vmt/4A4KqkIxgeTk6eW2U1NwRvOnZz5mhpr7zk+6ROPFV9DyxqLWJokdKGuMNHMGJTJh
 M3gnTPjasB+lwSDWI5BoWAuCsJlho5SloOX3zLBvBG0JQzfI/bJ5uKnsWEK2mz9Werid
 2FawzHe/3OCKjHWwqK4sxN61ARJvSDDRffuybZtsMXKPDjvJeJ1TsufMqCTtDb/psUEt
 YlGX1jYv/Qdcbb4c58mas0VWle9TmlEOsBZxuh6/oxJ1XFyqSPTVZpLe9M+hOemFjHIl
 NPvw==
X-Gm-Message-State: ANoB5pn1ZN9t4GV4HumfC+WuG4nzh6F3bYDdJnJ3+ompO0LzJhghOONr
 P9oenqmtIIu7JSjFo3OGhSCvNw==
X-Google-Smtp-Source: AA0mqf5fv7+IsVL8ufONS90oYYapUD6XjjrRHyYzuAQ7ObOSPa22tQrPPSpuo3UwGw3H5aMDH6o3vg==
X-Received: by 2002:a17:902:bc84:b0:17f:700a:2cd3 with SMTP id
 bb4-20020a170902bc8400b0017f700a2cd3mr4826606plb.36.1669125888125; 
 Tue, 22 Nov 2022 06:04:48 -0800 (PST)
Received: from always-T480.www.tendawifi.com ([139.177.225.252])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a170902e74100b00186b280a441sm12097410plf.239.2022.11.22.06.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 06:04:47 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com, mst@redhat.com, dgilbert@redhat.com,
 eblake@redhat.com, armbru@redhat.com, michael.roth@amd.com,
 pbonzini@redhat.com
Cc: qemu-devel@nongnu.org,
	zhenwei pi <pizhenwei@bytedance.com>
Subject: [for-8.0 v2 05/11] cryptodev: Introduce 'query-cryptodev' QMP command
Date: Tue, 22 Nov 2022 22:07:50 +0800
Message-Id: <20221122140756.686982-6-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221122140756.686982-1-pizhenwei@bytedance.com>
References: <20221122140756.686982-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x630.google.com
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
          "type": "builtin",
          "info": "cryptodev-builtin0"
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
          "type": "lkcf",
          "info": "cryptodev-lkcf0"
        }
      ]
    }
  ],
  "id": "libvirt-415"
}

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 backends/cryptodev.c | 49 ++++++++++++++++++++++++++++++++++++++++++++
 qapi/cryptodev.json  | 43 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/backends/cryptodev.c b/backends/cryptodev.c
index d3caded920..bf2f3234c9 100644
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
@@ -33,6 +34,54 @@
 
 static QTAILQ_HEAD(, CryptoDevBackendClient) crypto_clients;
 
+static int qmp_query_cryptodev_foreach(Object *obj, void *data)
+{
+    CryptoDevBackend *backend;
+    CryptodevInfoList **infolist = data;
+    uint32_t services;
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
+    for (uint32_t i = 0; i < QCRYPTODEV_BACKEND_SERVICE__MAX; i++) {
+        if (services & (1 << i)) {
+            QAPI_LIST_PREPEND(info->service, i);
+        }
+    }
+
+    for (uint32_t i = 0; i < backend->conf.peers.queues; i++) {
+        CryptoDevBackendClient *cc = backend->conf.peers.ccs[i];
+        CryptodevBackendClient *client = g_new0(CryptodevBackendClient, 1);
+
+        client->queue = cc->queue_index;
+        client->type = cc->type;
+        if (cc->info_str) {
+            client->has_info = true;
+            client->info = strdup(cc->info_str);
+        }
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
index 8732a30524..4cc4f4f0ed 100644
--- a/qapi/cryptodev.json
+++ b/qapi/cryptodev.json
@@ -43,3 +43,46 @@
 { 'enum': 'QCryptodevBackendType',
   'prefix': 'QCRYPTODEV_BACKEND_TYPE',
   'data': ['builtin', 'vhost-user', 'lkcf']}
+
+##
+# @CryptodevBackendClient:
+#
+# Information about a queue of crypto device.
+#
+# @type: the type of the crypto device
+#
+# @info: the additional infomation of the crypto device
+#
+# Since: 8.0
+##
+{ 'struct': 'CryptodevBackendClient',
+  'data': { 'queue': 'int',
+            'type': 'QCryptodevBackendType',
+            '*info': 'str' } }
+
+##
+# @CryptodevInfo:
+#
+# Information about a crypto device.
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
2.20.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E5B673244
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 08:16:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIP8M-00066z-KQ; Thu, 19 Jan 2023 02:14:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pIP8J-00065k-Oe
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:14:47 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pIP8H-0002GG-AN
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:14:47 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 s13-20020a17090a6e4d00b0022900843652so4991300pjm.1
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 23:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x+hVdTPrWVAwZzOg9SAFFEr8aXe+lGZ7gpPp7jgQYJI=;
 b=i1wirrMnTVeM/xlRqyyBRhLBxCfu+UEesRcVvfo31MQ6nME5NFG6pDZew0aIug5byt
 8OBw2uhBVR+8VzRscItBFOJSaxBivrVhcUjGO5K41/8LTEo2x795aJX8RLmjEO6DX697
 JwGTVIcoCYPfRmeZNtQFNGwREWjXxea0II/08CuP+IcWlqCqx7ZSmW1FJVyfGV6y9+5Q
 wR/Vi1AJCHSvNvJDwHj/9oJ7pYwFkU332ywzFOwM9xpcYTnGX4H35hU51QZIK5ya5B9v
 xGWhi5jMz9oHt/H2zAJR9+fH5pjpz0Vg4exQ4erYUetrSqOBEZUUoQlSg+Tylw7J18Qd
 HRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x+hVdTPrWVAwZzOg9SAFFEr8aXe+lGZ7gpPp7jgQYJI=;
 b=RwWm8j0gatQ1SazrT3wPgfP9L/MQEd9e/TNG3o53CvbHQXerOHGdydvZz91JgERc0L
 Z6vEF59D2PhMYAz9q9gCcz+J7qBPGorK4RqDl3jOZ5gy8EmJtBUtVt8BjVSWbm1giLQM
 Ckz7sfYJU6ylheV3eE7e5ejU9wOmnGDQI+uKa+JZ8PcmRBgLFenEk93XPYs3YbieGoz/
 ltj5k2efUa/wXYBrvqvvjHTMFiSwNTlb0xqR2+01Z1M2GkUzyZ8TSA0kCOmR4t97R0+B
 Bya7P/DxHLGE7rdtKXHIPDBFV+oh6HSKJLdoCtOu9KGagm80gno7KFxYYfixbJ+5wZkY
 F0lA==
X-Gm-Message-State: AFqh2kpkpCZXO6YEQH0xPKyEPX+2bAjf7FLoyaGB1YuCcUdQIMyBv5OI
 /cARlehliJn25/+MGRi2XfBipw==
X-Google-Smtp-Source: AMrXdXveJzrcL3i3elBHFJPZmqcByMS6D81CHKAEONqiOI9Cp0dKU9hDmXNH1vpQQk6EDdoCkKodEg==
X-Received: by 2002:a17:902:f54c:b0:192:fc9c:a238 with SMTP id
 h12-20020a170902f54c00b00192fc9ca238mr11504452plf.66.1674112482362; 
 Wed, 18 Jan 2023 23:14:42 -0800 (PST)
Received: from always-pc.bytedance.net ([61.213.176.6])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a170902ef4400b0016d72804664sm24266631plx.205.2023.01.18.23.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 23:14:41 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com, mst@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com
Cc: armbru@redhat.com, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v3 05/12] cryptodev: Introduce 'query-cryptodev' QMP command
Date: Thu, 19 Jan 2023 15:14:12 +0800
Message-Id: <20230119071419.3585771-6-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230119071419.3585771-1-pizhenwei@bytedance.com>
References: <20230119071419.3585771-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x102f.google.com
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
index 8732a30524..6c6509cd3f 100644
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
+  'data': { 'queue': 'int',
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



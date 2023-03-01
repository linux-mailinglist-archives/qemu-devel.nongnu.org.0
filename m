Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF4B6A6B39
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 12:00:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXKBK-0004Yy-9Y; Wed, 01 Mar 2023 05:59:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXKBB-0004YG-5E
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:59:25 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXKB9-0006Fy-2Y
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:59:24 -0500
Received: by mail-pl1-x62c.google.com with SMTP id z2so13520335plf.12
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 02:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677668359;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=opVVOmUrhPo60XXxThNotfODxmtNJYHwrlCGCosncyM=;
 b=DyPRBwRY8Ac8Mo4yh8OCyo0L7qO7asRdgSVETqcRTQKBJe1TbHXxDriTFBmslNev3N
 Xm2UVQLMfQgA7MO9vmtHM1nVMm9/XXplmRjy1mICRC9/QT4zfXATNV3gQEgMgOUxnvOX
 FUfOELGwX1TqCrdhoBdplNgw1KCP7kXuqpSmSAAip0rQi4tzWLDHZpsypLShracuPgyL
 z7z8yjGFQ0PhRbzqbPRO/lwMLP0tL45Ovtww2hOhzcvkOclKIcRyxH5l4Y2ED+cwNK0t
 O1fDx+yNfqpmpkiY3c7fX2IchUbzHVQSQqD4E/BlDOg1F+lQbUSBmkYhoxHdpo30HJSQ
 Dj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677668359;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=opVVOmUrhPo60XXxThNotfODxmtNJYHwrlCGCosncyM=;
 b=KCTTIoYoh34KV5w0nOwZX2cfjmKPXpiKdNoWeG8OjAOjd3UFOTIBhvzZeSSie1BiTw
 5vZ5GWCZ1DxMrpD7UQgHjnRV4Wo0rb1ysljbv0a920mt6RfxB4zqXfsY4MMXwN24j90Q
 gWp4YhSNG+WI49mStIZ5aW0ebEWxy/9ntsKvXerdLK/E63TBGAZDFld0vlddzbQslBjs
 dJV1cdq5kaF+/HXcuPK9r1OJRp8HGiYmksKfE1qeZwu7qB203PaBdlxDuTat7+e3e2vO
 qw3syiHsYzOh8qe6ap8rVlBX5thQVrsGMiKdMbFR+LnLrQklXbha/A78VMqK8Re0gWti
 gl5A==
X-Gm-Message-State: AO0yUKXF916pC/OgcupMHATk3yOKiML1DjR5QBXn2v8PhD5SL5vLMFyH
 NMkWqwdWxBAii4gSg+qHm+SuOg==
X-Google-Smtp-Source: AK7set+uJQ0+Q+Svxg3Ot+2Pc3khK8qXTO0nMlp1zmPddEAh09q0FEqT2lCk2Pa33d3C71YpplxjqA==
X-Received: by 2002:a17:90b:380d:b0:233:d870:f4c7 with SMTP id
 mq13-20020a17090b380d00b00233d870f4c7mr7102770pjb.21.1677668358914; 
 Wed, 01 Mar 2023 02:59:18 -0800 (PST)
Received: from libai.bytedance.net ([61.213.176.5])
 by smtp.gmail.com with ESMTPSA id
 mj9-20020a17090b368900b002342ccc8280sm7829149pjb.6.2023.03.01.02.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 02:59:18 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com
Cc: dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v6 05/12] cryptodev: Introduce 'query-cryptodev' QMP command
Date: Wed,  1 Mar 2023 18:58:40 +0800
Message-Id: <20230301105847.253084-6-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301105847.253084-1-pizhenwei@bytedance.com>
References: <20230301105847.253084-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x62c.google.com
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

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 backends/cryptodev.c | 45 ++++++++++++++++++++++++++++++++++++++++++++
 qapi/cryptodev.json  | 44 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/backends/cryptodev.c b/backends/cryptodev.c
index c2a053db0e..3a45d19823 100644
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
+    QCryptodevInfoList **infolist = data;
+    uint32_t services, i;
+
+    if (!object_dynamic_cast(obj, TYPE_CRYPTODEV_BACKEND)) {
+        return 0;
+    }
+
+    QCryptodevInfo *info = g_new0(QCryptodevInfo, 1);
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
+        QCryptodevBackendClient *client = g_new0(QCryptodevBackendClient, 1);
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
+QCryptodevInfoList *qmp_query_cryptodev(Error **errp)
+{
+    QCryptodevInfoList *list = NULL;
+    Object *objs = container_get(object_get_root(), "/objects");
+
+    object_child_foreach(objs, qmp_query_cryptodev_foreach, &list);
+
+    return list;
+}
 
 CryptoDevBackendClient *cryptodev_backend_new_client(void)
 {
diff --git a/qapi/cryptodev.json b/qapi/cryptodev.json
index 8732a30524..f33f96a692 100644
--- a/qapi/cryptodev.json
+++ b/qapi/cryptodev.json
@@ -43,3 +43,47 @@
 { 'enum': 'QCryptodevBackendType',
   'prefix': 'QCRYPTODEV_BACKEND_TYPE',
   'data': ['builtin', 'vhost-user', 'lkcf']}
+
+##
+# @QCryptodevBackendClient:
+#
+# Information about a queue of crypto device.
+#
+# @queue: the queue index of the crypto device
+#
+# @type: the type of the crypto device
+#
+# Since: 8.0
+##
+{ 'struct': 'QCryptodevBackendClient',
+  'data': { 'queue': 'uint32',
+            'type': 'QCryptodevBackendType' } }
+
+##
+# @QCryptodevInfo:
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
+{ 'struct': 'QCryptodevInfo',
+  'data': { 'id': 'str',
+            'service': ['QCryptodevBackendServiceType'],
+            'client': ['QCryptodevBackendClient'] } }
+
+##
+# @query-cryptodev:
+#
+# Returns information about current crypto devices.
+#
+# Returns: a list of @QCryptodevInfo
+#
+# Since: 8.0
+##
+{ 'command': 'query-cryptodev', 'returns': ['QCryptodevInfo']}
-- 
2.34.1



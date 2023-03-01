Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E52C96A65C5
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:52:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCZS-0007fB-63; Tue, 28 Feb 2023 21:51:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXCZL-0007cR-Ho
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:51:51 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pXCZJ-0001ff-PI
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:51:51 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so15818037pjh.0
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677639108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tZu7/hI7aL4wyGXCzAEJ1jd1KuiZ9b0q9eR9U/i2mso=;
 b=WNukf6DFFZqK72b8MjjDaH9hMX2eLR4XHKXxesvoqWmY2N2UPeVlaKPLrGv/atjevf
 EG/ZXpH6MSGNIT4mb1VTo/Lk23gktQqIHftylHwdyD2sg6Jmhhewc2UOjLm3u8X2YPJA
 Exoivh4YQSQqFcCPYbaZLKIw/cXH6MpslIBzHuotlhaJdcApx7ZGbbQFb/NyPY5z0vXf
 WYNYNOHtfAQKHNPgte3234roL/Oxdr//Zxyo1S4RvxoV0zIqXaD1nA91RaJ9LKM0K/Jg
 rjADB45zt1yxiudf+xuArCSwdNJCoLqGT9e9p65R6/01WQwvoLYhSLgpnewj8OWgC8UR
 6jCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677639108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tZu7/hI7aL4wyGXCzAEJ1jd1KuiZ9b0q9eR9U/i2mso=;
 b=DWesdpMGqjTVs9ELahdQWvrcOkzY9ooxiSG6EBo86Pu3+ve9flWiPe239OlDIPRTOs
 Q3q7Jnv+kI2JY2siOLJeuVFxOhZ8X9bwPPmVTEmAv2EYWPWcB9hukXGsLTrFwff9vo12
 2BNn9PFeMS/c+ULf2xUxgTmhbMuI/ci2LmfeLIFOtWRpELrdDfsJKReEFZbOpnJE85ZC
 jCLbi7gB1lHU/mxF8SoK02QIvfmTegTeruSj53R4f1fJSeyJVSmjxufqkhLupJy6zWAV
 pnt8FMI+x7H7etXikNmwujkRsXqx53voI3Eign8/ybKI21WrGbsuHqskzRyztrzdI1y+
 6gQQ==
X-Gm-Message-State: AO0yUKXzaaV773wfGe6oKDAOaxIXjiWRZaw1hj+08erwAXoY9VM0QCSC
 sE53N2euC+T7JSiWvARgVDc4FA==
X-Google-Smtp-Source: AK7set8JbAtFOBt64NT0oRd8wUMtqlXSg6MaPB31khkdBo5yyFMFENRbXpEe1j19tBKTrV05crudaQ==
X-Received: by 2002:a17:903:27cd:b0:19d:e25:7ad9 with SMTP id
 km13-20020a17090327cd00b0019d0e257ad9mr3986732plb.64.1677639108273; 
 Tue, 28 Feb 2023 18:51:48 -0800 (PST)
Received: from libai.bytedance.net ([61.213.176.5])
 by smtp.gmail.com with ESMTPSA id
 ix1-20020a170902f80100b0019ab58f47a6sm7218743plb.105.2023.02.28.18.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:51:47 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com
Cc: dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org, berrange@redhat.com,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v5 05/12] cryptodev: Introduce 'query-cryptodev' QMP command
Date: Wed,  1 Mar 2023 10:51:17 +0800
Message-Id: <20230301025124.3605557-6-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025124.3605557-1-pizhenwei@bytedance.com>
References: <20230301025124.3605557-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1033.google.com
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



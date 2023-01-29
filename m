Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6794B67FC7B
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 03:58:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLxta-0003mA-Iq; Sat, 28 Jan 2023 21:58:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLxtY-0003ly-6o
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 21:58:16 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLxtW-00086t-Ib
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 21:58:15 -0500
Received: by mail-pl1-x630.google.com with SMTP id 5so8518163plo.3
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 18:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tZu7/hI7aL4wyGXCzAEJ1jd1KuiZ9b0q9eR9U/i2mso=;
 b=kcdPYlqDoRxf+7O632pX5h0/76jhhOGra5gi/OEgUkrAkK7z80AHwhXuYbkobiYU2L
 yrQp0/ljqG1asdxbd+Jd6gd49YXMZnCq40FNtblXtgkfGkt+N959oy3CaUu8iwWam60M
 G4QYcRBJc/IcP5cQfhhiBJx2pkkPXTTCuDZDNxrFfqnGMBSX5mbW8D119e/van1ZjeuY
 M+mbo/POluZSQAPg+Ban55Xad+OPB5EqTDO/pWTME8jVYOCE0dGHGGy9l7XM9w5pNyc5
 E/rR+Wj01TEOh9Fy6i8apMK7o0SRoqcleU0ZZ9fOOn1ZEwoZhuAcKA42wBtLIaNMjWiH
 Emnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tZu7/hI7aL4wyGXCzAEJ1jd1KuiZ9b0q9eR9U/i2mso=;
 b=joyxdubGhIa20xwbWZD04BaHJ4qr5WwDUI3ApKkpO+CAvclIBQw+/ljsV3XCcGLY8O
 un2LEqSYODJNtjRvYuN6QTIbOabg/yrYGFMcA39H1LJWc3Zr42MSIPJDtudlvWeUQfOO
 HFBBpeiyOnaF+aIlW+P5wbNZsp2O7XQzUZN9iTV8O7e+iH5IQ/2y0XS/SbctWIM+V28H
 MAVW8FdhJZ2fSRn62k2XMeauzg4CHSiQrTmlf1cHrCmR6MZNAbP3l4scG6HSWXpnJdnr
 yYt3g0nSvHEwb/7+NRA2ryXoKbcdByBejBdcWEgSS3yD5fmoIyVzVf/2CvM/8+OcJeia
 0Row==
X-Gm-Message-State: AO0yUKXm6Xp6rMZaEFvWLo/nd6Jjy0zQXRJzPYJM9pbNYjYfJArHrB6u
 jA5xF/Kaanx9HCjJw15hnUUozw==
X-Google-Smtp-Source: AK7set+t2nR1u2X0Umtxb5ex/Nxxp8gQl1StU5Y7TdFBe1b9OeYGYyPmSeuMWs6MVRmT4AZ8o1hGOA==
X-Received: by 2002:a17:903:2312:b0:196:6162:1a76 with SMTP id
 d18-20020a170903231200b0019661621a76mr6389578plh.0.1674961093195; 
 Sat, 28 Jan 2023 18:58:13 -0800 (PST)
Received: from always-pc.bytedance.net ([61.213.176.6])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a170902ea8400b00194c90ca320sm5167084plb.204.2023.01.28.18.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 18:58:11 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com, mst@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com
Cc: armbru@redhat.com, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v4 05/12] cryptodev: Introduce 'query-cryptodev' QMP command
Date: Sun, 29 Jan 2023 10:57:40 +0800
Message-Id: <20230129025747.682282-6-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230129025747.682282-1-pizhenwei@bytedance.com>
References: <20230129025747.682282-1-pizhenwei@bytedance.com>
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



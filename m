Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02062625411
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 07:49:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otNpG-0006dH-8o; Fri, 11 Nov 2022 01:47:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1otNpD-0006cn-S9
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 01:47:39 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1otNoy-0008FK-Az
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 01:47:39 -0500
Received: by mail-pl1-x634.google.com with SMTP id l2so3508991pld.13
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 22:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TlcaU38pdb3CtWEh3sr5SMbpseSZUCKSQHY6AQe8NOY=;
 b=Waw6F4ERLtitFcl3841EyuKb7ief+RC8M7ShiuPypYX5hAEYCY3Bp6nJQmrv18hJKX
 iHqHZke0TDuoSAF0QJJN5To55DrTRRGnoR0qoKJJwXVG1d/PKamxBLbRALiQ7s1T/P7H
 VtWU72Twpuh2+UbT16N+XWQtZTZrKGKAl+fdm9Cy3QWgGDyXRDh0DNDg5jhvoUxiXrje
 4EPwoEGGRUyZum0dvEAgzcszcGJYaYx0BFDZIhVxI1dvB3d/ahpBLsd01LXBlTJKFtig
 cyoUqblgdUt3iW4LGGpoafh8dozJ49l8w+jU6l+p8Mb/kIdmRnyG8DTa4NmAUadXqnSD
 Rrdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TlcaU38pdb3CtWEh3sr5SMbpseSZUCKSQHY6AQe8NOY=;
 b=CJQM0v8akA3GG9vJ48JsNcEZ87iCMkwrXTt1ez4fO0LvU3R3HfjO9wgXj7XhpNr1OO
 0ZDQJcAikIsWZTze+j528JS3aEb7UW+tWgYnykmBU29m55R4i75v7fKJOeeqwTF1bfqu
 W7vFeb1Vm4SDM5m44qqMXIQdBabrT4KC04keCRc/IFpo83CBGwDJ2ASNkrMhJcSCVSv4
 nIkuSNlbPb+2SYhIuLgX5N2jQsrSh1uUxsarFhtLYE4SICEK6AWTcnkhufYUeT/hQaeP
 cMFJAM+FHhwWbL39wukrqOzQv5z+6+cxzkh9rKYFbFzLZKRT02Jbh95kFVa4nL+fAMPJ
 lgAA==
X-Gm-Message-State: ANoB5pltTVeof3Hn+Ypj5ufWwlI5LNCljgTkdth3hSvRTj53Jv2FvLk/
 W+L8AdvRNg5RQ+HHWQwcmfUYJA==
X-Google-Smtp-Source: AA0mqf4OkzTp8O98cri+hCRpo06eJbZ8u4yoKrj14I0VTtAKM2I7iWG/ahz7yPjR6qxxX8WCk/hbOA==
X-Received: by 2002:a17:903:248b:b0:186:898a:f33d with SMTP id
 p11-20020a170903248b00b00186898af33dmr1366483plw.33.1668149242897; 
 Thu, 10 Nov 2022 22:47:22 -0800 (PST)
Received: from always-x1.bytedance.net ([63.216.146.186])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a170902e5ca00b0017f64ab80e5sm841022plf.179.2022.11.10.22.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 22:47:22 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com, dgilbert@redhat.com, mst@redhat.com,
 eblake@redhat.com, armbru@redhat.com, michael.roth@amd.com
Cc: qemu-devel@nongnu.org,
	zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH for 8.0 5/8] cryptodev: Introduce 'query-cryptodev' QMP command
Date: Fri, 11 Nov 2022 14:45:50 +0800
Message-Id: <20221111064553.246932-6-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111064553.246932-1-pizhenwei@bytedance.com>
References: <20221111064553.246932-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B26625413
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 07:49:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otNpE-0006cl-D5; Fri, 11 Nov 2022 01:47:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1otNpA-0006bI-Fh
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 01:47:36 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1otNp8-0008IF-PP
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 01:47:36 -0500
Received: by mail-pg1-x52a.google.com with SMTP id q1so3688902pgl.11
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 22:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LIesySo8KfoPYYuDv0hxnDo5m8+fU1mYrZHcG45Uhwg=;
 b=DvxJSz3/wEEDnYyPM11np5qTIqJRVVKV5lO4npjlMzcxeJj4dJ/zRUfILwgUoVEVKB
 LC+LJBkEU3ZCyiI3uvRskb/tnKEuEDmpKRrVH0aGitrV2ZDlysDvgZugB3QcGb96vW0Q
 /jy3/aIVq8jyZMfLk18coxAFVLR+b91vSf1u8pTbw3V/ApT1qoGVEUf7U9pAvN8VLTMF
 aPHZrMoBMkrwq6/gMzT5Dc89fanSMq//LxhxIzzhlcwPjOCmbWhJhXAvWDarbYn0sK5z
 pTIHqwkQpD+an9lBK/CUuJnOhaE5nflpoXzNmOMK4u84JTdzydVrvlN9EbtO1QyUtoUt
 5FFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LIesySo8KfoPYYuDv0hxnDo5m8+fU1mYrZHcG45Uhwg=;
 b=m05BA6LChY90lhUfFJ08GiY+jD1YxoMJTfF0aVBZ4yFyXD8eIK0gCueg3ZdfJySzI7
 bH4IY5rmDbwjWGp0M/uxOOmE415+L12+fVN+kGliHVASJuYmhXop4kFL8GmXUTwjI5CU
 IQPvz4HlZR4A8x9Ff9zEGso2kSvIEysfgaYGp5zYesPK14wlMccMggqGKU9qXW4wn8pc
 ZTcRkWSduj+bSBwD9LNvBW9Ae7UGpxRU+ptp3l9nrlWN9QVqRd2Lth7CFE9Fj+78O8L4
 RYKK2o1paMGOPleSGRrBwKCGHwCA4Q3bakuXWdKPbW70byT8SrNBAxYTiyaZ5KpgmEMZ
 nILQ==
X-Gm-Message-State: ANoB5pmEe8zfAzig0HAuhsdnKVqIpuLEGlNzv2WtmXJ0zMVgLoobmPYZ
 YdlAnyzpplhyANq2mqSHlY86BA==
X-Google-Smtp-Source: AA0mqf5/X0Em3V8ifIs2J93d/ILyfxzdwhf2FYzSr+0t/l42WHc+BzTwWqjiJKAQjGRUM7Z3LyomTw==
X-Received: by 2002:a63:2210:0:b0:458:6031:ba1 with SMTP id
 i16-20020a632210000000b0045860310ba1mr447725pgi.524.1668149253343; 
 Thu, 10 Nov 2022 22:47:33 -0800 (PST)
Received: from always-x1.bytedance.net ([63.216.146.186])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a170902e5ca00b0017f64ab80e5sm841022plf.179.2022.11.10.22.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 22:47:32 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com, dgilbert@redhat.com, mst@redhat.com,
 eblake@redhat.com, armbru@redhat.com, michael.roth@amd.com
Cc: qemu-devel@nongnu.org,
	zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH for 8.0 8/8] hmp: add cryptodev info command
Date: Fri, 11 Nov 2022 14:45:53 +0800
Message-Id: <20221111064553.246932-9-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111064553.246932-1-pizhenwei@bytedance.com>
References: <20221111064553.246932-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pg1-x52a.google.com
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

Example of this command:
 # virsh qemu-monitor-command vm --hmp info cryptodev
cryptodev1: service=[akcipher|mac|hash|cipher]
    queue 0: type=builtin
cryptodev0: service=[akcipher]
    queue 0: type=lkcf

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 hmp-commands-info.hx  | 14 ++++++++++++++
 include/monitor/hmp.h |  1 +
 monitor/hmp-cmds.c    | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 754b1e8408..47d63d26db 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -993,3 +993,17 @@ SRST
   ``info virtio-queue-element`` *path* *queue* [*index*]
     Display element of a given virtio queue
 ERST
+
+    {
+        .name       = "cryptodev",
+        .args_type  = "",
+        .params     = "",
+        .help       = "show the crypto devices",
+        .cmd        = hmp_info_cryptodev,
+        .flags      = "p",
+    },
+
+SRST
+  ``info cryptodev``
+    Show the crypto devices.
+ERST
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index dfbc0c9a2f..b6b2b49202 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -143,5 +143,6 @@ void hmp_info_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
 void hmp_human_readable_text_helper(Monitor *mon,
                                     HumanReadableText *(*qmp_handler)(Error **));
 void hmp_info_stats(Monitor *mon, const QDict *qdict);
+void hmp_info_cryptodev(Monitor *mon, const QDict *qdict);
 
 #endif
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 01b789a79e..3f1054aa1e 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -33,6 +33,7 @@
 #include "qapi/qapi-commands-block.h"
 #include "qapi/qapi-commands-char.h"
 #include "qapi/qapi-commands-control.h"
+#include "qapi/qapi-commands-cryptodev.h"
 #include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-commands-migration.h"
 #include "qapi/qapi-commands-misc.h"
@@ -2761,3 +2762,38 @@ void hmp_virtio_queue_element(Monitor *mon, const QDict *qdict)
 
     qapi_free_VirtioQueueElement(e);
 }
+
+void hmp_info_cryptodev(Monitor *mon, const QDict *qdict)
+{
+    CryptodevInfoList *info_list;
+    CryptodevInfo *info;
+    QCryptodevBackendServiceTypeList *service_list;
+    CryptodevBackendClientList *client_list;
+    CryptodevBackendClient *client;
+    char services[128] = {};
+    int len;
+
+    info_list = qmp_query_cryptodev(NULL);
+    for ( ; info_list; info_list = info_list->next) {
+        info = info_list->value;
+
+        service_list = info->service;
+        for (len = 0; service_list; service_list = service_list->next) {
+            len += snprintf(services + len, sizeof(services) - len, "%s|",
+                QCryptodevBackendServiceType_str(service_list->value));
+        }
+        if (len) {
+            services[len - 1] = '\0'; /* strip last char '|' */
+        }
+        monitor_printf(mon, "%s: service=[%s]\n", info->id, services);
+
+        client_list = info->client;
+        for ( ; client_list; client_list = client_list->next) {
+            client = client_list->value;
+            monitor_printf(mon, "    queue %ld: type=%s\n", client->queue,
+                          QCryptodevBackendType_str(client->type));
+        }
+    }
+
+    qapi_free_CryptodevInfoList(info_list);
+}
-- 
2.20.1



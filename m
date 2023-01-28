Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EEA67F477
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 04:58:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLcL2-0000Q2-Sc; Fri, 27 Jan 2023 22:57:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLcL1-0000Pr-8V
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 22:57:11 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLcKz-0003oN-Ht
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 22:57:10 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 w6-20020a17090ac98600b0022c58cc7a18so2003315pjt.1
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 19:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8HDlbR/ue9evERBUHAmZzQiWiqejTQP24BQkEB1mCTA=;
 b=EVbOQK2jtwz3lZm9o/DCGvYGT1Eo2Dzr+aT8gfbU4wMmYjXC7wJfEZ4d5hqKwKNRsh
 XbUVpR+tEx1dWjXrfTsIRyotkEURwMR0i5VH86UPs7xIaodDOU+Ie1MDNuY+dMBh8OWe
 OiF6oU21aKOMQvbMAXDMmuHhD++OrKfzjc1vJ281QgovCkHZQ3cjIKn4MXz63jAqrfqv
 KQa5wxZgNbZr9xacMBMNNVopZTIYyNYdliife2kTyemLceuFxY3ym6GI2pvqdVs421XF
 3WKsK+ILYvMULTQTME3Vh+1SyNHXfcYmapvls+aU4e1ejO0QO84GUZWpPASF4FPDUyT+
 BzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8HDlbR/ue9evERBUHAmZzQiWiqejTQP24BQkEB1mCTA=;
 b=GTyhzqUb2PufOqboeYvn0bCryeujklExiTeehzxA6DkUBpBDCUW/f2fRCyurrbS4Uk
 icTXjNmcizhrBkfXlBxbbODVgo1m7DIzyARUhs/rTmiH0baLPobGBOtF3B/QeRlq9LUz
 66ZIh5Lr/RIlXsJo65dZ7jvM2AWyOTYvdbx2r00cQnK5PdJo+8YVG2V7C+PmKh6xZ4G+
 33m3lC4K7YZO5XB98s0drlhBPItfuP+OZXNgQrp/H46mBAa6NFOmgUBQWTEFASCpiSSf
 J6iLd/YsZom1K/Oguf0AtIGd42LqJOys+bbgXbTKXY5B58wMjVxKKK7kus7MBMDVzaOz
 xATQ==
X-Gm-Message-State: AO0yUKWP8sZeHjNqoxTcQWai/fwi+X0stFSLwksScxHUUBy0Q9PmxELV
 lUdy5EF1JnNoMYJUGq344iLuZg==
X-Google-Smtp-Source: AK7set+EM++x0Tg4TwhIolIhDAob7qQrFEyQV+c8dL4YqXASmTjy2KRdnDsSPuW1cPnQc92/WuOKaw==
X-Received: by 2002:a17:902:d4c7:b0:196:1608:d755 with SMTP id
 o7-20020a170902d4c700b001961608d755mr17888110plg.60.1674878228475; 
 Fri, 27 Jan 2023 19:57:08 -0800 (PST)
Received: from always-pc.bytedance.net ([61.213.176.6])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a170902ed4400b00186c3afb49esm3594662plb.209.2023.01.27.19.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 19:57:07 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com
Cc: dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v3 07/12] hmp: add cryptodev info command
Date: Sat, 28 Jan 2023 11:56:28 +0800
Message-Id: <20230128035633.2548315-8-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230128035633.2548315-1-pizhenwei@bytedance.com>
References: <20230128035633.2548315-1-pizhenwei@bytedance.com>
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
index 1b3bdcb446..391a097ffd 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -151,5 +151,6 @@ void hmp_human_readable_text_helper(Monitor *mon,
                                     HumanReadableText *(*qmp_handler)(Error **));
 void hmp_info_stats(Monitor *mon, const QDict *qdict);
 void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict);
+void hmp_info_cryptodev(Monitor *mon, const QDict *qdict);
 
 #endif
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 1dba973092..ed316f75c1 100644
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
@@ -2280,3 +2281,38 @@ void hmp_virtio_queue_element(Monitor *mon, const QDict *qdict)
 
     qapi_free_VirtioQueueElement(e);
 }
+
+void hmp_info_cryptodev(Monitor *mon, const QDict *qdict)
+{
+    CryptodevInfoList *il;
+    QCryptodevBackendServiceTypeList *sl;
+    CryptodevBackendClientList *cl;
+
+    for (il = qmp_query_cryptodev(NULL); il; il = il->next) {
+        g_autofree char *services = NULL;
+        CryptodevInfo *info = il->value;
+        char *tmp_services;
+
+        /* build a string like 'service=[akcipher|mac|hash|cipher]' */
+        for (sl = info->service; sl; sl = sl->next) {
+            const char *service = QCryptodevBackendServiceType_str(sl->value);
+
+            if (!services) {
+                services = g_strdup(service);
+            } else {
+                tmp_services = g_strjoin("|", services, service, NULL);
+                g_free(services);
+                services = tmp_services;
+            }
+        }
+        monitor_printf(mon, "%s: service=[%s]\n", info->id, services);
+
+        for (cl = info->client; cl; cl = cl->next) {
+            CryptodevBackendClient *client = cl->value;
+            monitor_printf(mon, "    queue %u: type=%s\n", client->queue,
+                          QCryptodevBackendType_str(client->type));
+        }
+    }
+
+    qapi_free_CryptodevInfoList(il);
+}
-- 
2.34.1



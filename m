Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC439673245
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 08:16:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIP8P-00068c-7I; Thu, 19 Jan 2023 02:14:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pIP8N-00067g-62
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:14:51 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pIP8L-0002GV-6l
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:14:50 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 z1-20020a17090a66c100b00226f05b9595so1023527pjl.0
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 23:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d7GjFcohFv4eNP+TegsfHNvLcNXFVf2rYI0Dx/A9oLc=;
 b=diHLy9zOojBBOVg+HWEzys9NUPN1ff36AbCWBm/DnT3FXTcll61h5f/3Lp557pGG+H
 34IE9+b11aJhPOO0OvSCwPgswJayuSRYJGcwiCUlBkELVm4ykU2MOsIRPR1F9Iz926/0
 MEPnx43EZd6dM1abbtpfa9+J0dYa/7s0wL5ff1QzbvzES7KCMAE8IbV1xUSX4tyXjaeJ
 XTznHIVRYDgI/dTLEGzjyRkrsXbqyukvCbQ/fjgBDMnKI3mZDqb2B79KNNE1Tz7O3bAd
 YdETiWC8AxQIKqRBoTHeB2v0VwXTG5OY8Rs3S0CzBBN7ul1qBAjaSvuKWfxt0p0OeOkW
 dKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d7GjFcohFv4eNP+TegsfHNvLcNXFVf2rYI0Dx/A9oLc=;
 b=5tv49YVJDSVXSYtvgq3V4bNIk7L+IyAw6GgNjU4eSHUg9CqH475Afk4FBejtkrT5q5
 ys+X3kldx4drE4vyfQzcVdAwz5Wq9J1Atsv0t21FYIp4J7uI6xDED5M2nfAfE6gSaBQY
 JBWVcqcEqZ0t/RE0zMLDWtUfVG/r/4Taj0+h60yVmmwB9qYhNALlub3wy47RQw47NWlP
 10cjemzmr7CuPEszqnBK01ygWdjoepgIvGXFUv7ShFiNG05BkXuNWJCeqhCwV4N+A7sj
 KCcBkEofn+loru7zc+2nETqohPXqE6Jw3l73oubyl+o+tB4/bcG3gLpO0998iaY2nLGu
 2Qog==
X-Gm-Message-State: AFqh2kpRqw5V+zCpmmOp4auZ3msaaPUpVFDJ9zW7s3ZFFJ6p0JkjIMDE
 x3LlC3IKgUCY8+PxLsGG+ZmOog==
X-Google-Smtp-Source: AMrXdXtjdN9U0njFTniKnIhcVUpxiJwOzHvmxVGge+T+d0xc+0K6T67odGuelANJkkYotxudy7xNsQ==
X-Received: by 2002:a17:902:9a97:b0:193:2a8c:28cb with SMTP id
 w23-20020a1709029a9700b001932a8c28cbmr10218978plp.21.1674112488506; 
 Wed, 18 Jan 2023 23:14:48 -0800 (PST)
Received: from always-pc.bytedance.net ([61.213.176.6])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a170902ef4400b0016d72804664sm24266631plx.205.2023.01.18.23.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 23:14:48 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com, mst@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com
Cc: armbru@redhat.com, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v3 07/12] hmp: add cryptodev info command
Date: Thu, 19 Jan 2023 15:14:14 +0800
Message-Id: <20230119071419.3585771-8-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230119071419.3585771-1-pizhenwei@bytedance.com>
References: <20230119071419.3585771-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1030.google.com
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
index 27f86399f7..e193d01419 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -144,5 +144,6 @@ void hmp_human_readable_text_helper(Monitor *mon,
                                     HumanReadableText *(*qmp_handler)(Error **));
 void hmp_info_stats(Monitor *mon, const QDict *qdict);
 void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict);
+void hmp_info_cryptodev(Monitor *mon, const QDict *qdict);
 
 #endif
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index ed78a87ddd..13c882676f 100644
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
@@ -2644,3 +2645,38 @@ void hmp_virtio_queue_element(Monitor *mon, const QDict *qdict)
 
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
+            monitor_printf(mon, "    queue %ld: type=%s\n", client->queue,
+                          QCryptodevBackendType_str(client->type));
+        }
+    }
+
+    qapi_free_CryptodevInfoList(il);
+}
-- 
2.34.1



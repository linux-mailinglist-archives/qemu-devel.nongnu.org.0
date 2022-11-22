Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0B3633E72
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 15:06:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxTto-0008WC-P7; Tue, 22 Nov 2022 09:05:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oxTtY-0008V7-6k
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:05:04 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oxTtV-00064e-VJ
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:05:03 -0500
Received: by mail-pf1-x42e.google.com with SMTP id b185so14447926pfb.9
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 06:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rJ13zFBLpczUe+mQf8RhpWx8v5xhOGQCsYHgWUIIHyE=;
 b=eufY2tbzcu8QIbmUmgfoOHLPaWkolYSCeIZAISGG95FuR3X84ibIXkRunB1xaOF2Sq
 /THa2HoILygwVJhNLS7vhUsF5AJVri/RT0Bu5epEL4lZtHN7RTrJ3Y4TSkWQ6HuIebFv
 e9KN6Fj+OdLCpHq9slZM0yxxRtrQPAnM1CTwmO6DTFjX5GFGiQO2Me9LuLp+3Tic4cB2
 R80Ag8DbwGoiNrcyrgDN+lW96d9q+tgVVQen6riQ+kNN8eSdh6ByPFdLmHKR4HViQfOi
 0K0i+9pluxzb/2mstYpdAQVfqjzCV7pY6keXH/aSjlkRI97T3AKqPgPZurBw3QZZEYI9
 foLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rJ13zFBLpczUe+mQf8RhpWx8v5xhOGQCsYHgWUIIHyE=;
 b=WVaik86E3gyYdxFK4CPcX7IDlANVh2W+hGnIn7xB8WVhYnqp0WTAS4PoBQLnmcJrQ8
 3O/Y8+xwTmH7ZL0g15XBuepVYAnoWm5YpJd//DER0q/Uuq/bCP3Aap3+Kxd5zTVWqVis
 xbjpJ7FsXuX7y7exJhA7p9z4rV0lQpbYffhSXgKjY8ZHVYPML10eI4WpUAseT8bfUG1S
 GSfCg8bEO3qw+In8ebY2U6ZNTMZmNZ8x24Q60DEgH7tfx/VA0BaXQYoBUueuVVZ3BjET
 pgv1a0SUIHEuw2KKshXao9DxW0URx80B6xcAI0ke4CJRl1tfhmQgmbgwTGWoC+xArpLA
 0hsA==
X-Gm-Message-State: ANoB5pkI5Q/BxAW1Iv5cmAC6WllJB89HAWkB/H8E0F39MeeM/BHEbk/o
 Omq9eehu60IxO76oaUIehnb8jwD4I3uydUqt
X-Google-Smtp-Source: AA0mqf4pPk1MLj2ZcCOFzbv4+1IbS2rJnHLywg1T36XBJZ8r2eVqxYU3bz4gWEqTQw7tSxgIAOch5w==
X-Received: by 2002:a63:1206:0:b0:43c:76f4:c666 with SMTP id
 h6-20020a631206000000b0043c76f4c666mr6962853pgl.90.1669125900695; 
 Tue, 22 Nov 2022 06:05:00 -0800 (PST)
Received: from always-T480.www.tendawifi.com ([139.177.225.252])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a170902e74100b00186b280a441sm12097410plf.239.2022.11.22.06.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 06:05:00 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com, mst@redhat.com, dgilbert@redhat.com,
 eblake@redhat.com, armbru@redhat.com, michael.roth@amd.com,
 pbonzini@redhat.com
Cc: qemu-devel@nongnu.org,
	zhenwei pi <pizhenwei@bytedance.com>
Subject: [for-8.0 v2 08/11] hmp: add cryptodev info command
Date: Tue, 22 Nov 2022 22:07:53 +0800
Message-Id: <20221122140756.686982-9-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221122140756.686982-1-pizhenwei@bytedance.com>
References: <20221122140756.686982-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x42e.google.com
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
index 01b789a79e..d5c9e8977d 100644
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
2.20.1



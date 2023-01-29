Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F169F67FC7E
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 03:59:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLxth-0003nK-56; Sat, 28 Jan 2023 21:58:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLxtf-0003my-06
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 21:58:23 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1pLxtd-00089I-DE
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 21:58:22 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 w6-20020a17090ac98600b0022c58cc7a18so3695715pjt.1
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 18:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hKjVUdlZBN87xHoz70rB2qadFO+xqhalwepeGM+bY0o=;
 b=GTa4acTd/pshwGlqfjfM/cQjCUt+MCL+WD/CrKvbvIwXOqlj2wNZtTsu46Y74JUbFY
 z7DJjY4sAhY7DiQZfSINDgHWemTdPIQCbWypvH0s2zJuS6edxM6T7ypRP4qVhve85IzO
 mSdPS1I5PEHFDsd7TM7mkNOSgCzHA2JQrAmkgj9paWvu4kK3/+LXKdcD7iMxhnE+gQ3n
 5r/ECSsex3SxYR4MjRc1EmRhDNa6W4OGZ51vkGJywCKn91g89EtLBXG5exgSMLE9IrRl
 LN5aNRQ428SfeT8/wkfbvhSjys55KRsRrLdvkJCv/2d3eW9jI/jFccq9OMZPWGujO3on
 KT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hKjVUdlZBN87xHoz70rB2qadFO+xqhalwepeGM+bY0o=;
 b=7H4fESpZdP+zuAJFazY+x0yAxGbqCLNiT1C3wcr2qFY0/JO2qJj9MOjf3IfFLjsgxO
 /xE/AYXOA8YSp/yvRfmiNB33esZ1c9Eh8Qvs/dM+SasXVSpgqx4Vq4c6TkG93A9puZc+
 6s6YjJzRzLoHBCAO+TyYPz6GhaXPVbm4UQX562WUoHQuu9eaRzovS85MTJKKZA5b9ShS
 K2u2x0/uSXGqHaUsGY58cyOoPc9HGWiOXj0tr39wUqSrn3SzMFfksI7ISt9q6PT8scXr
 0mYi/ty7ZpIBCrWlhKpB+vyto+0PECt5oJXXo+wCSaJM95MjYUW+m7t7rivAt0a1k+SG
 FPww==
X-Gm-Message-State: AFqh2kq0qV92CY4mETocE2nlC23nlREHMcEZxPTXaKhis4Xa8zdSF7DC
 gQt+jlwSCOch3hg8lY/ZYNW5aw==
X-Google-Smtp-Source: AMrXdXvqOghWLoRM9WznQ5zzIU9J5QbYiNPmNUDfomTdihZ6r22n6bBtWb5uqjtDIVa1V4aKoNbsCw==
X-Received: by 2002:a17:902:f546:b0:194:d9d7:88c4 with SMTP id
 h6-20020a170902f54600b00194d9d788c4mr43493137plf.49.1674961100112; 
 Sat, 28 Jan 2023 18:58:20 -0800 (PST)
Received: from always-pc.bytedance.net ([61.213.176.6])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a170902ea8400b00194c90ca320sm5167084plb.204.2023.01.28.18.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 18:58:19 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com, mst@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com
Cc: armbru@redhat.com, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v4 07/12] hmp: add cryptodev info command
Date: Sun, 29 Jan 2023 10:57:42 +0800
Message-Id: <20230129025747.682282-8-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230129025747.682282-1-pizhenwei@bytedance.com>
References: <20230129025747.682282-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x102e.google.com
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
 monitor/hmp-cmds.c    | 37 +++++++++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+)

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
index 1dba973092..cda52c2526 100644
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
@@ -2280,3 +2281,39 @@ void hmp_virtio_queue_element(Monitor *mon, const QDict *qdict)
 
     qapi_free_VirtioQueueElement(e);
 }
+
+void hmp_info_cryptodev(Monitor *mon, const QDict *qdict)
+{
+    QCryptodevInfoList *il;
+    QCryptodevBackendServiceTypeList *sl;
+    QCryptodevBackendClientList *cl;
+
+    for (il = qmp_query_cryptodev(NULL); il; il = il->next) {
+        g_autofree char *services = NULL;
+        QCryptodevInfo *info = il->value;
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
+            QCryptodevBackendClient *client = cl->value;
+            monitor_printf(mon, "    queue %" PRIu32 ": type=%s\n",
+                           client->queue,
+                           QCryptodevBackendType_str(client->type));
+        }
+    }
+
+    qapi_free_QCryptodevInfoList(il);
+}
-- 
2.34.1



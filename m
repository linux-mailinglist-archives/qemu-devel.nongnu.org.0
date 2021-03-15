Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7DC33C3F8
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 18:18:37 +0100 (CET)
Received: from localhost ([::1]:54038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLqrT-00029s-Rv
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 13:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1lLqgM-0002CI-8c
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:07:07 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:34889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1lLqgI-00021G-BV
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:07:05 -0400
Received: by mail-ej1-x631.google.com with SMTP id dx17so67560636ejb.2
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 10:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tnziLdCBQtJ/628clFAL2ayBOtafozkqcw8DQQJiZPQ=;
 b=YaPNQZWhwS/B2GkT9OVwGirBo8iHRChKHfSRXs/SWugCPC2ojlOAQ05HyM91lvEkW+
 gNkGA4e5/yYZVypj+r1UksHJgzEbt87fSpEHZgqbFt0tFWABj34Nz8ImIKk1zGuxlFwc
 /kbdvzy2s8N4ms3hMNwUjA4PljP67XnYKwggkq6CIiG/utd6tg4Hv91nOwUy/GCQz74K
 f/oUM5Ta8ywokVdwdBmDls9275WYN8VYGOyG+DvOskCOssfUDgqsucS+kLo1zFOkc9Io
 mgOLjbIXVCyGvyPv7mGqzObMTe9hqrWYfUzNApljrmwQiQecPJGckUpjMMTiQ3DDBwCc
 lShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tnziLdCBQtJ/628clFAL2ayBOtafozkqcw8DQQJiZPQ=;
 b=m/A/nHFifIu+nIw4eL3/o5rXJ0chqwMIziBiR2UxPBghabJOgCkfxQO3X2yy8gDKV8
 FUssIaj0d+uHOclEja//rrJG/vfTqjsOZiyvgS+FxWcJg2EZgsnqlANCnOiA3TAl1ZAB
 QHWchIj2e43OlWOuCatzDru5i+Yi7VQQNP6Zp5PLWle+MuwJq4bRgFswT+5PS1a7eQ0k
 qfVRTO3tEhgbo0a9WMjHa8d6U5FK06L9s74mKnBgtDp9n4yE6Xt3b9J21mooJTM8c255
 EKnWzV1gnZEMBO+4ZH+3aBbmA+od3ZRSIQygVyDqsB45T+yaswOu+LAXn1qcH/128PuH
 cPmg==
X-Gm-Message-State: AOAM532anuTC1UtqYk6EP4N2J9KBr15wEdbb8DiVCQ0YiQv12uykNAdA
 TYulv8RX1qqvx1V5ve0zgHI=
X-Google-Smtp-Source: ABdhPJyDlCHHqSDOQVeVFokvsiEIPR5bDTYbXln/eBiqe6gowxzIIh0XKP3DzSM/mxi2HXAzrcBPdA==
X-Received: by 2002:a17:906:fcc7:: with SMTP id
 qx7mr24835062ejb.486.1615828020101; 
 Mon, 15 Mar 2021 10:07:00 -0700 (PDT)
Received: from lb01556.speedport.ip
 (p200300f1170e2e5189750ed020d14fdf.dip0.t-ipconnect.de.
 [2003:f1:170e:2e51:8975:ed0:20d1:4fdf])
 by smtp.gmail.com with ESMTPSA id u15sm8728412eds.6.2021.03.15.10.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 10:06:59 -0700 (PDT)
From: Li Zhang <zhlcindy@gmail.com>
To: marcandre.lureau@redhat.com,
	lukasstraub2@web.de,
	armbru@redhat.com
Subject: [PATCH 2/2] Support monitor chardev hotswap with QMP
Date: Mon, 15 Mar 2021 18:06:36 +0100
Message-Id: <20210315170636.704201-2-zhlcindy@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315170636.704201-1-zhlcindy@gmail.com>
References: <20210315170636.704201-1-zhlcindy@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=zhlcindy@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Li Zhang <li.zhang@cloud.ionos.com>, pankaj.gupta@cloud.ionos.com,
 alexandr.iarygin@profitbricks.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Li Zhang <li.zhang@cloud.ionos.com>

For some scenarios, it needs to hot-add a monitor device.
But QEMU doesn't support hotplug yet. It also works by adding
a monitor with null backend by default and then change its
backend to socket by QMP command "chardev-change".

So this patch is to support monitor chardev hotswap with QMP.

Signed-off-by: Li Zhang <li.zhang@cloud.ionos.com>
---
 monitor/monitor-internal.h |  3 +++
 monitor/monitor.c          |  2 +-
 monitor/qmp.c              | 42 +++++++++++++++++++++++++++++++++++---
 3 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
index 40903d6386..2df6dd21de 100644
--- a/monitor/monitor-internal.h
+++ b/monitor/monitor-internal.h
@@ -186,4 +186,7 @@ int hmp_compare_cmd(const char *name, const char *list);
 void qmp_query_qmp_schema(QDict *qdict, QObject **ret_data,
                                  Error **errp);
 
+gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
+                               void *opaque);
+
 #endif
diff --git a/monitor/monitor.c b/monitor/monitor.c
index e94f532cf5..2d255bab18 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -157,7 +157,7 @@ static inline bool monitor_is_hmp_non_interactive(const Monitor *mon)
 
 static void monitor_flush_locked(Monitor *mon);
 
-static gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
+gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
                                   void *opaque)
 {
     Monitor *mon = opaque;
diff --git a/monitor/qmp.c b/monitor/qmp.c
index 2326bd7f9b..55cfb230d9 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -44,6 +44,7 @@ struct QMPRequest {
     Error *err;
 };
 typedef struct QMPRequest QMPRequest;
+static void monitor_qmp_set_handlers_bh(void *opaque);
 
 QmpCommandList qmp_commands, qmp_cap_negotiation_commands;
 
@@ -480,7 +481,35 @@ void monitor_data_destroy_qmp(MonitorQMP *mon)
     g_queue_free(mon->qmp_requests);
 }
 
-static void monitor_qmp_setup_handlers_bh(void *opaque)
+static int monitor_qmp_change(void *opaque)
+{
+    MonitorQMP *mon = opaque;
+
+    mon->common.use_io_thread =
+        qemu_chr_has_feature(mon->common.chr.chr, QEMU_CHAR_FEATURE_GCONTEXT);
+
+    if (mon->common.use_io_thread) {
+        aio_bh_schedule_oneshot(iothread_get_aio_context(mon_iothread),
+                                monitor_qmp_set_handlers_bh, mon);
+    } else {
+        qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
+                                 monitor_qmp_read, monitor_qmp_event,
+                                 monitor_qmp_change, &mon->common, NULL, true);
+    }
+
+    if (mon->common.out_watch) {
+        g_source_remove(mon->common.out_watch);
+        qemu_mutex_lock(&mon->common.mon_lock);
+        mon->common.out_watch =
+        qemu_chr_fe_add_watch(&mon->common.chr, G_IO_OUT | G_IO_HUP,
+                               monitor_unblocked, &mon->common);
+        qemu_mutex_unlock(&mon->common.mon_lock);
+    }
+
+    return 0;
+}
+
+static void monitor_qmp_set_handlers_bh(void *opaque)
 {
     MonitorQMP *mon = opaque;
     GMainContext *context;
@@ -490,7 +519,14 @@ static void monitor_qmp_setup_handlers_bh(void *opaque)
     assert(context);
     qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
                              monitor_qmp_read, monitor_qmp_event,
-                             NULL, &mon->common, context, true);
+                             monitor_qmp_change, &mon->common, context, true);
+
+}
+
+static void monitor_qmp_setup_handlers_bh(void *opaque)
+{
+    MonitorQMP *mon = opaque;
+    monitor_qmp_set_handlers_bh(mon);
     monitor_list_append(&mon->common);
 }
 
@@ -531,7 +567,7 @@ void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
     } else {
         qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
                                  monitor_qmp_read, monitor_qmp_event,
-                                 NULL, &mon->common, NULL, true);
+                                 monitor_qmp_change, &mon->common, NULL, true);
         monitor_list_append(&mon->common);
     }
 }
-- 
2.25.1



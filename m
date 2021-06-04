Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A347639BBB6
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 17:23:03 +0200 (CEST)
Received: from localhost ([::1]:40820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpBf4-0004ff-Ns
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 11:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lpBaC-00089t-9v; Fri, 04 Jun 2021 11:18:00 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:37378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lpBaA-0008IQ-F6; Fri, 04 Jun 2021 11:17:59 -0400
Received: by mail-ed1-x535.google.com with SMTP id b11so11595020edy.4;
 Fri, 04 Jun 2021 08:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oFqBe5Si9TWJa68gmcXzEchOG2Rmu1HDBWLCVFaVceg=;
 b=q3ROnY16FFDc3CiWg4wwZm67FAHLU+Mt+vKIuCcgvXPxHHLKRB4NoYdVTVsbvHxLGH
 sdCw4Dtif5FO2B/vsP1bdjxxILgQOLxRXmq6vooUoH61aSsE2B8k0z7IVZwzGajHuQgy
 bpecPeJVih/YliYeDqQfM7EREABwSj1+R1alXWDPQvRvXxHhAfh1rFZOvQCN/CMSQkDQ
 8D0hB2jZXQ4/Wyk+Ly/hlUEHly9A4X4DVRx0eg1faY8Jhi7Je5GVrhQGzEIIecWjvz4s
 yEbxnzT3cZajVedyor8dmz/nkIzWkdBDzEs+/eVKhTB8kMvYyE7YwX4sBO//PmvQRl8z
 souQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oFqBe5Si9TWJa68gmcXzEchOG2Rmu1HDBWLCVFaVceg=;
 b=MXFSneciv7/1JqhnFJt0qCdRhVYE+1iRdxVSJdoko07F3zkcqk3VN/m2Jocz4RoV3u
 KBRCEa/a/qTXwOP0EIEceQ/gDJX2IdUS8GXGwEOsAcV0wMlgEyfbMc+5vSXmRE/+I2p1
 ikjjAeuSnbSzMT9K/1t4BmfBoTL95nbAv+/qIuQelVWQiae1takmCCoHh0SPkT5SCaFj
 aMf8sNrIfl5bqjEGYxEepuR9LDS3IhwJZWPtI/iXs7WBoOaXsc75K1kyCw4d/wRuPrua
 JOP95RcGeP14GW9UW8+2nFbxstq86e2VgfSsR0tiFps9SQqeHPmYzTfTpEgX0LfHenUS
 obKg==
X-Gm-Message-State: AOAM5305wslCVCdeQ2ZtomYsOLAzmIPSb3gIJW6LeKOwOX60/0EA1tu/
 dAnlz9Hpa+yViPY9m/75JcaHMfLTzTJR4w==
X-Google-Smtp-Source: ABdhPJywkkZsEzm9G0kd/HMX7xZBgN8bm/QKEHY5AHFzrVio6ppN6IBM0kHQYx90pOSNVdo3FAA6ZQ==
X-Received: by 2002:a05:6402:b17:: with SMTP id
 bm23mr5165308edb.236.1622819876729; 
 Fri, 04 Jun 2021 08:17:56 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 w1sm2402451eds.37.2021.06.04.08.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:17:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/13] vl: plumb keyval-based options into -readconfig
Date: Fri,  4 Jun 2021 17:17:44 +0200
Message-Id: <20210604151745.310318-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604151745.310318-1-pbonzini@redhat.com>
References: <20210604151745.310318-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let -readconfig support parsing command line options into QDict or
QemuOpts.  This will be used to add back support for objects in
-readconfig.

Cc: Markus Armbruster <armbru@redhat.com>
Cc: qemu-stable@nongnu.org
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210524105752.3318299-3-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/block/qdict.h    |  2 -
 include/qapi/qmp/qdict.h |  3 ++
 softmmu/vl.c             | 83 ++++++++++++++++++++++++++++------------
 3 files changed, 62 insertions(+), 26 deletions(-)

diff --git a/include/block/qdict.h b/include/block/qdict.h
index d8cb502d7d..ced2acfb92 100644
--- a/include/block/qdict.h
+++ b/include/block/qdict.h
@@ -20,8 +20,6 @@ void qdict_join(QDict *dest, QDict *src, bool overwrite);
 void qdict_extract_subqdict(QDict *src, QDict **dst, const char *start);
 void qdict_array_split(QDict *src, QList **dst);
 int qdict_array_entries(QDict *src, const char *subqdict);
-QObject *qdict_crumple(const QDict *src, Error **errp);
-void qdict_flatten(QDict *qdict);
 
 typedef struct QDictRenames {
     const char *from;
diff --git a/include/qapi/qmp/qdict.h b/include/qapi/qmp/qdict.h
index 9934539c1b..d5b5430e21 100644
--- a/include/qapi/qmp/qdict.h
+++ b/include/qapi/qmp/qdict.h
@@ -64,4 +64,7 @@ const char *qdict_get_try_str(const QDict *qdict, const char *key);
 
 QDict *qdict_clone_shallow(const QDict *src);
 
+QObject *qdict_crumple(const QDict *src, Error **errp);
+void qdict_flatten(QDict *qdict);
+
 #endif /* QDICT_H */
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 47dfdd704f..5e8240b9d8 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -121,6 +121,7 @@
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-visit-qom.h"
 #include "qapi/qapi-commands-ui.h"
+#include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
 #include "sysemu/iothread.h"
 #include "qemu/guest-random.h"
@@ -2127,13 +2128,53 @@ static int global_init_func(void *opaque, QemuOpts *opts, Error **errp)
     return 0;
 }
 
+/*
+ * Return whether configuration group @group is stored in QemuOpts, or
+ * recorded as one or more QDicts by qemu_record_config_group.
+ */
+static bool is_qemuopts_group(const char *group)
+{
+    return true;
+}
+
+static void qemu_record_config_group(const char *group, QDict *dict,
+                                     bool from_json, Error **errp)
+{
+    abort();
+}
+
+/*
+ * Parse non-QemuOpts config file groups, pass the rest to
+ * qemu_config_do_parse.
+ */
+static void qemu_parse_config_group(const char *group, QDict *qdict,
+                                    void *opaque, Error **errp)
+{
+    QObject *crumpled;
+    if (is_qemuopts_group(group)) {
+        qemu_config_do_parse(group, qdict, opaque, errp);
+        return;
+    }
+
+    crumpled = qdict_crumple(qdict, errp);
+    if (!crumpled) {
+        return;
+    }
+    if (qobject_type(crumpled) != QTYPE_QDICT) {
+        assert(qobject_type(crumpled) == QTYPE_QLIST);
+        error_setg(errp, "Lists cannot be at top level of a configuration section");
+        return;
+    }
+    qemu_record_config_group(group, qobject_to(QDict, crumpled), false, errp);
+}
+
 static void qemu_read_default_config_file(Error **errp)
 {
     ERRP_GUARD();
     int ret;
     g_autofree char *file = get_relocated_path(CONFIG_QEMU_CONFDIR "/qemu.conf");
 
-    ret = qemu_read_config_file(file, qemu_config_do_parse, errp);
+    ret = qemu_read_config_file(file, qemu_parse_config_group, errp);
     if (ret < 0) {
         if (ret == -ENOENT) {
             error_free(*errp);
@@ -2142,9 +2183,8 @@ static void qemu_read_default_config_file(Error **errp)
     }
 }
 
-static int qemu_set_option(const char *str)
+static void qemu_set_option(const char *str, Error **errp)
 {
-    Error *local_err = NULL;
     char group[64], id[64], arg[64];
     QemuOptsList *list;
     QemuOpts *opts;
@@ -2152,27 +2192,23 @@ static int qemu_set_option(const char *str)
 
     rc = sscanf(str, "%63[^.].%63[^.].%63[^=]%n", group, id, arg, &offset);
     if (rc < 3 || str[offset] != '=') {
-        error_report("can't parse: \"%s\"", str);
-        return -1;
-    }
-
-    list = qemu_find_opts(group);
-    if (list == NULL) {
-        return -1;
-    }
-
-    opts = qemu_opts_find(list, id);
-    if (!opts) {
-        error_report("there is no %s \"%s\" defined",
-                     list->name, id);
-        return -1;
+        error_setg(errp, "can't parse: \"%s\"", str);
+        return;
     }
 
-    if (!qemu_opt_set(opts, arg, str + offset + 1, &local_err)) {
-        error_report_err(local_err);
-        return -1;
+    if (!is_qemuopts_group(group)) {
+        error_setg(errp, "-set is not supported with %s", group);
+    } else {
+        list = qemu_find_opts_err(group, errp);
+        if (list) {
+            opts = qemu_opts_find(list, id);
+            if (!opts) {
+                error_setg(errp, "there is no %s \"%s\" defined", group, id);
+                return;
+            }
+            qemu_opt_set(opts, arg, str + offset + 1, errp);
+        }
     }
-    return 0;
 }
 
 static void user_register_global_props(void)
@@ -2766,8 +2802,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 }
                 break;
             case QEMU_OPTION_set:
-                if (qemu_set_option(optarg) != 0)
-                    exit(1);
+                qemu_set_option(optarg, &error_fatal);
                 break;
             case QEMU_OPTION_global:
                 if (qemu_global_option(optarg) != 0)
@@ -3399,7 +3434,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 qemu_plugin_opt_parse(optarg, &plugin_list);
                 break;
             case QEMU_OPTION_readconfig:
-                qemu_read_config_file(optarg, qemu_config_do_parse, &error_fatal);
+                qemu_read_config_file(optarg, qemu_parse_config_group, &error_fatal);
                 break;
             case QEMU_OPTION_spice:
                 olist = qemu_find_opts_err("spice", NULL);
-- 
2.31.1




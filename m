Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD17E4EF1D7
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 16:42:09 +0200 (CEST)
Received: from localhost ([::1]:54930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naITY-0002sx-QG
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 10:42:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1naIRO-0008Rn-FQ
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:39:54 -0400
Received: from [2a00:1450:4864:20::133] (port=36558
 helo=mail-lf1-x133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1naIRL-0002FH-Ee
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:39:54 -0400
Received: by mail-lf1-x133.google.com with SMTP id bt26so5346460lfb.3
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 07:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0+UKqiDGggpKxUYH7xTbFYhC/SqpSUsoPwnyAHiw3tY=;
 b=mY0c+Yi/5fn1eHg+lphA2o1vqw6oSOAiM7ZGDtWdr2hpYlOKAaz3eURzkTiI4yWVvZ
 BE15vpt+spJczB3Gx4DQe6+GZcIPcKaAOSkD3Ols/qPKp1CX3PqfCkrQqLLQBwmTifzx
 6GcX5Eq43H5/BQOBYcN+DG1IvIaGr9MRSj2w8ffo3PCYWj9NRqrsYc+bu4+4fRcv6Peo
 3XjhNbAoVa48pu2j5uV8S0wvQLRY6KjL6Fv8z9gF4PzXpKgWHtN2fHmbQRXe1h3sAxol
 1FbzdwoB08dA53y9Tcc0ny0CRBqxB5deEJ8l9LgHrVWuYMQWsMnkL0evk7YnQ9gWC8M0
 Azcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0+UKqiDGggpKxUYH7xTbFYhC/SqpSUsoPwnyAHiw3tY=;
 b=GTMPGDYXKiN5VHN94siXsqccvdIsAH52hVKFocxWIHyCScvI2cGytci5pa+8GGG2md
 XM2qWyqk/oLZctBL+5hEgBYAW9u053UDt8je3imuP/06w36103fHZ2ZqpE5iJLb6hQji
 9GOwO+t0wov3ht3z3EIb2EIBZYnhCLYX7d4QNR8T99UjsIol66sugtSrRf0B6ffdsxO2
 v1RR9ELHsLLWHLvyj0bjqwd5BOBJbfCIcwOeW7XloTk1lsG9P8fzrqNL6dd32WbVz/sS
 tuG738/dMZtvY9U2/NoUSu8ERd3mH4qQa2XHe4wjU0A4Mj856zIH4IkvnDPfwBDq8akx
 Rhtw==
X-Gm-Message-State: AOAM531byHN+gMvnKPxfiKI7Uss5ZCUkwso9qLrt6jwmqyNmYtDg7D+L
 nWWFnoLeISoxew6kEMFLIOHlzKISIdF2Wg==
X-Google-Smtp-Source: ABdhPJz8w+t16kj3P5CHN4TA+rNEXd06rmUZVxuyIFSa+pOiGttrRhJPh7xIuezxW4rWqACijaMOvQ==
X-Received: by 2002:a05:6512:3f1b:b0:448:92d7:8952 with SMTP id
 y27-20020a0565123f1b00b0044892d78952mr14196793lfa.183.1648823989748; 
 Fri, 01 Apr 2022 07:39:49 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a2eb003000000b0024afe02da7asm215554ljk.22.2022.04.01.07.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 07:39:49 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/3] qapi/ui: add 'display-update' command for changing
 listen address
Date: Fri,  1 Apr 2022 17:39:35 +0300
Message-Id: <20220401143936.356460-3-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401143936.356460-1-vsementsov@openvz.org>
References: <20220401143936.356460-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::133
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x133.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: v.sementsov-og@mail.ru, berrange@redhat.com, bleal@redhat.com,
 armbru@redhat.com, wainersm@redhat.com, f4bug@amsat.org, vsementsov@openvz.org,
 kraxel@redhat.com, crosa@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add possibility to change addresses where VNC server listens for new
connections. Prior to 6.0 this functionality was available through
'change' qmp command which was deleted.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/about/removed-features.rst |  3 +-
 qapi/ui.json                    | 65 +++++++++++++++++++++++++++++++++
 include/ui/console.h            |  1 +
 monitor/qmp-cmds.c              | 15 ++++++++
 ui/vnc.c                        | 23 ++++++++++++
 5 files changed, 106 insertions(+), 1 deletion(-)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 4b831ea291..b367418ca7 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -355,7 +355,8 @@ documentation of ``query-hotpluggable-cpus`` for additional details.
 ``change`` (removed in 6.0)
 '''''''''''''''''''''''''''
 
-Use ``blockdev-change-medium`` or ``change-vnc-password`` instead.
+Use ``blockdev-change-medium`` or ``change-vnc-password`` or
+``display-update`` instead.
 
 ``query-events`` (removed in 6.0)
 '''''''''''''''''''''''''''''''''
diff --git a/qapi/ui.json b/qapi/ui.json
index a810ed680c..d3bf9e72de 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1447,3 +1447,68 @@
 { 'command': 'display-reload',
   'data': 'DisplayReloadOptions',
   'boxed' : true }
+
+##
+# @DisplayUpdateType:
+#
+# Available DisplayUpdate types.
+#
+# @vnc: VNC display
+#
+# Since: 7.1
+#
+##
+{ 'enum': 'DisplayUpdateType',
+  'data': ['vnc'] }
+
+##
+# @DisplayUpdateOptionsVNC:
+#
+# Specify the VNC reload options.
+#
+# @addresses: If specified, change set of addresses
+#             to listen for connections. Addresses configured
+#             for websockets are not touched.
+#
+# Since: 7.1
+#
+##
+{ 'struct': 'DisplayUpdateOptionsVNC',
+  'data': { '*addresses': ['SocketAddress'] } }
+
+##
+# @DisplayUpdateOptions:
+#
+# Options of the display configuration reload.
+#
+# @type: Specify the display type.
+#
+# Since: 7.1
+#
+##
+{ 'union': 'DisplayUpdateOptions',
+  'base': {'type': 'DisplayUpdateType'},
+  'discriminator': 'type',
+  'data': { 'vnc': 'DisplayUpdateOptionsVNC' } }
+
+##
+# @display-update:
+#
+# Update display configuration.
+#
+# Returns: Nothing on success.
+#
+# Since: 7.1
+#
+# Example:
+#
+# -> { "execute": "display-update",
+#      "arguments": { "type": "vnc", "addresses":
+#                     [ { "type": "inet", "host": "0.0.0.0",
+#                         "port": "5901" } ] } }
+# <- { "return": {} }
+#
+##
+{ 'command': 'display-update',
+  'data': 'DisplayUpdateOptions',
+  'boxed' : true }
diff --git a/include/ui/console.h b/include/ui/console.h
index 0f84861933..c44b28a972 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -518,6 +518,7 @@ int vnc_display_pw_expire(const char *id, time_t expires);
 void vnc_parse(const char *str);
 int vnc_init_func(void *opaque, QemuOpts *opts, Error **errp);
 bool vnc_display_reload_certs(const char *id,  Error **errp);
+bool vnc_display_update(DisplayUpdateOptionsVNC *arg, Error **errp);
 
 /* input.c */
 int index_from_key(const char *key, size_t key_length);
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 0b04855ce8..22aa91cc8d 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -347,6 +347,21 @@ void qmp_display_reload(DisplayReloadOptions *arg, Error **errp)
     }
 }
 
+void qmp_display_update(DisplayUpdateOptions *arg, Error **errp)
+{
+    switch (arg->type) {
+    case DISPLAY_UPDATE_TYPE_VNC:
+#ifdef CONFIG_VNC
+        vnc_display_update(&arg->u.vnc, errp);
+#else
+        error_setg(errp, "vnc is invalid, missing 'CONFIG_VNC'");
+#endif
+        break;
+    default:
+        abort();
+    }
+}
+
 static int qmp_x_query_rdma_foreach(Object *obj, void *opaque)
 {
     RdmaProvider *rdma;
diff --git a/ui/vnc.c b/ui/vnc.c
index 57cbf18ce6..ead85d1794 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -3981,6 +3981,29 @@ static int vnc_display_listen(VncDisplay *vd,
     return 0;
 }
 
+bool vnc_display_update(DisplayUpdateOptionsVNC *arg, Error **errp)
+{
+    VncDisplay *vd = vnc_display_find(NULL);
+
+    if (!vd) {
+        error_setg(errp, "Can not find vnc display");
+        return false;
+    }
+
+    if (arg->has_addresses) {
+        if (vd->listener) {
+            qio_net_listener_disconnect(vd->listener);
+            object_unref(OBJECT(vd->listener));
+            vd->listener = NULL;
+        }
+
+        if (vnc_display_listen(vd, arg->addresses, NULL, errp) < 0) {
+            return false;
+        }
+    }
+
+    return true;
+}
 
 void vnc_display_open(const char *id, Error **errp)
 {
-- 
2.35.1



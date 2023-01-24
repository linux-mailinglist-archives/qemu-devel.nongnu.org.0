Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ED56797CD
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 13:22:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKIIf-0002WD-KN; Tue, 24 Jan 2023 07:21:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pKIHT-0001yB-Nb
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 07:20:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pKIHL-0006Qw-4k
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 07:20:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674562794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5YwC4VtXdejT4xi8AfvsT3t0+khiUy2LLRnM+K7/1EU=;
 b=LQ02aoOqEs22PyVLgfszeXfjsrUK4PHxTBrbi1iFpWylXy3i4EwksI8A+bx3su7wvc36UP
 Kgn9NBGpoCS5KPZmbbJVRZ7HNsVszUq8fdNLhIOnAbP+l1Q8RhDoCbqxlZWD+C9Z1T4cDZ
 CL5zrc+xSuv76mOAU1GHlSj6wQh9Jto=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-CtHZSdq6Oz2C2FXPERqlhQ-1; Tue, 24 Jan 2023 07:19:50 -0500
X-MC-Unique: CtHZSdq6Oz2C2FXPERqlhQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC6EB29DD990;
 Tue, 24 Jan 2023 12:19:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 57E8653A0;
 Tue, 24 Jan 2023 12:19:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AB97521E6915; Tue, 24 Jan 2023 13:19:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, kraxel@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, marcandre.lureau@redhat.com, dgilbert@redhat.com,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 jasowang@redhat.com, jiri@resnulli.us, berrange@redhat.com,
 thuth@redhat.com, quintela@redhat.com, stefanb@linux.vnet.ibm.com,
 stefanha@redhat.com, kvm@vger.kernel.org, qemu-block@nongnu.org
Subject: [PATCH 14/32] hmp: Rewrite strlist_from_comma_list() as
 hmp_split_at_comma()
Date: Tue, 24 Jan 2023 13:19:28 +0100
Message-Id: <20230124121946.1139465-15-armbru@redhat.com>
In-Reply-To: <20230124121946.1139465-1-armbru@redhat.com>
References: <20230124121946.1139465-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Use g_strsplit() for the actual splitting.  Give external linkage, so
the next commit can move one of its users to another source file.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/monitor/hmp.h |  1 +
 monitor/hmp-cmds.c    | 27 ++++++++++-----------------
 2 files changed, 11 insertions(+), 17 deletions(-)

diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 6fafa7ffb4..d60d1305b8 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -19,6 +19,7 @@
 
 bool hmp_handle_error(Monitor *mon, Error *err);
 void hmp_help_cmd(Monitor *mon, const char *name);
+strList *hmp_split_at_comma(const char *str);
 
 void hmp_info_name(Monitor *mon, const QDict *qdict);
 void hmp_info_version(Monitor *mon, const QDict *qdict);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index edb50da1ff..2ca869c2ee 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -54,28 +54,21 @@ bool hmp_handle_error(Monitor *mon, Error *err)
 }
 
 /*
- * Produce a strList from a comma separated list.
- * A NULL or empty input string return NULL.
+ * Split @str at comma.
+ * A null @str defaults to "".
  */
-static strList *strList_from_comma_list(const char *in)
+strList *hmp_split_at_comma(const char *str)
 {
+    char **split = g_strsplit(str ?: "", ",", -1);
     strList *res = NULL;
     strList **tail = &res;
+    int i;
 
-    while (in && in[0]) {
-        char *comma = strchr(in, ',');
-        char *value;
-
-        if (comma) {
-            value = g_strndup(in, comma - in);
-            in = comma + 1; /* skip the , */
-        } else {
-            value = g_strdup(in);
-            in = NULL;
-        }
-        QAPI_LIST_APPEND(tail, value);
+    for (i = 0; split[i]; i++) {
+        QAPI_LIST_APPEND(tail, split[i]);
     }
 
+    g_free(split);
     return res;
 }
 
@@ -632,7 +625,7 @@ void hmp_announce_self(Monitor *mon, const QDict *qdict)
                                             migrate_announce_params());
 
     qapi_free_strList(params->interfaces);
-    params->interfaces = strList_from_comma_list(interfaces_str);
+    params->interfaces = hmp_split_at_comma(interfaces_str);
     params->has_interfaces = params->interfaces != NULL;
     params->id = g_strdup(id);
     qmp_announce_self(params, NULL);
@@ -1234,7 +1227,7 @@ static StatsFilter *stats_filter(StatsTarget target, const char *names,
             request->provider = provider_idx;
             if (names && !g_str_equal(names, "*")) {
                 request->has_names = true;
-                request->names = strList_from_comma_list(names);
+                request->names = hmp_split_at_comma(names);
             }
             QAPI_LIST_PREPEND(request_list, request);
         }
-- 
2.39.0



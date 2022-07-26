Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB565817F6
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 18:54:09 +0200 (CEST)
Received: from localhost ([::1]:36498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGNou-0006Wa-P3
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 12:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9z-0003D1-Cc
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:51 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:9684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9x-0006CC-0m
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:51 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QFn0WL031705;
 Tue, 26 Jul 2022 16:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=o18BApzijf1mfH2fl19ONXWdJYodCvNV0zGfIkHl45A=;
 b=Jn3qBSafILCWd0JgF3RupmP4yS3lGWiIE16AoOeHugF0JG0i+rapaZTJGVn/GYjGLvU/
 7Mo0QzqeL62tBu2wEjv92g/2gMdtgj8jzVEDzVLqXyyQdFZG3ZkuyeUvHlY5J7d+97Sl
 4mMHtQxz0WzznEINqxVFwAL5hpN2iB2QKbWwOmif+OzBMYbtn8owwZPx9WmRSkVUa0UF
 LMD54wdFjl0p8kSeyI5awnq3uylHIbqa7lh/LxYpB6uGEqmBTfZwMKZGUmXbDymTOh0g
 4LgmFg91zqtKyyy2J7b6Hb6DUE4SZo0P46/vpV8DCEaCdlU/pAf2lR51+cHj4CrBAomn qw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg9a4q19q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:04 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26QEplHD006291; Tue, 26 Jul 2022 16:11:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh65bq1ke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:02 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QG5uSV023334;
 Tue, 26 Jul 2022 16:11:01 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3hh65bq0y5-12; Tue, 26 Jul 2022 16:11:01 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Peng Liang <tcx4c70@gmail.com>
Subject: [PATCH V9 11/46] qapi: strList_from_string
Date: Tue, 26 Jul 2022 09:10:08 -0700
Message-Id: <1658851843-236870-12-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
References: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_04,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207260063
X-Proofpoint-ORIG-GUID: S_dHIjZyff2pn1lgxwxOsIZ4DUIX04Qi
X-Proofpoint-GUID: S_dHIjZyff2pn1lgxwxOsIZ4DUIX04Qi
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Generalize strList_from_comma_list() to take any delimiter character, rename
as strList_from_string(), and move it to qapi/util.c.

No functional change.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/qapi/util.h |  9 +++++++++
 monitor/hmp-cmds.c  | 31 +++----------------------------
 qapi/qapi-util.c    | 23 +++++++++++++++++++++++
 3 files changed, 35 insertions(+), 28 deletions(-)

diff --git a/include/qapi/util.h b/include/qapi/util.h
index 81a2b13..7d88b09 100644
--- a/include/qapi/util.h
+++ b/include/qapi/util.h
@@ -22,6 +22,8 @@ typedef struct QEnumLookup {
     const int size;
 } QEnumLookup;
 
+struct strList;
+
 const char *qapi_enum_lookup(const QEnumLookup *lookup, int val);
 int qapi_enum_parse(const QEnumLookup *lookup, const char *buf,
                     int def, Error **errp);
@@ -31,6 +33,13 @@ bool qapi_bool_parse(const char *name, const char *value, bool *obj,
 int parse_qapi_name(const char *name, bool complete);
 
 /*
+ * Produce a strList from the character delimited string @in.
+ * All strings are g_strdup'd.
+ * A NULL or empty input string returns NULL.
+ */
+struct strList *strList_from_string(const char *in, char delim);
+
+/*
  * For any GenericList @list, insert @element at the front.
  *
  * Note that this macro evaluates @element exactly once, so it is safe
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 6632ada..a394526 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -43,6 +43,7 @@
 #include "qapi/qapi-commands-stats.h"
 #include "qapi/qapi-commands-tpm.h"
 #include "qapi/qapi-commands-ui.h"
+#include "qapi/util.h"
 #include "qapi/qapi-visit-net.h"
 #include "qapi/qapi-visit-migration.h"
 #include "qapi/qmp/qdict.h"
@@ -71,32 +72,6 @@ bool hmp_handle_error(Monitor *mon, Error *err)
     return false;
 }
 
-/*
- * Produce a strList from a comma separated list.
- * A NULL or empty input string return NULL.
- */
-static strList *strList_from_comma_list(const char *in)
-{
-    strList *res = NULL;
-    strList **tail = &res;
-
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
-    }
-
-    return res;
-}
-
 void hmp_info_name(Monitor *mon, const QDict *qdict)
 {
     NameInfo *info;
@@ -1125,7 +1100,7 @@ void hmp_announce_self(Monitor *mon, const QDict *qdict)
                                             migrate_announce_params());
 
     qapi_free_strList(params->interfaces);
-    params->interfaces = strList_from_comma_list(interfaces_str);
+    params->interfaces = strList_from_string(interfaces_str, ',');
     params->has_interfaces = params->interfaces != NULL;
     params->id = g_strdup(id);
     params->has_id = !!params->id;
@@ -2409,7 +2384,7 @@ static StatsFilter *stats_filter(StatsTarget target, const char *names,
             request->provider = provider_idx;
             if (names && !g_str_equal(names, "*")) {
                 request->has_names = true;
-                request->names = strList_from_comma_list(names);
+                request->names = strList_from_string(names, ',');
             }
             QAPI_LIST_PREPEND(request_list, request);
         }
diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c
index 63596e1..b61c73c 100644
--- a/qapi/qapi-util.c
+++ b/qapi/qapi-util.c
@@ -15,6 +15,7 @@
 #include "qapi/error.h"
 #include "qemu/ctype.h"
 #include "qapi/qmp/qerror.h"
+#include "qapi/qapi-builtin-types.h"
 
 CompatPolicy compat_policy;
 
@@ -152,3 +153,25 @@ int parse_qapi_name(const char *str, bool complete)
     }
     return p - str;
 }
+
+strList *strList_from_string(const char *in, char delim)
+{
+    strList *res = NULL;
+    strList **tail = &res;
+
+    while (in && in[0]) {
+        char *next = strchr(in, delim);
+        char *value;
+
+        if (next) {
+            value = g_strndup(in, next - in);
+            in = next + 1; /* skip the delim */
+        } else {
+            value = g_strdup(in);
+            in = NULL;
+        }
+        QAPI_LIST_APPEND(tail, value);
+    }
+
+    return res;
+}
-- 
1.8.3.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B653568E07D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 19:49:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPT1p-0003Ky-U5; Tue, 07 Feb 2023 13:49:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPT1W-0003Cj-Bi
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:49:02 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPT1T-00018U-Ko
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:48:58 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 317Gntc9000479; Tue, 7 Feb 2023 18:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=QWmIgT4dGHA58bYDOsY6h8HfoS6Afh3cx1vVMSU3nCk=;
 b=rVSyyL04Ma+r6tGFj1rkRIyKRqnf4fAERtr5XIlAhIGh6D8VHWraGrx2UHilgdBu0ogT
 gstXicAYqqzAC6Nai4xBkR1c6xCcNSHwvAjNc1ePrMWl91/DYI2zcrQLlcxdE+MSjCCn
 LuAdZTWiBJn09AJjfMuTxNAxMBdrYkdsNSkot3l+Idb9uvtgobWlpN8qQ5wk+IR9M4xk
 KBwavhjGZjbfUzwTDxSFGS/Ni8CcgjM1y2BylokMwIXC1M5oQvYU7WvNivg4CTwB7YnG
 JcRdsCwsgmIYG0yZsWLFeagewrC3gaqklzdenMVmN/O09m4EukEkQT+cnLpxUb//Fcbz nQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhdy16d6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 18:48:51 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 317I0iAJ028720; Tue, 7 Feb 2023 18:48:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nhdtd3rf1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 18:48:50 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 317Im35U033516;
 Tue, 7 Feb 2023 18:48:49 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with
 ESMTP id 3nhdtd3rdm-2; Tue, 07 Feb 2023 18:48:49 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Steve Sistare <steven.sistare@oracle.com>
Subject: [PATCH V2 1/4] qapi: strList_from_string
Date: Tue,  7 Feb 2023 10:48:44 -0800
Message-Id: <1675795727-235010-2-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1675795727-235010-1-git-send-email-steven.sistare@oracle.com>
References: <1675795727-235010-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_11,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070167
X-Proofpoint-GUID: KKCeLnoRfQRNuZ9arxCfWrbQ1Ae5ZkTe
X-Proofpoint-ORIG-GUID: KKCeLnoRfQRNuZ9arxCfWrbQ1Ae5ZkTe
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Generalize hmp_split_at_comma() to take any delimiter character, rename
as strList_from_string(), and move it to qapi/util.c.

No functional change.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/monitor/hmp.h  |  1 -
 include/qapi/util.h    |  9 +++++++++
 monitor/hmp-cmds.c     | 19 -------------------
 net/net-hmp-cmds.c     |  2 +-
 qapi/qapi-util.c       | 23 +++++++++++++++++++++++
 stats/stats-hmp-cmds.c |  2 +-
 6 files changed, 34 insertions(+), 22 deletions(-)

diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 2220f14..e80848f 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -19,7 +19,6 @@
 
 bool hmp_handle_error(Monitor *mon, Error *err);
 void hmp_help_cmd(Monitor *mon, const char *name);
-strList *hmp_split_at_comma(const char *str);
 
 void hmp_info_name(Monitor *mon, const QDict *qdict);
 void hmp_info_version(Monitor *mon, const QDict *qdict);
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
index 34bd8c6..9665e6e 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -39,25 +39,6 @@ bool hmp_handle_error(Monitor *mon, Error *err)
     return false;
 }
 
-/*
- * Split @str at comma.
- * A null @str defaults to "".
- */
-strList *hmp_split_at_comma(const char *str)
-{
-    char **split = g_strsplit(str ?: "", ",", -1);
-    strList *res = NULL;
-    strList **tail = &res;
-    int i;
-
-    for (i = 0; split[i]; i++) {
-        QAPI_LIST_APPEND(tail, split[i]);
-    }
-
-    g_free(split);
-    return res;
-}
-
 void hmp_info_name(Monitor *mon, const QDict *qdict)
 {
     NameInfo *info;
diff --git a/net/net-hmp-cmds.c b/net/net-hmp-cmds.c
index 41d326b..30422d9 100644
--- a/net/net-hmp-cmds.c
+++ b/net/net-hmp-cmds.c
@@ -72,7 +72,7 @@ void hmp_announce_self(Monitor *mon, const QDict *qdict)
                                             migrate_announce_params());
 
     qapi_free_strList(params->interfaces);
-    params->interfaces = hmp_split_at_comma(interfaces_str);
+    params->interfaces = strList_from_string(interfaces_str, ',');
     params->has_interfaces = params->interfaces != NULL;
     params->id = g_strdup(id);
     qmp_announce_self(params, NULL);
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
diff --git a/stats/stats-hmp-cmds.c b/stats/stats-hmp-cmds.c
index 531e35d..4a2adf8 100644
--- a/stats/stats-hmp-cmds.c
+++ b/stats/stats-hmp-cmds.c
@@ -174,7 +174,7 @@ static StatsFilter *stats_filter(StatsTarget target, const char *names,
             request->provider = provider_idx;
             if (names && !g_str_equal(names, "*")) {
                 request->has_names = true;
-                request->names = hmp_split_at_comma(names);
+                request->names = strList_from_string(names, ',');
             }
             QAPI_LIST_PREPEND(request_list, request);
         }
-- 
1.8.3.1



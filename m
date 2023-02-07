Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DE568E082
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 19:50:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPT1r-0003O6-0h; Tue, 07 Feb 2023 13:49:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPT1Y-0003D5-2m
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:49:04 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPT1U-00018Y-KS
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:48:59 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 317Gmqtb022928; Tue, 7 Feb 2023 18:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2022-7-12;
 bh=uIzEGC0jXaqPYoVhdVCmhjj6OWp+ypUWq6WHLdseACM=;
 b=RDb+BtelDxxbjN9j1X6AJz9vA94lWxss1LBjVR7wGHuWEgecFT14fdms25PF3vrtnsVp
 BVY4x7++nxxMI3XyD+52rebLM4IrYx+mA0LlzQFF7SHVFFvrhJEhKynkcOV6Qp3+kPrA
 m2zC1rHTCifIj7ZUXny3ExdjLOO4qscSw92+LPCpV4WvTQJOwJ3nLwtnLGPa6RWnyQLy
 yI7R+ZwxnEENUhkwMqwGZlhFjzPTuNW4Ne8vqLk0QAgKB0R6EuKPYBC1B/ML74tpMLfl
 vH9+82B7RJb/A0lfA1hSsp1nJqR1Y+Xr50ZnflckCfIuMcYE32+5nYFl8gwdKzbD9ILr iQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nheytxds1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 18:48:53 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 317I0cp8028808; Tue, 7 Feb 2023 18:48:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nhdtd3rge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 18:48:52 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 317Im35Y033516;
 Tue, 7 Feb 2023 18:48:52 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with
 ESMTP id 3nhdtd3rdm-4; Tue, 07 Feb 2023 18:48:51 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Steve Sistare <steven.sistare@oracle.com>
Subject: [PATCH V2 3/4] qapi: strv_from_strList
Date: Tue,  7 Feb 2023 10:48:46 -0800
Message-Id: <1675795727-235010-4-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1675795727-235010-1-git-send-email-steven.sistare@oracle.com>
References: <1675795727-235010-1-git-send-email-steven.sistare@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_11,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070167
X-Proofpoint-GUID: r7Mcia0PsnZ5DvZuZQlxY0LlX2bijY1Q
X-Proofpoint-ORIG-GUID: r7Mcia0PsnZ5DvZuZQlxY0LlX2bijY1Q
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
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

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qapi/util.h |  6 ++++++
 qapi/qapi-util.c    | 14 ++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/qapi/util.h b/include/qapi/util.h
index 75dddca..51ff64e 100644
--- a/include/qapi/util.h
+++ b/include/qapi/util.h
@@ -33,6 +33,12 @@ bool qapi_bool_parse(const char *name, const char *value, bool *obj,
 int parse_qapi_name(const char *name, bool complete);
 
 /*
+ * Produce and return a NULL-terminated array of strings from @args.
+ * All strings are g_strdup'd.
+ */
+GStrv strv_from_strList(const struct strList *args);
+
+/*
  * Produce a strList from the character delimited string @in.
  * All strings are g_strdup'd.
  * A NULL or empty input string returns NULL.
diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c
index b61c73c..fe6bda2 100644
--- a/qapi/qapi-util.c
+++ b/qapi/qapi-util.c
@@ -154,6 +154,20 @@ int parse_qapi_name(const char *str, bool complete)
     return p - str;
 }
 
+GStrv strv_from_strList(const strList *args)
+{
+    const strList *arg;
+    int i = 0;
+    GStrv argv = g_new(char *, QAPI_LIST_LENGTH(args) + 1);
+
+    for (arg = args; arg != NULL; arg = arg->next) {
+        argv[i++] = g_strdup(arg->value);
+    }
+    argv[i] = NULL;
+
+    return argv;
+}
+
 strList *strList_from_string(const char *in, char delim)
 {
     strList *res = NULL;
-- 
1.8.3.1



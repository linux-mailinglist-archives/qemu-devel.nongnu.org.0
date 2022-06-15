Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FA454CD0F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 17:33:26 +0200 (CEST)
Received: from localhost ([::1]:56294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1V1J-00016l-Ct
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 11:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UPK-0008Ut-Ca
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:54:10 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:17332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UPI-0001Bc-OJ
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:54:10 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FDwp4J026591;
 Wed, 15 Jun 2022 14:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=GzI0gWvg80PtLp0f8GJXyhVdypXfBgAxwNMpPMIJU2k=;
 b=n0Yk5OFlsCiZY6MxPNK7bsoiMdBZt0Jr/2icPiJRGAxv/K036fL20KHvN5+Nk8XtJeGx
 jsieDsw9o8d2vWeY7E4eLRb4/KkzfT2kSv2tzdlBatoeofR2NFvQpKdunw+lYbSAsTNd
 lEKb01p22KgW8f6bvx8mgAEylnMJDpKwFfv2dJ1wid0/bVQ0eOFrzZsqN4f52m3Hv4ZQ
 UHhz6nO8DxjmRNFTAALgWWeyOn7IhoCuGPVK0zU7kVoLimH9nbbcctjOcXPRZA7WUG9y
 U0HGNGK5vSx55Mjh828wV7YKrfNyku6Li2MZOkRsNS1AtLZeppQTLohVaAw4QA314Qp0 +g== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhu2rxeg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:49 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25FEQ7C8023114; Wed, 15 Jun 2022 14:52:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vprk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:48 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 25FEqSNF018501;
 Wed, 15 Jun 2022 14:52:47 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpfm-17; Wed, 15 Jun 2022 14:52:47 +0000
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
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH V8 16/39] qapi: strv_from_strList
Date: Wed, 15 Jun 2022 07:52:03 -0700
Message-Id: <1655304746-102776-17-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-GUID: Mo-oSzF980FiQAMKkT4EyarIbTN5tlIR
X-Proofpoint-ORIG-GUID: Mo-oSzF980FiQAMKkT4EyarIbTN5tlIR
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

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
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
index b61c73c..8c96cab 100644
--- a/qapi/qapi-util.c
+++ b/qapi/qapi-util.c
@@ -154,6 +154,20 @@ int parse_qapi_name(const char *str, bool complete)
     return p - str;
 }
 
+GStrv strv_from_strList(const strList *args)
+{
+    const strList *arg;
+    int i = 0;
+    GStrv argv = g_malloc((QAPI_LIST_LENGTH(args) + 1) * sizeof(char *));
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



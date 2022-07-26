Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B61C5817E2
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 18:50:10 +0200 (CEST)
Received: from localhost ([::1]:56368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGNl3-0000NJ-Kx
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 12:50:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9w-00032p-Be
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:48 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:63790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9t-0006BV-AV
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:46 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QFn3rm031740;
 Tue, 26 Jul 2022 16:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=LqQ8YCk1YEPqlNHgEe+n7xXNNWUvyhiv7wrUe+46OQk=;
 b=ZlHZLUrpsdhktvI+1rP86akZZIDbWvpwOOMSnXyLDLxKcG7W4vzL6EWxAM/sen2BhVTB
 jYLH5SXev7tvBeprAXlMe+vXaTPGFjbTpYa7tvlMoyY+YzI2vVKEmQR1afHDhtf2ks3n
 Zu47Qf6YqDDbQ8qeNXRuYqOiQhO7O3WFOElXw0481Tl5e0ErwE+EnVT+u2wLoojhFQx5
 SqLRTqpWsL41FtJqkdYa+s6+7ePaJdiKj+gk7YK80RqcKkvscQx1SRd5Blsr2rHFYYjR
 iSwgyFkqNo3Z3oaNYeMEnkmlkE1Z3E26L20hLp9GVW+cJhku+kBEITXQELAxc7zuAOZw Cw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg9a4q19h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:02 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26QF72WX006333; Tue, 26 Jul 2022 16:11:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh65bq1jf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:01 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QG5uST023334;
 Tue, 26 Jul 2022 16:11:00 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3hh65bq0y5-11; Tue, 26 Jul 2022 16:11:00 +0000
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
Subject: [PATCH V9 10/46] qdev-properties: strList
Date: Tue, 26 Jul 2022 09:10:07 -0700
Message-Id: <1658851843-236870-11-git-send-email-steven.sistare@oracle.com>
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
X-Proofpoint-ORIG-GUID: k077_CNPyspdXcf9Ly719g2QWu0iu8K8
X-Proofpoint-GUID: k077_CNPyspdXcf9Ly719g2QWu0iu8K8
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

Define a list-of-strings property, to be used for the cpr-exec-args
migration property in a subsequent patch.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/core/qdev-properties.c    | 44 ++++++++++++++++++++++++++++++++++++++++++++
 include/hw/qdev-properties.h |  3 +++
 2 files changed, 47 insertions(+)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 357b876..851f490 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -9,6 +9,7 @@
 #include "qemu/units.h"
 #include "qemu/cutils.h"
 #include "qdev-prop-internal.h"
+#include "qapi/qapi-builtin-visit.h"
 
 void qdev_prop_set_after_realize(DeviceState *dev, const char *name,
                                   Error **errp)
@@ -490,6 +491,49 @@ const PropertyInfo qdev_prop_string = {
     .set   = set_string,
 };
 
+/* --- strList --- */
+
+static void release_strList(Object *obj, const char *name, void *opaque)
+{
+    Property *prop = opaque;
+    g_free(*(char **)object_field_prop_ptr(obj, prop));
+}
+
+static void get_strList(Object *obj, Visitor *v, const char *name,
+                       void *opaque, Error **errp)
+{
+    Property *prop = opaque;
+    strList **ptr = object_field_prop_ptr(obj, prop);
+
+    if (!*ptr) {
+        strList *str = NULL;
+        visit_type_strList(v, name, &str, errp);
+    } else {
+        visit_type_strList(v, name, ptr, errp);
+    }
+}
+
+static void set_strList(Object *obj, Visitor *v, const char *name,
+                       void *opaque, Error **errp)
+{
+    Property *prop = opaque;
+    strList **ptr = object_field_prop_ptr(obj, prop);
+    strList *str;
+
+    if (!visit_type_strList(v, name, &str, errp)) {
+        return;
+    }
+    g_free(*ptr);
+    *ptr = str;
+}
+
+const PropertyInfo qdev_prop_strlist = {
+    .name  = "strList",
+    .release = release_strList,
+    .get   = get_strList,
+    .set   = set_strList,
+};
+
 /* --- on/off/auto --- */
 
 const PropertyInfo qdev_prop_on_off_auto = {
diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index e1df088..df1b869 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -59,6 +59,7 @@ extern const PropertyInfo qdev_prop_uint64_checkmask;
 extern const PropertyInfo qdev_prop_int64;
 extern const PropertyInfo qdev_prop_size;
 extern const PropertyInfo qdev_prop_string;
+extern const PropertyInfo qdev_prop_strlist;
 extern const PropertyInfo qdev_prop_on_off_auto;
 extern const PropertyInfo qdev_prop_size32;
 extern const PropertyInfo qdev_prop_arraylen;
@@ -171,6 +172,8 @@ extern const PropertyInfo qdev_prop_link;
     DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, qdev_prop_size, uint64_t)
 #define DEFINE_PROP_STRING(_n, _s, _f)             \
     DEFINE_PROP(_n, _s, _f, qdev_prop_string, char*)
+#define DEFINE_PROP_STRLIST(_n, _s, _f)             \
+    DEFINE_PROP(_n, _s, _f, qdev_prop_strlist, strList*)
 #define DEFINE_PROP_ON_OFF_AUTO(_n, _s, _f, _d) \
     DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_on_off_auto, OnOffAuto)
 #define DEFINE_PROP_SIZE32(_n, _s, _f, _d)                       \
-- 
1.8.3.1



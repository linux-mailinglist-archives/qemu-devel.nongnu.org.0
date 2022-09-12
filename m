Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6625B5F9B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 19:52:54 +0200 (CEST)
Received: from localhost ([::1]:46912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXnc5-00080Q-9Q
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 13:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oXnXE-0003S7-CP
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 13:47:53 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:32930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oXnXC-0000fK-Jh
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 13:47:52 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28CHD7Cm001158
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 17:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=RqjJAzE1LGpQ5uizHh3x0YwWA12SySSG7bqVu+AzsJk=;
 b=CJ04xPp0g/rszSUH+xd+icW+Zc/IAK95MoUfxBkoi4qKraaEQQ12oM6/b/FbjeeVRTDG
 r22sBkCEtvh97I4h49Fb7axJjv3RR7ppkKhZfwGGAcgKCpTIt3/QyU3pO84JRox5Lz3d
 ne4drGsgGnQCMWm+B5EIRDDFns3OqzR5OokmTFAhQKWi4YHxeQYWJj7c44LvxheHxsyj
 Qxn+ToldGHszHIoPkO4VW7I50jP2az/5ZxYHPT2+uxGQTEnnKCd+SiHVWOk2W1TkDLyW
 1dHH6KOIBXRS48Dr/FqGgWctRMXIaed8oID1vnWtbBqZ/FXi9xCkA0nO0lu7rnjFfpIT FA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jj5m7gdwe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 17:47:47 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28CHDNPv002964
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 17:47:46 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jj5m7gdvn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 17:47:46 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28CHZp8g007688;
 Mon, 12 Sep 2022 17:47:45 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 3jgj7a28qf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 17:47:45 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 28CHljrY1966658
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Sep 2022 17:47:45 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF433136053;
 Mon, 12 Sep 2022 17:47:43 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6CDB613604F;
 Mon, 12 Sep 2022 17:47:43 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 12 Sep 2022 17:47:43 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Cc: Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH 1/2] tpm_emulator: Use latest tpm_ioctl.h from swtpm project
Date: Mon, 12 Sep 2022 13:47:40 -0400
Message-Id: <20220912174741.1542330-2-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220912174741.1542330-1-stefanb@linux.ibm.com>
References: <20220912174741.1542330-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MuQCSUY3UHQwjBO0LxeSRsrIiKALsA-i
X-Proofpoint-ORIG-GUID: 6-OTZ2vUhwo8LjDZ0x27LIdP92OjrhuC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_12,2022-09-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 suspectscore=0 mlxscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209120060
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Use the latest tpm_ioctl.h from upstream swtpm project.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 backends/tpm/tpm_ioctl.h | 96 +++++++++++++++++++++++++++++++---------
 1 file changed, 76 insertions(+), 20 deletions(-)

diff --git a/backends/tpm/tpm_ioctl.h b/backends/tpm/tpm_ioctl.h
index d67bf0283b..e506ef5160 100644
--- a/backends/tpm/tpm_ioctl.h
+++ b/backends/tpm/tpm_ioctl.h
@@ -5,10 +5,15 @@
  *
  * This file is licensed under the terms of the 3-clause BSD license
  */
+#ifndef _TPM_IOCTL_H_
+#define _TPM_IOCTL_H_
 
-#ifndef TPM_IOCTL_H
-#define TPM_IOCTL_H
+#if defined(__CYGWIN__)
+# define __USE_LINUX_IOCTL_DEFS
+#endif
 
+#include <stdint.h>
+#include <sys/types.h>
 #ifndef _WIN32
 #include <sys/uio.h>
 #include <sys/ioctl.h>
@@ -196,6 +201,48 @@ struct ptm_setbuffersize {
     } u;
 };
 
+#define PTM_GETINFO_SIZE (3 * 1024)
+/*
+ * PTM_GET_INFO: Get info about the TPM implementation (from libtpms)
+ *
+ * This request allows to indirectly call TPMLIB_GetInfo(flags) and
+ * retrieve information from libtpms.
+ * Only one transaction is currently necessary for returning results
+ * to a client. Therefore, totlength and length will be the same if
+ * offset is 0.
+ */
+struct ptm_getinfo {
+    union {
+        struct {
+            uint64_t flags;
+            uint32_t offset;      /* offset from where to read */
+            uint32_t pad;         /* 32 bit arch */
+        } req; /* request */
+        struct {
+            ptm_res tpm_result;
+            uint32_t totlength;
+            uint32_t length;
+            char buffer[PTM_GETINFO_SIZE];
+        } resp; /* response */
+    } u;
+};
+
+#define SWTPM_INFO_TPMSPECIFICATION ((uint64_t)1 << 0)
+#define SWTPM_INFO_TPMATTRIBUTES    ((uint64_t)1 << 1)
+
+/*
+ * PTM_LOCK_STORAGE: Lock the storage and retry n times
+ */
+struct ptm_lockstorage {
+    union {
+        struct {
+            uint32_t retries; /* number of retries */
+        } req; /* request */
+        struct {
+            ptm_res tpm_result;
+        } resp; /* reponse */
+    } u;
+};
 
 typedef uint64_t ptm_cap;
 typedef struct ptm_est ptm_est;
@@ -207,6 +254,8 @@ typedef struct ptm_getstate ptm_getstate;
 typedef struct ptm_setstate ptm_setstate;
 typedef struct ptm_getconfig ptm_getconfig;
 typedef struct ptm_setbuffersize ptm_setbuffersize;
+typedef struct ptm_getinfo ptm_getinfo;
+typedef struct ptm_lockstorage ptm_lockstorage;
 
 /* capability flags returned by PTM_GET_CAPABILITY */
 #define PTM_CAP_INIT               (1)
@@ -223,6 +272,9 @@ typedef struct ptm_setbuffersize ptm_setbuffersize;
 #define PTM_CAP_GET_CONFIG         (1 << 11)
 #define PTM_CAP_SET_DATAFD         (1 << 12)
 #define PTM_CAP_SET_BUFFERSIZE     (1 << 13)
+#define PTM_CAP_GET_INFO           (1 << 14)
+#define PTM_CAP_SEND_COMMAND_HEADER (1 << 15)
+#define PTM_CAP_LOCK_STORAGE       (1 << 16)
 
 #ifndef _WIN32
 enum {
@@ -243,6 +295,8 @@ enum {
     PTM_GET_CONFIG         = _IOR('P', 14, ptm_getconfig),
     PTM_SET_DATAFD         = _IOR('P', 15, ptm_res),
     PTM_SET_BUFFERSIZE     = _IOWR('P', 16, ptm_setbuffersize),
+    PTM_GET_INFO           = _IOWR('P', 17, ptm_getinfo),
+    PTM_LOCK_STORAGE       = _IOWR('P', 18, ptm_lockstorage),
 };
 #endif
 
@@ -257,23 +311,25 @@ enum {
  * and ptm_set_state:u.req.data) are 0xffffffff.
  */
 enum {
-    CMD_GET_CAPABILITY = 1,
-    CMD_INIT,
-    CMD_SHUTDOWN,
-    CMD_GET_TPMESTABLISHED,
-    CMD_SET_LOCALITY,
-    CMD_HASH_START,
-    CMD_HASH_DATA,
-    CMD_HASH_END,
-    CMD_CANCEL_TPM_CMD,
-    CMD_STORE_VOLATILE,
-    CMD_RESET_TPMESTABLISHED,
-    CMD_GET_STATEBLOB,
-    CMD_SET_STATEBLOB,
-    CMD_STOP,
-    CMD_GET_CONFIG,
-    CMD_SET_DATAFD,
-    CMD_SET_BUFFERSIZE,
+    CMD_GET_CAPABILITY = 1,   /* 0x01 */
+    CMD_INIT,                 /* 0x02 */
+    CMD_SHUTDOWN,             /* 0x03 */
+    CMD_GET_TPMESTABLISHED,   /* 0x04 */
+    CMD_SET_LOCALITY,         /* 0x05 */
+    CMD_HASH_START,           /* 0x06 */
+    CMD_HASH_DATA,            /* 0x07 */
+    CMD_HASH_END,             /* 0x08 */
+    CMD_CANCEL_TPM_CMD,       /* 0x09 */
+    CMD_STORE_VOLATILE,       /* 0x0a */
+    CMD_RESET_TPMESTABLISHED, /* 0x0b */
+    CMD_GET_STATEBLOB,        /* 0x0c */
+    CMD_SET_STATEBLOB,        /* 0x0d */
+    CMD_STOP,                 /* 0x0e */
+    CMD_GET_CONFIG,           /* 0x0f */
+    CMD_SET_DATAFD,           /* 0x10 */
+    CMD_SET_BUFFERSIZE,       /* 0x11 */
+    CMD_GET_INFO,             /* 0x12 */
+    CMD_LOCK_STORAGE,         /* 0x13 */
 };
 
-#endif /* TPM_IOCTL_H */
+#endif /* _TPM_IOCTL_H_ */
-- 
2.37.2



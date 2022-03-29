Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 260F84EB028
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 17:23:41 +0200 (CEST)
Received: from localhost ([::1]:46186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZDh6-0004Dg-59
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 11:23:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nZDfA-0002iC-T2; Tue, 29 Mar 2022 11:21:42 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:12352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nZDf8-0007PP-OT; Tue, 29 Mar 2022 11:21:40 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22TDNiSR029818; 
 Tue, 29 Mar 2022 15:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=njulgadCf93COGEPOIpjRLZQ6Tj62G3k54qMnmO2QnM=;
 b=a98s1imsUNHxAY4q+xBoL7NxemHEitnFlc6RzRqBuOXYp3vaXfmN5+qKiALA4X7g2mw3
 hR1qJpjmOMS8/x6OATt4XVng1GfcQn1pWh7cln2kSlplWCfMlRGblDrg9VpcQiyI/BSH
 FkTEtslpRBBXjM3nHbgOYYOKF8696ADyET0zldaSAC2k+tm1/dNS3bcBXw6GNpBez2Ud
 4h810F0p+8MbzaM6a8tNchdsZd2AnRnEUid9vOlvZ5I+qoV3jGUxZOvule89tNzUZ7MK
 ljfUCLeVn985XKINwVU5K0O2p4bq2YOMqDgjU6UZGZ7KgdlDLtcGpyf37ocgFRyu/Qwf zA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f409rpngh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Mar 2022 15:21:31 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22TFHQdM009052;
 Tue, 29 Mar 2022 15:21:31 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f409rpnfg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Mar 2022 15:21:31 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22TFFJKU000988;
 Tue, 29 Mar 2022 15:21:28 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3f3rs3hg82-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Mar 2022 15:21:28 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22TFLPXw36372968
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Mar 2022 15:21:25 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1467D11C050;
 Tue, 29 Mar 2022 15:21:25 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5528F11C058;
 Tue, 29 Mar 2022 15:21:24 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.51.38])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 29 Mar 2022 15:21:24 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH] multifd: Copy pages before compressing them with zlib
Date: Tue, 29 Mar 2022 17:21:23 +0200
Message-Id: <20220329152123.493731-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WuG5saMTJlUmw2qxPdefWYpHmqub3zh6
X-Proofpoint-ORIG-GUID: Pz0aN712Bj_elgVIZtf1RATYx1r_Bwfr
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-29_05,2022-03-29_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 clxscore=1011 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203290091
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, thuth@redhat.com,
 f.ebner@proxmox.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, s.reiter@proxmox.com,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org, peterx@redhat.com,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 hreitz@redhat.com, Christian Borntraeger <borntraeger@linux.ibm.com>,
 jinpu.wang@ionos.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

zlib_send_prepare() compresses pages of a running VM. zlib does not
make any thread-safety guarantees with respect to changing deflate()
input concurrently with deflate() [1].

One can observe problems due to this with the IBM zEnterprise Data
Compression accelerator capable zlib [2]. When the hardware
acceleration is enabled, migration/multifd/tcp/zlib test fails
intermittently [3] due to sliding window corruption.

At the moment this problem occurs only with this accelerator, since
its architecture explicitly discourages concurrent accesses [4]:

    Page 26-57, "Other Conditions":

    As observed by this CPU, other CPUs, and channel
    programs, references to the parameter block, first,
    second, and third operands may be multiple-access
    references, accesses to these storage locations are
    not necessarily block-concurrent, and the sequence
    of these accesses or references is undefined.

Still, it might affect other platforms due to a future zlib update.
Therefore, copy the page being compressed into a private buffer before
passing it to zlib.

[1] https://zlib.net/manual.html
[2] https://github.com/madler/zlib/pull/410
[3] https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg03988.html
[4] http://publibfp.dhe.ibm.com/epubs/pdf/a227832c.pdf

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 migration/multifd-zlib.c | 35 ++++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index 3a7ae44485..b6b22b7d1f 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -27,6 +27,8 @@ struct zlib_data {
     uint8_t *zbuff;
     /* size of compressed buffer */
     uint32_t zbuff_len;
+    /* uncompressed buffer */
+    uint8_t buf[];
 };
 
 /* Multifd zlib compression */
@@ -43,9 +45,18 @@ struct zlib_data {
  */
 static int zlib_send_setup(MultiFDSendParams *p, Error **errp)
 {
-    struct zlib_data *z = g_new0(struct zlib_data, 1);
-    z_stream *zs = &z->zs;
+    /* This is the maximum size of the compressed buffer */
+    uint32_t zbuff_len = compressBound(MULTIFD_PACKET_SIZE);
+    size_t buf_len = qemu_target_page_size();
+    struct zlib_data *z;
+    z_stream *zs;
 
+    z = g_try_malloc0(sizeof(struct zlib_data) + buf_len + zbuff_len);
+    if (!z) {
+        error_setg(errp, "multifd %u: out of memory for zlib_data", p->id);
+        return -1;
+    }
+    zs = &z->zs;
     zs->zalloc = Z_NULL;
     zs->zfree = Z_NULL;
     zs->opaque = Z_NULL;
@@ -54,15 +65,8 @@ static int zlib_send_setup(MultiFDSendParams *p, Error **errp)
         error_setg(errp, "multifd %u: deflate init failed", p->id);
         return -1;
     }
-    /* This is the maxium size of the compressed buffer */
-    z->zbuff_len = compressBound(MULTIFD_PACKET_SIZE);
-    z->zbuff = g_try_malloc(z->zbuff_len);
-    if (!z->zbuff) {
-        deflateEnd(&z->zs);
-        g_free(z);
-        error_setg(errp, "multifd %u: out of memory for zbuff", p->id);
-        return -1;
-    }
+    z->zbuff_len = zbuff_len;
+    z->zbuff = z->buf + buf_len;
     p->data = z;
     return 0;
 }
@@ -80,7 +84,6 @@ static void zlib_send_cleanup(MultiFDSendParams *p, Error **errp)
     struct zlib_data *z = p->data;
 
     deflateEnd(&z->zs);
-    g_free(z->zbuff);
     z->zbuff = NULL;
     g_free(p->data);
     p->data = NULL;
@@ -114,8 +117,14 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
             flush = Z_SYNC_FLUSH;
         }
 
+        /*
+         * Since the VM might be running, the page may be changing concurrently
+         * with compression. zlib does not guarantee that this is safe,
+         * therefore copy the page before calling deflate().
+         */
+        memcpy(z->buf, p->pages->block->host + p->normal[i], page_size);
         zs->avail_in = page_size;
-        zs->next_in = p->pages->block->host + p->normal[i];
+        zs->next_in = z->buf;
 
         zs->avail_out = available;
         zs->next_out = z->zbuff + out_size;
-- 
2.35.1



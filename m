Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9646565C4F
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 18:43:22 +0200 (CEST)
Received: from localhost ([::1]:48576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8PAP-0003Go-Cm
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 12:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1o8P8b-0002D0-8x
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 12:41:29 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:10236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1o8P8Z-0006iz-7b
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 12:41:29 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 264GFgdo000585
 for <qemu-devel@nongnu.org>; Mon, 4 Jul 2022 16:41:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=qOJXEAmXpN0Tb7r1ofxkvLCJt1BvMFMJx0LGdUPQ0Xk=;
 b=nk17i5nujBD1Vrg/kYEzo6xok5bfO/TNxtPB5rHr7ZcprNUyp7bmWlCp6He/RCSWPL/c
 9hb81R8PTrkIA5FfnJ7e+OF+ZexPPPcyze6avWd4v5wsRm3Ack6jaljoZf7pFK6U9otw
 gHimdjcF7jqtsxiXNYeAkzEBWCxjIgcRrQ5rpHT/QUA2HLyaKNZRAbDFpMbyzLg8HkJU
 tNGGFLdVL8WQu5jSL4Wj5PfIWNDTb+/NPFOkxCwlWj4i7VbFFB5/oCnKYLFmTsubOs6r
 HH6fq/lI89brZxQMbeR0hRy7zggjU0rPCTCi6wQ4S/PNoXYokKZ66AzDOtaVC6EemcYK ig== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h43jtghnb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 16:41:23 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 264GT24u026724
 for <qemu-devel@nongnu.org>; Mon, 4 Jul 2022 16:41:22 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h43jtghmu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jul 2022 16:41:22 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 264GKbC0009738;
 Mon, 4 Jul 2022 16:41:20 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3h2dn8t6fw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jul 2022 16:41:20 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 264GfPoN25166108
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Jul 2022 16:41:25 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27234A404D;
 Mon,  4 Jul 2022 16:41:17 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFE67A4053;
 Mon,  4 Jul 2022 16:41:16 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.47.233])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  4 Jul 2022 16:41:16 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH] multifd: Copy pages before compressing them with zlib
Date: Mon,  4 Jul 2022 18:41:12 +0200
Message-Id: <20220704164112.2890137-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IrHZ3DlbKCzF1ER9xuP7q4m01z20J9-Q
X-Proofpoint-ORIG-GUID: iJlIqIdnYTYvOLmHI2tXhyG1X339Tnt0
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-04_16,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2207040071
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
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

zlib_send_prepare() compresses pages of a running VM. zlib does not
make any thread-safety guarantees with respect to changing deflate()
input concurrently with deflate() [1].

One can observe problems due to this with the IBM zEnterprise Data
Compression accelerator capable zlib [2]. When the hardware
acceleration is enabled, migration/multifd/tcp/plain/zlib test fails
intermittently [3] due to sliding window corruption. The accelerator's
architecture explicitly discourages concurrent accesses [4]:

    Page 26-57, "Other Conditions":

    As observed by this CPU, other CPUs, and channel
    programs, references to the parameter block, first,
    second, and third operands may be multiple-access
    references, accesses to these storage locations are
    not necessarily block-concurrent, and the sequence
    of these accesses or references is undefined.

Mark Adler pointed out that vanilla zlib performs double fetches under
certain circumstances as well [5], therefore we need to copy data
before passing it to deflate().

[1] https://zlib.net/manual.html
[2] https://github.com/madler/zlib/pull/410
[3] https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg03988.html
[4] http://publibfp.dhe.ibm.com/epubs/pdf/a227832c.pdf
[5] https://gitlab.com/qemu-project/qemu/-/issues/1099

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---

v1: https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg06841.html
v1 -> v2: Rebase, mention Mark Adler's reply in the commit message.

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
2.35.3



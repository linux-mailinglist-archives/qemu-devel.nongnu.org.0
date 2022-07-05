Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEA9567886
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 22:37:19 +0200 (CEST)
Received: from localhost ([::1]:56560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8pIL-0005MF-Nm
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 16:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1o8pHL-0004fW-LZ
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 16:36:15 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:11114
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1o8pHI-0004XA-Q5
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 16:36:15 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 265JXHjL013672;
 Tue, 5 Jul 2022 20:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=wcA7qyUt6TFr52EqZ2LwShkFgWhZ0H7tJTyO/lP36fI=;
 b=NFw/cGYi2w8frAqCJB5Dgjy6NHoIiuvib/2Wjgw6I2xOuhbOT5sCh4aOZ0z6ow3uNYMs
 y/AY2IrOT8dgYtdVQ1V6EAsbco18UMLalNXAFUSkB2u/Y6EJRJJuW2XZJCz99n08xd3D
 IHjJUJic2AIizS5a3/abhWBfCr6TGD73vVCdxS78vDvybWhim+1kIzn4FVZG57Yargdl
 tlgIVASC4n3d9mbkrWQqXSP9PnY8l70tctL2Jyx64mHDq8QX8HiWjQxsGNivsbtyt5Qm
 uXR+iO/oJdXyhBYvy9//JnxFD67dDo58g3DKqqi+aUMjPYPUgJJ9UHyltbaQ8Ql0V0d5 LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h4ujd1fsc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jul 2022 20:36:07 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 265Ka6D2006668;
 Tue, 5 Jul 2022 20:36:06 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h4ujd1frj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jul 2022 20:36:06 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 265KL7Wd032185;
 Tue, 5 Jul 2022 20:36:05 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 3h4ucy818r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jul 2022 20:36:04 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 265Ka1Vb21692698
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Jul 2022 20:36:01 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52F5D11C050;
 Tue,  5 Jul 2022 20:36:01 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1D8211C04A;
 Tue,  5 Jul 2022 20:36:00 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.47.233])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  5 Jul 2022 20:36:00 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3] multifd: Copy pages before compressing them with zlib
Date: Tue,  5 Jul 2022 22:35:59 +0200
Message-Id: <20220705203559.2960949-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mZr2pqyNhI1h1OX9t7Zt2xhktCdcnyde
X-Proofpoint-GUID: RcS0hyHCuq_vf0OSwvZGU5bVbNzw6TPS
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-05_18,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207050088
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
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
[5] https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg00889.html

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---

v1: https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg06841.html
v1 -> v2: Rebase, mention Mark Adler's reply in the commit message.

v2: https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg00627.html
v2 -> v3: Get rid of pointer maths (David).
          Use a more relevant link to Mark Adler's comment (Peter).

 migration/multifd-zlib.c | 38 ++++++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index 3a7ae44485..18213a9513 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -27,6 +27,8 @@ struct zlib_data {
     uint8_t *zbuff;
     /* size of compressed buffer */
     uint32_t zbuff_len;
+    /* uncompressed buffer of size qemu_target_page_size() */
+    uint8_t *buf;
 };
 
 /* Multifd zlib compression */
@@ -45,26 +47,38 @@ static int zlib_send_setup(MultiFDSendParams *p, Error **errp)
 {
     struct zlib_data *z = g_new0(struct zlib_data, 1);
     z_stream *zs = &z->zs;
+    const char *err_msg;
 
     zs->zalloc = Z_NULL;
     zs->zfree = Z_NULL;
     zs->opaque = Z_NULL;
     if (deflateInit(zs, migrate_multifd_zlib_level()) != Z_OK) {
-        g_free(z);
-        error_setg(errp, "multifd %u: deflate init failed", p->id);
-        return -1;
+        err_msg = "deflate init failed";
+        goto err_free_z;
     }
     /* This is the maxium size of the compressed buffer */
     z->zbuff_len = compressBound(MULTIFD_PACKET_SIZE);
     z->zbuff = g_try_malloc(z->zbuff_len);
     if (!z->zbuff) {
-        deflateEnd(&z->zs);
-        g_free(z);
-        error_setg(errp, "multifd %u: out of memory for zbuff", p->id);
-        return -1;
+        err_msg = "out of memory for zbuff";
+        goto err_deflate_end;
+    }
+    z->buf = g_try_malloc(qemu_target_page_size());
+    if (!z->buf) {
+        err_msg = "out of memory for buf";
+        goto err_free_zbuff;
     }
     p->data = z;
     return 0;
+
+err_free_zbuff:
+    g_free(z->zbuff);
+err_deflate_end:
+    deflateEnd(&z->zs);
+err_free_z:
+    g_free(z);
+    error_setg(errp, "multifd %u: %s", p->id, err_msg);
+    return -1;
 }
 
 /**
@@ -82,6 +96,8 @@ static void zlib_send_cleanup(MultiFDSendParams *p, Error **errp)
     deflateEnd(&z->zs);
     g_free(z->zbuff);
     z->zbuff = NULL;
+    g_free(z->buf);
+    z->buf = NULL;
     g_free(p->data);
     p->data = NULL;
 }
@@ -114,8 +130,14 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
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



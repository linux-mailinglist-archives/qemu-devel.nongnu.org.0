Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE4211D546
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 19:24:09 +0100 (CET)
Received: from localhost ([::1]:35644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifT8B-0001CR-Qc
	for lists+qemu-devel@lfdr.de; Thu, 12 Dec 2019 13:24:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34144)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanb@linux.vnet.ibm.com>) id 1ifStI-00085t-UB
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 13:08:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanb@linux.vnet.ibm.com>) id 1ifStH-0006Oo-SI
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 13:08:44 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:24856
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1ifStH-0006Nk-Mu; Thu, 12 Dec 2019 13:08:43 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBCHrJHk052000; Thu, 12 Dec 2019 13:08:29 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wusnb1thr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Dec 2019 13:08:28 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xBCHxZ3k103276;
 Thu, 12 Dec 2019 13:08:28 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wusnb1thg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Dec 2019 13:08:28 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBCI5qXk032027;
 Thu, 12 Dec 2019 18:08:27 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03wdc.us.ibm.com with ESMTP id 2wr3q702j3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Dec 2019 18:08:27 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBCI8RmV34275664
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Dec 2019 18:08:27 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 03E22B2066;
 Thu, 12 Dec 2019 18:08:27 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1282B2065;
 Thu, 12 Dec 2019 18:08:26 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 12 Dec 2019 18:08:26 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v4 5/8] tpm: Return bool from tpm_backend_finish_sync
Date: Thu, 12 Dec 2019 13:07:41 -0500
Message-Id: <20191212180744.1070446-6-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191212180744.1070446-1-stefanb@linux.vnet.ibm.com>
References: <20191212180744.1070446-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-12_05:2019-12-12,2019-12-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 suspectscore=1 impostorscore=0 phishscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912120140
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: marcandre.lureau@redhat.com, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Return true in case we had to wait for an outstanding response
to come back, false otherwise.

Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>

diff --git a/backends/tpm.c b/backends/tpm.c
index 424c9fd485..ae4d8c526b 100644
--- a/backends/tpm.c
+++ b/backends/tpm.c
@@ -49,11 +49,15 @@ static int tpm_backend_worker_thread(gpointer data)
     return 0;
 }
 
-void tpm_backend_finish_sync(TPMBackend *s)
+bool tpm_backend_finish_sync(TPMBackend *s)
 {
+    bool ret = s->cmd != NULL;
+
     while (s->cmd) {
         aio_poll(qemu_get_aio_context(), true);
     }
+
+    return ret;
 }
 
 enum TpmType tpm_backend_get_type(TPMBackend *s)
diff --git a/include/sysemu/tpm_backend.h b/include/sysemu/tpm_backend.h
index f5d8051b45..3ab9f51ba4 100644
--- a/include/sysemu/tpm_backend.h
+++ b/include/sysemu/tpm_backend.h
@@ -202,8 +202,10 @@ size_t tpm_backend_get_buffer_size(TPMBackend *s);
  *
  * Finish the pending command synchronously (this will call aio_poll()
  * on qemu main AIOContext until it ends)
+ *
+ * Returns true in case there was a pending command, false otherwise.
  */
-void tpm_backend_finish_sync(TPMBackend *s);
+bool tpm_backend_finish_sync(TPMBackend *s);
 
 /**
  * tpm_backend_query_tpm:
-- 
2.21.0



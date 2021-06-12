Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F2F3A4C19
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 03:23:39 +0200 (CEST)
Received: from localhost ([::1]:43396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrsN8-0004m5-1b
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 21:23:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1lrsL8-0003Kf-94
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 21:21:34 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:5650
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1lrsL6-0004mB-22
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 21:21:34 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15C14BtM130955
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 21:21:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=h1o7KKgUStOdLLysRc4MxZJlHgqrrn4DT6m5rrt2cIg=;
 b=WBZwX/mO0EKctcpZ2bjEe/WFlG4h3W10VBr5EKdv3f8I9y8LtKntO8+jEpMtdhpvyvrt
 0e9CqcN0RkKDfycpDTrZ2OeV44K+LIT1HLw6tXXVRqPixqelSMkCmXtV5lu3fQ0RM4iP
 UAfl6Och/4YYB6O+puQ9DST37InSQJBpTfICjd/CUiCx57/s3iUsoNmplJ34i2MZk1xQ
 dOLV7+hWlNOA62AX71MmGZJZKGX3qzdrsKegcQez+F0jcakCvfff8s7mK9E1Mk69i7zG
 y8lrpJD7ZmgCwgz0y2aUcCquKTa9Que6gr/qynhc7nrVYozPRjj9UMShwFqeHBT1lghS tg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 394fjx443t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 21:21:30 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15C14RO5131833
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 21:21:30 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 394fjx443q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Jun 2021 21:21:30 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15C1DFwB026051;
 Sat, 12 Jun 2021 01:21:29 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01wdc.us.ibm.com with ESMTP id 3900w9vd8p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 12 Jun 2021 01:21:29 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15C1LThg9175558
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 12 Jun 2021 01:21:29 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A57A112062;
 Sat, 12 Jun 2021 01:21:29 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0DCE8112063;
 Sat, 12 Jun 2021 01:21:29 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.47.158.152])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat, 12 Jun 2021 01:21:29 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: armbru@redhat.com, qemu-devel@nongnu.org
Subject: [RFC PATCH V1 3/3] sysemu: Make TPM structures inaccessible if
 CONFIG_TPM is not defined
Date: Fri, 11 Jun 2021 21:21:02 -0400
Message-Id: <20210612012102.1820063-4-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210612012102.1820063-1-stefanb@linux.ibm.com>
References: <20210612012102.1820063-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: E88AAAZ1Y3r91xlbCHeZa7I_PzIu_n8T
X-Proofpoint-ORIG-GUID: rdrK42gYxYArienyGtvTCoJ9tgkSI42n
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-11_06:2021-06-11,
 2021-06-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106120006
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: philmd@redhat.com, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 include/sysemu/tpm.h         | 6 +++++-
 include/sysemu/tpm_backend.h | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
index 1a85564e47..2ca3fa32ee 100644
--- a/include/sysemu/tpm.h
+++ b/include/sysemu/tpm.h
@@ -15,10 +15,12 @@
 #include "qapi/qapi-types-tpm.h"
 #include "qom/object.h"
 
-int tpm_config_parse(QemuOptsList *opts_list, const char *optarg);
 int tpm_init(void);
 void tpm_cleanup(void);
 
+#ifdef CONFIG_TPM
+int tpm_config_parse(QemuOptsList *opts_list, const char *optarg);
+
 typedef enum TPMVersion {
     TPM_VERSION_UNSPEC = 0,
     TPM_VERSION_1_2 = 1,
@@ -73,4 +75,6 @@ static inline TPMVersion tpm_get_version(TPMIf *ti)
     return TPM_IF_GET_CLASS(ti)->get_version(ti);
 }
 
+#endif /* CONFIG_TPM */
+
 #endif /* QEMU_TPM_H */
diff --git a/include/sysemu/tpm_backend.h b/include/sysemu/tpm_backend.h
index 6f078f5f48..8fd3269c11 100644
--- a/include/sysemu/tpm_backend.h
+++ b/include/sysemu/tpm_backend.h
@@ -18,6 +18,8 @@
 #include "sysemu/tpm.h"
 #include "qapi/error.h"
 
+#ifdef CONFIG_TPM
+
 #define TYPE_TPM_BACKEND "tpm-backend"
 OBJECT_DECLARE_TYPE(TPMBackend, TPMBackendClass,
                     TPM_BACKEND)
@@ -209,4 +211,6 @@ TPMInfo *tpm_backend_query_tpm(TPMBackend *s);
 
 TPMBackend *qemu_find_tpm_be(const char *id);
 
-#endif
+#endif /* CONFIG_TPM */
+
+#endif /* TPM_BACKEND_H */
-- 
2.31.1



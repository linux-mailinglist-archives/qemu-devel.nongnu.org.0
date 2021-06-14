Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 509683A6EA7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 21:15:23 +0200 (CEST)
Received: from localhost ([::1]:36924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lss3O-0005gs-CF
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 15:15:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1lss1q-0003dy-08
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:13:46 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1lss1m-0001K3-Li
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:13:45 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15EJ48nn065312
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 15:13:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=R141/Ulaap2cIPvNQ+lVWgZvlJMiZJckPNXHGP5qfd0=;
 b=MmKs/tM8iYnOANOYeQADn5jWE+LJL1yXQHIcbI/mdpJzLs5UiWDxfI+EHcobW4LDi49R
 GJJTl7wCYsC3ca6dmmztNibUO4kmtSeQU1HDFqK8565QQk2N4psj++QSD7g60AIvHBPT
 Vo1pdiotAsFF+RlOqeDonsGjAGRfVdMByk88qAXY1D39TNXdWw3OghUwRLFpl5Q7hqSV
 TLMnkfoWOthpgT72Wg9drgwfymh2e1YXK+ZfDQHKWyFvCpz2jq8QfolyiRICCJ6RaNCG
 vBfd3bTWsDsH11rZDlkjeadpGWD9pY1QbBmKacCTUf4PUW8gWjbD89O2R0PVAunBjwhz oQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 396c7h1e1h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 15:13:41 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15EJ4EGh065802
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 15:13:41 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 396c7h1e16-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 15:13:41 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15EJ7KjP018050;
 Mon, 14 Jun 2021 19:13:40 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01wdc.us.ibm.com with ESMTP id 394mj920p2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 19:13:40 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15EJDejM37421438
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Jun 2021 19:13:40 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F05E1136055;
 Mon, 14 Jun 2021 19:13:39 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A533113604F;
 Mon, 14 Jun 2021 19:13:39 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.47.158.152])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 14 Jun 2021 19:13:39 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] sysemu: Make TPM structures inaccessible if CONFIG_TPM
 is not defined
Date: Mon, 14 Jun 2021 15:13:35 -0400
Message-Id: <20210614191335.1968807-5-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210614191335.1968807-1-stefanb@linux.ibm.com>
References: <20210614191335.1968807-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1Sd80MedMxmkhWiptlyYsvx_i9kZhn2W
X-Proofpoint-ORIG-GUID: xbGtOaeHFhm2qvaUPW3cELby7LhXBGya
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-14_13:2021-06-14,
 2021-06-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106140121
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
Cc: philmd@redhat.com, armbru@redhat.com, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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



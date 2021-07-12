Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 739723C5EE2
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:13:09 +0200 (CEST)
Received: from localhost ([::1]:41106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2xcK-00035i-Fh
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1m2xZK-0006cn-99
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:10:02 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:14570
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1m2xZG-0003eb-Ha
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:10:02 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CF3Rcp078148
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 11:09:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=dKMFkkFl8n+JczG7OgICgT18GjNF9+hjX0hMVru2UQo=;
 b=kMikLJHczUmR+W7zLIql19aocx8oQ3fKE0abFZKVI30+IJvanJF88aJvVXdiJqlkKuU8
 XymJZJKF+0AZjYLTyWsfamEFI77oZaXz6QXSTf7ybkj8tNln8rfOUP/5zJrHC1Jgl5vb
 n2t/w6a3E43XrGJoh7CBL+JSe7a5JbZXcOgizipF0TGjz+I+cslqMEBB0UGXynVbuBsl
 gnPQ/qM/waqbdCkeg4JOuebDdpIhwx+53JKyw8Ljagug2N0+s2kXLXIDnvZ/AFPa5wuO
 I8QPlLIpkGZFbLszgZyOuwXIw5b5OUYlFqHl6IpcuWm5dtdTLUcWjj4CTB5z3H3xjx3T tA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39qs654p7c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 11:09:57 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16CF3bZh079094
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 11:09:57 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39qs654p71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 11:09:57 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16CF8FgM012387;
 Mon, 12 Jul 2021 15:09:56 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 39qt39y35r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 15:09:56 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16CF9tOK50987488
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 15:09:55 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42AD478069;
 Mon, 12 Jul 2021 15:09:55 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E67A87805C;
 Mon, 12 Jul 2021 15:09:54 +0000 (GMT)
Received: from sbct-3.pok.ibm.com?044watson.ibm.com (unknown [9.47.158.153])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 12 Jul 2021 15:09:54 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Subject: [PATCH v3 6/9] tests: tpm: Create TPM 1.2 response in TPM emulator
Date: Mon, 12 Jul 2021 11:09:46 -0400
Message-Id: <20210712150949.165725-7-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210712150949.165725-1-stefanb@linux.vnet.ibm.com>
References: <20210712150949.165725-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1HNEVDBt2jXSH18lxmcPPUKt4kpg1egY
X-Proofpoint-GUID: Ptbiwg6Kk3hsr_mn7uvA-CzmpOCIbW9a
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-12_09:2021-07-12,
 2021-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107120118
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=stefanb@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Stefan Berger <stefanb@linux.ibm.com>, philmd@redhat.com,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>

---
v3:
  - Added TPM_VERSION_1_2 enum for when CONFIG_TPM is not defined
---
 tests/qtest/tpm-emu.c | 5 +++++
 tests/qtest/tpm-emu.h | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/tests/qtest/tpm-emu.c b/tests/qtest/tpm-emu.c
index 8baf49eafd..32c704194b 100644
--- a/tests/qtest/tpm-emu.c
+++ b/tests/qtest/tpm-emu.c
@@ -62,6 +62,11 @@ static void *tpm_emu_tpm_thread(void *data)
             s->tpm_msg->len = cpu_to_be32(sizeof(struct tpm_hdr));
             s->tpm_msg->code = cpu_to_be32(TPM_RC_FAILURE);
             break;
+        case TPM_VERSION_1_2:
+            s->tpm_msg->tag = cpu_to_be16(TPM_TAG_RSP_COMMAND);
+            s->tpm_msg->len = cpu_to_be32(sizeof(struct tpm_hdr));
+            s->tpm_msg->code = cpu_to_be32(TPM_FAIL);
+            break;
         default:
             g_debug("unsupport TPM version %u", s->tpm_version);
             g_assert_not_reached();
diff --git a/tests/qtest/tpm-emu.h b/tests/qtest/tpm-emu.h
index 610519883a..fcb5d7a1d6 100644
--- a/tests/qtest/tpm-emu.h
+++ b/tests/qtest/tpm-emu.h
@@ -16,6 +16,9 @@
 #define TPM_RC_FAILURE 0x101
 #define TPM2_ST_NO_SESSIONS 0x8001
 
+#define TPM_FAIL 9
+#define TPM_TAG_RSP_COMMAND 0xc4
+
 #include "qemu/sockets.h"
 #include "io/channel.h"
 #include "sysemu/tpm.h"
@@ -29,6 +32,7 @@ struct tpm_hdr {
 
 #ifndef CONFIG_TPM
 enum TPMVersion {
+    TPM_VERSION_1_2 = 1,
     TPM_VERSION_2_0 = 2,
 };
 #endif
-- 
2.31.1



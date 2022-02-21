Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E974BDAD0
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 17:25:01 +0100 (CET)
Received: from localhost ([::1]:40640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMBUi-0002uN-PS
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 11:25:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nMBFY-0000Nf-6x
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 11:09:21 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:30966
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nMBFV-0004Ix-9T
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 11:09:19 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21LF4V1c030842; 
 Mon, 21 Feb 2022 16:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=5dnQZCPwYio0eAddWhjU0tb34MYn/6qX8emnpmvMyd4=;
 b=sqBCDRReDs4xQkyJ5JgvPMSpmCXF9riQJAYSEEjoRAhHdkFvL9xSj4uKiOBd7FHyJDI/
 FROo6OLW6+WwE2kIi0J/1oiIaARA/Xsa6gUdXlhNuCX9L64/Wty9DsIFZHr1Yz07oXeq
 8lzxDczYL0Fgh5x0vE/drK5eeBqD1j+zYNwagKJ4AvypT3Oxz/5ElMpdKoj6qQOnb6p/
 gca2MkL9SBks1YvjdmDXFwHYDVC1/JezB+3gKkdzcqAbaTrHHyctKetCEny17z7touyi
 J6RGf7dAIj/+bVMlaTtpTGZeaSOqipC8SdQjOJk/NXeVKmF+6iNxuNK4g36KN+fKZjnE oQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ec5bbcbmx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Feb 2022 16:09:12 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21LEF9FR008187;
 Mon, 21 Feb 2022 16:09:11 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ec5bbcbmn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Feb 2022 16:09:11 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21LG4wZ6027537;
 Mon, 21 Feb 2022 16:09:11 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02wdc.us.ibm.com with ESMTP id 3ear69jknx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Feb 2022 16:09:11 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21LG99e330802410
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Feb 2022 16:09:09 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4D5BBE05A;
 Mon, 21 Feb 2022 16:09:09 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBC05BE051;
 Mon, 21 Feb 2022 16:09:08 +0000 (GMT)
Received: from amdrome3.watson.ibm.com (unknown [9.2.130.16])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 21 Feb 2022 16:09:08 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qapi, target/i386/sev: Add cpu0-id to query-sev-capabilities
Date: Mon, 21 Feb 2022 16:08:50 +0000
Message-Id: <20220221160850.1484364-1-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 14a6hhjNCPJ7id9XmpRZWJ8eIlZexadg
X-Proofpoint-GUID: KtdwknW0RU-rS51rUBY62L1Kf2XeGIrh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-21_07,2022-02-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 phishscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202210095
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new field 'cpu0-id' to the response of query-sev-capabilities
QMP command.  The value of the field is the hex-encoded 64-byte unique
ID of the CPU0 (socket 0), which can be used to retrieve the signed CEK
of the CPU from AMD's Key Distribution Service (KDS).

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
---
 qapi/misc-target.json |  4 ++++
 target/i386/sev.c     | 43 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 4bc45d2474..d9b4991c86 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -177,6 +177,8 @@
 #
 # @cert-chain:  PDH certificate chain (base64 encoded)
 #
+# @cpu0-id: 64-byte unique ID of CPU0 (hex encoded) (since 7.0)
+#
 # @cbitpos: C-bit location in page table entry
 #
 # @reduced-phys-bits: Number of physical Address bit reduction when SEV is
@@ -187,6 +189,7 @@
 { 'struct': 'SevCapability',
   'data': { 'pdh': 'str',
             'cert-chain': 'str',
+            'cpu0-id': 'str',
             'cbitpos': 'int',
             'reduced-phys-bits': 'int'},
   'if': 'TARGET_I386' }
@@ -205,6 +208,7 @@
 #
 # -> { "execute": "query-sev-capabilities" }
 # <- { "return": { "pdh": "8CCDD8DDD", "cert-chain": "888CCCDDDEE",
+#                  "cpu0-id": "5ea2e1...90ea39",
 #                  "cbitpos": 47, "reduced-phys-bits": 5}}
 #
 ##
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 025ff7a6f8..c87c69b2f3 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -82,6 +82,8 @@ struct SevGuestState {
 #define DEFAULT_GUEST_POLICY    0x1 /* disable debug */
 #define DEFAULT_SEV_DEVICE      "/dev/sev"
 
+#define SEV_UNIQUE_ID_LEN       64
+
 #define SEV_INFO_BLOCK_GUID     "00f771de-1a7e-4fcb-890e-68c77e2fb44e"
 typedef struct __attribute__((__packed__)) SevInfoBlock {
     /* SEV-ES Reset Vector Address */
@@ -531,11 +533,47 @@ e_free:
     return 1;
 }
 
+static int
+sev_get_id(int fd, guchar *id_buf, size_t id_buf_len, Error **errp)
+{
+    struct sev_user_data_get_id2 id = {
+        .address = (unsigned long)id_buf,
+        .length = id_buf_len
+    };
+    int err, r;
+
+    r = sev_platform_ioctl(fd, SEV_GET_ID2, &id, &err);
+    if (r < 0) {
+        error_setg(errp, "SEV: Failed to get ID ret=%d fw_err=%d (%s)",
+                   r, err, fw_error_to_str(err));
+        return 1;
+    }
+
+    return 0;
+}
+
+static const char hex[] = "0123456789abcdef";
+
+static gchar *hex_encode(guchar *buf, size_t len)
+{
+    gchar *str = g_new0(gchar, (len * 2) + 1);
+    size_t i;
+
+    for (i = 0; i < len; i++) {
+        str[(i * 2)] = hex[(buf[i] >> 4) & 0xf];
+        str[(i * 2) + 1] = hex[buf[i] & 0xf];
+    }
+    str[len * 2] = '\0';
+
+    return str;
+}
+
 static SevCapability *sev_get_capabilities(Error **errp)
 {
     SevCapability *cap = NULL;
     guchar *pdh_data = NULL;
     guchar *cert_chain_data = NULL;
+    guchar cpu0_id[SEV_UNIQUE_ID_LEN];
     size_t pdh_len = 0, cert_chain_len = 0;
     uint32_t ebx;
     int fd;
@@ -561,9 +599,14 @@ static SevCapability *sev_get_capabilities(Error **errp)
         goto out;
     }
 
+    if (sev_get_id(fd, cpu0_id, sizeof(cpu0_id), errp)) {
+        goto out;
+    }
+
     cap = g_new0(SevCapability, 1);
     cap->pdh = g_base64_encode(pdh_data, pdh_len);
     cap->cert_chain = g_base64_encode(cert_chain_data, cert_chain_len);
+    cap->cpu0_id = hex_encode(cpu0_id, sizeof(cpu0_id));
 
     host_cpuid(0x8000001F, 0, NULL, &ebx, NULL, NULL);
     cap->cbitpos = ebx & 0x3f;
-- 
2.25.1



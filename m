Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBF04C23FB
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 07:16:29 +0100 (CET)
Received: from localhost ([::1]:42200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN7QS-0005IX-Pr
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 01:16:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nN7OY-0003p1-Fa
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 01:14:31 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nN7OW-0001vO-9W
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 01:14:30 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21O2H7SW019860; 
 Thu, 24 Feb 2022 06:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=JOWbtoLa7hHWLAK6c0jcT9wvYIA8GDg1sNyKDmzUIxg=;
 b=AkA9YUPHv6M5P5Ms7WgZMbt54tmVygeaOJWmG2eDpBV/c2jxUZJ6ycSsNNt3hS33eJ9U
 eXMxmd5U43lvSPNFhMFGqKtEhpayEyAGCRvWmS9FqzhqQ9TF9netXK5HLfKTMhxK+OaG
 XAtsxDqaTPeaTy/KSCrgxhXOxL+xgpWWhZ0c6BL8hh0WAbc6mBXihVLazf/pf1jvRVz/
 bGD75HDYl9xdYZbLHI4cjKZVl7a2uzUvdIvxLi6fbdVwOiyL43MVwXJ//kAhoIvrdhJk
 cuUI6nzK0NRrJbng9TM5bsIWS0XIZYSbzCtx+uoB8mPBJPx71GN+feOXjETOYOtqhYiJ ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3edpjv2fa8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 06:14:21 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21O5vOm8021978;
 Thu, 24 Feb 2022 06:14:21 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3edpjv2f9s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 06:14:21 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21O6CF1x015932;
 Thu, 24 Feb 2022 06:14:19 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 3ear6apver-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 06:14:19 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21O6EHLW13763224
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Feb 2022 06:14:17 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D13F6A05F;
 Thu, 24 Feb 2022 06:14:17 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41FC76A04F;
 Thu, 24 Feb 2022 06:14:16 +0000 (GMT)
Received: from amdrome3.watson.ibm.com (unknown [9.2.130.16])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 24 Feb 2022 06:14:16 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] qapi,
 target/i386/sev: Add cpu0-id to query-sev-capabilities
Date: Thu, 24 Feb 2022 06:14:05 +0000
Message-Id: <20220224061405.1959756-1-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4sBaKUnIfES2Edc7oyNhArS3ySejlt2b
X-Proofpoint-GUID: zCF5yTWWuQxyi3zHSgFqFMsuSVTYy6mW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-23_09,2022-02-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202240035
Received-SPF: pass client-ip=148.163.156.1;
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

Add a new field 'cpu0-id' to the response of query-sev-capabilities QMP
command.  The value of the field is the base64-encoded 64-byte unique ID
of the CPU0 (socket 0), which can be used to retrieve the signed CEK of
the CPU from AMD's Key Distribution Service (KDS).

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>

---

v2:
- change encoding to Base64 (thanks Daniel)
- rename constant to SEV_CPU_UNIQUE_ID_LEN
---
 qapi/misc-target.json |  4 ++++
 target/i386/sev.c     | 27 +++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 4bc45d2474..c6d9ad69e1 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -177,6 +177,8 @@
 #
 # @cert-chain:  PDH certificate chain (base64 encoded)
 #
+# @cpu0-id: 64-byte unique ID of CPU0 (base64 encoded) (since 7.0)
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
+#                  "cpu0-id": "2lvmGwo+...61iEinw==",
 #                  "cbitpos": 47, "reduced-phys-bits": 5}}
 #
 ##
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 025ff7a6f8..d3d2680e16 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -82,6 +82,8 @@ struct SevGuestState {
 #define DEFAULT_GUEST_POLICY    0x1 /* disable debug */
 #define DEFAULT_SEV_DEVICE      "/dev/sev"
 
+#define SEV_CPU_UNIQUE_ID_LEN   64
+
 #define SEV_INFO_BLOCK_GUID     "00f771de-1a7e-4fcb-890e-68c77e2fb44e"
 typedef struct __attribute__((__packed__)) SevInfoBlock {
     /* SEV-ES Reset Vector Address */
@@ -531,11 +533,31 @@ e_free:
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
 static SevCapability *sev_get_capabilities(Error **errp)
 {
     SevCapability *cap = NULL;
     guchar *pdh_data = NULL;
     guchar *cert_chain_data = NULL;
+    guchar cpu0_id[SEV_CPU_UNIQUE_ID_LEN];
     size_t pdh_len = 0, cert_chain_len = 0;
     uint32_t ebx;
     int fd;
@@ -561,9 +583,14 @@ static SevCapability *sev_get_capabilities(Error **errp)
         goto out;
     }
 
+    if (sev_get_id(fd, cpu0_id, sizeof(cpu0_id), errp)) {
+        goto out;
+    }
+
     cap = g_new0(SevCapability, 1);
     cap->pdh = g_base64_encode(pdh_data, pdh_len);
     cap->cert_chain = g_base64_encode(cert_chain_data, cert_chain_len);
+    cap->cpu0_id = g_base64_encode(cpu0_id, sizeof(cpu0_id));
 
     host_cpuid(0x8000001F, 0, NULL, &ebx, NULL, NULL);
     cap->cbitpos = ebx & 0x3f;
-- 
2.25.1



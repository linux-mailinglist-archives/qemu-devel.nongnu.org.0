Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEC44C65C3
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 10:35:52 +0100 (CET)
Received: from localhost ([::1]:55394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOcRb-0000sq-Kr
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 04:35:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nOcMY-0006Ic-H0
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 04:30:38 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49622
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nOcMS-0000W3-9g
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 04:30:37 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21S8PXd8004984; 
 Mon, 28 Feb 2022 09:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=NkFzgT4Ps0Jdy+ctjXk1iqHsHkQRt91PdfjMNwzEdxw=;
 b=FDQaiCuT8NbLFbWK6r5A4jH+BMsq9IhLFZGHm0fbbFnc1YrYNVbsFaNI6MBtXetX5NXE
 EU+ecnNZaEsEhIPLF+VujDcrp+K50mFf3woWVtVJPpIG1NZV+r51kuJ7ULYoaOQ9n0vM
 m7A+l9+poxKyV8ykd/3JCWurmyaDzlHvYtOKi5ij/gsrY5GlJwC0p5YvA5W1bqFYDS+k
 +eiG48D3Dd0JXkRDlv2jGIMqtP0xilL8GZw/zIC3qziZE7pnq1ooFneCcrdL2Mpt7xJS
 I7i1/qsFJVMq3iTiSf+Al3JaoH5O1Zx7KKGoRmI0Ut+Qb0MhZgyMZduM90LULyt4kAsT ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3egnvk09y0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 09:30:28 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21S9O505006685;
 Mon, 28 Feb 2022 09:30:28 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3egnvk09xn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 09:30:27 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21S9DMPG013001;
 Mon, 28 Feb 2022 09:30:27 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03dal.us.ibm.com with ESMTP id 3egfsrp4c9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 09:30:27 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21S9UPKG14024994
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 09:30:25 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2F2FB2068;
 Mon, 28 Feb 2022 09:30:25 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B0C0B2065;
 Mon, 28 Feb 2022 09:30:25 +0000 (GMT)
Received: from amdrome3.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 28 Feb 2022 09:30:25 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] qapi,
 target/i386/sev: Add cpu0-id to query-sev-capabilities
Date: Mon, 28 Feb 2022 09:30:14 +0000
Message-Id: <20220228093014.882288-1-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: y61pevooK-yhXSXZ-_KnE-bnCfSZpDDZ
X-Proofpoint-ORIG-GUID: W1sC8tsEyT20s7LJz7cfmdCfsivU_MRO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_03,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202280051
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

Add a new field 'cpu0-id' to the response of query-sev-capabilities QMP
command.  The value of the field is the base64-encoded unique ID of CPU0
(socket 0), which can be used to retrieve the signed CEK of the CPU from
AMD's Key Distribution Service (KDS).

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>

---

v3:
- dynamically get the ID length from the firmware and allocate a buffer
  accordingly (thanks Daniel)

v2:
- change encoding to Base64 (thanks Daniel)
- rename constant to SEV_CPU_UNIQUE_ID_LEN
---
 qapi/misc-target.json |  4 ++++
 target/i386/sev.c     | 42 +++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 4bc45d2474..a896ab907b 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -177,6 +177,8 @@
 #
 # @cert-chain:  PDH certificate chain (base64 encoded)
 #
+# @cpu0-id: Unique ID of CPU0 (base64 encoded) (since 7.0)
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
index 025ff7a6f8..32f7dbac4e 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -531,12 +531,46 @@ e_free:
     return 1;
 }
 
+static int sev_get_cpu0_id(int fd, guchar **id, size_t *id_len, Error **errp)
+{
+    guchar *id_data;
+    struct sev_user_data_get_id2 get_id2 = {};
+    int err, r;
+
+    /* query the ID length */
+    r = sev_platform_ioctl(fd, SEV_GET_ID2, &get_id2, &err);
+    if (r < 0 && err != SEV_RET_INVALID_LEN) {
+        error_setg(errp, "SEV: Failed to get ID ret=%d fw_err=%d (%s)",
+                   r, err, fw_error_to_str(err));
+        return 1;
+    }
+
+    id_data = g_new(guchar, get_id2.length);
+    get_id2.address = (unsigned long)id_data;
+
+    r = sev_platform_ioctl(fd, SEV_GET_ID2, &get_id2, &err);
+    if (r < 0) {
+        error_setg(errp, "SEV: Failed to get ID ret=%d fw_err=%d (%s)",
+                   r, err, fw_error_to_str(err));
+        goto err;
+    }
+
+    *id = id_data;
+    *id_len = get_id2.length;
+    return 0;
+
+err:
+    g_free(id_data);
+    return 1;
+}
+
 static SevCapability *sev_get_capabilities(Error **errp)
 {
     SevCapability *cap = NULL;
     guchar *pdh_data = NULL;
     guchar *cert_chain_data = NULL;
-    size_t pdh_len = 0, cert_chain_len = 0;
+    guchar *cpu0_id_data = NULL;
+    size_t pdh_len = 0, cert_chain_len = 0, cpu0_id_len = 0;
     uint32_t ebx;
     int fd;
 
@@ -561,9 +595,14 @@ static SevCapability *sev_get_capabilities(Error **errp)
         goto out;
     }
 
+    if (sev_get_cpu0_id(fd, &cpu0_id_data, &cpu0_id_len, errp)) {
+        goto out;
+    }
+
     cap = g_new0(SevCapability, 1);
     cap->pdh = g_base64_encode(pdh_data, pdh_len);
     cap->cert_chain = g_base64_encode(cert_chain_data, cert_chain_len);
+    cap->cpu0_id = g_base64_encode(cpu0_id_data, cpu0_id_len);
 
     host_cpuid(0x8000001F, 0, NULL, &ebx, NULL, NULL);
     cap->cbitpos = ebx & 0x3f;
@@ -575,6 +614,7 @@ static SevCapability *sev_get_capabilities(Error **errp)
     cap->reduced_phys_bits = 1;
 
 out:
+    g_free(cpu0_id_data);
     g_free(pdh_data);
     g_free(cert_chain_data);
     close(fd);
-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D66BE6A7D9E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 10:25:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXfAa-0006IA-Kn; Thu, 02 Mar 2023 04:24:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pXfAY-0006HT-OP
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:24:10 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pXfAX-0002zt-3w
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:24:10 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3228HAxo006439; Thu, 2 Mar 2023 09:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=+kykg0JiluwnhLvda5rirxI9DFW2F0Z9NViicfTgT6s=;
 b=Tqn+JLdYK5021YuKuIu0PtXb1KI9+4KENo4bATdD/l4vHkZaR04+5ehrzZQ5t3UomuON
 LtRqljVr0cwwNKbsmj3UvUWcG0NTN0xyNKluOUL1hT1/UlzmKhvpwwSuIt2hI9BvEGXO
 Gc+AQRRc1NTV4ukHgsvkk0aL3gMSvnP0ZmH03UAnEKozH9TBpFITTykdrzfB/QlldTbz
 wlfr4lUFeAY8XJMfJslTmWLPi0PhuWVka2Ldi633+RtFw2t04ZnsTPPeBfUQkGPKvhm5
 keNbHiGJMnpVzxR9mVGO03bI6iAlO4XiPZL3WueCj/OgPb0rh5/rDPoHO7IEX97BoU21 fA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p2r5essu5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 09:24:05 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3229InA9021788;
 Thu, 2 Mar 2023 09:24:04 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p2r5esstj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 09:24:04 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3227kWLN005616;
 Thu, 2 Mar 2023 09:24:03 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([9.208.129.116])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3nybexjy6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 09:24:03 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3229O10R131742
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Mar 2023 09:24:01 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD14858053;
 Thu,  2 Mar 2023 09:23:58 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4225758059;
 Thu,  2 Mar 2023 09:23:57 +0000 (GMT)
Received: from amdmilan1.watson.ibm.com (unknown [9.2.130.16])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  2 Mar 2023 09:23:57 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Mario Smarduch <mario.smarduch@amd.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Subject: [RFC PATCH v3 3/4] i386/sev: Reorder struct declarations
Date: Thu,  2 Mar 2023 09:23:46 +0000
Message-Id: <20230302092347.1988853-4-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230302092347.1988853-1-dovmurik@linux.ibm.com>
References: <20230302092347.1988853-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6n3vBw9KbpP8w-4km2WxW7Fp8MygQWMD
X-Proofpoint-ORIG-GUID: IJAAkW4CEfKvdhxNypN7gXmFZiX9i4Ti
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_04,2023-03-02_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=958
 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303020078
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Move the declaration of PaddedSevHashTable before SevSnpGuest so
we can add a new such field to the latter.

No functional change intended.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
---
 target/i386/sev.c | 56 +++++++++++++++++++++++------------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index a3c5c10f5f..126e40ec26 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -40,6 +40,34 @@
 #include "exec/address-spaces.h"
 #include "exec/ramblock.h"
 
+/* hard code sha256 digest size */
+#define HASH_SIZE 32
+
+typedef struct QEMU_PACKED SevHashTableEntry {
+    QemuUUID guid;
+    uint16_t len;
+    uint8_t hash[HASH_SIZE];
+} SevHashTableEntry;
+
+typedef struct QEMU_PACKED SevHashTable {
+    QemuUUID guid;
+    uint16_t len;
+    SevHashTableEntry cmdline;
+    SevHashTableEntry initrd;
+    SevHashTableEntry kernel;
+} SevHashTable;
+
+/*
+ * Data encrypted by sev_encrypt_flash() must be padded to a multiple of
+ * 16 bytes.
+ */
+typedef struct QEMU_PACKED PaddedSevHashTable {
+    SevHashTable ht;
+    uint8_t padding[ROUND_UP(sizeof(SevHashTable), 16) - sizeof(SevHashTable)];
+} PaddedSevHashTable;
+
+QEMU_BUILD_BUG_ON(sizeof(PaddedSevHashTable) % 16 != 0);
+
 #define TYPE_SEV_COMMON "sev-common"
 OBJECT_DECLARE_SIMPLE_TYPE(SevCommonState, SEV_COMMON)
 #define TYPE_SEV_GUEST "sev-guest"
@@ -123,34 +151,6 @@ typedef struct QEMU_PACKED SevHashTableDescriptor {
     uint32_t size;
 } SevHashTableDescriptor;
 
-/* hard code sha256 digest size */
-#define HASH_SIZE 32
-
-typedef struct QEMU_PACKED SevHashTableEntry {
-    QemuUUID guid;
-    uint16_t len;
-    uint8_t hash[HASH_SIZE];
-} SevHashTableEntry;
-
-typedef struct QEMU_PACKED SevHashTable {
-    QemuUUID guid;
-    uint16_t len;
-    SevHashTableEntry cmdline;
-    SevHashTableEntry initrd;
-    SevHashTableEntry kernel;
-} SevHashTable;
-
-/*
- * Data encrypted by sev_encrypt_flash() must be padded to a multiple of
- * 16 bytes.
- */
-typedef struct QEMU_PACKED PaddedSevHashTable {
-    SevHashTable ht;
-    uint8_t padding[ROUND_UP(sizeof(SevHashTable), 16) - sizeof(SevHashTable)];
-} PaddedSevHashTable;
-
-QEMU_BUILD_BUG_ON(sizeof(PaddedSevHashTable) % 16 != 0);
-
 static Error *sev_mig_blocker;
 
 static const char *const sev_fw_errlist[] = {
-- 
2.25.1



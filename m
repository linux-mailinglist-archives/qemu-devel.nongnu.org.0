Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28649698F06
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 09:50:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSZxO-0004H3-Ib; Thu, 16 Feb 2023 03:49:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pSZxM-0004Gm-Ma
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 03:49:32 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pSZxK-0005gJ-SB
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 03:49:32 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31G8hhxj032886; Thu, 16 Feb 2023 08:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=4eoxC+c2aYJEk+zj+9NaBpXAK4ZmEpAOvpvyUPlncoI=;
 b=Gd5NUhK44R/HjpAdGCH155skHwvUGNAKVoFfqblERY8WHb5nOOCKUTAcOmCraayV3VnE
 a66VF1nDMyODW9w5L2oq2EO18SEF1JVS9RKXEOObYNWtji8GXjmWHDVI0Ta0FHPSPgn/
 Bwyv41nAP55fy0TfGN7WAEtPR64x+/mP1dMIp5ovKP09Og1PTb222Op4JT2ykvzR/iFX
 NifK2hPZN4F6OL/qHShYakAzXyGrdQV21a4Ez8C/MsNu4LPLhQ/HcgKivlyvKTgUwUc5
 ywHRJI6Bgha3NYyGUhOlaoBdNk9/kIxvCJa/SqQ65nXoGC+ZPtrigGh/0yX7eZq6IEyT 3g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nsh7n042g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Feb 2023 08:49:28 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31G8j5CX036769;
 Thu, 16 Feb 2023 08:49:28 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nsh7n0426-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Feb 2023 08:49:28 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31G7W9Hp007447;
 Thu, 16 Feb 2023 08:49:27 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
 by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3np2n7fycv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Feb 2023 08:49:27 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31G8nPOa29295298
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Feb 2023 08:49:25 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55BA15805B;
 Thu, 16 Feb 2023 08:49:25 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F004458058;
 Thu, 16 Feb 2023 08:49:23 +0000 (GMT)
Received: from amdmilan1.watson.ibm.com (unknown [9.2.130.16])
 by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 16 Feb 2023 08:49:23 +0000 (GMT)
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
Subject: [RFC PATCH v2 1/2] qapi,
 i386: Move kernel-hashes to SevCommonProperties
Date: Thu, 16 Feb 2023 08:49:12 +0000
Message-Id: <20230216084913.2148508-2-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230216084913.2148508-1-dovmurik@linux.ibm.com>
References: <20230216084913.2148508-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: F9Vo4_JT9MBtwXTiT1jAmQn_SE9LKHj8
X-Proofpoint-ORIG-GUID: 6HGNuZ-YdWyQm9O1PhTc9XZ-FrZmEl8r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-16_06,2023-02-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302160070
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

In order to enable kernel-hashes for SNP, pull it from
SevGuestProperties to its parent SevCommonProperties so
it will be available for both SEV and SNP.
---
 qapi/qom.json     | 12 ++++++------
 target/i386/sev.c | 44 ++++++++++++++++++--------------------------
 2 files changed, 24 insertions(+), 32 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index 33abba0e04..9b2897d54c 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -836,6 +836,10 @@
 # @reduced-phys-bits: number of bits in physical addresses that become
 #                     unavailable when SEV is enabled
 #
+# @kernel-hashes: if true, add hashes of kernel/initrd/cmdline to a
+#                 designated guest firmware page for measured boot
+#                 with -kernel (default: false) (since 6.2)
+#
 # @upm-mode: configure Unmapped Private Memory mode
 #
 # @discard: configure how discarding is handled for memory after
@@ -848,6 +852,7 @@
   'data': { '*sev-device': 'str',
             '*cbitpos': 'uint32',
             'reduced-phys-bits': 'uint32',
+            '*kernel-hashes': 'bool',
             '*upm-mode': 'bool',
             '*discard': 'str' } }
 
@@ -864,10 +869,6 @@
 #
 # @handle: SEV firmware handle (default: 0)
 #
-# @kernel-hashes: if true, add hashes of kernel/initrd/cmdline to a
-#                 designated guest firmware page for measured boot
-#                 with -kernel (default: false) (since 6.2)
-#
 # Since: 2.12
 ##
 { 'struct': 'SevGuestProperties',
@@ -875,8 +876,7 @@
   'data': { '*dh-cert-file': 'str',
             '*session-file': 'str',
             '*policy': 'uint32',
-            '*handle': 'uint32',
-            '*kernel-hashes': 'bool' } }
+            '*handle': 'uint32' } }
 
 ##
 # @SevSnpGuestProperties:
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 758e8225c2..6b8e85888f 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -64,6 +64,7 @@ struct SevCommonState {
     char *sev_device;
     uint32_t cbitpos;
     uint32_t reduced_phys_bits;
+    bool kernel_hashes;
     bool upm_mode;
     char *discard;
 
@@ -88,7 +89,6 @@ struct SevGuestState {
     uint32_t policy;
     char *dh_cert_file;
     char *session_file;
-    bool kernel_hashes;
 };
 
 struct SevSnpGuestState {
@@ -390,6 +390,16 @@ sev_common_set_sev_device(Object *obj, const char *value, Error **errp)
     SEV_COMMON(obj)->sev_device = g_strdup(value);
 }
 
+static bool sev_common_get_kernel_hashes(Object *obj, Error **errp)
+{
+    return SEV_COMMON(obj)->kernel_hashes;
+}
+
+static void sev_common_set_kernel_hashes(Object *obj, bool value, Error **errp)
+{
+    SEV_COMMON(obj)->kernel_hashes = value;
+}
+
 static bool sev_common_get_upm_mode(Object *obj, Error **errp)
 {
     return SEV_COMMON(obj)->upm_mode;
@@ -420,6 +430,11 @@ sev_common_class_init(ObjectClass *oc, void *data)
                                   sev_common_set_sev_device);
     object_class_property_set_description(oc, "sev-device",
             "SEV device to use");
+    object_class_property_add_bool(oc, "kernel-hashes",
+                                   sev_common_get_kernel_hashes,
+                                   sev_common_set_kernel_hashes);
+    object_class_property_set_description(oc, "kernel-hashes",
+            "add kernel hashes to guest firmware for measured Linux boot");
     object_class_property_add_bool(oc, "upm-mode",
                                    sev_common_get_upm_mode,
                                    sev_common_set_upm_mode);
@@ -484,20 +499,6 @@ sev_guest_set_session_file(Object *obj, const char *value, Error **errp)
     SEV_GUEST(obj)->session_file = g_strdup(value);
 }
 
-static bool sev_guest_get_kernel_hashes(Object *obj, Error **errp)
-{
-    SevGuestState *sev_guest = SEV_GUEST(obj);
-
-    return sev_guest->kernel_hashes;
-}
-
-static void sev_guest_set_kernel_hashes(Object *obj, bool value, Error **errp)
-{
-    SevGuestState *sev = SEV_GUEST(obj);
-
-    sev->kernel_hashes = value;
-}
-
 static void
 sev_guest_class_init(ObjectClass *oc, void *data)
 {
@@ -511,11 +512,6 @@ sev_guest_class_init(ObjectClass *oc, void *data)
                                   sev_guest_set_session_file);
     object_class_property_set_description(oc, "session-file",
             "guest owners session parameters (encoded with base64)");
-    object_class_property_add_bool(oc, "kernel-hashes",
-                                   sev_guest_get_kernel_hashes,
-                                   sev_guest_set_kernel_hashes);
-    object_class_property_set_description(oc, "kernel-hashes",
-            "add kernel hashes to guest firmware for measured Linux boot");
 }
 
 static void
@@ -2088,16 +2084,12 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
     MemTxAttrs attrs = { 0 };
     bool ret = true;
     SevCommonState *sev_common = SEV_COMMON(MACHINE(qdev_get_machine())->cgs);
-    SevGuestState *sev_guest =
-        (SevGuestState *)object_dynamic_cast(OBJECT(sev_common),
-                                             TYPE_SEV_GUEST);
 
     /*
      * Only add the kernel hashes if the sev-guest configuration explicitly
-     * stated kernel-hashes=on. Currently only enabled for SEV/SEV-ES guests,
-     * so check for TYPE_SEV_GUEST as well.
+     * stated kernel-hashes=on.
      */
-    if (sev_guest && !sev_guest->kernel_hashes) {
+    if (!sev_common->kernel_hashes) {
         return false;
     }
 
-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF116A7D9B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 10:25:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXfAW-0006EW-M3; Thu, 02 Mar 2023 04:24:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pXfAU-0006Cy-B3
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:24:06 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pXfAS-0002yR-Gs
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:24:06 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3228ZkuI021884; Thu, 2 Mar 2023 09:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=hq6+PiXSjq/SERbehe6IHlKkSd1zE0ohkKg6DQTbGvY=;
 b=tnlMVcTsri4iO9R4qPHTXPf4EGQskLGlVix3458UlMA/Ds2Wv+sp6T6MPrxOyYtiEfnj
 AgmZ8c7tE0/7rSV4fiZIyQK/imqpEjoBTP+763U+la+kbGafQWQc1PAIy7REe7ydd871
 xfzG6OBk+7bj49wepaK+tXha97pzV4ZheMk/SpkcMlAXDrdGrpLWqqDWp98uDOK72dY2
 9T9pTvizt6Qmoxhz/KVe8v/vJOdkKY7DmB6OoERss3fs1Zsu3jwd9jy2AO7bZ+uhGGQ/
 5+KZFrUgJHGLLHq3vhYHQEvpXss8pP6+/1TdsqRwqD02WC7muFjEO+Jv5DoeEyDSavvA RA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p2re31buj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 09:23:58 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3228tLls009110;
 Thu, 2 Mar 2023 09:23:58 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p2re31bu7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 09:23:57 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32264gHT020103;
 Thu, 2 Mar 2023 09:23:57 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
 by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3nybe241g8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 09:23:57 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3229NtrO36307622
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Mar 2023 09:23:55 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 641B958043;
 Thu,  2 Mar 2023 09:23:55 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E8A8658059;
 Thu,  2 Mar 2023 09:23:53 +0000 (GMT)
Received: from amdmilan1.watson.ibm.com (unknown [9.2.130.16])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  2 Mar 2023 09:23:53 +0000 (GMT)
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
Subject: [RFC PATCH v3 1/4] qapi,
 i386: Move kernel-hashes to SevCommonProperties
Date: Thu,  2 Mar 2023 09:23:44 +0000
Message-Id: <20230302092347.1988853-2-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230302092347.1988853-1-dovmurik@linux.ibm.com>
References: <20230302092347.1988853-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GbBSxo5EroMT4xog73rnnTlIOqtFFGPH
X-Proofpoint-ORIG-GUID: U76tqW2Hdntgm3lYUppAtYydfiVryD45
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_04,2023-03-02_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303020078
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
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



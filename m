Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D50D144809A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 14:52:05 +0100 (CET)
Received: from localhost ([::1]:38704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk548-0001CO-QV
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 08:52:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mk517-0007QC-4U
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 08:48:57 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mk513-0004TU-Hv
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 08:48:56 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A8DjXWP034895; 
 Mon, 8 Nov 2021 13:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=/FOwKGd16Y2d+OB7fKyxrjnm4Xzfmq+e92omkJPRofk=;
 b=r4VvD48tKIPqna0sBHDbInflo6tVRhfLl5cD3FqDij1m9Qth7OQRdtD6pJ7PmU4lSnBM
 RABHG8KuLnGXx+Pn1g3NWBf5x04+FeQBxCTrHknfb/5sDN7fJPPawEKANUP83+JykkEl
 LXS4sjUaLW4+fZjPo8nHtWiIewLYv/Po3R+38UMpqH+T/qg1xOo+Jyb/4266R/LEKm/4
 sWfzm+89+r6JyXyhyOl7UVK1UOvXaQigb4fJsAwribmNQZ8fZHPPyLIWWa19I0pBorxK
 PnAqNfhRbz3NjBmHiNkAMrB4pwQYGHaLUXnnEDaHI1zKwGxicuuOkryvK0qWiSNLMeTk Aw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c66rq0dt0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 13:48:49 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A8DZuCo027767;
 Mon, 8 Nov 2021 13:48:48 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c66rq0dsq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 13:48:48 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A8DmWGP025459;
 Mon, 8 Nov 2021 13:48:47 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03dal.us.ibm.com with ESMTP id 3c5hba3bbw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 13:48:47 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A8DmkEd48169216
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Nov 2021 13:48:46 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CFE5124058;
 Mon,  8 Nov 2021 13:48:46 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25974124054;
 Mon,  8 Nov 2021 13:48:46 +0000 (GMT)
Received: from amdrome3.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  8 Nov 2021 13:48:46 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/6] qapi/qom,
 target/i386: sev-guest: Introduce kernel-hashes=on|off option
Date: Mon,  8 Nov 2021 13:48:35 +0000
Message-Id: <20211108134840.2757206-2-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211108134840.2757206-1-dovmurik@linux.ibm.com>
References: <20211108134840.2757206-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: g8tHOMUmF5htONAVcA3CZJL-G6MDqiGi
X-Proofpoint-GUID: ORr72AZodzGTbvpq9ZqWc-WG1QIssKId
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_05,2021-11-08_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111080084
Received-SPF: pass client-ip=148.163.156.1;
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce new boolean 'kernel-hashes' option on the sev-guest object.
It will be used to to decide whether to add the hashes of
kernel/initrd/cmdline to SEV guest memory when booting with -kernel.
The default value is 'off'.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
---
 qapi/qom.json     |  7 ++++++-
 target/i386/sev.c | 20 ++++++++++++++++++++
 qemu-options.hx   |  6 +++++-
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index ccd1167808..4fd5d1716b 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -769,6 +769,10 @@
 # @reduced-phys-bits: number of bits in physical addresses that become
 #                     unavailable when SEV is enabled
 #
+# @kernel-hashes: if true, add hashes of kernel/initrd/cmdline to a
+#                 designated guest firmware page for measured boot
+#                 with -kernel (default: false)
+#
 # Since: 2.12
 ##
 { 'struct': 'SevGuestProperties',
@@ -778,7 +782,8 @@
             '*policy': 'uint32',
             '*handle': 'uint32',
             '*cbitpos': 'uint32',
-            'reduced-phys-bits': 'uint32' } }
+            'reduced-phys-bits': 'uint32',
+            '*kernel-hashes': 'bool' } }
 
 ##
 # @ObjectType:
diff --git a/target/i386/sev.c b/target/i386/sev.c
index eede07f11d..cad32812f5 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -62,6 +62,7 @@ struct SevGuestState {
     char *session_file;
     uint32_t cbitpos;
     uint32_t reduced_phys_bits;
+    bool kernel_hashes;
 
     /* runtime state */
     uint32_t handle;
@@ -327,6 +328,20 @@ sev_guest_set_sev_device(Object *obj, const char *value, Error **errp)
     sev->sev_device = g_strdup(value);
 }
 
+static bool sev_guest_get_kernel_hashes(Object *obj, Error **errp)
+{
+    SevGuestState *sev = SEV_GUEST(obj);
+
+    return sev->kernel_hashes;
+}
+
+static void sev_guest_set_kernel_hashes(Object *obj, bool value, Error **errp)
+{
+    SevGuestState *sev = SEV_GUEST(obj);
+
+    sev->kernel_hashes = value;
+}
+
 static void
 sev_guest_class_init(ObjectClass *oc, void *data)
 {
@@ -345,6 +360,11 @@ sev_guest_class_init(ObjectClass *oc, void *data)
                                   sev_guest_set_session_file);
     object_class_property_set_description(oc, "session-file",
             "guest owners session parameters (encoded with base64)");
+    object_class_property_add_bool(oc, "kernel-hashes",
+                                   sev_guest_get_kernel_hashes,
+                                   sev_guest_set_kernel_hashes);
+    object_class_property_set_description(oc, "kernel-hashes",
+            "add kernel hashes to guest firmware for measured Linux boot");
 }
 
 static void
diff --git a/qemu-options.hx b/qemu-options.hx
index f051536b63..f50fdc3e47 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -5189,7 +5189,7 @@ SRST
                  -object secret,id=sec0,keyid=secmaster0,format=base64,\\
                      data=$SECRET,iv=$(<iv.b64)
 
-    ``-object sev-guest,id=id,cbitpos=cbitpos,reduced-phys-bits=val,[sev-device=string,policy=policy,handle=handle,dh-cert-file=file,session-file=file]``
+    ``-object sev-guest,id=id,cbitpos=cbitpos,reduced-phys-bits=val,[sev-device=string,policy=policy,handle=handle,dh-cert-file=file,session-file=file,kernel-hashes=on|off]``
         Create a Secure Encrypted Virtualization (SEV) guest object,
         which can be used to provide the guest memory encryption support
         on AMD processors.
@@ -5229,6 +5229,10 @@ SRST
         session with the guest owner to negotiate keys used for
         attestation. The file must be encoded in base64.
 
+        The ``kernel-hashes`` adds the hashes of given kernel/initrd/
+        cmdline to a designated guest firmware page for measured Linux
+        boot with -kernel. The default is off.
+
         e.g to launch a SEV guest
 
         .. parsed-literal::
-- 
2.25.1



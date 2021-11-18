Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF2E455D0F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 14:55:07 +0100 (CET)
Received: from localhost ([::1]:58924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnhsY-0005Sj-8S
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 08:55:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mnha7-0008Bw-UR
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 08:36:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mnha5-0002mE-IH
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 08:36:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637242560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sC2/GhPsa55zwleyfZCLuH4QLV2IrFnSorCZ7OtK/E8=;
 b=d521wthj1v/hspxOmM+NUS+EP++2lYxEuNcZqrgtLQJYlP+z5yQZhi/b01qndAc2QX6e0a
 G4XNQMXaYHOoWy2QY/SgJGQ9vfFkscfbY0QJRX8cCEVHzgLtGDq9vHXzghDYmVJyEr2ASN
 8JAaWDJy7QNWgg42RqCQTAwYkiTZxYM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-FbknGE8nP2Wazk_YUFwJSw-1; Thu, 18 Nov 2021 08:35:58 -0500
X-MC-Unique: FbknGE8nP2Wazk_YUFwJSw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93808E76A;
 Thu, 18 Nov 2021 13:35:57 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA59F62A41;
 Thu, 18 Nov 2021 13:35:55 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/6] qapi/qom,
 target/i386: sev-guest: Introduce kernel-hashes=on|off option
Date: Thu, 18 Nov 2021 13:35:27 +0000
Message-Id: <20211118133532.2029166-2-berrange@redhat.com>
In-Reply-To: <20211118133532.2029166-1-berrange@redhat.com>
References: <20211118133532.2029166-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Marcelo Tosatti <mtosatti@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dov Murik <dovmurik@linux.ibm.com>

Introduce new boolean 'kernel-hashes' option on the sev-guest object.
It will be used to to decide whether to add the hashes of
kernel/initrd/cmdline to SEV guest memory when booting with -kernel.
The default value is 'off'.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
Acked-by: Brijesh Singh <brijesh.singh@amd.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 qapi/qom.json     |  7 ++++++-
 qemu-options.hx   |  6 +++++-
 target/i386/sev.c | 20 ++++++++++++++++++++
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index ccd1167808..eeb5395ff3 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -769,6 +769,10 @@
 # @reduced-phys-bits: number of bits in physical addresses that become
 #                     unavailable when SEV is enabled
 #
+# @kernel-hashes: if true, add hashes of kernel/initrd/cmdline to a
+#                 designated guest firmware page for measured boot
+#                 with -kernel (default: false) (since 6.2)
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
diff --git a/qemu-options.hx b/qemu-options.hx
index 7749f59300..ae2c6dbbfc 100644
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
+        boot with -kernel. The default is off. (Since 6.2)
+
         e.g to launch a SEV guest
 
         .. parsed-literal::
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
-- 
2.31.1



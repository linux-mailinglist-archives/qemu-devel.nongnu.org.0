Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F23D563826D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 03:33:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyOVo-0006n2-UG; Thu, 24 Nov 2022 21:32:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaloy@redhat.com>) id 1oyOVn-0006mq-2B
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 21:32:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaloy@redhat.com>) id 1oyOVl-0001U5-Fe
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 21:32:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669343536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=bfhbBd5clxkrAam9IuiBMZGGJ0zIPWSvIZjYg9RtqBg=;
 b=cfN2EZiGapnSfyB7u1CNbe3PR8axoH6+NbaZUL7lv/KhBBLWVqXcGuQFayi3CO02GxeeNp
 bmSCkkTsdxY5XhugjYDCCb1qb/AFT812SEJsq/sQulQ599lWQnHbIRY3c1KlwgU7HAfkoC
 BbCN4dXNql+WDLwfWrROe8XYTspq0Eg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-o1VK-c9_PGayOUKhR6Ng3w-1; Thu, 24 Nov 2022 21:32:14 -0500
X-MC-Unique: o1VK-c9_PGayOUKhR6Ng3w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7EAF800B23;
 Fri, 25 Nov 2022 02:32:13 +0000 (UTC)
Received: from fenrir.redhat.com (unknown [10.22.16.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BC462028E94;
 Fri, 25 Nov 2022 02:32:13 +0000 (UTC)
From: Jon Maloy <jmaloy@redhat.com>
To: qemu-devel@nongnu.org
Cc: jmaloy@redhat.com, jasowang@redhat.com, philmd@linaro.com,
 stefanha@redhat.com
Subject: [PATCH] SecurityPkg: check return value of GetEfiGlobalVariable2() in
 DxeImageVerificationHandler()
Date: Thu, 24 Nov 2022 21:32:11 -0500
Message-Id: <20221125023211.1700925-1-jmaloy@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jmaloy@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Fixes: CVE-2019-14560

GetEfiGlobalVariable2() is used in some instances when looking up the
SecureBoot UEFI variable. The API can fail in certain circumstances,
for example, if AllocatePool() fails or if gRT->GetVariable() fails.
In the case of secure boot checks, it is critical that this return value
is checked. if an attacker can cause the API to fail, it would currently
constitute a secure boot bypass.

This return value check is missing in the function DxeImageVerificationHand=
ler(),
so we add it here.

This commit is almost identical to one suggested by Jian J Wang <jian.j.wan=
g@intel.com>
on 2019-09-09, but that one was for some reason never posted to the edk2-de=
vel
list. We now make a new attempt to get it reviewed and applied.

Signed-off-by: Jon Maloy <jmaloy@redhat.com>
---
 .../DxeImageVerificationLib.c                 | 39 +++++++++++--------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerificati=
onLib.c b/SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerificationL=
ib.c
index 66e2f5eaa3..6c58b71d37 100644
--- a/SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerificationLib.c
+++ b/SecurityPkg/Library/DxeImageVerificationLib/DxeImageVerificationLib.c
@@ -1686,6 +1686,7 @@ DxeImageVerificationHandler (
   RETURN_STATUS                 PeCoffStatus;=0D
   EFI_STATUS                    HashStatus;=0D
   EFI_STATUS                    DbStatus;=0D
+  EFI_STATUS                    SecBootStatus;
   BOOLEAN                       IsFound;=0D
 =0D
   SignatureList     =3D NULL;=0D
@@ -1742,23 +1743,29 @@ DxeImageVerificationHandler (
     CpuDeadLoop ();=0D
   }=0D
 =0D
-  GetEfiGlobalVariable2 (EFI_SECURE_BOOT_MODE_NAME, (VOID **)&SecureBoot, =
NULL);=0D
-  //=0D
-  // Skip verification if SecureBoot variable doesn't exist.=0D
-  //=0D
-  if (SecureBoot =3D=3D NULL) {=0D
-    return EFI_SUCCESS;=0D
-  }=0D
-=0D
-  //=0D
-  // Skip verification if SecureBoot is disabled but not AuditMode=0D
-  //=0D
-  if (*SecureBoot =3D=3D SECURE_BOOT_MODE_DISABLE) {=0D
-    FreePool (SecureBoot);=0D
-    return EFI_SUCCESS;=0D
-  }=0D
+  SecBootStatus =3D GetEfiGlobalVariable2 (EFI_SECURE_BOOT_MODE_NAME, (VOI=
D **)&SecureBoot, NULL);
+  if (!EFI_ERROR (SecBootStatus)) {
+    if (SecureBoot =3D=3D NULL) {
+      //
+      // Skip verification if SecureBoot variable doesn't exist.
+      //
+      return EFI_SUCCESS;
+    } else {
+      //
+      // Skip verification if SecureBoot is disabled but not AuditMode
+      //
+      if (*SecureBoot =3D=3D SECURE_BOOT_MODE_DISABLE) {
+        FreePool (SecureBoot);
+        return EFI_SUCCESS;
+      }
+      FreePool (SecureBoot);
+    }
+  } else {
+    //
+    // Assume SecureBoot enabled in the case of error.
+    //
+   }
 =0D
-  FreePool (SecureBoot);=0D
 =0D
   //=0D
   // Read the Dos header.=0D
--=20
2.35.3



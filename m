Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A1B47D459
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 16:43:15 +0100 (CET)
Received: from localhost ([::1]:46638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n03lp-0006Pf-UN
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 10:43:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n03iY-0003Ri-PZ
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 10:39:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n03iN-00036t-Sn
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 10:39:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640187578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=S/QtwPETdKePLYIxaSgmvEGVJq3R+6vBHM3XMVMSBBY=;
 b=Rn+2ED8NPfk0V/DAeIwDbswy+SSZ34Gb8D0FmhUvZtHZibZHjgdJhY6zC/lOIRPNJ/oT2a
 r0dEqt5F9lbHGepgICHc10XXPyLUOhwg88cgqGKzbQU+04oxSD8mbtP56f5mJ5HjIvQKt/
 G60hhrPjjPWdhd4VekTbpldivDtSznY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-lRdc1utaN9aO5YjPyFfesA-1; Wed, 22 Dec 2021 10:39:35 -0500
X-MC-Unique: lRdc1utaN9aO5YjPyFfesA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4076801962;
 Wed, 22 Dec 2021 15:39:34 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 31F167AB4B;
 Wed, 22 Dec 2021 15:39:24 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/qtest/test-x86-cpuid-compat: Check for machines before
 using them
Date: Wed, 22 Dec 2021 16:39:23 +0100
Message-Id: <20211222153923.1000420-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The user might have disabled the pc-i440fx machine type (or it's older
versions, like done in downstream RHEL) in the QEMU binary, so let's
better check whether the machine types are available before using them.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/test-x86-cpuid-compat.c | 85 ++++++++++++++++-------------
 1 file changed, 48 insertions(+), 37 deletions(-)

diff --git a/tests/qtest/test-x86-cpuid-compat.c b/tests/qtest/test-x86-cpuid-compat.c
index f28848e06e..39138db774 100644
--- a/tests/qtest/test-x86-cpuid-compat.c
+++ b/tests/qtest/test-x86-cpuid-compat.c
@@ -302,54 +302,65 @@ int main(int argc, char **argv)
 
     /* Check compatibility of old machine-types that didn't
      * auto-increase level/xlevel/xlevel2: */
-
-    add_cpuid_test("x86/cpuid/auto-level/pc-2.7",
-                   "-machine pc-i440fx-2.7 -cpu 486,arat=on,avx512vbmi=on,xsaveopt=on",
-                   "level", 1);
-    add_cpuid_test("x86/cpuid/auto-xlevel/pc-2.7",
-                   "-machine pc-i440fx-2.7 -cpu 486,3dnow=on,sse4a=on,invtsc=on,npt=on,svm=on",
-                   "xlevel", 0);
-    add_cpuid_test("x86/cpuid/auto-xlevel2/pc-2.7",
-                   "-machine pc-i440fx-2.7 -cpu 486,xstore=on",
-                   "xlevel2", 0);
+    if (qtest_has_machine("pc-i440fx-2.7")) {
+        add_cpuid_test("x86/cpuid/auto-level/pc-2.7",
+                       "-machine pc-i440fx-2.7 -cpu 486,arat=on,avx512vbmi=on,xsaveopt=on",
+                       "level", 1);
+        add_cpuid_test("x86/cpuid/auto-xlevel/pc-2.7",
+                       "-machine pc-i440fx-2.7 -cpu 486,3dnow=on,sse4a=on,invtsc=on,npt=on,svm=on",
+                       "xlevel", 0);
+        add_cpuid_test("x86/cpuid/auto-xlevel2/pc-2.7",
+                       "-machine pc-i440fx-2.7 -cpu 486,xstore=on",
+                       "xlevel2", 0);
+    }
     /*
      * QEMU 1.4.0 had auto-level enabled for CPUID[7], already,
      * and the compat code that sets default level shouldn't
      * disable the auto-level=7 code:
      */
-    add_cpuid_test("x86/cpuid/auto-level7/pc-i440fx-1.4/off",
-                   "-machine pc-i440fx-1.4 -cpu Nehalem",
-                   "level", 2);
-    add_cpuid_test("x86/cpuid/auto-level7/pc-i440fx-1.5/on",
-                   "-machine pc-i440fx-1.4 -cpu Nehalem,smap=on",
-                   "level", 7);
-    add_cpuid_test("x86/cpuid/auto-level7/pc-i440fx-2.3/off",
-                   "-machine pc-i440fx-2.3 -cpu Penryn",
-                   "level", 4);
-    add_cpuid_test("x86/cpuid/auto-level7/pc-i440fx-2.3/on",
-                   "-machine pc-i440fx-2.3 -cpu Penryn,erms=on",
-                   "level", 7);
-    add_cpuid_test("x86/cpuid/auto-level7/pc-i440fx-2.9/off",
-                   "-machine pc-i440fx-2.9 -cpu Conroe",
-                   "level", 10);
-    add_cpuid_test("x86/cpuid/auto-level7/pc-i440fx-2.9/on",
-                   "-machine pc-i440fx-2.9 -cpu Conroe,erms=on",
-                   "level", 10);
+    if (qtest_has_machine("pc-i440fx-1.4")) {
+        add_cpuid_test("x86/cpuid/auto-level7/pc-i440fx-1.4/off",
+                       "-machine pc-i440fx-1.4 -cpu Nehalem",
+                       "level", 2);
+        add_cpuid_test("x86/cpuid/auto-level7/pc-i440fx-1.5/on",
+                       "-machine pc-i440fx-1.4 -cpu Nehalem,smap=on",
+                       "level", 7);
+    }
+    if (qtest_has_machine("pc-i440fx-2.3")) {
+        add_cpuid_test("x86/cpuid/auto-level7/pc-i440fx-2.3/off",
+                       "-machine pc-i440fx-2.3 -cpu Penryn",
+                       "level", 4);
+        add_cpuid_test("x86/cpuid/auto-level7/pc-i440fx-2.3/on",
+                       "-machine pc-i440fx-2.3 -cpu Penryn,erms=on",
+                       "level", 7);
+    }
+    if (qtest_has_machine("pc-i440fx-2.9")) {
+        add_cpuid_test("x86/cpuid/auto-level7/pc-i440fx-2.9/off",
+                       "-machine pc-i440fx-2.9 -cpu Conroe",
+                       "level", 10);
+        add_cpuid_test("x86/cpuid/auto-level7/pc-i440fx-2.9/on",
+                       "-machine pc-i440fx-2.9 -cpu Conroe,erms=on",
+                       "level", 10);
+    }
 
     /*
      * xlevel doesn't have any feature that triggers auto-level
      * code on old machine-types.  Just check that the compat code
      * is working correctly:
      */
-    add_cpuid_test("x86/cpuid/xlevel-compat/pc-i440fx-2.3",
-                   "-machine pc-i440fx-2.3 -cpu SandyBridge",
-                   "xlevel", 0x8000000a);
-    add_cpuid_test("x86/cpuid/xlevel-compat/pc-i440fx-2.4/npt-off",
-                   "-machine pc-i440fx-2.4 -cpu SandyBridge,",
-                   "xlevel", 0x80000008);
-    add_cpuid_test("x86/cpuid/xlevel-compat/pc-i440fx-2.4/npt-on",
-                   "-machine pc-i440fx-2.4 -cpu SandyBridge,svm=on,npt=on",
-                   "xlevel", 0x80000008);
+    if (qtest_has_machine("pc-i440fx-2.3")) {
+        add_cpuid_test("x86/cpuid/xlevel-compat/pc-i440fx-2.3",
+                       "-machine pc-i440fx-2.3 -cpu SandyBridge",
+                       "xlevel", 0x8000000a);
+    }
+    if (qtest_has_machine("pc-i440fx-2.4")) {
+        add_cpuid_test("x86/cpuid/xlevel-compat/pc-i440fx-2.4/npt-off",
+                       "-machine pc-i440fx-2.4 -cpu SandyBridge,",
+                       "xlevel", 0x80000008);
+        add_cpuid_test("x86/cpuid/xlevel-compat/pc-i440fx-2.4/npt-on",
+                       "-machine pc-i440fx-2.4 -cpu SandyBridge,svm=on,npt=on",
+                       "xlevel", 0x80000008);
+    }
 
     /* Test feature parsing */
     add_feature_test("x86/cpuid/features/plus",
-- 
2.27.0



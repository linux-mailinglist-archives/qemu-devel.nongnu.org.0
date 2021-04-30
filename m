Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E8336FBC8
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:53:36 +0200 (CEST)
Received: from localhost ([::1]:46618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcTaJ-00019y-2b
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lcTJ1-0005e9-Al
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:35:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lcTIv-0008Ds-1J
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:35:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619789736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O4BOOaXPe8Kuzccz1aS2grvfaVdsqyBeB/wA3uOnaqk=;
 b=aMnIInUhK/nCFzf5VuD+i2g0CePEJnx9nK42htw8bz2Ll9I6duCecI0fdBUQsBFSgn7yNG
 4ff3s6YpCDj5YNbluNNlDVMtDHEo9/ww2V1/oZ7GSaJuq7rwSI0TvUgRGY0KEjxCPvcoWX
 LmVGl4OcjoIXCNMq6X1idpRl5uUZlrU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-NAaXOMMJP9iFnvfDx_GIWg-1; Fri, 30 Apr 2021 09:35:32 -0400
X-MC-Unique: NAaXOMMJP9iFnvfDx_GIWg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22BB9801B28;
 Fri, 30 Apr 2021 13:35:31 +0000 (UTC)
Received: from wainer-laptop.localdomain.com (ovpn-116-202.gru2.redhat.com
 [10.97.116.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C96415D9E2;
 Fri, 30 Apr 2021 13:35:25 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 7/7] tests/acceptance: Handle cpu tag on
 x86_cpu_model_versions tests
Date: Fri, 30 Apr 2021 10:34:14 -0300
Message-Id: <20210430133414.39905-8-wainersm@redhat.com>
In-Reply-To: <20210430133414.39905-1-wainersm@redhat.com>
References: <20210430133414.39905-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: wrampazz@redhat.com, philmd@redhat.com, pavel.dovgaluk@ispras.ru,
 crosa@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some test cases on x86_cpu_model_versions.py are corner cases because they
need to pass extra options to the -cpu argument. Once the avocado_qemu
framework will set -cpu automatically, the value should be reset. This changed
those tests so to call set_vm_arg() to overwrite the -cpu value.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 tests/acceptance/x86_cpu_model_versions.py | 40 +++++++++++++++++-----
 1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/tests/acceptance/x86_cpu_model_versions.py b/tests/acceptance/x86_cpu_model_versions.py
index 77ed8597a4..0e9feda62d 100644
--- a/tests/acceptance/x86_cpu_model_versions.py
+++ b/tests/acceptance/x86_cpu_model_versions.py
@@ -252,10 +252,13 @@ def get_cpu_prop(self, prop):
     def test_4_1(self):
         """
         :avocado: tags=machine:pc-i440fx-4.1
+        :avocado: tags=cpu:Cascadelake-Server
         """
         # machine-type only:
         self.vm.add_args('-S')
-        self.vm.add_args('-cpu', 'Cascadelake-Server,x-force-features=on,check=off,enforce=off')
+        self.set_vm_arg('-cpu',
+                        'Cascadelake-Server,x-force-features=on,check=off,'
+                        'enforce=off')
         self.vm.launch()
         self.assertFalse(self.get_cpu_prop('arch-capabilities'),
                          'pc-i440fx-4.1 + Cascadelake-Server should not have arch-capabilities')
@@ -263,9 +266,12 @@ def test_4_1(self):
     def test_4_0(self):
         """
         :avocado: tags=machine:pc-i440fx-4.0
+        :avocado: tags=cpu:Cascadelake-Server
         """
         self.vm.add_args('-S')
-        self.vm.add_args('-cpu', 'Cascadelake-Server,x-force-features=on,check=off,enforce=off')
+        self.set_vm_arg('-cpu',
+                        'Cascadelake-Server,x-force-features=on,check=off,'
+                        'enforce=off')
         self.vm.launch()
         self.assertFalse(self.get_cpu_prop('arch-capabilities'),
                          'pc-i440fx-4.0 + Cascadelake-Server should not have arch-capabilities')
@@ -273,10 +279,13 @@ def test_4_0(self):
     def test_set_4_0(self):
         """
         :avocado: tags=machine:pc-i440fx-4.0
+        :avocado: tags=cpu:Cascadelake-Server
         """
         # command line must override machine-type if CPU model is not versioned:
         self.vm.add_args('-S')
-        self.vm.add_args('-cpu', 'Cascadelake-Server,x-force-features=on,check=off,enforce=off,+arch-capabilities')
+        self.set_vm_arg('-cpu',
+                        'Cascadelake-Server,x-force-features=on,check=off,'
+                        'enforce=off,+arch-capabilities')
         self.vm.launch()
         self.assertTrue(self.get_cpu_prop('arch-capabilities'),
                         'pc-i440fx-4.0 + Cascadelake-Server,+arch-capabilities should have arch-capabilities')
@@ -284,9 +293,12 @@ def test_set_4_0(self):
     def test_unset_4_1(self):
         """
         :avocado: tags=machine:pc-i440fx-4.1
+        :avocado: tags=cpu:Cascadelake-Server
         """
         self.vm.add_args('-S')
-        self.vm.add_args('-cpu', 'Cascadelake-Server,x-force-features=on,check=off,enforce=off,-arch-capabilities')
+        self.set_vm_arg('-cpu',
+                        'Cascadelake-Server,x-force-features=on,check=off,'
+                        'enforce=off,-arch-capabilities')
         self.vm.launch()
         self.assertFalse(self.get_cpu_prop('arch-capabilities'),
                          'pc-i440fx-4.1 + Cascadelake-Server,-arch-capabilities should not have arch-capabilities')
@@ -294,10 +306,13 @@ def test_unset_4_1(self):
     def test_v1_4_0(self):
         """
         :avocado: tags=machine:pc-i440fx-4.0
+        :avocado: tags=cpu:Cascadelake-Server
         """
         # versioned CPU model overrides machine-type:
         self.vm.add_args('-S')
-        self.vm.add_args('-cpu', 'Cascadelake-Server-v1,x-force-features=on,check=off,enforce=off')
+        self.set_vm_arg('-cpu',
+                        'Cascadelake-Server-v1,x-force-features=on,check=off,'
+                        'enforce=off')
         self.vm.launch()
         self.assertFalse(self.get_cpu_prop('arch-capabilities'),
                          'pc-i440fx-4.0 + Cascadelake-Server-v1 should not have arch-capabilities')
@@ -305,9 +320,12 @@ def test_v1_4_0(self):
     def test_v2_4_0(self):
         """
         :avocado: tags=machine:pc-i440fx-4.0
+        :avocado: tags=cpu:Cascadelake-Server
         """
         self.vm.add_args('-S')
-        self.vm.add_args('-cpu', 'Cascadelake-Server-v2,x-force-features=on,check=off,enforce=off')
+        self.set_vm_arg('-cpu',
+                        'Cascadelake-Server-v2,x-force-features=on,check=off,'
+                        'enforce=off')
         self.vm.launch()
         self.assertTrue(self.get_cpu_prop('arch-capabilities'),
                         'pc-i440fx-4.0 + Cascadelake-Server-v2 should have arch-capabilities')
@@ -315,10 +333,13 @@ def test_v2_4_0(self):
     def test_v1_set_4_0(self):
         """
         :avocado: tags=machine:pc-i440fx-4.0
+        :avocado: tags=cpu:Cascadelake-Server
         """
         # command line must override machine-type and versioned CPU model:
         self.vm.add_args('-S')
-        self.vm.add_args('-cpu', 'Cascadelake-Server-v1,x-force-features=on,check=off,enforce=off,+arch-capabilities')
+        self.set_vm_arg('-cpu',
+                        'Cascadelake-Server-v1,x-force-features=on,check=off,'
+                        'enforce=off,+arch-capabilities')
         self.vm.launch()
         self.assertTrue(self.get_cpu_prop('arch-capabilities'),
                         'pc-i440fx-4.0 + Cascadelake-Server-v1,+arch-capabilities should have arch-capabilities')
@@ -326,9 +347,12 @@ def test_v1_set_4_0(self):
     def test_v2_unset_4_1(self):
         """
         :avocado: tags=machine:pc-i440fx-4.1
+        :avocado: tags=cpu:Cascadelake-Server
         """
         self.vm.add_args('-S')
-        self.vm.add_args('-cpu', 'Cascadelake-Server-v2,x-force-features=on,check=off,enforce=off,-arch-capabilities')
+        self.set_vm_arg('-cpu',
+                        'Cascadelake-Server-v2,x-force-features=on,check=off,'
+                        'enforce=off,-arch-capabilities')
         self.vm.launch()
         self.assertFalse(self.get_cpu_prop('arch-capabilities'),
                          'pc-i440fx-4.1 + Cascadelake-Server-v2,-arch-capabilities should not have arch-capabilities')
-- 
2.29.2



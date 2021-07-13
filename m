Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6AB3C7908
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 23:37:07 +0200 (CEST)
Received: from localhost ([::1]:45814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Q5S-0001bs-SD
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 17:37:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3Pqu-0003xH-Ok
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:22:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3Pqs-0000Yz-UR
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:22:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626211322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zsU0FTFf2rMachGGbCL/tF0cIh/ZF+yOJZdnct0Lkq0=;
 b=L5hTwZVI8mG6pa4qDOgSxUME5sEqzrdWBpvRoDfHZ1Ta52T07r/AmUhLGla1zQsLBTxoTL
 TdO+fqRcXWX8Z37IcvhYfmtlEAFF3MiEcMzpGsTzOpH+2UD3dgiNSQQwAefroKMlNyBiz/
 x7IuQ+QOa0Wic79Ngl5DjPwWUFPGnu4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-ePkmP2fKMMO6JuY_FgbEWw-1; Tue, 13 Jul 2021 17:22:00 -0400
X-MC-Unique: ePkmP2fKMMO6JuY_FgbEWw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54D4E100B3AC;
 Tue, 13 Jul 2021 21:21:58 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 036FA19C44;
 Tue, 13 Jul 2021 21:21:55 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 19/23] tests/acceptance: Handle cpu tag on
 x86_cpu_model_versions tests
Date: Tue, 13 Jul 2021 17:19:19 -0400
Message-Id: <20210713211923.3809241-20-crosa@redhat.com>
In-Reply-To: <20210713211923.3809241-1-crosa@redhat.com>
References: <20210713211923.3809241-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Thomas Huth <thuth@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Ryo ONODERA <ryoon@netbsd.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

Some test cases on x86_cpu_model_versions.py are corner cases because they
need to pass extra options to the -cpu argument. Once the avocado_qemu
framework will set -cpu automatically, the value should be reset. This changed
those tests so to call set_vm_arg() to overwrite the -cpu value.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210430133414.39905-8-wainersm@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
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
2.31.1



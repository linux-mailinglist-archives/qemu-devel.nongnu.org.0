Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1859C4D9A6A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 12:31:44 +0100 (CET)
Received: from localhost ([::1]:50126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU5Ox-0006ce-6N
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 07:31:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nU5El-0001Wx-Ba
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:21:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nU5Ej-0008W6-LB
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:21:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647343269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wzgsHecDCryL0horxdwhUCRlTvQKQU0CwB/u7KekZzU=;
 b=XTs7sdbEPpkD/LUmN+f+5sjqoRdvHXKNnIybtfJK5bvty56LBFq5JRM0WePmrIQ99fuPQ5
 LsxdtSWV1yt3vNthLqe/8va0l5yRBQK80gKS+MH2ADIDNer4VUVFzcN44wYqz3ZUcPNmOQ
 oLXvO7NDvxoE7RmeBTIhLzmpP8D0IIc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-I5AMYqF_MSeZLPRzaes48g-1; Tue, 15 Mar 2022 07:21:07 -0400
X-MC-Unique: I5AMYqF_MSeZLPRzaes48g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C27B7185A7B2;
 Tue, 15 Mar 2022 11:21:06 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 26F05C15D42;
 Tue, 15 Mar 2022 11:21:04 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/8] tests/avocado: start PhoneServer upfront
Date: Tue, 15 Mar 2022 12:20:49 +0100
Message-Id: <20220315112052.515467-6-thuth@redhat.com>
In-Reply-To: <20220315112052.515467-1-thuth@redhat.com>
References: <20220315112052.515467-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_FILL_THIS_FORM_SHORT=0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Beraldo Leal <bleal@redhat.com>

Race conditions can happen with the current code, because the port that
was available might not be anymore by the time the server is started.

By setting the port to 0, PhoneServer it will use the OS default
behavior to get a free port, then we save this information so we can
later configure the guest.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Beraldo Leal <bleal@redhat.com>
Message-Id: <20220311171127.2189534-1-bleal@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/avocado_qemu/__init__.py | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 9b056b5ce5..ac85e36a4d 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -18,7 +18,7 @@
 import uuid
 
 import avocado
-from avocado.utils import cloudinit, datadrainer, network, process, ssh, vmimage
+from avocado.utils import cloudinit, datadrainer, process, ssh, vmimage
 from avocado.utils.path import find_command
 
 #: The QEMU build root directory.  It may also be the source directory
@@ -602,9 +602,6 @@ def prepare_cloudinit(self, ssh_pubkey=None):
         self.log.info('Preparing cloudinit image')
         try:
             cloudinit_iso = os.path.join(self.workdir, 'cloudinit.iso')
-            self.phone_home_port = network.find_free_port()
-            if not self.phone_home_port:
-                self.cancel('Failed to get a free port')
             pubkey_content = None
             if ssh_pubkey:
                 with open(ssh_pubkey) as pubkey:
@@ -614,7 +611,7 @@ def prepare_cloudinit(self, ssh_pubkey=None):
                           password=self.password,
                           # QEMU's hard coded usermode router address
                           phone_home_host='10.0.2.2',
-                          phone_home_port=self.phone_home_port,
+                          phone_home_port=self.phone_server.server_port,
                           authorized_key=pubkey_content)
         except Exception:
             self.cancel('Failed to prepare the cloudinit image')
@@ -625,6 +622,8 @@ def set_up_boot(self):
         self.vm.add_args('-drive', 'file=%s' % path)
 
     def set_up_cloudinit(self, ssh_pubkey=None):
+        self.phone_server = cloudinit.PhoneHomeServer(('0.0.0.0', 0),
+                                                      self.name)
         cloudinit_iso = self.prepare_cloudinit(ssh_pubkey)
         self.vm.add_args('-drive', 'file=%s,format=raw' % cloudinit_iso)
 
@@ -635,7 +634,9 @@ def launch_and_wait(self, set_up_ssh_connection=True):
                                                  logger=self.log.getChild('console'))
         console_drainer.start()
         self.log.info('VM launched, waiting for boot confirmation from guest')
-        cloudinit.wait_for_phone_home(('0.0.0.0', self.phone_home_port), self.name)
+        while not self.phone_server.instance_phoned_back:
+            self.phone_server.handle_request()
+
         if set_up_ssh_connection:
             self.log.info('Setting up the SSH connection')
             self.ssh_connect(self.username, self.ssh_key)
-- 
2.27.0



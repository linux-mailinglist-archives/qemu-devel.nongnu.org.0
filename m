Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 015773D0580
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:41:11 +0200 (CEST)
Received: from localhost ([::1]:33922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zMM-0004VL-0T
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m5zCL-0002cK-SQ
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:30:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m5zCK-0007r7-4V
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:30:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626823847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AmBto+Lo3QUgoLS4SQt7Y9oM5uvGveVmtuvCkmW636k=;
 b=bCYEXvTg+D52fDdN2vO0zmJWOK0stsymkmnnLUNSaig8994sGfOQgmViM1SHb4q8FheoBm
 fH+fq/N1oikBOs43TnaL2T1C35kTniCj2aPSj+pSRw2WfhdKkySZ7zHiiTYtIqym5onYQC
 QGB0fhLICb9Au//SfH0bjNz4sMr0a+U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-1iY3Qtr0Oxy53mgNOSS4Zg-1; Tue, 20 Jul 2021 19:30:46 -0400
X-MC-Unique: 1iY3Qtr0Oxy53mgNOSS4Zg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4097362F9;
 Tue, 20 Jul 2021 23:30:44 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9497B1002F12;
 Tue, 20 Jul 2021 23:30:43 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 6/7] tests/acceptance/virtio-gpu.py: provide kernel and initrd
 hashes
Date: Tue, 20 Jul 2021 19:30:17 -0400
Message-Id: <20210720233018.101541-7-crosa@redhat.com>
In-Reply-To: <20210720233018.101541-1-crosa@redhat.com>
References: <20210720233018.101541-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By providing kernel and initrd hashes, the test guarantees the
integrity of the images used and avoids the warnings set by
fetch_asset() when hashes are lacking.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Message-Id: <20210714174051.28164-7-crosa@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/virtio-gpu.py | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/acceptance/virtio-gpu.py b/tests/acceptance/virtio-gpu.py
index 0f84affe82..4acc1e6d5f 100644
--- a/tests/acceptance/virtio-gpu.py
+++ b/tests/acceptance/virtio-gpu.py
@@ -40,11 +40,13 @@ class VirtioGPUx86(Test):
         "/linux/releases/33/Everything/x86_64/os/images"
         "/pxeboot/vmlinuz"
     )
+    KERNEL_HASH = '1433cfe3f2ffaa44de4ecfb57ec25dc2399cdecf'
     INITRD_URL = (
         "https://archives.fedoraproject.org/pub/fedora"
         "/linux/releases/33/Everything/x86_64/os/images"
         "/pxeboot/initrd.img"
     )
+    INITRD_HASH = 'c828d68a027b53e5220536585efe03412332c2d9'
 
     def wait_for_console_pattern(self, success_message, vm=None):
         wait_for_console_pattern(
@@ -61,8 +63,8 @@ def test_virtio_vga_virgl(self):
         # FIXME: should check presence of virtio, virgl etc
         self.require_accelerator('kvm')
 
-        kernel_path = self.fetch_asset(self.KERNEL_URL)
-        initrd_path = self.fetch_asset(self.INITRD_URL)
+        kernel_path = self.fetch_asset(self.KERNEL_URL, self.KERNEL_HASH)
+        initrd_path = self.fetch_asset(self.INITRD_URL, self.INITRD_HASH)
 
         self.vm.set_console()
         self.vm.add_args("-m", "2G")
@@ -100,8 +102,8 @@ def test_vhost_user_vga_virgl(self):
         if not vug:
             self.cancel("Could not find vhost-user-gpu")
 
-        kernel_path = self.fetch_asset(self.KERNEL_URL)
-        initrd_path = self.fetch_asset(self.INITRD_URL)
+        kernel_path = self.fetch_asset(self.KERNEL_URL, self.KERNEL_HASH)
+        initrd_path = self.fetch_asset(self.INITRD_URL, self.INITRD_HASH)
 
         # Create socketpair to connect proxy and remote processes
         qemu_sock, vug_sock = socket.socketpair(
-- 
2.31.1



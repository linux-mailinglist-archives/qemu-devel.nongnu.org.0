Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B018D3C8A12
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 19:49:20 +0200 (CEST)
Received: from localhost ([::1]:34552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3j0Z-0003Vd-Np
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 13:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3itI-0007zQ-0e
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 13:41:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3itE-000098-Re
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 13:41:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626284504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qjxfq30vHXoLYCZk4pTq3Mve62O1jCP+7/mzdOP/0IY=;
 b=bdp9FdApRr7ymo5o/jeXuGnkI6Fwi0ZXTENoL0PwjoMhk4gq8dcavImg0Gom2cxkjNB9xC
 miMS4keKLMf/gJuU05oaSRJVqUSluLCHsi3Gwlvo43cNnIK2a0SHfe4w14gDlZC31c3uDf
 3t2MRc9FtafJ2VC1gdjXjTQ1BA4ZTow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-lYXDQFLJM5WbRA8y-lxMGg-1; Wed, 14 Jul 2021 13:41:37 -0400
X-MC-Unique: lYXDQFLJM5WbRA8y-lxMGg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F76A1023F42;
 Wed, 14 Jul 2021 17:41:36 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FBCF60C9B;
 Wed, 14 Jul 2021 17:41:35 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] tests/acceptance/virtio-gpu.py: combine kernel command
 line
Date: Wed, 14 Jul 2021 13:40:49 -0400
Message-Id: <20210714174051.28164-5-crosa@redhat.com>
In-Reply-To: <20210714174051.28164-1-crosa@redhat.com>
References: <20210714174051.28164-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both tests use the same kernel command line arguments, so there's no
need to have a common and then an additional set of arguments.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/virtio-gpu.py | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/tests/acceptance/virtio-gpu.py b/tests/acceptance/virtio-gpu.py
index 20a59fabf3..fbde278705 100644
--- a/tests/acceptance/virtio-gpu.py
+++ b/tests/acceptance/virtio-gpu.py
@@ -34,7 +34,7 @@ class VirtioGPUx86(Test):
     :avocado: tags=cpu:host
     """
 
-    KERNEL_COMMON_COMMAND_LINE = "printk.time=0 "
+    KERNEL_COMMAND_LINE = "printk.time=0 console=ttyS0 rdinit=/bin/bash"
     KERNEL_URL = (
         "https://archives.fedoraproject.org/pub/fedora"
         "/linux/releases/33/Everything/x86_64/os/images"
@@ -58,9 +58,6 @@ def test_virtio_vga_virgl(self):
         """
         :avocado: tags=device:virtio-vga
         """
-        kernel_command_line = (
-            self.KERNEL_COMMON_COMMAND_LINE + "console=ttyS0 rdinit=/bin/bash"
-        )
         # FIXME: should check presence of virtio, virgl etc
         self.require_accelerator('kvm')
 
@@ -78,7 +75,7 @@ def test_virtio_vga_virgl(self):
             "-initrd",
             initrd_path,
             "-append",
-            kernel_command_line,
+            self.KERNEL_COMMAND_LINE,
         )
         try:
             self.vm.launch()
@@ -96,9 +93,6 @@ def test_vhost_user_vga_virgl(self):
         """
         :avocado: tags=device:vhost-user-vga
         """
-        kernel_command_line = (
-            self.KERNEL_COMMON_COMMAND_LINE + "console=ttyS0 rdinit=/bin/bash"
-        )
         # FIXME: should check presence of vhost-user-gpu, virgl, memfd etc
         self.require_accelerator('kvm')
 
@@ -145,7 +139,7 @@ def test_vhost_user_vga_virgl(self):
             "-initrd",
             initrd_path,
             "-append",
-            kernel_command_line,
+            self.KERNEL_COMMAND_LINE,
         )
         self.vm.launch()
         self.wait_for_console_pattern("as init process")
-- 
2.31.1



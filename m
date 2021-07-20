Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B623D0579
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:37:02 +0200 (CEST)
Received: from localhost ([::1]:53648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zIL-0007DD-1S
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m5zCG-0002Kr-Ar
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:30:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m5zCE-0007nm-G7
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:30:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626823841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UFo10oGc/Y2inL0xVOADUGqT2mydHybHBMN05LzvoVE=;
 b=ZU/ZyBExVhPi2P9o9JBinqu5LJMfZaPqTkWn2wsgGbDHLDtIgBCDXDiGgb4x2BZm8n50mr
 v/SntMt0Ios4vJNJp8YSLe5VAFoXBLhIkqZEalH4yt//MDMEjewqv/gzHCqDgr408/cA3Y
 BXUVGAAhwiW3CLXOCPwhse4/f6vmd5U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-Yy3yaiCNNCWd15CHHZUmVA-1; Tue, 20 Jul 2021 19:30:39 -0400
X-MC-Unique: Yy3yaiCNNCWd15CHHZUmVA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DFC318358EF;
 Tue, 20 Jul 2021 23:30:38 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 42FAA100EBAF;
 Tue, 20 Jul 2021 23:30:37 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 4/7] tests/acceptance/virtio-gpu.py: combine kernel command line
Date: Tue, 20 Jul 2021 19:30:15 -0400
Message-Id: <20210720233018.101541-5-crosa@redhat.com>
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

Both tests use the same kernel command line arguments, so there's no
need to have a common and then an additional set of arguments.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Message-Id: <20210714174051.28164-5-crosa@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
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



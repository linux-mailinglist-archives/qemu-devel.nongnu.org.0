Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 006643D0575
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:34:22 +0200 (CEST)
Received: from localhost ([::1]:45060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zFl-0001Wj-0V
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m5zCB-00026W-Ad
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:30:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m5zC9-0007kM-ML
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:30:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626823836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HgSCGMrqHYJvTXOs7aAICB969SpdhWw9kv7mib75DOA=;
 b=baqQQZSV78YvwQlDT+myxt8qduTQZDniYV1pjGPIR9e8QmdNEHQlQsUeSIkFOXondHaABY
 Et3E///YEumGH93iLyfAIuuAsMsRpYdJe6dDYxoFXAkeq2vgi1Uqnq2sxKgNvDhz/kSlDb
 y3171RzY5GSqR0z4HN7xOZooGdW9iF4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-f8bW8FIhM-GcVfEOOnSmJw-1; Tue, 20 Jul 2021 19:30:35 -0400
X-MC-Unique: f8bW8FIhM-GcVfEOOnSmJw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 461D818358F1;
 Tue, 20 Jul 2021 23:30:34 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8ACC61002F12;
 Tue, 20 Jul 2021 23:30:29 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 1/7] tests/acceptance/virtio-gpu.py: use require_accelerator()
Date: Tue, 20 Jul 2021 19:30:12 -0400
Message-Id: <20210720233018.101541-2-crosa@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
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

Since efe30d501 there's a shorthand for requiring specific
accelerators, and canceling the test if it's not available.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Message-Id: <20210714174051.28164-2-crosa@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/virtio-gpu.py | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/tests/acceptance/virtio-gpu.py b/tests/acceptance/virtio-gpu.py
index 589332c1b7..42602a240a 100644
--- a/tests/acceptance/virtio-gpu.py
+++ b/tests/acceptance/virtio-gpu.py
@@ -17,10 +17,6 @@
 import subprocess
 
 
-ACCEL_NOT_AVAILABLE_FMT = "%s accelerator does not seem to be available"
-KVM_NOT_AVAILABLE = ACCEL_NOT_AVAILABLE_FMT % "KVM"
-
-
 def pick_default_vug_bin():
     relative_path = "./contrib/vhost-user-gpu/vhost-user-gpu"
     if is_readable_executable_file(relative_path):
@@ -66,8 +62,7 @@ def test_virtio_vga_virgl(self):
             self.KERNEL_COMMON_COMMAND_LINE + "console=ttyS0 rdinit=/bin/bash"
         )
         # FIXME: should check presence of virtio, virgl etc
-        if not kvm_available(self.arch, self.qemu_bin):
-            self.cancel(KVM_NOT_AVAILABLE)
+        self.require_accelerator('kvm')
 
         kernel_path = self.fetch_asset(self.KERNEL_URL)
         initrd_path = self.fetch_asset(self.INITRD_URL)
@@ -107,8 +102,7 @@ def test_vhost_user_vga_virgl(self):
             self.KERNEL_COMMON_COMMAND_LINE + "console=ttyS0 rdinit=/bin/bash"
         )
         # FIXME: should check presence of vhost-user-gpu, virgl, memfd etc
-        if not kvm_available(self.arch, self.qemu_bin):
-            self.cancel(KVM_NOT_AVAILABLE)
+        self.require_accelerator('kvm')
 
         vug = pick_default_vug_bin()
         if not vug:
-- 
2.31.1



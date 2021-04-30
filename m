Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7532D36FBB4
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:46:47 +0200 (CEST)
Received: from localhost ([::1]:53786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcTTi-000059-FZ
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:46:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lcTIp-0005Mh-La
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:35:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lcTIm-00087T-HM
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:35:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619789727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rw82Ix4YevshIZ0FPvHeN9UzXJA1LQ5QZP6NzreoCqM=;
 b=f7clGjLPaV4JfgJQYRB3AYqBlZzhR/U9dpfjEKAyzedfCyl9lscruo9K0jlAG0kgtUKeb1
 PWjtLAA3WA33tl8zYjqSq4Zq/IWoChI1TyaWpLeRM+vJfhodKsvdsvnanHhK4dhb4J1utQ
 YJda0gmd9FSvBzA7gIPsUbLwzaW/6V8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-syuq7dW6Pf2FKjima12Lbg-1; Fri, 30 Apr 2021 09:35:25 -0400
X-MC-Unique: syuq7dW6Pf2FKjima12Lbg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9CAA106B21C;
 Fri, 30 Apr 2021 13:34:57 +0000 (UTC)
Received: from wainer-laptop.localdomain.com (ovpn-116-202.gru2.redhat.com
 [10.97.116.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A3805D9E2;
 Fri, 30 Apr 2021 13:34:51 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/7] tests/acceptance: Fix mismatch on cpu tagged tests
Date: Fri, 30 Apr 2021 10:34:09 -0300
Message-Id: <20210430133414.39905-3-wainersm@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
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
Cc: wrampazz@redhat.com, philmd@redhat.com,
 Willian Rampazzo <willianr@redhat.com>, pavel.dovgaluk@ispras.ru,
 crosa@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are test cases on machine_mips_malta.py and tcg_plugins.py files
where the cpu tag does not correspond to the value actually given to the QEMU
binary. This fixed those tests tags.

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 tests/acceptance/machine_mips_malta.py | 6 +++---
 tests/acceptance/tcg_plugins.py        | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/acceptance/machine_mips_malta.py b/tests/acceptance/machine_mips_malta.py
index 7c9a4ee4d2..b1fd075f51 100644
--- a/tests/acceptance/machine_mips_malta.py
+++ b/tests/acceptance/machine_mips_malta.py
@@ -96,7 +96,7 @@ def test_mips_malta_i6400_framebuffer_logo_1core(self):
         """
         :avocado: tags=arch:mips64el
         :avocado: tags=machine:malta
-        :avocado: tags=cpu:i6400
+        :avocado: tags=cpu:I6400
         """
         self.do_test_i6400_framebuffer_logo(1)
 
@@ -105,7 +105,7 @@ def test_mips_malta_i6400_framebuffer_logo_7cores(self):
         """
         :avocado: tags=arch:mips64el
         :avocado: tags=machine:malta
-        :avocado: tags=cpu:i6400
+        :avocado: tags=cpu:I6400
         :avocado: tags=mips:smp
         """
         self.do_test_i6400_framebuffer_logo(7)
@@ -115,7 +115,7 @@ def test_mips_malta_i6400_framebuffer_logo_8cores(self):
         """
         :avocado: tags=arch:mips64el
         :avocado: tags=machine:malta
-        :avocado: tags=cpu:i6400
+        :avocado: tags=cpu:I6400
         :avocado: tags=mips:smp
         """
         self.do_test_i6400_framebuffer_logo(8)
diff --git a/tests/acceptance/tcg_plugins.py b/tests/acceptance/tcg_plugins.py
index c21bf9e52a..aa6e18b62d 100644
--- a/tests/acceptance/tcg_plugins.py
+++ b/tests/acceptance/tcg_plugins.py
@@ -68,7 +68,7 @@ def test_aarch64_virt_insn(self):
         :avocado: tags=accel:tcg
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
-        :avocado: tags=cpu:cortex-a57
+        :avocado: tags=cpu:cortex-a53
         """
         kernel_path = self._grab_aarch64_kernel()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
@@ -95,7 +95,7 @@ def test_aarch64_virt_insn_icount(self):
         :avocado: tags=accel:tcg
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
-        :avocado: tags=cpu:cortex-a57
+        :avocado: tags=cpu:cortex-a53
         """
         kernel_path = self._grab_aarch64_kernel()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
@@ -121,7 +121,7 @@ def test_aarch64_virt_mem_icount(self):
         :avocado: tags=accel:tcg
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
-        :avocado: tags=cpu:cortex-a57
+        :avocado: tags=cpu:cortex-a53
         """
         kernel_path = self._grab_aarch64_kernel()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
-- 
2.29.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3FA3C78FF
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 23:31:55 +0200 (CEST)
Received: from localhost ([::1]:55862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Q0Q-0006Hl-2f
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 17:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3PqY-0003Np-Ch
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:21:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3PqV-0000Em-2L
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:21:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626211298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VXdPZlAI6IeP711DAhs2nOIOrrqgzKNYegZ/vaXgSrs=;
 b=KonnLPENrgVVAx90KyD7oBZEbefalyD9p8Kh2Cdu56G3RLcHMTRJFplrY4zL1QJGYjtr8p
 OUV1BIp/QHaBgDlh9qSoZkeW1xXDNDVRg4SJe0L0RDF5YWmKDeexOl5htJofiD9sqorI+S
 nFPX4opsIPhmR0WtdObW8muykhDumco=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-kaA4uqGIOYCrp9wUR5pacg-1; Tue, 13 Jul 2021 17:21:36 -0400
X-MC-Unique: kaA4uqGIOYCrp9wUR5pacg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FCF11084F4B;
 Tue, 13 Jul 2021 21:21:34 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2809F19C44;
 Tue, 13 Jul 2021 21:21:32 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 14/23] tests/acceptance: Fix mismatch on cpu tagged tests
Date: Tue, 13 Jul 2021 17:19:14 -0400
Message-Id: <20210713211923.3809241-15-crosa@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

There are test cases on machine_mips_malta.py and tcg_plugins.py files
where the cpu tag does not correspond to the value actually given to the QEMU
binary. This fixed those tests tags.

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210430133414.39905-3-wainersm@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
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
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF332F35F3
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 17:44:08 +0100 (CET)
Received: from localhost ([::1]:34314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzMm7-00076z-Q4
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 11:44:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzMjD-0003ky-CQ
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:41:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzMj9-0000z1-7Y
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:41:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610469662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xXN9vVLewkzbL9wmvBzcl4gcikVgxRbDhv/q8McEeHQ=;
 b=Dq736eAxxtumkMy3sH0O0L22EL0UhhnE9CxHw0bb+StMSgdknHwhiqipGmR8lTq+H6tpT/
 AJXE0xj1QscdfrGijq1ElQtTQX5Py5Sphkdcx/k4B0+evDohTMibaIDvfvjYjVu0LPekwx
 coMcn96npH9+FrlGEmf97g+7lRmjVa4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-zD13f1ldO7iUqIjRybvH0A-1; Tue, 12 Jan 2021 11:41:00 -0500
X-MC-Unique: zD13f1ldO7iUqIjRybvH0A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14812814505;
 Tue, 12 Jan 2021 16:40:59 +0000 (UTC)
Received: from thuth.com (ovpn-112-184.ams2.redhat.com [10.36.112.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B8015D9CD;
 Tue, 12 Jan 2021 16:40:57 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Greg Kurz <groug@kaod.org>
Subject: [PATCH 2/3] tests/acceptance: Test the mpc8544ds machine
Date: Tue, 12 Jan 2021 17:40:44 +0100
Message-Id: <20210112164045.98565-3-thuth@redhat.com>
In-Reply-To: <20210112164045.98565-1-thuth@redhat.com>
References: <20210112164045.98565-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-ppc@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can use the "Stupid creek" image to test the mpc8544ds ppc machine.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/acceptance/machine_ppc.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/acceptance/machine_ppc.py b/tests/acceptance/machine_ppc.py
index 51bbfd411c..71025d296c 100644
--- a/tests/acceptance/machine_ppc.py
+++ b/tests/acceptance/machine_ppc.py
@@ -5,6 +5,7 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later.  See the COPYING file in the top-level directory.
 
+from avocado.utils import archive
 from avocado_qemu import Test
 from avocado_qemu import wait_for_console_pattern
 
@@ -32,3 +33,19 @@ class PpcMachine(Test):
         self.vm.launch()
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         wait_for_console_pattern(self, console_pattern, self.panic_message)
+
+    def test_ppc_mpc8544ds(self):
+        """
+        :avocado: tags=arch:ppc
+        :avocado: tags=machine:mpc8544ds
+        """
+        tar_url = ('https://www.qemu-advent-calendar.org'
+                   '/2020/download/day17.tar.gz')
+        tar_hash = '7a5239542a7c4257aa4d3b7f6ddf08fb6775c494'
+        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
+        archive.extract(file_path, self.workdir)
+        self.vm.set_console()
+        self.vm.add_args('-kernel', self.workdir + '/creek/creek.bin')
+        self.vm.launch()
+        wait_for_console_pattern(self, 'QEMU advent calendar 2020',
+                                 self.panic_message)
-- 
2.27.0



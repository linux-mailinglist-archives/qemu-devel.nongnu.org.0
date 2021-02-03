Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BA330E163
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 18:48:55 +0100 (CET)
Received: from localhost ([::1]:41380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7MGs-000792-2O
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 12:48:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1l7Lu5-00026r-4m
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:25:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1l7Lu2-0004Yr-L4
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:25:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612373116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PHgiFwT/SMd+EuMUo22YU4xzImorywxh2tc+fWIvvFs=;
 b=J4ijJs/YQXuewdSGzXjp0ACIvrT5aEmtdQ0QfG0B0/JN9Vq+KoUTOlXuD9m+O8cOZ2AEVa
 zeefdCtQJPQG7GB7DDfcTjJPZgIcCx5jSToZ7EKV6OY6wvfAs0QAw8e1ig7VvZqwFtveBn
 2adCOMBbnQcSlK2kJzDpoCKpma5zKEE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-5MP368UFM7qx3OHRcWv62Q-1; Wed, 03 Feb 2021 12:25:14 -0500
X-MC-Unique: 5MP368UFM7qx3OHRcWv62Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C03E0CF981;
 Wed,  3 Feb 2021 17:25:12 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-89.rdu2.redhat.com
 [10.10.116.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F076E163C8;
 Wed,  3 Feb 2021 17:25:10 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/22] Acceptance Tests: add basic documentation on LinuxTest
 base class
Date: Wed,  3 Feb 2021 12:23:55 -0500
Message-Id: <20210203172357.1422425-21-crosa@redhat.com>
In-Reply-To: <20210203172357.1422425-1-crosa@redhat.com>
References: <20210203172357.1422425-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 docs/devel/testing.rst | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 209f9d8172..fe0112b21c 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -790,6 +790,32 @@ and hypothetical example follows:
 At test "tear down", ``avocado_qemu.Test`` handles all the QEMUMachines
 shutdown.
 
+The ``avocado_qemu.LinuxTest`` base test class
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The ``avocado_qemu.LinuxTest`` is further specialization of the
+``avocado_qemu.Test`` class, so it contains all the characteristics of
+the later plus some extra features.
+
+First of all, this base class is intended for tests that need to
+interact with a fully booted and operational Linux guest.  The most
+basic example looks like this:
+
+.. code::
+
+  from avocado_qemu import LinuxTest
+
+
+  class SomeTest(LinuxTest):
+
+      def test(self):
+          self.launch_and_wait()
+          self.ssh_connect('root', self.ssh_key)
+          self.ssh_command('some_command_to_be_run_in_the_guest')
+
+Please refer to tests that use ``avocado_qemu.LinuxTest`` under
+``tests/acceptance`` for more examples.
+
 QEMUMachine
 ~~~~~~~~~~~
 
-- 
2.25.4



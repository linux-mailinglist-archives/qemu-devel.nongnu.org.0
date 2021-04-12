Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2467835B9AA
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 06:56:28 +0200 (CEST)
Received: from localhost ([::1]:41538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVocd-0004bE-5s
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 00:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lVoUS-0002ZJ-2S
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 00:48:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lVoUQ-0003nM-4i
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 00:47:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618202877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LN0xH3C3qMqfLIZmSWiLqVHOmS6YNnB0KuOfm+Qk2WM=;
 b=WJHBEvIJJgXr4hK49w3TbSBrR0nfsiVQIncxb64Ztr4cLuFPmDI5+GIAYihmKEfDKgUge/
 jnYA4X6+wwccF+U2BZtRQ8LzUUhUqNkr1RfwWNWX5R8WyANrxPan8t7jNSfPBz0WqvWTEI
 BOGJLbT0UHeapExqVVQFY1iPBQf32BA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-hRHSJ8r8PXqeSTcBqAUoPQ-1; Mon, 12 Apr 2021 00:47:56 -0400
X-MC-Unique: hRHSJ8r8PXqeSTcBqAUoPQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12E89801814;
 Mon, 12 Apr 2021 04:47:55 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-108.rdu2.redhat.com
 [10.10.113.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65C1910016FD;
 Mon, 12 Apr 2021 04:47:53 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/11] Acceptance Tests: add basic documentation on
 LinuxTest base class
Date: Mon, 12 Apr 2021 00:46:42 -0400
Message-Id: <20210412044644.55083-10-crosa@redhat.com>
In-Reply-To: <20210412044644.55083-1-crosa@redhat.com>
References: <20210412044644.55083-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 John Snow <jsnow@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 docs/devel/testing.rst | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 1da4c4e4c4e..4e423928106 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -810,6 +810,32 @@ and hypothetical example follows:
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
+interact with a fully booted and operational Linux guest.  At this
+time, it uses a Fedora 31 guest image.  The most basic example looks
+like this:
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
+          self.ssh_command('some_command_to_be_run_in_the_guest')
+
+Please refer to tests that use ``avocado_qemu.LinuxTest`` under
+``tests/acceptance`` for more examples.
+
 QEMUMachine
 ~~~~~~~~~~~
 
-- 
2.30.2



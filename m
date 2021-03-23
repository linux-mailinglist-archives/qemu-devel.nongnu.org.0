Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3575B346C94
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 23:23:48 +0100 (CET)
Received: from localhost ([::1]:42288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOpRD-0008R2-8k
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 18:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lOpK3-0007G9-Oo
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 18:16:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lOpJz-0002ut-7J
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 18:16:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616537778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=szWjbKFM1QoVsZlF7m3k24d/7L+hdazgGp7d2CQTCu8=;
 b=X7ksoFp9wveMZWUMTtmdyQmLtDwn05jAsrEJPzYW1BOJnHNIxH4D78jO5f2TxTF36owMQ3
 v58JrmJsb2IU+7G5J9cmZ+oKbe8WaE+cKhVrsd4AEsRl/081THZ21dwnX6RQDYJBqcFXfP
 5PHEQzGmPlycwVBw59ch83K2IROn8Fs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-rOP-Rw84Ooy5U9dvP_Pwdw-1; Tue, 23 Mar 2021 18:16:16 -0400
X-MC-Unique: rOP-Rw84Ooy5U9dvP_Pwdw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 021DA88EF02;
 Tue, 23 Mar 2021 22:16:15 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-119-39.rdu2.redhat.com
 [10.10.119.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5226760877;
 Tue, 23 Mar 2021 22:16:13 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/10] Acceptance Tests: add basic documentation on
 LinuxTest base class
Date: Tue, 23 Mar 2021 18:15:38 -0400
Message-Id: <20210323221539.3532660-10-crosa@redhat.com>
In-Reply-To: <20210323221539.3532660-1-crosa@redhat.com>
References: <20210323221539.3532660-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Eric Auger <eauger@redhat.com>, John Snow <jsnow@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
---
 docs/devel/testing.rst | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 1da4c4e4c4..ed2a06db28 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -810,6 +810,31 @@ and hypothetical example follows:
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
+          self.ssh_command('some_command_to_be_run_in_the_guest')
+
+Please refer to tests that use ``avocado_qemu.LinuxTest`` under
+``tests/acceptance`` for more examples.
+
 QEMUMachine
 ~~~~~~~~~~~
 
-- 
2.25.4



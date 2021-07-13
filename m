Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A44F3C78FC
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 23:31:22 +0200 (CEST)
Received: from localhost ([::1]:53590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Pzt-0004is-A6
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 17:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3PqT-0003Kg-Pp
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:21:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3PqS-0000CP-8v
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:21:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626211295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UhXgC4zJbg4b1kov60jazcjIPEWd3z4BiZLh6vYghKM=;
 b=Yn8a9cp5vwJ1GfkVz7GKrWtZ24g/EgO2uZneEuQ28y8eUAgVT8vlrTTtmB/BBsMigvk68U
 YHkIhnGx3bE0B/KUKiKH/NL5uaawLNDbljfs/8HuXo2J63PzzNWQmJbdkpOVn2OZYmy7/w
 7Yzt/N62pWZvWlGilDtvKBLd5XyE7mQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-1_lTN5I8N8WcwGseGd1A_A-1; Tue, 13 Jul 2021 17:21:34 -0400
X-MC-Unique: 1_lTN5I8N8WcwGseGd1A_A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08C5418414A0;
 Tue, 13 Jul 2021 21:21:32 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EBF019C44;
 Tue, 13 Jul 2021 21:21:18 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 13/23] tests/acceptance: Automatic set -cpu to the test vm
Date: Tue, 13 Jul 2021 17:19:13 -0400
Message-Id: <20210713211923.3809241-14-crosa@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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

This introduces a new feature to the functional tests: automatic setting of
the '-cpu VALUE' option to the created vm if the test is tagged with
'cpu:VALUE'. The 'cpu' property is made available to the test object as well.

For example, for a simple test as:

    def test(self):
        """
        :avocado: tags=cpu:host
        """
        self.assertEqual(self.cpu, "host")
        self.vm.launch()

The resulting QEMU evocation will be like:

    qemu-system-x86_64 -display none -vga none \
        -chardev socket,id=mon,path=/var/tmp/avo_qemu_sock_pdgzbgd_/qemu-1135557-monitor.sock \
        -mon chardev=mon,mode=control -cpu host

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210430133414.39905-2-wainersm@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 docs/devel/testing.rst                    | 17 +++++++++++++++++
 tests/acceptance/avocado_qemu/__init__.py |  5 +++++
 2 files changed, 22 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 19cbf532ae..8f572255d3 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -904,6 +904,17 @@ name.  If one is not given explicitly, it will either be set to
 ``None``, or, if the test is tagged with one (and only one)
 ``:avocado: tags=arch:VALUE`` tag, it will be set to ``VALUE``.
 
+cpu
+~~~
+
+The cpu model that will be set to all QEMUMachine instances created
+by the test.
+
+The ``cpu`` attribute will be set to the test parameter of the same
+name. If one is not given explicitly, it will either be set to
+``None ``, or, if the test is tagged with one (and only one)
+``:avocado: tags=cpu:VALUE`` tag, it will be set to ``VALUE``.
+
 machine
 ~~~~~~~
 
@@ -983,6 +994,12 @@ architecture of a kernel or disk image to boot a VM with.
 This parameter has a direct relation with the ``arch`` attribute.  If
 not given, it will default to None.
 
+cpu
+~~~
+
+The cpu model that will be set to all QEMUMachine instances created
+by the test.
+
 machine
 ~~~~~~~
 
diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 1de1edce0d..3a218057b3 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -213,6 +213,9 @@ def setUp(self):
         self.arch = self.params.get('arch',
                                     default=self._get_unique_tag_val('arch'))
 
+        self.cpu = self.params.get('cpu',
+                                   default=self._get_unique_tag_val('cpu'))
+
         self.machine = self.params.get('machine',
                                        default=self._get_unique_tag_val('machine'))
 
@@ -242,6 +245,8 @@ def get_vm(self, *args, name=None):
             name = str(uuid.uuid4())
         if self._vms.get(name) is None:
             self._vms[name] = self._new_vm(name, *args)
+            if self.cpu is not None:
+                self._vms[name].add_args('-cpu', self.cpu)
             if self.machine is not None:
                 self._vms[name].set_machine(self.machine)
         return self._vms[name]
-- 
2.31.1



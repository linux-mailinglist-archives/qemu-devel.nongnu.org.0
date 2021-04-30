Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA0836FBC0
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:49:09 +0200 (CEST)
Received: from localhost ([::1]:33628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcTW0-00047Z-H4
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lcTIr-0005RD-Qx
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:35:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lcTIp-00089j-SH
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619789731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MOjjjb+0eRI+fxleeM23GfZTTJk0eRDunRFSgh0Cxic=;
 b=JJjzetHyTvHp/nTqnIhfljR16SpWRd8DccvMvTZhJzrwlUbvi5BmPv8sHyJn+wCoTwNNBn
 MXjhER2aBqiOcJiuMH5NqgoG4CXWwn4ENfjC7owC3ndafvDP7VqcTrhSpV78eEZ+rEvLqA
 NY9pJnr7WBsVnvwxDhWpJT0kLVupDI8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-IRpqNUILPjKXfRpwBa6DGw-1; Fri, 30 Apr 2021 09:35:27 -0400
X-MC-Unique: IRpqNUILPjKXfRpwBa6DGw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C5698030D0;
 Fri, 30 Apr 2021 13:34:51 +0000 (UTC)
Received: from wainer-laptop.localdomain.com (ovpn-116-202.gru2.redhat.com
 [10.97.116.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7ADA5D9E2;
 Fri, 30 Apr 2021 13:34:45 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/7] tests/acceptance: Automatic set -cpu to the test vm
Date: Fri, 30 Apr 2021 10:34:08 -0300
Message-Id: <20210430133414.39905-2-wainersm@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
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
---
 docs/devel/testing.rst                    | 17 +++++++++++++++++
 tests/acceptance/avocado_qemu/__init__.py |  5 +++++
 2 files changed, 22 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 1da4c4e4c4..e139a618f5 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -878,6 +878,17 @@ name.  If one is not given explicitly, it will either be set to
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
 
@@ -924,6 +935,12 @@ architecture of a kernel or disk image to boot a VM with.
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
index 83b1741ec8..7f8e703757 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -206,6 +206,9 @@ def setUp(self):
         self.arch = self.params.get('arch',
                                     default=self._get_unique_tag_val('arch'))
 
+        self.cpu = self.params.get('cpu',
+                                   default=self._get_unique_tag_val('cpu'))
+
         self.machine = self.params.get('machine',
                                        default=self._get_unique_tag_val('machine'))
 
@@ -231,6 +234,8 @@ def get_vm(self, *args, name=None):
             name = str(uuid.uuid4())
         if self._vms.get(name) is None:
             self._vms[name] = self._new_vm(*args)
+            if self.cpu is not None:
+                self._vms[name].add_args('-cpu', self.cpu)
             if self.machine is not None:
                 self._vms[name].set_machine(self.machine)
         return self._vms[name]
-- 
2.29.2



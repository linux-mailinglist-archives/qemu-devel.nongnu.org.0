Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4A33245C5
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 22:29:01 +0100 (CET)
Received: from localhost ([::1]:34598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF1iO-0002RD-OF
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 16:29:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lF1gi-00011g-6i
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 16:27:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lF1gg-0003Bu-8I
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 16:27:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614202033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KuIdovMHpi5iVujY5P0apJw4Xdes6QhZyOa0EnLBoks=;
 b=A8nhuaq9qbefvRtnFdndNnnZgl12mLQf/FJi2Cc1qfqAlSOUlm/z1U8uV0/GaytO2t1YFz
 JYwG7CJyDRTmAm579K6fpdFlpDwM5pa4L5pjnRcOKnwEcKKtLDseolcWd5MW3yf7KRJaZk
 qoplX2wc9Jars/1kAgwtdavvQu4JCck=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-bHWH2CaaNrS8pb5F17v6HA-1; Wed, 24 Feb 2021 16:27:11 -0500
X-MC-Unique: bHWH2CaaNrS8pb5F17v6HA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B6FC107ACC7;
 Wed, 24 Feb 2021 21:27:10 +0000 (UTC)
Received: from wainer-laptop.localdomain.com (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0ED65D6D3;
 Wed, 24 Feb 2021 21:27:05 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] tests/acceptance: Automatic set -cpu to the test vm
Date: Wed, 24 Feb 2021 18:26:52 -0300
Message-Id: <20210224212654.1146167-2-wainersm@redhat.com>
In-Reply-To: <20210224212654.1146167-1-wainersm@redhat.com>
References: <20210224212654.1146167-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
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
Cc: wrampazz@redhat.com, philmd@redhat.com, pavel.dovgaluk@ispras.ru,
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

The resulted QEMU evocation will be like:

    qemu-system-x86_64 -display none -vga none -chardev socket,id=mon,path=/var/tmp/avo_qemu_sock_pdgzbgd_/qemu-1135557-monitor.sock -mon chardev=mon,mode=control -cpu host

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 docs/devel/testing.rst                    | 8 ++++++++
 tests/acceptance/avocado_qemu/__init__.py | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 00ce16de48..40478672c0 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -844,6 +844,14 @@ name.  If one is not given explicitly, it will either be set to
 ``None``, or, if the test is tagged with one (and only one)
 ``:avocado: tags=arch:VALUE`` tag, it will be set to ``VALUE``.
 
+cpu
+~~~
+
+If the test is tagged with one (and only one) ``:avocado: tags=cpu:VALUE`` tag
+then the ``cpu`` attribute will be set to ``VALUE``, and the ``-cpu`` argument
+will be set to all QEMUMachine instances created by the test. Otherwise the
+attribute will be set to ``None``.
+
 machine
 ~~~~~~~
 
diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index df167b142c..0f4649b173 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -193,6 +193,8 @@ def setUp(self):
         self.arch = self.params.get('arch',
                                     default=self._get_unique_tag_val('arch'))
 
+        self.cpu = self._get_unique_tag_val('cpu')
+
         self.machine = self.params.get('machine',
                                        default=self._get_unique_tag_val('machine'))
 
@@ -218,6 +220,8 @@ def get_vm(self, *args, name=None):
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



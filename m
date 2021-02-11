Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0A4319593
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 23:09:52 +0100 (CET)
Received: from localhost ([::1]:59374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAK9n-0006XF-4C
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 17:09:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lAK2G-0000MP-Pb
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 17:02:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lAK2D-0005uA-OK
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 17:02:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613080921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aF2eAF/U3Hl6txFKCJ55o1FqBx6NVChHyPObSWBl5cQ=;
 b=ONeJN+ZvHRskbTyhB433xKrvVC19p5v5QS3F/LmE6hjLalwsGFCyeBtQuzJkNvJRDkQG+v
 K5dwG1Quemtwl9p2itLxjtUdNzRIosZ4e3eBKphFjFfRUYBfl+Pw8mnZDSbZGxhFl5EmVy
 SrnAF3DmSvN2jzeR7OTsguawZ7WGWak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-RQsZ8cDTMoaUpjG649u_Tg-1; Thu, 11 Feb 2021 17:01:58 -0500
X-MC-Unique: RQsZ8cDTMoaUpjG649u_Tg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C740107ACF2;
 Thu, 11 Feb 2021 22:01:57 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-89.rdu2.redhat.com
 [10.10.116.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33EC960BF1;
 Thu, 11 Feb 2021 22:01:56 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] Acceptance Tests: use the job work directory for created
 VMs
Date: Thu, 11 Feb 2021 17:01:43 -0500
Message-Id: <20210211220146.2525771-4-crosa@redhat.com>
In-Reply-To: <20210211220146.2525771-1-crosa@redhat.com>
References: <20210211220146.2525771-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMUMachine uses a base temporary directory for all temporary
needs.  By setting it to the Avocado's workdir, it's possible to
keep the temporary files during debugging sessions much more
easily by setting the "--keep-tmp" command line option.

Reference: https://avocado-framework.readthedocs.io/en/85.0/api/test/avocado.html#avocado.Test.workdir
Reference: https://avocado-framework.readthedocs.io/en/85.0/config/index.html#run-keep-tmp
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index bf54e419da..b7ab836455 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -172,7 +172,8 @@ class Test(avocado.Test):
 
     def _new_vm(self, *args):
         self._sd = tempfile.TemporaryDirectory(prefix="avo_qemu_sock_")
-        vm = QEMUMachine(self.qemu_bin, sock_dir=self._sd.name)
+        vm = QEMUMachine(self.qemu_bin, base_temp_dir=self.workdir,
+                         sock_dir=self._sd.name)
         if args:
             vm.add_args(*args)
         return vm
-- 
2.25.4



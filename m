Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52771412782
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 22:52:03 +0200 (CEST)
Received: from localhost ([::1]:38512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSQGg-0005wj-D1
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 16:52:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mSQEZ-0003wy-77
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 16:49:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mSQEV-00087U-5F
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 16:49:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632170986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aMA9QEgaTChYjMQ5j6mz0uWotH4+G1IiRtDBv6KDjoI=;
 b=aOUydHY5vPlWqG/lLlYpTHbkxJS0Bc4RLYUAAc3D3KGFHfY8+0hSsX5oEiPZYak3w68EKr
 gGwfmiqNq94gNqggxT42LNCSUAOUW/xa1R7T5sK54m2dxZ2r5aAmWnI2CXlU88kZT1q6bY
 qTkvt/4gqiq2Lvgn4MOfubm5veETe3c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-1bt85JQNPTu5P8NQO7iCkg-1; Mon, 20 Sep 2021 16:49:45 -0400
X-MC-Unique: 1bt85JQNPTu5P8NQO7iCkg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B82B4BBEE8
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 20:49:44 +0000 (UTC)
Received: from wrampazz.redhat.com (unknown [10.22.16.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1700619729;
 Mon, 20 Sep 2021 20:49:42 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] avocado_qemu: standardize supper() call following PEP3135
Date: Mon, 20 Sep 2021 17:49:28 -0300
Message-Id: <20210920204932.94132-3-willianr@redhat.com>
In-Reply-To: <20210920204932.94132-1-willianr@redhat.com>
References: <20210920204932.94132-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=willianr@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PEP3135 states when calling super(), there is no need to use arguments.
This changes the calls on avocado_qemu to standardize according to
PEP3135 and avoid warnings from linters.

Signed-off-by: Willian Rampazzo <willianr@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index d9e1b32aa1..d2077d63cd 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -282,7 +282,7 @@ def fetch_asset(self, name,
                     asset_hash=None, algorithm=None,
                     locations=None, expire=None,
                     find_only=False, cancel_on_missing=True):
-        return super(Test, self).fetch_asset(name,
+        return super().fetch_asset(name,
                         asset_hash=asset_hash,
                         algorithm=algorithm,
                         locations=locations,
@@ -470,7 +470,7 @@ def _set_distro(self):
             self.distro.checksum = distro_checksum
 
     def setUp(self, ssh_pubkey=None, network_device_type='virtio-net'):
-        super(LinuxTest, self).setUp()
+        super().setUp()
         self._set_distro()
         self.vm.add_args('-smp', '2')
         self.vm.add_args('-m', '1024')
-- 
2.31.1



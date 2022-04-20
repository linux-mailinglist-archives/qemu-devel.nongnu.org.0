Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DC1508646
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 12:47:28 +0200 (CEST)
Received: from localhost ([::1]:50854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh7rr-0006Wv-8e
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 06:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nh7eW-0001Sx-RX
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 06:33:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nh7eV-0006se-4q
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 06:33:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650450818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3c0z3U84XOIWhtTX2pEQ6pAkGIeMLDxfYaaSkIEmZh8=;
 b=KcakBGh4sJcHE22KTZWp+J+lLYDa7qfDRVHBJSQXi0njG2xrs5vQyGVW2m2lMlhmYVfp/l
 pp3INdmY2aROVq/3pKxMqFEL1vVlWAC8bqsLPiiKYTwXcwmudPPFlvfzmyZnQp8WFlMalb
 33rlun5v2iBrVeP4msVphVFpvto8988=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-0fPdRzR0P0aGMDH0sqKRbA-1; Wed, 20 Apr 2022 06:33:35 -0400
X-MC-Unique: 0fPdRzR0P0aGMDH0sqKRbA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2A6C18A6583;
 Wed, 20 Apr 2022 10:33:34 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D12FC52CA5;
 Wed, 20 Apr 2022 10:33:31 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 7/7] tests/avocado: Allow overwrite smp and memory size command
 line options
Date: Wed, 20 Apr 2022 12:33:09 +0200
Message-Id: <20220420103309.264479-8-thuth@redhat.com>
In-Reply-To: <20220420103309.264479-1-thuth@redhat.com>
References: <20220420103309.264479-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Ahmed Abouzied <email@aabouzied.com>,
 Philippe Mathieu-Daude <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ahmed Abouzied <email@aabouzied.com>

Removes the hard-coded values in setUp(). Class inheriting from
avocado_qemu.LinuxTest can overwrite the default smp and memory instead.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/453
Signed-off-by: Ahmed Abouzied <email@aabouzied.com>
Message-Id: <20210802222257.50946-1-email@aabouzied.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Philippe Mathieu-Daude <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/avocado_qemu/__init__.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index ac85e36a4d..39f15c1d51 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -516,6 +516,8 @@ class LinuxTest(LinuxSSHMixIn, QemuSystemTest):
     distro = None
     username = 'root'
     password = 'password'
+    smp = '2'
+    memory = '1024'
 
     def _set_distro(self):
         distro_name = self.params.get(
@@ -546,8 +548,8 @@ def _set_distro(self):
     def setUp(self, ssh_pubkey=None, network_device_type='virtio-net'):
         super().setUp()
         self._set_distro()
-        self.vm.add_args('-smp', '2')
-        self.vm.add_args('-m', '1024')
+        self.vm.add_args('-smp', self.smp)
+        self.vm.add_args('-m', self.memory)
         # The following network device allows for SSH connections
         self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22',
                          '-device', '%s,netdev=vnet' % network_device_type)
-- 
2.27.0



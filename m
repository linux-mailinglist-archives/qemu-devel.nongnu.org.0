Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 124BF346C63
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 23:22:20 +0100 (CET)
Received: from localhost ([::1]:37494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOpPm-000690-VL
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 18:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lOpJz-0007E5-RL
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 18:16:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lOpJt-0002tr-SF
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 18:16:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616537772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lCMCJ9YBsuX6UDILY+qEiNarHjJkquTp8drAoNMdiPM=;
 b=Q7bYsqtxqCSWa9WSTFIg1Zr9fr3/RUKEI3AosIqrcmYW8tMebpQmOkFcd3JZ8M818x3XxD
 ++Q//tVyfpYhCNPshZYzx11kK4c+gXRbVGUIwpsIEuVJF7H0iyPiadTESpCt9gMtlRUrSH
 mIlhPreRK2cjV77lAYdwv8Cq5N7lnpA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-sqLszR-KPd2MojJBbiir4g-1; Tue, 23 Mar 2021 18:16:10 -0400
X-MC-Unique: sqLszR-KPd2MojJBbiir4g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACFFB5200;
 Tue, 23 Mar 2021 22:16:09 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-119-39.rdu2.redhat.com
 [10.10.119.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BF1F60877;
 Tue, 23 Mar 2021 22:16:00 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/10] Acceptance Tests: make username/password configurable
Date: Tue, 23 Mar 2021 18:15:35 -0400
Message-Id: <20210323221539.3532660-7-crosa@redhat.com>
In-Reply-To: <20210323221539.3532660-1-crosa@redhat.com>
References: <20210323221539.3532660-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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

This makes the username/password used for authentication configurable,
because some guest operating systems may have restrictions on accounts
to be used for logins, and it just makes it better documented.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index e75b002c70..535f63a48d 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -308,6 +308,8 @@ class LinuxTest(Test, LinuxSSHMixIn):
 
     timeout = 900
     chksum = None
+    username = 'root'
+    password = 'password'
 
     def setUp(self, ssh_pubkey=None, network_device_type='virtio-net'):
         super(LinuxTest, self).setUp()
@@ -370,8 +372,8 @@ def prepare_cloudinit(self, ssh_pubkey=None):
                 with open(ssh_pubkey) as pubkey:
                     pubkey_content = pubkey.read()
             cloudinit.iso(cloudinit_iso, self.name,
-                          username='root',
-                          password='password',
+                          username=self.username,
+                          password=self.password,
                           # QEMU's hard coded usermode router address
                           phone_home_host='10.0.2.2',
                           phone_home_port=self.phone_home_port,
-- 
2.25.4



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7174C6B52
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 12:52:25 +0100 (CET)
Received: from localhost ([::1]:54110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOeZk-0000uQ-4P
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 06:52:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nOeRM-0007IX-59
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 06:43:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nOeRJ-0003JZ-IB
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 06:43:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646048620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ehGU4Tw5k4o/WuBzvTdXPZ+oJFTjwufnYgiOIbJCKNI=;
 b=QRxnn6ZKERiCvw6u7tFi9cKpXLqOgjZ5FDrZcTWQvLaUCseXE03XdXNUDfuxK46gf7s9LR
 3hN92ns7WwidBCcX76JkuPkMEZLSJZB34Ade536Kxgtz4fxdt9EBTH5lGW9ACpcY+PUgMk
 6Pfn7GS71PWv/RtFqb3kKBb9iGPxlxk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-7TFbyfdmPS6h1LXDYo8dHQ-1; Mon, 28 Feb 2022 06:43:37 -0500
X-MC-Unique: 7TFbyfdmPS6h1LXDYo8dHQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48EF51006AA6;
 Mon, 28 Feb 2022 11:43:36 +0000 (UTC)
Received: from thuth.com (dhcp-192-205.str.redhat.com [10.33.192.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 526832B3DE;
 Mon, 28 Feb 2022 11:43:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH] tests/avocado: Cancel BootLinux tests in case there is no
 free port
Date: Mon, 28 Feb 2022 12:43:25 +0100
Message-Id: <20220228114325.818294-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The BootLinux tests are currently failing with an ugly python
stack trace on my RHEL8 system since they cannot get a free port
(likely due to the firewall settings on my system). Let's properly
check the return value of find_free_port() instead and cancel the
test gracefully if it cannot get a free port.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Unfortunately, it still takes > 70 seconds for each and every
 tests from tests/avocado/boot_linux.py to get canceled, so
 tests/avocado/boot_linux.py still renders "make check-avocado"
 for me pretty unusable... looking at the implementation of
 find_free_port() in Avocado, I wonder whether there isn't a
 better way to get a free port number in Python? Brute-forcing
 all ports between 1024 and 65536 seems just quite cumbersome
 to me...

 tests/avocado/avocado_qemu/__init__.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 75063c0c30..9b056b5ce5 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -603,6 +603,8 @@ def prepare_cloudinit(self, ssh_pubkey=None):
         try:
             cloudinit_iso = os.path.join(self.workdir, 'cloudinit.iso')
             self.phone_home_port = network.find_free_port()
+            if not self.phone_home_port:
+                self.cancel('Failed to get a free port')
             pubkey_content = None
             if ssh_pubkey:
                 with open(ssh_pubkey) as pubkey:
-- 
2.27.0



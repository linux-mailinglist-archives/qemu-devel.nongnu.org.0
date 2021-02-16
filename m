Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6291A31C617
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 05:58:53 +0100 (CET)
Received: from localhost ([::1]:36644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBsRo-00080X-FA
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 23:58:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBsQT-0006J7-0r
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 23:57:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBsQQ-0007oU-Rx
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 23:57:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613451446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5X+8Ui4DhZWA1Qdgm21wnUpYOeB4i+VTonS1sMEfRZw=;
 b=DmvYF6xwxe0rNUfKHktOPDuhyU4/YymaZ0W6U95EQfhVjO2Y+iCsEGSztCw1xy3Vy6PWLm
 IZb7x4xm7IMpkS/+DntvfI9+uibHQkjm3vhblebXTim/DWuS6YkzHflmmx0lu/6QR9z0WL
 JApzQsRDeW82aiM+XCU/uYXWk8D3hJE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-bi-uj9AeNuW9bt4TGiE91w-1; Mon, 15 Feb 2021 23:57:21 -0500
X-MC-Unique: bi-uj9AeNuW9bt4TGiE91w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D1706EE20;
 Tue, 16 Feb 2021 04:57:20 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-129.rdu2.redhat.com
 [10.10.112.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3971172163;
 Tue, 16 Feb 2021 04:57:19 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 4/9] tests/acceptance/virtio-gpu.py: preserve virtio-user-gpu
 log
Date: Mon, 15 Feb 2021 23:57:00 -0500
Message-Id: <20210216045705.9590-5-crosa@redhat.com>
In-Reply-To: <20210216045705.9590-1-crosa@redhat.com>
References: <20210216045705.9590-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
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
Cc: Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Preserve log at location already prepared for keeping the test's log
files.

While at it, log info about its location (in the main test log
file), instead of printing it out.

Reference: https://avocado-framework.readthedocs.io/en/85.0/api/test/avocado.html#avocado.Test.logdir
Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
[philmd: use full sentence]
Message-Id: <20210211220146.2525771-7-crosa@redhat.com>

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/virtio-gpu.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/virtio-gpu.py b/tests/acceptance/virtio-gpu.py
index 211f02932f2..ab1a4c1a718 100644
--- a/tests/acceptance/virtio-gpu.py
+++ b/tests/acceptance/virtio-gpu.py
@@ -119,10 +119,11 @@ def test_vhost_user_vga_virgl(self):
         os.set_inheritable(vug_sock.fileno(), True)
 
         self._vug_log_path = os.path.join(
-            self.vm._test_dir, "vhost-user-gpu.log"
+            self.logdir, "vhost-user-gpu.log"
         )
         self._vug_log_file = open(self._vug_log_path, "wb")
-        print(self._vug_log_path)
+        self.log.info('Complete vhost-user-gpu.log file can be '
+                      'found at %s', self._vug_log_path)
 
         vugp = subprocess.Popen(
             [vug, "--virgl", "--fd=%d" % vug_sock.fileno()],
-- 
2.26.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C3721AE59
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jul 2020 07:10:03 +0200 (CEST)
Received: from localhost ([::1]:38824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtlIQ-00058z-Ta
	for lists+qemu-devel@lfdr.de; Fri, 10 Jul 2020 01:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jtlFZ-0008Lb-Cn
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 01:07:05 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54531
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jtlFX-0006WQ-RC
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 01:07:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594357623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W1B2hgCIXFRzbX9UzF1fX1EwUjqk/P0HkRK0gfyvy/k=;
 b=IT8tbPsyeOnmfsd2W12FQe/0ylO8pKH/yXed8PTHrLIC/g56YsJayntOLNXlVbxdcgepsx
 Ax3aSGfy1IEWINCdfD+Mv9SyRFCx3F+1AYbOuiZui+S9NUvA/mQQmmIrlKhbTD/UO9MgKj
 A74gh3hmIfRHyzDfy2JQw3+zuquiglc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-IyiMOZHqNkii-CzA1oYLaQ-1; Fri, 10 Jul 2020 01:06:59 -0400
X-MC-Unique: IyiMOZHqNkii-CzA1oYLaQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32DFA186A8D2;
 Fri, 10 Jul 2020 05:06:58 +0000 (UTC)
Received: from probe.redhat.com (ovpn-118-196.rdu2.redhat.com [10.10.118.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2D6010016DA;
 Fri, 10 Jul 2020 05:06:56 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 03/12] python/machine.py: Add _early_cleanup hook
Date: Fri, 10 Jul 2020 01:06:40 -0400
Message-Id: <20200710050649.32434-4-jsnow@redhat.com>
In-Reply-To: <20200710050649.32434-1-jsnow@redhat.com>
References: <20200710050649.32434-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=jsnow@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/10 00:36:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some parts of cleanup need to occur prior to shutdown, otherwise
shutdown might break. Move this into a suitably named method/callback.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine.py | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index 938c891b1d..4280aab380 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -354,16 +354,9 @@ def _launch(self):
                                        close_fds=False)
         self._post_launch()
 
-    def wait(self):
+    def _early_cleanup(self) -> None:
         """
-        Wait for the VM to power off
-        """
-        self._popen.wait()
-        self._post_shutdown()
-
-    def shutdown(self, has_quit=False, hard=False):
-        """
-        Terminate the VM and clean up
+        Perform any cleanup that needs to happen before the VM exits.
         """
         # If we keep the console socket open, we may deadlock waiting
         # for QEMU to exit, while QEMU is waiting for the socket to
@@ -372,6 +365,19 @@ def shutdown(self, has_quit=False, hard=False):
             self._console_socket.close()
             self._console_socket = None
 
+    def wait(self):
+        """
+        Wait for the VM to power off
+        """
+        self._popen.wait()
+        self._post_shutdown()
+
+    def shutdown(self, has_quit=False, hard=False):
+        """
+        Terminate the VM and clean up
+        """
+        self._early_cleanup()
+
         if self.is_running():
             if hard:
                 self._popen.kill()
-- 
2.21.3



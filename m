Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 591D5459A32
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 03:46:14 +0100 (CET)
Received: from localhost ([::1]:44420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpLoz-00072l-Gi
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 21:46:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mpLht-0006Sx-KG
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 21:38:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mpLhj-0006DJ-2s
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 21:38:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637635122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u46cL6e7L4YqdxgdOmmzu7aT6PMqDkckNqgMiPnO73I=;
 b=g5jMn2h73aonPCTi3dwtkQGD8oURx94GQplcs5+0ENW9hM7l4KK1+dYy70gjSvXm5ZmhYw
 uGFvdkQRPrK7vwNuQqoy2yKubjmSDEpow7ircAgT+UJNq+ceDg9gcuH+xvThLf46mlMRjI
 1Faf3hIzVUlEMNurtkvsvhCc1rwlmRI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-415-qH0rI7tlNbuafsqrPBbj3A-1; Mon, 22 Nov 2021 21:38:39 -0500
X-MC-Unique: qH0rI7tlNbuafsqrPBbj3A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AB1087D542;
 Tue, 23 Nov 2021 02:38:38 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3772C64188;
 Tue, 23 Nov 2021 02:38:36 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/7] python/machine: handle "fast" QEMU terminations
Date: Mon, 22 Nov 2021 21:38:03 -0500
Message-Id: <20211123023805.2745382-6-jsnow@redhat.com>
In-Reply-To: <20211123023805.2745382-1-jsnow@redhat.com>
References: <20211123023805.2745382-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the case that the QEMU process actually launches -- but then dies so
quickly that we can't establish a QMP connection to it -- QEMUMachine
currently calls _post_shutdown() assuming that it never launched the VM
process.

This isn't true, though: it "merely" may have failed to establish a QMP
connection and the process is in the middle of its own exit path.

If we don't wait for the subprocess, the caller may get a bogus `None`
return for .exitcode(). This behavior was observed from
device-crash-test; after the switch to Async QMP, the timings were
changed such that it was now seemingly possible to witness the failure
of "vm.launch()" *prior* to the exitcode becoming available.

The semantic of the `_launched` property is changed in this
patch. Instead of representing the condition "launch() executed
successfully", it will now represent "has forked a child process
successfully". This way, wait() when called in the exit path won't
become a no-op.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-id: 20211118204620.1897674-6-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index f92e73de40..67ab06ca2b 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -349,9 +349,6 @@ def _post_shutdown(self) -> None:
         Called to cleanup the VM instance after the process has exited.
         May also be called after a failed launch.
         """
-        # Comprehensive reset for the failed launch case:
-        self._early_cleanup()
-
         try:
             self._close_qmp_connection()
         except Exception as err:  # pylint: disable=broad-except
@@ -400,9 +397,16 @@ def launch(self) -> None:
 
         try:
             self._launch()
-            self._launched = True
         except:
-            self._post_shutdown()
+            # We may have launched the process but it may
+            # have exited before we could connect via QMP.
+            # Assume the VM didn't launch or is exiting.
+            # If we don't wait for the process, exitcode() may still be
+            # 'None' by the time control is ceded back to the caller.
+            if self._launched:
+                self.wait()
+            else:
+                self._post_shutdown()
 
             LOG.debug('Error launching VM')
             if self._qemu_full_args:
@@ -426,6 +430,7 @@ def _launch(self) -> None:
                                        stderr=subprocess.STDOUT,
                                        shell=False,
                                        close_fds=False)
+        self._launched = True
         self._post_launch()
 
     def _close_qmp_connection(self) -> None:
@@ -457,8 +462,8 @@ def _early_cleanup(self) -> None:
         """
         Perform any cleanup that needs to happen before the VM exits.
 
-        May be invoked by both soft and hard shutdown in failover scenarios.
-        Called additionally by _post_shutdown for comprehensive cleanup.
+        This method may be called twice upon shutdown, once each by soft
+        and hard shutdown in failover scenarios.
         """
         # If we keep the console socket open, we may deadlock waiting
         # for QEMU to exit, while QEMU is waiting for the socket to
-- 
2.31.1



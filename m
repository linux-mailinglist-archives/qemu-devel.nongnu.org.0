Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E92760B920
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 22:04:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on3WW-0007Gi-Pw; Mon, 24 Oct 2022 15:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1on3WR-0007Fe-ER
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 15:54:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1on3WO-0005Hi-2w
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 15:54:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666641240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MS2WB3OuClBkor+SjrU1noz6SaDDMVqNca9DcUqvsVA=;
 b=Bs7ChsF3tVkeID/iWjvKj732ff8qkZDgP+/4zm28SFkwtV/QkedkzrhzlQTqsAG1Sy4mFf
 xVIRo5dAMGKZsz9lc/CMT3r0F+IWkVw2fRhD5mC1UWV5m8fiMYTWiy01/bhhBGCD5SnMYm
 UxY6g1r4+GWqeQPlRRkf5XXfBIESbO8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-ByaMKEOjOnSaLY4eIwoN3A-1; Mon, 24 Oct 2022 15:53:58 -0400
X-MC-Unique: ByaMKEOjOnSaLY4eIwoN3A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92D2E3C0ED4F
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 19:53:58 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8FEF1415114;
 Mon, 24 Oct 2022 19:53:57 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Subject: [PATCH 1/2] python/machine: Add debug logging to key state changes
Date: Mon, 24 Oct 2022 15:53:54 -0400
Message-Id: <20221024195355.860504-2-jsnow@redhat.com>
In-Reply-To: <20221024195355.860504-1-jsnow@redhat.com>
References: <20221024195355.860504-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When key decisions are made about the lifetime of the VM process being
managed, there's no log entry. Juxtaposed with the very verbose runstate
change logging of the QMP module, machine seems a bit too introverted
now.

Season the machine.py module with logging statements to taste to help
make a tastier soup.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 37191f433b2..c467f951d5d 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -373,6 +373,7 @@ def _post_shutdown(self) -> None:
         Called to cleanup the VM instance after the process has exited.
         May also be called after a failed launch.
         """
+        LOG.debug("Cleaning up after VM process")
         try:
             self._close_qmp_connection()
         except Exception as err:  # pylint: disable=broad-except
@@ -497,6 +498,7 @@ def _early_cleanup(self) -> None:
         # for QEMU to exit, while QEMU is waiting for the socket to
         # become writable.
         if self._console_socket is not None:
+            LOG.debug("Closing console socket")
             self._console_socket.close()
             self._console_socket = None
 
@@ -507,6 +509,7 @@ def _hard_shutdown(self) -> None:
         :raise subprocess.Timeout: When timeout is exceeds 60 seconds
             waiting for the QEMU process to terminate.
         """
+        LOG.debug("Performing hard shutdown")
         self._early_cleanup()
         self._subp.kill()
         self._subp.wait(timeout=60)
@@ -523,6 +526,13 @@ def _soft_shutdown(self, timeout: Optional[int]) -> None:
         :raise subprocess.TimeoutExpired: When timeout is exceeded waiting for
             the QEMU process to terminate.
         """
+        LOG.debug("Attempting graceful termination")
+        if self._quit_issued:
+            LOG.debug(
+                "Anticipating QEMU termination due to prior 'quit' command, "
+                "or explicit call to wait()"
+            )
+
         self._early_cleanup()
 
         if self._qmp_connection:
@@ -553,6 +563,10 @@ def _do_shutdown(self, timeout: Optional[int]) -> None:
         try:
             self._soft_shutdown(timeout)
         except Exception as exc:
+            if isinstance(exc, subprocess.TimeoutExpired):
+                LOG.debug("Timed out waiting for QEMU process to exit")
+            LOG.debug("Graceful shutdown failed, "
+                      "falling back to hard shutdown")
             self._hard_shutdown()
             raise AbnormalShutdown("Could not perform graceful shutdown") \
                 from exc
@@ -575,6 +589,10 @@ def shutdown(self,
         if not self._launched:
             return
 
+        LOG.debug("Shutting down VM appliance; timeout=%s", timeout)
+        if hard:
+            LOG.debug("Caller requests immediate termination of QEMU process.")
+
         try:
             if hard:
                 self._user_killed = True
-- 
2.37.3



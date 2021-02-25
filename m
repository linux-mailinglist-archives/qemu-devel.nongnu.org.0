Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7190332589C
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 22:27:25 +0100 (CET)
Received: from localhost ([::1]:54876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFOAN-0007UL-M8
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 16:27:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1lFNjU-0000FF-8V
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 15:59:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1lFNjS-0002am-K6
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 15:59:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614286773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZqiFyDWs+bmqpHKNUDIejUx6j+miGR0KfkFWzHyy3HA=;
 b=GXlq/Z5bVCSX9UreQxxL7PJwdXSpt63kXR4bQFkZtv/T23iV3Jbmp6u1hksXhUmxXs9xer
 PSx0CVBC5QHIeQ99A3bYWdfr0FHVE16j1AG/qZCeuWOdkQJQe8+4w5xCletIgpKcc9i9Ka
 TqmV3KiDayNEoBZ5RGVHtKFzffW4pvo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-dUqiZToKOhW_KAzPZyVG0A-1; Thu, 25 Feb 2021 15:59:29 -0500
X-MC-Unique: dUqiZToKOhW_KAzPZyVG0A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4FFD107ACC7;
 Thu, 25 Feb 2021 20:59:28 +0000 (UTC)
Received: from wrampazz.redhat.com (ovpn-112-217.rdu2.redhat.com
 [10.10.112.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BADF460BE5;
 Thu, 25 Feb 2021 20:59:20 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] avocado_qemu: add exec_command function
Date: Thu, 25 Feb 2021 17:59:06 -0300
Message-Id: <20210225205907.223995-2-willianr@redhat.com>
In-Reply-To: <20210225205907.223995-1-willianr@redhat.com>
References: <20210225205907.223995-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=willianr@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 25 Feb 2021 16:24:56 -0500
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sometimes a test needs to send a command to a console without waiting
for a pattern as a result, or the command issued do not produce any kind
of output, like, for example, a `mount` command.

This introduces the `exec_command` function to the avocado_qemu,
allowing the test to send a command to the console without the need to
match a pattern produced as a result.

Signed-off-by: Willian Rampazzo <willianr@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index df167b142c..6ea94cc721 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -93,7 +93,7 @@ def _console_interaction(test, success_message, failure_message,
         if not msg:
             continue
         console_logger.debug(msg)
-        if success_message in msg:
+        if success_message is None or success_message in msg:
             break
         if failure_message and failure_message in msg:
             console.close()
@@ -139,6 +139,17 @@ def wait_for_console_pattern(test, success_message, failure_message=None,
     """
     _console_interaction(test, success_message, failure_message, None, vm=vm)
 
+def exec_command(test, command):
+    """
+    Send a command to a console (appending CRLF characters), while logging
+    the content.
+
+    :param test: an Avocado test containing a VM.
+    :type test: :class:`avocado_qemu.Test`
+    :param command: the command to send
+    """
+    _console_interaction(test, None, None, command + '\r')
+
 def exec_command_and_wait_for_pattern(test, command,
                                       success_message, failure_message=None):
     """
-- 
2.29.2



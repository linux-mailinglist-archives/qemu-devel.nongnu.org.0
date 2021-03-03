Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 739D832BA6C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 21:54:39 +0100 (CET)
Received: from localhost ([::1]:40368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHYVy-0007p0-Hw
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 15:54:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1lHYV1-0006z0-2E
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 15:53:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1lHYUz-0003h7-Gn
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 15:53:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614804816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KjQON6tisg+MAZ9d85raTMvrdkdo5ud9vbk1AJHPzpg=;
 b=e7ewrSK5nL5j2NWKtY9agR1q9m4CPRBhibuLCm3iJWiEZ+LvXyuK1LPHuGfP3BIxdu6jPU
 SaNlEs/u3u3OcKBO78+QsVA5RTY60x78g/rDo+7kM5cHUlpnlRIodzal2ICQgKVcvkOw8W
 C5RRtOd7BvDhDlNr0SAbdD705tCbVJs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-MOkBuEPJPNm3BUY0c0aURQ-1; Wed, 03 Mar 2021 15:53:34 -0500
X-MC-Unique: MOkBuEPJPNm3BUY0c0aURQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B772D195D562
 for <qemu-devel@nongnu.org>; Wed,  3 Mar 2021 20:53:33 +0000 (UTC)
Received: from wrampazz.redhat.com (ovpn-112-215.rdu2.redhat.com
 [10.10.112.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 344B35C241;
 Wed,  3 Mar 2021 20:53:28 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] avocado_qemu: add exec_command function
Date: Wed,  3 Mar 2021 17:53:19 -0300
Message-Id: <20210303205320.146047-2-willianr@redhat.com>
In-Reply-To: <20210303205320.146047-1-willianr@redhat.com>
References: <20210303205320.146047-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Sometimes a test needs to send a command to a console without waiting
for a pattern as a result, or the command issued do not produce any kind
of output, like, for example, a `mount` command.

This introduces the `exec_command` function to the avocado_qemu,
allowing the test to send a command to the console without the need to
match a pattern produced as a result.

Signed-off-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index df167b142c..0e6d286403 100644
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
@@ -139,6 +139,18 @@ def wait_for_console_pattern(test, success_message, failure_message=None,
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
+    :type command: str
+    """
+    _console_interaction(test, None, None, command + '\r')
+
 def exec_command_and_wait_for_pattern(test, command,
                                       success_message, failure_message=None):
     """
-- 
2.29.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 245D837EA15
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 23:57:13 +0200 (CEST)
Received: from localhost ([::1]:54434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgwqu-0002aj-8u
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 17:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgwhF-0000zF-0e
 for qemu-devel@nongnu.org; Wed, 12 May 2021 17:47:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgwh3-0007lE-9u
 for qemu-devel@nongnu.org; Wed, 12 May 2021 17:47:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620856019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oeno9likNB+jpO1aJh2/LCxbzeq2feGwPvH+914tnno=;
 b=HV3dS4gLzLSmsNX7G+GpGaqsRXfGO9mzGKMSmjRmxDucfhhOl4Yxy18RTe/4mGF6o6EULZ
 gZw1YqQppWEt0SWw9bLhliNU3LCd/S1T8o1px2GV9v46x7FPf3U4gGuBiKt+FzoBEL2Usf
 En/boKFH5SjGS9ZWq38IOiE/EDxMySc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-limscjvROkSsmDcgZ5kbPQ-1; Wed, 12 May 2021 17:46:57 -0400
X-MC-Unique: limscjvROkSsmDcgZ5kbPQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 455E6107ACE3;
 Wed, 12 May 2021 21:46:56 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 677395D6AC;
 Wed, 12 May 2021 21:46:55 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/10] iotests: ensure that QemuIoInteractive definitely closes
Date: Wed, 12 May 2021 17:46:42 -0400
Message-Id: <20210512214642.2803189-11-jsnow@redhat.com>
In-Reply-To: <20210512214642.2803189-1-jsnow@redhat.com>
References: <20210512214642.2803189-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

More on the lines of quieting pylint 2.8.x, though to make it obvious
that we definitely handle the cleanup here, I elected to bolster the
close() method here.

1. Check for the process having terminated early more rigorously by
checking poll() directly.

2. Change the prompt read into an assertion.

3. Ensure that the final communicate() call *definitely* closes the
socket, adding a timeout and a final kill just in case.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index e09c991b84e..12e876fa67d 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -238,20 +238,27 @@ def qemu_io_silent_check(*args):
 class QemuIoInteractive:
     def __init__(self, *args):
         self.args = qemu_io_args_no_fmt + list(args)
+
+        # Resource cleaned up via close()
+        # pylint: disable=consider-using-with
         self._p = subprocess.Popen(self.args, stdin=subprocess.PIPE,
                                    stdout=subprocess.PIPE,
                                    stderr=subprocess.STDOUT,
                                    universal_newlines=True)
+        if self._p.poll():
+            # Failed to start.
+            out = self._p.stdout.read()
+            raise subprocess.SubprocessError(out, self._p.poll())
+
+        # Eat the first prompt
         out = self._p.stdout.read(9)
-        if out != 'qemu-io> ':
-            # Most probably qemu-io just failed to start.
-            # Let's collect the whole output and exit.
-            out += self._p.stdout.read()
-            self._p.wait(timeout=1)
-            raise ValueError(out)
+        assert out == 'qemu-io> ', "Did not understand qemu-io prompt"
 
     def close(self):
-        self._p.communicate('q\n')
+        try:
+            self._p.communicate('q\n', timeout=5)
+        except subprocess.TimeoutExpired:
+            self._p.kill()
 
     def _read_output(self):
         pattern = 'qemu-io> '
-- 
2.30.2



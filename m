Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9B726B31C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Sep 2020 01:00:46 +0200 (CEST)
Received: from localhost ([::1]:46912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIJwL-0004UA-9F
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 19:00:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kIJdi-0007SM-5g
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 18:41:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kIJdg-0002he-6D
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 18:41:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600209687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1dehnIwwTGGmMaoVH34Box1kbfIwHLRRX8vnXblZyB0=;
 b=MqWFrai5Tv6yh4J778AU9Ke1xAbCrsc0pmVYHXrL+7mfsTXbntdec4PiwwoIaRNK389a4O
 r/DF66hawhMJ5mfNk9wVyJoq8RI+yFJrVzAVJDYONu39TVZuwYBjWEI8sjPmC03fXxFgQm
 R/q69lsUA09tsGXQ6bRTRwmVtrxkZBw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-pWjq-1BPNECm42bzUaBzGw-1; Tue, 15 Sep 2020 18:41:23 -0400
X-MC-Unique: pWjq-1BPNECm42bzUaBzGw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01DEDAF207;
 Tue, 15 Sep 2020 22:41:16 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DF437BE76;
 Tue, 15 Sep 2020 22:41:15 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 28/37] qapi/gen.py: update write() to be more idiomatic
Date: Tue, 15 Sep 2020 18:40:18 -0400
Message-Id: <20200915224027.2529813-29-jsnow@redhat.com>
In-Reply-To: <20200915224027.2529813-1-jsnow@redhat.com>
References: <20200915224027.2529813-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/15 02:10:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make the file handling here just a tiny bit more idiomatic.
(I realize this is heavily subjective.)

Use exist_ok=True for os.makedirs and remove the exception,
use fdopen() to wrap the file descriptor in a File-like object,
and use a context manager for managing the file pointer.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/gen.py | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index e873901672..bd67f6b069 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -12,7 +12,6 @@
 # See the COPYING file in the top-level directory.
 
 from contextlib import contextmanager
-import errno
 import os
 import re
 from typing import Dict, Generator, List, Optional, Tuple
@@ -60,21 +59,18 @@ def write(self, output_dir: str) -> None:
             return
         pathname = os.path.join(output_dir, self.fname)
         odir = os.path.dirname(pathname)
+
         if odir:
-            try:
-                os.makedirs(odir)
-            except os.error as e:
-                if e.errno != errno.EEXIST:
-                    raise
+            os.makedirs(odir, exist_ok=True)
+
         fd = os.open(pathname, os.O_RDWR | os.O_CREAT, 0o666)
-        f = open(fd, 'r+', encoding='utf-8')
-        text = self.get_content()
-        oldtext = f.read(len(text) + 1)
-        if text != oldtext:
-            f.seek(0)
-            f.truncate(0)
-            f.write(text)
-        f.close()
+        with os.fdopen(fd, 'r+', encoding='utf-8') as fp:
+            text = self.get_content()
+            oldtext = fp.read(len(text) + 1)
+            if text != oldtext:
+                fp.seek(0)
+                fp.truncate(0)
+                fp.write(text)
 
 
 def _wrap_ifcond(ifcond: List[str], before: str, after: str) -> str:
-- 
2.26.2



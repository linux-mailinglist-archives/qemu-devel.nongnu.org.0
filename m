Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 527C6274B30
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 23:32:23 +0200 (CEST)
Received: from localhost ([::1]:35394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKpte-0006o1-7h
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 17:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKpQ8-0002PL-2V
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 17:01:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKpQ5-0004dM-8P
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 17:01:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600808508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Ibo9+RLfwsro0GaTeo9uSseS1EBK0++KO7WNXemOpA=;
 b=Belm4uJs7eiiAjtd44aPf5dpS3xfvoFBr7CdNId7stubr/rZPEKPE95OIMSmsEUeZeFybb
 p4uEolId4Agzg8EKHoRXpsXAgYo1PPI0veZWoksSHoBO+0Utmddfdat2ES+KG+emahOfZQ
 TQ4151yZexw+IMt7CXz7ktvXUY9Mvuc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-peFxE_XVNluv_1B20Vlghg-1; Tue, 22 Sep 2020 17:01:45 -0400
X-MC-Unique: peFxE_XVNluv_1B20Vlghg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 153088014D9;
 Tue, 22 Sep 2020 21:01:44 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 292C55577B;
 Tue, 22 Sep 2020 21:01:43 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 28/38] qapi/gen.py: update write() to be more idiomatic
Date: Tue, 22 Sep 2020 17:00:51 -0400
Message-Id: <20200922210101.4081073-29-jsnow@redhat.com>
In-Reply-To: <20200922210101.4081073-1-jsnow@redhat.com>
References: <20200922210101.4081073-1-jsnow@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 15:47:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
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
index ba32f776e6..cf340e66d4 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -14,7 +14,6 @@
 # See the COPYING file in the top-level directory.
 
 from contextlib import contextmanager
-import errno
 import os
 import re
 from typing import Dict, Generator, List, Optional, Tuple
@@ -64,21 +63,18 @@ def write(self, output_dir: str) -> None:
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



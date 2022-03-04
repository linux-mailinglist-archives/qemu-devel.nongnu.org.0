Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B73C24CDD78
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 20:58:27 +0100 (CET)
Received: from localhost ([::1]:32874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQE4I-0007ri-RZ
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 14:58:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nQDuI-0008Ig-WD
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:48:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nQDuG-0005vo-Hn
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:48:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646423284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=st6tTpBGO6+VOWAjFkrRaUu48mOFWD7d/5t5gAtjJws=;
 b=WJtFv+JuXrBNEAhKAV0RBODKgJW+y2/tN1KiI1FMxsHBxJg2DvZRrgNCUcXvxQSpbutlmG
 XnRfqQdCEwBJMTCDhxLbcSYNR5Nr6XqhnLAl47yWy/qzHBheXEmRaEFSIps0Iwut8u6LOX
 Yc+Q6lhNPwG8GLZ27gzt7BI5vtewIAg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-E6Sq7BohPv6de-Kn4wYhfQ-1; Fri, 04 Mar 2022 14:48:01 -0500
X-MC-Unique: E6Sq7BohPv6de-Kn4wYhfQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C281801AFE;
 Fri,  4 Mar 2022 19:48:00 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.35.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2DEB05DF21;
 Fri,  4 Mar 2022 19:47:59 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/5] python/utils: add VerboseProcessError
Date: Fri,  4 Mar 2022 14:47:43 -0500
Message-Id: <20220304194746.486226-3-jsnow@redhat.com>
In-Reply-To: <20220304194746.486226-1-jsnow@redhat.com>
References: <20220304194746.486226-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds an Exception that extends the Python stdlib
subprocess.CalledProcessError.

The difference is that the str() method of this exception also adds the
stdout/stderr logs. In effect, if this exception goes unhandled, Python
will print the output in a visually distinct wrapper to the terminal so
that it's easy to spot in a sea of traceback information.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 python/qemu/utils/__init__.py | 36 +++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/python/qemu/utils/__init__.py b/python/qemu/utils/__init__.py
index 5babf40df2..355ac550bc 100644
--- a/python/qemu/utils/__init__.py
+++ b/python/qemu/utils/__init__.py
@@ -18,6 +18,7 @@
 import os
 import re
 import shutil
+from subprocess import CalledProcessError
 import textwrap
 from typing import Optional
 
@@ -26,6 +27,7 @@
 
 
 __all__ = (
+    'VerboseProcessError',
     'add_visual_margin',
     'get_info_usernet_hostfwd_port',
     'kvm_available',
@@ -121,3 +123,37 @@ def _wrap(line: str) -> str:
         os.linesep.join(_wrap(line) for line in content.splitlines()),
         _bar(None, top=False),
     ))
+
+
+class VerboseProcessError(CalledProcessError):
+    """
+    The same as CalledProcessError, but more verbose.
+
+    This is useful for debugging failed calls during test executions.
+    The return code, signal (if any), and terminal output will be displayed
+    on unhandled exceptions.
+    """
+    def summary(self) -> str:
+        """Return the normal CalledProcessError str() output."""
+        return super().__str__()
+
+    def __str__(self) -> str:
+        lmargin = '  '
+        width = -len(lmargin)
+        sections = []
+
+        name = 'output' if self.stderr is None else 'stdout'
+        if self.stdout:
+            sections.append(add_visual_margin(self.stdout, width, name))
+        else:
+            sections.append(f"{name}: N/A")
+
+        if self.stderr:
+            sections.append(add_visual_margin(self.stderr, width, 'stderr'))
+        elif self.stderr is not None:
+            sections.append("stderr: N/A")
+
+        return os.linesep.join((
+            self.summary(),
+            textwrap.indent(os.linesep.join(sections), prefix=lmargin),
+        ))
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C374E3E02
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 13:02:19 +0100 (CET)
Received: from localhost ([::1]:44388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWdDO-0003UJ-DA
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 08:02:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWd8L-0002L8-Iv
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:57:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWd8J-0006Pd-6X
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:57:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647950222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yW+kN9HZV+ZAc9TUWVMRFN2Q1VjClQJEtA5UxYRl7H0=;
 b=F9TMSFAKpswqwl0YQyPRKy9Txsm/v3G7k9/VZMBN0CckrFIZXil6/bQVtqO2nb/4heoK+k
 CePz6U0cn0VrRqQ5Ri9DUIEm4wAPbj7d3tKkOLLh+brZ0cArFBK2jcTvCJ2G1ZhH5rrIs0
 M1Y7MrcKVQFfhS2LvBCHVYGKOI8RD1M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-_ADpLGY6PFKjTe5Zkde7yw-1; Tue, 22 Mar 2022 07:57:00 -0400
X-MC-Unique: _ADpLGY6PFKjTe5Zkde7yw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75811802E5B;
 Tue, 22 Mar 2022 11:57:00 +0000 (UTC)
Received: from localhost (unknown [10.39.194.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 302A42024CB6;
 Tue, 22 Mar 2022 11:57:00 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 07/25] python/utils: add VerboseProcessError
Date: Tue, 22 Mar 2022 12:56:29 +0100
Message-Id: <20220322115647.726044-8-hreitz@redhat.com>
In-Reply-To: <20220322115647.726044-1-hreitz@redhat.com>
References: <20220322115647.726044-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

This adds an Exception that extends the Python stdlib
subprocess.CalledProcessError.

The difference is that the str() method of this exception also adds the
stdout/stderr logs. In effect, if this exception goes unhandled, Python
will print the output in a visually distinct wrapper to the terminal so
that it's easy to spot in a sea of traceback information.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220321201618.903471-3-jsnow@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 python/qemu/utils/__init__.py | 39 +++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/python/qemu/utils/__init__.py b/python/qemu/utils/__init__.py
index b84c86d004..9fb273b13d 100644
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
@@ -121,3 +123,40 @@ def _wrap(line: str) -> str:
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
+        # Does self.stdout contain both stdout and stderr?
+        has_combined_output = self.stderr is None
+
+        name = 'output' if has_combined_output else 'stdout'
+        if self.stdout:
+            sections.append(add_visual_margin(self.stdout, width, name))
+        else:
+            sections.append(f"{name}: N/A")
+
+        if self.stderr:
+            sections.append(add_visual_margin(self.stderr, width, 'stderr'))
+        elif not has_combined_output:
+            sections.append("stderr: N/A")
+
+        return os.linesep.join((
+            self.summary(),
+            textwrap.indent(os.linesep.join(sections), prefix=lmargin),
+        ))
-- 
2.35.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21231421901
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 23:08:38 +0200 (CEST)
Received: from localhost ([::1]:34488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXVCO-0004QM-S4
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 17:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXV9U-0000At-OH
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:05:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXV9S-0007Xn-Mh
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:05:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633381534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m8CCof3xvdXh8fTaWrxwQRK+4yOvLtnzkx91JygqAU0=;
 b=WrqX3pRkSCEhA3FvoM3lPPuNTlFIcr6g2Lz3CdlGjNc/HicTGcg3pwiTAjCKrJ6DCMaNfT
 xQcHyVWH+Ue0TyxRafKOGNi3J+Y5n7ewWAwafBzttEF8COTFuB8QKUZ6DsDFCfRXVLR4+9
 adyBcKRVZ354/2z1rn6m5PZgkdDcP8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-Yia0LGDbMaefzyOzyxXF_g-1; Mon, 04 Oct 2021 17:05:31 -0400
X-MC-Unique: Yia0LGDbMaefzyOzyxXF_g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6D859126B;
 Mon,  4 Oct 2021 21:05:30 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD87719C59;
 Mon,  4 Oct 2021 21:05:29 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/13] iotests/297: refactor run_[mypy|pylint] as generic
 execution shim
Date: Mon,  4 Oct 2021 17:04:58 -0400
Message-Id: <20211004210503.1455391-9-jsnow@redhat.com>
In-Reply-To: <20211004210503.1455391-1-jsnow@redhat.com>
References: <20211004210503.1455391-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's virtually nothing special here anymore; we can combine these
into a single, rather generic function.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/297 | 46 +++++++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index 91029dbb34e..4c54dd39b46 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -61,29 +61,33 @@ def get_test_files() -> List[str]:
     return list(filter(is_python_file, check_tests))
 
 
-def run_pylint(
-    files: List[str],
-    env: Optional[Mapping[str, str]] = None,
-) -> None:
+def run_linter(
+        tool: str,
+        args: List[str],
+        env: Optional[Mapping[str, str]] = None,
+        suppress_output: bool = False,
+) -> int:
+    """
+    Run a python-based linting tool.
 
-    subprocess.run(('python3', '-m', 'pylint', *files),
-                   env=env, check=False)
+    If suppress_output is True, capture stdout/stderr of the child
+    process and only print that information back to stdout if the child
+    process's return code was non-zero.
+    """
+    p = subprocess.run(
+        ('python3', '-m', tool, *args),
+        env=env,
+        check=False,
+        stdout=subprocess.PIPE if suppress_output else None,
+        stderr=subprocess.STDOUT if suppress_output else None,
+        universal_newlines=True,
+    )
 
-
-def run_mypy(
-    files: List[str],
-    env: Optional[Mapping[str, str]] = None,
-) -> None:
-    p = subprocess.run((('python3', '-m', 'mypy', *files),
-                       env=env,
-                       check=False,
-                       stdout=subprocess.PIPE,
-                       stderr=subprocess.STDOUT,
-                       universal_newlines=True)
-
-    if p.returncode != 0:
+    if suppress_output and p.returncode != 0:
         print(p.stdout)
 
+    return p.returncode
+
 
 def main() -> None:
     for linter in ('pylint-3', 'mypy'):
@@ -100,11 +104,11 @@ def main() -> None:
 
     print('=== pylint ===')
     sys.stdout.flush()
-    run_pylint(files, env=env)
+    run_linter('pylint', files, env=env)
 
     print('=== mypy ===')
     sys.stdout.flush()
-    run_mypy(files, env=env)
+    run_linter('mypy', files, env=env, suppress_output=True)
 
 
 iotests.script_main(main)
-- 
2.31.1


